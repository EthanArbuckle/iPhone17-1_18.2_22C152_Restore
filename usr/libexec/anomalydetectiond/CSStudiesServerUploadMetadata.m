@interface CSStudiesServerUploadMetadata
+ (BOOL)supportsSecureCoding;
- (CSStudiesServerUploadMetadata)initWithCoder:(id)a3;
- (CSStudiesServerUploadMetadata)initWithPayloadType:(id)a3 channel:(id)a4 keyValuePairs:(id)a5;
- (NSDictionary)keyValuePairs;
- (NSString)channel;
- (NSString)payloadType;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyValuePairs:(id)a3;
@end

@implementation CSStudiesServerUploadMetadata

- (CSStudiesServerUploadMetadata)initWithPayloadType:(id)a3 channel:(id)a4 keyValuePairs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSStudiesServerUploadMetadata;
  v12 = [(CSStudiesServerUploadMetadata *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_payloadType, a3);
    objc_storeStrong((id *)&v13->_channel, a4);
    objc_storeStrong((id *)&v13->_keyValuePairs, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(CSStudiesServerUploadMetadata *)self payloadType];
  [v7 encodeObject:v4 forKey:@"kCSStudiesServerUploadMetadataPayloadTypeEncoderKey"];

  v5 = [(CSStudiesServerUploadMetadata *)self channel];
  [v7 encodeObject:v5 forKey:@"kCSStudiesServerUploadMetadataChannelEncoderKey"];

  v6 = [(CSStudiesServerUploadMetadata *)self keyValuePairs];
  [v7 encodeObject:v6 forKey:@"kCSStudiesServerUploadMetadataKetValyePairsEncoderKey"];
}

- (CSStudiesServerUploadMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCSStudiesServerUploadMetadataPayloadTypeEncoderKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCSStudiesServerUploadMetadataChannelEncoderKey"];
  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCSStudiesServerUploadMetadataKetValyePairsEncoderKey"];
  id v10 = [(CSStudiesServerUploadMetadata *)self initWithPayloadType:v5 channel:v6 keyValuePairs:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (NSString)channel
{
  return self->_channel;
}

- (NSDictionary)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end