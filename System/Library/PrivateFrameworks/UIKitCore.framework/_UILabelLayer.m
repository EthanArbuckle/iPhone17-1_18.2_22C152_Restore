@interface _UILabelLayer
- (BOOL)_glyphPathBoundsExcedesLayers:(CGRect)a3 drawableGlyphPathBounds:(CGRect *)a4 edgesClipped:(unint64_t *)a5;
- (BOOL)letterformAwareInsetsAreValid;
- (UIEdgeInsets)letterformAwareInsets;
- (UIView)lightContainerView;
- (id)_labelLayerToClipDuringBoundsSizeAnimation;
- (uint64_t)_configureSublayers:(uint64_t)result;
- (unint64_t)oversizeEdgesIncludedInLabelLayer;
- (void)_clearContents;
- (void)_removeSublayers;
- (void)_setFrameOrBounds:(uint64_t)a1 settingAction:(void *)a2;
- (void)_setLabelMasksToBoundsForAnimation:(BOOL)a3;
- (void)_updateLayers:(void *)a1;
- (void)_updateSublayers;
- (void)invalidateContentInsets;
- (void)layoutSublayers;
- (void)reactToLightChanged;
- (void)setBounds:(CGRect)a3;
- (void)setContentsFormat:(id)a3;
- (void)setContentsGravity:(id)a3;
- (void)setContentsMultiplyColor:(CGColor *)a3;
- (void)setContentsScale:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLightContainerView:(id)a3;
- (void)setMasksToBounds:(BOOL)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsDisplayOnBoundsChange:(BOOL)a3;
- (void)setOversizeEdgesIncludedInLabelLayer:(unint64_t)a3;
- (void)updateContentInsets;
@end

@implementation _UILabelLayer

- (void)setContentsScale:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setContentsScale:](&v6, sel_setContentsScale_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34___UILabelLayer_setContentsScale___block_invoke;
  v5[3] = &__block_descriptor_40_e17_v16__0__CALayer_8l;
  *(double *)&v5[4] = a3;
  -[_UILabelLayer _updateLayers:](self, v5);
}

- (id)_labelLayerToClipDuringBoundsSizeAnimation
{
  if (self->_contentLayer) {
    self = (_UILabelLayer *)self->_contentLayer;
  }
  return self;
}

- (void)setFrame:(CGRect)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26___UILabelLayer_setFrame___block_invoke;
  v3[3] = &unk_1E52DA520;
  CGRect v4 = a3;
  v3[4] = self;
  -[_UILabelLayer _setFrameOrBounds:settingAction:]((uint64_t)self, v3);
}

- (void)setBounds:(CGRect)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27___UILabelLayer_setBounds___block_invoke;
  v3[3] = &unk_1E52DA520;
  CGRect v4 = a3;
  v3[4] = self;
  -[_UILabelLayer _setFrameOrBounds:settingAction:]((uint64_t)self, v3);
}

- (void)_setFrameOrBounds:(uint64_t)a1 settingAction:(void *)a2
{
  v5 = a2;
  if (a1)
  {
    v5[2]();
    if (*(void *)(a1 + 32) || *(void *)(a1 + 40) || *(void *)(a1 + 48))
    {
      [(id)a1 setNeedsLayout];
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        v3 = *(void **)(a1 + 32);
        if (v3)
        {
          uint64_t v4 = [v3 wantsAnimation];
          [*(id *)(a1 + 32) setWantsAnimation:1];
          [(id)a1 layoutBelowIfNeeded];
          [*(id *)(a1 + 32) setWantsAnimation:v4];
        }
      }
    }
  }
}

- (void)setMasksToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UILabelLayer *)self masksToBounds] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UILabelLayer;
    [(_UILabelLayer *)&v5 setMasksToBounds:v3];
    [(_UILabelLayer *)self _updateSublayers];
    [(_UILabelLayer *)self setNeedsLayout];
    [(_UILabelLayer *)self setNeedsDisplay];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UILabelLayer *)self _updateSublayers];
  if (self && (self->_contentLayer || self->_lightReactiveLayer || self->_lightInertLayer))
  {
    -[_UILabelLayer _updateLayers:](self, &__block_literal_global_642);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UILabelLayer;
    -[_UILabelLayer setNeedsDisplayInRect:](&v8, sel_setNeedsDisplayInRect_, x, y, width, height);
  }
}

