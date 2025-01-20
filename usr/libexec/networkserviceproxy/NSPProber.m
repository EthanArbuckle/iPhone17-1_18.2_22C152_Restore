@interface NSPProber
+ (BOOL)supportsSecureCoding;
- (NSPProber)initWithCoder:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPProber

- (NSString)description
{
  if (self)
  {
    id v3 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
    sub_1000482D4(v3, self->_name, @"Probe", 0, 14);
    sub_100048B1C(v3, self->_probingActive, @"Probing active", 0, 14);
    sub_100048B88(v3, self->_probeCount, @"Probe count", 0, 14);
    sub_100048B88(v3, self->_probeSuccessCount, @"Probe success count", 0, 14);
    sub_100048B88(v3, self->_probeFailedCount, @"Probe failed count", 0, 14);
    sub_100048B88(v3, self->_probeRedirectedCount, @"Probe redirected count", 0, 14);
    sub_100048B88(v3, self->_probeServerErrorCount, @"Probe server error count", 0, 14);
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSPProber)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSPProber;
  v5 = [(NSPProber *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proberName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_proxyProber = [v4 decodeBoolForKey:@"proberProxy"];
    v5->_probeCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeCount"];
    v5->_probeConnectionTimeout = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeConnectionTimeout"];
    v5->_probingActive = [v4 decodeBoolForKey:@"proberProbeActiveCount"];
    v5->_probeOnNetworkChange = [v4 decodeBoolForKey:@"proberProbeOnNetworkChange"];
    v5->_linkQuality = [v4 decodeIntForKey:@"proberLinkQuality"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proberNextProbeDate"];
    nextProbeDate = v5->_nextProbeDate;
    v5->_nextProbeDate = (NSDate *)v8;

    v5->_probeSuccessCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeSuccessCount"];
    v5->_probeFailedCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeFailedCount"];
    v5->_probeRedirectedCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeRedirectedCount"];
    v5->_probeServerErrorCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeServerErrorCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeObject:self->_name forKey:@"proberName"];
    [v5 encodeBool:self->_proxyProber forKey:@"proberProxy"];
    [v5 encodeInteger:self->_probeCount forKey:@"proberProbeCount"];
    [v5 encodeInteger:self->_probeConnectionTimeout forKey:@"proberProbeConnectionTimeout"];
    [v5 encodeBool:self->_probingActive forKey:@"proberProbeActiveCount"];
    [v5 encodeBool:self->_probeOnNetworkChange forKey:@"proberProbeOnNetworkChange"];
    [v5 encodeInt:self->_linkQuality forKey:@"proberLinkQuality"];
    [v5 encodeObject:self->_nextProbeDate forKey:@"proberNextProbeDate"];
    [v5 encodeInteger:self->_probeSuccessCount forKey:@"proberProbeSuccessCount"];
    [v5 encodeInteger:self->_probeFailedCount forKey:@"proberProbeFailedCount"];
    [v5 encodeInteger:self->_probeRedirectedCount forKey:@"proberProbeRedirectedCount"];
    unint64_t probeServerErrorCount = self->_probeServerErrorCount;
  }
  else
  {
    [v5 encodeObject:0 forKey:@"proberName"];
    [v5 encodeBool:0 forKey:@"proberProxy"];
    [v5 encodeInteger:0 forKey:@"proberProbeCount"];
    [v5 encodeInteger:0 forKey:@"proberProbeConnectionTimeout"];
    [v5 encodeBool:0 forKey:@"proberProbeActiveCount"];
    [v5 encodeBool:0 forKey:@"proberProbeOnNetworkChange"];
    [v5 encodeInt:0 forKey:@"proberLinkQuality"];
    [v5 encodeObject:0 forKey:@"proberNextProbeDate"];
    [v5 encodeInteger:0 forKey:@"proberProbeSuccessCount"];
    [v5 encodeInteger:0 forKey:@"proberProbeFailedCount"];
    [v5 encodeInteger:0 forKey:@"proberProbeRedirectedCount"];
    unint64_t probeServerErrorCount = 0;
  }
  [v5 encodeInteger:probeServerErrorCount forKey:@"proberProbeServerErrorCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPProber allocWithZone:a3] init];
  uint64_t v5 = (uint64_t)v4;
  if (self)
  {
    sub_10001088C((uint64_t)v4, self->_name);
    BOOL proxyProber = self->_proxyProber;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  sub_10001088C((uint64_t)v4, 0);
  BOOL proxyProber = 0;
  if (v5) {
LABEL_3:
  }
    *(unsigned char *)(v5 + 11) = proxyProber;
LABEL_4:
  if (self)
  {
    sub_100022CA0(v5, self->_probeSession);
    sub_10001089C(v5, self->_dataTask);
    sub_1000090C8(v5, self->_operationQueue);
    sub_1000108AC(v5, self->_probeRetryTimer);
    unint64_t probeCount = self->_probeCount;
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  sub_100022CA0(v5, 0);
  sub_10001089C(v5, 0);
  sub_1000090C8(v5, 0);
  sub_1000108AC(v5, 0);
  unint64_t probeCount = 0;
  if (v5) {
LABEL_6:
  }
    *(void *)(v5 + 64) = probeCount;
LABEL_7:
  if (self)
  {
    unint64_t probeConnectionTimeout = self->_probeConnectionTimeout;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  unint64_t probeConnectionTimeout = 0;
  if (v5) {
LABEL_9:
  }
    *(void *)(v5 + 72) = probeConnectionTimeout;
LABEL_10:
  if (self)
  {
    BOOL probingActive = self->_probingActive;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL probingActive = 0;
  if (v5) {
LABEL_12:
  }
    *(unsigned char *)(v5 + 8) = probingActive;
LABEL_13:
  if (self)
  {
    BOOL probeOnNetworkChange = self->_probeOnNetworkChange;
    if (!v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  BOOL probeOnNetworkChange = 0;
  if (v5) {
LABEL_15:
  }
    *(unsigned char *)(v5 + 9) = probeOnNetworkChange;
LABEL_16:
  if (self)
  {
    int linkQuality = self->_linkQuality;
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  int linkQuality = 0;
  if (v5) {
LABEL_18:
  }
    *(_DWORD *)(v5 + 12) = linkQuality;
LABEL_19:
  if (self)
  {
    sub_10000EF7C(v5, self->_nextProbeDate);
    path = self->_path;
    if (!v5) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  sub_10000EF7C(v5, 0);
  path = 0;
  if (v5) {
LABEL_21:
  }
    objc_storeStrong((id *)(v5 + 88), path);
LABEL_22:
  if (self)
  {
    BOOL probePending = self->_probePending;
    if (!v5) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  BOOL probePending = 0;
  if (v5) {
LABEL_24:
  }
    *(unsigned char *)(v5 + 10) = probePending;
LABEL_25:
  if (self)
  {
    unint64_t probeSuccessCount = self->_probeSuccessCount;
    if (!v5) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  unint64_t probeSuccessCount = 0;
  if (v5) {
LABEL_27:
  }
    *(void *)(v5 + 96) = probeSuccessCount;
LABEL_28:
  if (self)
  {
    unint64_t probeFailedCount = self->_probeFailedCount;
    if (!v5) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  unint64_t probeFailedCount = 0;
  if (v5) {
LABEL_30:
  }
    *(void *)(v5 + 104) = probeFailedCount;
LABEL_31:
  if (self)
  {
    unint64_t probeRedirectedCount = self->_probeRedirectedCount;
    if (!v5) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  unint64_t probeRedirectedCount = 0;
  if (v5) {
LABEL_33:
  }
    *(void *)(v5 + 112) = probeRedirectedCount;
LABEL_34:
  if (!self)
  {
    unint64_t probeServerErrorCount = 0;
    if (!v5) {
      return (id)v5;
    }
    goto LABEL_36;
  }
  unint64_t probeServerErrorCount = self->_probeServerErrorCount;
  if (v5) {
LABEL_36:
  }
    *(void *)(v5 + 120) = probeServerErrorCount;
  return (id)v5;
}

- (void)dealloc
{
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      name = self->_name;
    }
    else {
      name = 0;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = name;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc %@ prober", buf, 0xCu);
  }

  sub_1000239A8((uint64_t)self);
  if (self)
  {
    probeSession = self->_probeSession;
    if (probeSession)
    {
      [(NSURLSession *)probeSession invalidateAndCancel];
      sub_100022CA0((uint64_t)self, 0);
    }
  }
  sub_1000090C8((uint64_t)self, 0);
  sub_10001089C((uint64_t)self, 0);
  v6.receiver = self;
  v6.super_class = (Class)NSPProber;
  [(NSPProber *)&v6 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_nextProbeDate, 0);
  objc_storeStrong((id *)&self->_probeRetryTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_probeSession, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end