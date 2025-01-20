@interface DataStreamPendingRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesResponseHeader:(id)a3;
- (DataStreamPendingRequest)initWithIdentifier:(id)a3 protocol:(id)a4 topic:(id)a5 payload:(id)a6 callback:(id)a7;
- (NSDictionary)payload;
- (NSNumber)identifier;
- (NSString)protocol;
- (NSString)topic;
- (id)callback;
- (unint64_t)hash;
@end

@implementation DataStreamPendingRequest

- (DataStreamPendingRequest)initWithIdentifier:(id)a3 protocol:(id)a4 topic:(id)a5 payload:(id)a6 callback:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)DataStreamPendingRequest;
  v17 = [(DataStreamPendingRequest *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_protocol, a4);
    objc_storeStrong((id *)&v18->_topic, a5);
    objc_storeStrong((id *)&v18->_identifier, a3);
    id v19 = objc_retainBlock(v16);
    id callback = v18->_callback;
    v18->_id callback = v19;

    objc_storeStrong((id *)&v18->_payload, a6);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (DataStreamPendingRequest *)v4;
    if (self == v5)
    {
      unsigned __int8 v8 = 1;
    }
    else
    {
      v6 = [(DataStreamPendingRequest *)self identifier];
      v7 = [(DataStreamPendingRequest *)v5 identifier];
      unsigned __int8 v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)matchesResponseHeader:(id)a3
{
  id v4 = a3;
  v5 = [(DataStreamPendingRequest *)self topic];
  v6 = [v4 objectForKeyedSubscript:@"response"];
  if ([v5 isEqual:v6])
  {
    v7 = [(DataStreamPendingRequest *)self identifier];
    unsigned __int8 v8 = [v4 objectForKeyedSubscript:@"id"];
    if ([v7 isEqual:v8])
    {
      v9 = [(DataStreamPendingRequest *)self protocol];
      v10 = [v4 objectForKeyedSubscript:@"protocol"];
      unsigned __int8 v11 = [v9 isEqual:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(DataStreamPendingRequest *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (id)callback
{
  return self->_callback;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_topic, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end