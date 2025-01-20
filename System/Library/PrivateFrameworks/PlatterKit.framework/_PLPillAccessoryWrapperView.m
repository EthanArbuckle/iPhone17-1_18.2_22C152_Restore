@interface _PLPillAccessoryWrapperView
- (CGSize)intrinsicContentSize;
- (_PLPillAccessoryWrapperView)initWithFrame:(CGRect)a3;
- (_PLPillAccessoryWrapperView)initWithManagedSubview:(id)a3;
- (void)addSubview:(id)a3;
- (void)layoutSubviews;
@end

@implementation _PLPillAccessoryWrapperView

- (_PLPillAccessoryWrapperView)initWithManagedSubview:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  v5 = -[_PLPillAccessoryWrapperView initWithFrame:](self, "initWithFrame:");
  v6 = v5;
  if (v5) {
    [(_PLPillAccessoryWrapperView *)v5 addSubview:v4];
  }

  return v6;
}

- (_PLPillAccessoryWrapperView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_PLPillAccessoryWrapperView;
  v3 = -[_PLPillAccessoryWrapperView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(_PLPillAccessoryWrapperView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 20.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)addSubview:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = [(_PLPillAccessoryWrapperView *)self subviews];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PLPillContentView.m" lineNumber:596 description:@"This class only manages a single subview"];
  }
  v19.receiver = self;
  v19.super_class = (Class)_PLPillAccessoryWrapperView;
  [(_PLPillAccessoryWrapperView *)&v19 addSubview:v5];
  [(_PLPillAccessoryWrapperView *)self intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;
  v12 = [(_PLPillAccessoryWrapperView *)self widthAnchor];
  v13 = [v12 constraintEqualToConstant:v9];

  v14 = [(_PLPillAccessoryWrapperView *)self heightAnchor];
  v15 = [v14 constraintEqualToConstant:v11];

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v20[0] = v13;
  v20[1] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v16 activateConstraints:v17];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)_PLPillAccessoryWrapperView;
  [(_PLPillAccessoryWrapperView *)&v7 layoutSubviews];
  double v3 = [(_PLPillAccessoryWrapperView *)self subviews];
  id v4 = [v3 firstObject];

  [(_PLPillAccessoryWrapperView *)self bounds];
  objc_msgSend(v4, "sizeThatFits:", v5, v6);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  [v4 setFrame:0];
}

@end