@interface MODaemonSPINotifier
- (MODaemonSPINotifier)initWithName:(id)a3;
- (void)sendNotification:(int)a3 withPayload:(id)a4;
@end

@implementation MODaemonSPINotifier

- (MODaemonSPINotifier)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MODaemonSPINotifier;
  v3 = [(MONotifier *)&v7 initWithName:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)sendNotification:(int)a3 withPayload:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(MONotifier *)self isEnabled]) {
    [(MONotifier *)self notify:v4 withPayload:v6];
  }
}

@end