@interface _UITextLayoutFragmentViewBase
- (CGPoint)_activeContainerOrigin;
- (CGPoint)containerOrigin;
- (CGRect)_activeClipRect;
- (CGRect)_activeLayoutFragmentFrame;
- (CGRect)clipFrame;
- (CGRect)clipRect;
- (CGSize)containerSize;
- (NSTextLayoutFragment)layoutFragment;
- (_UITextLayoutFragmentViewBase)initWithLayoutFragment:(id)a3 containerOrigin:(CGPoint)a4 containerSize:(CGSize)a5 clipRect:(CGRect)a6;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateGeometry;
- (void)_updateTextAttachmentGeometry;
- (void)didMoveToSuperview;
- (void)enumerateTextAttachmentViewsUsingBlock:(id)a3;
- (void)layoutSubviews;
- (void)performChanges:(id)a3;
- (void)setClipRect:(CGRect)a3;
- (void)setContainerOrigin:(CGPoint)a3;
- (void)setContainerSize:(CGSize)a3;
@end

@implementation _UITextLayoutFragmentViewBase

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextLayoutFragmentViewBase;
  [(UIView *)&v4 didMoveToSuperview];
  if (self->_textAttachmentGeometryNeedsUpdate)
  {
    v3 = [(UIView *)self superview];

    if (v3) {
      [(_UITextLayoutFragmentViewBase *)self _updateTextAttachmentGeometry];
    }
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextLayoutFragmentViewBase;
  [(UIView *)&v4 layoutSubviews];
  v3 = [(UIView *)self superview];

  if (v3) {
    [(_UITextLayoutFragmentViewBase *)self _updateTextAttachmentGeometry];
  }
  else {
    self->_textAttachmentGeometryNeedsUpdate = 1;
  }
}

- (void)_updateTextAttachmentGeometry
{
  self->_textAttachmentGeometryNeedsUpdate = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62___UITextLayoutFragmentViewBase__updateTextAttachmentGeometry__block_invoke;
  v2[3] = &unk_1E52DD5B8;
  v2[4] = self;
  [(_UITextLayoutFragmentViewBase *)self enumerateTextAttachmentViewsUsingBlock:v2];
}

- (void)_updateGeometry
{
  [(_UITextLayoutFragmentViewBase *)self _activeLayoutFragmentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self _currentScreenScale];
  double v12 = UIRectIntegralWithScale(v4, v6, v8, v10, v11);
  double v14 = v13;
  BOOL v15 = +[_UITextKit2LayoutController coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled];
  [(NSTextLayoutFragment *)self->_layoutFragment renderingSurfaceBounds];
  CGRect v45 = CGRectIntegral(v44);
  double x = v45.origin.x;
  double y = v45.origin.y;
  double width = v45.size.width;
  double height = v45.size.height;
  [(_UITextLayoutFragmentViewBase *)self _activeContainerOrigin];
  double v22 = -0.0;
  if (v15) {
    double v23 = v12;
  }
  else {
    double v23 = -0.0;
  }
  double v24 = v23 + x;
  if (!v15) {
    double v22 = v12;
  }
  double v41 = y;
  double v42 = v24;
  double v25 = v24 + v22 + v20;
  double v26 = y + v14 + v21;
  [(_UITextLayoutFragmentViewBase *)self _activeClipRect];
  v50.origin.double x = v27;
  v50.origin.double y = v28;
  v50.size.double width = v29;
  v50.size.double height = v30;
  v46.origin.double x = v25;
  v46.origin.double y = v26;
  v46.size.double width = width;
  v46.size.double height = height;
  CGRect v47 = CGRectIntersection(v46, v50);
  CGFloat v31 = v47.origin.x;
  CGFloat v32 = v47.origin.y;
  CGFloat v33 = v47.size.width;
  CGFloat v34 = v47.size.height;
  if (!CGRectIsNull(v47))
  {
    v48.origin.double x = v31;
    v48.origin.double y = v32;
    v48.size.double width = v33;
    v48.size.double height = v34;
    double MinX = CGRectGetMinX(v48);
    v49.origin.double x = v25;
    v49.origin.double y = v26;
    v49.size.double width = width;
    v49.size.double height = height;
    double v42 = v42 + MinX - CGRectGetMinX(v49);
    double v25 = v31;
    double v26 = v32;
    double width = v33;
    double height = v34;
  }
  [(UIView *)self _currentScreenScale];
  double v36 = UIRectIntegralWithScale(v25, v26, width, height, v35);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __48___UITextLayoutFragmentViewBase__updateGeometry__block_invoke;
  v43[3] = &unk_1E52DD590;
  v43[4] = self;
  *(double *)&v43[5] = v36;
  v43[6] = v37;
  v43[7] = v38;
  v43[8] = v39;
  *(double *)&v43[9] = v42;
  *(double *)&v43[10] = v41;
  v43[11] = v38;
  v43[12] = v39;
  -[UIView _performChangesDeferringAutoresizingMaskConstraintsUpdate:](self, v43);
}

