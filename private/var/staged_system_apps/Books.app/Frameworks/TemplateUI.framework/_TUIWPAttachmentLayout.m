@interface _TUIWPAttachmentLayout
- (TUILayout)layout;
- (_TUIWPAttachmentLayout)initWithLayout:(id)a3 baselineOffset:(double)a4 intrinsic:(BOOL)a5 charIndex:(unint64_t)a6;
- (double)inlineVerticalOffset;
- (unint64_t)charIndex;
@end

@implementation _TUIWPAttachmentLayout

- (_TUIWPAttachmentLayout)initWithLayout:(id)a3 baselineOffset:(double)a4 intrinsic:(BOOL)a5 charIndex:(unint64_t)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TUIWPAttachmentLayout;
  v12 = [(_TUIWPAttachmentLayout *)&v22 initWithInfo:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layout, a3);
    v13->_baselineOffset = a4;
    v13->_charIndex = a6;
    if (v7) {
      [v11 validatedIntrinsicSize];
    }
    else {
      [v11 computedNaturalSize];
    }
    double v16 = v14;
    double v17 = v15;
    id v18 = objc_alloc((Class)TSDLayoutGeometry);
    if (v11) {
      [v11 computedTransform];
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    id v19 = [v18 initWithSize:v21 transform:v16, v17];
    [(_TUIWPAttachmentLayout *)v13 setGeometry:v19];
  }
  return v13;
}

- (double)inlineVerticalOffset
{
  [(TUILayout *)self->_layout computedNaturalSize];
  double v4 = v3;
  [(TUILayout *)self->_layout computedHeightAbovePivot];
  return v4 - v5 - self->_baselineOffset;
}

- (TUILayout)layout
{
  return self->_layout;
}

- (unint64_t)charIndex
{
  return self->_charIndex;
}

- (void).cxx_destruct
{
}

@end