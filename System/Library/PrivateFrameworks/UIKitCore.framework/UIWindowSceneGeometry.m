@interface UIWindowSceneGeometry
+ (id)_calculateEffectiveGeometryForWindowScene:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)systemFrame;
- (CGSize)maximumSize;
- (CGSize)minimumSize;
- (UIInterfaceOrientation)interfaceOrientation;
- (UIWindowSceneResizingRestrictions)resizingRestrictions;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setInterfaceOrientation:(int64_t)a3;
- (void)_setSystemFrame:(CGRect)a3;
@end

@implementation UIWindowSceneGeometry

+ (id)_calculateEffectiveGeometryForWindowScene:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _init];
  uint64_t v6 = [v4 interfaceOrientation];

  [v5 _setInterfaceOrientation:v6];
  return v5;
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)UIWindowSceneGeometry;
  id result = [(UIWindowSceneGeometry *)&v4 init];
  if (result)
  {
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)((char *)result + 56) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)((char *)result + 72) = v3;
    *((void *)result + 1) = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (UIWindowSceneGeometry *)a3;
  if (v4 == self)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(UIWindowSceneGeometry *)self systemFrame];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(UIWindowSceneGeometry *)v5 systemFrame];
      v22.origin.x = v14;
      v22.origin.y = v15;
      v22.size.width = v16;
      v22.size.height = v17;
      v21.origin.x = v7;
      v21.origin.y = v9;
      v21.size.width = v11;
      v21.size.height = v13;
      if (CGRectEqualToRect(v21, v22))
      {
        UIInterfaceOrientation v18 = [(UIWindowSceneGeometry *)self interfaceOrientation];
        BOOL v19 = v18 == [(UIWindowSceneGeometry *)v5 interfaceOrientation];
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  return v19;
}

- (CGRect)systemFrame
{
  double x = self->_systemFrame.origin.x;
  double y = self->_systemFrame.origin.y;
  double width = self->_systemFrame.size.width;
  double height = self->_systemFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIInterfaceOrientation)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [[UIWindowSceneGeometry alloc] _init];
  [(UIWindowSceneGeometry *)self systemFrame];
  v4[7] = v5;
  v4[8] = v6;
  v4[9] = v7;
  v4[10] = v8;
  v4[1] = [(UIWindowSceneGeometry *)self interfaceOrientation];
  return v4;
}

- (void)_setSystemFrame:(CGRect)a3
{
  self->_systemFrame = a3;
}

- (CGSize)minimumSize
{
  double width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIWindowSceneResizingRestrictions)resizingRestrictions
{
  return self->_resizingRestrictions;
}

@end