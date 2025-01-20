@interface MFDiskCacheUtilities
+ (id)_pathsForContentWithType:(unint64_t)a3;
+ (id)mailSpaceWithError:(id *)a3;
+ (id)systemSpaceWithError:(id *)a3;
+ (int64_t)deletePlaceholderAttachments;
+ (int64_t)deletePlaceholderAttachmentsWithCreationDateOver:(int64_t)a3;
+ (int64_t)deleteTemporaryDirectoryContent;
+ (int64_t)sizeForPurgeableTemporaryDirectoryContent;
+ (void)_enumerateContentPathsAndAttributes:(id)a3;
+ (void)_enumerateContentsForAccounts:(id)a3 withType:(unint64_t)a4 handler:(id)a5;
+ (void)_enumeratePurgeableContentsWithType:(unint64_t)a3 handler:(id)a4;
+ (void)_enumeratePurgeableFileInTemporaryDirectoryWithHandler:(id)a3;
+ (void)deleteLocalAttachments;
+ (void)deleteLocalMessages;
@end

@implementation MFDiskCacheUtilities

+ (id)systemSpaceWithError:(id *)a3
{
  v4 = +[NSFileManager defaultManager];
  v5 = MFMailDirectory();
  id v12 = 0;
  v6 = [v4 attributesOfFileSystemForPath:v5 error:&v12];
  id v7 = v12;

  if (v6)
  {
    v8 = [v6 objectForKey:NSFileSystemSize];
    v9 = [v6 objectForKey:NSFileSystemFreeSize];
    v10 = +[NSDictionary dictionaryWithObjectsAndKeys:v8, @"MFFileSystemTotalSize", v9, @"MFFileSystemFreeSize", 0];
  }
  else
  {
    v10 = 0;
    if (a3 && v7)
    {
      v10 = 0;
      *a3 = v7;
    }
  }

  return v10;
}

+ (id)_pathsForContentWithType:(unint64_t)a3
{
  char v3 = a3;
  v4 = +[NSMutableArray array];
  v5 = v4;
  if ((v3 & 2) != 0) {
    [v4 addObject:@"/Attachments"];
  }
  if (v3) {
    [v5 addObject:@"/Messages"];
  }

  return v5;
}

+ (void)_enumerateContentsForAccounts:(id)a3 withType:(unint64_t)a4 handler:(id)a5
{
  id v21 = a3;
  id v24 = a5;
  if (!v24)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"MFDiskCacheUtilities.m", 102, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v9 = +[NSFileManager defaultManager];
  v22 = [a1 _pathsForContentWithType:a4];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  [v21 ef_flatMap:&stru_10060B578];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v11 = v22;
        id v12 = [v11 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v30;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(v11);
              }
              v15 = [v10 stringByAppendingPathComponent:*(void *)(*((void *)&v29 + 1) + 8 * (void)j)];
              v25[0] = _NSConcreteStackBlock;
              v25[1] = 3221225472;
              v25[2] = sub_100192AF4;
              v25[3] = &unk_10060B5E0;
              id v27 = v24;
              id v26 = v9;
              v28 = &v37;
              [v26 mf_enumerateAtPath:v15 withBlock:v25];
              BOOL v16 = *((unsigned char *)v38 + 24) == 0;

              if (!v16)
              {

                goto LABEL_20;
              }
            }
            id v12 = [v11 countByEnumeratingWithState:&v29 objects:v41 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v18);
  }
LABEL_20:

  _Block_object_dispose(&v37, 8);
}

+ (void)_enumeratePurgeableContentsWithType:(unint64_t)a3 handler:(id)a4
{
  id v7 = a4;
  v6 = +[MailAccount purgeableAccounts];
  [a1 _enumerateContentsForAccounts:v6 withType:a3 handler:v7];
}

