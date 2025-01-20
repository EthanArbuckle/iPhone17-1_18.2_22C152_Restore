@interface _TUIFeedCaptureDynamicState
- (BOOL)isEqual:(id)a3;
- (NSObject)instance;
- (NSObject)parameters;
- (NSString)kind;
- (TUIDynamicProviding)value;
- (_TUIFeedCaptureDynamicState)initWithValue:(id)a3 kind:(id)a4 instance:(id)a5 parameters:(id)a6;
- (unint64_t)hash;
@end

@implementation _TUIFeedCaptureDynamicState

- (_TUIFeedCaptureDynamicState)initWithValue:(id)a3 kind:(id)a4 instance:(id)a5 parameters:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_TUIFeedCaptureDynamicState;
  v15 = [(_TUIFeedCaptureDynamicState *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_value, a3);
    objc_storeStrong((id *)&v16->_kind, a4);
    objc_storeStrong((id *)&v16->_instance, a5);
    objc_storeStrong((id *)&v16->_parameters, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  if (v6
    && ((kind = self->_kind, kind == (NSString *)v6[2]) || -[NSString isEqualToString:](kind, "isEqualToString:"))
    && ((instance = self->_instance, instance == v6[3])
     || -[NSObject isEqual:](instance, "isEqual:")))
  {
    parameters = self->_parameters;
    if (parameters == v6[4]) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = -[NSObject isEqual:](parameters, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_kind hash];
  unint64_t v4 = (unint64_t)[self->_instance hash] ^ v3;
  return v4 ^ (unint64_t)[self->_parameters hash];
}

- (TUIDynamicProviding)value
{
  return self->_value;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end