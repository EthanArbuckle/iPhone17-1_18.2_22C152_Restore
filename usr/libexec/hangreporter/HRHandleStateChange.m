@interface HRHandleStateChange
- (HRHandleStateChange)initWithType:(int64_t)a3 andTimestamp:(unint64_t)a4 andName:(unint64_t)a5;
- (int64_t)type;
- (unint64_t)name;
- (unint64_t)timestamp;
- (void)setName:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation HRHandleStateChange

- (HRHandleStateChange)initWithType:(int64_t)a3 andTimestamp:(unint64_t)a4 andName:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)HRHandleStateChange;
  v8 = [(HRHandleStateChange *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(HRHandleStateChange *)v8 setType:a3];
    [(HRHandleStateChange *)v9 setTimestamp:a4];
    [(HRHandleStateChange *)v9 setName:a5];
  }
  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)name
{
  return self->_name;
}

- (void)setName:(unint64_t)a3
{
  self->_name = a3;
}

@end