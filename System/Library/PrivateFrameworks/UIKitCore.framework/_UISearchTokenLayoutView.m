@interface _UISearchTokenLayoutView
- (BOOL)isEnabled;
- (BOOL)isLastSearchToken;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGRect)boundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5;
- (CGRect)selectionBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)atomInsets;
- (_UIAtomTextViewAtomLayout)delegateView;
- (_UISearchTokenLayoutView)init;
- (_UISearchTokenLayoutView)initWithCoder:(id)a3;
- (_UISearchTokenLayoutView)initWithDelegateView:(id)a3;
- (_UISearchTokenLayoutView)initWithFrame:(CGRect)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)targetedDragPreviewInContainerView:(id)a3;
- (id)viewForLastBaselineLayout;
- (void)layoutSubviews;
- (void)setDelegateView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsLastSearchToken:(BOOL)a3;
- (void)updateMaskLayerForAttachmentRect:(CGRect)a3 lineFragment:(CGRect)a4;
- (void)updateMaskLayerForVisibleRect:(CGRect)a3;
@end

@implementation _UISearchTokenLayoutView

- (_UISearchTokenLayoutView)initWithDelegateView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISearchTokenLayoutView;
  v6 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_delegateView = (id *)&v6->_delegateView;
    objc_storeStrong((id *)&v6->_delegateView, a3);
    [*p_delegateView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v7 setAutoresizesSubviews:0];
    [(UIView *)v7 addSubview:*p_delegateView];
    v9 = v7;
  }

  return v7;
}

- (_UISearchTokenLayoutView)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unimplemented" userInfo:0];
  objc_exception_throw(v2);
}

