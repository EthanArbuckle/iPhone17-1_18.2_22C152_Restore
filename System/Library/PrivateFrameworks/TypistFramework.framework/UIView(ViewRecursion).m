@interface UIView(ViewRecursion)
+ (uint64_t)viewExistsOnScreen:()ViewRecursion;
- (id)allSubViews;
@end

@implementation UIView(ViewRecursion)

- (id)allSubViews
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  id v10 = [MEMORY[0x263EFF980] array];
  [(id)v6[5] addObject:a1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__UIView_ViewRecursion__allSubViews__block_invoke;
  v4[3] = &unk_265559758;
  v4[4] = a1;
  v4[5] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (uint64_t)viewExistsOnScreen:()ViewRecursion
{
  id v3 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__7;
  v28[4] = __Block_byref_object_dispose__7;
  id v29 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__UIView_ViewRecursion__viewExistsOnScreen___block_invoke;
  v16[3] = &unk_265559D88;
  v18 = v28;
  id v13 = v3;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;
  uint64_t v23 = v12;
  id v17 = v13;
  v19 = &v24;
  +[TypistKeyboardUtilities runOnMainThread:v16];
  uint64_t v14 = *((unsigned __int8 *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v28, 8);

  return v14;
}

@end