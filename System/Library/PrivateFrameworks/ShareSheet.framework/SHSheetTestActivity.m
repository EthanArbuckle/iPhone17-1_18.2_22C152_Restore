@interface SHSheetTestActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSArray)activityItems;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
- (void)setActivityItems:(id)a3;
@end

@implementation SHSheetTestActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return @"com.apple.SharingDemoAppWatch.DemoAppWatch.log";
}

- (id)activityTitle
{
  return @"Log";
}

- (id)activityImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  v4 = [v2 systemImageNamed:@"pencil" withConfiguration:v3];

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = self->_activityItems;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
LABEL_8:
          v9 = v8;
          v10 = [v8 registeredTypeIdentifiers];
          v11 = [v10 firstObject];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __38__SHSheetTestActivity_performActivity__block_invoke;
          v15[3] = &unk_1E5A22C28;
          v15[4] = v7;
          [v9 loadItemForTypeIdentifier:v11 options:0 completionHandler:v15];

          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v7 item];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v8 = [v7 item];
            goto LABEL_8;
          }
        }
        NSLog(&stru_1EF308BA0.isa, v7);
LABEL_13:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  [(UIActivity *)self activityDidFinish:1];
}

void __38__SHSheetTestActivity_performActivity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    a2 = *(void *)(a1 + 32);
  }
  NSLog(&stru_1EF308BA0.isa, a2);
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end