@interface RCPNaturalInputCollectionEvent
- (NSArray)manipulators;
- (NSArray)selections;
- (RCPEventSenderProperties)senderProperties;
- (RCPNaturalInputCollectionEvent)initWithManipulators:(id)a3 selections:(id)a4 phase:(int64_t)a5 timestamp:(unint64_t)a6 senderProperties:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)phase;
- (unint64_t)timestamp;
@end

@implementation RCPNaturalInputCollectionEvent

- (RCPNaturalInputCollectionEvent)initWithManipulators:(id)a3 selections:(id)a4 phase:(int64_t)a5 timestamp:(unint64_t)a6 senderProperties:(id)a7
{
  v22.receiver = self;
  v22.super_class = (Class)RCPNaturalInputCollectionEvent;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  v14 = [(RCPNaturalInputCollectionEvent *)&v22 init];
  uint64_t v15 = objc_msgSend(v13, "copy", v22.receiver, v22.super_class);

  manipulators = v14->_manipulators;
  v14->_manipulators = (NSArray *)v15;

  uint64_t v17 = [v12 copy];
  selections = v14->_selections;
  v14->_selections = (NSArray *)v17;

  v14->_phase = a5;
  v14->_timestamp = a6;
  uint64_t v19 = [v11 copy];

  senderProperties = v14->_senderProperties;
  v14->_senderProperties = (RCPEventSenderProperties *)v19;

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(RCPNaturalInputCollectionEvent *)self manipulators];
  v6 = [(RCPNaturalInputCollectionEvent *)self selections];
  int64_t v7 = [(RCPNaturalInputCollectionEvent *)self phase];
  unint64_t v8 = [(RCPNaturalInputCollectionEvent *)self timestamp];
  v9 = [(RCPNaturalInputCollectionEvent *)self senderProperties];
  v10 = [v3 stringWithFormat:@"<%@: { Manipulators: %@, Selections: %@, Phase: %lu, Timestamp: %llu, Sender Properties: %@ }>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  manipulators = self->_manipulators;
  selections = self->_selections;
  int64_t phase = self->_phase;
  unint64_t timestamp = self->_timestamp;
  senderProperties = self->_senderProperties;
  return (id)[v4 initWithManipulators:manipulators selections:selections phase:phase timestamp:timestamp senderProperties:senderProperties];
}

- (NSArray)manipulators
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)selections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)phase
{
  return self->_phase;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (RCPEventSenderProperties)senderProperties
{
  return (RCPEventSenderProperties *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_selections, 0);
  objc_storeStrong((id *)&self->_manipulators, 0);
}

@end