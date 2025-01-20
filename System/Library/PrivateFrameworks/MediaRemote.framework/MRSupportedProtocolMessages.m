@interface MRSupportedProtocolMessages
+ (BOOL)supportsSecureCoding;
- (BOOL)isSupported:(unint64_t)a3;
- (MRSupportedProtocolMessages)initWithAllSupportedMessages;
- (MRSupportedProtocolMessages)initWithCoder:(id)a3;
- (MRSupportedProtocolMessages)initWithLastSupportedMessageType:(unint64_t)a3;
- (unint64_t)lastSupportedMessageType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRSupportedProtocolMessages

- (MRSupportedProtocolMessages)initWithAllSupportedMessages
{
  return [(MRSupportedProtocolMessages *)self initWithLastSupportedMessageType:137];
}

- (MRSupportedProtocolMessages)initWithLastSupportedMessageType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRSupportedProtocolMessages;
  result = [(MRSupportedProtocolMessages *)&v5 init];
  if (result) {
    result->_lastSupportedMessageType = a3;
  }
  return result;
}

- (MRSupportedProtocolMessages)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"lastSupportedMessageType"];

  return [(MRSupportedProtocolMessages *)self initWithLastSupportedMessageType:v4];
}

- (BOOL)isSupported:(unint64_t)a3
{
  return self->_lastSupportedMessageType > a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)lastSupportedMessageType
{
  return self->_lastSupportedMessageType;
}

@end