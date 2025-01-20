@interface RAPWebBundleDownloadManager
+ (id)sharedInstance;
+ (int64_t)creationPreference;
- (RAPWebBundleDownloadManager)initWithConfiguration:(id)a3;
@end

@implementation RAPWebBundleDownloadManager

+ (int64_t)creationPreference
{
  return 1;
}

- (RAPWebBundleDownloadManager)initWithConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPWebBundleDownloadManager;
  v3 = [(WebBundleDownloadManager *)&v6 initWithConfiguration:a3];
  v4 = v3;
  if (v3) {
    [(WebBundleDownloadManager *)v3 downloadWebBundle];
  }
  return v4;
}

+ (id)sharedInstance
{
  if (qword_1016109C8 != -1) {
    dispatch_once(&qword_1016109C8, &stru_10131A6D8);
  }
  v2 = (void *)qword_1016109D0;

  return v2;
}

@end