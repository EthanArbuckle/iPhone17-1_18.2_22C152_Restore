@interface AccessoryDetection
- (ACCConnectionInfo)fConnectionInfoProvider;
- (AccessoryDetection)initWithCallback:(AccessoryDetectionCallback)a3;
- (AccessoryDetectionCallback)fCallback;
- (NSMutableDictionary)fAccessoryEndpointList;
- (NSMutableDictionary)fConnectionInfoFilter;
- (id).cxx_construct;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)setFAccessoryEndpointList:(id)a3;
- (void)setFCallback:(AccessoryDetectionCallback)a3;
- (void)setFConnectionInfoFilter:(id)a3;
- (void)setFConnectionInfoProvider:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation AccessoryDetection

- (AccessoryDetection)initWithCallback:(AccessoryDetectionCallback)a3
{
  id detached = a3.detached;
  id attached = a3.attached;
  v31.receiver = self;
  v31.super_class = (Class)AccessoryDetection;
  v5 = [(AccessoryDetection *)&v31 init];
  if (objc_opt_class())
  {
    uint64_t v6 = [MEMORY[0x1E4F5B178] sharedInstance];
    fConnectionInfoProvider = v5->_fConnectionInfoProvider;
    v5->_fConnectionInfoProvider = (ACCConnectionInfo *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fAccessoryEndpointList = v5->_fAccessoryEndpointList;
    v5->_fAccessoryEndpointList = v8;

    v10 = _Block_copy(attached);
    id v11 = v5->_fCallback.attached;
    v5->_fCallback.id attached = v10;

    v12 = _Block_copy(detached);
    id v13 = v5->_fCallback.detached;
    v5->_fCallback.id detached = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fConnectionInfoFilter = v5->_fConnectionInfoFilter;
    v5->_fConnectionInfoFilter = v14;

    id v16 = (id)*MEMORY[0x1E4F5B150];
    v17 = (capabilities::abs *)(id)*MEMORY[0x1E4F5B160];
    v18 = (capabilities::abs *)capabilities::abs::supportsMagSafe(v17);
    int v19 = (int)v18;
    int v20 = capabilities::abs::supportsSmartConnectorAccessory(v18);
    if (v19) {
      unsigned int v21 = 8224;
    }
    else {
      unsigned int v21 = 32;
    }
    if (v19) {
      unsigned int v22 = 578;
    }
    else {
      unsigned int v22 = 66;
    }
    if (v20) {
      uint64_t v23 = v22 | 8;
    }
    else {
      uint64_t v23 = v22;
    }
    if (v20) {
      uint64_t v24 = v21 | 0x80;
    }
    else {
      uint64_t v24 = v21;
    }
    v25 = v5->_fConnectionInfoFilter;
    v26 = [NSNumber numberWithUnsignedLong:v23];
    [(NSMutableDictionary *)v25 setObject:v26 forKey:v16];

    v27 = v5->_fConnectionInfoFilter;
    v28 = [NSNumber numberWithUnsignedLong:v24];
    [(NSMutableDictionary *)v27 setObject:v28 forKey:v17];

    v29 = v5;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)start
{
  fConnectionInfoProvider = self->_fConnectionInfoProvider;
  fConnectionInfoFilter = self->_fConnectionInfoFilter;
  if (fConnectionInfoFilter && [(NSMutableDictionary *)fConnectionInfoFilter count])
  {
    v5 = self->_fConnectionInfoFilter;
    uint64_t v6 = fConnectionInfoProvider;
    v7 = self;
  }
  else
  {
    v5 = 0;
    uint64_t v6 = fConnectionInfoProvider;
    v7 = self;
  }
  [(ACCConnectionInfo *)v6 registerDelegate:v7 withFilter:v5];
}

- (void)stop
{
  [(ACCConnectionInfo *)self->_fConnectionInfoProvider registerDelegate:0];
  fAccessoryEndpointList = self->_fAccessoryEndpointList;

  [(NSMutableDictionary *)fAccessoryEndpointList removeAllObjects];
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = v13;
  id v23 = 0;
  if (v11 && v12 && v13)
  {
    id v15 = v11;
    id v25 = v15;
    id v16 = v14;
    id v24 = v16;
    uint64_t v17 = [(ACCConnectionInfo *)self->_fConnectionInfoProvider accessoryConnectionType:v16];
    if ((v9 | 2) == 7)
    {
      id v18 = [(ACCConnectionInfo *)self->_fConnectionInfoProvider accessoryInfoForEndpointSync:v15 connection:v16];
      if (!v18)
      {
LABEL_15:
        CFRelease(v16);
        CFRelease(v15);
        goto LABEL_16;
      }
    }
    else
    {
      id v18 = v12;
    }
    CFTypeRef v22 = v15;
    id v23 = v18;
    id attached = (void (**)(id, CFTypeRef *, CFTypeRef *, void, uint64_t, CFTypeRef *))self->_fCallback.attached;
    CFRetain(v15);
    CFTypeRef v21 = v16;
    CFRetain(v16);
    CFTypeRef cf = v18;
    CFRetain(v18);
    attached[2](attached, &v22, &v21, v9, v17, &cf);
    if (cf) {
      CFRelease(cf);
    }
    if (v21) {
      CFRelease(v21);
    }
    if (v22) {
      CFRelease(v22);
    }
    CFRelease(v18);
    goto LABEL_15;
  }
LABEL_16:
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = v8;
  cf[0] = v8;
  cf[1] = v8;
  id detached = (void (**)(id, CFTypeRef *))self->_fCallback.detached;
  if (v8) {
    CFRetain(v8);
  }
  detached[2](detached, cf);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (v9) {
    CFRelease(v9);
  }
}

- (ACCConnectionInfo)fConnectionInfoProvider
{
  return (ACCConnectionInfo *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFConnectionInfoProvider:(id)a3
{
}

- (AccessoryDetectionCallback)fCallback
{
  objc_copyCppObjectAtomic(v4, &self->_fCallback, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  v2 = (void *)v4[0];
  v3 = (void *)v4[1];
  result.id detached = v3;
  result.id attached = v2;
  return result;
}

- (void)setFCallback:(AccessoryDetectionCallback)a3
{
  AccessoryDetectionCallback v3 = a3;
  objc_copyCppObjectAtomic(&self->_fCallback, &v3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (NSMutableDictionary)fAccessoryEndpointList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFAccessoryEndpointList:(id)a3
{
}

- (NSMutableDictionary)fConnectionInfoFilter
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFConnectionInfoFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fConnectionInfoFilter, 0);
  objc_storeStrong((id *)&self->_fAccessoryEndpointList, 0);

  objc_storeStrong((id *)&self->_fConnectionInfoProvider, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end