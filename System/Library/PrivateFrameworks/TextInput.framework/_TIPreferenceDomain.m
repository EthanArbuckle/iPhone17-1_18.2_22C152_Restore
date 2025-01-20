@interface _TIPreferenceDomain
+ (id)domainWithName:(id)a3 notification:(id)a4;
- (BOOL)needsGetSync;
- (BOOL)needsSetSync;
- (NSString)domain;
- (NSString)notification;
- (double)lastSynchronizedTime;
- (void)setDomain:(id)a3;
- (void)setLastSynchronizedTime:(double)a3;
- (void)setNeedsGetSync:(BOOL)a3;
- (void)setNeedsSetSync:(BOOL)a3;
- (void)setNotification:(id)a3;
@end

@implementation _TIPreferenceDomain

- (NSString)notification
{
  return self->_notification;
}

+ (id)domainWithName:(id)a3 notification:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setDomain:v6];

  [v7 setNotification:v5];

  return v7;
}

- (void)setNotification:(id)a3
{
}

- (void)setDomain:(id)a3
{
}

- (BOOL)needsGetSync
{
  return self->_needsGetSync;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setLastSynchronizedTime:(double)a3
{
  self->_lastSynchronizedTime = a3;
}

- (double)lastSynchronizedTime
{
  return self->_lastSynchronizedTime;
}

- (void)setNeedsSetSync:(BOOL)a3
{
  self->_needsSetSync = a3;
}

- (BOOL)needsSetSync
{
  return self->_needsSetSync;
}

- (void)setNeedsGetSync:(BOOL)a3
{
  self->_needsGetSync = a3;
}

@end