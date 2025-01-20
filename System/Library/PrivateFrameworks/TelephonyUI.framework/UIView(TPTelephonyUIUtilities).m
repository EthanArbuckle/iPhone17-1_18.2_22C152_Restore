@interface UIView(TPTelephonyUIUtilities)
+ (void)tpSetSemanticContentAttribute_recursive:()TPTelephonyUIUtilities startingAtView:;
@end

@implementation UIView(TPTelephonyUIUtilities)

+ (void)tpSetSemanticContentAttribute_recursive:()TPTelephonyUIUtilities startingAtView:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = objc_msgSend(v6, "subviews", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(a1, "tpSetSemanticContentAttribute_recursive:startingAtView:", a3, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [v6 setSemanticContentAttribute:a3];
}

@end