+ (void)_enumerateContentPathsAndAttributes:(id)a3
{
  v5 = (void (**)(id, void *, void *, void *, unsigned char *))a3;
  if (!v5)
  {
    uint64_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"MFDiskCacheUtilities.m", 136, @"Invalid parameter not satisfying: %@", @"fileHandler" object file lineNumber description];
  }
  v6 = MFMailDirectory();
  id v7 = +[NSFileManager defaultManager];
  v8 = [v7 enumeratorAtPath:v6];
  char v14 = 0;
  v9 = [v8 nextObject];
  if (v9)
  {
    do
    {
      v10 = [v6 stringByAppendingPathComponent:v9];
      id v11 = [v7 attributesOfItemAtPath:v10 error:0];
      v5[2](v5, v7, v10, v11, &v14);

      id v12 = [v8 nextObject];

      if (!v12) {
        break;
      }
      v9 = v12;
    }
    while (!v14);
  }
}

+ (id)mailSpaceWithError:(id *)a3
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100193008;
  v10[3] = &unk_10060B608;
  v10[4] = &v23;
  v10[5] = &v11;
  v10[6] = &v15;
  v10[7] = &v19;
  [a1 _enumerateContentPathsAndAttributes:v10];
  v4 = +[NSNumber numberWithUnsignedLongLong:v24[3]];
  v5 = +[NSNumber numberWithUnsignedLongLong:v16[3]];
  v6 = +[NSNumber numberWithUnsignedLongLong:v12[3]];
  id v7 = +[NSNumber numberWithUnsignedLongLong:v20[3]];
  v8 = +[NSDictionary dictionaryWithObjectsAndKeys:v4, @"MFMailTotalCacheSize", v5, @"MFMailMessageCacheSize", v6, @"MFMailAttachmentCacheSize", v7, @"MFMailHeaderCacheSize", 0];

  if (a3) {
    *a3 = 0;
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v8;
}

+ (int64_t)sizeForPurgeableTemporaryDirectoryContent
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001931D8;
  v4[3] = &unk_10060B630;
  v4[4] = &v5;
  [a1 _enumeratePurgeableFileInTemporaryDirectoryWithHandler:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (int64_t)deletePlaceholderAttachments
{
  return (int64_t)_[a1 deletePlaceholderAttachmentsWithCreationDateOver:30];
}

+ (int64_t)deletePlaceholderAttachmentsWithCreationDateOver:(int64_t)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v4 = +[MFAttachmentPlaceholder placeholderDirectory];
  uint64_t v5 = +[NSFileManager defaultManager];
  v6 = +[NSCalendar currentCalendar];
  uint64_t v7 = +[NSDate date];
  uint64_t v8 = [v6 dateByAddingUnit:16 value:-a3 toDate:v7 options:0];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10019346C;
  v13[3] = &unk_10060B658;
  id v14 = v8;
  BOOL v16 = &v17;
  id v9 = v5;
  id v15 = v9;
  id v10 = v8;
  [v9 mf_enumerateAtPath:v4 withBlock:v13];
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (int64_t)deleteTemporaryDirectoryContent
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100193618;
  v4[3] = &unk_10060B630;
  v4[4] = &v5;
  [a1 _enumeratePurgeableFileInTemporaryDirectoryWithHandler:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)_enumeratePurgeableFileInTemporaryDirectoryWithHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"MFDiskCacheUtilities.m", 256, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v6 = +[NSCalendar currentCalendar];
  uint64_t v7 = +[NSDate date];
  uint64_t v8 = [v6 dateByAddingUnit:64 value:-30 toDate:v7 options:0];

  id v9 = NSTemporaryDirectory();
  id v10 = +[NSFileManager defaultManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100193920;
  v14[3] = &unk_10060B680;
  id v11 = v8;
  id v15 = v11;
  id v12 = v5;
  id v16 = v12;
  [v10 mf_enumerateAtPath:v9 withBlock:v14];
}

+ (void)deleteLocalAttachments
{
}

+ (void)deleteLocalMessages
{
}

@end