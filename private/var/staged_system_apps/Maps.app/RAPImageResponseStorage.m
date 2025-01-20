@interface RAPImageResponseStorage
+ (id)baseFilePathWithSubmissionIdentifier:(id)a3;
+ (void)enumerateOverResponseFilePathsForSubmissionIdentifier:(id)a3 usingBlock:(id)a4;
- (BOOL)removeImageUploadObjectsForSubmissionIdentifier:(id)a3;
- (BOOL)saveResponseData:(id)a3 forSubmissionIdentifier:(id)a4 imageIdentifier:(id)a5;
- (id)fetchImageUploadObjectsForSubmissionIdentifier:(id)a3;
@end

@implementation RAPImageResponseStorage

+ (id)baseFilePathWithSubmissionIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[RAPFileManager baseSubmissionFilePath];
  v5 = [v4 URLByAppendingPathComponent:@"rap_image_responses" isDirectory:1];
  v6 = [v5 URLByAppendingPathComponent:v3 isDirectory:1];

  return v6;
}

- (BOOL)saveResponseData:(id)a3 forSubmissionIdentifier:(id)a4 imageIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = +[RAPImageResponseStorage baseFilePathWithSubmissionIdentifier:a4];
  BOOL v10 = +[RAPFileManager saveData:v8 toDirectory:v9 filename:v7];

  return v10;
}

- (id)fetchImageUploadObjectsForSubmissionIdentifier:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1007C04AC;
  BOOL v10 = &unk_1012F8D08;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v12;
  id v4 = v11;
  +[RAPImageResponseStorage enumerateOverResponseFilePathsForSubmissionIdentifier:v4 usingBlock:&v7];
  id v5 = [v3 copy:v7, v8, v9, v10];

  return v5;
}

- (BOOL)removeImageUploadObjectsForSubmissionIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007C0658;
  v6[3] = &unk_1012F8D30;
  v6[4] = &v7;
  +[RAPImageResponseStorage enumerateOverResponseFilePathsForSubmissionIdentifier:v3 usingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)enumerateOverResponseFilePathsForSubmissionIdentifier:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = +[NSFileManager defaultManager];
  uint64_t v8 = +[RAPImageResponseStorage baseFilePathWithSubmissionIdentifier:v5];
  uint64_t v9 = [v8 path];
  id v24 = 0;
  char v10 = [v7 contentsOfDirectoryAtPath:v9 error:&v24];
  id v19 = v24;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v17 = +[RAPImageResponseStorage baseFilePathWithSubmissionIdentifier:](RAPImageResponseStorage, "baseFilePathWithSubmissionIdentifier:", v5, v19);
        v18 = [v17 URLByAppendingPathComponent:v16];

        v6[2](v6, v16, v18);
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }
}

@end