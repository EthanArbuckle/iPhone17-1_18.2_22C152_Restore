@interface ContextAwareThermalManager
+ (id)sharedInstance;
- (BOOL)isContextTriggered:(int)a3;
- (ContextAwareThermalManager)init;
- (id)createNewInPocketContext:(id)a3;
- (id)createNewSolarContext:(BOOL)a3;
- (int)getContextState:(int)a3;
- (void)iterateAndUpdateContexts;
- (void)setInfoOnlySensorsActive:(BOOL)a3;
- (void)updateSystemPowerState:(BOOL)a3;
@end

@implementation ContextAwareThermalManager

- (BOOL)isContextTriggered:(int)a3
{
  if (CFArrayGetCount(self->ctxObjects) < 1)
  {
LABEL_5:
    if (byte_1000AA7A0)
    {
      v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> No ContextTriggered Match", v9, 2u);
      }
    }
    return 0;
  }
  else
  {
    CFIndex v5 = 0;
    while (1)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->ctxObjects, v5);
      if ([ValueAtIndex ctxType] == a3) {
        break;
      }
      if (CFArrayGetCount(self->ctxObjects) <= ++v5) {
        goto LABEL_5;
      }
    }
    return [ValueAtIndex isContextTriggered];
  }
}

- (int)getContextState:(int)a3
{
  if (CFArrayGetCount(self->ctxObjects) < 1)
  {
LABEL_5:
    if (byte_1000AA7A0)
    {
      v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Cannot get ContextValue", v9, 2u);
      }
    }
    return -1;
  }
  else
  {
    CFIndex v5 = 0;
    while (1)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->ctxObjects, v5);
      if ([ValueAtIndex ctxType] == a3) {
        break;
      }
      if (CFArrayGetCount(self->ctxObjects) <= ++v5) {
        goto LABEL_5;
      }
    }
    return [ValueAtIndex getContextState];
  }
}

- (void)iterateAndUpdateContexts
{
  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    CFIndex v3 = 0;
    do
      [CFArrayGetValueAtIndex(self->ctxObjects, v3++) synchContext];
    while (CFArrayGetCount(self->ctxObjects) > v3);
  }
}

+ (id)sharedInstance
{
  if (qword_1000AA0B8 != -1) {
    dispatch_once(&qword_1000AA0B8, &stru_100085D30);
  }
  return (id)qword_1000AA0C0;
}

- (ContextAwareThermalManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)ContextAwareThermalManager;
  v2 = [(ContextAwareThermalManager *)&v4 init];
  if (v2) {
    v2->ctxObjects = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  }
  return v2;
}

- (id)createNewSolarContext:(BOOL)a3
{
  CFIndex v5 = &off_100084B20;
  if (!a3) {
    CFIndex v5 = off_100084A60;
  }
  id v6 = objc_alloc_init(*v5);
  if (v6)
  {
    CFArrayAppendValue(self->ctxObjects, v6);
    CFRelease(v6);
  }
  else
  {
    v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056F30(a3, v7);
    }
  }
  return v6;
}

- (id)createNewInPocketContext:(id)a3
{
  objc_super v4 = [[ContextInPocket alloc] initWithParams:a3];
  if (v4)
  {
    CFArrayAppendValue(self->ctxObjects, v4);
    CFRelease(v4);
  }
  else
  {
    CFIndex v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056FAC(v5);
    }
  }
  return v4;
}

- (void)updateSystemPowerState:(BOOL)a3
{
  BOOL v3 = a3;
  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    CFIndex v5 = 0;
    do
      [CFArrayGetValueAtIndex(self->ctxObjects, v5++) updateSystemPowerState:v3];
    while (CFArrayGetCount(self->ctxObjects) > v5);
  }
}

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (CFArrayGetCount(self->ctxObjects) >= 1)
  {
    CFIndex v5 = 0;
    do
      [CFArrayGetValueAtIndex(self->ctxObjects, v5++) setInfoOnlySensorsActive:v3];
    while (CFArrayGetCount(self->ctxObjects) > v5);
  }
}

@end