@interface BKLibraryAudiobookProgress
- (BKLibraryAudiobookProgress)initWithKind:(id)a3 instance:(id)a4 parameters:(id)a5;
- (NSNumber)progress;
- (NSObject)instance;
- (NSObject)parameters;
- (NSString)formattedProgress;
- (NSString)kind;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerProgressObserver:(id)a3;
- (void)setFormattedProgress:(id)a3;
- (void)setProgress:(id)a3;
- (void)togglePlayPause;
- (void)unregisterProgressObserver:(id)a3;
@end

@implementation BKLibraryAudiobookProgress

- (BKLibraryAudiobookProgress)initWithKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)BKLibraryAudiobookProgress;
  v12 = [(BKLibraryAudiobookProgress *)&v30 init];
  v13 = v12;
  if (v12)
  {
    id v29 = v9;
    objc_storeStrong((id *)&v12->_kind, a3);
    objc_storeStrong((id *)&v13->_instance, a4);
    objc_storeStrong((id *)&v13->_parameters, a5);
    uint64_t v14 = +[NSHashTable weakObjectsHashTable];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("BKLibraryAudiobookProgress.access", 0);
    access = v13->_access;
    v13->_access = (OS_dispatch_queue *)v16;

    objc_opt_class();
    v18 = BUDynamicCast();
    objc_opt_class();
    v19 = BCGetUnsafeAppDelegateReference();
    v20 = BUDynamicCast();
    v21 = [v20 sceneManager];

    v22 = [v21 minifiedPresenter];
    v23 = [v22 minifiedPresenterAssetCurrentPresenterForAssetID:v18];
    v24 = [v23 minifiedAssetStatus];
    objc_opt_class();
    v25 = BUClassAndProtocolCast();

    objc_storeStrong((id *)&v13->_audiobookStatus, v25);
    if ([(NSString *)v13->_kind isEqualToString:@"chapterProgress", &OBJC_PROTOCOL___AEAssetAudiobookStatus])
    {
      CFStringRef v26 = @"assetAudiobookStatusTrackProgress";
      v27 = &off_100B222D0;
      id v9 = v29;
    }
    else
    {
      id v9 = v29;
      if (![(NSString *)v13->_kind isEqualToString:@"timeRemaining"])
      {
LABEL_7:

        goto LABEL_8;
      }
      CFStringRef v26 = @"assetAudiobookStatusTrackTimeRemaining";
      v27 = &off_100B222D8;
    }
    [(AEAssetAudiobookStatus *)v13->_audiobookStatus addObserver:v13 forKeyPath:v26 options:0 context:*v27];
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (void)dealloc
{
  if ([(NSString *)self->_kind isEqualToString:@"chapterProgress"])
  {
    CFStringRef v3 = @"assetAudiobookStatusTrackProgress";
    v4 = &off_100B222D0;
LABEL_5:
    [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:v3 context:*v4];
    goto LABEL_6;
  }
  if ([(NSString *)self->_kind isEqualToString:@"timeRemaining"])
  {
    CFStringRef v3 = @"assetAudiobookStatusTrackTimeRemaining";
    v4 = &off_100B222D8;
    goto LABEL_5;
  }
LABEL_6:
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryAudiobookProgress;
  [(BKLibraryAudiobookProgress *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100B222D0 != a6 && off_100B222D8 != a6)
  {
    v10.receiver = self;
    v10.super_class = (Class)BKLibraryAudiobookProgress;
    -[BKLibraryAudiobookProgress observeValueForKeyPath:ofObject:change:context:](&v10, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
    return;
  }
  if ([(NSString *)self->_kind isEqualToString:@"chapterProgress", a4, a5])
  {
    [(AEAssetAudiobookStatus *)self->_audiobookStatus assetAudiobookStatusTrackProgress];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(BKLibraryAudiobookProgress *)self setProgress:v9];
  }
  else
  {
    if (![(NSString *)self->_kind isEqualToString:@"timeRemaining"]) {
      return;
    }
    [(AEAssetAudiobookStatus *)self->_audiobookStatus assetAudiobookStatusTrackTimeRemaining];
    id v9 = +[NSString stringWithDuration:-v8];
    [(BKLibraryAudiobookProgress *)self setFormattedProgress:v9];
  }
}

- (void)setFormattedProgress:(id)a3
{
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000717C;
  v20 = sub_10000728C;
  id v21 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100209050;
  block[3] = &unk_100A44058;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(access, block);
  objc_storeStrong((id *)&self->_formattedProgress, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)v17[5];
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) dynamicProgressChanged:self v11];
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)setProgress:(id)a3
{
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10000717C;
  v20 = sub_10000728C;
  id v21 = 0;
  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100209288;
  block[3] = &unk_100A44058;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(access, block);
  objc_storeStrong((id *)&self->_progress, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)v17[5];
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) dynamicProgressChanged:self v11];
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)registerProgressObserver:(id)a3
{
  id v4 = a3;
  access = self->_access;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020936C;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(access, v7);
}

- (void)unregisterProgressObserver:(id)a3
{
  id v4 = a3;
  access = self->_access;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100209410;
  v7[3] = &unk_100A43DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(access, v7);
}

- (void)togglePlayPause
{
}

- (NSString)kind
{
  return self->_kind;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)parameters
{
  return self->_parameters;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (NSString)formattedProgress
{
  return self->_formattedProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_storeStrong((id *)&self->_access, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end