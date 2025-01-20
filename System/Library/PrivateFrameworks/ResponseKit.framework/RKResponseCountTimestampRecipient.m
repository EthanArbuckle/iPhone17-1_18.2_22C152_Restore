@interface RKResponseCountTimestampRecipient
- (BOOL)hasSameRecipient;
- (NSDate)timestamp;
- (RKResponseCountTimestampRecipient)initWithCount:(int)a3 timestamp:(id)a4 hasSameRecipient:(BOOL)a5;
- (int)count;
- (void)setCount:(int)a3;
- (void)setHasSameRecipient:(BOOL)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation RKResponseCountTimestampRecipient

- (RKResponseCountTimestampRecipient)initWithCount:(int)a3 timestamp:(id)a4 hasSameRecipient:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RKResponseCountTimestampRecipient;
  v10 = [(RKResponseCountTimestampRecipient *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_count = a3;
    objc_storeStrong((id *)&v10->_timestamp, a4);
    v11->_hasSameRecipient = a5;
  }

  return v11;
}

- (int)count
{
  return self->_count;
}

- (void)setCount:(int)a3
{
  self->_count = a3;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)hasSameRecipient
{
  return self->_hasSameRecipient;
}

- (void)setHasSameRecipient:(BOOL)a3
{
  self->_hasSameRecipient = a3;
}

- (void).cxx_destruct
{
}

@end