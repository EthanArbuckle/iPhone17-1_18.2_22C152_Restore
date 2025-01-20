@interface ADBundleSession
+ (void)initialize;
- (NSNumber)adamID;
- (NSString)bundleID;
- (NSString)bundleVers;
- (NSString)shortVers;
- (id)copyBasicInfoSinceLastCheckAsXpcObject;
- (id)description;
- (id)initBundle:(id)a3;
- (void)dealloc;
- (void)setAdamID:(id)a3;
- (void)updateState:(unsigned int)a3 at:(double)a4 fromPid:(int)a5;
@end

@implementation ADBundleSession

- (void)updateState:(unsigned int)a3 at:(double)a4 fromPid:(int)a5
{
  uint64_t v7 = *(void *)&a3;
  unsigned int state = self->appstate.state;
  if (a5 && state == 1)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    memset(buffer, 0, sizeof(buffer));
    if (!proc_pid_rusage(a5, 0, buffer)) {
      uuid_copy(self->appstate.uuid, (const unsigned __int8 *)buffer);
    }
    size_t size = 0;
    *(void *)v31 = 0xE00000001;
    int v32 = 1;
    int v33 = a5;
    if ((sysctl(v31, 4u, 0, &size, 0, 0) & 0x80000000) == 0)
    {
      v10 = malloc_type_malloc(size, 0xE870DA36uLL);
      if (v10)
      {
        v11 = v10;
        if ((sysctl(v31, 4u, v10, &size, 0, 0) & 0x80000000) == 0)
        {
          if ((v11[8] & 4) != 0) {
            int v12 = 2;
          }
          else {
            int v12 = 1;
          }
          self->appstate.arch = v12;
        }
        free(v11);
      }
    }
    unsigned int state = self->appstate.state;
  }
  if (state != v7)
  {
    v13 = gADEventListenerLogObject;
    if (os_log_type_enabled((os_log_t)gADEventListenerLogObject, OS_LOG_TYPE_DEBUG))
    {
      v21 = [(ADBundleSession *)self bundleID];
      id v22 = objc_msgSend((id)qword_5078, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->appstate.state));
      id v23 = objc_msgSend((id)qword_5078, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
      LODWORD(buffer[0]) = 138413058;
      *(rusage_info_t *)((char *)buffer + 4) = v21;
      WORD2(buffer[1]) = 1024;
      *(_DWORD *)((char *)&buffer[1] + 6) = a5;
      WORD1(buffer[2]) = 2112;
      *(rusage_info_t *)((char *)&buffer[2] + 4) = v22;
      WORD2(buffer[3]) = 2112;
      *(rusage_info_t *)((char *)&buffer[3] + 6) = v23;
      _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "AppStateChange: %@ (%d) %@ => %@", (uint8_t *)buffer, 0x26u);
    }
    if (v7 == 8)
    {
      if (self->appstate.state == 1)
      {
        objc_msgSend(@"appLaunchCount.", "stringByAppendingString:", -[ADBundleSession bundleID](self, "bundleID"));
        ADClientAddValueForScalarKey();
      }
      v14 = @"appActivationCount.";
    }
    else
    {
      if (v7 != 4)
      {
LABEL_25:
        unsigned int v15 = self->appstate.state;
LABEL_26:
        uint64_t v16 = (uint64_t)rint(a4 - self->appstate.abs_time);
        if (v15 == 8)
        {
          v17 = @"appActiveTime.";
        }
        else
        {
          if (v15 != 4 || !v16)
          {
LABEL_32:
            v18 = @"foreground";
            v19 = @"foreground";
            if (v7 != 8)
            {
              if (v7 != 4) {
                goto LABEL_37;
              }
              v19 = @"background";
            }
            v29[0] = @"bundleID";
            v30[0] = [(ADBundleSession *)self bundleID];
            v30[1] = v19;
            v29[1] = @"position";
            v29[2] = @"count";
            v30[2] = &off_4FD0;
            +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
            AnalyticsSendEvent();
            unsigned int v20 = self->appstate.state;
            if (v20 != 1)
            {
LABEL_38:
              if (v20 == 8 || v20 == 4)
              {
                if (v20 != 8) {
                  v18 = @"background";
                }
                v25[0] = @"bundleID";
                v26[0] = [(ADBundleSession *)self bundleID];
                v26[1] = v18;
                v25[1] = @"position";
                v25[2] = @"count";
                v26[2] = &off_4FD0;
                v25[3] = @"duration";
                v26[3] = +[NSNumber numberWithUnsignedInt:v16];
                +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
                AnalyticsSendEvent();
              }
              goto LABEL_43;
            }
            v27[0] = @"bundleID";
            v28[0] = [(ADBundleSession *)self bundleID];
            v28[1] = v19;
            v27[1] = @"position";
            v27[2] = @"count";
            v28[2] = &off_4FD0;
            +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
            AnalyticsSendEvent();
LABEL_37:
            unsigned int v20 = self->appstate.state;
            goto LABEL_38;
          }
          v17 = @"appBackgroundActiveTime.";
        }
        [(__CFString *)v17 stringByAppendingString:[(ADBundleSession *)self bundleID]];
        ADClientAddValueForScalarKey();
        goto LABEL_32;
      }
      unsigned int v15 = self->appstate.state;
      if (v15 != 1) {
        goto LABEL_26;
      }
      v14 = @"appLaunchBackgroundCount.";
    }
    [(__CFString *)v14 stringByAppendingString:[(ADBundleSession *)self bundleID]];
    ADClientAddValueForScalarKey();
    goto LABEL_25;
  }
