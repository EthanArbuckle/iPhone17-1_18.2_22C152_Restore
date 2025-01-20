@interface SBZoomView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (SBZoomView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (id)_initWithFrame:(CGRect)a3;
@end

@implementation SBZoomView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"zPosition"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBZoomView;
    BOOL v5 = [(SBZoomView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (id)_initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBZoomView;
  v3 = -[SBZoomView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(SBZoomView *)v3 setUserInteractionEnabled:0];
    id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBZoomView *)v4 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v6;

    [(SBZoomView *)v4 addSubview:v4->_contentView];
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (SBZoomView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2 object:self file:@"SBZoomView.m" lineNumber:41 description:@"call to abstract base class initializer"];

  return 0;
}

- (UIView)contentView
{
  return self->_contentView;
}

@end