@interface UIWindowLayer
- (id)actionForKey:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTransform:(CATransform3D *)a3;
@end

@implementation UIWindowLayer

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowLayer;
  -[UIWindowLayer setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)actionForKey:(id)a3
{
  id v4 = a3;
  window = self->_window;
  if (!window)
  {
    if (!_CASupportsAnimationForKey(v4)) {
      goto LABEL_6;
    }
    window = self->_window;
  }
  if ([(UIView *)window _shouldAnimatePropertyWithKey:v4])
  {
    v6 = +[UIView _defaultUIViewActionForLayer:self forKey:v4];
    goto LABEL_7;
  }
LABEL_6:
  v6 = 0;
LABEL_7:

  return v6;
}

- (void)setBounds:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowLayer;
  -[UIWindowLayer setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setTransform:(CATransform3D *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIWindowLayer;
  long long v3 = *(_OWORD *)&a3->m33;
  v7[4] = *(_OWORD *)&a3->m31;
  v7[5] = v3;
  long long v4 = *(_OWORD *)&a3->m43;
  v7[6] = *(_OWORD *)&a3->m41;
  v7[7] = v4;
  long long v5 = *(_OWORD *)&a3->m13;
  v7[0] = *(_OWORD *)&a3->m11;
  v7[1] = v5;
  long long v6 = *(_OWORD *)&a3->m23;
  v7[2] = *(_OWORD *)&a3->m21;
  v7[3] = v6;
  [(UIWindowLayer *)&v8 setTransform:v7];
}

@end