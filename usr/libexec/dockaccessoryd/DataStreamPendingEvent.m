@interface DataStreamPendingEvent
- (DataStreamPendingEvent)initWithProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6;
- (NSDictionary)payload;
- (NSString)protocol;
- (NSString)topic;
- (id)completion;
@end

@implementation DataStreamPendingEvent

- (DataStreamPendingEvent)initWithProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DataStreamPendingEvent;
  v15 = [(DataStreamPendingEvent *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_protocol, a3);
    objc_storeStrong((id *)&v16->_topic, a4);
    id v17 = objc_retainBlock(v14);
    id completion = v16->_completion;
    v16->_id completion = v17;

    objc_storeStrong((id *)&v16->_payload, a5);
  }

  return v16;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

@end