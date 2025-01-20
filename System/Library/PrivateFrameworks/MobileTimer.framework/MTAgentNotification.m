@interface MTAgentNotification
+ (id)notificationWithType:(int64_t)a3 name:(id)a4;
+ (id)notificationWithType:(int64_t)a3 name:(id)a4 powerAssertionTimeout:(double)a5;
- (MTAgentNotification)initWithType:(int64_t)a3 name:(id)a4 powerAssertionTimeout:(double)a5;
- (MTPowerAssertion)powerAssertion;
- (NSString)name;
- (int64_t)type;
- (void)dealloc;
- (void)releaseAssertion;
- (void)setName:(id)a3;
- (void)setPowerAssertion:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MTAgentNotification

+ (id)notificationWithType:(int64_t)a3 name:(id)a4
{
  return (id)[a1 notificationWithType:a3 name:a4 powerAssertionTimeout:0.0];
}

+ (id)notificationWithType:(int64_t)a3 name:(id)a4 powerAssertionTimeout:(double)a5
{
  id v8 = a4;
  v9 = (void *)[objc_alloc((Class)a1) initWithType:a3 name:v8 powerAssertionTimeout:a5];

  return v9;
}

- (MTAgentNotification)initWithType:(int64_t)a3 name:(id)a4 powerAssertionTimeout:(double)a5
{
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MTAgentNotification;
  v9 = [(MTAgentNotification *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    if (a5 > 0.0)
    {
      v13 = [MTPowerAssertion alloc];
      v14 = [NSString stringWithFormat:@"%@", v8];
      uint64_t v15 = [(MTPowerAssertion *)v13 initWithName:v14 assertionTimeout:a5];
      powerAssertion = v10->_powerAssertion;
      v10->_powerAssertion = (MTPowerAssertion *)v15;

      [(MTPowerAssertion *)v10->_powerAssertion takeAssertion];
    }
  }

  return v10;
}

- (void)releaseAssertion
{
  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    [(MTPowerAssertion *)powerAssertion releaseAssertion];
    powerAssertion = self->_powerAssertion;
  }
  self->_powerAssertion = 0;
}

- (void)dealloc
{
  [(MTAgentNotification *)self releaseAssertion];
  v3.receiver = self;
  v3.super_class = (Class)MTAgentNotification;
  [(MTAgentNotification *)&v3 dealloc];
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (MTPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end