- (void)_updateSublayers
{
  if (self)
  {
    if (([(_UILabelLayer *)self masksToBounds] & 1) == 0
      && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_contentInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_contentInsets.bottom))))) & 1) != 0|| ([(_UILabelLayer *)self lightContainerView], BOOL v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
    {
      if (!self->_contentLayer)
      {
        uint64_t v4 = [(_UILabelLayer *)self lightContainerView];

        if (!v4)
        {
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __33___UILabelLayer__updateSublayers__block_invoke;
          v9[3] = &unk_1E52D9F70;
          v9[4] = self;
          objc_super v6 = v9;
          goto LABEL_16;
        }
      }
      objc_super v5 = [(_UILabelLayer *)self lightContainerView];

      if (v5 && !self->_lightReactiveLayer && !self->_lightInertLayer)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __33___UILabelLayer__updateSublayers__block_invoke_2;
        v8[3] = &unk_1E52D9F70;
        v8[4] = self;
        objc_super v6 = v8;
LABEL_16:
        -[_UILabelLayer _configureSublayers:]((uint64_t)self, v6);
      }
    }
    else if (self->_contentLayer {
           || (self->_lightReactiveLayer || self->_lightInertLayer)
    }
           && ([(_UILabelLayer *)self lightContainerView],
               v7 = objc_claimAutoreleasedReturnValue(),
               v7,
               !v7))
    {
      -[_UILabelLayer _removeSublayers]((id *)&self->super.super.isa);
    }
  }
}

- (UIView)lightContainerView
{
  return self->_lightContainerView;
}

- (void)setContentsMultiplyColor:(CGColor *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setContentsMultiplyColor:](&v6, sel_setContentsMultiplyColor_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___UILabelLayer_setContentsMultiplyColor___block_invoke;
  v5[3] = &__block_descriptor_40_e17_v16__0__CALayer_8l;
  v5[4] = a3;
  -[_UILabelLayer _updateLayers:](self, v5);
}

- (void)setContentsGravity:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UILabelLayer;
  [(_UILabelLayer *)&v8 setContentsGravity:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36___UILabelLayer_setContentsGravity___block_invoke;
  v6[3] = &unk_1E530EFE0;
  id v7 = v4;
  id v5 = v4;
  -[_UILabelLayer _updateLayers:](self, v6);
}

- (void)setNeedsDisplayOnBoundsChange:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UILabelLayer;
  -[_UILabelLayer setNeedsDisplayOnBoundsChange:](&v7, sel_setNeedsDisplayOnBoundsChange_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47___UILabelLayer_setNeedsDisplayOnBoundsChange___block_invoke;
  v5[3] = &__block_descriptor_33_e17_v16__0__CALayer_8l;
  BOOL v6 = a3;
  -[_UILabelLayer _updateLayers:](self, v5);
}

- (void)_updateLayers:(void *)a1
{
  BOOL v3 = a2;
  if (a1)
  {
    if (a1[4]) {
      v3[2]();
    }
    if (a1[5]) {
      v3[2]();
    }
    if (a1[6]) {
      v3[2]();
    }
  }
}

- (void)invalidateContentInsets
{
  self->_contentInsetsValid = 0;
  if (self->_contentLayer || self->_lightReactiveLayer || self->_lightInertLayer) {
    [(_UILabelLayer *)self setNeedsLayout];
  }
}

- (void)setContentsFormat:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UILabelLayer;
  [(_UILabelLayer *)&v8 setContentsFormat:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35___UILabelLayer_setContentsFormat___block_invoke;
  v6[3] = &unk_1E530EFE0;
  id v7 = v4;
  id v5 = v4;
  -[_UILabelLayer _updateLayers:](self, v6);
}

