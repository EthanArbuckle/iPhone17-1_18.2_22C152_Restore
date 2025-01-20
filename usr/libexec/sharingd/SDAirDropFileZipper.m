@interface SDAirDropFileZipper
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)addFile:(__CFURL *)a3 withBase:(__CFURL *)a4 toBom:(_BOMBom *)a5;
- (BOOL)addFileURLToBom:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5 propertyKeys:(id)a6 topLevel:(BOOL)a7;
- (BOOL)createPlaceholderFiles;
- (BOOL)disableAdaptiveCompressionForZipping;
- (BOOL)initBomWithFiles;
- (BOOL)isCompressor;
- (BOOL)isDecompressor;
- (BOOL)pathExistsInPlaceholderInfo:(id)a3;
- (BOOL)shouldExtractMediaFromPhotosBundles;
- (BOOL)validFileName:(id)a3;
- (NSArray)sourceFiles;
- (NSSet)skipReadableCheckFiles;
- (NSString)senderName;
- (NSString)unzipCompressionType;
- (NSString)zipCompressionType;
- (NSURL)destination;
- (SDAirDropFileZipper)init;
- (SDAirDropFileZipper)initWithQueue:(id)a3 boundStreamSize:(int64_t)a4;
- (SDAirDropFileZipperDelegate)delegate;
- (__CFArray)copyReverseParentChain:(__CFURL *)a3 base:(__CFURL *)a4;
- (__CFReadStream)copyReadStream;
- (id)URLFromFileInfo:(id)a3;
- (id)absoluteURLIfTopLevelFile:(const char *)a3 isDirectory:(BOOL)a4 base:(__CFURL *)a5;
- (id)conflictResolvedURL:(id)a3;
- (id)fixedRelativePath:(const char *)a3;
- (id)prettyNameBasedOnUUID:(id)a3;
- (id)temporaryBomPath;
- (id)timeRemaining:(int64_t)a3 timeNow:(double)a4;
- (int)bomCopierCopy:(id)a3 destination:(id)a4 options:(id)a5;
- (int)clientPid;
- (int64_t)totalBytes;
- (int64_t)totalFileSize:(__CFURL *)a3;
- (void)addParentChain:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5;
- (void)allowProgressCircleToComplete;
- (void)bomCopierCopyFileFinished:(const char *)a3 type:(int)a4 size:(int64_t)a5 operation:(int)a6;
- (void)bomCopierFatalError:(const char *)a3;
- (void)bomCopierFatalFileError:(int)a3;
- (void)dealloc;
- (void)moveFile:(__CFURL *)a3 toDestination:(__CFURL *)a4;
- (void)moveFilesToDestination;
- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4;
- (void)notifyProgress:(int64_t)a3 force:(BOOL)a4;
- (void)removeFileFromPlaceholderList:(id)a3;
- (void)removeUnusedPlaceholderFiles;
- (void)setAuditToken:(id *)a3;
- (void)setClientPid:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDisableAdaptiveCompressionForZipping:(BOOL)a3;
- (void)setPlaceholderFiles:(id)a3 withCreationCompletionHandler:(id)a4;
- (void)setReadStream:(__CFReadStream *)a3;
- (void)setSenderName:(id)a3;
- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3;
- (void)setSkipReadableCheckFiles:(id)a3;
- (void)setSourceFiles:(id)a3;
- (void)setTotalBytes:(id)a3;
- (void)setUnzipCompressionType:(id)a3;
- (void)startBomCopy:(id)a3 destination:(id)a4 options:(id)a5;
- (void)stop;
- (void)unzip;
- (void)zip;
@end

@implementation SDAirDropFileZipper

- (SDAirDropFileZipper)init
{
  return [(SDAirDropFileZipper *)self initWithQueue:&_dispatch_main_q boundStreamSize:0x20000];
}

- (SDAirDropFileZipper)initWithQueue:(id)a3 boundStreamSize:(int64_t)a4
{
  id v7 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SDAirDropFileZipper;
  v8 = [(SDAirDropFileZipper *)&v33 init];
  v9 = v8;
  if (v8)
  {
    bomPath = v8->_bomPath;
    v8->_bomPath = 0;

    v9->_usePKZip = 0;
    v9->_clientPid = 0;
    v9->_bomCopier = 0;
    senderName = v9->_senderName;
    v9->_senderName = 0;

    tempFolder = v9->_tempFolder;
    v9->_tempFolder = 0;

    destination = v9->_destination;
    v9->_destination = 0;

    v9->_bomArchive = 0;
    v9->_readStream = 0;
    v9->_writeStream = 0;
    sourceFiles = v9->_sourceFiles;
    v9->_sourceFiles = 0;

    progressTimer = v9->_progressTimer;
    v9->_progressTimer = 0;

    zipCompressionType = v9->_zipCompressionType;
    v9->_zipCompressionType = 0;

    unzipCompressionType = v9->_unzipCompressionType;
    v9->_unzipCompressionType = 0;

    placeholderFiles = v9->_placeholderFiles;
    v9->_placeholderFiles = 0;

    orderedRelativePaths = v9->_orderedRelativePaths;
    v9->_orderedRelativePaths = 0;

    compressionEngine = v9->_compressionEngine;
    v9->_compressionEngine = 0;

    skipReadableCheckFiles = v9->_skipReadableCheckFiles;
    v9->_skipReadableCheckFiles = 0;

    v9->_fileCount = 0;
    v9->_totalBytes = 0;
    v9->_lastBytesCopied = 0;
    v9->_totalBytesCopied = 0;
    v9->_timeStarted = 0.0;
    v9->_lastProgress = 0.0;
    uint64_t v22 = objc_opt_new();
    topLevelFiles = v9->_topLevelFiles;
    v9->_topLevelFiles = (NSMutableArray *)v22;

    uint64_t v24 = objc_opt_new();
    alternateNames = v9->_alternateNames;
    v9->_alternateNames = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    relativePathToFile = v9->_relativePathToFile;
    v9->_relativePathToFile = (NSMutableDictionary *)v26;

    uint64_t v28 = +[SDStatusMonitor sharedMonitor];
    monitor = v9->_monitor;
    v9->_monitor = (SDStatusMonitor *)v28;

    objc_storeStrong((id *)&v9->_queue, a3);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.airdrop.zip", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    zipQueue = v9->_zipQueue;
    v9->_zipQueue = (OS_dispatch_queue *)v30;

    v9->_boundStreamSize = a4;
  }

  return v9;
}

