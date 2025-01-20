@interface RAPImageStorage
+ (BOOL)removeImageWithImageIdentifier:(id)a3 directory:(id)a4;
+ (BOOL)saveImageWithImageIdentifier:(id)a3 imageData:(id)a4 directory:(id)a5;
+ (id)baseFilePath;
+ (id)filePathForSubmissionIdentifier:(id)a3;
+ (id)filePathForSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4;
- (BOOL)removeImageForSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4;
- (BOOL)saveImageWithSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4 imageData:(id)a5;
- (RAPImageStorage)initWithDelegate:(id)a3;
@end

@implementation RAPImageStorage

- (RAPImageStorage)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPImageStorage;
  v5 = [(RAPImageStorage *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

+ (id)filePathForSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4
{
  id v5 = a4;
  v6 = +[RAPImageStorage filePathForSubmissionIdentifier:a3];
  v7 = [v6 URLByAppendingPathComponent:v5];

  return v7;
}

+ (id)filePathForSubmissionIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[RAPImageStorage baseFilePath];
  id v5 = [v4 URLByAppendingPathComponent:v3];

  return v5;
}

+ (id)baseFilePath
{
  v2 = +[RAPFileManager baseSubmissionFilePath];
  id v3 = [v2 URLByAppendingPathComponent:@"rap_images" isDirectory:1];

  return v3;
}

- (BOOL)saveImageWithSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4 imageData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = +[RAPImageStorage filePathForSubmissionIdentifier:a3];
  BOOL v10 = +[RAPFileManager saveData:v7 toDirectory:v9 filename:v8];

  return v10;
}

- (BOOL)removeImageForSubmissionIdentifier:(id)a3 imageIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = +[RAPImageStorage filePathForSubmissionIdentifier:v6 imageIdentifier:a4];
  if (v7)
  {
    BOOL v8 = +[RAPFileManager removeItemAtFilePath:v7];
    v9 = +[RAPImageStorage filePathForSubmissionIdentifier:v6];
    unint64_t v10 = +[RAPFileManager numberOfItemsInDirectory:v9];

    if (!v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained imageStorage:self didFinishRemovingAllImagesForClientSubmissionIdentifier:v6];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)saveImageWithImageIdentifier:(id)a3 imageData:(id)a4 directory:(id)a5
{
  return +[RAPFileManager saveData:a4 toDirectory:a5 filename:a3];
}

+ (BOOL)removeImageWithImageIdentifier:(id)a3 directory:(id)a4
{
  id v4 = [a4 URLByAppendingPathComponent:a3];
  BOOL v5 = +[RAPFileManager removeItemAtFilePath:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end