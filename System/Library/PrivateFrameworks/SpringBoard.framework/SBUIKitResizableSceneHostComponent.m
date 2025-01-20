@interface SBUIKitResizableSceneHostComponent
- (CGRect)frame;
- (void)resizableContentViewController:(id)a3 didUpdateToBounds:(CGRect)a4;
- (void)setFrame:(CGRect)a3;
@end

@implementation SBUIKitResizableSceneHostComponent

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    v10.origin.CGFloat x = x;
    v10.origin.CGFloat y = y;
    v10.size.CGFloat width = width;
    v10.size.CGFloat height = height;
    if (!CGRectIsEmpty(v10))
    {
      v8 = [(FBSSceneComponent *)self hostScene];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__SBUIKitResizableSceneHostComponent_setFrame___block_invoke;
      v9[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
      *(CGFloat *)&v9[4] = x;
      *(CGFloat *)&v9[5] = y;
      *(CGFloat *)&v9[6] = width;
      *(CGFloat *)&v9[7] = height;
      [v8 updateSettingsWithBlock:v9];
    }
  }
}

uint64_t __47__SBUIKitResizableSceneHostComponent_setFrame___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)resizableContentViewController:(id)a3 didUpdateToBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = [a3 view];
  objc_msgSend(v9, "convertRect:toView:", 0, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  -[SBUIKitResizableSceneHostComponent setFrame:](self, "setFrame:", v11, v13, v15, v17);
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end