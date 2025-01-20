@interface NFBasebandMonitor
- (NFBasebandMonitor)init;
- (void)dealloc;
@end

@implementation NFBasebandMonitor

- (NFBasebandMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)NFBasebandMonitor;
  v2 = [(NFBasebandMonitor *)&v4 init];
  if (v2) {
    v2->_bbRef = (__TelephonyBasebandControllerHandle_tag *)TelephonyBasebandCreateController();
  }
  return v2;
}

- (void)dealloc
{
  bbRef = self->_bbRef;
  if (bbRef) {
    CFRelease(bbRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)NFBasebandMonitor;
  [(NFBasebandMonitor *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end