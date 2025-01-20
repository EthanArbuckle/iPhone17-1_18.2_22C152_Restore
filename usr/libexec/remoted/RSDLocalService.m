@interface RSDLocalService
- ($C55F4281ED4D80276654548F1B6959F4)getTcpOptions;
- (BOOL)is_exposed_to_untrusted_devices;
- (BOOL)is_exposed_to_untrusted_devices_internal;
- (BOOL)is_exposed_to_untrusted_devices_presetup;
- (BOOL)setExposePolicy:(id)a3;
- (BOOL)shouldBeExposedToDevice:(id)a3;
- (NSArray)limit_load_from_device_types;
- (NSArray)limit_load_to_device_types;
- (OS_xpc_object)properties;
- (RSDLocalService)initWithServiceEntryNamed:(const char *)a3;
- (RSDLocalService)initWithToken:(unint64_t)a3 name:(char *)a4 event:(id)a5;
- (char)entitlement;
- (char)name;
- (id)copyServiceDescription;
- (int)legacy_port;
- (unint64_t)token;
- (void)dealloc;
- (void)fireDevice:(id)a3 fd:(int)a4;
- (void)setEntitlement:(char *)a3;
- (void)setIs_exposed_to_untrusted_devices:(BOOL)a3;
- (void)setIs_exposed_to_untrusted_devices_internal:(BOOL)a3;
- (void)setIs_exposed_to_untrusted_devices_presetup:(BOOL)a3;
- (void)setLegacy_port:(int)a3;
- (void)setLimit_load_from_device_types:(id)a3;
- (void)setLimit_load_to_device_types:(id)a3;
- (void)setName:(char *)a3;
- (void)setProperties:(id)a3;
- (void)setToken:(unint64_t)a3;
@end

@implementation RSDLocalService

- (RSDLocalService)initWithToken:(unint64_t)a3 name:(char *)a4 event:(id)a5
{
  id v8 = a5;
  v9 = [(RSDLocalService *)self init];
  v10 = v9;
  if (!v9)
  {
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  [(RSDLocalService *)v9 setToken:a3];
  [(RSDLocalService *)v10 setName:strdup(a4)];
  string = xpc_dictionary_get_string(v8, "RequireEntitlement");
  if (!string)
  {
    v15 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_100033660((uint64_t)a4, v15, v16);
    }
    goto LABEL_12;
  }
  [(RSDLocalService *)v10 setEntitlement:strdup(string)];
  if (![(RSDLocalService *)v10 setExposePolicy:v8])
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_1000336E4();
    }
    goto LABEL_12;
  }
  v12 = xpc_dictionary_get_value(v8, "ServiceProperties");
  v13 = v12;
  if (v12 && xpc_get_type(v12) == (xpc_type_t)&_xpc_type_dictionary) {
    [(RSDLocalService *)v10 setProperties:v13];
  }
  v14 = v10;

LABEL_13:
  return v14;
}

- ($C55F4281ED4D80276654548F1B6959F4)getTcpOptions
{
  retstr->var4 = 8;
  *(_OWORD *)&retstr->var0 = xmmword_100044DA8;
  v5 = [(RSDLocalService *)self properties];

  if (v5)
  {
    v7 = [(RSDLocalService *)self properties];
    xpc_dictionary_get_dictionary(v7, "TcpOptions");
    xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

    id v8 = xdict;
    if (xdict)
    {
      v9 = xpc_dictionary_get_value(xdict, "KeepAlive");
      v10 = v9;
      if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_BOOL) {
        retstr->var0 = xpc_BOOL_get_value(v10);
      }
      uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "KeepAliveTime");
      if (uint64) {
        retstr->var1 = uint64;
      }
      uint64_t v12 = xpc_dictionary_get_uint64(xdict, "KeepCount");
      if (v12) {
        retstr->var2 = v12;
      }
      uint64_t v13 = xpc_dictionary_get_uint64(xdict, "KeepInterval");
      if (v13) {
        retstr->var3 = v13;
      }
      uint64_t v14 = xpc_dictionary_get_uint64(xdict, "ConnectTimeout");
      if (v14) {
        retstr->var4 = v14;
      }

      id v8 = xdict;
    }
  }
  return result;
}

