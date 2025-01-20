@interface SSAppWakeRequest
+ (id)familyContentRemovalRequestWithAppIdentifier:(id)a3 accountPairs:(id)a4;
+ (id)newsstandFinishRequestWithAppIdentifier:(id)a3 issueIdentifiers:(id)a4;
- (BOOL)shouldLaunchApp;
- (NSDictionary)launchOptions;
- (NSString)appIdentifier;
- (NSString)processAssertionIdentifier;
- (NSString)processAssertionReason;
- (double)processAssertionInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setProcessAssertionIdentifier:(id)a3;
- (void)setProcessAssertionInterval:(double)a3;
- (void)setProcessAssertionReason:(id)a3;
- (void)setShouldLaunchApp:(BOOL)a3;
@end

@implementation SSAppWakeRequest

+ (id)familyContentRemovalRequestWithAppIdentifier:(id)a3 accountPairs:(id)a4
{
  id v5 = a3;
  v6 = +[SSVFamilyContentDeletionEvent notificationPayloadWithAccountPairs:a4];
  if (v6)
  {
    v7 = objc_alloc_init(SSAppWakeRequest);
    [(SSAppWakeRequest *)v7 setAppIdentifier:v5];
    [(SSAppWakeRequest *)v7 setShouldLaunchApp:1];
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"UIApplicationLaunchOptionsDeletedFamilyContentKey", 0);
    [(SSAppWakeRequest *)v7 setLaunchOptions:v8];
    [(SSAppWakeRequest *)v7 setProcessAssertionIdentifier:@"com.apple.itunesstored.deletefamilycontent"];
    [(SSAppWakeRequest *)v7 setProcessAssertionInterval:10.0];
    [(SSAppWakeRequest *)v7 setProcessAssertionReason:@"ProcessAssertionReasonTaskCompletion"];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)newsstandFinishRequestWithAppIdentifier:(id)a3 issueIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SSAppWakeRequest);
  [(SSAppWakeRequest *)v7 setAppIdentifier:v6];

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"UIApplicationLaunchOptionsNewsstandDownloadsKey", 0);
  [(SSAppWakeRequest *)v7 setLaunchOptions:v8];
  [(SSAppWakeRequest *)v7 setShouldLaunchApp:1];
  [(SSAppWakeRequest *)v7 setProcessAssertionIdentifier:@"com.apple.itunesstored.finishdownload"];
  [(SSAppWakeRequest *)v7 setProcessAssertionInterval:10.0];
  [(SSAppWakeRequest *)v7 setProcessAssertionReason:@"ProcessAssertionReasonBackgroundDownload"];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSDictionary *)self->_launchOptions copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_processAssertionIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  *(double *)(v5 + 32) = self->_processAssertionInterval;
  uint64_t v12 = [(NSString *)self->_processAssertionReason copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  *(unsigned char *)(v5 + 48) = self->_shouldLaunchApp;
  return (id)v5;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void)setLaunchOptions:(id)a3
{
}

- (NSString)processAssertionIdentifier
{
  return self->_processAssertionIdentifier;
}

- (void)setProcessAssertionIdentifier:(id)a3
{
}

- (double)processAssertionInterval
{
  return self->_processAssertionInterval;
}

- (void)setProcessAssertionInterval:(double)a3
{
  self->_processAssertionInterval = a3;
}

- (NSString)processAssertionReason
{
  return self->_processAssertionReason;
}

- (void)setProcessAssertionReason:(id)a3
{
}

- (BOOL)shouldLaunchApp
{
  return self->_shouldLaunchApp;
}

- (void)setShouldLaunchApp:(BOOL)a3
{
  self->_shouldLaunchApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertionReason, 0);
  objc_storeStrong((id *)&self->_processAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end