@interface SDAState
+ (id)loadFromFileAtPath:(id)a3;
- (NSMutableDictionary)lastEventIdPerVol;
- (NSMutableDictionary)lastEventTimePerVol;
- (NSNumber)sdaVersion;
- (NSString)pathToDisk;
- (void)saveToFile;
- (void)setLastEventIdPerVol:(id)a3;
- (void)setLastEventTimePerVol:(id)a3;
- (void)setPathToDisk:(id)a3;
- (void)setSdaVersion:(id)a3;
- (void)updateEventId:(unint64_t)a3 andDate:(id)a4 forVolPath:(id)a5;
@end

@implementation SDAState

+ (id)loadFromFileAtPath:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = objc_opt_new();
  CFStringRef v5 = @"/var/db/spaceattribution";
  if (v3) {
    CFStringRef v5 = v3;
  }
  v6 = +[NSString stringWithFormat:@"%@/%@", v5, @"SpeculativeDownload.db"];

  [v4 setPathToDisk:v6];
  id v25 = 0;
  v7 = +[NSData dataWithContentsOfFile:v6 options:0 error:&v25];
  id v8 = v25;
  if (v7)
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    id v24 = v8;
    v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v12 fromData:v7 error:&v24];
    id v14 = v24;

    v15 = [v13 objectForKey:@"SdaVersion"];
    v16 = v15;
    if (!v15 || ([v15 isEqualToNumber:&off_10004FE20] & 1) == 0)
    {
      v17 = SALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "New SDA version!", buf, 2u);
      }

      v13 = 0;
    }
  }
  else
  {
    v16 = SALog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100032138();
    }
    v13 = 0;
    id v14 = v8;
  }

  v18 = [v13 objectForKey:@"LastEventIdPerVol"];
  if (!v18)
  {
    v19 = SALog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "creating dictionary for kLastEventIdPerVol", buf, 2u);
    }

    v18 = objc_opt_new();
  }
  [v4 setLastEventIdPerVol:v18];
  v20 = [v13 objectForKey:@"LastEventTimePerVol"];
  if (!v20)
  {
    v21 = SALog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "creating dictionary for kLastEventTimePerVol", buf, 2u);
    }

    v20 = objc_opt_new();
  }
  [v4 setLastEventTimePerVol:v20];

  return v4;
}

- (void)updateEventId:(unint64_t)a3 andDate:(id)a4 forVolPath:(id)a5
{
  id v7 = a5;
  id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [(SDAState *)self lastEventIdPerVol];
  [v8 setObject:v9 forKey:v7];

  [(SDAState *)self saveToFile];
}

- (void)saveToFile
{
  v3 = +[NSFileManager defaultManager];
  id v20 = 0;
  unsigned __int8 v4 = [v3 createDirectoryAtPath:@"/var/db/spaceattribution" withIntermediateDirectories:1 attributes:0 error:&v20];
  id v5 = v20;
  if (v4)
  {
    v6 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:&off_10004FE20, @"SdaVersion", self->_lastEventTimePerVol, @"LastEventIdPerVol", self->_lastEventIdPerVol, @"LastEventTimePerVol", 0];
    id v19 = v5;
    id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:0 error:&v19];
    id v8 = v19;

    id v9 = [(SDAState *)self pathToDisk];
    unsigned __int8 v10 = [v7 writeToFile:v9 atomically:1];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = SALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000321A0(self, v11);
      }
    }
    id v5 = v8;
  }
  else
  {
    v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002F264(v6, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (NSNumber)sdaVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSdaVersion:(id)a3
{
}

- (NSMutableDictionary)lastEventTimePerVol
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastEventTimePerVol:(id)a3
{
}

- (NSMutableDictionary)lastEventIdPerVol
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastEventIdPerVol:(id)a3
{
}

- (NSString)pathToDisk
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPathToDisk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathToDisk, 0);
  objc_storeStrong((id *)&self->_lastEventIdPerVol, 0);
  objc_storeStrong((id *)&self->_lastEventTimePerVol, 0);
  objc_storeStrong((id *)&self->_sdaVersion, 0);
}

@end