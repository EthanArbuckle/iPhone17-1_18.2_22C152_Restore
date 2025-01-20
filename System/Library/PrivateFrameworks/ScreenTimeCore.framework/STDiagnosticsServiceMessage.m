@interface STDiagnosticsServiceMessage
+ (BOOL)supportsSecureCoding;
- (NSSet)recipients;
- (NSString)messageType;
- (NSString)payloadUUID;
- (NSString)sender;
- (STDiagnosticsServiceMessage)initWithCoder:(id)a3;
- (STDiagnosticsServiceMessage)initWithMessageType:(id)a3 sender:(id)a4 recipients:(id)a5 payloadUUID:(id)a6 idsInterface:(int64_t)a7;
- (id)description;
- (int64_t)idsInterface;
- (void)encodeWithCoder:(id)a3;
- (void)setIdsInterface:(int64_t)a3;
- (void)setMessageType:(id)a3;
- (void)setPayloadUUID:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
@end

@implementation STDiagnosticsServiceMessage

- (STDiagnosticsServiceMessage)initWithMessageType:(id)a3 sender:(id)a4 recipients:(id)a5 payloadUUID:(id)a6 idsInterface:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)STDiagnosticsServiceMessage;
  v17 = [(STDiagnosticsServiceMessage *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messageType, a3);
    objc_storeStrong((id *)&v18->_sender, a4);
    objc_storeStrong((id *)&v18->_recipients, a5);
    objc_storeStrong((id *)&v18->_payloadUUID, a6);
    v18->_idsInterface = a7;
  }

  return v18;
}

- (id)description
{
  v3 = [(NSString *)self->_messageType stringByReplacingOccurrencesOfString:@"RMUnifiedTransportPayloadType" withString:&stru_1F3487700];
  if ([(NSSet *)self->_recipients count])
  {
    v4 = [(NSSet *)self->_recipients allObjects];
    v5 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    v5 = @"[]";
  }
  v6 = [NSString stringWithFormat:@"MessageType: %@ | Sender: %@ | Recipients: %@ | UUID: %@ | IDS Interface: %li", v3, self->_sender, v5, self->_payloadUUID, self->_idsInterface];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  messageType = self->_messageType;
  id v5 = a3;
  [v5 encodeObject:messageType forKey:@"messageType"];
  [v5 encodeObject:self->_sender forKey:@"sender"];
  [v5 encodeObject:self->_recipients forKey:@"recipients"];
  [v5 encodeObject:self->_payloadUUID forKey:@"payloadUUID"];
  [v5 encodeInteger:self->_idsInterface forKey:@"idsInterface"];
}

- (STDiagnosticsServiceMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STDiagnosticsServiceMessage;
  id v5 = [(STDiagnosticsServiceMessage *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageType"];
    messageType = v5->_messageType;
    v5->_messageType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSSet *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadUUID"];
    payloadUUID = v5->_payloadUUID;
    v5->_payloadUUID = (NSString *)v12;

    v5->_idsInterface = [v4 decodeIntegerForKey:@"idsInterface"];
  }

  return v5;
}

- (NSString)messageType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessageType:(id)a3
{
}

- (NSString)sender
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSender:(id)a3
{
}

- (NSSet)recipients
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRecipients:(id)a3
{
}

- (NSString)payloadUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPayloadUUID:(id)a3
{
}

- (int64_t)idsInterface
{
  return self->_idsInterface;
}

- (void)setIdsInterface:(int64_t)a3
{
  self->_idsInterface = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUUID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
}

@end