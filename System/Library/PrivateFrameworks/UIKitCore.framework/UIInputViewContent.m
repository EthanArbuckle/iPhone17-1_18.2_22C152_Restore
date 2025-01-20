@interface UIInputViewContent
@end

@implementation UIInputViewContent

void __47___UIInputViewContent__sizeFittingContentViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  double Width = CGRectGetWidth(v16);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (Width > *(double *)(v5 + 24)) {
    *(double *)(v5 + 24) = Width;
  }
  [v3 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  double Height = CGRectGetHeight(v17);
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  if (Height > *(double *)(v15 + 24)) {
    *(double *)(v15 + 24) = Height;
  }
}

@end