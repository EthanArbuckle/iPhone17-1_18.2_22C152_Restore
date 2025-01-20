@interface NPHSYObjectWrapper
- (NPHSYObjectWrapper)initWithSYObject:(id)a3 type:(int64_t)a4;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (SYObject)wrappedObject;
- (int64_t)changeType;
@end

@implementation NPHSYObjectWrapper

- (NPHSYObjectWrapper)initWithSYObject:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPHSYObjectWrapper;
  v8 = [(NPHSYObjectWrapper *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_wrappedObject, a3);
    v9->_type = a4;
    v10 = v9;
  }

  return v9;
}

- (NSString)objectIdentifier
{
  return (NSString *)[(SYObject *)self->_wrappedObject syncId];
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return self->_type;
}

- (SYObject)wrappedObject
{
  return self->_wrappedObject;
}

- (void).cxx_destruct
{
}

@end