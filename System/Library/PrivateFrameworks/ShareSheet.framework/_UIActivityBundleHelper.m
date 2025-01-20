@interface _UIActivityBundleHelper
+ (id)activityBundleHelperForExtension:(id)a3;
- (LSBundleProxy)bundleProxy;
- (_UIActivityBundleHelper)init;
- (_UIActivityBundleHelper)initWithBundleProxy:(id)a3;
- (id)debugDescription;
- (id)imageForApplicationIconFormat:(int)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6;
- (void)setBundleProxy:(id)a3;
@end

@implementation _UIActivityBundleHelper

+ (id)activityBundleHelperForExtension:(id)a3
{
  id v3 = a3;
  v4 = [v3 _extensionBundle];

  if (!v4)
  {
    v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[_UIActivityBundleHelper activityBundleHelperForExtension:](v3, v5);
    }
  }
  v6 = [v3 _plugIn];
  v7 = [v6 uuid];
  v8 = [MEMORY[0x1E4F22458] pluginKitProxyForUUID:v7];
  if (!v8)
  {
    v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_UIActivityBundleHelper activityBundleHelperForExtension:v9];
    }

    v10 = (void *)MEMORY[0x1E4F22458];
    v11 = [v3 identifier];
    v8 = [v10 pluginKitProxyForIdentifier:v11];

    if (!v8)
    {
      v12 = share_sheet_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[_UIActivityBundleHelper activityBundleHelperForExtension:v12];
      }

      v8 = 0;
    }
  }
  v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBundleProxy:v8];

  return v13;
}

- (_UIActivityBundleHelper)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[_UIActivityBundleHelper init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (_UIActivityBundleHelper)initWithBundleProxy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIActivityBundleHelper;
  v5 = [(_UIActivityBundleHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIActivityBundleHelper *)v5 setBundleProxy:v4];
  }

  return v6;
}

- (id)debugDescription
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_UIActivityBundleHelper;
  id v4 = [(_UIActivityBundleHelper *)&v8 description];
  v5 = [(_UIActivityBundleHelper *)self bundleProxy];
  v6 = [v3 stringWithFormat:@"%@ {bundle = %@}", v4, v5];

  return v6;
}

- (id)imageForApplicationIconFormat:(int)a3 activityCategory:(int64_t)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6
{
  BOOL v9 = a4 != 1;
  BOOL v10 = a3 != 10;
  v11 = (id *)MEMORY[0x1E4F6F2B8];
  if (a3 == 10) {
    v11 = (id *)MEMORY[0x1E4F6F298];
  }
  v12 = (objc_class *)MEMORY[0x1E4F6F248];
  id v13 = *v11;
  id v14 = [v12 alloc];
  v15 = [(_UIActivityBundleHelper *)self bundleProxy];
  v16 = (void *)[v14 initWithResourceProxy:v15];

  id v17 = objc_alloc_init(MEMORY[0x1E4F6F268]);
  v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v18 scale];
  double v20 = v19;

  [v17 setScale:v20];
  v21 = [MEMORY[0x1E4FB16C8] currentDevice];
  objc_msgSend(v21, "sh_hostUserInterfaceIdiom");
  [v17 setSize:3];
  v22 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:v13];

  [v22 setTemplateVariant:v9];
  [v22 setDrawBorder:v10];
  if (a4 == 1)
  {
    uint64_t v23 = [(objc_class *)getSFUIActivityImageProviderClass_0() tintImageDescriptor:v22 withUserInterfaceStyle:a6 forGraphicIcon:0];

    v22 = (void *)v23;
  }
  v24 = [v16 imageForDescriptor:v17];
  if (!v24)
  {
    v24 = [v16 imageForImageDescriptor:v22];
  }
  v25 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v26 = [v24 CGImage];
  [v24 scale];
  v27 = objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v26, 0);

  return v27;
}

- (LSBundleProxy)bundleProxy
{
  return self->_bundleProxy;
}

- (void)setBundleProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)activityBundleHelperForExtension:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 identifier];
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_FAULT, "Cannot access extension's bundleProxy (extensionIdentifier=%{public}@; pluginIdentifier=%{public}@)",
    v5,
    0x16u);
}

+ (void)activityBundleHelperForExtension:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 identifier];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_ERROR, "Cannot access extension's bundleProxy with UUID (extensionIdentifier=%{public}@; pluginIdentifier=%{public}@)",
    v5,
    0x16u);
}

+ (void)activityBundleHelperForExtension:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 identifier];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Cannot access extension bundle (extensionIdentifier=%{public}@)", (uint8_t *)&v4, 0xCu);
}

@end