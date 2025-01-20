@interface BEContentCleanupJSOptions
+ (id)cleanupJSOptionsForBookInfoSnapshot:(id)a3 withConfiguration:(id)a4;
@end

@implementation BEContentCleanupJSOptions

+ (id)cleanupJSOptionsForBookInfoSnapshot:(id)a3 withConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v6 isFixedLayout]) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [v5 style];
  unsigned int v9 = [v8 justification];

  uint64_t v10 = v9;
  id v11 = objc_alloc((Class)BEContentCleanupJSOptions);
  v12 = [v5 style];

  v13 = [v12 fontFamily];
  v14 = [v6 bookLanguage];
  v15 = [v6 respectImageSizeClass];
  id v16 = [v6 respectImageSizeClassIsPrefix];
  unsigned __int8 v17 = [v6 hasBuiltInFonts];

  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  LOBYTE(v20) = v17;
  id v18 = [v11 initWithMode:v7 useNewTextStyling:0 fontFamily:v13 language:v14 respectImageSizeClass:v15 respectImageSizeClassIsPrefix:v16 hasBuiltInFonts:0 justification:v10 fontWeight:0 overrideLineHeight:0 overrideLetterSpacing:0 overrideWordSpacing:0 readingMode:0];

  return v18;
}

@end