- (void)dealloc
{
  readStream = self->_readStream;
  if (readStream) {
    CFRelease(readStream);
  }
  if (self->_bomArchive) {
    BOMBomFree();
  }
  writeStream = self->_writeStream;
  if (writeStream) {
    CFRelease(writeStream);
  }
  bomPath = self->_bomPath;
  if (bomPath)
  {
    v6 = [(NSString *)bomPath UTF8String];
    remove(v6, v7);
  }
  tempFolder = self->_tempFolder;
  if (tempFolder) {
    sub_1001B2C50(tempFolder);
  }
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropFileZipper;
  [(SDAirDropFileZipper *)&v9 dealloc];
}

- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4
{
  CFRetain(a4);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100143488;
  block[3] = &unk_1008CE240;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (BOOL)isCompressor
{
  return self->_bomPath != 0;
}

- (BOOL)isDecompressor
{
  return ![(SDAirDropFileZipper *)self isCompressor];
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(id)a3
{
  self->_totalBytes = (int64_t)[a3 longLongValue];
}

- (void)setPlaceholderFiles:(id)a3 withCreationCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (NSMutableArray *)[a3 mutableCopy];
  placeholderFiles = self->_placeholderFiles;
  self->_placeholderFiles = v7;

  objc_super v9 = (NSMutableArray *)objc_opt_new();
  orderedRelativePaths = self->_orderedRelativePaths;
  self->_orderedRelativePaths = v9;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = self->_placeholderFiles;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    uint64_t v15 = kSFOperationFileBomPathKey;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v16) objectForKeyedSubscript:v15, v20];
        if (v17) {
          [(NSMutableArray *)self->_orderedRelativePaths addObject:v17];
        }

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id v18 = [v6 copy];
  id creationCompletionHandler = self->_creationCompletionHandler;
  self->_id creationCompletionHandler = v18;
}

- (void)setDestination:(id)a3
{
  id v4 = a3;
  v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 path];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AirDrop destination set to %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 filePathURL];
  v8 = [v7 URLByResolvingSymlinksInPath];
  destination = self->_destination;
  self->_destination = v8;
}

- (NSURL)destination
{
  return self->_destination;
}

- (void)setReadStream:(__CFReadStream *)a3
{
  readStream = self->_readStream;
  if (readStream != a3)
  {
    if (readStream) {
      CFRelease(readStream);
    }
    self->_readStream = (__CFReadStream *)CFRetain(a3);
  }
}

- (__CFReadStream)copyReadStream
{
  result = self->_readStream;
  if (result) {
    return (__CFReadStream *)CFRetain(result);
  }
  return result;
}

- (id)timeRemaining:(int64_t)a3 timeNow:(double)a4
{
  float v4 = (double)a3 / (a4 - self->_timeStarted);
  return +[NSNumber numberWithInt:(int)(float)((float)(self->_totalBytes - a3) / v4)];
}

- (void)notifyProgress:(int64_t)a3 force:(BOOL)a4
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (a4 || Current > self->_lastProgress + 0.2)
  {
    int64_t totalBytes = self->_totalBytes;
    if (self->_totalBytesCopied + a3 <= totalBytes || totalBytes == 0) {
      int64_t v10 = self->_totalBytesCopied + a3;
    }
    else {
      int64_t v10 = self->_totalBytes;
    }
    if (v10 > self->_lastBytesCopied || [(SDStatusMonitor *)self->_monitor enableBugs])
    {
      self->_lastProgress = Current;
      self->_lastBytesCopied = v10;
      id v11 = [(NSMutableArray *)self->_topLevelFiles count];
      id v17 = (id)objc_opt_new();
      id v12 = [(SDAirDropFileZipper *)self timeRemaining:v10 timeNow:Current];
      id v13 = +[NSNumber numberWithUnsignedInteger:v11];
      [v17 setObject:v13 forKeyedSubscript:kSFOperationFilesCopiedKey];

      uint64_t v14 = +[NSNumber numberWithLongLong:v10];
      [v17 setObject:v14 forKeyedSubscript:kSFOperationBytesCopiedKey];

      [v17 setObject:v12 forKeyedSubscript:kSFOperationTimeRemainingKey];
      [(SDAirDropFileZipper *)self notifyClientForEvent:7 withProperty:v17];
    }
  }
  else
  {
    progressTimer = self->_progressTimer;
    dispatch_time_t v16 = dispatch_time(0, 200000000);
    sub_1001B1BC4(progressTimer, v16);
  }
}

