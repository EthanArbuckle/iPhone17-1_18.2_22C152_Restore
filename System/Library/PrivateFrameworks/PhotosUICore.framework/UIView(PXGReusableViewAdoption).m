@interface UIView(PXGReusableViewAdoption)
- (BOOL)pxg_hasSuperview;
- (BOOL)pxg_isChildOfView:()PXGReusableViewAdoption;
- (uint64_t)canUnloadWhenInvisible;
- (uint64_t)isFloating;
- (uint64_t)pxg_insertIntoView:()PXGReusableViewAdoption atIndex:;
- (uint64_t)pxg_isChildOfScrollViewController:()PXGReusableViewAdoption;
- (uint64_t)pxg_prepareForReuse;
- (uint64_t)pxg_shiftPosition:()PXGReusableViewAdoption;
- (uint64_t)shouldReloadForUserData:()PXGReusableViewAdoption;
- (uint64_t)shouldReuseWhenInvisible;
- (void)pxg_addToHostingView:()PXGReusableViewAdoption;
- (void)pxg_addToScrollViewController:()PXGReusableViewAdoption;
- (void)pxg_becomeReusable;
- (void)pxg_configureWithTexture:()PXGReusableViewAdoption geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:;
@end

@implementation UIView(PXGReusableViewAdoption)

- (uint64_t)isFloating
{
  return 0;
}

- (uint64_t)shouldReloadForUserData:()PXGReusableViewAdoption
{
  return 0;
}

- (uint64_t)canUnloadWhenInvisible
{
  return 1;
}

- (uint64_t)shouldReuseWhenInvisible
{
  return 0;
}

- (uint64_t)pxg_shiftPosition:()PXGReusableViewAdoption
{
  uint64_t result = [a1 isFloating];
  if ((result & 1) == 0)
  {
    [a1 center];
    PXPointAdd();
  }
  return result;
}

- (void)pxg_configureWithTexture:()PXGReusableViewAdoption geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:
{
  id v10 = a3;
  id v11 = a8;
  id v12 = a1;
  PXRectWithCenterAndSize();
}

- (uint64_t)pxg_prepareForReuse
{
  [a1 setHidden:0];
  return [a1 prepareForReuse];
}

- (void)pxg_becomeReusable
{
  [a1 setHidden:1];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [a1 setTransform:v4];
  id v3 = a1;
  [v3 setUserData:0];
  [v3 becomeReusable];
}

- (BOOL)pxg_hasSuperview
{
  v1 = [a1 superview];
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)pxg_isChildOfView:()PXGReusableViewAdoption
{
  id v4 = a3;
  id v5 = [a1 superview];

  return v5 == v4;
}

- (uint64_t)pxg_insertIntoView:()PXGReusableViewAdoption atIndex:
{
  return objc_msgSend(a3, "insertSubview:atIndex:", a1);
}

- (void)pxg_addToHostingView:()PXGReusableViewAdoption
{
  uint64_t v4 = *MEMORY[0x1E4F39EA8];
  id v6 = a3;
  id v5 = [a1 layer];
  [v5 setCornerCurve:v4];

  [v6 addHostedView:a1];
}

- (uint64_t)pxg_isChildOfScrollViewController:()PXGReusableViewAdoption
{
  return [a3 isSubview:a1];
}

- (void)pxg_addToScrollViewController:()PXGReusableViewAdoption
{
  uint64_t v4 = *MEMORY[0x1E4F39EA8];
  id v6 = a3;
  id v5 = [a1 layer];
  [v5 setCornerCurve:v4];

  [v6 addSubview:a1];
}

@end