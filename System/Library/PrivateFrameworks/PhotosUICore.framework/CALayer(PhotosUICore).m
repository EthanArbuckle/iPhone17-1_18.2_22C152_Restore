@interface CALayer(PhotosUICore)
- (uint64_t)px_setAnchorPoint:()PhotosUICore;
@end

@implementation CALayer(PhotosUICore)

- (uint64_t)px_setAnchorPoint:()PhotosUICore
{
  [a1 anchorPoint];
  double v23 = v6;
  double v24 = v7;
  objc_msgSend(a1, "setAnchorPoint:", a2, a3);
  [a1 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [a1 position];
  double v17 = v16;
  double v19 = v18;
  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  double v20 = v17 + CGRectGetWidth(v26) * (a2 - v23);
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.width = v13;
  v27.size.height = v15;
  double v21 = v19 + CGRectGetHeight(v27) * (a3 - v24);
  return objc_msgSend(a1, "setPosition:", v20, v21);
}

@end