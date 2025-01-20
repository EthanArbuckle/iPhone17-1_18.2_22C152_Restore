@interface NFSLAMShim
- (id)transceive:(id)a3 error:(id *)a4;
- (void)log:(id)a3;
@end

@implementation NFSLAMShim

- (void)log:(id)a3
{
  id v3 = a3;
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(5, "%s:%i %s", "-[NFSLAMShim log:]", 57, (const char *)[v3 UTF8String]);
  }
  v5 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v7 = "-[NFSLAMShim log:]";
    __int16 v8 = 1024;
    int v9 = 57;
    __int16 v10 = 2080;
    id v11 = [v3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", buf, 0x1Cu);
  }
}

- (id)transceive:(id)a3 error:(id *)a4
{
  return [(NFSecureElementWrapper *)self->_se transceiveData:a3 toOS:0 error:a4];
}

- (void).cxx_destruct
{
}

@end