- (CGRect)_activeLayoutFragmentFrame
{
  [(NSTextLayoutFragment *)self->_layoutFragment layoutFragmentFrame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGPoint)_activeContainerOrigin
{
  double x = self->_containerOrigin.x;
  double y = self->_containerOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_activeClipRect
{
  double x = self->_clipRect.origin.x;
  double y = self->_clipRect.origin.y;
  double width = self->_clipRect.size.width;
  double height = self->_clipRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)enumerateTextAttachmentViewsUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(NSTextLayoutFragment *)self->_layoutFragment textElement];

  if (v5)
  {
    double v6 = [(NSTextLayoutFragment *)self->_layoutFragment textAttachmentViewProviders];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72___UITextLayoutFragmentViewBase_enumerateTextAttachmentViewsUsingBlock___block_invoke;
    v7[3] = &unk_1E52DD5E0;
    v7[4] = self;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (void)performChanges:(id)a3
{
  (*((void (**)(id, _UITextLayoutFragmentViewBase *))a3 + 2))(a3, self);
  [(_UITextLayoutFragmentViewBase *)self _updateGeometry];
}

- (void)setContainerSize:(CGSize)a3
{
  self->_containerSize = a3;
}

- (void)setContainerOrigin:(CGPoint)a3
{
  self->_containerOrigin = a3;
}

- (void)setClipRect:(CGRect)a3
{
  self->_clipRect = a3;
}

- (_UITextLayoutFragmentViewBase)initWithLayoutFragment:(id)a3 containerOrigin:(CGPoint)a4 containerSize:(CGSize)a5 clipRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v10 = a5.height;
  CGFloat v11 = a5.width;
  CGFloat v12 = a4.y;
  CGFloat v13 = a4.x;
  id v16 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_UITextLayoutFragmentViewBase;
  v17 = -[UIView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v18 = v17;
  if (v17)
  {
    [(UIView *)v17 setOpaque:0];
    [(UIView *)v18 setContentMode:3];
    objc_storeStrong((id *)&v18->_layoutFragment, a3);
    v18->_containerOrigin.CGFloat x = v13;
    v18->_containerOrigin.CGFloat y = v12;
    v18->_containerSize.CGFloat width = v11;
    v18->_containerSize.CGFloat height = v10;
    v18->_clipRect.origin.CGFloat x = x;
    v18->_clipRect.origin.CGFloat y = y;
    v18->_clipRect.size.CGFloat width = width;
    v18->_clipRect.size.CGFloat height = height;
    [(_UITextLayoutFragmentViewBase *)v18 _updateGeometry];
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v19 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v21 = _UIInternalPreference_TextLayoutFragmentShowFrames;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_TextLayoutFragmentShowFrames)
      {
        while (v19 >= v21)
        {
          _UIInternalPreferenceSync(v19, &_UIInternalPreference_TextLayoutFragmentShowFrames, @"TextLayoutFragmentShowFrames", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v21 = _UIInternalPreference_TextLayoutFragmentShowFrames;
          if (v19 == _UIInternalPreference_TextLayoutFragmentShowFrames) {
            goto LABEL_5;
          }
        }
        if (byte_1EB256E64)
        {
          double v22 = +[UIColor systemTealColor];
          id v23 = [v22 colorWithAlphaComponent:0.5];
          uint64_t v24 = [v23 CGColor];
          double v25 = [(UIView *)v18 layer];
          [v25 setBorderColor:v24];

          double v26 = [(UIView *)v18 layer];
          [v26 setBorderWidth:1.0];
        }
      }
    }
  }
LABEL_5:

  return v18;
}

- (void).cxx_destruct
{
}

- (NSTextLayoutFragment)layoutFragment
{
  return self->_layoutFragment;
}

- (CGRect)clipRect
{
  double x = self->_clipRect.origin.x;
  double y = self->_clipRect.origin.y;
  double width = self->_clipRect.size.width;
  double height = self->_clipRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UITextLayoutFragmentViewBase;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (_UITextLayoutFragmentViewBase *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self) {
    double v5 = 0;
  }
  double v7 = v5;

  return v7;
}

- (CGPoint)containerOrigin
{
  double x = self->_containerOrigin.x;
  double y = self->_containerOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)clipFrame
{
  double x = self->_clipFrame.origin.x;
  double y = self->_clipFrame.origin.y;
  double width = self->_clipFrame.size.width;
  double height = self->_clipFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end