@interface APBatchesCounter
- (APBatchesCounter)initWithFileManager:(id)a3 startDirectory:(id)a4;
- (APStorageManager)fileManager;
- (NSString)startDirectory;
- (int64_t)count;
- (void)setFileManager:(id)a3;
- (void)setStartDirectory:(id)a3;
@end

@implementation APBatchesCounter

- (APBatchesCounter)initWithFileManager:(id)a3 startDirectory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APBatchesCounter;
  v9 = [(APBatchesCounter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    objc_storeStrong((id *)&v10->_startDirectory, a4);
  }

  return v10;
}

- (int64_t)count
{
  v3 = [(APBatchesCounter *)self fileManager];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v4 = [(APBatchesCounter *)self startDirectory];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100123580;
  v7[3] = &unk_100236928;
  v7[4] = &v8;
  [v3 dfsWithStartPath:v4 nodeCallback:v7];

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (APStorageManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (NSString)startDirectory
{
  return self->_startDirectory;
}

- (void)setStartDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDirectory, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end