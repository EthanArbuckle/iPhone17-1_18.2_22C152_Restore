@interface UARPSandboxExtension
+ (id)readWriteTokenStringWithURL:(id)a3;
- (UARPSandboxExtension)initWithTokenString:(id)a3;
- (void)dealloc;
@end

@implementation UARPSandboxExtension

+ (id)readWriteTokenStringWithURL:(id)a3
{
  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a3 path]))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F4D8((uint64_t)a3);
    }
    return 0;
  }
  objc_msgSend(objc_msgSend(a3, "path"), "UTF8String");
  v4 = (void *)sandbox_extension_issue_file();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "+[UARPSandboxExtension readWriteTokenStringWithURL:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: Generating Read-Write Sandbox Extension Token for %@ ", (uint8_t *)&v7, 0x16u);
  }
  if (!v4) {
    return 0;
  }
  v5 = +[NSString stringWithUTF8String:v4];
  free(v4);
  return v5;
}

- (UARPSandboxExtension)initWithTokenString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UARPSandboxExtension;
  v4 = [(UARPSandboxExtension *)&v7 init];
  if (v4)
  {
    [a3 UTF8String];
    uint64_t v5 = sandbox_extension_consume();
    v4->_sandboxExtensionHandle = v5;
    if (v5 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004F56C();
      }
      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  if (self->_sandboxExtensionHandle != -1)
  {
    sandbox_extension_release();
    self->_sandboxExtensionHandle = -1;
  }
}

@end