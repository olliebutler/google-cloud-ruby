# Google Cloud Ruby Client

Idiomatic Ruby client for [Google Cloud Platform](https://cloud.google.com/)
services.

[![CircleCI Build Status](https://circleci.com/gh/googleapis/google-cloud-ruby.svg?&style=shield)](https://circleci.com/gh/googleapis/google-cloud-ruby)
[![Coverage Status](https://codecov.io/gh/googleapis/google-cloud-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/googleapis/google-cloud-ruby)
[![Gem Version](https://badge.fury.io/rb/google-cloud.svg)](http://badge.fury.io/rb/google-cloud)

* [Homepage](https://googleapis.github.io/google-cloud-ruby/)
* [API documentation](https://googleapis.github.io/google-cloud-ruby/docs)
* [google-cloud on RubyGems](https://rubygems.org/gems/google-cloud)

This client supports the following Google Cloud Platform services at a [General
Availability (GA)](#versioning) quality level:

* [BigQuery](#bigquery-ga) (GA)
* [Cloud Datastore](#cloud-datastore-ga) (GA)
* [Stackdriver Logging](#stackdriver-logging-ga) (GA)
* [Cloud Spanner API](#cloud-spanner-api-ga) (GA)
* [Cloud Storage](#cloud-storage-ga) (GA)
* [Cloud Translation API](#cloud-translation-api-ga) (GA)
* [Cloud Video Intelligence API](#cloud-video-intelligence-api-ga) (GA)

This client supports the following Google Cloud Platform services at a
[Beta](#versioning) quality level:

* [Cloud Asset](#cloud-asset-beta) (Beta)
* [BigQuery Data Transfer](#bigquery-data-transfer-api-beta) (Beta)
* [Stackdriver Debugger](#stackdriver-debugger-beta) (Beta)
* [Stackdriver Error Reporting](#stackdriver-error-reporting-beta) (Beta)
* [Cloud Firestore](#cloud-firestore-beta) (Beta)
* [Cloud Pub/Sub](#cloud-pubsub-beta) (Beta)
* [Stackdriver Monitoring API](#stackdriver-monitoring-api-beta) (Beta)
* [Stackdriver Trace](#stackdriver-trace-beta) (Beta)

This client supports the following Google Cloud Platform services at an
[Alpha](#versioning) quality level:

* [Cloud Bigtable](#cloud-bigtable-alpha) (Alpha)
* [Container Engine](#container-engine-alpha) (Alpha)
* [Cloud Dataproc](#cloud-dataproc-alpha) (Alpha)
* [Data Loss Prevention](#data-loss-prevention-alpha) (Alpha)
* [Dialogflow API](#dialogflow-api-alpha) (Alpha)
* [Cloud DNS](#cloud-dns-alpha) (Alpha)
* [Cloud KMS](#cloud-kms-alpha) (Alpha)
* [Cloud Natural Language API](#cloud-natural-language-api-alpha) (Alpha)
* [Cloud OS Login](#cloud-os-login-alpha) (Alpha)
* [Cloud Redis](#cloud-redis-api-alpha) (Alpha)
* [Cloud Resource Manager](#cloud-resource-manager-alpha) (Alpha)
* [Cloud Scheduler](#cloud-scheduler-alpha) (Alpha)
* [Cloud Speech API](#cloud-speech-api-alpha) (Alpha)
* [Cloud Tasks API](#cloud-tasks-api-alpha) (Alpha)
* [Cloud Text-To-Speech API](#cloud-text-to-speech-api-alpha) (Alpha)
* [Cloud Vision API](#cloud-vision-api-alpha) (Alpha)

The support for each service is distributed as a separate gem. However, for your
convenience, the `google-cloud` gem lets you install the entire collection.

If you need support for other Google APIs, check out the [Google API Ruby Client
library](https://github.com/google/google-api-ruby-client).

## Quick Start

```sh
$ gem install google-cloud
```

The `google-cloud` gem shown above provides all of the individual service gems
in the google-cloud-ruby project, making it easy to explore Google Cloud
Platform. To avoid unnecessary dependencies, you can also install the service
gems independently.

### Authentication

In general, the google-cloud-ruby library uses [Service
Account](https://cloud.google.com/iam/docs/creating-managing-service-accounts)
credentials to connect to Google Cloud services. When running on Compute Engine
the credentials will be discovered automatically. When running on other
environments, the Service Account credentials can be specified by providing the
path to the [JSON
keyfile](https://cloud.google.com/iam/docs/managing-service-account-keys) for
the account (or the JSON itself) in environment variables. Additionally, Cloud
SDK credentials can also be discovered automatically, but this is only
recommended during development.

General instructions, environment variables, and configuration options are
covered in the general [Authentication
guide](https://googleapis.github.io/google-cloud-ruby/docs/authentication)
for the `google-cloud` umbrella package. Specific instructions and environment
variables for each individual service are linked from the README documents
listed below for each service.

The preview examples below demonstrate how to provide the **Project ID** and
**Credentials JSON file path** directly in code.

### Cloud Asset API (Beta)

- [google-cloud-asset README](google-cloud-asset/README.md)
- [google-cloud-asset API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-asset/latest)
- [google-cloud-asset on RubyGems](https://rubygems.org/gems/google-cloud-asset/)

#### Quick Start

```sh
$ gem install google-cloud-asset
```

### BigQuery (GA)

- [google-cloud-bigquery README](google-cloud-bigquery/README.md)
- [google-cloud-bigquery API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-bigquery/latest)
- [google-cloud-bigquery on RubyGems](https://rubygems.org/gems/google-cloud-bigquery)
- [Google BigQuery documentation](https://cloud.google.com/bigquery/docs)

#### Quick Start

```sh
$ gem install google-cloud-bigquery
```

#### Preview

```ruby
require "google/cloud/bigquery"

bigquery = Google::Cloud::Bigquery.new
dataset = bigquery.create_dataset "my_dataset"

table = dataset.create_table "my_table" do |t|
  t.name = "My Table"
  t.description = "A description of my table."
  t.schema do |s|
    s.string "first_name", mode: :required
    s.string "last_name", mode: :required
    s.integer "age", mode: :required
  end
end

# Load data into the table from Google Cloud Storage
table.load "gs://my-bucket/file-name.csv"

# Run a query
data = dataset.query "SELECT first_name FROM my_table"

data.each do |row|
  puts row[:first_name]
end
```

### BigQuery Data Transfer API (Beta)

- [google-bigquery-data_transfer README](google-cloud-bigquery-data_transfer/README.md)
- [google-bigquery-data_transfer API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-bigquery-data_transfer/latest)
- [google-bigquery-data_transfer on RubyGems](https://rubygems.org/gems/google-cloud-bigquery-data_transfer/)
- [Google BigQuery Data Transfer documentation](https://cloud.google.com/bigquery/transfer/)

#### Quick Start

```sh
$ gem install google-cloud-bigquery-data_transfer
```

#### Preview

```rb
require "google/cloud/bigquery/data_transfer"

data_transfer_service_client = Google::Cloud::Bigquery::DataTransfer.new
formatted_parent = Google::Cloud::Bigquery::DataTransfer::V1::DataTransferServiceClient.project_path(project_id)

# Iterate over all results.
data_transfer_service_client.list_data_sources(formatted_parent).each do |element|
  # Process element.
end

# Or iterate over results one page at a time.
data_transfer_service_client.list_data_sources(formatted_parent).each_page do |page|
  # Process each page at a time.
  page.each do |element|
    # Process element.
  end
end
```

### Cloud Bigtable (Alpha)

- [google-cloud-bigtable README](google-cloud-bigtable/README.md)
- [google-cloud-bigtable API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-bigtable/latest)
- [google-cloud-bigtable on RubyGems](https://rubygems.org/gems/google-cloud-bigtable)
- [Cloud Bigtable documentation](https://cloud.google.com/bigtable/docs)

#### Quick Start

```sh
$ gem install google-cloud-bigtable
```

#### Preview

```ruby
require "google/cloud/bigtable"

bigtable = Google::Cloud::Bigtable.new

table = bigtable.table("my-instance", "my-table")

entry = table.new_mutation_entry("user-1")
entry.set_cell(
  "cf-1",
  "field-1",
  "XYZ"
  timestamp: Time.now.to_i * 1000 # Time stamp in milli seconds.
).delete_from_column("cf2", "field02")

table.mutate_row(entry)
```

### Cloud Datastore (GA)

- [google-cloud-datastore README](google-cloud-datastore/README.md)
- [google-cloud-datastore API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-datastore/latest)
- [google-cloud-datastore on RubyGems](https://rubygems.org/gems/google-cloud-datastore)
- [Google Cloud Datastore documentation](https://cloud.google.com/datastore/docs)

*Follow the [activation instructions](https://cloud.google.com/datastore/docs/activate) to use the Google Cloud Datastore API with your project.*

#### Quick Start

```sh
$ gem install google-cloud-datastore
```

#### Preview

```ruby
require "google/cloud/datastore"

datastore = Google::Cloud::Datastore.new(
  project_id: "my-todo-project",
  credentials: "/path/to/keyfile.json"
)

# Create a new task to demo datastore
task = datastore.entity "Task", "sampleTask" do |t|
  t["type"] = "Personal"
  t["done"] = false
  t["priority"] = 4
  t["description"] = "Learn Cloud Datastore"
end

# Save the new task
datastore.save task

# Run a query for all completed tasks
query = datastore.query("Task").
  where("done", "=", false)
tasks = datastore.run query
```

### Stackdriver Debugger (Beta)

- [google-cloud-debugger README](google-cloud-debugger/README.md)
- [google-cloud-debugger instrumentation documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-debugger/latest/file.INSTRUMENTATION)
- [google-cloud-debugger on RubyGems](https://rubygems.org/gems/google-cloud-debugger)
- [Stackdriver Debugger documentation](https://cloud.google.com/debugger/docs)

#### Quick Start

```
$ gem install google-cloud-debugger
```

#### Preview

```ruby
require "google/cloud/debugger"

debugger = Google::Cloud::Debugger.new
debugger.start
```

### Cloud DNS (Alpha)

- [google-cloud-dns README](google-cloud-dns/README.md)
- [google-cloud-dns API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-dns/latest)
- [google-cloud-dns on RubyGems](https://rubygems.org/gems/google-cloud-dns)
- [Google Cloud DNS documentation](https://cloud.google.com/dns/docs)

#### Quick Start

```sh
$ gem install google-cloud-dns
```

#### Preview

```ruby
require "google/cloud/dns"

dns = Google::Cloud::Dns.new

# Retrieve a zone
zone = dns.zone "example-com"

# Update records in the zone
change = zone.update do |tx|
  tx.add     "www", "A",  86400, "1.2.3.4"
  tx.remove  "example.com.", "TXT"
  tx.replace "example.com.", "MX", 86400, ["10 mail1.example.com.",
                                           "20 mail2.example.com."]
  tx.modify "www.example.com.", "CNAME" do |r|
    r.ttl = 86400 # only change the TTL
  end
end

```

### Container Engine (Alpha)

- [google-cloud-container README](google-cloud-container/README.md)
- [google-cloud-container API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-container/latest)
- [google-cloud-container on RubyGems](https://rubygems.org/gems/google-cloud-container)
- [Container Engine documentation](https://cloud.google.com/kubernetes-engine/docs/)

#### Quick Start

```sh
$ gem install google-cloud-container
```

#### Preview

```ruby
require "google/cloud/container"

cluster_manager_client = Google::Cloud::Container.new
project_id_2 = project_id
zone = "us-central1-a"
response = cluster_manager_client.list_clusters(project_id_2, zone)
```

### Cloud Dataproc (Alpha)

- [google-cloud-dataproc README](google-cloud-dataproc/README.md)
- [google-cloud-dataproc API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-dataproc/latest)
- [google-cloud-dataproc on RubyGems](https://rubygems.org/gems/google-cloud-dataproc)
- [Google Cloud Dataproc documentation](https://cloud.google.com/dataproc/docs)

#### Quick Start

```sh
$ gem install google-cloud-dataproc
```

#### Preview

```ruby
require "google/cloud/dataproc"

cluster_controller_client = Google::Cloud::Dataproc::ClusterController.new
project_id_2 = project_id
region = "global"

# Iterate over all results.
cluster_controller_client.list_clusters(project_id_2, region).each do |element|
  # Process element.
end

# Or iterate over results one page at a time.
cluster_controller_client.list_clusters(project_id_2, region).each_page do |page|
  # Process each page at a time.
  page.each do |element|
    # Process element.
  end
end
```

### Data Loss Prevention (Alpha)

- [google-cloud-dlp README](google-cloud-dlp/README.md)
- [google-cloud-dlp API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-dlp/latest)
- [google-cloud-dlp on RubyGems](https://rubygems.org/gems/google-cloud-dlp)
- [Data Loss Prevention documentation](https://cloud.google.com/dlp/docs)

#### Quick Start

```sh
$ gem install google-cloud-dlp
```

#### Preview

```ruby
require "google/cloud/dlp"

dlp_service_client = Google::Cloud::Dlp.new
min_likelihood = :POSSIBLE
inspect_config = { min_likelihood: min_likelihood }
type = "text/plain"
value = "my phone number is 215-512-1212"
items_element = { type: type, value: value }
items = [items_element]
response = dlp_service_client.inspect_content(inspect_config, items)
```

### Dialogflow API (Alpha)

- [google-cloud-dialogflow README](google-cloud-dialogflow/README.md)
- [google-cloud-dialogflow API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-dialogflow/latest)
- [google-cloud-dialogflow on RubyGems](https://rubygems.org/gems/google-cloud-dialogflow)
- [Dialogflow API documentation](https://cloud.google.com/dialogflow-enterprise/docs/)

#### Quick Start

```sh
$ gem install google-cloud-dialogflow
```

### Stackdriver Error Reporting (Beta)

- [google-cloud-error_reporting README](google-cloud-error_reporting/README.md)
- [google-cloud-error_reporting instrumentation documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-error_reporting/latest/file.INSTRUMENTATION)
- [google-cloud-error_reporting on RubyGems](https://rubygems.org/gems/google-cloud-error_reporting)
- [Stackdriver Error Reporting documentation](https://cloud.google.com/error-reporting/docs)

#### Quick Start

```sh
$ gem install google-cloud-error_reporting
```

#### Preview

```ruby
require "google/cloud/error_reporting"

# Report an exception
begin
  fail "Boom!"
rescue => exception
  Google::Cloud::ErrorReporting.report exception
end
```

### Cloud Firestore (Beta)

- [google-cloud-firestore README](google-cloud-firestore/README.md)
- [google-cloud-firestore API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-firestore/latest)
- [google-cloud-firestore on RubyGems](https://rubygems.org/gems/google-cloud-firestore)
- [Google Cloud Firestore documentation](https://cloud.google.com/firestore/docs)

#### Quick Start

```sh
$ gem install google-cloud-firestore
```

#### Preview

```ruby
require "google/cloud/firestore"

firestore = Google::Cloud::Firestore.new(
  project_id: "my-project",
  credentials: "/path/to/keyfile.json"
)

city = firestore.col("cities").doc("SF")
city.set({ name: "San Francisco",
           state: "CA",
           country: "USA",
           capital: false,
           population: 860000 })

firestore.transaction do |tx|
  new_population = tx.get(city).data[:population] + 1
  tx.update(city, { population: new_population })
end
```

### Stackdriver Logging (GA)

- [google-cloud-logging README](google-cloud-logging/README.md)
- [google-cloud-logging API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-logging/latest)
- [google-cloud-logging on RubyGems](https://rubygems.org/gems/google-cloud-logging)
- [Stackdriver Logging documentation](https://cloud.google.com/logging/docs/)

#### Quick Start

```sh
$ gem install google-cloud-logging
```

#### Preview

```ruby
require "google/cloud/logging"

logging = Google::Cloud::Logging.new

# List all log entries
logging.entries.each do |e|
  puts "[#{e.timestamp}] #{e.log_name} #{e.payload.inspect}"
end

# List only entries from a single log
entries = logging.entries filter: "log:syslog"

# Write a log entry
entry = logging.entry
entry.payload = "Job started."
entry.log_name = "my_app_log"
entry.resource.type = "gae_app"
entry.resource.labels[:module_id] = "1"
entry.resource.labels[:version_id] = "20150925t173233"

logging.write_entries entry
```

### Cloud Natural Language API (Alpha)

- [google-cloud-language README](google-cloud-language/README.md)
- [google-cloud-language API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-language/latest)
- [google-cloud-language on RubyGems](https://rubygems.org/gems/google-cloud-language)
- [Google Cloud Natural Language API documentation](https://cloud.google.com/natural-language/docs)

#### Quick Start

```sh
$ gem install google-cloud-language
```

#### Preview

```ruby
require "google/cloud/language"

language = Google::Cloud::Language.new(
  project_id: "my-todo-project",
  credentials: "/path/to/keyfile.json"
)

content = "Star Wars is a great movie. The Death Star is fearsome."
document = language.document content
annotation = document.annotate

annotation.entities.count #=> 3
annotation.sentiment.score #=> 0.10000000149011612
annotation.sentiment.magnitude #=> 1.100000023841858
annotation.sentences.count #=> 2
annotation.tokens.count #=> 13
```

### Cloud OS Login (Alpha)

- [google-cloud-os_login README](google-cloud-os_login/README.md)
- [google-cloud-os_login API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-os_login/latest)
- [google-cloud-os_login on RubyGems](https://rubygems.org/gems/google-cloud-os_login)
- [Google Cloud DNS documentation](https://cloud.google.com/compute/docs/oslogin/rest/)

#### Quick Start

```sh
$ gem install google-cloud-os_login
```

### Cloud Pub/Sub (Beta)

- [google-cloud-pubsub README](google-cloud-pubsub/README.md)
- [google-cloud-pubsub API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-pubsub/latest)
- [google-cloud-pubsub on RubyGems](https://rubygems.org/gems/google-cloud-pubsub)
- [Google Cloud Pub/Sub documentation](https://cloud.google.com/pubsub/docs)

#### Quick Start

```sh
$ gem install google-cloud-pubsub
```

#### Preview

```ruby
require "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new(
  project_id: "my-todo-project",
  credentials: "/path/to/keyfile.json"
)

# Retrieve a topic
topic = pubsub.topic "my-topic"

# Publish a new message
msg = topic.publish "new-message"

# Retrieve a subscription
sub = pubsub.subscription "my-topic-sub"

# Create a subscriber to listen for available messages
subscriber = sub.listen do |received_message|
  # process message
  received_message.acknowledge!
end

# Start background threads that will call the block passed to listen.
subscriber.start

# Shut down the subscriber when ready to stop receiving messages.
subscriber.stop.wait!
```
### Cloud Redis API (Alpha)

- [google-cloud-redis README](google-cloud-redis/README.md)
- [google-cloud-redis API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-redis/latest)
- [google-cloud-redis on RubyGems](https://rubygems.org/gems/google-cloud-redis)
- [Cloud Redis API documentation](https://cloud.google.com/memorystore/docs/redis/)

#### Quick Start

```sh
$ gem install google-cloud-redis
```


### Cloud Resource Manager (Alpha)

- [google-cloud-resource_manager README](google-cloud-resource_manager/README.md)
- [google-cloud-resource_manager API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-resource_manager/latest)
- [google-cloud-resource_manager on RubyGems](https://rubygems.org/gems/google-cloud-resource_manager)
- [Google Cloud Resource Manager documentation](https://cloud.google.com/resource-manager/)

#### Quick Start

```sh
$ gem install google-cloud-resource_manager
```

#### Preview

```ruby
require "google/cloud/resource_manager"

resource_manager = Google::Cloud::ResourceManager.new

# List all projects
resource_manager.projects.each do |project|
  puts projects.project_id
end

# Label a project as production
project = resource_manager.project "tokyo-rain-123"
project.update do |p|
  p.labels["env"] = "production"
end

# List only projects with the "production" label
projects = resource_manager.projects filter: "labels.env:production"
```

### Stackdriver Trace (Beta)

- [google-cloud-trace README](google-cloud-trace/README.md)
- [google-cloud-trace instrumentation documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-trace/latest/file.INSTRUMENTATION)
- [google-cloud-trace on RubyGems](https://rubygems.org/gems/google-cloud-trace)
- [Stackdriver Trace documentation](https://cloud.google.com/trace/docs/)

#### Quick Start

```sh
$ gem install google-cloud-trace
```

#### Preview

```ruby
require "google/cloud/trace"

trace = Google::Cloud::Trace.new

result_set = trace.list_traces Time.now - 3600, Time.now
result_set.each do |trace_record|
  puts "Retrieved trace ID: #{trace_record.trace_id}"
end
```

### Cloud Spanner API (GA)

- [google-cloud-spanner README](google-cloud-spanner/README.md)
- [google-cloud-spanner API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-spanner/latest)
- [google-cloud-spanner on RubyGems](https://rubygems.org/gems/google-cloud-spanner)
- [Google Cloud Speech API documentation](https://cloud.google.com/spanner/docs)

#### Quick Start

```sh
$ gem install google-cloud-spanner
```

#### Preview

```ruby
require "google/cloud/spanner"

spanner = Google::Cloud::Spanner.new

db = spanner.client "my-instance", "my-database"

db.transaction do |tx|
  results = tx.execute "SELECT * FROM users"

  results.rows.each do |row|
    puts "User #{row[:id]} is #{row[:name]}"
  end
end
```

### Cloud Speech API (Alpha)

- [google-cloud-speech README](google-cloud-speech/README.md)
- [google-cloud-speech API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-speech/latest)
- [google-cloud-speech on RubyGems](https://rubygems.org/gems/google-cloud-speech)
- [Google Cloud Speech API documentation](https://cloud.google.com/speech/docs)

#### Quick Start

```sh
$ gem install google-cloud-speech
```

#### Preview

```ruby
require "google/cloud/speech"

speech = Google::Cloud::Speech.new

audio = speech.audio "path/to/audio.raw",
                     encoding: :raw, sample_rate: 16000
results = audio.recognize

result = results.first
result.transcript #=> "how old is the Brooklyn Bridge"
result.confidence #=> 0.9826789498329163
```

### Cloud Scheduler (Alpha)

- [Client Library Documentation][]
- [Product Documentation][]

## Quick Start
In order to use this library, you first need to go through the following
steps:

1. [Select or create a Cloud Platform project.](https://console.cloud.google.com/project)
2. [Enable billing for your project.](https://cloud.google.com/billing/docs/how-to/modify-project#enable_billing_for_a_project)
3. [Enable the Cloud Scheduler API.](https://console.cloud.google.com/apis/library/cloudscheduler.googleapis.com)
4. [Setup Authentication.](https://googleapis.github.io/google-cloud-ruby/#/docs/google-cloud/master/guides/authentication)

### Installation
```
$ gem install google-cloud-scheduler
```

### Next Steps
- Read the [Client Library Documentation][] for Cloud Scheduler API
  to see other available methods on the client.
- Read the [Cloud Scheduler API Product documentation][Product Documentation]
  to learn more about the product and see How-to Guides.
- View this [repository's main README](https://github.com/googleapis/google-cloud-ruby/blob/master/README.md)
  to see the full list of Cloud APIs that we cover.

[Client Library Documentation]: https://googleapis.github.io/google-cloud-ruby/#/docs/google-cloud-scheduler/latest/google/cloud/scheduler/v1beta1
[Product Documentation]: https://cloud.google.com/cloudscheduler

## Enabling Logging

To enable logging for this library, set the logger for the underlying [gRPC](https://github.com/grpc/grpc/tree/master/src/ruby) library.
The logger that you set may be a Ruby stdlib [`Logger`](https://ruby-doc.org/stdlib-2.5.0/libdoc/logger/rdoc/Logger.html) as shown below,
or a [`Google::Cloud::Logging::Logger`](https://googleapis.github.io/google-cloud-ruby/#/docs/google-cloud-logging/latest/google/cloud/logging/logger)
that will write logs to [Stackdriver Logging](https://cloud.google.com/logging/). See [grpc/logconfig.rb](https://github.com/grpc/grpc/blob/master/src/ruby/lib/grpc/logconfig.rb)
and the gRPC [spec_helper.rb](https://github.com/grpc/grpc/blob/master/src/ruby/spec/spec_helper.rb) for additional information.

Configuring a Ruby stdlib logger:

```ruby
require "logger"

module MyLogger
  LOGGER = Logger.new $stderr, level: Logger::WARN
  def logger
    LOGGER
  end
end

# Define a gRPC module-level logger method before grpc/logconfig.rb loads.
module GRPC
  extend MyLogger
end
```

### Cloud Storage (GA)

- [google-cloud-storage README](google-cloud-storage/README.md)
- [google-cloud-storage API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-storage/latest)
- [google-cloud-storage on RubyGems](https://rubygems.org/gems/google-cloud-storage)
- [Google Cloud Storage documentation](https://cloud.google.com/storage/docs)

#### Quick Start

```sh
$ gem install google-cloud-storage
```

#### Preview

```ruby
require "google/cloud/storage"

storage = Google::Cloud::Storage.new(
  project_id: "my-todo-project",
  credentials: "/path/to/keyfile.json"
)

bucket = storage.bucket "task-attachments"

file = bucket.file "path/to/my-file.ext"

# Download the file to the local file system
file.download "/tasks/attachments/#{file.name}"

# Copy the file to a backup bucket
backup = storage.bucket "task-attachment-backups"
file.copy backup, file.name
```

### Cloud Tasks API (Alpha)

- [google-cloud-tasks README](google-cloud-tasks/README.md)
- [google-cloud-tasks API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-tasks/latest)
- [google-cloud-tasks on RubyGems](https://rubygems.org/gems/google-cloud-tasks/)

#### Quick Start

```sh
$ gem install google-cloud-tasks
```

#### Preview

```rb
 require "google/cloud/tasks/v2beta2"

 cloud_tasks_client = Google::Cloud::Tasks::V2beta2.new
 formatted_parent = Google::Cloud::Tasks::V2beta2::CloudTasksClient.location_path("[PROJECT]", "[LOCATION]")

 # Iterate over all results.
 cloud_tasks_client.list_queues(formatted_parent).each do |element|
   # Process element.
 end

 # Or iterate over results one page at a time.
 cloud_tasks_client.list_queues(formatted_parent).each_page do |page|
   # Process each page at a time.
   page.each do |element|
     # Process element.
   end
 end
```

### Cloud Text To Speech API (Alpha)

#### Quick Start

```sh
$ gem install google-cloud-text_to_speech
```

#### Preview

```rb
require "google/cloud/text_to_speech/v1"

text_to_speech_client = Google::Cloud::TextToSpeech::V1.new

input = {text: "Hello, world!"}
voice = {language_code: "en-US"}
audio_config = {audio_encoding: Google::Cloud::Texttospeech::V1::AudioEncoding::MP3}
response = text_to_speech_client.synthesize_speech input, voice, audio_config
File.open "hello.mp3", "w" do |file|
  file.write response.audio_content
end
```

### Cloud Translation API (GA)

- [google-cloud-translate README](google-cloud-translate/README.md)
- [google-cloud-translate API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-translate/latest)
- [google-cloud-translate on RubyGems](https://rubygems.org/gems/google-cloud-translate)
- [Google Cloud Translation API documentation](https://cloud.google.com/translation/docs)

#### Quick Start

```sh
$ gem install google-cloud-translate
```

#### Preview

```ruby
require "google/cloud/translate"

translate = Google::Cloud::Translate.new

translation = translate.translate "Hello world!", to: "la"

puts translation #=> Salve mundi!

translation.from #=> "en"
translation.origin #=> "Hello world!"
translation.to #=> "la"
translation.text #=> "Salve mundi!"
```

### Cloud Vision API (Alpha)

- [google-cloud-vision README](google-cloud-vision/README.md)
- [google-cloud-vision API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-vision/latest)
- [google-cloud-vision on RubyGems](https://rubygems.org/gems/google-cloud-vision)
- [Google Cloud Vision API documentation](https://cloud.google.com/vision/docs)

#### Quick Start

```sh
$ gem install google-cloud-vision
```

#### Preview

```ruby
require "google/cloud/vision"

image_annotator_client = Google::Cloud::Vision::ImageAnnotator.new
gcs_image_uri = "gs://gapic-toolkit/President_Barack_Obama.jpg"
source = { gcs_image_uri: gcs_image_uri }
image = { source: source }
type = :FACE_DETECTION
features_element = { type: type }
features = [features_element]
requests_element = { image: image, features: features }
requests = [requests_element]
response = image_annotator_client.batch_annotate_images(requests)
```

### Stackdriver Monitoring API (Beta)

- [google-cloud-monitoring README](google-cloud-monitoring/README.md)
- [google-cloud-monitoring API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-monitoring/latest)
- [google-cloud-monitoring on RubyGems](https://rubygems.org/gems/google-cloud-monitoring)
- [Google Cloud Monitoring API documentation](https://cloud.google.com/monitoring/docs)

#### Quick Start

```sh
$ gem install google-cloud-monitoring
```

#### Preview
```rb
 require "google/cloud/monitoring/v3"

 MetricServiceClient = Google::Cloud::Monitoring::V3::MetricServiceClient

 metric_service_client = MetricServiceClient.new
 formatted_name = MetricServiceClient.project_path(project_id)

 # Iterate over all results.
 metric_service_client.list_monitored_resource_descriptors(formatted_name).each do |element|
   # Process element.
 end

 # Or iterate over results one page at a time.
 metric_service_client.list_monitored_resource_descriptors(formatted_name).each_page do |page|
   # Process each page at a time.
   page.each do |element|
     # Process element.
   end
 end
```

### Cloud Video Intelligence API (GA)

- [google-cloud-video_intelligence README](google-cloud-video_intelligence/README.md)
- [google-cloud-video_intelligence API documentation](https://googleapis.github.io/google-cloud-ruby/docs/google-cloud-video_intelligence/latest)
- [google-cloud-video_intelligence on RubyGems](https://rubygems.org/gems/google-cloud-video_intelligence)
- [Google Cloud Video Intelligence API documentation](https://cloud.google.com/video-intelligence/docs)

#### Quick Start

```sh
$ gem install google-cloud-video_intelligence
```

#### Preview

```rb
 require "google/cloud/video_intelligence/v1beta2"

 video_intelligence_service_client = Google::Cloud::VideoIntelligence.new
 input_uri = "gs://cloud-ml-sandbox/video/chicago.mp4"
 features_element = :LABEL_DETECTION
 features = [features_element]

 # Register a callback during the method call.
 operation = video_intelligence_service_client.annotate_video(input_uri: input_uri, features: features) do |op|
   raise op.results.message if op.error?
   op_results = op.results
   # Process the results.

   metadata = op.metadata
   # Process the metadata.
 end

 # Or use the return value to register a callback.
 operation.on_done do |op|
   raise op.results.message if op.error?
   op_results = op.results
   # Process the results.

   metadata = op.metadata
   # Process the metadata.
 end

 # Manually reload the operation.
 operation.reload!

 # Or block until the operation completes, triggering callbacks on
 # completion.
 operation.wait_until_done!
```


## Supported Ruby Versions

These libraries are currently supported on Ruby 2.3+.

Google provides official support for Ruby versions that are actively supported
by Ruby Core—that is, Ruby versions that are either in normal maintenance or
in security maintenance, and not end of life. Currently, this means Ruby 2.3
and later. Older versions of Ruby _may_ still work, but are unsupported and not
recommended. See https://www.ruby-lang.org/en/downloads/branches/ for details
about the Ruby support schedule.

## Versioning

This library follows [Semantic Versioning](http://semver.org/).

Please note it is currently under active development. Any release versioned 0.x.y is subject to backwards incompatible changes at any time.

**GA**: Libraries defined at the GA (general availability) quality level are stable. The code surface will not change in backwards-incompatible ways unless absolutely necessary (e.g. because of critical security issues) or with an extensive deprecation period. Issues and requests against GA libraries are addressed with the highest priority.

Please note that the auto-generated portions of the GA libraries (the ones in modules such as `v1` or `v2`) are considered to be of **Beta** quality, even if the libraries that wrap them are GA.

**Beta**: Libraries defined at a Beta quality level are expected to be mostly stable and we're working towards their release candidate. We will address issues and requests with a higher priority.

**Alpha**: Libraries defined at an Alpha quality level are still a work-in-progress and are more likely to get backwards-incompatible updates.

## Contributing

Contributions to this library are always welcome and highly encouraged.

See [CONTRIBUTING](CONTRIBUTING.md) for more information on how to get started.

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms. See [Code of Conduct](CODE_OF_CONDUCT.md) for more information.

## License

This library is licensed under Apache 2.0. Full license text is
available in [LICENSE](LICENSE).

## Support

Please [report bugs at the project on Github](https://github.com/googleapis/google-cloud-ruby/issues).
Don't hesitate to [ask questions](http://stackoverflow.com/questions/tagged/google-cloud-platform+ruby) about the client or APIs on [StackOverflow](http://stackoverflow.com).
