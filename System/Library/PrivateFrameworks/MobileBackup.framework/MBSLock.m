@interface MBSLock
+ (id)lockWithState:(int)a3 type:(int)a4 owner:(id)a5 timeout:(unint64_t)a6;
+ (id)lockWithState:(int)a3 type:(int)a4 timeout:(unint64_t)a5;
+ (id)stringForState:(int)a3;
- (MBSLock)initWithState:(int)a3 type:(int)a4 owner:(id)a5 timeout:(unint64_t)a6;
- (MBSLock)initWithState:(int)a3 type:(int)a4 timeout:(unint64_t)a5;
- (NSString)owner;
- (NSString)stateString;
- (id)description;
- (int)state;
- (int)type;
- (unint64_t)timeout;
- (void)dealloc;
- (void)setState:(int)a3;
@end

@implementation MBSLock

+ (id)stringForState:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_100416280 + a3);
  }
}

+ (id)lockWithState:(int)a3 type:(int)a4 timeout:(unint64_t)a5
{
  v5 = [[MBSLock alloc] initWithState:*(void *)&a3 type:*(void *)&a4 owner:MBDeviceUDID_Legacy() timeout:a5];
  return v5;
}

+ (id)lockWithState:(int)a3 type:(int)a4 owner:(id)a5 timeout:(unint64_t)a6
{
  v6 = [[MBSLock alloc] initWithState:*(void *)&a3 type:*(void *)&a4 owner:a5 timeout:a6];
  return v6;
}

- (MBSLock)initWithState:(int)a3 type:(int)a4 timeout:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = MBDeviceUDID_Legacy();
  return [(MBSLock *)self initWithState:v7 type:v6 owner:v9 timeout:a5];
}

- (MBSLock)initWithState:(int)a3 type:(int)a4 owner:(id)a5 timeout:(unint64_t)a6
{
  v13.receiver = self;
  v13.super_class = (Class)MBSLock;
  v10 = [(MBSLock *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    v10->_type = a4;
    v10->_owner = (NSString *)[a5 copy];
    v11->_timeout = a6;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBSLock;
  [(MBSLock *)&v3 dealloc];
}

- (NSString)stateString
{
  return (NSString *)+[MBSLock stringForState:self->_state];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: state=%d, type=%d, owner=%@, timeout=%u", objc_opt_class(), self->_state, self->_type, self->_owner, self->_timeout];
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int)type
{
  return self->_type;
}

- (NSString)owner
{
  return self->_owner;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

@end