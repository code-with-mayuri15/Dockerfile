# Use an official Ruby runtime as a parent image
FROM ruby:3.1.2

# Set the working directory
WORKDIR /app

# Install the required Bundler version
RUN gem install bundler:2.3.6

# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the Rails application code into the container
COPY . .

# Expose port 3000 (if needed)
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