LABEL_43:
  self->appstate.unsigned int state = v7;
  self->appstate.abs_time = a4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

+ (void)initialize
{
  if (!qword_5078)
  {
    v2[0] = &off_4FB8;
    v2[1] = &off_4FD0;
    v3[0] = @"unknown";
    v3[1] = @"terminated";
    v2[2] = &off_4FE8;
    v2[3] = &off_5000;
    v3[2] = @"backgroundTaskSuspended";
    v3[3] = @"backgroundRunning";
    v2[4] = &off_5018;
    v2[5] = &off_5030;
    v3[4] = @"foregroundRunning";
    v3[5] = @"processServer";
    v2[6] = &off_5048;
    v3[6] = @"foregroundRunningObscured";
    qword_5078 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  }
}

- (id)initBundle:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ADBundleSession;
  v4 = [(ADBundleSession *)&v9 init];
  if (v4)
  {
    v4->_bundleID = (NSString *)a3;
    v4->appstate.unsigned int state = 1;
    id v5 = +[LSApplicationProxy applicationProxyForIdentifier:a3];
    v4->_bundleVers = (NSString *)[v5 bundleVersion];
    v4->_shortVers = (NSString *)[v5 shortVersionString];
    v4->_adamID = (NSNumber *)[v5 itemID];
    v6 = gADEventListenerLogObject;
    if (os_log_type_enabled((os_log_t)gADEventListenerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(ADBundleSession *)v4 bundleID];
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Tracking %@", buf, 0xCu);
    }
  }
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@:%@:%@\r", [(ADBundleSession *)self bundleID], [(ADBundleSession *)self bundleVers], [(ADBundleSession *)self shortVers]];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ADBundleSession;
  [(ADBundleSession *)&v3 dealloc];
}

- (id)copyBasicInfoSinceLastCheckAsXpcObject
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    if ([(ADBundleSession *)self shortVers])
    {
      if ([(ADBundleSession *)self bundleVers]) {
        v4 = [(ADBundleSession *)self bundleVers];
      }
      else {
        v4 = @"???";
      }
      id v5 = +[NSString stringWithFormat:@"%@ (%@)", v4, [(ADBundleSession *)self shortVers]];
    }
    else
    {
      if (![(ADBundleSession *)self bundleVers])
      {
        v6 = @"???";
        goto LABEL_10;
      }
      id v5 = [(ADBundleSession *)self bundleVers];
    }
    v6 = (__CFString *)v5;
LABEL_10:
    xpc_dictionary_set_string(v3, "bundle_id", [(NSString *)[(ADBundleSession *)self bundleID] UTF8String]);
    xpc_dictionary_set_string(v3, "version", (const char *)[(__CFString *)v6 UTF8String]);
    xpc_dictionary_set_int64(v3, "adam_id", [(NSNumber *)[(ADBundleSession *)self adamID] intValue]);
    xpc_dictionary_set_uuid(v3, "uuid", self->appstate.uuid);
    xpc_dictionary_set_int64(v3, "arch", self->appstate.arch);
  }
  return v3;
}

- (NSString)bundleVers
{
  return self->_bundleVers;
}

- (NSString)shortVers
{
  return self->_shortVers;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

@end