@interface BSDescriptionBuilder(UIKitOrientationDebugging)
- (uint64_t)ui_appendOrientationDebugDescription:()UIKitOrientationDebugging withName:;
- (void)ui_appendOrientationDebugDescription:()UIKitOrientationDebugging withName:skipIfNil:;
- (void)ui_appendOrientationDebuggingArraySection:()UIKitOrientationDebugging withName:skipIfEmpty:;
@end

@implementation BSDescriptionBuilder(UIKitOrientationDebugging)

- (uint64_t)ui_appendOrientationDebugDescription:()UIKitOrientationDebugging withName:
{
  return objc_msgSend(a1, "ui_appendOrientationDebugDescription:withName:skipIfNil:", a3, a4, 0);
}

- (void)ui_appendOrientationDebugDescription:()UIKitOrientationDebugging withName:skipIfNil:
{
  id v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      v11 = v9;
    }
    else {
      v11 = &stru_1ED0E84C0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __107__BSDescriptionBuilder_UIKitOrientationDebugging__ui_appendOrientationDebugDescription_withName_skipIfNil___block_invoke;
    v12[3] = &unk_1E5305AE8;
    id v13 = v8;
    v14 = a1;
    [a1 appendCustomFormatWithName:v11 block:v12];
  }
  else if ((a5 & 1) == 0)
  {
    [a1 appendString:@"<nil>" withName:v9];
  }
}

- (void)ui_appendOrientationDebuggingArraySection:()UIKitOrientationDebugging withName:skipIfEmpty:
{
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 activeMultilinePrefix];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __114__BSDescriptionBuilder_UIKitOrientationDebugging__ui_appendOrientationDebuggingArraySection_withName_skipIfEmpty___block_invoke;
  v11[3] = &unk_1E5305B10;
  v11[4] = a1;
  [a1 appendArraySection:v9 withName:v8 multilinePrefix:v10 skipIfEmpty:a5 objectTransformer:v11];
}

@end