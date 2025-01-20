@interface _TUIDragTriggerInfo
- (NSDictionary)arguments;
- (NSString)behavior;
- (_TUIDragTriggerInfo)initWithActionObject:(id)a3 behavior:(id)a4 arguments:(id)a5;
- (id)actionObject;
- (void)setArguments:(id)a3;
- (void)setBehavior:(id)a3;
@end

@implementation _TUIDragTriggerInfo

- (_TUIDragTriggerInfo)initWithActionObject:(id)a3 behavior:(id)a4 arguments:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_TUIDragTriggerInfo;
  v12 = [(_TUIDragTriggerInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_actionObject, a3);
    objc_storeStrong((id *)&v13->_behavior, a4);
    objc_storeStrong((id *)&v13->_arguments, a5);
  }

  return v13;
}

- (NSString)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (id)actionObject
{
  return self->_actionObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionObject, 0);
  objc_storeStrong((id *)&self->_arguments, 0);

  objc_storeStrong((id *)&self->_behavior, 0);
}

@end