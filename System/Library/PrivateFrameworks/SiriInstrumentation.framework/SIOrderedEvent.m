@interface SIOrderedEvent
+ (id)deserializeFromData:(id)a3;
- (NSUUID)messageUUID;
- (SILogicalTimestamp)logicalTimestamp;
- (SIOrderedEvent)initWithData:(id)a3;
- (SIOrderedEvent)initWithInternalType:(id)a3;
- (SIOrderedEvent)initWithTimestamp:(id)a3 messageUUID:(id)a4 topLevelUnionType:(id)a5;
- (SISchemaTopLevelUnionType)topLevelUnionType;
- (id)data;
- (id)serialize;
@end

@implementation SIOrderedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingTimestamp, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

- (id)data
{
  return (id)[(SIOrderedEventInternal *)self->_underlying data];
}

- (id)serialize
{
  return (id)[(SIOrderedEventInternal *)self->_underlying serialize];
}

- (NSUUID)messageUUID
{
  return [(SIOrderedEventInternal *)self->_underlying messageUUID];
}

- (SISchemaTopLevelUnionType)topLevelUnionType
{
  return [(SIOrderedEventInternal *)self->_underlying tluEvent];
}

- (SILogicalTimestamp)logicalTimestamp
{
  return self->_underlyingTimestamp;
}

- (SIOrderedEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [[SIOrderedEventInternal alloc] initWithData:v4];

  if (v5)
  {
    self = [(SIOrderedEvent *)self initWithInternalType:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SIOrderedEvent)initWithInternalType:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIOrderedEvent;
  v6 = [(SIOrderedEvent *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlying, a3);
    v8 = [SILogicalTimestamp alloc];
    v9 = [(SIOrderedEventInternal *)v7->_underlying logicalTimestamp];
    uint64_t v10 = [(SILogicalTimestamp *)v8 initWithInternalType:v9];
    underlyingTimestamp = v7->_underlyingTimestamp;
    v7->_underlyingTimestamp = (SILogicalTimestamp *)v10;
  }
  return v7;
}

- (SIOrderedEvent)initWithTimestamp:(id)a3 messageUUID:(id)a4 topLevelUnionType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SIOrderedEvent;
  v12 = [(SIOrderedEvent *)&v20 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_underlyingTimestamp, a3);
    v14 = [SILogicalTimestampInternal alloc];
    v15 = [v9 clockIdentifier];
    v16 = -[SILogicalTimestampInternal initWithClockIdentifier:nanosecondsSinceBoot:](v14, "initWithClockIdentifier:nanosecondsSinceBoot:", v15, [v9 nanoSecondsSinceBoot]);

    v17 = [[SIOrderedEventInternal alloc] initWithLogicalTimestamp:v16 messageUUID:v10 tluEvent:v11];
    underlying = v13->_underlying;
    v13->_underlying = v17;
  }
  return v13;
}

+ (id)deserializeFromData:(id)a3
{
  v3 = +[SIOrderedEventInternal deserializeFrom:a3];
  if (v3) {
    id v4 = [[SIOrderedEvent alloc] initWithInternalType:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end