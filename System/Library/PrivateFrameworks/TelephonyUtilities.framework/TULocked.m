@interface TULocked
- (TULocked)initWithObject:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)object;
- (os_unfair_recursive_lock_s)unfairLockForTesting;
- (void)performWhileLocked:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation TULocked

- (void)performWhileLocked:(id)a3
{
  v4 = (void (**)(id, id))a3;
  os_unfair_recursive_lock_lock_with_options();
  v4[2](v4, self->_object);
  os_unfair_recursive_lock_unlock();
}

- (TULocked)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TULocked;
  v6 = [(TULocked *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock = 0;
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TULocked;
  v4 = [(TULocked *)&v8 description];
  id v5 = [self->_object description];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TULocked;
  v4 = [(TULocked *)&v8 description];
  id v5 = [self->_object debugDescription];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)object
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_object;
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (void)setObject:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id object = self->_object;
  self->_id object = v4;

  os_unfair_recursive_lock_unlock();
}

- (os_unfair_recursive_lock_s)unfairLockForTesting
{
  return &self->_lock;
}

- (void).cxx_destruct
{
}

@end