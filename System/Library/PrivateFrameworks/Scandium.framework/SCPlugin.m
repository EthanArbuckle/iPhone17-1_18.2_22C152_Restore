@interface SCPlugin
+ (void)createCOMObject;
- (SCPlugin)init;
- (void)checkRefCounts;
- (void)dealloc;
@end

@implementation SCPlugin

+ (void)createCOMObject
{
  v2 = sc_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_25BA34000, v2, OS_LOG_TYPE_INFO, "+[SCPlugin createCOMObject]", v6, 2u);
  }

  v3 = (char *)objc_opt_new();
  if (v3) {
    v4 = v3 + 88;
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (SCPlugin)init
{
  v3 = sc_get_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25BA34000, v3, OS_LOG_TYPE_DEFAULT, "[SCPlugin init]", buf, 2u);
  }

  v10.receiver = self;
  v10.super_class = (Class)SCPlugin;
  v4 = [(SCPlugin *)&v10 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  v4->_hidServicePtr = &v4->_hidService;
  v4->_cfPlugIn._reserved = v4;
  v4->_cfPlugIn.QueryInterface = (HRESULT (__cdecl *)(void *, REFIID, LPVOID *))query_interface;
  v4->_cfPlugIn.AddRef = (ULONG (__cdecl *)(void *))cfplugin_add_ref;
  v4->_cfPlugIn.Release = (ULONG (__cdecl *)(void *))cfplugin_release;
  *(_DWORD *)&v4->_cfPlugIn.version = 1;
  v4->_cfPlugIn.Probe = (IOReturn (__cdecl *)(void *, CFDictionaryRef, io_service_t, SInt32 *))cfplugin_probe;
  v4->_cfPlugIn.Start = (IOReturn (__cdecl *)(void *, CFDictionaryRef, io_service_t))cfplugin_start;
  v4->_cfPlugIn.Stop = (IOReturn (__cdecl *)(void *))cfplugin_stop;
  v4->_cfPlugInPtr = &v4->_cfPlugIn;
  v4->_hidService._reserved = v4;
  v4->_hidService.QueryInterface = query_interface;
  v4->_hidService.AddRef = hid_service_add_ref;
  v4->_hidService.Release = hid_service_release;
  v4->_hidService.open = hid_service_open;
  v4->_hidService.close = hid_service_close;
  v4->_hidService.copyProperty = hid_service_copy_property;
  v4->_hidService.setProperty = hid_service_set_property;
  v4->_hidService.setEventCallback = hid_service_set_event_callback;
  v4->_hidService.scheduleWithDispatchQueue = hid_service_schedule;
  v4->_hidService.unscheduleFromDispatchQueue = hid_service_unschedule;
  v4->_hidService.copyEvent = hid_service_copy_event;
  v4->_hidService.setOutputEvent = hid_service_set_output_event;
  v4->_iUnknownRefCount = 0;
  *(void *)&v4->_cfPlugInRefCount = 1;
  uint64_t v6 = objc_opt_new();
  properties = v5->_properties;
  v5->_properties = (NSMutableDictionary *)v6;

  if (v5->_properties)
  {
    objc_storeStrong((id *)&v5->_circularReferenceToSelf, v5);
    v8 = v5;
  }
  else
  {
LABEL_6:
    v8 = 0;
  }

  return v8;
}

- (void)checkRefCounts
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = a1[53];
  int v2 = a1[54];
  int v4 = a1[52];
  int v5 = 136315906;
  uint64_t v6 = "-[SCPlugin checkRefCounts]";
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 1024;
  int v12 = v3;
  _os_log_debug_impl(&dword_25BA34000, a2, OS_LOG_TYPE_DEBUG, "%s : _iUnknownRefCount=%u _cfPlugInRefCount=%u _hidServiceRefCount=%u", (uint8_t *)&v5, 0x1Eu);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = sc_get_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[SCPlugin dealloc]";
    _os_log_impl(&dword_25BA34000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)SCPlugin;
  [(SCPlugin *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_circularReferenceToSelf, 0);
}

@end