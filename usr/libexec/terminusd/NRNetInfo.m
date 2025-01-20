@interface NRNetInfo
- (id)description;
- (void)dealloc;
@end

@implementation NRNetInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolverConfigs, 0);
  objc_storeStrong((id *)&self->_lastSeenDefaultIPv6Addresses, 0);
  objc_storeStrong((id *)&self->_lastSeenDefaultIPv4Addresses, 0);
  objc_storeStrong((id *)&self->_lastFetchedSendData, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_wifiSSIDData, 0);
}

- (id)description
{
  if (!_NRIsAppleInternal())
  {
    v4 = @"NRNetInfo[<redacted>]";
    goto LABEL_43;
  }
  if (self)
  {
    if (self->_isIncoming && self->_forcedUpdateIdentifier) {
      v3 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@" (forced:%u)", self->_forcedUpdateIdentifier];
    }
    else {
      v3 = &stru_1001C9648;
    }
    id v5 = objc_alloc((Class)NSMutableString);
    unsigned int version = self->_version;
    unint64_t pathStatus = self->_pathStatus;
    if (pathStatus >= 4) {
      id v8 = [objc_alloc((Class)NSString) initWithFormat:@"unknown(%u)", self->_pathStatus];
    }
    else {
      id v8 = *(&off_1001C62F0 + pathStatus);
    }
    v9 = @"other";
    switch(self->_pathInterfaceType)
    {
      case 0u:
        break;
      case 1u:
        v9 = @"wifi";
        break;
      case 2u:
        v9 = @"cellular";
        break;
      case 3u:
        v9 = @"wired";
        break;
      case 4u:
        v9 = @"loopback";
        break;
      default:
        v9 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"unknown(%u)", self->_pathInterfaceType];
        break;
    }
  }
  else
  {
    id v5 = objc_alloc((Class)NSMutableString);
    id v8 = 0;
    unsigned int version = 0;
    v9 = 0;
    v3 = &stru_1001C9648;
  }
  v4 = (__CFString *)[v5 initWithFormat:@"NRNetInfo:[v%d%@, %@, %@, ", version, v3, v8, v9];

  if (self)
  {
    unsigned int pathFlags = self->_pathFlags;
    if (pathFlags)
    {
      [(__CFString *)v4 appendString:@"dns, "];
      unsigned int pathFlags = self->_pathFlags;
      if ((pathFlags & 2) == 0)
      {
LABEL_20:
        if ((pathFlags & 4) == 0) {
          goto LABEL_21;
        }
        goto LABEL_48;
      }
    }
    else if ((pathFlags & 2) == 0)
    {
      goto LABEL_20;
    }
    [(__CFString *)v4 appendString:@"ipv4, "];
    unsigned int pathFlags = self->_pathFlags;
    if ((pathFlags & 4) == 0)
    {
LABEL_21:
      if ((pathFlags & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_49;
    }
LABEL_48:
    [(__CFString *)v4 appendString:@"ipv6, "];
    unsigned int pathFlags = self->_pathFlags;
    if ((pathFlags & 8) == 0)
    {
LABEL_22:
      if ((pathFlags & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_50;
    }
LABEL_49:
    [(__CFString *)v4 appendString:@"expensive, "];
    if ((self->_pathFlags & 0x10) == 0)
    {
LABEL_23:
      if (!self->_isImmediate)
      {
LABEL_25:
        if ((self->_pathFlags & 0x20) != 0) {
          [(__CFString *)v4 appendString:@"roaming, "];
        }
        if (*(_OWORD *)&self->_estimatedUploadThroughput != 0) {
          [(__CFString *)v4 appendFormat:@"%llu/%llu, ", self->_estimatedUploadThroughput, self->_estimatedDownloadThroughput];
        }
        [(__CFString *)v4 appendString:@"["];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        resolverConfigs = self->_resolverConfigs;
        goto LABEL_30;
      }
LABEL_24:
      [(__CFString *)v4 appendString:@"immediate, "];
      goto LABEL_25;
    }
LABEL_50:
    [(__CFString *)v4 appendString:@"constrained, "];
    if (!self->_isImmediate) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  [(__CFString *)v4 appendString:@"["];
  resolverConfigs = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
LABEL_30:
  v12 = resolverConfigs;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        [(__CFString *)v4 appendFormat:@"%@, ", *(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  [(__CFString *)v4 appendString:@"]"];
  if (self && self->_wifiSSIDData)
  {
    CFStringRef v17 = (const __CFString *)[objc_alloc((Class)NSString) initWithData:self->_wifiSSIDData encoding:4];
    v18 = (__CFString *)v17;
    CFStringRef v19 = @"<unavailable>";
    if (v17) {
      CFStringRef v19 = v17;
    }
    [(__CFString *)v4 appendFormat:@", wifi %@", v19];
  }
  [(__CFString *)v4 appendString:@"]"];

LABEL_43:

  return v4;
}

- (void)dealloc
{
  if (qword_1001F4838 != -1) {
    dispatch_once(&qword_1001F4838, &stru_1001C62D0);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4838 != -1) {
      dispatch_once(&qword_1001F4838, &stru_1001C62D0);
    }
    uint64_t v6 = 113;
    v4 = "";
    id v5 = "-[NRNetInfo dealloc]";
    _NRLogWithArgs();
  }
  if (self)
  {
    self->_invalidated = 1;
    if (self->_evaluator)
    {
      nw_path_evaluator_cancel();
      evaluator = self->_evaluator;
      self->_evaluator = 0;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)NRNetInfo;
  [(NRNetInfo *)&v7 dealloc];
}

@end