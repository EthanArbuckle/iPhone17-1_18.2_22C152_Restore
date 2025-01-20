@interface NRLinkDirectorRequest
- (NRLinkDirectorRequest)init;
- (id)description;
- (void)dealloc;
@end

@implementation NRLinkDirectorRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerDescription, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_cancelBlock, 0);

  objc_storeStrong((id *)&self->_cancelIfLinkTypeReady, 0);
}

- (void)dealloc
{
  if (qword_1001F4B50 != -1) {
    dispatch_once(&qword_1001F4B50, &stru_1001C7B78);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4B50 != -1) {
      dispatch_once(&qword_1001F4B50, &stru_1001C7B78);
    }
    uint64_t v7 = 113;
    v8 = self;
    v5 = "";
    v6 = "-[NRLinkDirectorRequest dealloc]";
    _NRLogWithArgs();
  }
  if (self)
  {
    source = self->_source;
    if (source)
    {
      dispatch_source_cancel(source);
      v4 = self->_source;
      self->_source = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)NRLinkDirectorRequest;
  [(NRLinkDirectorRequest *)&v9 dealloc];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = v3;
  if (self)
  {
    unint64_t uniqueIndex = self->_uniqueIndex;
    v6 = "Invalid";
    switch(self->_type)
    {
      case 0u:
        goto LABEL_14;
      case 1u:
        v6 = "UpdateWiFiAddress";
        goto LABEL_14;
      case 2u:
        v6 = "PreferWiFiEnable";
        goto LABEL_14;
      case 3u:
        v6 = "PreferWiFiDisable";
        goto LABEL_14;
      case 4u:
        v6 = "StopWiFi";
        goto LABEL_14;
      case 5u:
        v6 = "SuspendBluetooth";
        goto LABEL_14;
      case 6u:
        v6 = "Timer";
        goto LABEL_14;
      case 7u:
        v6 = "TimerPreferWiFiTimeout";
        goto LABEL_14;
      case 8u:
        v6 = "StopQuickRelay";
        goto LABEL_14;
      case 9u:
        v6 = "PreferWiFiAckEnable";
        goto LABEL_14;
      case 0xAu:
        v6 = "PreferWiFiAckDisable";
        goto LABEL_14;
      case 0xBu:
        v6 = "UpdateAWDLAddress";
        goto LABEL_14;
      default:
        id v8 = [v3 initWithFormat:@"[Request %llu %@", self->_uniqueIndex, @"Unknown"];
        if (!self->_requiredLinkType) {
          goto LABEL_17;
        }
        goto LABEL_16;
    }
  }
  unint64_t uniqueIndex = 0;
  v6 = "Invalid";
LABEL_14:
  id v7 = [objc_alloc((Class)NSString) initWithUTF8String:v6];
  id v8 = [v4 initWithFormat:@"[Request %llu %@", uniqueIndex, v7];

  if (self)
  {
    if (self->_requiredLinkType)
    {
LABEL_16:
      StringFromNRLinkType = (void *)createStringFromNRLinkType();
      [v8 appendFormat:@" %@", StringFromNRLinkType];
    }
LABEL_17:
    if (self->_complete) {
      v10 = "C";
    }
    else {
      v10 = "Inc";
    }
    [v8 appendFormat:@" %somplete", v10];
    if (self->_attemptImmediately) {
      [v8 appendString:@" Immediate"];
    }
    if (self->_allowsSuspendedLink) {
      [v8 appendString:@" AllowsSuspendedLink"];
    }
    if (self->_type == 6)
    {
      [v8 appendFormat:@" Timeout %llus", self->_timeout];
      if (self->_timerDescription) {
        [v8 appendFormat:@" %@", self->_timerDescription];
      }
    }
  }
  else
  {
    [v8 appendFormat:@" %somplete", @"Inc"];
  }
  [v8 appendString:@"]"];

  return v8;
}

- (NRLinkDirectorRequest)init
{
  v10.receiver = self;
  v10.super_class = (Class)NRLinkDirectorRequest;
  v2 = [(NRLinkDirectorRequest *)&v10 init];
  if (!v2)
  {
    id v6 = sub_100113118();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v8 = sub_100113118();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136446210;
    *(void *)(v9 + 4) = "-[NRLinkDirectorRequest init]";
    sub_100113118();
    _NRLogAbortWithPack();
  }
  id v3 = v2;
  v2->_requiredLinkType = 0;
  cancelIfLinkTypeReady = v2->_cancelIfLinkTypeReady;
  v2->_cancelIfLinkTypeReady = 0;

  v3->_type = 0;
  v3->_allowsSuspendedLink = 0;
  v3->_unint64_t uniqueIndex = atomic_fetch_add_explicit(&qword_1001F43D0, 1uLL, memory_order_relaxed);
  return v3;
}

@end