- (id)absoluteURLIfTopLevelFile:(const char *)a3 isDirectory:(BOOL)a4 base:(__CFURL *)a5
{
  size_t v8 = strlen(a3);
  CFURLRef v9 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)a3, v8, a4);
  if (v9)
  {
    CFURLRef v10 = v9;
    CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, v9);
    if (PathComponent)
    {
      CFURLRef v12 = PathComponent;
      CFStringRef v13 = CFURLCopyFileSystemPath(PathComponent, kCFURLPOSIXPathStyle);
      if (v13)
      {
        CFStringRef v14 = v13;
        if (CFEqual(v13, @"."))
        {
          size_t v15 = strlen(a3);
          CFURLRef v16 = CFURLCreateFromFileSystemRepresentationRelativeToBase(0, (const UInt8 *)a3, v15, a4, a5);
        }
        else
        {
          CFURLRef v16 = 0;
        }
        CFRelease(v14);
      }
      else
      {
        CFURLRef v16 = 0;
      }
      CFRelease(v12);
    }
    else
    {
      CFURLRef v16 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    CFURLRef v16 = 0;
  }

  return v16;
}

- (BOOL)validFileName:(id)a3
{
  id v4 = a3;
  if ([(SDStatusMonitor *)self->_monitor enableBugs])
  {
    BOOL v5 = 1;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obj = self->_placeholderFiles;
    id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = kSFOperationFileNameKey;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          CFURLRef v12 = [(NSMutableDictionary *)self->_alternateNames objectForKeyedSubscript:v4];
          CFStringRef v13 = [v11 objectForKeyedSubscript:v9];
          CFStringRef v14 = v13;
          if (v12 && [v13 isEqual:v12])
          {

LABEL_16:
            BOOL v5 = 1;
            goto LABEL_17;
          }
          size_t v15 = [v4 lastPathComponent];
          unsigned __int8 v16 = [v14 isEqual:v15];

          if (v16) {
            goto LABEL_16;
          }
        }
        id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        BOOL v5 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
LABEL_17:
  }
  return v5;
}

- (void)removeFileFromPlaceholderList:(id)a3
{
  id v15 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_alternateNames, "objectForKeyedSubscript:");
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v15 lastPathComponent];
  }
  id v7 = v6;

  id v8 = [(NSMutableArray *)self->_placeholderFiles count];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = kSFOperationFileNameKey;
    while (1)
    {
      CFURLRef v12 = [(NSMutableArray *)self->_placeholderFiles objectAtIndexedSubscript:v10];
      CFStringRef v13 = [v12 objectForKeyedSubscript:v11];
      unsigned __int8 v14 = [v7 isEqual:v13];

      if (v14) {
        break;
      }
      if (v9 == (id)++v10) {
        goto LABEL_10;
      }
    }
    [(NSMutableArray *)self->_placeholderFiles removeObjectAtIndex:v10];
  }
LABEL_10:
}

- (id)fixedRelativePath:(const char *)a3
{
  CFStringRef v4 = CFStringCreateWithCString(0, a3, 0x8000100u);
  BOOL v5 = (__CFString *)v4;
  if (v4 && !CFStringHasPrefix(v4, @"./") && ![(SDStatusMonitor *)self->_monitor enableBugs])
  {
    CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%@%@", @"./", v5);
    CFRelease(v5);
    BOOL v5 = (__CFString *)v6;
  }

  return v5;
}

- (BOOL)pathExistsInPlaceholderInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v5 = self->_placeholderFiles;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = kSFOperationFileBomPathKey;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:v9];
          CFURLRef v12 = v11;
          if (v11 && ([v11 isEqual:v4] & 1) != 0)
          {

            BOOL v13 = 1;
            goto LABEL_14;
          }
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_14:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)bomCopierCopyFileFinished:(const char *)a3 type:(int)a4 size:(int64_t)a5 operation:(int)a6
{
  if (!a6)
  {
    self->_totalBytesCopied += a5;
    if ([(SDAirDropFileZipper *)self isCompressor])
    {
      [(SDAirDropFileZipper *)self absoluteURLIfTopLevelFile:a3 isDirectory:a4 == 2 base:self->_destination];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10
        && ([(NSMutableArray *)self->_topLevelFiles containsObject:v10] & 1) == 0)
      {
        [(NSMutableArray *)self->_topLevelFiles addObject:v10];
        [(SDAirDropFileZipper *)self notifyProgress:0 force:1];
      }
      [(SDAirDropCompressor *)self->_compressionEngine fileComplete];
    }
    else
    {
      id v10 = [(SDAirDropFileZipper *)self fixedRelativePath:a3];
      uint64_t v11 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", [v10 UTF8String], a4 == 2, self->_tempFolder);
      if (v11)
      {
        [(SDAirDropFileZipper *)self quarantineFile:v11];
        if ([(SDAirDropFileZipper *)self pathExistsInPlaceholderInfo:v10])
        {
          if ([(SDAirDropFileZipper *)self validFileName:v10])
          {
            if (([(NSMutableArray *)self->_topLevelFiles containsObject:v11] & 1) == 0)
            {
              [(NSMutableArray *)self->_topLevelFiles addObject:v11];
              relativePathToFile = self->_relativePathToFile;
              BOOL v13 = [v11 relativePath];
              [(NSMutableDictionary *)relativePathToFile setObject:v11 forKeyedSubscript:v13];

              [(SDAirDropFileZipper *)self notifyProgress:0 force:1];
            }
            [(SDAirDropFileZipper *)self removeFileFromPlaceholderList:v10];
          }
        }
      }
    }
    [(SDAirDropFileZipper *)self notifyProgress:0 force:0];
  }
}

