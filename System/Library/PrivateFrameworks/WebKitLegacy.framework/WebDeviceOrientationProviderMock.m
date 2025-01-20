@interface WebDeviceOrientationProviderMock
+ (id)shared;
- (WebDeviceOrientationProviderMock)init;
- (id)lastOrientation;
- (void)dealloc;
- (void)setController:(DeviceOrientationController *)a3;
- (void)setOrientation:(id)a3;
- (void)startUpdating;
- (void)stopUpdating;
@end

@implementation WebDeviceOrientationProviderMock

+ (id)shared
{
  if (_MergedGlobals_14 == 1) {
    return (id)qword_1EB3A9750;
  }
  id result = objc_alloc_init(WebDeviceOrientationProviderMock);
  qword_1EB3A9750 = (uint64_t)result;
  _MergedGlobals_14 = 1;
  return result;
}

- (WebDeviceOrientationProviderMock)init
{
  v4.receiver = self;
  v4.super_class = (Class)WebDeviceOrientationProviderMock;
  v2 = [(WebDeviceOrientationProviderMock *)&v4 init];
  if (v2) {
    v2->m_internal = objc_alloc_init(WebDeviceOrientationProviderMockInternal);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebDeviceOrientationProviderMock;
  [(WebDeviceOrientationProviderMock *)&v3 dealloc];
}

- (void)setOrientation:(id)a3
{
}

- (void)startUpdating
{
}

- (void)stopUpdating
{
}

- (id)lastOrientation
{
  return [(WebDeviceOrientationProviderMockInternal *)self->m_internal lastOrientation];
}

- (void)setController:(DeviceOrientationController *)a3
{
}

@end