- (RSDLocalService)initWithServiceEntryNamed:(const char *)a3
{
  v4 = [(RSDLocalService *)self init];
  if (v4 && (v5 = getservbyname(a3, "tcp")) != 0)
  {
    [(RSDLocalService *)v4 setLegacy_port:bswap32(LOWORD(v5->s_port)) >> 16];
    [(RSDLocalService *)v4 setName:strdup(a3)];
    [(RSDLocalService *)v4 setEntitlement:strdup("AppleInternal")];
    keys = "Legacy";
    xpc_object_t values = &_xpc_BOOL_true;
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
    [(RSDLocalService *)v4 setProperties:v6];

    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)fireDevice:(id)a3 fd:(int)a4
{
  id v8 = a3;
  if (a4 == -1) {
    sub_10003374C(&v9, v10);
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_fd(v6, "fd", a4);
  id v7 = [v8 copyClientDescriptionWithSensitiveProperties:0];
  xpc_dictionary_set_value(v6, "device", v7);

  [(RSDLocalService *)self token];
  xpc_event_publisher_fire();
}

- (BOOL)shouldBeExposedToDevice:(id)a3
{
  id v4 = a3;
  v5 = [(RSDLocalService *)self limit_load_to_device_types];
  if (!v5) {
    goto LABEL_44;
  }
  xpc_object_t v6 = [(RSDLocalService *)self limit_load_to_device_types];
  id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 type]);
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
LABEL_44:
    uint64_t v9 = [(RSDLocalService *)self limit_load_from_device_types];
    if (!v9) {
      goto LABEL_10;
    }
    v10 = [(RSDLocalService *)self limit_load_from_device_types];
    v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 type]);
    unsigned __int8 v12 = [v10 containsObject:v11];

    if ((v12 & 1) == 0)
    {
LABEL_10:
      if ([(RSDLocalService *)self entitlement]
        && (!strcmp([(RSDLocalService *)self entitlement], "AppleInternal")
         || !strcmp([(RSDLocalService *)self entitlement], "None-AppleInternal"))
        && (os_variant_has_internal_content() & 1) != 0
        || [(RSDLocalService *)self is_exposed_to_untrusted_devices])
      {
        goto LABEL_11;
      }
      if (![(RSDLocalService *)self is_exposed_to_untrusted_devices_presetup])goto LABEL_38; {
      int v14 = MKBGetDeviceLockState();
      }
      v15 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 67109120;
        *(_DWORD *)&v27[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MobileKeyBagState: %d", v27, 8u);
      }
      BOOL v16 = xpc_dictionary_get_BOOL((xpc_object_t)qword_10005C030, "StoreDemoMode");
      if (qword_10005BD00 != -1) {
        dispatch_once(&qword_10005BD00, &stru_100055310);
      }
      int v17 = byte_10005BCF8;
      CFBooleanRef v18 = (const __CFBoolean *)CFPreferencesCopyValue(@"SetupDone", @"com.apple.purplebuddy", @"mobile", kCFPreferencesCurrentHost);
      CFBooleanRef v19 = v18;
      if (v18)
      {
        BOOL v20 = CFBooleanGetValue(v18) != 0;
        CFRelease(v19);
      }
      else
      {
        BOOL v20 = 0;
      }
      v21 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG))
      {
        v22 = "no";
        if (v17) {
          v23 = "yes";
        }
        else {
          v23 = "no";
        }
        if (v16) {
          v24 = "yes";
        }
        else {
          v24 = "no";
        }
        *(_DWORD *)v27 = 136315906;
        *(void *)&v27[4] = v23;
        if (v14 == 3) {
          v25 = "yes";
        }
        else {
          v25 = "no";
        }
        *(_WORD *)&v27[12] = 2080;
        *(void *)&v27[14] = v24;
        *(_WORD *)&v27[22] = 2080;
        v28 = v25;
        if (v20) {
          v22 = "yes";
        }
        __int16 v29 = 2080;
        v30 = v22;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "setup status:\n\tin diagnostics mode: %s\n\tin store demo mode: %s\n\tno passcode set: %s\n\tbuddy is done: %s\n", v27, 0x2Au);
        if (!v17)
        {
LABEL_22:
          if (v14 == 3)
          {
            if (v20 && !v16) {
              goto LABEL_38;
            }
LABEL_11:
            unsigned __int8 v13 = 1;
            goto LABEL_41;
          }
        }
      }
      else if (!v17)
      {
        goto LABEL_22;
      }
      if (v17) {
        goto LABEL_11;
      }
LABEL_38:
      if (![(RSDLocalService *)self is_exposed_to_untrusted_devices_internal]|| (os_variant_allows_internal_security_policies() & 1) == 0)
      {
        unsigned __int8 v13 = [v4 isTrusted];
        goto LABEL_41;
      }
      goto LABEL_11;
    }
  }
  unsigned __int8 v13 = 0;
LABEL_41:

  return v13;
}

