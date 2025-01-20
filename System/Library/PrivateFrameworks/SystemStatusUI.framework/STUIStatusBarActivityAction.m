@interface STUIStatusBarActivityAction
+ (id)actionForBackgroundActivityWithIdentifier:(id)a3;
@end

@implementation STUIStatusBarActivityAction

+ (id)actionForBackgroundActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__STUIStatusBarActivityAction_actionForBackgroundActivityWithIdentifier___block_invoke;
  v8[3] = &unk_1E6AA3AE0;
  id v9 = v4;
  id v5 = v4;
  v6 = [a1 actionWithBlock:v8];

  return v6;
}

uint64_t __73__STUIStatusBarActivityAction_actionForBackgroundActivityWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = STUIStyleOverrideForBackgroundActivityIdentifier(*(void **)(a1 + 32));
  id v5 = (void **)MEMORY[0x1E4FB2608];
  char v6 = objc_opt_respondsToSelector();
  v7 = *v5;
  if (v6) {
    unsigned int v8 = [v7 handleStatusBarTapForBackgroundActivityWithIdentifier:*(void *)(a1 + 32)];
  }
  else {
    unsigned int v8 = [v7 handleDoubleHeightStatusBarTapWithStyleOverride:v4];
  }
  if (v4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  if ((v8 & 1) == 0 && v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB17F8]) initWithStatusBarStyle:0 andStatusBarStyleOverride:v4];
    v11 = [v3 window];
    v12 = objc_msgSend(v11, "_StatusBar_fbsScene");
    v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    [v12 sendActions:v13];
  }
  return v9;
}

@end