@interface VVVerifier
- (BOOL)valueForCheckpointKey:(id)a3 exists:(BOOL *)a4;
- (NSURL)accountDir;
- (VVVerifier)initWithAccountDir:(id)a3;
- (id)_checkpointDictionary;
- (id)_checkpointDictionaryFilePath;
- (id)configurationDictionary;
- (id)humanReadableConfigurationDictionary:(id *)a3;
- (id)keyDescriptions;
- (id)readableError;
- (void)_checkpointDictionaryChanged;
- (void)_mapFromSourceDictionary:(id)a3 destinationDictionary:(id)a4 inKey:(id)a5 outDescription:(id)a6;
- (void)_saveCheckpointDictionary;
- (void)setAccountDir:(id)a3;
- (void)storeValue:(BOOL)a3 forCheckpointKey:(id)a4;
@end

@implementation VVVerifier

- (VVVerifier)initWithAccountDir:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VVVerifier;
  v5 = [(VVVerifier *)&v8 init];
  v6 = v5;
  if (v5) {
    [(VVVerifier *)v5 setAccountDir:v4];
  }

  return v6;
}

- (id)_checkpointDictionaryFilePath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052D24;
  block[3] = &unk_1000C12C0;
  block[4] = self;
  if (qword_1000E0980 != -1) {
    dispatch_once(&qword_1000E0980, block);
  }
  return (id)qword_1000E0978;
}

- (id)_checkpointDictionary
{
  checkpointDictionary = self->_checkpointDictionary;
  if (!checkpointDictionary)
  {
    id v4 = [(VVVerifier *)self _checkpointDictionaryFilePath];
    v5 = +[NSFileManager defaultManager];
    if ([v5 fileExistsAtPath:v4]) {
      v6 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v4];
    }
    else {
      v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    v7 = self->_checkpointDictionary;
    self->_checkpointDictionary = v6;

    checkpointDictionary = self->_checkpointDictionary;
  }
  return checkpointDictionary;
}

- (void)_saveCheckpointDictionary
{
  if (self->_checkpointDictionary)
  {
    v3 = [(VVVerifier *)self _checkpointDictionaryFilePath];
    checkpointDictionary = self->_checkpointDictionary;
    id v13 = 0;
    unsigned __int8 v5 = [(NSMutableDictionary *)checkpointDictionary writeToFile:v3 options:268435457 error:&v13];
    id v6 = v13;
    if ((v5 & 1) == 0)
    {
      v7 = vm_vmd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000813F0();
      }
    }
    objc_super v8 = +[NSURL fileURLWithPath:v3];
    id v12 = 0;
    unsigned __int8 v9 = [v8 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v12];
    id v10 = v12;
    if ((v9 & 1) == 0)
    {
      v11 = vm_vmd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100081388();
      }
    }
    notify_post((const char *)[@"com.apple.visualvoicemail.VVVerifierChanged" UTF8String]);
  }
}

- (void)storeValue:(BOOL)a3 forCheckpointKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v22 = +[NSNumber numberWithBool:v4];
  if (v4)
  {
    long long v29 = 0uLL;
    long long v30 = 0uLL;
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    v7 = [(VVVerifier *)self keyDescriptions];
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v27 + 1) + 8 * v11) valueForKey:@"KeyName"];
        uint64_t v13 = [(VVVerifier *)self _checkpointDictionary];
        [(id)v13 setValue:v22 forKey:v12];

        LOBYTE(v13) = [v12 isEqualToString:v6];
        if (v13) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    v7 = [(VVVerifier *)self keyDescriptions];
    id v14 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      id v15 = v14;
      char v16 = 0;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v7);
          }
          v19 = [*(id *)(*((void *)&v23 + 1) + 8 * i) valueForKey:@"KeyName"];
          if (v16)
          {
            v20 = [(VVVerifier *)self _checkpointDictionary];
            [v20 removeObjectForKey:v19];
          }
          if ([v19 isEqualToString:v6])
          {
            v21 = [(VVVerifier *)self _checkpointDictionary];
            [v21 setValue:v22 forKey:v6];

            char v16 = 1;
          }
        }
        id v15 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v15);
    }
  }

  [(VVVerifier *)self _saveCheckpointDictionary];
}

