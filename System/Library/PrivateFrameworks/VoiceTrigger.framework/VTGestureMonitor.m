@interface VTGestureMonitor
+ (id)defaultGestureMonitor;
- (VTGestureMonitorDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation VTGestureMonitor

+ (id)defaultGestureMonitor
{
  v2 = objc_alloc_init(VTGestureMonitorPhone);

  return v2;
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (VTGestureMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VTGestureMonitorDelegate *)WeakRetained;
}

@end