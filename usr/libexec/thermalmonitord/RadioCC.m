@interface RadioCC
- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withMitigationType:(int)a4 withParams:(__CFDictionary *)a5;
- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)addRadioMitigations;
- (void)calculateAdditionalRadioMitigations;
- (void)calculateMitigation;
- (void)createConnectionToCT;
- (void)createServerConnection;
- (void)dealloc;
- (void)defaultAction;
- (void)defaultCPMSAction;
- (void)initializeRadio;
- (void)sendRadioNotification;
- (void)setAdditionalRadioMitigations;
- (void)setCPMSMitigationState:(BOOL)a3;
- (void)setMaxTransmitPower;
@end

@implementation RadioCC

- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4
{
  return [(RadioCC *)self initWithRunLoopAndParams:a3 withMitigationType:4 withParams:a4];
}

- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withMitigationType:(int)a4 withParams:(__CFDictionary *)a5
{
  uint64_t v6 = *(void *)&a4;
  v15.receiver = self;
  v15.super_class = (Class)RadioCC;
  v8 = [(ComponentControl *)&v15 initWithCC:*(void *)&a4 :a5];
  v9 = v8;
  if (!v8) {
    return (RadioCC *)v9;
  }
  *((_DWORD *)v8 + 45) = -1;
  *(void *)(v8 + 148) = dispatch_queue_create("com.apple.ThermalMonitor.radio", 0);
  *(void *)(v9 + 164) = a3;
  if (a5 && CFDictionaryContainsKey(a5, @"componentNameDetail"))
  {
    Value = CFDictionaryGetValue(a5, @"componentNameDetail");
    if (!Value)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100056B58();
      }
      goto LABEL_8;
    }
    CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%d Radio%@", v6, Value);
  }
  else
  {
    CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%d Radio", v6);
  }
  *((void *)v9 + 6) = v11;
LABEL_8:
  *(void *)(v9 + 140) = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v12 = *(NSObject **)(v9 + 148);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ACC8;
  block[3] = &unk_100085248;
  block[4] = v9;
  dispatch_async(v12, block);
  if (notify_register_check("com.apple.cltm.radioNotification", (int *)v9 + 44))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056B24();
    }
  }
  else
  {
    [v9 sendRadioNotification];
  }
  [v9 updatePowerParameters:a5];
  if (sub_100037D8C(a5, @"expectsCPMSSupport", 0)) {
    [v9 setCPMSMitigationState:1];
  }
  return (RadioCC *)v9;
}

- (void)dealloc
{
  v3 = *(const void **)(&self->super.currentPower + 1);
  if (v3) {
    CFRelease(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)RadioCC;
  [(PidComponent *)&v4 dealloc];
}

- (void)defaultAction
{
  if (dword_1000A2448 != self->super.previousValue)
  {
    [(RadioCC *)self calculateMitigation];
    [(RadioCC *)self setMaxTransmitPower];
    unsigned int previousValue = self->super.previousValue;
    if (previousValue - 100 <= 0xFFFFFF9C)
    {
      [(RadioCC *)self sendRadioNotification];
      unsigned int previousValue = self->super.previousValue;
    }
    dword_1000A2448 = previousValue;
  }
}

- (void)defaultCPMSAction
{
  if (self->radioNotificationToken != self->super.previousValue)
  {
    v4.receiver = self;
    v4.super_class = (Class)RadioCC;
    [(ComponentControl *)&v4 defaultCPMSAction];
    unsigned int previousValue = self->super.previousValue;
    if (previousValue - 100 <= 0xFFFFFF9C)
    {
      [(RadioCC *)self sendRadioNotification];
      unsigned int previousValue = self->super.previousValue;
    }
    self->radioNotificationToken = previousValue;
  }
}

- (void)sendRadioNotification
{
  unsigned int previousValue = self->super.previousValue;
  if (previousValue <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = previousValue;
  }
  if (notify_set_state(self->txPowerLimit, v3) && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100056BC0();
  }
  if (notify_post("com.apple.cltm.radioNotification"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056B8C();
    }
  }
}

- (void)calculateMitigation
{
  v2 = *(NSObject **)((char *)&self->radioPowerConfiguration + 4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AF70;
  block[3] = &unk_100085248;
  block[4] = self;
  dispatch_async(v2, block);
}

- (void)createServerConnection
{
  uint64_t v3 = *(OS_dispatch_queue **)((char *)&self->radioQueue + 4);
  if (v3) {
    CFRelease(v3);
  }
  objc_super v4 = (OS_dispatch_queue *)_CTServerConnectionCreateWithIdentifier();
  *(OS_dispatch_queue **)((char *)&self->radioQueue + 4) = v4;
  if (v4)
  {
    if (byte_1000AA7A0)
    {
      v5 = v4;
      uint64_t v6 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> CT connection %p", buf, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100056C6C();
  }
  _CTServerConnectionAddToRunLoop();
  uint64_t v7 = kCTDaemonReadyNotification;
  if (_CTServerConnectionRegisterForNotification())
  {
    v8 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056BF4(v7, v8);
    }
  }
}

- (void)createConnectionToCT
{
  if (![(ComponentControl *)self isCPMSControlEnabled])
  {
    [(RadioCC *)self createServerConnection];
    [(RadioCC *)self initializeRadio];
  }
}

- (void)initializeRadio
{
  if (_CTServerConnectionSetMaxTemperature())
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100056D18();
    }
  }
  else
  {
    [(RadioCC *)self setMaxTransmitPower];
  }
}

- (void)setMaxTransmitPower
{
  v2 = *(NSObject **)((char *)&self->radioPowerConfiguration + 4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B374;
  block[3] = &unk_100085248;
  block[4] = self;
  dispatch_async(v2, block);
}

- (void)addRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100056DF0();
  }
}

- (void)calculateAdditionalRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100056DF0();
  }
}

- (void)setAdditionalRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100056DF0();
  }
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RadioCC;
  [(ComponentControl *)&v4 setCPMSMitigationState:a3];
  [(RadioCC *)self createConnectionToCT];
}

- (int)numberOfFields
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)RadioCC;
    return [(ComponentControl *)&v5 numberOfFields];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)RadioCC;
    return [(ComponentControl *)&v4 numberOfFields] + 1;
  }
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RadioCC;
  if ([(ComponentControl *)&v8 numberOfFields] > a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioCC;
    return [(ComponentControl *)&v7 copyHeaderForIndex:v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioCC;
    if ([(ComponentControl *)&v6 numberOfFields] == v3) {
      return @"Radio - txPowerLimit/10";
    }
    else {
      return 0;
    }
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RadioCC;
  if ([(ComponentControl *)&v8 numberOfFields] > a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)RadioCC;
    return [(ComponentControl *)&v7 copyFieldCurrentValueForIndex:v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioCC;
    if ([(ComponentControl *)&v6 numberOfFields] == v3) {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", (SHIDWORD(self->runLoop) / 10));
    }
    else {
      return 0;
    }
  }
}

@end