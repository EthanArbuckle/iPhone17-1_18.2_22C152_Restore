@interface NSTextLayoutManager(UIKitAdditions)
- (double)ui_contentSizeForLastContainerView;
- (id)viewportRangeForTextContainer:()UIKitAdditions;
- (void)ui_ensureLayoutForViewportBoundsAtRange:()UIKitAdditions;
@end

@implementation NSTextLayoutManager(UIKitAdditions)

- (double)ui_contentSizeForLastContainerView
{
  uint64_t v20 = 0;
  v21 = (double *)&v20;
  uint64_t v22 = 0x3010000000;
  v23 = &unk_186D7DBA7;
  long long v24 = *MEMORY[0x1E4F1DB30];
  v2 = [a1 textContentManager];
  v3 = [v2 documentRange];
  v4 = [v3 endLocation];

  [a1 usageBoundsForTextContainer];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  if (CGRectGetWidth(v25) < 0.00000011920929)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__NSTextLayoutManager_UIKitAdditions__ui_contentSizeForLastContainerView__block_invoke;
    v18[3] = &unk_1E5304C98;
    v18[4] = &v20;
    v18[5] = v19;
    id v9 = (id)[a1 enumerateTextLayoutFragmentsFromLocation:v4 options:11 usingBlock:v18];
    _Block_object_dispose(v19, 8);
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v10 = 0.0;
  if (([off_1E52D2ED8 coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled] & 1) == 0)
  {
    v11 = [a1 textContainer];
    [v11 lineFragmentPadding];
    double v13 = v12;

    double v10 = v13 + v13;
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  v21[4] = v10 + CGRectGetWidth(v26);
  if (v4)
  {
LABEL_7:
    v14 = (void *)[objc_alloc((Class)off_1E52D2EF8) initWithLocation:v4];
    [a1 ensureLayoutForRange:v14];
    [a1 usageBoundsForTextContainer];
    v21[5] = CGRectGetHeight(v27);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__NSTextLayoutManager_UIKitAdditions__ui_contentSizeForLastContainerView__block_invoke_2;
    v17[3] = &unk_1E52F02D8;
    v17[4] = &v20;
    [a1 enumerateTextSegmentsInRange:v14 type:1 options:1 usingBlock:v17];
  }
LABEL_8:
  double v15 = v21[4];

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (void)ui_ensureLayoutForViewportBoundsAtRange:()UIKitAdditions
{
  id v13 = a3;
  v4 = [v13 endLocation];
  v5 = [a1 textContainerForLocation:v4];
  v6 = [v5 textViewportLayoutController];
  v7 = [v6 viewportRange];

  if ([v7 isNotEmpty]
    && (([v7 containsRange:v13] & 1) != 0
     || ([v7 endLocation],
         v8 = objc_claimAutoreleasedReturnValue(),
         int v9 = [v8 isEqual:v4],
         v8,
         v9)))
  {
    id v10 = objc_alloc((Class)off_1E52D2EF8);
    v11 = [v7 location];
    double v12 = (void *)[v10 initWithLocation:v11 endLocation:v4];

    [a1 ensureLayoutForRange:v12];
  }
  else
  {
    [a1 ensureLayoutForRange:v13];
  }
}

- (id)viewportRangeForTextContainer:()UIKitAdditions
{
  v3 = [a3 textViewportLayoutController];
  v4 = [v3 viewportRange];

  return v4;
}

@end