- (void)bomCopierFatalFileError:(int)a3
{
  id v4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:a3 userInfo:0];
  [(SDAirDropFileZipper *)self notifyClientForEvent:10 withProperty:v4];
}

- (void)bomCopierFatalError:(const char *)a3
{
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  id v4 = +[NSString stringWithUTF8String:a3];
  uint64_t v8 = v4;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  uint64_t v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:v5];
  [(SDAirDropFileZipper *)self notifyClientForEvent:10 withProperty:v6];
}

- (int64_t)totalFileSize:(__CFURL *)a3
{
  int64_t v3 = -1;
  CFNumberRef number = 0;
  int64_t valuePtr = -1;
  if (CFURLCopyResourcePropertyForKey(a3, kCFURLTotalFileSizeKey, &number, 0)) {
    BOOL v4 = number == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    if (!CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr)) {
      int64_t valuePtr = -1;
    }
    CFRelease(number);
    return valuePtr;
  }
  return v3;
}

- (__CFArray)copyReverseParentChain:(__CFURL *)a3 base:(__CFURL *)a4
{
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, a3);
  if (CFEqual(a4, PathComponent))
  {
    CFURLRef v8 = PathComponent;
  }
  else
  {
    do
    {
      CFArrayAppendValue(Mutable, PathComponent);
      CFURLRef v8 = CFURLCreateCopyDeletingLastPathComponent(0, PathComponent);
      CFRelease(PathComponent);
      CFURLRef PathComponent = v8;
    }
    while (!CFEqual(a4, v8));
  }
  CFRelease(v8);
  return Mutable;
}

- (BOOL)addFile:(__CFURL *)a3 withBase:(__CFURL *)a4 toBom:(_BOMBom *)a5
{
  NSErrorUserInfoKey v7 = sub_1001B25A8(a3);
  if (!v7) {
    return 0;
  }
  CFURLRef v8 = v7;
  if (BOMFSObjectNewFromPath())
  {
    uint64_t v9 = sub_1001B1F9C(a3, a4);
    if (v9)
    {
      id v10 = v9;
      BOMFSObjectSetPathName();
      int inserted = BOMBomInsertFSObject();
      BOOL v12 = inserted == 0;
      if (inserted)
      {
        BOOL v13 = airdrop_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100146EA0();
        }
      }
      free(v10);
    }
    else
    {
      BOOL v12 = 0;
    }
    BOMFSObjectFree();
  }
  else
  {
    unsigned __int8 v14 = airdrop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100146E38();
    }

    BOOL v12 = 0;
  }
  free(v8);
  return v12;
}

- (void)addParentChain:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5
{
  CFURLRef v8 = [(SDAirDropFileZipper *)self copyReverseParentChain:a4 base:a5];
  CFIndex Count = CFArrayGetCount(v8);
  if (Count >= 1)
  {
    unint64_t v10 = Count + 1;
    do
    {
      [(SDAirDropFileZipper *)self addFile:CFArrayGetValueAtIndex(v8, v10 - 2) withBase:a5 toBom:a3];
      --v10;
    }
    while (v10 > 1);
  }

  CFRelease(v8);
}

- (BOOL)addFileURLToBom:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5 propertyKeys:(id)a6 topLevel:(BOOL)a7
{
  BOOL v7 = a7;
  CFArrayRef v12 = (const __CFArray *)a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained) {
    goto LABEL_17;
  }
  unsigned __int8 v14 = WeakRetained;
  if ([(NSSet *)self->_skipReadableCheckFiles containsObject:a4])
  {

    goto LABEL_5;
  }
  long long v15 = *(_OWORD *)&self->_auditToken.val[4];
  long long v23 = *(_OWORD *)self->_auditToken.val;
  long long v24 = v15;
  char v16 = sub_1001B2618(a4);

  if ((v16 & 1) == 0)
  {
LABEL_17:
    LOBYTE(v17) = 0;
    goto LABEL_24;
  }
