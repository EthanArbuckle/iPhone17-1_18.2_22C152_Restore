@interface VMUsageBundleStorageReporter
- (BOOL)allowDeletionForCategory:(id)a3;
- (VMUsageBundleStorageReporter)init;
- (VMVoicemailManager)voicemailManager;
- (float)sizeForCategory:(id)a3;
- (id)usageBundleApps;
- (int)getRecursiveSizeForPath:(id)a3 fileManager:(id)a4 outSize:(unint64_t *)a5;
- (unint64_t)size;
- (void)setVoicemailManager:(id)a3;
@end

@implementation VMUsageBundleStorageReporter

- (VMUsageBundleStorageReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)VMUsageBundleStorageReporter;
  v2 = [(VMUsageBundleStorageReporter *)&v6 init];
  if (v2)
  {
    v3 = (VMVoicemailManager *)[objc_alloc((Class)VMVoicemailManager) initWithoutMailSync];
    voicemailManager = v2->_voicemailManager;
    v2->_voicemailManager = v3;
  }
  return v2;
}

- (id)usageBundleApps
{
  *(float *)&double v2 = (float)[(VMUsageBundleStorageReporter *)self size];
  v3 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:@"com.apple.mobilephone" withTotalSize:v2];
  v4 = sub_30F8(@"Voicemail");
  [v3 setName:v4];

  v5 = sub_30F8(@"Voicemails");
  objc_super v6 = +[PSUsageBundleCategory categoryNamed:v5 withIdentifier:@"com.apple.mobilephone" forUsageBundleApp:v3];

  v11 = v6;
  v7 = +[NSArray arrayWithObjects:&v11 count:1];
  [v3 setCategories:v7];

  if (v3)
  {
    v10 = v3;
    v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 0;
}

- (float)sizeForCategory:(id)a3
{
  return (float)[(VMUsageBundleStorageReporter *)self size];
}

- (int)getRecursiveSizeForPath:(id)a3 fileManager:(id)a4 outSize:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v32 = 0;
  if (![v9 fileExistsAtPath:v8 isDirectory:&v32])
  {
    v19 = 0;
    goto LABEL_21;
  }
  if (v32)
  {
    v23 = a5;
    if (([v8 hasSuffix:@"/"] & 1) == 0)
    {
      uint64_t v10 = [v8 stringByAppendingString:@"/"];

      id v8 = (id)v10;
    }
    objc_msgSend(v9, "enumeratorAtPath:", v8, v23);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = [v8 stringByAppendingString:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          uint64_t v27 = 0;
          int v17 = [(VMUsageBundleStorageReporter *)self getRecursiveSizeForPath:v16 fileManager:v9 outSize:&v27];
          uint64_t v18 = v27;

          if (v17)
          {

            goto LABEL_26;
          }
          v13 += v18;
        }
        id v12 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }

    a5 = v24;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v26 = 0;
  v20 = [v9 attributesOfItemAtPath:v8 error:&v26];
  if (v20)
  {
    v21 = v20;
    v19 = (char *)[v20 fileSize] + v13;

LABEL_21:
    int v17 = 0;
    if (a5) {
      *a5 = (unint64_t)v19;
    }
    goto LABEL_26;
  }
  if (a5) {
    *a5 = 0;
  }
  int v17 = 13;
LABEL_26:

  return v17;
}

- (unint64_t)size
{
  v3 = [(VMUsageBundleStorageReporter *)self voicemailManager];
  id v4 = [v3 messageCountForMailboxType:0 error:0];

  if (!v4) {
    return 0;
  }
  unint64_t v8 = 0;
  v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [(VMUsageBundleStorageReporter *)self getRecursiveSizeForPath:@"/var/mobile/Library/Voicemail" fileManager:v5 outSize:&v8];

  if (v6) {
    return 0;
  }
  else {
    return v8;
  }
}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end