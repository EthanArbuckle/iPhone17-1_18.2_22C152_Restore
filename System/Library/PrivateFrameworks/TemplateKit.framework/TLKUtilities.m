@interface TLKUtilities
+ (BOOL)deviceSupportsRotation;
+ (BOOL)isHiddenView:(id)a3;
+ (BOOL)isIpad;
+ (BOOL)isLargePhone;
+ (BOOL)isMacOS;
+ (BOOL)isPhone;
+ (BOOL)isSafari;
+ (BOOL)isShortcutsUI;
+ (BOOL)isSiri;
+ (BOOL)isWatchOS;
+ (BOOL)isXROS;
+ (BOOL)recursivelyCheckIfSubviewTapped:(id)a3 forTappedView:(id)a4;
+ (double)appIconCornerRadiusRatio;
+ (double)pixelWidthForView:(id)a3;
+ (double)standardRoundedCornerRadiusRatio;
+ (double)standardTableCellContentInset;
+ (id)testImageWithSize:(CGSize)a3;
+ (id)testImageWithSize:(CGSize)a3 color:(id)a4;
+ (id)testImageWithSize:(CGSize)a3 text:(id)a4;
+ (id)testImageWithSize:(CGSize)a3 text:(id)a4 color:(id)a5;
+ (void)dispatchAsync:(id)a3;
+ (void)dispatchAsyncIfNecessary:(id)a3;
+ (void)dispatchMainIfNecessary:(id)a3;
+ (void)executeBlock:(id)a3 async:(BOOL)a4;
+ (void)performAnimatableChanges:(id)a3;
+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4;
+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4 completion:(id)a5;
+ (void)performWithoutAnimations:(id)a3;
@end

@implementation TLKUtilities

+ (BOOL)isMacOS
{
  return 0;
}

+ (double)standardTableCellContentInset
{
  int v2 = [a1 isLargePhone];
  double result = 16.0;
  if (v2) {
    return 20.0;
  }
  return result;
}

+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v7 = (void (**)(void))a3;
  v8 = (void (**)(void))a5;
  v9 = v8;
  if (v6)
  {
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__TLKUtilities_performAnimatableChanges_animated_completion___block_invoke;
    v11[3] = &unk_1E5FD31A8;
    v12 = v8;
    [v10 _animateUsingDefaultTimingWithOptions:6 animations:v7 completion:v11];
  }
  else
  {
    v7[2](v7);
    if (v9) {
      v9[2](v9);
    }
  }
}

+ (BOOL)isPhone
{
  int v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

+ (BOOL)isIpad
{
  int v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

+ (double)appIconCornerRadiusRatio
{
  if ((TLKSnippetModernizationEnabled() & 1) != 0 || !+[TLKUtilities isMacOS]) {
    return 0.225;
  }
  [a1 standardRoundedCornerRadiusRatio];
  return result;
}

+ (BOOL)isLargePhone
{
  int v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _referenceBounds];
  BOOL v3 = CGRectGetWidth(v5) >= 414.0;

  return v3;
}

uint64_t __61__TLKUtilities_performAnimatableChanges_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)dispatchMainIfNecessary:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F29060];
  block = (void (**)(void))a3;
  v4 = [v3 currentThread];
  int v5 = [v4 isMainThread];

  if (v5) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __22__TLKUtilities_isSiri__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  isSiri_isSiri = [v0 isEqualToString:@"com.apple.siri"];
}

+ (BOOL)isSiri
{
  if (isSiri_onceToken != -1) {
    dispatch_once(&isSiri_onceToken, &__block_literal_global_17);
  }
  return isSiri_isSiri;
}

+ (void)dispatchAsync:(id)a3
{
  uint64_t v3 = dispatchAsync__onceToken;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    int v5 = v4;
  }
  else
  {
    dispatch_once(&dispatchAsync__onceToken, &__block_literal_global_0);
    int v5 = v6;
  }
  dispatch_async((dispatch_queue_t)dispatchAsync__queue, v5);
}

void __30__TLKUtilities_dispatchAsync___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("tlkasyncqueue", attr);
  int v2 = (void *)dispatchAsync__queue;
  dispatchAsync__queue = (uint64_t)v1;
}

+ (void)dispatchAsyncIfNecessary:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  v7 = (void (**)(void))a3;
  int v5 = [v4 currentThread];
  int v6 = [v5 isMainThread];

  if (v6) {
    [a1 dispatchAsync:v7];
  }
  else {
    v7[2]();
  }
}

