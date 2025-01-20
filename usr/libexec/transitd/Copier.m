@interface Copier
+ (id)copierWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9;
+ (id)inboxPath;
+ (id)sharedInstance;
- (BOOL)createDirectory:(id)a3 error:(id *)a4;
- (BOOL)destroyTemporaryDirectory:(id)a3 error:(id *)a4;
- (BOOL)fileName:(id)a3 inDirectory:(id)a4 hasUniqueIdentifier:(id)a5;
- (BOOL)isCandidateFileName:(id)a3 forSourceFileName:(id)a4;
- (BOOL)setUniqueIdentifier:(id)a3 forPath:(id)a4;
- (BOOL)startCopy;
- (BOOL)validateSourceURLForCopying:(id)a3 error:(id *)a4;
- (BOOL)validateSourceURLForMoving:(id)a3 error:(id *)a4;
- (Copier)initWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9;
- (id)createTemporaryDirectory:(id *)a3;
- (id)identicalDocumentInDirectory:(id)a3 sourceURL:(id)a4 uniqueIdentifier:(id)a5;
- (id)uniquePathInDirectory:(id)a3 sourceURL:(id)a4;
- (void)_copyThread:(id)a3;
- (void)cancelCopy;
- (void)dealloc;
- (void)invalidate;
@end

@implementation Copier

+ (id)sharedInstance
{
  return (id)qword_10000C648;
}

+ (id)inboxPath
{
  return @"Inbox";
}

+ (id)copierWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9
{
  LODWORD(v11) = a9;
  v9 = [[Copier alloc] initWithSourceURL:a3 uniqueIdentifier:a4 destURL:a5 sandboxExtension:a6 callbackTarget:a7 selector:a8 options:v11];

  return v9;
}

- (Copier)initWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9
{
  v19.receiver = self;
  v19.super_class = (Class)Copier;
  v15 = [(Copier *)&v19 init];
  v15->_sourceURL = (NSURL *)[a3 copy];
  v15->_destURL = (NSURL *)[a5 copy];
  if (a4) {
    v16 = (NSString *)[a4 copy];
  }
  else {
    v16 = 0;
  }
  v15->_uniqueID = v16;
  v15->_sandboxExtension = (NSString *)[a6 copy];
  v15->_callbackTarget = a7;
  if (a8) {
    SEL v17 = a8;
  }
  else {
    SEL v17 = 0;
  }
  v15->_callbackSelector = v17;
  v15->_options = a9;
  return v15;
}

- (void)dealloc
{
  [(Copier *)self invalidate];
  self->_continue = 0;

  self->_thread = 0;
  self->_sourceURL = 0;

  self->_destURL = 0;
  self->_uniqueID = 0;

  self->_sandboxExtension = 0;
  self->_callbackTarget = 0;
  v3.receiver = self;
  v3.super_class = (Class)Copier;
  [(Copier *)&v3 dealloc];
}

- (BOOL)validateSourceURLForCopying:(id)a3 error:(id *)a4
{
  if (([a3 isFileURL] & 1) == 0)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", [a3 path], NSFilePathErrorKey);
      NSErrorDomain v10 = NSPOSIXErrorDomain;
      uint64_t v11 = 9;
      goto LABEL_11;
    }
    return 0;
  }
  v6 = (const char *)objc_msgSend(objc_msgSend(a3, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
                       "cStringUsingEncoding:",
                       4);
  if (lstat(v6, &v15)) {
    goto LABEL_7;
  }
  int v7 = v15.st_mode & 0xF000;
  if (v7 != 0x4000 && v7 != 0x8000 && v7 != 40960)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", [a3 path], NSFilePathErrorKey);
      NSErrorDomain v10 = NSPOSIXErrorDomain;
      uint64_t v11 = 22;
      goto LABEL_11;
    }
    return 0;
  }
  if (stat(v6, &v15))
  {
LABEL_7:
    if (a4)
    {
      uint64_t v8 = *__error();
      v9 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", [a3 path], NSFilePathErrorKey);
      NSErrorDomain v10 = NSPOSIXErrorDomain;
      uint64_t v11 = v8;
LABEL_11:
      v12 = +[NSError errorWithDomain:v10 code:v11 userInfo:v9];
      BOOL result = 0;
      *a4 = v12;
      return result;
    }
    return 0;
  }
  int v14 = v15.st_mode & 0xF000;
  BOOL result = 1;
  if (v14 != 0x4000 && v14 != 0x8000)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", [a3 path], NSFilePathErrorKey);
      NSErrorDomain v10 = NSPOSIXErrorDomain;
      uint64_t v11 = 20;
      goto LABEL_11;
    }
    return 0;
  }
  return result;
}