LABEL_5:
  if (v7) {
    [(SDAirDropFileZipper *)self addParentChain:a3 file:a4 base:a5];
  }
  BOOL v17 = -[SDAirDropFileZipper addFile:withBase:toBom:](self, "addFile:withBase:toBom:", a4, a5, a3, v23, v24);
  if (v17) {
    ++self->_fileCount;
  }
  if (sub_1001B1A10(a4))
  {
    *(void *)&long long v23 = 0;
    CFURLEnumeratorRef v18 = CFURLEnumeratorCreateForDirectoryURL(0, a4, 0, v12);
    while (1)
    {
      CFURLEnumeratorResult NextURL = CFURLEnumeratorGetNextURL(v18, (CFURLRef *)&v23, 0);
      if (NextURL == kCFURLEnumeratorSuccess) {
        [(SDAirDropFileZipper *)self addFileURLToBom:a3 file:(void)v23 base:a5 propertyKeys:v12 topLevel:0];
      }
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      if (NextURL == kCFURLEnumeratorEnd || !v20) {
        break;
      }

      if (NextURL == kCFURLEnumeratorError) {
        goto LABEL_23;
      }
    }

LABEL_23:
    CFRelease(v18);
  }
  else
  {
    uint64_t v21 = [(SDAirDropFileZipper *)self totalFileSize:a4];
    if (v21 >= 1) {
      self->_totalBytes += v21;
    }
    if ((unint64_t)v21 >> 33) {
      self->_usePKZip = 1;
    }
  }
LABEL_24:

  return v17;
}

- (id)URLFromFileInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:kSFOperationFileNameKey];

  BOOL v7 = [v5 objectForKeyedSubscript:kSFOperationFileTypeKey];

  CFURLRef v8 = [v5 objectForKeyedSubscript:kSFOperationFileIsDirectoryKey];

  if (self->_shouldExtractMediaFromPhotosBundles)
  {
    Boolean v9 = 0;
  }
  else
  {
    if (v8) {
      int Value = CFBooleanGetValue((CFBooleanRef)v8);
    }
    else {
      int Value = v7 ? UTTypeConformsTo(v7, kUTTypeDirectory) : 0;
    }
    Boolean v9 = Value != 0;
  }
  CFURLRef v11 = CFURLCreateWithFileSystemPathRelativeToBase(0, v6, kCFURLPOSIXPathStyle, v9, (CFURLRef)self->_destination);
  if (v11)
  {
    CFURLRef v12 = v11;
    CFURLRef v13 = CFURLCopyAbsoluteURL(v11);
    CFRelease(v12);
  }
  else
  {
LABEL_12:
    CFURLRef v13 = 0;
  }

  return v13;
}

- (id)prettyNameBasedOnUUID:(id)a3
{
  v6[0] = 0;
  v6[1] = 0;
  [a3 getUUIDBytes:v6];
  unsigned int v3 = bswap32(LOWORD(v6[0]));
  id v4 = +[NSString stringWithFormat:@"IMG_%04u", (unsigned __int16)(HIWORD(v3) - 10000 * ((unsigned __int16)((839 * (v3 >> 20)) >> 16) >> 3))];

  return v4;
}

- (BOOL)createPlaceholderFiles
{
  v2 = self;
  placeholderFiles = self->_placeholderFiles;
  if (placeholderFiles)
  {
    id v32 = [(NSMutableArray *)placeholderFiles count];
    if (v32)
    {
      uint64_t v4 = 0;
      uint64_t v36 = kSFOperationFileNameKey;
      uint64_t v34 = kSFOperationFileBomPathKey;
      while (1)
      {
        BOOL v5 = [(NSMutableArray *)v2->_placeholderFiles objectAtIndexedSubscript:v4];
        uint64_t v6 = [v5 objectForKeyedSubscript:v36];
        BOOL v7 = v6;
        if (!v6) {
          break;
        }
        CFURLRef v8 = [v6 lastPathComponent];
        if (![v7 isEqual:v8]
          || ([v7 isEqual:@"."] & 1) != 0)
        {

LABEL_37:
          [v7 UTF8String];
          dispatch_queue_t v30 = airdrop_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_100146FE8();
          }
          goto LABEL_41;
        }
        unsigned __int8 v9 = [v7 isEqual:@".."];

        if (v9) {
          goto LABEL_37;
        }
        objc_super v33 = v7;
        CFURLRef v10 = [(SDAirDropFileZipper *)v2 URLFromFileInfo:v5];
        while (v10)
        {
          id v41 = 0;
          BOOL v11 = sub_1001B2EC4(v10, &v41);
          id v12 = v41;
          CFURLRef v13 = v12;
          if (v11) {
            goto LABEL_29;
          }
          unsigned __int8 v14 = [v12 domain];
          if (![v14 isEqual:NSPOSIXErrorDomain])
          {

LABEL_24:
            v29 = airdrop_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "SDAirDropFileZipper: createPlaceholder %@", buf, 0xCu);
            }
LABEL_28:

LABEL_29:
            break;
          }
          id v15 = [v13 code];

          if (v15 != (id)17) {
            goto LABEL_24;
          }
          char v16 = [(__CFURL *)v10 lastPathComponent];
          if (!v16)
          {
            v29 = airdrop_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_100147050(&v37, v38, v29);
            }
            goto LABEL_28;
          }
          BOOL v17 = v16;
          CFURLEnumeratorRef v18 = sub_1001B3100(v16);
          long long v19 = airdrop_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            destination = v2->_destination;
            *(_DWORD *)buf = 138412802;
            v43 = v17;
            __int16 v44 = 2112;
            v45 = destination;
            __int16 v46 = 2112;
            v47 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "SDAirDropFileZipper: Placeholder filename %@ already exists at destination: %@. Creating as new filename: %@", buf, 0x20u);
          }

          id v21 = [v5 mutableCopy];
          [v21 setObject:v18 forKeyedSubscript:v36];
          unsigned __int8 v22 = [v17 isEqual:v18];
          if (v22)
          {
            long long v23 = airdrop_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              sub_100147090(&v39, v40, v23);
            }
          }
          else
          {
            uint64_t v35 = [(SDAirDropFileZipper *)v2 URLFromFileInfo:v21];

            alternateNames = v2->_alternateNames;
            [v21 objectForKeyedSubscript:v34];
            v25 = v2;
            uint64_t v26 = v5;
            uint64_t v28 = v27 = v4;
            [(NSMutableDictionary *)alternateNames setObject:v18 forKeyedSubscript:v28];

            uint64_t v4 = v27;
            BOOL v5 = v26;
            v2 = v25;
            [(NSMutableArray *)v25->_placeholderFiles setObject:v21 atIndexedSubscript:v4];
            CFURLRef v10 = (const __CFURL *)v35;
          }

          if (v22) {
            break;
          }
        }

        if ((id)++v4 == v32) {
          return 1;
        }
      }
      dispatch_queue_t v30 = airdrop_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100146F70(v4, v30);
      }
