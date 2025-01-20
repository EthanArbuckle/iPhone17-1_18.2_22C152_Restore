@interface UIConstraintBasedLayoutLogUnsatisfiableWithDefault
@end

@implementation UIConstraintBasedLayoutLogUnsatisfiableWithDefault

void ___UIConstraintBasedLayoutLogUnsatisfiableWithDefault_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  byte_1EB25A5AD = *(unsigned char *)(a1 + 32);
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"_UIConstraintBasedLayoutLogUnsatisfiable");
  if (v2)
  {
    int v3 = [v2 BOOLValue];
    byte_1EB25A5AD = v3;
  }
  else
  {
    int v3 = byte_1EB25A5AD;
  }
  if (v3 != *(unsigned __int8 *)(a1 + 32))
  {
    v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &qword_1EB25A610) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = @"ON";
      if (!byte_1EB25A5AD) {
        v5 = @"OFF";
      }
      int v6 = 138412546;
      v7 = @"_UIConstraintBasedLayoutLogUnsatisfiable";
      __int16 v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%@ is %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

@end