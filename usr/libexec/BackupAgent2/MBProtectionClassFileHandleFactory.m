@interface MBProtectionClassFileHandleFactory
+ (id)factoryWithProtectionClass:(unsigned __int8)a3;
- (MBProtectionClassFileHandleFactory)initWithProtectionClass:(unsigned __int8)a3;
- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6;
@end

@implementation MBProtectionClassFileHandleFactory

+ (id)factoryWithProtectionClass:(unsigned __int8)a3
{
  v3 = [[MBProtectionClassFileHandleFactory alloc] initWithProtectionClass:a3];

  return v3;
}

- (MBProtectionClassFileHandleFactory)initWithProtectionClass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (sub_100076518(a3, 1, 0) == 255) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBProtectionClassFileHandleFactory.m", 25, @"Invalid protection class: %d", v3 object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)MBProtectionClassFileHandleFactory;
  result = [(MBProtectionClassFileHandleFactory *)&v7 init];
  if (result) {
    result->_protectionClass = v3;
  }
  return result;
}

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v15 = 0;
  v9 = +[MBBasicFileHandle basicFileHandleWithPath:flags:mode:error:](MBBasicFileHandle, "basicFileHandleWithPath:flags:mode:error:", a3, *(void *)&a4, a5);
  if (v9)
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int protectionClass = self->_protectionClass;
      *(_DWORD *)buf = 67109378;
      int v17 = protectionClass;
      __int16 v18 = 2112;
      id v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Setting protection class to %d: %@", buf, 0x12u);
      uint64_t v13 = self->_protectionClass;
      id v14 = a3;
      _MBLog();
    }
    if (!+[MBProtectionClassUtils setWithFD:[(MBBasicFileHandle *)v9 fd] value:self->_protectionClass error:&v15])
    {
      if (a6) {
        *a6 = +[MBError errorWithCode:100, v15, a3, @"Error setting protection class to %d", self->_protectionClass error path format];
      }
      [(MBBasicFileHandle *)v9 closeWithError:0];
      return 0;
    }
  }
  return v9;
}

@end