LABEL_41:
    }
    else
    {
      BOOL v5 = airdrop_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100146F3C();
      }
    }
  }
  else
  {
    BOOL v5 = airdrop_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100146F08();
    }
  }

  return 0;
}

- (void)removeUnusedPlaceholderFiles
{
  placeholderFiles = self->_placeholderFiles;
  if (placeholderFiles)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = placeholderFiles;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        CFURLRef v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          -[SDAirDropFileZipper URLFromFileInfo:](self, "URLFromFileInfo:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v8), (void)v14);
          CFURLRef v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          CFURLRef v10 = v9;
          if (v9)
          {
            CFStringRef v11 = CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
            if (v11)
            {
              CFStringRef v12 = v11;
              bzero(buffer, 0x400uLL);
              if (CFStringGetCString(v12, (char *)buffer, 1024, 0x8000100u)) {
                remove(buffer, v13);
              }
              CFRelease(v12);
            }
          }

          CFURLRef v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }
  }
}

- (id)conflictResolvedURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  if (v5)
  {
    id v6 = [v4 relativePath];
    uint64_t v7 = [(NSMutableDictionary *)self->_alternateNames objectForKeyedSubscript:v6];
    CFURLRef v8 = (void *)v7;
    if (v7) {
      CFURLRef v9 = (void *)v7;
    }
    else {
      CFURLRef v9 = v5;
    }
    id v10 = v9;

    CFStringRef v11 = [(NSURL *)self->_destination URLByAppendingPathComponent:v10];
  }
  else
  {
    CFStringRef v11 = 0;
  }

  return v11;
}

- (void)moveFile:(__CFURL *)a3 toDestination:(__CFURL *)a4
{
  id v19 = 0;
  BOOL v6 = sub_1001B39C8(a3, a4, &v19);
  id v7 = v19;
  CFURLRef v8 = v7;
  if (!v6)
  {
    CFURLRef v9 = [v7 domain];
    if ([v9 isEqual:NSPOSIXErrorDomain])
    {
      id v10 = [v8 code];

      if (v10 == (id)20)
      {
        id v18 = 0;
        BOOL v11 = sub_1001B2CB8(a4, &v18);
        CFStringRef v12 = v18;
        CFURLRef v13 = v12;
        if (v11)
        {
          long long v17 = v12;
          BOOL v14 = sub_1001B39C8(a3, a4, (id *)&v17);
          long long v15 = v17;

          if (v14)
          {
LABEL_15:

            goto LABEL_16;
          }
          long long v16 = airdrop_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_1001470D0();
          }
        }
        else
        {
          long long v16 = airdrop_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100147138();
          }
          long long v15 = v13;
        }

        goto LABEL_15;
      }
    }
    else
    {
    }
    long long v15 = airdrop_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001471A0();
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)moveFilesToDestination
{
  unsigned int v3 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = self->_orderedRelativePaths;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      CFURLRef v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        CFURLRef v9 = [(NSMutableDictionary *)self->_relativePathToFile objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * (void)v8)];
        if (v9) {
          [v3 addObject:v9];
        }

        CFURLRef v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  id v10 = (NSMutableArray *)objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v3;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v19 + 1) + 8 * (void)v15);
        long long v17 = -[SDAirDropFileZipper conflictResolvedURL:](self, "conflictResolvedURL:", v16, (void)v19);
        if (v17)
        {
          [(SDAirDropFileZipper *)self moveFile:v16 toDestination:v17];
          [(NSMutableArray *)v10 addObject:v17];
        }

        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }

  topLevelFiles = self->_topLevelFiles;
  self->_topLevelFiles = v10;
}

