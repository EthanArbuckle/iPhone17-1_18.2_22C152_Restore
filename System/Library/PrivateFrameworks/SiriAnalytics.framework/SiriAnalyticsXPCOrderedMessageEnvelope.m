@interface SiriAnalyticsXPCOrderedMessageEnvelope
+ (BOOL)supportsSecureCoding;
- (NSData)messageBody;
- (NSUUID)messageUUID;
- (NSUUID)streamUUID;
- (SiriAnalyticsXPCOrderedMessageEnvelope)initWithCoder:(id)a3;
- (SiriAnalyticsXPCOrderedMessageEnvelope)initWithTimestamp:(unint64_t)a3 streamUUID:(id)a4 messageType:(int64_t)a5 messageUUID:(id)a6 messageBody:(id)a7;
- (int64_t)messageType;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriAnalyticsXPCOrderedMessageEnvelope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_streamUUID, 0);
}

- (NSData)messageBody
{
  return self->_messageBody;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (SiriAnalyticsXPCOrderedMessageEnvelope)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriAnalyticsXPCOrderedMessageEnvelope;
  v5 = [(SiriAnalyticsXPCOrderedMessageEnvelope *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    v5->_timestamp = [v6 unsignedLongLongValue];

    uint64_t v7 = [v4 decodeObjectForKey:@"streamUUID"];
    streamUUID = v5->_streamUUID;
    v5->_streamUUID = (NSUUID *)v7;

    v5->_messageType = [v4 decodeIntegerForKey:@"messageType"];
    uint64_t v9 = [v4 decodeObjectForKey:@"messageUUID"];
    messageUUID = v5->_messageUUID;
    v5->_messageUUID = (NSUUID *)v9;

    uint64_t v11 = [v4 decodeObjectForKey:@"messageBody"];
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSData *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t timestamp = self->_timestamp;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedLongLong:timestamp];
  [v7 encodeObject:v6 forKey:@"timestamp"];

  [v7 encodeObject:self->_streamUUID forKey:@"streamUUID"];
  [v7 encodeInteger:self->_messageType forKey:@"messageType"];
  [v7 encodeObject:self->_messageUUID forKey:@"messageUUID"];
  [v7 encodeObject:self->_messageBody forKey:@"messageBody"];
}

- (SiriAnalyticsXPCOrderedMessageEnvelope)initWithTimestamp:(unint64_t)a3 streamUUID:(id)a4 messageType:(int64_t)a5 messageUUID:(id)a6 messageBody:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SiriAnalyticsXPCOrderedMessageEnvelope;
  v15 = [(SiriAnalyticsXPCOrderedMessageEnvelope *)&v24 init];
  v16 = v15;
  if (v15)
  {
    v15->_unint64_t timestamp = a3;
    uint64_t v17 = [v12 copy];
    streamUUID = v16->_streamUUID;
    v16->_streamUUID = (NSUUID *)v17;

    uint64_t v19 = [v13 copy];
    messageUUID = v16->_messageUUID;
    v16->_messageUUID = (NSUUID *)v19;

    v16->_messageType = a5;
    uint64_t v21 = [v14 copy];
    messageBody = v16->_messageBody;
    v16->_messageBody = (NSData *)v21;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end