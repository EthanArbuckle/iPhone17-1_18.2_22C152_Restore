@interface RCShareableComposition
+ (id)_copyResourcesForRecording:(id)a3 toDirectory:(id)a4;
+ (id)_createTemporaryDirectory;
+ (void)_accessRecording:(id)a3 withBlock:(id)a4;
- (BOOL)registerAudioFileRepresentationWithItemProvider:(id)a3 error:(id *)a4;
- (NSMutableArray)temporaryDirectories;
- (NSString)customSubject;
- (NSString)recordingUUID;
- (NSString)title;
- (RCComposition)composition;
- (RCShareableComposition)initWithComposition:(id)a3;
- (id)_cachedItemsForActivityTypes;
- (id)_cachedSubjectsForActivityTypes;
- (id)_cachedThumbnailsForActivityTypes;
- (id)_createManagedTemporaryDirectory;
- (id)_fileTypeIdentifier;
- (id)_itemForActivityType:(id)a3;
- (id)_subjectForActivityType:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)placeholderURL;
- (void)_cleanUpManagedTemporaryDirectories;
- (void)dealloc;
- (void)setComposition:(id)a3;
- (void)setCustomSubject:(id)a3;
- (void)setTemporaryDirectories:(id)a3;
@end

@implementation RCShareableComposition

- (RCShareableComposition)initWithComposition:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCShareableComposition;
  v6 = [(RCShareableComposition *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_composition, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    temporaryDirectories = v7->_temporaryDirectories;
    v7->_temporaryDirectories = v8;
  }
  return v7;
}

- (NSString)recordingUUID
{
  v2 = [(RCShareableComposition *)self composition];
  v3 = [v2 savedRecordingUUID];

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = [(RCShareableComposition *)self composition];
  v3 = [v2 title];

  return (NSString *)v3;
}

+ (id)_createTemporaryDirectory
{
  v2 = +[NSFileManager defaultManager];
  v3 = NSTemporaryDirectory();
  v4 = +[NSURL fileURLWithPath:v3];
  id v5 = [v2 URLForDirectory:99 inDomain:1 appropriateForURL:v4 create:1 error:0];

  return v5;
}

- (id)_createManagedTemporaryDirectory
{
  v3 = self->_temporaryDirectories;
  objc_sync_enter(v3);
  v4 = [(id)objc_opt_class() _createTemporaryDirectory];
  if (v4) {
    [(NSMutableArray *)self->_temporaryDirectories addObject:v4];
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)_cleanUpManagedTemporaryDirectories
{
  v3 = +[NSFileManager defaultManager];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = self->_temporaryDirectories;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        unsigned __int8 v16 = 0;
        v10 = [v9 path];
        unsigned int v11 = [v3 fileExistsAtPath:v10 isDirectory:&v16];
        int v12 = v16;

        if (v11) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          uint64_t v15 = 0;
          if (([v3 removeItemAtURL:v9 error:&v15] & 1) == 0)
          {
            v14 = OSLogForCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_10016F158(buf, &v22, v14);
            }
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
}

- (void)dealloc
{
  [(RCShareableComposition *)self _cleanUpManagedTemporaryDirectories];
  v3.receiver = self;
  v3.super_class = (Class)RCShareableComposition;
  [(RCShareableComposition *)&v3 dealloc];
}

- (BOOL)registerAudioFileRepresentationWithItemProvider:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(RCShareableComposition *)self composition];
  uint64_t v7 = [v6 composedAVURL];

  v8 = [(RCShareableComposition *)self composition];
  v9 = [v8 savedRecordingUUID];

  v10 = +[NSFileManager defaultManager];
  unsigned int v11 = [v7 path];
  unsigned int v12 = [v10 isReadableFileAtPath:v11];

  if (v12)
  {
    BOOL v13 = [(RCShareableComposition *)self _fileTypeIdentifier];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000CDC8C;
    v15[3] = &unk_100223570;
    id v16 = v7;
    id v17 = v9;
    [v5 registerFileRepresentationForTypeIdentifier:v13 fileOptions:0 visibility:0 loadHandler:v15];
  }
  return 1;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return [(RCShareableComposition *)self placeholderURL];
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
LABEL_13:
    unsigned int v11 = 0;
    goto LABEL_14;
  }
  v8 = [(RCShareableComposition *)self composition];
  unsigned int v9 = [v8 compositionIsShareable];

  if (!v9)
  {
    uint64_t v15 = OSLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10016F1A8(self, v15);
    }

    goto LABEL_13;
  }
  v10 = [(RCShareableComposition *)self _cachedItemsForActivityTypes];
  unsigned int v11 = [v10 objectForKeyedSubscript:v7];
  if (!v11)
  {
    unsigned int v11 = [(RCShareableComposition *)self _itemForActivityType:v7];
    if (v11)
    {
      unsigned int v12 = +[RCShareMemoHelper customActivityTypes];
      unsigned __int8 v13 = [v12 containsObject:v7];

      unsigned __int8 v14 = [v7 isEqual:UIActivityTypeCopyToPasteboard];
      if ((v13 & 1) == 0 && (v14 & 1) == 0) {
        +[RCAnalyticsUtilities sendDidShareRecording];
      }
      [v10 setObject:v11 forKeyedSubscript:v7];
    }
  }