- (int)bomCopierCopy:(id)a3 destination:(id)a4 options:(id)a5
{
  CFURLRef v8 = (const __CFURL *)a4;
  id v9 = a5;
  CFURLRef v10 = (const __CFURL *)a3;
  self->_bomCopier = (_BOMCopier *)BOMCopierNew();
  BOMCopierSetUserData();
  BOMCopierSetFileErrorHandler();
  BOMCopierSetFatalErrorHandler();
  BOMCopierSetCopyFileUpdateHandler();
  BOMCopierSetFatalFileErrorHandler();
  BOMCopierSetCopyFileFinishedHandler();
  BOMCopierSetFileConflictErrorHandler();
  id v11 = sub_1001B25A8(v10);

  id v12 = sub_1001B25A8(v8);
  if (self->_compressionEngine)
  {
    id v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    zipQueue = self->_zipQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100145858;
    block[3] = &unk_1008CAF18;
    CFURLRef v19 = v8;
    long long v20 = self;
    long long v21 = v13;
    long long v15 = v13;
    dispatch_async(zipQueue, block);
    int v16 = BOMCopierCopyWithOptions();
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v16 = BOMCopierCopyWithOptions();
  if (v11) {
LABEL_3:
  }
    free(v11);
LABEL_4:
  if (v12) {
    free(v12);
  }

  return v16;
}

- (void)allowProgressCircleToComplete
{
  CFAbsoluteTime v2 = CFAbsoluteTimeGetCurrent() - self->_timeStarted;
  double v3 = (0.95 - v2) * 1000000.0;
  BOOL v4 = v2 < 0.45;
  double v5 = 500000.0;
  if (v4) {
    double v5 = v3;
  }

  usleep(v5);
}

- (void)startBomCopy:(id)a3 destination:(id)a4 options:(id)a5
{
  id v8 = a3;
  CFURLRef v9 = (const __CFURL *)a4;
  id v10 = a5;
  if ([(SDAirDropFileZipper *)self isDecompressor]
    && (long long v11 = *(_OWORD *)&self->_auditToken.val[4],
        *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val,
        *(_OWORD *)&buf[16] = v11,
        sub_1001B26B8(v9))
    || self->_fileCount)
  {
    id v12 = objc_opt_new();
    id v13 = +[NSNumber numberWithLongLong:self->_totalBytes];
    [v12 setObject:v13 forKeyedSubscript:kSFOperationTotalBytesKey];

    [(SDAirDropFileZipper *)self notifyClientForEvent:5 withProperty:v12];
    double Current = CFAbsoluteTimeGetCurrent();
    self->_timeStarted = Current;
    self->_lastProgress = Current + -0.2;
    zipQueue = self->_zipQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100145D68;
    v38[3] = &unk_1008CA4B8;
    v38[4] = self;
    sub_1001B1B10(0, zipQueue, v38);
    int v16 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    progressTimer = self->_progressTimer;
    self->_progressTimer = v16;

    dispatch_resume((dispatch_object_t)self->_progressTimer);
    if ([(SDAirDropFileZipper *)self isDecompressor]
      && ![(SDAirDropFileZipper *)self createPlaceholderFiles])
    {
      long long v26 = airdrop_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1001474C0();
      }
    }
    else
    {
      if ([(SDAirDropFileZipper *)self isDecompressor]) {
        (*((void (**)(void))self->_creationCompletionHandler + 2))();
      }
      int v18 = [(SDAirDropFileZipper *)self bomCopierCopy:v8 destination:v9 options:v10];
      if (v18) {
        goto LABEL_18;
      }
      if ([(SDAirDropFileZipper *)self isDecompressor])
      {
        [(SDAirDropFileZipper *)self moveFilesToDestination];
        [(SDAirDropFileZipper *)self removeUnusedPlaceholderFiles];
      }
    }
    int v18 = 0;
LABEL_18:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      if ([(NSMutableArray *)self->_topLevelFiles count])
      {
        self->_totalBytesCopied = self->_totalBytes;
        uint64_t v28 = airdrop_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = [(NSMutableArray *)self->_topLevelFiles count];
          topLevelFiles = self->_topLevelFiles;
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v29;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = topLevelFiles;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "SDAirDropFileZipper: %lu files saved: %@", buf, 0x16u);
        }

        [(SDAirDropFileZipper *)self notifyProgress:0 force:1];
        [(SDAirDropFileZipper *)self allowProgressCircleToComplete];
        [(SDAirDropFileZipper *)self notifyClientForEvent:9 withProperty:self->_topLevelFiles];
      }
      else
      {
        v31 = airdrop_log();
        BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
        if (v18)
        {
          if (v32) {
            sub_100147448(v18, v31);
          }

          NSErrorDomain v33 = NSPOSIXErrorDomain;
          uint64_t v34 = v18;
        }
        else
        {
          if (v32) {
            sub_100147414();
          }

          NSErrorDomain v33 = NSPOSIXErrorDomain;
          uint64_t v34 = 2;
        }
        uint64_t v35 = +[NSError errorWithDomain:v33 code:v34 userInfo:0];
        [(SDAirDropFileZipper *)self notifyClientForEvent:10 withProperty:v35];
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->_progressTimer);
    queue = self->_queue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100145D78;
    v37[3] = &unk_1008CA4B8;
    v37[4] = self;
    dispatch_async(queue, v37);
    goto LABEL_32;
  }
  CFURLRef v19 = airdrop_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1001474F4((uint64_t)self, v19, v20, v21, v22, v23, v24, v25);
  }

  id v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
  [(SDAirDropFileZipper *)self notifyClientForEvent:10 withProperty:v12];
LABEL_32:
}