- (void)layoutSublayers
{
  if (self)
  {
    if (!self->_contentInsetsValid) {
      [(_UILabelLayer *)self updateContentInsets];
    }
    if (self->_contentLayer || self->_lightReactiveLayer || self->_lightInertLayer)
    {
      [(_UILabelLayer *)self bounds];
      double v4 = v3;
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      char v11 = [(_UILabelLayer *)self oversizeEdgesIncludedInLabelLayer];
      double v12 = self->_contentInsets.top + 0.0;
      if (v11) {
        double v12 = 0.0;
      }
      double v13 = self->_contentInsets.left + 0.0;
      if ((~v11 & 2) == 0) {
        double v13 = 0.0;
      }
      double v14 = self->_contentInsets.bottom + 0.0;
      if ((~v11 & 4) == 0) {
        double v14 = 0.0;
      }
      double v15 = self->_contentInsets.right + 0.0;
      if ((~v11 & 8) == 0) {
        double v15 = 0.0;
      }
      double v24 = v4 + v13;
      double v16 = v6 + v12;
      double v17 = v8 - (v13 + v15);
      double v18 = v10 - (v12 + v14);
      v36.origin.double x = v4;
      v36.origin.double y = v6;
      v36.size.double width = v8;
      v36.size.double height = v10;
      if (CGRectGetHeight(v36) == 0.0) {
        double v18 = 0.0;
      }
      v37.origin.double x = v4;
      v37.origin.double y = v6;
      v37.size.double width = v8;
      v37.size.double height = v10;
      if (CGRectGetWidth(v37) == 0.0) {
        double v19 = 0.0;
      }
      else {
        double v19 = v17;
      }
      [(_UILabelContentLayer *)self->_contentLayer frame];
      if (_UIRectEquivalentToRectWithAccuracy(v20, v21, v22, v23, v24, v16, v19, v18, 0.0001))
      {
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        v29 = __39___UILabelLayer_updateContentLayerSize__block_invoke;
        v30 = &unk_1E52DA520;
        v31 = self;
        double v32 = v24;
        double v33 = v16;
        double v34 = v19;
        double v35 = v18;
        +[UIView performWithoutAnimation:&v27];
      }
      else
      {
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        v29 = __39___UILabelLayer_updateContentLayerSize__block_invoke_3;
        v30 = &__block_descriptor_64_e17_v16__0__CALayer_8l;
        v31 = *(_UILabelLayer **)&v24;
        double v32 = v16;
        double v33 = v19;
        double v34 = v18;
        -[_UILabelLayer _updateLayers:](self, &v27);
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __39___UILabelLayer_updateContentLayerSize__block_invoke_4;
      v26[3] = &unk_1E530EFE0;
      v26[4] = self;
      -[_UILabelLayer _updateLayers:](self, v26);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)_UILabelLayer;
  [(_UILabelLayer *)&v25 layoutSublayers];
}

- (void)updateContentInsets
{
  double v3 = [(_UILabelLayer *)self delegate];

  if (v3)
  {
    double v4 = [(_UILabelLayer *)self delegate];
    float64x2_t v9 = *(float64x2_t *)&self->_contentInsets.bottom;
    float64x2_t v10 = *(float64x2_t *)&self->_contentInsets.top;
    id v11 = v4;
    [v4 _contentInsetsFromFonts];
    self->_contentInsets.top = v5;
    self->_contentInsets.left = v6;
    self->_contentInsets.bottom = v7;
    self->_contentInsets.right = v8;
    self->_contentInsetsValid = 1;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v10, *(float64x2_t *)&self->_contentInsets.top), (int32x4_t)vceqq_f64(v9, *(float64x2_t *)&self->_contentInsets.bottom))), 0xFuLL))) & 1) == 0)
    {
      [(_UILabelLayer *)self _updateSublayers];
      [(_UILabelLayer *)self setNeedsDisplay];
    }
  }
}

- (unint64_t)oversizeEdgesIncludedInLabelLayer
{
  return self->_oversizeEdgesIncludedInLabelLayer;
}

- (void)_setLabelMasksToBoundsForAnimation:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UILabelLayer;
  [(_UILabelLayer *)&v3 setMasksToBounds:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightContainerView, 0);
  objc_storeStrong((id *)&self->_lightInertLayer, 0);
  objc_storeStrong((id *)&self->_lightReactiveLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
}

- (uint64_t)_configureSublayers:(uint64_t)result
{
  if (result)
  {
    v2 = (id *)result;
    objc_super v3 = a2;
    -[_UILabelLayer _removeSublayers](v2);
    v3[2](v3);

    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37___UILabelLayer__configureSublayers___block_invoke;
    v4[3] = &unk_1E530EFE0;
    v4[4] = v2;
    -[_UILabelLayer _updateLayers:](v2, v4);
    [v2 setContents:0];
    return [v2 setNeedsLayout];
  }
  return result;
}

- (void)_removeSublayers
{
  if (a1)
  {
    [a1[4] removeFromSuperlayer];
    [a1[5] removeFromSuperlayer];
    [a1[6] removeFromSuperlayer];
    id v2 = a1[4];
    a1[4] = 0;

    id v3 = a1[5];
    a1[5] = 0;

    id v4 = a1[6];
    a1[6] = 0;
  }
}

- (void)reactToLightChanged
{
  [(_UILabelLayer *)self _updateSublayers];
  [(_UILabelLayer *)self setNeedsDisplay];
}

