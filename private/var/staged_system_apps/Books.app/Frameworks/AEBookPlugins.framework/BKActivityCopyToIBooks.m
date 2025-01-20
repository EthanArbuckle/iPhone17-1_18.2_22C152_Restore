@interface BKActivityCopyToIBooks
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSURL)url;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation BKActivityCopyToIBooks

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return @"com.apple.iBooks.CopyInPlace";
}

- (id)activityTitle
{
  v2 = AEBundle();
  v3 = [v2 localizedStringForKey:@"Copy to Books" value:&stru_1DF0D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage imageNamed:@"CopyToiBooksLibrary"];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  v4 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        v7 = BUDynamicCast();

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = (char *)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        uint64_t v9 = BUDynamicCast();
        if (v9)
        {
          long long v10 = (void *)v9;
          -[BKActivityCopyToIBooks setUrl:](self, "setUrl:", v9, v11);

          goto LABEL_11;
        }
      }
      v6 = (char *)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)performActivity
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(BKActivityCopyToIBooks *)self url];
  id v18 = 0;
  uint64_t v5 = [v3 URLForDirectory:99 inDomain:1 appropriateForURL:v4 create:1 error:&v18];
  id v6 = v18;

  if (!v6)
  {
    uint64_t v7 = [(BKActivityCopyToIBooks *)self url];
    v8 = [v7 lastPathComponent];
    uint64_t v9 = [v5 URLByAppendingPathComponent:v8 isDirectory:0];

    long long v10 = +[NSFileManager defaultManager];
    long long v11 = [(BKActivityCopyToIBooks *)self url];
    uint64_t v17 = 0;
    unsigned int v12 = [v10 copyItemAtURL:v11 toURL:v9 error:&v17];

    if (v12)
    {
      v19[0] = UIApplicationOpenURLOptionsAnnotationKey;
      v19[1] = @"BKApplicationImportInPlaceKey";
      v20[0] = &__NSDictionary0__struct;
      v20[1] = &__kCFBooleanTrue;
      long long v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      long long v14 = +[UIApplication sharedApplication];
      v15 = [v14 delegate];

      v16 = +[UIApplication sharedApplication];
      [v15 application:v16 openURL:v9 options:v13];
    }
  }
  [(BKActivityCopyToIBooks *)self activityDidFinish:0];
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end