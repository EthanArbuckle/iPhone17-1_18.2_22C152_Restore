@interface NSKeyedUnarchiver
+ (id)_nsurlsessionproxy_secureUnarchiveObjectOfClass:(Class)a3 withData:(id)a4;
@end

@implementation NSKeyedUnarchiver

+ (id)_nsurlsessionproxy_secureUnarchiveObjectOfClass:(Class)a3 withData:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:0];
  v7 = +[PDURLSessionProxyCommon allowedClassesForUnarchiving];
  v8 = [v7 setByAddingObject:a3];

  v9 = [v6 decodeObjectOfClasses:v8 forKey:NSKeyedArchiveRootObjectKey];
  if (!v9)
  {
    v10 = (id)qword_1000CB110;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      Class v13 = a3;
      __int16 v14 = 2048;
      id v15 = [v5 length];
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive data of class %@, length %lu", (uint8_t *)&v12, 0x16u);
    }
  }

  return v9;
}

@end