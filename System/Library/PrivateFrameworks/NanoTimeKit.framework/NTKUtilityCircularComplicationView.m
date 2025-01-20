@interface NTKUtilityCircularComplicationView
+ (int64_t)layoutOverride;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKContainerView)contentView;
- (NTKUtilityCircularComplicationView)initWithFrame:(CGRect)a3;
- (void)_updateEditingRotationAngle;
- (void)layoutSubviews;
- (void)setEditing:(BOOL)a3;
- (void)setEditingRotationAngle:(double)a3;
@end

@implementation NTKUtilityCircularComplicationView

- (NTKUtilityCircularComplicationView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKUtilityCircularComplicationView;
  v3 = -[NTKUtilityComplicationView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(NTKContainerView);
    contentView = v3->_contentView;
    v3->_contentView = v4;

    [(NTKContainerView *)v3->_contentView setLayoutDelegate:v3];
    [(NTKContainerView *)v3->_contentView setUserInteractionEnabled:0];
    [(NTKUtilityCircularComplicationView *)v3 addSubview:v3->_contentView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)NTKUtilityCircularComplicationView;
  [(NTKUtilityComplicationView *)&v36 layoutSubviews];
  [(NTKUtilityCircularComplicationView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v11, v34);
  CGFloat v12 = -v35;
  v13 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v13, v32);
  v37.origin.double x = v4;
  v37.origin.double y = v6;
  v37.size.double width = v8;
  v37.size.double height = v10;
  CGRect v38 = CGRectInset(v37, v12, -v33);
  double x = v38.origin.x;
  double y = v38.origin.y;
  double width = v38.size.width;
  double height = v38.size.height;

  v18 = [(NTKUtilityComplicationView *)self highlightView];
  objc_msgSend(v18, "setFrame:", x, y, width, height);

  uint64_t v19 = [(NTKUtilityCircularComplicationView *)self bounds];
  double v21 = v20;
  contentView = self->_contentView;
  MEMORY[0x1C1874A70](v19);
  -[NTKContainerView setCenter:](contentView, "setCenter:");
  [(NTKContainerView *)self->_contentView bounds];
  double v24 = v23;
  double v26 = v25;
  -[NTKUtilityCircularComplicationView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v28 = v27;
  -[NTKContainerView setBounds:](self->_contentView, "setBounds:", v24, v26, v29, v27);
  v30 = self->_contentView;
  CGAffineTransformMakeScale(&v31, v21 / v28, v21 / v28);
  [(NTKContainerView *)v30 setTransform:&v31];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v3, v7);
  double v4 = v8;

  double v5 = v4;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)setEditing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityCircularComplicationView;
  [(NTKUtilityComplicationView *)&v4 setEditing:a3];
  [(NTKUtilityCircularComplicationView *)self _updateEditingRotationAngle];
}

- (void)setEditingRotationAngle:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityCircularComplicationView;
  [(NTKUtilityComplicationView *)&v4 setEditingRotationAngle:a3];
  [(NTKUtilityCircularComplicationView *)self _updateEditingRotationAngle];
}

- (void)_updateEditingRotationAngle
{
  if ([(NTKUtilityComplicationView *)self editing])
  {
    [(NTKUtilityComplicationView *)self editingRotationAngle];
    CGAffineTransformMakeRotation(&v10, v3);
    CGAffineTransform v9 = v10;
    objc_super v4 = &v9;
  }
  else
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v6 = *MEMORY[0x1E4F1DAB8];
    long long v7 = v5;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    objc_super v4 = (CGAffineTransform *)&v6;
  }
  -[NTKUtilityCircularComplicationView setTransform:](self, "setTransform:", v4, v6, v7, v8, *(_OWORD *)&v9.a, *(_OWORD *)&v9.c, *(_OWORD *)&v9.tx);
}

+ (int64_t)layoutOverride
{
  return 2;
}

- (NTKContainerView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end