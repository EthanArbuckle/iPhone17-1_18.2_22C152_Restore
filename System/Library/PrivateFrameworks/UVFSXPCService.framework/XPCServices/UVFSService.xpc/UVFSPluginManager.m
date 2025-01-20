@interface UVFSPluginManager
+ (id)getSupportedFilesystems;
+ (id)getUVFSPluginForFS:(id)a3 withError:(id *)a4;
@end

@implementation UVFSPluginManager

+ (id)getSupportedFilesystems
{
  id v2 = [objc_alloc((Class)NSMutableArray) initWithCapacity:6];
  v3 = +[NSArray arrayWithContentsOfFile:@"/System/Library/PrivateFrameworks/UserFS.framework/PlugIns/knownPlugins.plist"];
  [v2 addObjectsFromArray:v3];

  v4 = +[NSArray arrayWithContentsOfFile:@"/AppleInternal/Library/Frameworks/UserFSInternal.framework/PlugIns/knownPlugins.internal.plist"];
  [v2 addObjectsFromArray:v4];

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100021DE4();
  }
  if ([v2 count])
  {
    v5 = (_UNKNOWN **)v2;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021DB0();
    }
    v5 = &off_100039AB0;
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100021D48();
  }

  return v5;
}

+ (id)getUVFSPluginForFS:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = +[UVFSPluginManager getSupportedFilesystems];
  if (a4) {
    *a4 = 0;
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100021FD0();
  }
  if ([v6 containsObject:v5])
  {
    v7 = (void *)qword_100040328;
    if (!qword_100040328)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100021EF4();
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000048E0;
      block[3] = &unk_100038668;
      id v18 = v6;
      if (qword_100040330 != -1) {
        dispatch_once(&qword_100040330, block);
      }

      v7 = (void *)qword_100040328;
    }
    v8 = [v7 objectForKeyedSubscript:v5];

    BOOL v9 = os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v9) {
        sub_100021E8C();
      }
      v10 = [(id)qword_100040328 objectForKeyedSubscript:v5];
      [(UVFSPlugin *)v10 takeAReference];
    }
    else
    {
      if (v9) {
        sub_100021E24();
      }
      v10 = [[UVFSPlugin alloc] initWithFSName:v5 andWithError:a4];
      [(id)qword_100040328 setObject:v10 forKeyedSubscript:v5];
    }

    v12 = (id)userfs_log_default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [(id)qword_100040328 objectForKeyedSubscript:v5];
      v15 = (void *)v14;
      if (a4) {
        id v16 = *a4;
      }
      else {
        id v16 = 0;
      }
      *(_DWORD *)buf = 138412802;
      id v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "getUVFSPluginForFS:finish:%@:%@:%@", buf, 0x20u);
    }
    v11 = [(id)qword_100040328 objectForKeyedSubscript:v5];
  }
  else
  {
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021F5C();
    }
    v11 = 0;
  }

  return v11;
}

@end