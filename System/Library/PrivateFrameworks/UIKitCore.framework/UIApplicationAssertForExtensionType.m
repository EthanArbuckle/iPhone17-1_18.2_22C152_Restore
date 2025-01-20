@interface UIApplicationAssertForExtensionType
@end

@implementation UIApplicationAssertForExtensionType

void ___UIApplicationAssertForExtensionType_block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 infoDictionary];
  id v4 = [v1 objectForKey:@"NSExtension"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v4 objectForKey:@"NSExtensionPointIdentifier"];
    v3 = (void *)qword_1EB25B5D0;
    qword_1EB25B5D0 = v2;
  }
}

@end