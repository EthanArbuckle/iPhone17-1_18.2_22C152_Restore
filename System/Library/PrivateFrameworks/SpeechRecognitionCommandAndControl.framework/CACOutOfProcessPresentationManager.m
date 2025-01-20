@interface CACOutOfProcessPresentationManager
+ (int)axNotification;
+ (int64_t)remoteViewType;
- (BOOL)isOutOfProcess;
- (BOOL)isOverlay;
- (BOOL)isPhysiciallyInteractiveOverlay;
- (BOOL)isShowing;
- (CACAXNotificationObserver)observer;
- (CACOutOfProcessPresentationManager)init;
- (void)handleAXNotificationData:(void *)a3;
- (void)hide;
- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5;
- (void)presentWithData:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation CACOutOfProcessPresentationManager

- (CACOutOfProcessPresentationManager)init
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)CACOutOfProcessPresentationManager;
  v2 = [(CACOutOfProcessPresentationManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() axNotification];
    if (v3)
    {
      uint64_t v4 = v3;
      v5 = [CACAXNotificationObserver alloc];
      v6 = [NSNumber numberWithInt:v4];
      v12[0] = v6;
      v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      v8 = [(CACAXNotificationObserver *)v5 initWithNotifications:v7];

      [(CACAXNotificationObserver *)v8 setDelegate:v2];
      observer = v2->_observer;
      v2->_observer = v8;
    }
  }
  return v2;
}

- (void)presentWithData:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F22968];
  id v4 = a3;
  id v5 = [v3 server];
  objc_msgSend(v5, "showRemoteView:withData:", objc_msgSend((id)objc_opt_class(), "remoteViewType"), v4);
}

- (BOOL)isShowing
{
  v2 = [MEMORY[0x263F22968] server];
  char v3 = objc_msgSend(v2, "isShowingRemoteView:", objc_msgSend((id)objc_opt_class(), "remoteViewType"));

  return v3;
}

- (BOOL)isOverlay
{
  return 0;
}

- (BOOL)isPhysiciallyInteractiveOverlay
{
  return 0;
}

- (void)hide
{
  id v2 = [MEMORY[0x263F22968] server];
  objc_msgSend(v2, "hideRemoteView:", objc_msgSend((id)objc_opt_class(), "remoteViewType"));
}

- (BOOL)isOutOfProcess
{
  return 1;
}

- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5
{
  if ([(id)objc_opt_class() axNotification] == a4)
  {
    [(CACOutOfProcessPresentationManager *)self handleAXNotificationData:a5];
  }
}

- (CACAXNotificationObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (int64_t)remoteViewType
{
  return 0;
}

+ (int)axNotification
{
  return 0;
}

- (void)handleAXNotificationData:(void *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end