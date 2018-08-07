# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/kms/v1/resources.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/protobuf/duration_pb'
require 'google/protobuf/timestamp_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.kms.v1.KeyRing" do
    optional :name, :string, 1
    optional :create_time, :message, 2, "google.protobuf.Timestamp"
  end
  add_message "google.cloud.kms.v1.CryptoKey" do
    optional :name, :string, 1
    optional :primary, :message, 2, "google.cloud.kms.v1.CryptoKeyVersion"
    optional :purpose, :enum, 3, "google.cloud.kms.v1.CryptoKey.CryptoKeyPurpose"
    optional :create_time, :message, 5, "google.protobuf.Timestamp"
    optional :next_rotation_time, :message, 7, "google.protobuf.Timestamp"
    map :labels, :string, :string, 10
    oneof :rotation_schedule do
      optional :rotation_period, :message, 8, "google.protobuf.Duration"
    end
  end
  add_enum "google.cloud.kms.v1.CryptoKey.CryptoKeyPurpose" do
    value :CRYPTO_KEY_PURPOSE_UNSPECIFIED, 0
    value :ENCRYPT_DECRYPT, 1
  end
  add_message "google.cloud.kms.v1.CryptoKeyVersion" do
    optional :name, :string, 1
    optional :state, :enum, 3, "google.cloud.kms.v1.CryptoKeyVersion.CryptoKeyVersionState"
    optional :create_time, :message, 4, "google.protobuf.Timestamp"
    optional :destroy_time, :message, 5, "google.protobuf.Timestamp"
    optional :destroy_event_time, :message, 6, "google.protobuf.Timestamp"
  end
  add_enum "google.cloud.kms.v1.CryptoKeyVersion.CryptoKeyVersionState" do
    value :CRYPTO_KEY_VERSION_STATE_UNSPECIFIED, 0
    value :ENABLED, 1
    value :DISABLED, 2
    value :DESTROYED, 3
    value :DESTROY_SCHEDULED, 4
  end
end

module Google
  module Cloud
    module Kms
      module V1
        KeyRing = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.kms.v1.KeyRing").msgclass
        CryptoKey = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.kms.v1.CryptoKey").msgclass
        CryptoKey::CryptoKeyPurpose = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.kms.v1.CryptoKey.CryptoKeyPurpose").enummodule
        CryptoKeyVersion = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.kms.v1.CryptoKeyVersion").msgclass
        CryptoKeyVersion::CryptoKeyVersionState = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.kms.v1.CryptoKeyVersion.CryptoKeyVersionState").enummodule
      end
    end
  end
end