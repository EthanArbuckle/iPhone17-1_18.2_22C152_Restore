@interface FCNotificationPool
+ (BOOL)canReadPoolAtURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (FCNotificationPool)init;
- (FCNotificationPool)initWithItems:(id)a3;
- (FCNotificationPool)initWithItems:(id)a3 creationDate:(id)a4;
- (FCNotificationPool)initWithURL:(id)a3 error:(id *)a4;
- (NSArray)items;
- (NSDate)creationDate;
- (id)description;
- (unint64_t)hash;
@end

@implementation FCNotificationPool

+ (BOOL)canReadPoolAtURL:(id)a3
{
  __int16 value = 0;
  return getxattr((const char *)[a3 fileSystemRepresentation], "com.apple.news.notification_pool_version", &value, 2uLL, 0, 0) != -1&& value == 769;
}

- (FCNotificationPool)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNotificationPool init]";
    __int16 v9 = 2080;
    v10 = "FCNotificationPool.m";
    __int16 v11 = 1024;
    int v12 = 51;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNotificationPool init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCNotificationPool)initWithItems:(id)a3 creationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCNotificationPool;
  __int16 v9 = [(FCNotificationPool *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_items, a3);
    if (v8)
    {
      __int16 v11 = (NSDate *)v8;
    }
    else
    {
      __int16 v11 = [MEMORY[0x1E4F1C9C8] date];
    }
    creationDate = v10->_creationDate;
    v10->_creationDate = v11;
  }
  return v10;
}

- (FCNotificationPool)initWithItems:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  id v7 = [(FCNotificationPool *)self initWithItems:v5 creationDate:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [(FCNotificationPool *)self items];
    __int16 v9 = [v7 setWithArray:v8];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v11 = [v6 items];
    int v12 = [v10 setWithArray:v11];
    char v13 = [v9 isEqualToSet:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(FCNotificationPool *)self items];
  id v4 = [v2 setWithArray:v3];
  unint64_t v5 = [v4 hash];

  return v5;
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  id v4 = NSNumber;
  unint64_t v5 = [(FCNotificationPool *)self items];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  [(FCDescription *)v3 addField:@"items" object:v6];

  id v7 = [(FCDescription *)v3 descriptionString];

  return v7;
}

- (FCNotificationPool)initWithURL:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  __int16 value = 0;
  id v8 = v6;
  if (getxattr((const char *)[v8 fileSystemRepresentation], "com.apple.news.notification_pool_version", &value, 2uLL, 0, 0) == -1)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    v27 = @"errno";
    v18 = NSString;
    v19 = __error();
    __int16 v9 = [v18 stringWithCString:strerror(*v19)];
    v28[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v20 = @"Failed to read notification pool version";
LABEL_10:
    uint64_t v16 = objc_msgSend(v17, "fc_errorWithCode:description:additionalUserInfo:", 16, v20, v10);
    goto LABEL_11;
  }
  if (value != 769)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    v25 = @"version";
    __int16 v9 = objc_msgSend(NSNumber, "numberWithUnsignedShort:");
    v26 = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v20 = @"Notification pool was written with a different version";
    goto LABEL_10;
  }
  __int16 v9 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v8];
  [v9 open];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F940A0]) initWithStream:v9];
  uint64_t v11 = [v10 setClassOfNextMessage:objc_opt_class()];
  int v12 = (void *)MEMORY[0x1A6260FD0](v11);
  uint64_t v13 = [v10 nextMessage];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    do
    {
      [v7 addObject:v14];

      int v12 = (void *)MEMORY[0x1A6260FD0]();
      objc_super v14 = (void *)[v10 nextMessage];
    }
    while (v14);
  }
  [v9 close];
  id v15 = [v9 streamError];

  if (!v15)
  {

    uint64_t v23 = 0;
    [v8 getResourceValue:&v23 forKey:*MEMORY[0x1E4F1C540] error:0];
    self = [(FCNotificationPool *)self initWithItems:v7 creationDate:v23];
    v21 = self;
    goto LABEL_15;
  }
  uint64_t v16 = [v9 streamError];
LABEL_11:
  id v15 = (id)v16;

  if (a4)
  {
    id v15 = v15;
    v21 = 0;
    *a4 = v15;
  }
  else
  {
    v21 = 0;
  }
LABEL_15:

  return v21;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v6 append:0];
  id v8 = v7;
  if (!v7)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    v26 = @"URL";
    __int16 v9 = [v6 absoluteString];
    v27[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v16 = objc_msgSend(v17, "fc_errorWithCode:description:additionalUserInfo:", 16, @"Failed to create output stream for notification pool", v11);
    goto LABEL_15;
  }
  [v7 open];
  __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4F940A8]) initWithOutputStream:v8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v10 = [(FCNotificationPool *)self items];
  uint64_t v11 = (void *)[v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        if (([v9 writeMessage:*(void *)(*((void *)&v21 + 1) + 8 * i)] & 1) == 0)
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Failed to write feed item protobuf message");
          BOOL v14 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v11 = (void *)[v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_12:

  [v8 close];
  id v15 = [v8 streamError];

  if (v15)
  {
    uint64_t v16 = [v8 streamError];
LABEL_15:
    v18 = (void *)v16;

    BOOL v14 = 0;
    uint64_t v11 = v18;
  }

  if (a4 && v11) {
    *a4 = v11;
  }
  if (v14)
  {
    __int16 value = 769;
    setxattr((const char *)[v6 fileSystemRepresentation], "com.apple.news.notification_pool_version", &value, 2uLL, 0, 0);
  }

  return v14;
}

- (NSArray)items
{
  return self->_items;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end