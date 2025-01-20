@interface SiriAnalyticsXPCLargeMessageEnvelope
+ (BOOL)supportsSecureCoding;
- (NSData)serializedDataUploadMessage;
- (NSString)largeMessagePath;
- (NSUUID)requestIdentifier;
- (SiriAnalyticsXPCLargeMessageEnvelope)initWithCoder:(id)a3;
- (SiriAnalyticsXPCLargeMessageEnvelope)initWithLargeMessagePath:(id)a3 requestIdentifier:(id)a4 serializedDataUploadMessage:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriAnalyticsXPCLargeMessageEnvelope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedDataUploadMessage, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_largeMessagePath, 0);
}

- (NSData)serializedDataUploadMessage
{
  return self->_serializedDataUploadMessage;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)largeMessagePath
{
  return self->_largeMessagePath;
}

- (SiriAnalyticsXPCLargeMessageEnvelope)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SiriAnalyticsXPCLargeMessageEnvelope;
  v5 = [(SiriAnalyticsXPCLargeMessageEnvelope *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"largeMessagePath"];
    largeMessagePath = v5->_largeMessagePath;
    v5->_largeMessagePath = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedDataUploadMessage"];
    serializedDataUploadMessage = v5->_serializedDataUploadMessage;
    v5->_serializedDataUploadMessage = (NSData *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  largeMessagePath = self->_largeMessagePath;
  id v5 = a3;
  [v5 encodeObject:largeMessagePath forKey:@"largeMessagePath"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"requestIdentifier"];
  [v5 encodeObject:self->_serializedDataUploadMessage forKey:@"serializedDataUploadMessage"];
}

- (SiriAnalyticsXPCLargeMessageEnvelope)initWithLargeMessagePath:(id)a3 requestIdentifier:(id)a4 serializedDataUploadMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SiriAnalyticsXPCLargeMessageEnvelope;
  v11 = [(SiriAnalyticsXPCLargeMessageEnvelope *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    largeMessagePath = v11->_largeMessagePath;
    v11->_largeMessagePath = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    requestIdentifier = v11->_requestIdentifier;
    v11->_requestIdentifier = (NSUUID *)v14;

    uint64_t v16 = [v10 copy];
    serializedDataUploadMessage = v11->_serializedDataUploadMessage;
    v11->_serializedDataUploadMessage = (NSData *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end