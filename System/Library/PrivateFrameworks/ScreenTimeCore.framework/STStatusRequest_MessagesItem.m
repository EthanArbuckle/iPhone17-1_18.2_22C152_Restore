@interface STStatusRequest_MessagesItem
+ (NSSet)allowedKeys;
+ (id)buildRequiredOnlyWithInReplyTo:(id)a3 withStates:(id)a4;
+ (id)buildWithInReplyTo:(id)a3 withStates:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)states;
- (NSString)inReplyTo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setInReplyTo:(id)a3;
- (void)setStates:(id)a3;
@end

@implementation STStatusRequest_MessagesItem

+ (NSSet)allowedKeys
{
  v5[0] = @"InReplyTo";
  v5[1] = @"States";
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

+ (id)buildWithInReplyTo:(id)a3 withStates:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setInReplyTo:v6];

  [v7 setStates:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithInReplyTo:(id)a3 withStates:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setInReplyTo:v6];

  [v7 setStates:v5];
  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 allKeys];
  v8 = +[NSMutableSet setWithArray:v7];

  v9 = +[STStatusRequest_MessagesItem allowedKeys];
  [v8 minusSet:v9];

  if ([v8 count])
  {
    if (!a4)
    {
      BOOL v12 = 0;
      goto LABEL_11;
    }
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v10 = +[NSString stringWithFormat:@"Unexpected payload keys: %@", v8];
    id v21 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    *a4 = +[NSError errorWithDomain:@"error" code:1 userInfo:v11];

    BOOL v12 = 0;
  }
  else
  {
    id v19 = 0;
    v13 = [(STStatusRequest_MessagesItem *)self loadStringFromDictionary:v6 withKey:@"InReplyTo" isRequired:1 defaultValue:0 error:&v19];
    id v10 = v19;
    inReplyTo = self->_inReplyTo;
    self->_inReplyTo = v13;

    if (!v10)
    {
      id v18 = 0;
      v15 = [(STStatusRequest_MessagesItem *)self loadArrayFromDictionary:v6 withKey:@"States" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v18];
      id v10 = v18;
      states = self->_states;
      self->_states = v15;
    }
    BOOL v12 = v10 == 0;
    if (a4 && v10)
    {
      id v10 = v10;
      BOOL v12 = 0;
      *a4 = v10;
    }
  }

LABEL_11:
  return v12;
}

- (id)serializePayload
{
  v3 = +[NSMutableDictionary dictionary];
  [(STStatusRequest_MessagesItem *)self serializeStringIntoDictionary:v3 withKey:@"InReplyTo" withValue:self->_inReplyTo isRequired:1 defaultValue:0];
  [(STStatusRequest_MessagesItem *)self serializeArrayIntoDictionary:v3 withKey:@"States" withValue:self->_states itemSerializer:&stru_1002FE4D8 isRequired:1 defaultValue:0];
  id v4 = [v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STStatusRequest_MessagesItem;
  id v4 = [(STStatusRequest_MessagesItem *)&v10 copyWithZone:a3];
  id v5 = [(NSString *)self->_inReplyTo copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  id v7 = [(NSArray *)self->_states copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)inReplyTo
{
  return self->_inReplyTo;
}

- (void)setInReplyTo:(id)a3
{
}

- (NSArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_inReplyTo, 0);
}

@end