@interface SiriAnalyticsMessage
- (NSUUID)messageUUID;
- (SISchemaTopLevelUnionType)underlyingMessage;
- (SiriAnalyticsLogicalTimeStamp)logicalTimestamp;
- (SiriAnalyticsMessage)init;
- (SiriAnalyticsMessage)initWithMessageUUID:(id)a3 logicalTimestamp:(id)a4 underlying:(id)a5;
- (id)storageRepresentation;
- (void)setLogicalTimestamp:(id)a3;
- (void)setMessageUUID:(id)a3;
- (void)setUnderlyingMessage:(id)a3;
@end

@implementation SiriAnalyticsMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMessage, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_logicalTimestamp, 0);
}

- (void)setUnderlyingMessage:(id)a3
{
}

- (SISchemaTopLevelUnionType)underlyingMessage
{
  return self->_underlyingMessage;
}

- (void)setMessageUUID:(id)a3
{
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (void)setLogicalTimestamp:(id)a3
{
}

- (SiriAnalyticsLogicalTimeStamp)logicalTimestamp
{
  return self->_logicalTimestamp;
}

- (SiriAnalyticsMessage)initWithMessageUUID:(id)a3 logicalTimestamp:(id)a4 underlying:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsMessage;
  v12 = [(SiriAnalyticsMessage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageUUID, a3);
    objc_storeStrong((id *)&v13->_logicalTimestamp, a4);
    objc_storeStrong((id *)&v13->_underlyingMessage, a5);
  }

  return v13;
}

- (SiriAnalyticsMessage)init
{
  return 0;
}

- (id)storageRepresentation
{
  v3 = [(SiriAnalyticsMessage *)self underlyingMessage];
  v4 = [v3 wrapAsAnyEvent];

  v5 = [(SiriAnalyticsMessage *)self logicalTimestamp];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA12D8]);
    id v7 = objc_alloc_init(MEMORY[0x1E4FA1290]);
    [v6 setMetadata:v7];

    v8 = [v6 metadata];
    id v9 = [(SiriAnalyticsMessage *)self logicalTimestamp];
    id v10 = [v9 loggingRepresentation];
    [v8 setTimestamp:v10];

    id v11 = [v6 metadata];
    id v12 = objc_alloc(MEMORY[0x1E4FA1378]);
    v13 = [(SiriAnalyticsMessage *)self messageUUID];
    v14 = (void *)[v12 initWithNSUUID:v13];
    [v11 setEventId:v14];

    [v6 setEvent:v4];
    id v15 = [v6 wrapAsAnyEvent];
  }
  else
  {
    id v15 = v4;
  }

  return v15;
}

@end