- (BOOL)_glyphPathBoundsExcedesLayers:(CGRect)a3 drawableGlyphPathBounds:(CGRect *)a4 edgesClipped:(unint64_t *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [(_UILabelLayer *)self delegate];
  double v13 = [v12 window];
  objc_msgSend(v12, "convertRect:toView:", v13, x, y, width, height);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  contentLayer = self->_contentLayer;
  v54.size.double width = width;
  v54.size.double height = height;
  v54.origin.double x = x;
  v54.origin.double y = y;
  if (contentLayer) {
    [(_UILabelContentLayer *)contentLayer frame];
  }
  else {
    [(_UILabelLayer *)self bounds];
  }
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  CGFloat v50 = v26;
  CGFloat v51 = v25;
  CGFloat v52 = v24;
  CGFloat v53 = v23;
  v31 = [v12 window];
  objc_msgSend(v12, "convertRect:toView:", v31, v27, v28, v29, v30);
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;

  v56.origin.double x = v33;
  v56.origin.double y = v35;
  v56.size.double width = v37;
  v56.size.double height = v39;
  v66.origin.double x = v15;
  v66.origin.double y = v17;
  v66.size.double width = v19;
  v66.size.double height = v21;
  if (!CGRectIntersectsRect(v56, v66)) {
    goto LABEL_6;
  }
  v57.origin.double x = v33;
  v57.origin.double y = v35;
  v57.size.double width = v37;
  v57.size.double height = v39;
  CGFloat v49 = v15;
  v67.origin.double x = v15;
  v67.origin.double y = v17;
  v67.size.double width = v19;
  v67.size.double height = v21;
  if (!CGRectContainsRect(v57, v67))
  {
    if (a4)
    {
      v68.origin.double y = v52;
      v68.origin.double x = v53;
      v68.size.double height = v50;
      v68.size.double width = v51;
      *a4 = CGRectIntersection(v54, v68);
    }
    if (a5)
    {
      v58.origin.double x = v15;
      v58.origin.double y = v17;
      v58.size.double width = v19;
      v58.size.double height = v21;
      CGFloat MinX = CGRectGetMinX(v58);
      v59.size.double height = v39;
      CGFloat v48 = v39;
      double v42 = MinX;
      v59.origin.double x = v33;
      v59.origin.double y = v35;
      v59.size.double width = v37;
      BOOL v43 = v42 < CGRectGetMinX(v59);
      v60.origin.double x = v15;
      v60.origin.double y = v17;
      v60.size.double width = v19;
      v60.size.double height = v21;
      double MaxX = CGRectGetMaxX(v60);
      v61.origin.double x = v33;
      v61.origin.double y = v35;
      v61.size.double width = v37;
      v61.size.double height = v48;
      if (MaxX <= CGRectGetMaxX(v61)) {
        uint64_t v44 = 2 * v43;
      }
      else {
        uint64_t v44 = (2 * v43) | 8;
      }
      v62.origin.double x = v15;
      v62.origin.double y = v17;
      v62.size.double width = v19;
      v62.size.double height = v21;
      double MaxY = CGRectGetMaxY(v62);
      v63.origin.double x = v33;
      v63.origin.double y = v35;
      v63.size.double width = v37;
      v63.size.double height = v48;
      if (MaxY > CGRectGetMaxY(v63)) {
        v44 |= 4uLL;
      }
      v64.origin.double x = v49;
      v64.origin.double y = v17;
      v64.size.double width = v19;
      v64.size.double height = v21;
      double MinY = CGRectGetMinY(v64);
      v65.origin.double x = v33;
      v65.origin.double y = v35;
      v65.size.double width = v37;
      v65.size.double height = v48;
      *a5 = v44 | (MinY < CGRectGetMinY(v65));
    }
    BOOL v40 = 1;
  }
  else
  {
LABEL_6:
    BOOL v40 = 0;
  }

  return v40;
}

- (void)_clearContents
{
  [(_UILabelLayer *)self setContents:0];
  -[_UILabelLayer _updateLayers:](self, &__block_literal_global_22_6);
}

- (BOOL)letterformAwareInsetsAreValid
{
  return self->_contentInsetsValid;
}

- (UIEdgeInsets)letterformAwareInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setOversizeEdgesIncludedInLabelLayer:(unint64_t)a3
{
  self->_oversizeEdgesIncludedInLabelLayer = a3;
}

- (void)setLightContainerView:(id)a3
{
}

@end