@interface NTKDarwinNotificationCenterObserver
- (BOOL)isEqual:(id)a3;
- (NSObject)observerObject;
- (NSString)notificationName;
- (SEL)selector;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setNotificationName:(id)a3;
- (void)setObserverObject:(id)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation NTKDarwinNotificationCenterObserver

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(NTKDarwinNotificationCenterObserver *)self observerObject];
  v6 = [v4 observerObject];
  if (v5 == v6)
  {
    v8 = [(NTKDarwinNotificationCenterObserver *)self notificationName];
    v9 = [v4 notificationName];
    char v7 = [v8 isEqualToString:v9];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSObject)observerObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observerObject);

  return WeakRetained;
}

- (void)setObserverObject:(id)a3
{
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);

  objc_destroyWeak((id *)&self->_observerObject);
}

@end