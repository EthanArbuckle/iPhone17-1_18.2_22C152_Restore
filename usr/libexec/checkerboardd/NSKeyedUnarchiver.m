@interface NSKeyedUnarchiver
+ (BOOL)_magicIsValidOnVersion1XPCObject:(id)a3;
+ (void)_unarchiveObjectFromVersion1XPCObject:(id)a3 allowedClasses:(id)a4 completion:(id)a5;
+ (void)unarchiveObjectFromXPCObject:(id)a3 allowedClasses:(id)a4 completion:(id)a5;
@end

@implementation NSKeyedUnarchiver

+ (void)unarchiveObjectFromXPCObject:(id)a3 allowedClasses:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (Block_layout *)a5;
  if (v10) {
    v11 = v10;
  }
  else {
    v11 = &stru_100010440;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v8, "Version");
  if (uint64 == 1)
  {
    [a1 _unarchiveObjectFromVersion1XPCObject:v8 allowedClasses:v9 completion:v11];
  }
  else
  {
    uint64_t v13 = uint64;
    v14 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000B03C(v13, v14);
    }

    v11->invoke(v11, 0);
  }
}

+ (void)_unarchiveObjectFromVersion1XPCObject:(id)a3 allowedClasses:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if ([a1 _magicIsValidOnVersion1XPCObject:v8])
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v8, "Data", &length);
    v12 = +[NSData dataWithBytes:data length:length];
    id v13 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v12 error:0];
    [v13 setRequiresSecureCoding:1];
    v14 = [v13 decodeObjectOfClasses:v9 forKey:NSKeyedArchiveRootObjectKey];
  }
  else
  {
    v14 = 0;
  }
  v10[2](v10, v14);
}

+ (BOOL)_magicIsValidOnVersion1XPCObject:(id)a3
{
  string = xpc_dictionary_get_string(a3, "Magic");
  uint64_t v4 = (uint64_t)string;
  if (string)
  {
    if (!strncmp(string, "CBCo", 5uLL)) {
      return 1;
    }
  }
  else
  {
    v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Magic missing while decoding message", v8, 2u);
    }
  }
  v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10000B0B4(v4, v7);
  }

  return 0;
}

@end