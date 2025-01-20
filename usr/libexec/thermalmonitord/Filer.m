@interface Filer
+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4;
+ (id)copyDictionaryFromFile:(id)a3;
- (BOOL)synchronizeToFile;
- (Filer)initWithFileName:(char *)a3 inDirectory:(char *)a4;
- (id)copyDictionaryFromFile;
- (id)copyValuesForKeys:(id)a3;
- (id)getValueForKey:(id)a3;
- (void)dealloc;
- (void)setMultiple:(id)a3 remove:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation Filer

+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  uint64_t v11 = 0;
  v7 = +[NSOutputStream outputStreamToFileAtPath:a4 append:0];
  [(NSOutputStream *)v7 open];
  NSInteger v8 = +[NSPropertyListSerialization writePropertyList:a3 toStream:v7 format:200 options:0 error:&v11];
  [(NSOutputStream *)v7 close];
  if (v8)
  {
    if (byte_1000AA7A0)
    {
      v9 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        NSInteger v13 = v8;
        __int16 v14 = 2112;
        id v15 = a4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Wrote %ld bytes to file %@", buf, 0x16u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005A404();
  }
  return v8 != 0;
}

+ (id)copyDictionaryFromFile:(id)a3
{
  uint64_t v10 = 0;
  v5 = +[NSInputStream inputStreamWithFileAtPath:a3];
  [(NSInputStream *)v5 open];
  id v6 = +[NSPropertyListSerialization propertyListWithStream:v5 options:2 format:0 error:&v10];
  [(NSInputStream *)v5 close];
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005A470();
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005A4DC();
    }
LABEL_11:
    id v7 = 0;
    goto LABEL_6;
  }
  id v7 = v6;
  if (byte_1000AA7A0)
  {
    NSInteger v8 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Successfully Read from file %@.", buf, 0xCu);
    }
  }
LABEL_6:
  return v7;
}

- (id)copyDictionaryFromFile
{
  v2 = +[NSMutableDictionary dictionaryWithDictionary:self->_fileDict];

  return v2;
}

- (id)getValueForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_fileDict objectForKey:a3];
}

- (id)copyValuesForKeys:(id)a3
{
  v5 = [+[NSMutableDictionary init] alloc];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [(Filer *)self getValueForKey:v10];
        if (v11) {
          [(NSMutableDictionary *)v5 setObject:v11 forKey:v10];
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v5;
}

- (void)setMultiple:(id)a3 remove:(id)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(a3);
        }
        -[Filer setValue:forKey:](self, "setValue:forKey:", [a3 objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * (void)v10)], *(void *)(*((void *)&v19 + 1) + 8 * (void)v10));
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = [a4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(a4);
        }
        [(Filer *)self setValue:0 forKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)v14)];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [a4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  fileDict = self->_fileDict;
  if (a3) {
    [(NSMutableDictionary *)fileDict setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)fileDict removeObjectForKey:a4];
  }
}

- (BOOL)synchronizeToFile
{
  return +[Filer writeDictionary:self->_fileDict toFile:self->_path];
}

- (Filer)initWithFileName:(char *)a3 inDirectory:(char *)a4
{
  v4 = 0;
  timespec v31 = (timespec)xmmword_100069110;
  if (a3 && a4)
  {
    char v33 = 0;
    memset(v38, 0, sizeof(v38));
    uint64_t v32 = 0;
    v30.receiver = self;
    v30.super_class = (Class)Filer;
    v4 = [(Filer *)&v30 init];
    if (!v4)
    {
LABEL_8:
      return v4;
    }
    uint64_t v9 = +[NSString stringWithUTF8String:a3];
    uint64_t v10 = +[NSString stringWithUTF8String:a4];
    id v11 = +[NSFileManager defaultManager];
    if (gethostuuid(v38, &v31))
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005A68C();
      }
LABEL_7:

      v4 = 0;
      goto LABEL_8;
    }
    v4->_path = objc_retain(+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@.%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X.plist", v10, v9, v38[0], v38[1], v38[2], v38[3], v38[4], v38[5], v38[6], v38[7], v38[8], v38[9], v38[10], v38[11], v38[12],
                    v38[13],
                    v38[14],
                    v38[15]));
    p_path = &v4->_path;
    if ([(NSFileManager *)v11 fileExistsAtPath:v10 isDirectory:&v33])
    {
      if (!v33)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005A544();
        }
        goto LABEL_7;
      }
    }
    else if (![(NSFileManager *)v11 createDirectoryAtPath:v10 withIntermediateDirectories:0 attributes:0 error:&v32])
    {
      long long v22 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005A61C((uint64_t)&v32, v22, v23, v24, v25, v26, v27, v28);
      }
      goto LABEL_7;
    }
    if ([(NSFileManager *)v11 fileExistsAtPath:*p_path isDirectory:&v33])
    {
      if (v33)
      {
        long long v14 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005A5AC((uint64_t)&v4->_path, v14, v15, v16, v17, v18, v19, v20);
        }
        goto LABEL_7;
      }
      NSFileAttributeKey v34 = NSFilePosixPermissions;
      v35 = &off_10008D388;
      [(NSFileManager *)v11 setAttributes:+[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1] ofItemAtPath:*p_path error:&v32];
    }
    else
    {
      long long v21 = *p_path;
      NSFileAttributeKey v36 = NSFilePosixPermissions;
      v37 = &off_10008D388;
      [(NSFileManager *)v11 createFileAtPath:v21 contents:0 attributes:+[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1]];
    }
    v29 = +[Filer copyDictionaryFromFile:v4->_path];
    v4->_fileDict = v29;
    if (!v29) {
      v4->_fileDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    goto LABEL_8;
  }
  return v4;
}

- (void)dealloc
{
  self->_path = 0;
  self->_fileDict = 0;
  v3.receiver = self;
  v3.super_class = (Class)Filer;
  [(Filer *)&v3 dealloc];
}

@end