- (BOOL)initBomWithFiles
{
  bomPath = self->_bomPath;
  if (bomPath)
  {
    [(NSString *)bomPath UTF8String];
    BOOL v4 = (_BOMBom *)BOMBomNew();
    self->_bomArchive = v4;
    if (v4)
    {
      if (!BOMFSObjectNewFromPath())
      {
        id v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1001475E4();
        }

        BOOL v6 = 0;
        goto LABEL_34;
      }
      if (BOMBomInsertFSObject())
      {
        double v5 = airdrop_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1001476BC();
        }
      }
      else
      {
        CFStringRef v33 = kCFURLTotalFileSizeKey;
        double v5 = +[NSArray arrayWithObjects:&v33 count:1];
        CFTypeRef v9 = sub_1001B1E48((const __CFArray *)self->_sourceFiles);
        id v10 = airdrop_log();
        long long v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SDAirDropFileZipper: start adding files to BOM", buf, 2u);
          }

          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v12 = self->_sourceFiles;
          id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                -[SDAirDropFileZipper addFileURLToBom:file:base:propertyKeys:topLevel:](self, "addFileURLToBom:file:base:propertyKeys:topLevel:", self->_bomArchive, *(void *)(*((void *)&v27 + 1) + 8 * i), v9, v5, 1, (void)v27);
              }
              id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
            }
            while (v14);
          }

          long long v17 = airdrop_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SDAirDropFileZipper: done adding files to BOM", buf, 2u);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          BOOL v6 = WeakRetained != 0;
          if (!WeakRetained)
          {
            CFURLRef v19 = airdrop_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_100147688();
            }
          }
          CFRelease(v9);
          goto LABEL_33;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100147618((uint64_t)&self->_sourceFiles, v11, v21, v22, v23, v24, v25, v26);
        }
      }
      BOOL v6 = 0;
LABEL_33:

      BOMFSObjectFree();
LABEL_34:
      BOMBomCommit();
      return v6;
    }
    uint64_t v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001475B0();
    }
  }
  else
  {
    uint64_t v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10014757C();
    }
  }

  return 0;
}

- (id)temporaryBomPath
{
  CFURLRef v2 = sub_1001B2DAC(0, 65537);
  if (v2)
  {
    CFURLRef v3 = v2;
    BOOL v4 = +[NSUUID UUID];
    double v5 = [v4 UUIDString];
    CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%@.bom", v5);

    if (v6)
    {
      CFURLRef v7 = CFURLCreateWithFileSystemPathRelativeToBase(0, v6, kCFURLPOSIXPathStyle, 0, v3);
      if (v7)
      {
        CFURLRef v8 = v7;
        CFURLRef v9 = CFURLCopyAbsoluteURL(v7);
        if (v9)
        {
          CFURLRef v10 = v9;
          long long v11 = (__CFString *)CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
          CFRelease(v10);
        }
        else
        {
          id v14 = airdrop_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100147758();
          }

          long long v11 = 0;
        }
        CFRelease(v8);
      }
      else
      {
        id v13 = airdrop_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100147724();
        }

        long long v11 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      long long v11 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    id v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001476F0();
    }

    long long v11 = 0;
  }

  return v11;
}

- (void)zip
{
  CFURLRef v3 = [(SDAirDropFileZipper *)self temporaryBomPath];
  bomPath = self->_bomPath;
  self->_bomPath = v3;

  if (!self->_destination) {
    CFStreamCreateBoundPair(0, &self->_readStream, &self->_writeStream, self->_boundStreamSize);
  }
  zipQueue = self->_zipQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014634C;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(zipQueue, block);
}

- (void)unzip
{
  destination = self->_destination;
  id v10 = 0;
  sub_1001B27DC(destination, &v10);
  BOOL v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  id v5 = v10;
  tempFolder = self->_tempFolder;
  self->_tempFolder = v4;

  if (self->_tempFolder)
  {
    zipQueue = self->_zipQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001468D8;
    v9[3] = &unk_1008CA4B8;
    v9[4] = self;
    dispatch_async(zipQueue, v9);
  }
  else
  {
    CFURLRef v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001477F4();
    }

    [(SDAirDropFileZipper *)self notifyClientForEvent:10 withProperty:v5];
  }
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100146C10;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSArray)sourceFiles
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSourceFiles:(id)a3
{
}

- (NSString)senderName
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSenderName:(id)a3
{
}

- (NSString)unzipCompressionType
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setUnzipCompressionType:(id)a3
{
}

- (NSString)zipCompressionType
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSSet)skipReadableCheckFiles
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSkipReadableCheckFiles:(id)a3
{
}

- (BOOL)disableAdaptiveCompressionForZipping
{
  return self->_disableAdaptiveCompressionForZipping;
}

- (void)setDisableAdaptiveCompressionForZipping:(BOOL)a3
{
  self->_disableAdaptiveCompressionForZipping = a3;
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3
{
  self->_shouldExtractMediaFromPhotosBundles = a3;
}

- (SDAirDropFileZipperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropFileZipperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skipReadableCheckFiles, 0);
  objc_storeStrong((id *)&self->_zipCompressionType, 0);
  objc_storeStrong((id *)&self->_unzipCompressionType, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_sourceFiles, 0);
  objc_storeStrong((id *)&self->_zipQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_creationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_compressionEngine, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_relativePathToFile, 0);
  objc_storeStrong((id *)&self->_orderedRelativePaths, 0);
  objc_storeStrong((id *)&self->_placeholderFiles, 0);
  objc_storeStrong((id *)&self->_topLevelFiles, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_bomPath, 0);

  objc_storeStrong((id *)&self->_tempFolder, 0);
}

@end