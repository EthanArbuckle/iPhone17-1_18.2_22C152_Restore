@interface OTDeviceInformationActualAdapter
- (BOOL)isAppleTV;
- (BOOL)isHomePod;
- (BOOL)isMachineIDOverridden;
- (BOOL)isWatch;
- (CKKSListenerCollection)deviceNameUpdateListeners;
- (NSString)overriddenMachineID;
- (__SCDynamicStore)store;
- (id)deviceName;
- (id)modelID;
- (id)osVersion;
- (id)serialNumber;
- (void)clearOverride;
- (void)dealloc;
- (void)registerForDeviceNameUpdates:(id)a3;
- (void)setDeviceNameUpdateListeners:(id)a3;
- (void)setOverriddenMachineID:(id)a3;
- (void)setOverrideMachineID:(id)a3;
- (void)setStore:(__SCDynamicStore *)a3;
- (void)setupDeviceNameListener;
@end

@implementation OTDeviceInformationActualAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenMachineID, 0);

  objc_storeStrong((id *)&self->_deviceNameUpdateListeners, 0);
}

- (void)setOverriddenMachineID:(id)a3
{
}

- (NSString)overriddenMachineID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStore:(__SCDynamicStore *)a3
{
  self->_store = a3;
}

- (__SCDynamicStore)store
{
  return self->_store;
}

- (void)setDeviceNameUpdateListeners:(id)a3
{
}

- (CKKSListenerCollection)deviceNameUpdateListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setupDeviceNameListener
{
  v3 = [(OTDeviceInformationActualAdapter *)self deviceNameUpdateListeners];

  if (!v3)
  {
    v4 = [[CKKSListenerCollection alloc] initWithName:@"OTDeviceInformationActualAdapter"];
    [(OTDeviceInformationActualAdapter *)self setDeviceNameUpdateListeners:v4];

    CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(0);
    if (ComputerName)
    {
      CFStringRef v6 = ComputerName;
      CFStringRef v11 = ComputerName;
      CFArrayRef v7 = +[NSArray arrayWithObjects:&v11 count:1];
      CFRelease(v6);
      v10.version = 0;
      memset(&v10.retain, 0, 24);
      v10.info = self;
      [(OTDeviceInformationActualAdapter *)self setStore:SCDynamicStoreCreate(0, @"OTDeviceInformationActualAdapter", (SCDynamicStoreCallBack)sub_100006B00, &v10)];
      if ([(OTDeviceInformationActualAdapter *)self store])
      {
        SCDynamicStoreSetNotificationKeys([(OTDeviceInformationActualAdapter *)self store], v7, 0);
        v8 = [(OTDeviceInformationActualAdapter *)self store];
        v9 = dispatch_get_global_queue(0, 0);
        SCDynamicStoreSetDispatchQueue(v8, v9);
      }
    }
  }
}

- (BOOL)isWatch
{
  return 0;
}

- (BOOL)isAppleTV
{
  return 0;
}

- (BOOL)isHomePod
{
  return 0;
}

- (id)serialNumber
{
  v2 = (void *)MGCopyAnswerWithError();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = secLogObjForScope();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "failed getting serial number: %d", buf, 8u);
    }

    v2 = 0;
  }

  return v2;
}

- (id)osVersion
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[14] = v2;
  long long v15 = v2;
  v14[12] = v2;
  v14[13] = v2;
  v14[10] = v2;
  v14[11] = v2;
  v14[8] = v2;
  v14[9] = v2;
  v14[6] = v2;
  v14[7] = v2;
  v14[4] = v2;
  v14[5] = v2;
  v14[2] = v2;
  v14[3] = v2;
  v14[0] = v2;
  v14[1] = v2;
  size_t v11 = 256;
  int v3 = sysctlbyname("kern.osrelease", v14, &v11, 0, 0);
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[14] = v4;
  long long v13 = v4;
  v12[12] = v4;
  v12[13] = v4;
  v12[10] = v4;
  v12[11] = v4;
  v12[8] = v4;
  v12[9] = v4;
  v12[6] = v4;
  v12[7] = v4;
  v12[4] = v4;
  v12[5] = v4;
  v12[2] = v4;
  v12[3] = v4;
  v12[0] = v4;
  v12[1] = v4;
  size_t v10 = 256;
  if (sysctlbyname("kern.osversion", v12, &v10, 0, 0) | v3
    || (HIBYTE(v15) = 0,
        HIBYTE(v13) = 0,
        +[NSString stringWithFormat:@"%s (%s)", v14, v12],
        (CFArrayRef v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = +[NSProcessInfo processInfo];
    int v6 = [v5 operatingSystemVersionString];

    CFArrayRef v7 = [v6 stringByReplacingOccurrencesOfString:@"Version" withString:&stru_10000C830];
  }
  v8 = +[NSString stringWithFormat:@"%@ %@", @"iphone", v7];

  return v8;
}

- (void)registerForDeviceNameUpdates:(id)a3
{
  id v6 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    long long v4 = self;
    objc_sync_enter(v4);
    [(OTDeviceInformationActualAdapter *)v4 setupDeviceNameListener];
    v5 = [(OTDeviceInformationActualAdapter *)v4 deviceNameUpdateListeners];
    [v5 registerListener:v6];

    objc_sync_exit(v4);
  }
}

- (id)deviceName
{
  if (os_variant_allows_internal_security_policies()) {
    long long v2 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
  }
  else {
    long long v2 = 0;
  }

  return v2;
}

- (id)modelID
{
  if (qword_100011818 != -1) {
    dispatch_once(&qword_100011818, &stru_10000C548);
  }
  long long v2 = (void *)qword_100011810;

  return v2;
}

- (void)clearOverride
{
}

- (BOOL)isMachineIDOverridden
{
  long long v2 = [(OTDeviceInformationActualAdapter *)self overriddenMachineID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setOverrideMachineID:(id)a3
{
}

- (void)dealloc
{
  if ([(OTDeviceInformationActualAdapter *)self store])
  {
    CFRelease([(OTDeviceInformationActualAdapter *)self store]);
    [(OTDeviceInformationActualAdapter *)self setStore:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)OTDeviceInformationActualAdapter;
  [(OTDeviceInformationActualAdapter *)&v3 dealloc];
}

@end