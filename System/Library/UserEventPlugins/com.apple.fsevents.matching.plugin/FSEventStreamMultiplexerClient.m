@interface FSEventStreamMultiplexerClient
- (FSEventStreamMultiplexerClient)initWithID:(int)a3 name:(id)a4 callback:(id)a5;
- (NSNumber)clientID;
- (NSString)name;
- (id)callback;
- (unint64_t)hash;
@end

@implementation FSEventStreamMultiplexerClient

- (unint64_t)hash
{
  v2 = [(FSEventStreamMultiplexerClient *)self clientID];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (NSNumber)clientID
{
  return self->_clientID;
}

- (id)callback
{
  return self->_callback;
}

- (NSString)name
{
  return self->_name;
}

- (FSEventStreamMultiplexerClient)initWithID:(int)a3 name:(id)a4 callback:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v8 = (__CFString *)a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FSEventStreamMultiplexerClient;
  v10 = [(FSEventStreamMultiplexerClient *)&v17 init];
  if (v10)
  {
    v11 = (NSNumber *)[objc_alloc((Class)NSNumber) initWithInt:v6];
    clientID = v10->_clientID;
    v10->_clientID = v11;

    if (v8) {
      v13 = v8;
    }
    else {
      v13 = @"unknown";
    }
    objc_storeStrong((id *)&v10->_name, v13);
    id v14 = objc_retainBlock(v9);
    id callback = v10->_callback;
    v10->_id callback = v14;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

@end