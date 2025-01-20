@interface MessageActivityViewController
+ (OS_os_log)log;
- (BOOL)sourceIsManaged;
- (MessageActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)setSourceIsManaged:(BOOL)a3;
@end

@implementation MessageActivityViewController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MessageActivityViewController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;
  return (OS_os_log *)v2;
}

void __36__MessageActivityViewController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

- (MessageActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MessageActivityViewController;
  v8 = [(MessageActivityViewController *)&v11 initWithActivityItems:v6 applicationActivities:v7];
  if (v8)
  {
    v12[0] = *MEMORY[0x1E4F9F3C8];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [(MessageActivityViewController *)v8 setExcludedActivityTypes:v9];
  }
  return v8;
}

- (void)setSourceIsManaged:(BOOL)a3
{
  self->_sourceIsManaged = a3;
}

- (BOOL)sourceIsManaged
{
  return self->_sourceIsManaged;
}

@end