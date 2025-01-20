@interface _UIWiFiSignalView
- (CGSize)intrinsicContentSize;
- (UIColor)activeColor;
- (UIColor)inactiveColor;
- (_UIWiFiSignalView)initWithCoder:(id)a3;
- (_UIWiFiSignalView)initWithFrame:(CGRect)a3;
- (_UIWiFiSignalView)initWithSizeCategory:(int64_t)a3;
- (int64_t)numberOfActiveBars;
- (int64_t)numberOfBars;
- (int64_t)signalMode;
- (int64_t)sizeCategory;
- (void)_commonInit;
- (void)layoutSubviews;
- (void)setActiveColor:(id)a3;
- (void)setInactiveColor:(id)a3;
- (void)setNumberOfActiveBars:(int64_t)a3;
- (void)setNumberOfBars:(int64_t)a3;
- (void)setSignalMode:(int64_t)a3;
- (void)setSizeCategory:(int64_t)a3;
@end

@implementation _UIWiFiSignalView

- (void)_commonInit
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v3 = (void *)_MergedGlobals_962;
  uint64_t v14 = _MergedGlobals_962;
  if (!_MergedGlobals_962)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getSTUIStatusBarWifiSignalViewClass_block_invoke;
    v10[3] = &unk_1E52D9900;
    v10[4] = &v11;
    __getSTUIStatusBarWifiSignalViewClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = v3;
  _Block_object_dispose(&v11, 8);
  v5 = (_UISignalViewImplementation *)objc_alloc_init(v4);
  signalView = self->_signalView;
  self->_signalView = v5;

  v7 = [(UIView *)self traitCollection];
  [v7 displayScale];
  if (v8 <= 2.5) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [(_UISignalViewImplementation *)self->_signalView setIconSize:v9];

  [(_UISignalViewImplementation *)self->_signalView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:self->_signalView];
}

- (_UIWiFiSignalView)initWithSizeCategory:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWiFiSignalView;
  v4 = [(UIView *)&v6 init];
  [(_UIWiFiSignalView *)v4 _commonInit];
  [(_UIWiFiSignalView *)v4 setSizeCategory:a3];
  return v4;
}

- (_UIWiFiSignalView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIWiFiSignalView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIWiFiSignalView *)v3 _commonInit];
  return v3;
}

- (_UIWiFiSignalView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIWiFiSignalView;
  v3 = [(UIView *)&v5 initWithCoder:a3];
  [(_UIWiFiSignalView *)v3 _commonInit];
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIWiFiSignalView;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[_UISignalViewImplementation setFrame:](self->_signalView, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  [(_UISignalViewImplementation *)self->_signalView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)sizeCategory
{
  return (unint64_t)([(_UISignalViewImplementation *)self->_signalView iconSize] - 9) < 2;
}

- (void)setSizeCategory:(int64_t)a3
{
  id v6 = [(UIView *)self traitCollection];
  v7 = v6;
  if (a3 == 1)
  {
    [v6 displayScale];
    if (v9 <= 2.5) {
      uint64_t v3 = 9;
    }
    else {
      uint64_t v3 = 10;
    }
  }
  else if (!a3)
  {
    [v6 displayScale];
    if (v8 <= 2.5) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }

  [(_UISignalViewImplementation *)self->_signalView setIconSize:v3];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (int64_t)numberOfBars
{
  return [(_UISignalViewImplementation *)self->_signalView numberOfBars];
}

- (void)setNumberOfBars:(int64_t)a3
{
}

- (int64_t)numberOfActiveBars
{
  return [(_UISignalViewImplementation *)self->_signalView numberOfActiveBars];
}

- (void)setNumberOfActiveBars:(int64_t)a3
{
}

- (int64_t)signalMode
{
  return [(_UISignalViewImplementation *)self->_signalView signalMode];
}

- (void)setSignalMode:(int64_t)a3
{
}

- (UIColor)inactiveColor
{
  return (UIColor *)[(_UISignalViewImplementation *)self->_signalView inactiveColor];
}

- (void)setInactiveColor:(id)a3
{
}

- (UIColor)activeColor
{
  return (UIColor *)[(_UISignalViewImplementation *)self->_signalView activeColor];
}

- (void)setActiveColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end