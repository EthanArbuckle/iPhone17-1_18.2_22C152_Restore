@interface UIViewShowAlignmentRects
@end

@implementation UIViewShowAlignmentRects

void ___UIViewShowAlignmentRects_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  byte_1EB25A5AE = 0;
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"UIViewShowAlignmentRects");
  if (v0)
  {
    int v1 = [v0 BOOLValue];
    byte_1EB25A5AE = v1;
    if (!v1) {
      return;
    }
  }
  else if (!byte_1EB25A5AE)
  {
    return;
  }
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &qword_1EB25A620) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = @"ON";
    if (!byte_1EB25A5AE) {
      v3 = @"OFF";
    }
    int v4 = 138412546;
    v5 = @"UIViewShowAlignmentRects";
    __int16 v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "%@ is %@", (uint8_t *)&v4, 0x16u);
  }
}

@end