- (id)copyServiceDescription
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if ([(RSDLocalService *)self entitlement])
  {
    if (!strcmp([(RSDLocalService *)self entitlement], "None-AppleInternal"))
    {
      xpc_dictionary_set_string(v3, "EntitlementOverride", "None-AppleInternal");
      id v4 = "AppleInternal";
    }
    else
    {
      id v4 = [(RSDLocalService *)self entitlement];
    }
    xpc_dictionary_set_string(v3, "Entitlement", v4);
  }
  v5 = [(RSDLocalService *)self properties];

  if (v5)
  {
    xpc_object_t v6 = [(RSDLocalService *)self properties];
    xpc_dictionary_set_value(v3, "Properties", v6);
  }
  if ([(RSDLocalService *)self legacy_port])
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v7;
    long long v10 = v7;
    snprintf(__str, 0x20uLL, "%d", [(RSDLocalService *)self legacy_port]);
    xpc_dictionary_set_string(v3, "Port", __str);
  }
  return v3;
}

- (BOOL)setExposePolicy:(id)a3
{
  id v4 = a3;
  v5 = xpc_dictionary_get_value(v4, "LimitExposedToDeviceType");
  uint64_t v6 = xpc_dictionary_get_value(v4, "LimitExposedFromDeviceType");
  long long v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = v8;
  if (!v8)
  {
    v15 = (void *)qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_100033858(v15, self);
    }
    goto LABEL_23;
  }
  [(RSDLocalService *)self setIs_exposed_to_untrusted_devices_presetup:xpc_dictionary_get_BOOL(v4, "ExposedToUntrustedDevicesPreSetup")];
  long long v10 = xpc_dictionary_get_value(v4, "ExposedToUntrustedDevices");
  v11 = v10;
  if (v10)
  {
    xpc_type_t type = xpc_get_type(v10);
    if (type == (xpc_type_t)&_xpc_type_BOOL)
    {
      [(RSDLocalService *)self setIs_exposed_to_untrusted_devices:xpc_BOOL_get_value(v11)];
    }
    else
    {
      unsigned __int8 v13 = type;
      if (type == (xpc_type_t)&_xpc_type_array)
      {
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = sub_100006F20;
        applier[3] = &unk_100055080;
        applier[4] = self;
        xpc_array_apply(v11, applier);
        if (!v5) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      int v14 = (void *)qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
      {
        sub_1000337B8(v14, self, v13);
        if (!v5) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
  }
  if (v5)
  {
LABEL_19:
    int v17 = sub_100006FE8((uint64_t)[(RSDLocalService *)self name], v5);
    [(RSDLocalService *)self setLimit_load_to_device_types:v17];
  }
LABEL_20:
  if (v7)
  {
    CFBooleanRef v18 = sub_100006FE8((uint64_t)[(RSDLocalService *)self name], v7);
    [(RSDLocalService *)self setLimit_load_from_device_types:v18];
  }
LABEL_23:

  return v9;
}

- (void)dealloc
{
  free(self->_name);
  free(self->_entitlement);
  v3.receiver = self;
  v3.super_class = (Class)RSDLocalService;
  [(RSDLocalService *)&v3 dealloc];
}

- (int)legacy_port
{
  return self->_legacy_port;
}

- (void)setLegacy_port:(int)a3
{
  self->_legacy_port = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (char)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(char *)a3
{
  self->_entitlement = a3;
}

- (OS_xpc_object)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (BOOL)is_exposed_to_untrusted_devices
{
  return self->_is_exposed_to_untrusted_devices;
}

- (void)setIs_exposed_to_untrusted_devices:(BOOL)a3
{
  self->_is_exposed_to_untrusted_devices = a3;
}

- (BOOL)is_exposed_to_untrusted_devices_presetup
{
  return self->_is_exposed_to_untrusted_devices_presetup;
}

- (void)setIs_exposed_to_untrusted_devices_presetup:(BOOL)a3
{
  self->_is_exposed_to_untrusted_devices_presetup = a3;
}

- (BOOL)is_exposed_to_untrusted_devices_internal
{
  return self->_is_exposed_to_untrusted_devices_internal;
}

- (void)setIs_exposed_to_untrusted_devices_internal:(BOOL)a3
{
  self->_is_exposed_to_untrusted_devices_internal = a3;
}

- (NSArray)limit_load_to_device_types
{
  return self->_limit_load_to_device_types;
}

- (void)setLimit_load_to_device_types:(id)a3
{
}

- (NSArray)limit_load_from_device_types
{
  return self->_limit_load_from_device_types;
}

- (void)setLimit_load_from_device_types:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit_load_from_device_types, 0);
  objc_storeStrong((id *)&self->_limit_load_to_device_types, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end