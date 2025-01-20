@interface VUIJSNotificationCenter
- (VUIJSNotificationCenter)initWithAppContext:(id)a3;
- (void)clearBadgeData;
- (void)setBadgeNumber:(id)a3;
@end

@implementation VUIJSNotificationCenter

- (VUIJSNotificationCenter)initWithAppContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUIJSNotificationCenter;
  v3 = [(VUIJSObject *)&v7 initWithAppContext:a3];
  if (v3)
  {
    v4 = (WLKNotificationCenter *)objc_alloc_init(MEMORY[0x1E4FB50E8]);
    center = v3->_center;
    v3->_center = v4;

    [(WLKNotificationCenter *)v3->_center setDelegate:v3];
  }
  return v3;
}

- (void)clearBadgeData
{
}

- (void)setBadgeNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end