- (_UISearchTokenLayoutView)initWithFrame:(CGRect)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Unimplemented", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (_UISearchTokenLayoutView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unimplemented" userInfo:0];
  objc_exception_throw(v4);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UISearchTokenLayoutView;
  if (-[_UISearchTokenLayoutView respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISearchTokenLayoutView;
  objc_super v5 = -[_UISearchTokenLayoutView methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    objc_super v5 = [(_UIAtomTextViewAtomLayout *)self->_delegateView methodSignatureForSelector:a3];
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_delegateView;
}

- (UIEdgeInsets)atomInsets
{
  UIRoundToViewScale(self);
  double v4 = v3;
  UIRoundToViewScale(self);
  double v6 = 3.0 - v5;
  if ([(_UISearchTokenLayoutView *)self isLastSearchToken])
  {
    UIRoundToViewScale(self);
    double v8 = v7;
    UIUserInterfaceLayoutDirection v9 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
    double v10 = -0.0;
    if (v9) {
      double v11 = -0.0;
    }
    else {
      double v11 = v8;
    }
    double v6 = v6 + v11;
    if (v9) {
      double v10 = v8;
    }
    double v4 = v4 + v10;
  }
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = v4;
  double v15 = v6;
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v12;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return (id)[(_UIAtomTextViewAtomLayout *)self->_delegateView viewForLastBaselineLayout];
}

- (BOOL)isEnabled
{
  return [(_UIAtomTextViewAtomLayout *)self->_delegateView isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_UIAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(_UISearchTokenLayoutView *)self atomInsets];
  double v10 = v5 + v8 + v9;
  double v13 = v7 + v11 + v12;
  double v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)_UISearchTokenLayoutView;
  [(UIView *)&v16 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_UISearchTokenLayoutView *)self atomInsets];
  double v12 = v4 + v11;
  double v13 = v6 - self->_verticalDelegateViewOrigin;
  -[_UIAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", v8, v10);
  -[_UIAtomTextViewAtomLayout setFrame:](self->_delegateView, "setFrame:", v12, v13, v14, v15);
}

- (CGRect)selectionBounds
{
  [(_UIAtomTextViewAtomLayout *)self->_delegateView bounds];
  delegateView = self->_delegateView;
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", delegateView);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)boundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5
{
  [(UIView *)self layoutIfNeeded];
  double v6 = *MEMORY[0x1E4F1DB28];
  -[_UISearchTokenLayoutView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v8 = v7;
  double v9 = [(_UISearchTokenLayoutView *)self viewForLastBaselineLayout];
  [v9 _baselineOffsetFromBottom];
  double v11 = -v10;
  [v9 bounds];
  CGFloat Height = CGRectGetHeight(v18);
  delegateView = self->_delegateView;
  [v9 bounds];
  -[_UIAtomTextViewAtomLayout convertRect:fromView:](delegateView, "convertRect:fromView:", v9);
  self->_verticalDelegateViewOrigin = CGRectGetMinY(v19);

  double v14 = v6;
  double v15 = v11;
  double v16 = v8;
  double v17 = Height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)updateMaskLayerForAttachmentRect:(CGRect)a3 lineFragment:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  double v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v53[4] = *MEMORY[0x1E4F143B8];
  BOOL v13 = CGRectIntersectsRect(a3, a4);
  double v45 = v9;
  CGFloat v46 = v11;
  if (v13)
  {
    v55.origin.CGFloat x = v11;
    v55.origin.CGFloat y = v10;
    v55.size.CGFloat width = v9;
    v55.size.CGFloat height = v8;
    double MaxX = CGRectGetMaxX(v55);
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    BOOL v14 = MaxX > CGRectGetMaxX(v56);
    v57.origin.CGFloat x = v11;
    CGFloat v15 = v10;
    v57.origin.CGFloat y = v10;
    v57.size.CGFloat width = v9;
    v57.size.CGFloat height = v8;
    double MinX = CGRectGetMinX(v57);
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    BOOL v17 = MinX < CGRectGetMinX(v58);
    if (v17) {
      goto LABEL_9;
    }
  }
  else
  {
    CGFloat v15 = v10;
    BOOL v14 = 0;
    BOOL v17 = 0;
  }
  if (v14)
  {
LABEL_9:
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    v66.origin.CGFloat x = v46;
    v66.origin.CGFloat y = v15;
    v66.size.CGFloat width = v9;
    v66.size.CGFloat height = v8;
    CGRect v60 = CGRectIntersection(v59, v66);
    double v19 = v60.origin.x;
    CGFloat v20 = v60.origin.y;
    CGFloat v21 = v60.size.width;
    v60.origin.CGFloat x = v46;
    v60.origin.CGFloat y = v15;
    v60.size.CGFloat width = v9;
    v60.size.CGFloat height = v8;
    double v22 = CGRectGetMinX(v60);
    if (qword_1EB25CB40 != -1) {
      dispatch_once(&qword_1EB25CB40, &__block_literal_global_71);
    }
    double v23 = v19 - v22;
    memset(&slice, 0, sizeof(slice));
    if (v14)
    {
      double v24 = v8;
      slice.origin.CGFloat x = v46;
      slice.origin.CGFloat y = v15;
      double MaxX = v15;
      slice.size.CGFloat width = v9;
      slice.size.CGFloat height = v8;
      v61.origin.CGFloat x = v23;
      v61.origin.CGFloat y = v20;
      v61.size.CGFloat width = v21;
      v61.size.CGFloat height = v8;
      double v25 = (CGRectGetMaxX(v61) + -50.0) / v9;
      v62.origin.CGFloat x = v23;
      v62.origin.CGFloat y = v20;
      v62.size.CGFloat width = v21;
      v62.size.CGFloat height = v8;
      double v26 = CGRectGetMaxX(v62) / v45;
      if (v17)
      {
        v63.origin.CGFloat x = v23;
        v63.origin.CGFloat y = v20;
        v63.size.CGFloat width = v21;
        v63.size.CGFloat height = v8;
        CGFloat v27 = CGRectGetMinX(v63) / v45;
        v64.origin.CGFloat x = v23;
        v64.origin.CGFloat y = v20;
        v64.size.CGFloat width = v21;
        v64.size.CGFloat height = v8;
        CGFloat v28 = CGRectGetMinX(v64);
        v53[0] = _MergedGlobals_3_3;
        v53[1] = qword_1EB25CB38;
        v53[2] = qword_1EB25CB38;
        v53[3] = _MergedGlobals_3_3;
        CGFloat v29 = (v28 + 50.0) / v45;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
        v31 = [NSNumber numberWithDouble:v27];
        v52[0] = v31;
        v32 = [NSNumber numberWithDouble:v29];
        v52[1] = v32;
        v33 = [NSNumber numberWithDouble:v25];
        v52[2] = v33;
        v34 = [NSNumber numberWithDouble:v26];
        v52[3] = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
      }
      else
      {
        v51[0] = qword_1EB25CB38;
        v51[1] = _MergedGlobals_3_3;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
        v31 = [NSNumber numberWithDouble:v25];
        v50[0] = v31;
        v32 = [NSNumber numberWithDouble:v26];
        v50[1] = v32;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
      }

      double v37 = MaxX;
      double v36 = v46;
      double v38 = v45;
    }
    else
    {
      memset(&remainder, 0, sizeof(remainder));
      v65.origin.CGFloat x = v23;
      v65.origin.CGFloat y = v20;
      v65.size.CGFloat width = v21;
      v65.size.CGFloat height = v8;
      CGRectDivide(v65, &slice, &remainder, 50.0, CGRectMinXEdge);
      v49[0] = _MergedGlobals_3_3;
      v49[1] = qword_1EB25CB38;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
      double v36 = slice.origin.x;
      double v37 = slice.origin.y;
      v35 = &unk_1ED3EF230;
      double v38 = slice.size.width;
      double v24 = slice.size.height;
    }
    double verticalDelegateViewOrigin = self->_verticalDelegateViewOrigin;
    double v40 = v24 + verticalDelegateViewOrigin + verticalDelegateViewOrigin;
    double v41 = -verticalDelegateViewOrigin;
    v42 = objc_msgSend(MEMORY[0x1E4F39BD0], "layer", *(void *)&MaxX);
    [v42 setColors:v30];
    [v42 setLocations:v35];
    objc_msgSend(v42, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v42, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(v42, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    objc_msgSend(v42, "setBounds:", v36, v37, v38, v40);
    objc_msgSend(v42, "setPosition:", 0.0, v41);
    v43 = [(UIView *)self layer];
    [v43 setMask:v42];

    [(UIView *)self setHidden:0];
    return;
  }
  CGRect v18 = [(UIView *)self layer];
  [v18 setMask:0];

  [(UIView *)self setHidden:!v13];
}

- (void)updateMaskLayerForVisibleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v58[6] = *MEMORY[0x1E4F143B8];
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  v72.origin.CGFloat x = v9;
  v72.origin.CGFloat y = v11;
  v72.size.CGFloat width = v13;
  v72.size.CGFloat height = v15;
  if (CGRectContainsRect(v60, v72))
  {
    double v16 = [(UIView *)self layer];
    [v16 setMask:0];

    BOOL v17 = self;
    uint64_t v18 = 0;
LABEL_10:
    [(UIView *)v17 setHidden:v18];
    return;
  }
  v61.origin.CGFloat x = v9;
  v61.origin.CGFloat y = v11;
  v61.size.CGFloat width = v13;
  v61.size.CGFloat height = v15;
  v73.origin.CGFloat x = x;
  v73.origin.CGFloat y = y;
  v73.size.CGFloat width = width;
  v73.size.CGFloat height = height;
  if (!CGRectIntersectsRect(v61, v73))
  {
    v52 = [(UIView *)self layer];
    [v52 setMask:0];

    BOOL v17 = self;
    uint64_t v18 = 1;
    goto LABEL_10;
  }
  v62.origin.CGFloat x = v9;
  v62.origin.CGFloat y = v11;
  v62.size.CGFloat width = v13;
  v62.size.CGFloat height = v15;
  double v55 = v13;
  double v19 = v15;
  CGFloat v20 = v11;
  double MinX = CGRectGetMinX(v62);
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  double v53 = MinX - CGRectGetMinX(v63);
  v64.origin.CGFloat y = v20;
  CGFloat v56 = v9;
  v64.origin.CGFloat x = v9;
  v64.size.CGFloat width = v55;
  v64.size.CGFloat height = v19;
  double MaxX = CGRectGetMaxX(v64);
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  double v23 = MaxX - CGRectGetMaxX(v65);
  id v24 = +[UIColor clearColor];
  uint64_t v25 = [v24 CGColor];

  id v26 = +[UIColor whiteColor];
  uint64_t v27 = [v26 CGColor];

  v58[0] = v25;
  v58[1] = v25;
  v58[2] = v27;
  v58[3] = v27;
  v58[4] = v25;
  v58[5] = v25;
  CGFloat v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:6];
  double v29 = 0.0;
  double v30 = 0.0;
  if (v53 < -3.0)
  {
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    double v54 = v23;
    double v31 = CGRectGetMinX(v66);
    v67.origin.CGFloat y = v20;
    v67.origin.CGFloat x = v56;
    v67.size.CGFloat width = v55;
    v67.size.CGFloat height = v19;
    double v32 = v31 - CGRectGetMinX(v67);
    double v23 = v54;
    double v30 = v32 / v55;
    double v29 = 50.0 / v55 + v32 / v55;
  }
  double v33 = 1.0;
  double v34 = 1.0;
  if (v23 > 3.0)
  {
    v68.origin.CGFloat x = x;
    double v35 = v30;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    double v36 = CGRectGetMaxX(v68);
    v69.origin.CGFloat y = v20;
    v69.origin.CGFloat x = v56;
    v69.size.CGFloat width = v55;
    v69.size.CGFloat height = v19;
    CGFloat v37 = CGRectGetMinX(v69);
    double v30 = v35;
    double v33 = (v36 - v37) / v55;
    double v34 = v33 + -50.0 / v55;
  }
  v57[0] = &unk_1ED3F3588;
  double v38 = v34;
  double v39 = v33;
  double v40 = [NSNumber numberWithDouble:v30];
  v57[1] = v40;
  double v41 = [NSNumber numberWithDouble:v29];
  v57[2] = v41;
  v42 = [NSNumber numberWithDouble:v38];
  v57[3] = v42;
  v43 = [NSNumber numberWithDouble:v39];
  v57[4] = v43;
  v57[5] = &unk_1ED3F35A0;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:6];

  double v45 = *MEMORY[0x1E4F1DAD8];
  double v46 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v70.origin.CGFloat x = v56;
  v70.origin.CGFloat y = v20;
  v70.size.CGFloat width = v55;
  v70.size.CGFloat height = v19;
  double MidX = CGRectGetMidX(v70);
  v71.origin.CGFloat x = v56;
  v71.origin.CGFloat y = v20;
  v71.size.CGFloat width = v55;
  v71.size.CGFloat height = v19;
  double MidY = CGRectGetMidY(v71);
  double v49 = v19 + self->_verticalDelegateViewOrigin + self->_verticalDelegateViewOrigin;
  v50 = [MEMORY[0x1E4F39BD0] layer];
  [v50 setColors:v28];
  [v50 setLocations:v44];
  objc_msgSend(v50, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v50, "setEndPoint:", 1.0, 0.5);
  objc_msgSend(v50, "setBounds:", v45, v46, v55, v49);
  objc_msgSend(v50, "setPosition:", MidX, MidY);
  v51 = [(UIView *)self layer];
  [v51 setMask:v50];

  [(UIView *)self setHidden:0];
}

- (id)targetedDragPreviewInContainerView:(id)a3
{
  id v4 = a3;
  [(_UISearchTokenLayoutView *)self selectionBounds];
  objc_msgSend(v4, "convertRect:fromView:", self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v13 = self->_delegateView;
  double v14 = objc_opt_new();
  CGFloat v15 = +[UIColor clearColor];
  [v14 setBackgroundColor:v15];

  double v16 = -[UIPreviewTarget initWithContainer:center:]([UIDragPreviewTarget alloc], "initWithContainer:center:", v4, v6 + v10 * 0.5, v8 + v12 * 0.5);
  BOOL v17 = [[UITargetedDragPreview alloc] initWithView:v13 parameters:v14 target:v16];

  return v17;
}

- (_UIAtomTextViewAtomLayout)delegateView
{
  return self->_delegateView;
}

- (void)setDelegateView:(id)a3
{
}

- (BOOL)isLastSearchToken
{
  return self->_isLastSearchToken;
}

- (void)setIsLastSearchToken:(BOOL)a3
{
  self->_isLastSearchToken = a3;
}

- (void).cxx_destruct
{
}

@end