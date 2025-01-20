@interface HAPSuspendedAccessory
- (HAPSuspendedAccessory)initWithName:(id)a3 identifier:(id)a4 type:(unint64_t)a5 queue:(id)a6;
- (NSString)identifier;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)description;
- (unint64_t)type;
- (void)setQueue:(id)a3;
- (void)wakeWithCompletion:(id)a3;
@end

@implementation HAPSuspendedAccessory

- (HAPSuspendedAccessory)initWithName:(id)a3 identifier:(id)a4 type:(unint64_t)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HAPSuspendedAccessory;
  v14 = [(HAPSuspendedAccessory *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_identifier, a4);
    v15->_type = a5;
    objc_storeStrong((id *)&v15->_queue, a6);
  }

  return v15;
}

- (void)wakeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)description
{
  v3 = [(HAPSuspendedAccessory *)self identifier];
  id v4 = [(HAPSuspendedAccessory *)self name];
  v5 = +[NSNumber numberWithUnsignedInteger:[(HAPSuspendedAccessory *)self type]];
  v6 = +[NSString stringWithFormat:@"<AccyID: %@, name: %@, suspended type: '%@'>", v3, v4, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end