LABEL_14:

  return v11;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5 = a4;
  id v6 = [(RCShareableComposition *)self customSubject];

  if (v6)
  {
    id v7 = [(RCShareableComposition *)self customSubject];
  }
  else
  {
    v8 = [(RCShareableComposition *)self _cachedSubjectsForActivityTypes];
    id v7 = [v8 objectForKeyedSubscript:v5];
    if (!v7)
    {
      uint64_t v9 = [(RCShareableComposition *)self _subjectForActivityType:v5];
      if (v9)
      {
        id v7 = (__CFString *)v9;
        [v8 setObject:v9 forKeyedSubscript:v5];
      }
      else
      {
        id v7 = &stru_100228BC8;
      }
    }
  }

  return v7;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a4;
  uint64_t v9 = [(RCShareableComposition *)self _cachedThumbnailsForActivityTypes];
  v10 = [v9 objectForKeyedSubscript:v8];
  if (!v10)
  {
    unsigned int v11 = [(RCShareableComposition *)self composition];
    uint64_t v12 = (uint64_t)((void)[v11 hasMultipleTracks] << 63) >> 63;

    unsigned __int8 v13 = [(RCShareableComposition *)self composition];
    unsigned __int8 v14 = [v13 composedAVURL];
    uint64_t v15 = +[RCWaveform waveformURLForAVURL:v14 trackIndex:v12];

    v10 = 0;
    if ([v15 checkResourceIsReachableAndReturnError:0])
    {
      id v16 = [(RCShareableComposition *)self composition];
      v10 = +[RCWaveformSnapshotGenerator snapshotForComposition:size:](RCWaveformSnapshotGenerator, "snapshotForComposition:size:", v16, width, height);

      [v9 setObject:v10 forKeyedSubscript:v8];
    }
  }

  return v10;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = objc_alloc_init((Class)LPLinkMetadata);
  id v5 = objc_alloc_init((Class)LPFileMetadata);
  id v6 = [(RCShareableComposition *)self composition];
  id v7 = [v6 title];
  [v5 setName:v7];

  [v5 setIcon:0];
  id v8 = [(RCShareableComposition *)self _fileTypeIdentifier];
  [v5 setType:v8];

  uint64_t v9 = [(RCShareableComposition *)self composition];
  v10 = [v9 composedAVURL];
  id v18 = 0;
  id v17 = 0;
  unsigned int v11 = [v10 getResourceValue:&v18 forKey:NSURLFileSizeKey error:&v17];
  id v12 = v18;
  id v13 = v17;

  if (v11)
  {
    id v14 = [v12 unsignedLongLongValue];
  }
  else
  {
    uint64_t v15 = OSLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v20 = "-[RCShareableComposition activityViewControllerLinkMetadata:]";
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s -- Error reading file size: %@", buf, 0x16u);
    }

    id v14 = 0;
  }
  [v5 setSize:v14];
  [v4 setSpecialization:v5];

  return v4;
}

