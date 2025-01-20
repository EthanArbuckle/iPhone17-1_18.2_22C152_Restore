@interface HaloSelectedBackgroundView
- (HaloSelectedBackgroundView)initWithFrame:(CGRect)a3;
- (void)_updateHaloColor;
@end

@implementation HaloSelectedBackgroundView

- (HaloSelectedBackgroundView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HaloSelectedBackgroundView;
  v3 = -[HaloSelectedBackgroundView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    haloRing = v3->_haloRing;
    v3->_haloRing = v4;

    [(UIView *)v3->_haloRing setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_haloRing _setContinuousCornerRadius:23.0];
    v6 = [(UIView *)v3->_haloRing layer];
    [v6 setBorderWidth:3.0];

    [(HaloSelectedBackgroundView *)v3 addSubview:v3->_haloRing];
    v7 = (void *)MEMORY[0x1E4F28DC8];
    v8 = v3->_haloRing;
    UIEdgeInsetsMakeWithEdges();
    v9 = objc_msgSend(v7, "safari_constraintsMatchingFrameOfView:withFrameOfView:edgeInsets:", v3, v8);
    [v7 activateConstraints:v9];

    [(HaloSelectedBackgroundView *)v3 _updateHaloColor];
    objc_initWeak(&location, v3);
    v10 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__HaloSelectedBackgroundView_initWithFrame___block_invoke;
    v14[3] = &unk_1E6D7B700;
    objc_copyWeak(&v15, &location);
    id v11 = (id)[(HaloSelectedBackgroundView *)v3 registerForTraitChanges:v10 withHandler:v14];

    v12 = v3;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __44__HaloSelectedBackgroundView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateHaloColor];
}

- (void)_updateHaloColor
{
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  id v3 = [v6 colorWithAlphaComponent:0.1];
  uint64_t v4 = [v3 CGColor];
  v5 = [(UIView *)self->_haloRing layer];
  [v5 setBorderColor:v4];
}

- (void).cxx_destruct
{
}

@end