+ (void)executeBlock:(id)a3 async:(BOOL)a4
{
  if (a4) {
    [a1 dispatchAsyncIfNecessary:a3];
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

+ (BOOL)deviceSupportsRotation
{
  int v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _referenceBounds];
  BOOL v3 = CGRectGetHeight(v5) > 667.0;

  return v3;
}

+ (double)pixelWidthForView:(id)a3
{
  objc_msgSend(a3, "tlks_scale");
  if (v3 == 0.0)
  {
    id v4 = objc_opt_new();
    objc_msgSend(v4, "tlks_scale");
    double v6 = v5;
  }
  else
  {
    double v6 = v3;
  }
  return 1.0 / v6;
}

+ (double)standardRoundedCornerRadiusRatio
{
  int v2 = TLKSnippetModernizationEnabled();
  BOOL v3 = +[TLKUtilities isMacOS];
  double result = 0.166666667;
  if (v3) {
    double result = 0.1;
  }
  double v5 = 0.0666666667;
  if (v3) {
    double v5 = 0.0454545455;
  }
  if (!v2) {
    return v5;
  }
  return result;
}

+ (id)testImageWithSize:(CGSize)a3
{
  return (id)objc_msgSend(a1, "testImageWithSize:text:", 0, a3.width, a3.height);
}

+ (id)testImageWithSize:(CGSize)a3 color:(id)a4
{
  return (id)objc_msgSend(a1, "testImageWithSize:text:color:", 0, a4, a3.width, a3.height);
}

+ (id)testImageWithSize:(CGSize)a3 text:(id)a4
{
  return (id)objc_msgSend(a1, "testImageWithSize:text:color:", a4, 0, a3.width, a3.height);
}

+ (id)testImageWithSize:(CGSize)a3 text:(id)a4 color:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1618] blackColor];
  }
  v12 = v11;
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __45__TLKUtilities_testImageWithSize_text_color___block_invoke;
  v23 = &unk_1E5FD3180;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  double v28 = width;
  double v29 = height;
  id v24 = v12;
  id v25 = v8;
  double v30 = width;
  double v31 = height;
  id v14 = v8;
  id v15 = v12;
  v16 = [v13 imageWithActions:&v20];
  v17 = [TLKImage alloc];
  v18 = -[TLKImage initWithImage:](v17, "initWithImage:", v16, v20, v21, v22, v23);
  [(TLKImage *)v18 setIsTemplate:v10 == 0];

  return v18;
}

void __45__TLKUtilities_testImageWithSize_text_color___block_invoke(uint64_t a1, void *a2)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) set];
  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(void *)(a1 + 40))
  {
    double v4 = *(double *)(a1 + 80) * 0.05;
    [MEMORY[0x1E4FB1798] systemFontSize];
    double v6 = v5;
    v7 = *(void **)(a1 + 40);
    uint64_t v34 = *MEMORY[0x1E4FB12B0];
    uint64_t v8 = v34;
    id v9 = objc_msgSend(MEMORY[0x1E4FB1798], "systemFontOfSize:");
    v35[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    [v7 sizeWithAttributes:v10];
    double v12 = v11;

    double v13 = floor(v6 * ((*(double *)(a1 + 80) + v4 * -2.0) / v12));
    id v14 = *(void **)(a1 + 40);
    uint64_t v32 = v8;
    id v15 = [MEMORY[0x1E4FB1798] systemFontOfSize:v13];
    v33 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [v14 sizeWithAttributes:v16];
    double v18 = v17;
    double v20 = v19;

    CGContextSetBlendMode((CGContextRef)[v3 CGContext], kCGBlendModeClear);
    uint64_t v21 = [MEMORY[0x1E4FB1380] defaultParagraphStyle];
    v22 = (void *)[v21 mutableCopy];

    [v22 setAlignment:1];
    v23 = *(void **)(a1 + 40);
    +[TLKLayoutUtilities deviceScaledRoundedValue:0 forView:(*(double *)(a1 + 80) - v18) * 0.5];
    double v25 = v24;
    +[TLKLayoutUtilities deviceScaledRoundedValue:0 forView:(*(double *)(a1 + 88) - v20) * 0.5];
    double v27 = v26;
    v30[0] = v8;
    double v28 = [MEMORY[0x1E4FB1798] systemFontOfSize:v13];
    v30[1] = *MEMORY[0x1E4FB12D0];
    v31[0] = v28;
    v31[1] = v22;
    double v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    objc_msgSend(v23, "drawInRect:withAttributes:", v29, v25, v27, v18, v20);
  }
}

+ (BOOL)recursivelyCheckIfSubviewTapped:(id)a3 forTappedView:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 == v7)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    uint64_t v8 = [v6 subviews];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v10 = objc_msgSend(v6, "subviews", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        int v13 = 0;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v10);
            }
            v13 |= [a1 recursivelyCheckIfSubviewTapped:*(void *)(*((void *)&v17 + 1) + 8 * i) forTappedView:v7];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13 & 1;
}

+ (void)performAnimatableChanges:(id)a3
{
}

+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4
{
}

+ (void)performWithoutAnimations:(id)a3
{
}

+ (BOOL)isWatchOS
{
  return 0;
}

+ (BOOL)isXROS
{
  return 0;
}

+ (BOOL)isShortcutsUI
{
  int v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.ShortcutsUI"];

  return v4;
}

+ (BOOL)isSafari
{
  if (isSafari_onceToken != -1) {
    dispatch_once(&isSafari_onceToken, &__block_literal_global_26);
  }
  return isSafari_isSafari;
}

void __24__TLKUtilities_isSafari__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  isSafari_isSafaruint64_t i = [v0 isEqualToString:@"com.apple.mobilesafari"];
}

+ (BOOL)isHiddenView:(id)a3
{
  if (a3) {
    return [a3 isHidden];
  }
  else {
    return 1;
  }
}

@end