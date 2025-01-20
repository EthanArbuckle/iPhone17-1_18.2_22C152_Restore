@interface UVFSPlugin
- (NSString)fileSystemName;
- (UVFSPlugin)initWithFSName:(id)a3 andWithError:(id *)a4;
- (_UVFSFSOps)FSOps;
- (int)loadFileSystemDyLib;
- (void)checkAndUnloadPlugin;
- (void)takeAReference;
- (void)unloadFileSystemDyLib;
@end

@implementation UVFSPlugin

- (int)loadFileSystemDyLib
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)__str = 0u;
  long long v19 = 0u;
  if (self->dyLibHandle) {
    return 17;
  }
  v4 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
  {
    fileSystemName = self->_fileSystemName;
    *(_DWORD *)buf = 138412290;
    v17 = fileSystemName;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "loadFileSystemDylibPassingParameterDict:start:%@", buf, 0xCu);
  }
  p_fileSystemName = &self->_fileSystemName;
  if (snprintf(__str, 0x60uLL, "/System/Library/PrivateFrameworks/UserFS.framework/PlugIns/livefiles_%s.dylib", [(NSString *)self->_fileSystemName UTF8String]) > 0x5F)return 12; {
  v7 = dlopen(__str, 262);
  }
  self->dyLibHandle = v7;
  if (!v7)
  {
    if (snprintf(__str, 0x60uLL, "/AppleInternal/Library/Frameworks/UserFSInternal.framework/PlugIns/livefiles_%s.dylib", [(NSString *)*p_fileSystemName UTF8String]) > 0x5F)return 12; {
    v13 = dlopen(__str, 262);
    }
    self->dyLibHandle = v13;
    if (!v13)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000219F4();
      }
      return 2;
    }
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100021C5C();
  }
  v8 = (void (*)(_UVFSFSOps **))dlsym(self->dyLibHandle, "livefiles_plugin_init");
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021A68();
    }
    dlclose(self->dyLibHandle);
    self->dyLibHandle = 0;
    return 2;
  }
  p_FSOps = &self->_FSOps;
  v8(&self->_FSOps);
  if (self->_FSOps)
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100021BF4();
    }
    v10 = *p_FSOps;
    if ((*p_FSOps)->var1
      && v10->var2
      && v10->var3
      && v10->var4
      && v10->var5
      && v10->var7
      && v10->var8
      && v10->var9
      && v10->var10
      && v10->var11
      && v10->var12
      && v10->var13
      && v10->var14
      && v10->var15
      && v10->var16
      && v10->var17
      && v10->var18
      && v10->var19
      && v10->var20
      && v10->var21
      && v10->var22
      && v10->var23
      && v10->var24
      && v10->var25
      && v10->var26
      && v10->var30
      && (const mach_header_64 *)v10->var0 == &_mh_execute_header
      && v10->var32)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100021B8C();
      }
      int v11 = ((uint64_t (*)(void))(*p_FSOps)->var1)();
      v12 = userfs_log_default;
      if (v11)
      {
        int v2 = v11;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100021B58();
        }
        dlclose(self->dyLibHandle);
        self->dyLibHandle = 0;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
        {
          v15 = *p_fileSystemName;
          *(_DWORD *)buf = 138412290;
          v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "loadFileSystemDylibPassingParameterDict:finish:%@", buf, 0xCu);
        }
        return 0;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100021AD0();
      }
      return 22;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021A9C();
    }
    dlclose(self->dyLibHandle);
    self->dyLibHandle = 0;
    return 45;
  }
  return v2;
}

- (UVFSPlugin)initWithFSName:(id)a3 andWithError:(id *)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UVFSPlugin;
  v8 = [(UVFSPlugin *)&v14 init];
  if (v8)
  {
    v9 = v8;
    objc_storeStrong((id *)&v8->_fileSystemName, a3);
    unsigned int v10 = [(UVFSPlugin *)v9 loadFileSystemDyLib];
    if (!v10)
    {
      ++v9->refcount;
      if (!a4) {
        goto LABEL_12;
      }
      id v12 = 0;
LABEL_11:
      *a4 = v12;
      goto LABEL_12;
    }
    int v11 = v10;

    if (!a4) {
      goto LABEL_8;
    }
LABEL_7:
    id v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v11 userInfo:0];
    v9 = 0;
    goto LABEL_11;
  }
  if (a4)
  {
    int v11 = 12;
    goto LABEL_7;
  }
LABEL_8:
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)takeAReference
{
  unsigned __int8 refcount = self->refcount;
  if (refcount) {
    goto LABEL_2;
  }
  if (![(UVFSPlugin *)self loadFileSystemDyLib])
  {
    unsigned __int8 refcount = self->refcount;
LABEL_2:
    self->unsigned __int8 refcount = refcount + 1;
  }
}

- (void)unloadFileSystemDyLib
{
  ((void (*)(void))self->_FSOps->var2)();
  self->_FSOps = 0;
  dyLibHandle = self->dyLibHandle;
  if (dyLibHandle)
  {
    dlclose(dyLibHandle);
    self->dyLibHandle = 0;
  }
}

- (void)checkAndUnloadPlugin
{
  if (self->refcount)
  {
    unsigned __int8 v2 = self->refcount - 1;
    self->unsigned __int8 refcount = v2;
    if (!v2)
    {
      [(UVFSPlugin *)self unloadFileSystemDyLib];
    }
  }
  else if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_100021CC4();
  }
}

- (NSString)fileSystemName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (_UVFSFSOps)FSOps
{
  return self->_FSOps;
}

- (void).cxx_destruct
{
}

@end