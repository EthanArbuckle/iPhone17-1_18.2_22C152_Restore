@interface TypistKeyboardEmoji
+ (BOOL)scrollEmojiKeyboard;
+ (id)findEmojiScrollView;
+ (void)resetSelectedCategory;
- (id)generateKeystrokeStream:(id)a3;
- (id)init:(id)a3 options:(id)a4;
@end

@implementation TypistKeyboardEmoji

- (id)init:(id)a3 options:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardEmoji;
  id v5 = [(TypistKeyboard *)&v7 setupKeyboardInfo:a3 options:a4];
  [(TypistKeyboard *)self setUsePopupKeys:0];
  return self;
}

+ (void)resetSelectedCategory
{
}

void __44__TypistKeyboardEmoji_resetSelectedCategory__block_invoke()
{
  id v1 = [MEMORY[0x263F1C730] sharedInstance];
  [v1 setSelectedCategoryType:0];
  v0 = [MEMORY[0x263F1C718] categoryForType:0];
  [v1 setEmojiCategoryDefaultsIndex:0 forCategory:v0];
}

+ (id)findEmojiScrollView
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__TypistKeyboardEmoji_findEmojiScrollView__block_invoke;
  v4[3] = &unk_265559710;
  v4[4] = &v5;
  +[TypistKeyboardUtilities runOnMainThread:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__TypistKeyboardEmoji_findEmojiScrollView__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F1C738] activeInstance];
  v3 = [v2 _layout];
  v4 = [v3 currentKeyplaneView];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = v4;
  id obj = [v4 subviews];
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      uint64_t v17 = v6;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
        NSClassFromString(&cfstr_Uikeyboardemoj.isa);
        if (objc_opt_isKindOfClass())
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v10 = [v9 subviews];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
                NSClassFromString(&cfstr_Uikeyboardemoj_0.isa);
                if (objc_opt_isKindOfClass()) {
                  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v15);
                }
                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }

          uint64_t v6 = v17;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
}

+ (BOOL)scrollEmojiKeyboard
{
  id v2 = +[TypistKeyboardEmoji findEmojiScrollView];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  if (!v2) {
    goto LABEL_7;
  }
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3010000000;
  v29[3] = &unk_26042309E;
  long long v30 = *MEMORY[0x263F00148];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3010000000;
  v27[3] = &unk_26042309E;
  long long v28 = v30;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__5;
  long long v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke;
  v13[3] = &unk_265559AD0;
  v16 = &v21;
  id v4 = v3;
  id v14 = v4;
  id v15 = v2;
  uint64_t v17 = &v35;
  v18 = &v31;
  long long v19 = v29;
  long long v20 = v27;
  +[TypistKeyboardUtilities runOnMainThread:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke_3;
  v12[3] = &unk_265559AF8;
  v12[4] = v29;
  v12[5] = v27;
  uint64_t v5 = [MEMORY[0x263F62CF8] eventStreamWithEventActions:v12];
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  do
  {
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;

    if (v9 > 30.0) {
      break;
    }
    +[TypistKeyboardUtilities launchRecapWithSyntheticEventStream:v5];
    +[TypistKeyboardUtilities waitFor:0.1];
  }
  while (!*((unsigned char *)v36 + 24));
  [v4 removeObserver:v22[5]];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  if (*((unsigned char *)v36 + 24)) {
    BOOL v10 = *((unsigned char *)v32 + 24) != 0;
  }
  else {
LABEL_7:
  }
    BOOL v10 = 0;
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v10;
}

void __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263F08A48] mainQueue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke_2;
  v24[3] = &unk_265559AA8;
  long long v26 = *(_OWORD *)(a1 + 56);
  id v25 = *(id *)(a1 + 40);
  uint64_t v5 = [v2 addObserverForName:@"DidEndSmoothScrolling" object:v3 queue:v4 usingBlock:v24];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 40) bounds];
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  CGFloat v12 = CGRectGetMaxX(v27) + -10.0;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v28);
  uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
  *(CGFloat *)(v14 + 32) = v12;
  *(CGFloat *)(v14 + 40) = MidY;
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", 0, *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  *(void *)(v15 + 32) = v16;
  *(void *)(v15 + 40) = v17;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat v18 = CGRectGetMinX(v29) + 10.0;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat v19 = CGRectGetMidY(v30);
  uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
  *(CGFloat *)(v20 + 32) = v18;
  *(CGFloat *)(v20 + 40) = v19;
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", 0, *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
  *(void *)(v21 + 32) = v22;
  *(void *)(v21 + 40) = v23;
}

uint64_t __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  [*(id *)(a1 + 32) contentOffset];
  double v5 = v3 + v4;
  uint64_t result = [*(id *)(a1 + 32) contentSize];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 >= v7;
  return result;
}

void __42__TypistKeyboardEmoji_scrollEmojiKeyboard__block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x263F62CC8];
  id v14 = a2;
  double v4 = [v3 touchScreenDigitizerSender];
  [v14 setSenderProperties:v4];

  double v5 = NSStringFromCGPoint(*(CGPoint *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  uint64_t v13 = NSStringFromCGPoint(*(CGPoint *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  TYLog(@"Scrolling emoji keyboard from %@ to %@", v6, v7, v8, v9, v10, v11, v12, (char)v5);

  objc_msgSend(v14, "dragWithStartPoint:endPoint:duration:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0.1);
}

- (id)generateKeystrokeStream:(id)a3
{
  return 0;
}

@end