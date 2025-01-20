@interface THNoteCardShapeLayout
- (CGRect)frameForCulling;
- (unsigned)naturalAlignmentForTextLayout:(id)a3;
- (unsigned)textLayoutShouldIgnoreEquationAlignment:(id)a3;
@end

@implementation THNoteCardShapeLayout

- (unsigned)textLayoutShouldIgnoreEquationAlignment:(id)a3
{
  return [(id)TSUCheckedDynamicCast() ignoreEquationAlignment];
}

- (CGRect)frameForCulling
{
  v24.receiver = self;
  v24.super_class = (Class)THNoteCardShapeLayout;
  [(THNoteCardShapeLayout *)&v24 frameForCulling];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  id v11 = [self containedLayout].children;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) frameForCulling];
        v29.origin.CGFloat x = x;
        v29.origin.CGFloat y = y;
        v29.size.CGFloat width = width;
        v29.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (unsigned)naturalAlignmentForTextLayout:(id)a3
{
  return (char *)[+[UIApplication sharedApplication] userInterfaceLayoutDirection] == (char *)&dword_0 + 1;
}

@end