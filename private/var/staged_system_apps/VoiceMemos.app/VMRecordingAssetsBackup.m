@interface VMRecordingAssetsBackup
- (NSURL)composedAVURLBackup;
- (NSURL)temporaryDirectoryURL;
- (VMRecordingAssetsBackup)initWithComposedAVURL:(id)a3 duration:(double)a4 error:(id *)a5;
- (double)originalDuration;
- (void)dealloc;
- (void)setComposedAVURLBackup:(id)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
@end

@implementation VMRecordingAssetsBackup

- (VMRecordingAssetsBackup)initWithComposedAVURL:(id)a3 duration:(double)a4 error:(id *)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VMRecordingAssetsBackup;
  v9 = [(VMRecordingAssetsBackup *)&v22 init];
  if (!v9) {
    goto LABEL_4;
  }
  v10 = +[NSFileManager defaultManager];
  v11 = NSTemporaryDirectory();
  v12 = +[NSURL fileURLWithPath:v11];
  uint64_t v13 = [v10 URLForDirectory:99 inDomain:1 appropriateForURL:v12 create:1 error:a5];
  temporaryDirectoryURL = v9->_temporaryDirectoryURL;
  v9->_temporaryDirectoryURL = (NSURL *)v13;

  v15 = v9->_temporaryDirectoryURL;
  if (!v15)
  {

    goto LABEL_6;
  }
  v16 = [v8 lastPathComponent];
  uint64_t v17 = [(NSURL *)v15 URLByAppendingPathComponent:v16];
  composedAVURLBackup = v9->_composedAVURLBackup;
  v9->_composedAVURLBackup = (NSURL *)v17;

  v9->_originalDuration = a4;
  unsigned int v19 = [v10 copyItemAtURL:v8 toURL:v9->_composedAVURLBackup error:a5];

  if (!v19)
  {
LABEL_6:
    v20 = 0;
    goto LABEL_7;
  }
LABEL_4:
  v20 = v9;
LABEL_7:

  return v20;
}

- (void)dealloc
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(VMRecordingAssetsBackup *)self temporaryDirectoryURL];
  [v3 removeItemAtURL:v4 error:0];

  v5.receiver = self;
  v5.super_class = (Class)VMRecordingAssetsBackup;
  [(VMRecordingAssetsBackup *)&v5 dealloc];
}

- (NSURL)composedAVURLBackup
{
  return self->_composedAVURLBackup;
}

- (void)setComposedAVURLBackup:(id)a3
{
}

- (double)originalDuration
{
  return self->_originalDuration;
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);

  objc_storeStrong((id *)&self->_composedAVURLBackup, 0);
}

@end