- (id)placeholderURL
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CE510;
  block[3] = &unk_100221278;
  block[4] = self;
  if (qword_10026A8A8 != -1) {
    dispatch_once(&qword_10026A8A8, block);
  }
  return (id)qword_10026A8B0;
}

+ (void)_accessRecording:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[RCApplicationContainer sharedContainer];
  id v8 = [v7 newBackgroundModel];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000CE640;
  v12[3] = &unk_1002221D0;
  id v13 = v8;
  id v14 = v5;
  id v15 = v6;
  id v9 = v6;
  id v10 = v5;
  id v11 = v8;
  [v11 performBlockAndWait:v12];
}

- (id)_itemForActivityType:(id)a3
{
  id v4 = [(RCShareableComposition *)self _createManagedTemporaryDirectory];
  id v5 = objc_opt_class();
  id v6 = [(RCShareableComposition *)self composition];
  id v7 = [v6 savedRecordingUUID];
  id v8 = [v5 _copyResourcesForRecording:v7 toDirectory:v4];

  return v8;
}

+ (id)_copyResourcesForRecording:(id)a3 toDirectory:(id)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1000CE864;
  id v17 = sub_1000CE874;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000CE87C;
  v10[3] = &unk_100223598;
  id v12 = &v13;
  id v7 = a4;
  id v11 = v7;
  [a1 _accessRecording:v6 withBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_subjectForActivityType:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000CE864;
  id v18 = sub_1000CE874;
  id v19 = 0;
  id v5 = objc_opt_class();
  id v6 = [(RCShareableComposition *)self composition];
  id v7 = [v6 savedRecordingUUID];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CEA38;
  v11[3] = &unk_100223598;
  uint64_t v13 = &v14;
  id v8 = v4;
  id v12 = v8;
  [v5 _accessRecording:v7 withBlock:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)_cachedItemsForActivityTypes
{
  id v4 = objc_getAssociatedObject(self, a2);
  if (!v4)
  {
    id v4 = objc_opt_new();
    objc_setAssociatedObject(self, a2, v4, (void *)0x301);
  }

  return v4;
}

- (id)_cachedSubjectsForActivityTypes
{
  id v4 = objc_getAssociatedObject(self, a2);
  if (!v4)
  {
    id v4 = objc_opt_new();
    objc_setAssociatedObject(self, a2, v4, (void *)0x301);
  }

  return v4;
}

- (id)_cachedThumbnailsForActivityTypes
{
  id v4 = objc_getAssociatedObject(self, a2);
  if (!v4)
  {
    id v4 = objc_opt_new();
    objc_setAssociatedObject(self, a2, v4, (void *)0x301);
  }

  return v4;
}

- (id)_fileTypeIdentifier
{
  v2 = [(RCShareableComposition *)self composition];
  objc_super v3 = [v2 composedAVURL];
  id v4 = [v3 pathExtension];
  id v5 = +[RCCaptureFormat AVFileTypeIdentifierForFileExtension:v4];

  return v5;
}

- (NSString)customSubject
{
  return self->_customSubject;
}

- (void)setCustomSubject:(id)a3
{
}

- (RCComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
}

- (NSMutableArray)temporaryDirectories
{
  return self->_temporaryDirectories;
}

- (void)setTemporaryDirectories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectories, 0);
  objc_storeStrong((id *)&self->_composition, 0);

  objc_storeStrong((id *)&self->_customSubject, 0);
}

@end