- (BOOL)valueForCheckpointKey:(id)a3 exists:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(VVVerifier *)self _checkpointDictionary];
  id v8 = [v7 valueForKey:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      *a4 = 1;
    }
    unsigned __int8 v9 = [v8 BOOLValue];
  }
  else
  {
    unsigned __int8 v9 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v9;
}

- (id)keyDescriptions
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005335C;
  block[3] = &unk_1000C12C0;
  block[4] = self;
  if (qword_1000E0988 != -1) {
    dispatch_once(&qword_1000E0988, block);
  }
  return self->_keyDescriptions;
}

- (id)readableError
{
  [(VVVerifier *)self keyDescriptions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned __int8 v9 = [v8 objectForKey:@"KeyName"];
        char v12 = 0;
        if (![(VVVerifier *)self valueForCheckpointKey:v9 exists:&v12])
        {
          if (v12)
          {
            uint64_t v10 = [v8 valueForKey:@"LatestFailure"];
          }
          else
          {
            uint64_t v10 = 0;
          }

          goto LABEL_14;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_14:

  return v10;
}

- (void)_checkpointDictionaryChanged
{
  checkpointDictionary = self->_checkpointDictionary;
  self->_checkpointDictionary = 0;

  id v3 = (const char *)[@"com.apple.visualvoicemail.VVVerifierChanged" UTF8String];
  notify_post(v3);
}

- (id)configurationDictionary
{
  v2 = [(VVVerifier *)self accountDir];
  id v3 = [v2 URLByAppendingPathComponent:@"com.apple.voicemail.imap.parameters.plist"];

  id v4 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v3];
  return v4;
}

- (void)_mapFromSourceDictionary:(id)a3 destinationDictionary:(id)a4 inKey:(id)a5 outDescription:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  char v12 = [v16 allKeys];
  unsigned int v13 = [v12 containsObject:v10];

  if (v13)
  {
    long long v14 = [v16 objectForKey:v10];
    long long v15 = +[NSString stringWithFormat:@"%@", v14];
    [v9 setObject:v15 forKey:v11];
  }
  else
  {
    [v9 setObject:&stru_1000C35D8 forKey:v11];
  }
}

- (id)humanReadableConfigurationDictionary:(id *)a3
{
  id v5 = [(VVVerifier *)self configurationDictionary];
  if (v5)
  {
    uint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:6];
    v7 = [v5 objectForKey:@"AccountSettings"];
    [(VVVerifier *)self _mapFromSourceDictionary:v7 destinationDictionary:v6 inKey:@"name" outDescription:@"Name"];
    [(VVVerifier *)self _mapFromSourceDictionary:v7 destinationDictionary:v6 inKey:@"port" outDescription:@"Port"];
    [(VVVerifier *)self _mapFromSourceDictionary:v7 destinationDictionary:v6 inKey:@"server" outDescription:@"Server"];
    [(VVVerifier *)self _mapFromSourceDictionary:v5 destinationDictionary:v6 inKey:@"AccountState" outDescription:@"State"];
    [(VVVerifier *)self _mapFromSourceDictionary:v5 destinationDictionary:v6 inKey:@"BeaconCount" outDescription:@"Beacons"];
    [(VVVerifier *)self _mapFromSourceDictionary:v5 destinationDictionary:v6 inKey:@"GreetingType" outDescription:@"Greeting"];
    if (a3)
    {
      *a3 = +[NSArray arrayWithObjects:@"Name", @"Port", @"Server", @"State", @"Beacons", @"Greeting", 0];
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a3) {
      *a3 = 0;
    }
  }

  return v6;
}

- (NSURL)accountDir
{
  return self->_accountDir;
}

- (void)setAccountDir:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDir, 0);
  objc_storeStrong((id *)&self->_keyDescriptions, 0);
  objc_storeStrong((id *)&self->_checkpointDictionary, 0);
}

@end