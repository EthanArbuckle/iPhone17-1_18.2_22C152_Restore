@interface RCSavedRecordingsModel
+ (id)_copyFileIntoImportFilesTemporaryDirectory:(id)a3 error:(id *)a4;
+ (void)importFileWithURL:(id)a3 shouldUseMetadataTitle:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation RCSavedRecordingsModel

+ (id)_copyFileIntoImportFilesTemporaryDirectory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 lastPathComponent];
  if (v6)
  {
    v7 = +[NSFileManager defaultManager];
    v8 = RCRecordingsDirectoryURL();
    v9 = [v8 URLByAppendingPathComponent:@".ImportFilesTemporaryDirectory"];

    [v7 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];
    v10 = [v9 URLByAppendingPathComponent:v6];
    v11 = [v7 rc_uniqueFileSystemURLWithPreferredURL:v10];

    if ([v7 copyItemAtURL:v5 toURL:v11 error:a4]) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    a4 = v12;
  }
  else if (a4)
  {
    NSErrorUserInfoKey v16 = NSURLErrorKey;
    v13 = v5;
    if (!v5)
    {
      v13 = +[NSNull null];
    }
    v17 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *a4 = +[NSError errorWithDomain:NSURLErrorDomain code:-1000 userInfo:v14];

    if (!v5) {
    a4 = 0;
    }
  }

  return a4;
}

+ (void)importFileWithURL:(id)a3 shouldUseMetadataTitle:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v31 = 0;
  id v10 = [a1 _copyFileIntoImportFilesTemporaryDirectory:v8 error:&v31];
  id v11 = v31;
  if (v10)
  {
    id v12 = v10;

    v13 = +[AVURLAsset assetWithURL:v12];
    v14 = [v13 rc_recordingMetadata];
    v15 = [v14 objectForKeyedSubscript:@"title"];
    NSErrorUserInfoKey v16 = [v14 objectForKeyedSubscript:@"date"];
    v23 = v13;
    if (v6 && v15)
    {
      id v17 = v15;
    }
    else
    {
      v18 = [v12 lastPathComponent];
      id v17 = [v18 stringByDeletingPathExtension];
    }
    v19 = v16;
    if (!v16)
    {
      v30 = 0;
      [v12 getResourceValue:&v30 forKey:NSURLCreationDateKey error:0];
      v19 = v30;
    }
    id v20 = v19;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10009BB20;
    v24[3] = &unk_100222CC0;
    id v25 = v12;
    id v26 = v17;
    id v27 = v20;
    id v8 = v25;
    id v28 = v8;
    id v29 = v9;
    id v21 = v20;
    id v22 = v17;
    +[RCSavedRecordingsModel determineImportabilityOfRecordingWithAudioURL:v8 completionHandler:v24];
  }
  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v11);
  }
}

@end