- (BOOL)validateSourceURLForMoving:(id)a3 error:(id *)a4
{
  BOOL v6 = -[Copier validateSourceURLForCopying:error:](self, "validateSourceURLForCopying:error:");
  if (v6)
  {
    if (lstat((const char *)objc_msgSend(objc_msgSend(a3, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                             0,
                             0,
                             0),
                           "cStringUsingEncoding:",
                           4),
           &v13))
    {
      if (a4)
      {
        uint64_t v7 = *__error();
        uint64_t v8 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", [a3 path], NSFilePathErrorKey);
        NSErrorDomain v9 = NSPOSIXErrorDomain;
        uint64_t v10 = v7;
LABEL_9:
        uint64_t v11 = +[NSError errorWithDomain:v9 code:v10 userInfo:v8];
        LOBYTE(v6) = 0;
        *a4 = v11;
        return v6;
      }
      goto LABEL_10;
    }
    if (v13.st_nlink != 1)
    {
      if (a4)
      {
        uint64_t v8 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", [a3 path], NSFilePathErrorKey);
        NSErrorDomain v9 = NSPOSIXErrorDomain;
        uint64_t v10 = 31;
        goto LABEL_9;
      }
LABEL_10:
      LOBYTE(v6) = 0;
      return v6;
    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)createDirectory:(id)a3 error:(id *)a4
{
  BOOL v6 = +[NSFileManager defaultManager];
  id v7 = [a3 path];
  char v13 = 0;
  if ([(NSFileManager *)v6 fileExistsAtPath:v7 isDirectory:&v13]) {
    BOOL v8 = v13 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    return 1;
  }
  BOOL v11 = 1;
  if (![(NSFileManager *)v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithUnsignedLong:509], NSFilePosixPermissions) error:a4])
  {
    if (a4)
    {
      id v9 = *a4;
      if (*a4)
      {
        id v10 = [[objc_msgSend(*a4, "userInfo") mutableCopy];
        if (!v10) {
          id v10 = objc_alloc_init((Class)NSMutableDictionary);
        }
        if (![v10 valueForKey:NSFilePathErrorKey]) {
          [v10 setValue:[a3 path] forKey:NSFilePathErrorKey];
        }
        *a4 = [NSError errorWithDomain:[v9 domain] code:objc_msgSend(v9, "code") userInfo:v10];
      }
    }
    return 0;
  }
  return v11;
}

- (BOOL)fileName:(id)a3 inDirectory:(id)a4 hasUniqueIdentifier:(id)a5
{
  BOOL v6 = (const char *)[[[a4 stringByAppendingPathComponent:a3] fileSystemRepresentation];
  uint64_t value = 0;
  memset(&v15, 0, sizeof(v15));
  if (getxattr(v6, "com.apple.mdt.modTime", &value, 8uLL, 0, 1) != 8
    || lstat(v6, &v15)
    || value != v15.st_mtimespec.tv_nsec + 1000000000 * v15.st_mtimespec.tv_sec)
  {
    goto LABEL_16;
  }
  id v7 = v17;
  ssize_t v8 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", v17, 0xFFuLL, 0, 1);
  if (v8 > 0)
  {
    id v9 = 0;
    goto LABEL_6;
  }
  if ((v8 & 0x8000000000000000) == 0
    || *__error() != 34
    || (ssize_t v13 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", 0, 0, 0, 1), v13 < 1))
  {
LABEL_16:
    LOBYTE(v12) = 0;
    return (char)v12;
  }
  v12 = malloc_type_malloc(v13 + 1, 0xA55A7777uLL);
  if (!v12) {
    return (char)v12;
  }
  id v9 = v12;
  ssize_t v8 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", v17, 0xFFuLL, 0, 1);
  if (v8 < 1)
  {
    char v11 = 0;
    goto LABEL_9;
  }
  id v7 = v9;
LABEL_6:
  v7[v8] = 0;
  id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, *(_OWORD *)&v15.st_dev, *(_OWORD *)&v15.st_uid, *(_OWORD *)&v15.st_atimespec);
  if (!v10 || [(NSString *)v10 compare:a5])
  {
    char v11 = 0;
    LOBYTE(v12) = 0;
    if (!v9) {
      return (char)v12;
    }
  }
  else
  {
    char v11 = 1;
    LOBYTE(v12) = 1;
    if (!v9) {
      return (char)v12;
    }
  }
LABEL_9:
  free(v9);
  LOBYTE(v12) = v11;
  return (char)v12;
}

- (BOOL)setUniqueIdentifier:(id)a3 forPath:(id)a4
{
  __darwin_time_t v6 = (mach_absolute_time() / 0x3B9ACA00);
  id v7 = (const char *)[a4 fileSystemRepresentation:1000000000 * v6];
  if (!v7) {
    return 0;
  }
  ssize_t v8 = v7;
  if (!a3)
  {
    BOOL v12 = 1;
    removexattr(v7, "com.apple.mdt.uniqueDocumentIdentifier", 1);
    removexattr(v8, "com.apple.mdt.modTime", 1);
    return v12;
  }
  id v9 = (const char *)[a3 cStringUsingEncoding:4];
  if (!v9) {
    return 0;
  }
  id v10 = v9;
  size_t v11 = strlen(v9);
  if (setxattr(v8, "com.apple.mdt.uniqueDocumentIdentifier", v10, v11, 0, 1)) {
    return 0;
  }
  if (setxattr(v8, "com.apple.mdt.modTime", &v14, 8uLL, 0, 1)) {
    return 0;
  }
  v15.tv_sec = v6;
  __darwin_time_t v16 = v6;
  v15.tv_usec = 0;
  int v17 = 0;
  return !utimes(v8, &v15);
}

- (BOOL)isCandidateFileName:(id)a3 forSourceFileName:(id)a4
{
  if (!a3) {
    sub_100005E7C();
  }
  if (!a4) {
    sub_100005EA8();
  }
  if ([a3 isEqual:a4])
  {
LABEL_4:
    LOBYTE(v6) = 1;
    return (char)v6;
  }
  __darwin_time_t v6 = (unsigned __int8 *)[a4 stringByDeletingPathExtension];
  if (v6)
  {
    id v7 = v6;
    LODWORD(v6) = [a3 hasPrefix:v6];
    if (v6)
    {
      __darwin_time_t v6 = (unsigned __int8 *)[objc_msgSend(objc_msgSend(a4, "pathExtension"), "fileSystemRepresentation")];
      if (v6)
      {
        ssize_t v8 = v6;
        __darwin_time_t v6 = (unsigned __int8 *)[a3 substringFromIndex:[v7 length]];
        if (v6)
        {
          id v9 = v6;
          __darwin_time_t v6 = (unsigned __int8 *)[v6 length];
          if (v6)
          {
            __darwin_time_t v6 = (unsigned __int8 *)[v9 fileSystemRepresentation];
            if (v6)
            {
              if (*v6 == 45)
              {
                id v10 = v6 + 1;
                do
                {
                  int v12 = *v10++;
                  int v11 = v12;
                }
                while ((v12 - 58) > 0xFFFFFFF5);
                if (v11 == 46)
                {
                  uint64_t v13 = 0;
                  do
                  {
                    int v14 = v10[v13];
                    if (!v10[v13]) {
                      goto LABEL_4;
                    }
                    int v15 = v8[v13];
                    if (!v8[v13]) {
                      goto LABEL_4;
                    }
                    ++v13;
                  }
                  while (v14 == v15);
                }
              }
              LOBYTE(v6) = 0;
            }
          }
        }
      }
    }
  }
  return (char)v6;
}

- (id)identicalDocumentInDirectory:(id)a3 sourceURL:(id)a4 uniqueIdentifier:(id)a5
{
  id v8 = [[[a4 path] lastPathComponent];
  id v9 = [a3 path];
  uint64_t v20 = 0;
  id result = [+[NSFileManager defaultManager] contentsOfDirectoryAtPath:v9 error:&v20];
  if (result)
  {
    id v11 = result;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id result = [result countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (result)
    {
      id v12 = result;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        int v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v14);
          if ([(Copier *)self isCandidateFileName:v15 forSourceFileName:v8]
            && [(Copier *)self fileName:v15 inDirectory:v9 hasUniqueIdentifier:a5])
          {
            return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", [v9 stringByAppendingPathComponent:v15]);
          }
          int v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id result = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
        id v12 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (id)uniquePathInDirectory:(id)a3 sourceURL:(id)a4
{
  id v5 = [[[a4 path] lastPathComponent];
  id v6 = [a3 path];
  id v7 = [v6 stringByAppendingPathComponent:v5];
  memset(&v14, 0, sizeof(v14));
  if (lstat((const char *)[v7 cStringUsingEncoding:4], &v14))
  {
LABEL_9:
    if (*__error() == 2) {
      return +[NSURL fileURLWithPath:v7];
    }
  }
  else
  {
    uint64_t v8 = 1;
    while (v8 != 0x10000)
    {
      id v9 = [v5 pathExtension];
      if (v9 && (id v10 = v9, [v9 length])) {
        id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%u.%@", [v5 stringByDeletingPathExtension], v8, v10);
      }
      else {
        id v11 = +[NSString stringWithFormat:@"%@-%u", v5, v8, v13];
      }
      id v7 = [v6 stringByAppendingPathComponent:v11];
      uint64_t v8 = (v8 + 1);
      if (lstat((const char *)[v7 cStringUsingEncoding:4], &v14)) {
        goto LABEL_9;
      }
    }
  }
  return 0;
}

- (id)createTemporaryDirectory:(id *)a3
{
  CFUUIDRef v5 = CFUUIDCreate(0);
  CFStringRef v6 = CFUUIDCreateString(0, v5);
  id v7 = [[-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", @"com.apple.mdt"], "stringByAppendingPathComponent:", v6];
  CFRelease(v6);
  CFRelease(v5);
  uint64_t v8 = +[NSURL fileURLWithPath:v7];
  if ([(Copier *)self createDirectory:v8 error:a3]) {
    return v8;
  }
  else {
    return 0;
  }
}

- (BOOL)destroyTemporaryDirectory:(id)a3 error:(id *)a4
{
  CFStringRef v6 = +[NSFileManager defaultManager];
  id v7 = [a3 path];

  return [(NSFileManager *)v6 removeItemAtPath:v7 error:a4];
}

- (void)_copyThread:(id)a3
{
  v25 = 0;
  char v24 = 0;
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  CFUUIDRef v5 = +[NSFileManager defaultManager];
  sandboxExtension = self->_sandboxExtension;
  if (sandboxExtension)
  {
    [(NSString *)sandboxExtension UTF8String];
    uint64_t v7 = sandbox_extension_consume();
    if (v7 < 0) {
      NSLog(@"could not consume extension token!");
    }
  }
  else
  {
    uint64_t v7 = -1;
  }
  if (![(Copier *)self validateSourceURLForCopying:self->_sourceURL error:&v25]) {
    goto LABEL_22;
  }
  if (self->_uniqueID)
  {
    destURL = -[Copier identicalDocumentInDirectory:sourceURL:uniqueIdentifier:](self, "identicalDocumentInDirectory:sourceURL:uniqueIdentifier:", self->_destURL, self->_sourceURL);
    if (destURL) {
      goto LABEL_23;
    }
  }
  if ([(NSFileManager *)v5 fileExistsAtPath:[(NSURL *)self->_destURL path] isDirectory:&v24])
  {
    if (!v24)
    {
      destURL = 0;
      v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 17, +[NSDictionary dictionaryWithObject:[(NSURL *)self->_destURL path] forKey:NSFilePathErrorKey]);
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  destURL = self->_destURL;
  if ((self->_options & 1) == 0) {
    goto LABEL_14;
  }
  if (![(Copier *)self createDirectory:self->_destURL error:&v25])
  {
LABEL_22:
    destURL = 0;
    goto LABEL_23;
  }
LABEL_13:
  destURL = [(Copier *)self uniquePathInDirectory:self->_destURL sourceURL:self->_sourceURL];
LABEL_14:
  id v9 = [(Copier *)self createTemporaryDirectory:&v25];
  if (!v9) {
    goto LABEL_23;
  }
  id v10 = v9;
  id v11 = [(NSDictionary *)[(NSFileManager *)v5 attributesOfItemAtPath:[(NSURL *)self->_destURL path] error:0] objectForKey:NSFileProtectionKey];
  if (v11)
  {
    uint64_t v23 = 0;
    if (!-[NSFileManager setAttributes:ofItemAtPath:error:](v5, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v11, NSFileProtectionKey), [v10 path], &v23))
    {
      id v12 = [v10 path];
      NSLog(@" Setting NSFileProtection: %@ on the path: %@ failed with error: %@", v11, v12, v23);
    }
  }
  v22 = v10;
  id v13 = [[-[Copier uniquePathInDirectory:sourceURL:](self, "uniquePathInDirectory:sourceURL:", v10, self->_sourceURL) path];
  stat v14 = [(NSString *)[(NSURL *)self->_sourceURL path] cStringUsingEncoding:4];
  uint64_t v15 = (const char *)[v13 cStringUsingEncoding:4];
  if ((self->_options & 2) != 0)
  {
    if (![(NSFileManager *)v5 moveItemAtPath:[(NSURL *)self->_sourceURL path] toPath:v13 error:&v25])
    {
      v21 = [(NSURL *)self->_sourceURL path];
      NSLog(@"Move from SRC(%@ -> %@) to temp failed with error %@", v21, v13, v25);
      destURL = 0;
      uint64_t v18 = 5;
      goto LABEL_38;
    }
    if (!v11) {
      goto LABEL_34;
    }
    uint64_t v23 = 0;
    if ([(NSFileManager *)v5 setAttributes:+[NSDictionary dictionaryWithObject:v11 forKey:NSFileProtectionKey] ofItemAtPath:v13 error:&v23])
    {
      uint64_t v18 = 0;
    }
    else
    {
      NSLog(@" Setting NSFileProtection: %@ on the path: %@ failed with error: %@", v11, v13, v23);
      [(NSFileManager *)v5 moveItemAtPath:v13 toPath:[(NSURL *)self->_sourceURL path] error:&v25];
      uint64_t v18 = 1;
    }
  }
  else
  {
    long long v16 = v15;
    long long v17 = copyfile_state_alloc();
    copyfile_state_set(v17, 6u, sub_100003BB0);
    copyfile_state_set(v17, 7u, self);
    uint64_t v18 = copyfile(v14, v16, v17, 0xC800Fu);
    copyfile_state_free(v17);
    id v10 = v22;
  }
  if (!v18)
  {
LABEL_34:
    [(Copier *)self setUniqueIdentifier:self->_uniqueID forPath:v13];
    uint64_t v18 = 0;
    if (![(NSFileManager *)v5 moveItemAtPath:v13 toPath:[(NSURL *)destURL path] error:&v25])destURL = 0; {
  }
    }
LABEL_38:
  NSLog(@"Operation completed with result=%d", v18);
  [(Copier *)self destroyTemporaryDirectory:v10 error:0];
LABEL_23:
  if (self->_callbackSelector) {
    SEL callbackSelector = self->_callbackSelector;
  }
  else {
    SEL callbackSelector = 0;
  }
  [self->_callbackTarget performSelector:callbackSelector withObject:destURL withObject:v25];
  if ((v7 & 0x8000000000000000) == 0 && (sandbox_extension_release() & 0x80000000) != 0)
  {
    uint64_t v20 = __error();
    NSLog(@"Could not release sandbox extension: %d", *v20);
  }
  [v4 drain];
}

- (BOOL)startCopy
{
  self->_continue = 1;
  objc_super v3 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:self selector:"_copyThread:" object:0];
  self->_thread = v3;
  [(NSThread *)v3 start];
  return self->_thread != 0;
}

- (void)cancelCopy
{
  self->_continue = 0;
}

- (void)invalidate
{
  id callbackTarget = self->_callbackTarget;
  self->_id callbackTarget = 0;

  thread = self->_thread;

  [(NSThread *)thread cancel];
}

@end