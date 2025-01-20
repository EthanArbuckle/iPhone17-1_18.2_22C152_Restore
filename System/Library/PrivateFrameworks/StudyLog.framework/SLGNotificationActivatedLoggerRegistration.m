@interface SLGNotificationActivatedLoggerRegistration
+ (id)registrationWithBeginToken:(int)a3 endToken:(int)a4;
- (int)beginToken;
- (int)endToken;
- (void)setBeginToken:(int)a3;
- (void)setEndToken:(int)a3;
@end

@implementation SLGNotificationActivatedLoggerRegistration

+ (id)registrationWithBeginToken:(int)a3 endToken:(int)a4
{
  v6 = objc_alloc_init((Class)a1);
  v6[2] = a3;
  v6[3] = a4;

  return v6;
}

- (int)beginToken
{
  return self->_beginToken;
}

- (void)setBeginToken:(int)a3
{
  self->_beginToken = a3;
}

- (int)endToken
{
  return self->_endToken;
}

- (void)setEndToken:(int)a3
{
  self->_endToken = a3;
}

@end