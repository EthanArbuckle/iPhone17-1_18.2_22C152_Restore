@interface PUCropHandleView
+ (id)allHandles;
- (BOOL)isBottom;
- (BOOL)isCorner;
- (BOOL)isLateral;
- (BOOL)isLeft;
- (BOOL)isOverlayHidden;
- (BOOL)isRight;
- (BOOL)isTop;
- (NSArray)_lineViews;
- (NSArray)_overlayViews;
- (NSArray)adjacentHandles;
- (PUCropHandleView)initWithFrame:(CGRect)a3;
- (UIView)_layoutReferenceView;
- (id)_createCornerOverlayView;
- (id)_createLineView;
- (id)initForHandle:(unint64_t)a3;
- (unint64_t)handle;
- (unint64_t)oppositeHandle;
- (void)_setLayoutReferenceView:(id)a3;
- (void)_setLineViews:(id)a3;
- (void)_setOverlayViews:(id)a3;
- (void)setOverlayHidden:(BOOL)a3;
@end

@implementation PUCropHandleView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__layoutReferenceView, 0);
  objc_storeStrong((id *)&self->__overlayViews, 0);
  objc_storeStrong((id *)&self->__lineViews, 0);
}

- (void)_setLayoutReferenceView:(id)a3
{
}

- (UIView)_layoutReferenceView
{
  return self->__layoutReferenceView;
}

- (void)_setOverlayViews:(id)a3
{
}

- (NSArray)_overlayViews
{
  return self->__overlayViews;
}

- (void)_setLineViews:(id)a3
{
}

- (NSArray)_lineViews
{
  return self->__lineViews;
}

- (void)setOverlayHidden:(BOOL)a3
{
  self->_overlayHidden = a3;
}

- (BOOL)isOverlayHidden
{
  return self->_overlayHidden;
}

- (unint64_t)handle
{
  return self->_handle;
}

- (NSArray)adjacentHandles
{
  unint64_t v2 = [(PUCropHandleView *)self handle];
  if (v2 - 1 > 6) {
    return (NSArray *)&unk_1F078ACB8;
  }
  else {
    return (NSArray *)qword_1E5F24698[v2 - 1];
  }
}

- (unint64_t)oppositeHandle
{
  unint64_t v2 = [(PUCropHandleView *)self handle];
  if (v2 - 1 > 6) {
    return 3;
  }
  else {
    return qword_1AEFF7E18[v2 - 1];
  }
}

- (BOOL)isLateral
{
  return [(PUCropHandleView *)self handle] < 4;
}

- (BOOL)isCorner
{
  return ([(PUCropHandleView *)self handle] & 0xFFFFFFFFFFFFFFFCLL) == 4;
}

- (BOOL)isBottom
{
  unint64_t v2 = [(PUCropHandleView *)self handle];
  return (v2 < 8) & (0xC8u >> v2);
}

- (BOOL)isRight
{
  unint64_t v2 = [(PUCropHandleView *)self handle];
  return (v2 < 8) & (0xA4u >> v2);
}

- (BOOL)isLeft
{
  unint64_t v2 = [(PUCropHandleView *)self handle];
  return (v2 < 7) & (0x52u >> v2);
}

- (BOOL)isTop
{
  unint64_t v2 = [(PUCropHandleView *)self handle];
  return (v2 & 0xFFFFFFFFFFFFFFFBLL) == 0 || v2 == 5;
}

- (id)_createCornerOverlayView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v3 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.600000024];
  [v2 setBackgroundColor:v3];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (id)_createLineView
{
  id v2 = +[PUInterfaceManager currentTheme];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setOpaque:1];
  v4 = [v2 photoEditingCropHandleColor];
  [v3 setBackgroundColor:v4];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v3;
}

- (id)initForHandle:(unint64_t)a3
{
  v79[2] = *MEMORY[0x1E4F143B8];
  v74.receiver = self;
  v74.super_class = (Class)PUCropHandleView;
  v4 = -[PUCropHandleView initWithFrame:](&v74, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_handle = a3;
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUCropHandleView *)v5 addSubview:v6];
    if ([(PUCropHandleView *)v5 isLateral]) {
      double v7 = 1.0;
    }
    else {
      double v7 = 3.0;
    }
    v78[0] = @"lineLength";
    v78[1] = @"lineWidth";
    v79[0] = &unk_1F078D210;
    v8 = [NSNumber numberWithDouble:v7];
    v79[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];

    if ([(PUCropHandleView *)v5 isCorner])
    {
      v10 = [(PUCropHandleView *)v5 _createLineView];
      v11 = [(PUCropHandleView *)v5 _createLineView];
      [(PUCropHandleView *)v5 addSubview:v10];
      [(PUCropHandleView *)v5 addSubview:v11];
      v12 = _NSDictionaryOfVariableBindings(&cfstr_Horizontalline.isa, v10, v11, v6, 0);
      v13 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[horizontalLine(lineLength)]" options:0x10000 metrics:v9 views:v12];
      [(PUCropHandleView *)v5 addConstraints:v13];

      v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[verticalLine(lineLength)]" options:0 metrics:v9 views:v12];
      [(PUCropHandleView *)v5 addConstraints:v14];

      v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:9 relatedBy:0 toItem:v5 attribute:9 multiplier:1.0 constant:0.0];
      [(PUCropHandleView *)v5 addConstraint:v15];

      v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v11 attribute:10 relatedBy:0 toItem:v5 attribute:10 multiplier:1.0 constant:0.0];
      [(PUCropHandleView *)v5 addConstraint:v16];

      if ([(PUCropHandleView *)v5 isLeft]) {
        uint64_t v17 = 4;
      }
      else {
        uint64_t v17 = 2;
      }
      if ([(PUCropHandleView *)v5 isTop])
      {
        v18 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[horizontalLine(lineWidth)][referenceView]" options:v17 metrics:v9 views:v12];
        [(PUCropHandleView *)v5 addConstraints:v18];

        v19 = (void *)MEMORY[0x1E4F28DC8];
        double v20 = 1.0;
        v21 = v10;
        uint64_t v22 = 3;
        v23 = v11;
        uint64_t v24 = 3;
      }
      else
      {
        v34 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[referenceView][horizontalLine(lineWidth)]" options:v17 metrics:v9 views:v12];
        [(PUCropHandleView *)v5 addConstraints:v34];

        v19 = (void *)MEMORY[0x1E4F28DC8];
        double v20 = 1.0;
        v21 = v10;
        uint64_t v22 = 4;
        v23 = v11;
        uint64_t v24 = 4;
      }
      v35 = [v19 constraintWithItem:v21 attribute:v22 relatedBy:0 toItem:v23 attribute:v24 multiplier:v20 constant:0.0];
      [(PUCropHandleView *)v5 addConstraint:v35];

      if ([(PUCropHandleView *)v5 isTop]) {
        uint64_t v36 = 65552;
      }
      else {
        uint64_t v36 = 65544;
      }
      if ([(PUCropHandleView *)v5 isLeft])
      {
        v37 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[verticalLine(lineWidth)][referenceView]" options:v36 metrics:v9 views:v12];
        [(PUCropHandleView *)v5 addConstraints:v37];

        v38 = (void *)MEMORY[0x1E4F28DC8];
        double v39 = 1.0;
        v40 = v11;
        uint64_t v41 = 1;
        v42 = v10;
        uint64_t v43 = 1;
      }
      else
      {
        v44 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[referenceView][verticalLine(lineWidth)]" options:v36 metrics:v9 views:v12];
        [(PUCropHandleView *)v5 addConstraints:v44];

        v38 = (void *)MEMORY[0x1E4F28DC8];
        double v39 = 1.0;
        v40 = v11;
        uint64_t v41 = 2;
        v42 = v10;
        uint64_t v43 = 2;
      }
      v45 = [v38 constraintWithItem:v40 attribute:v41 relatedBy:0 toItem:v42 attribute:v43 multiplier:v39 constant:0.0];
      [(PUCropHandleView *)v5 addConstraint:v45];

      v77[0] = v10;
      v77[1] = v11;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
      [(PUCropHandleView *)v5 _setLineViews:v46];
      goto LABEL_46;
    }
    if (![(PUCropHandleView *)v5 isLateral])
    {
LABEL_47:
      [(PUCropHandleView *)v5 _setLayoutReferenceView:v6];
      [(PUCropHandleView *)v5 setOpaque:0];

      return v5;
    }
    v10 = [(PUCropHandleView *)v5 _createLineView];
    [(PUCropHandleView *)v5 addSubview:v10];
    v11 = _NSDictionaryOfVariableBindings(&cfstr_LineviewRefere.isa, v10, v6, 0);
    if ([(PUCropHandleView *)v5 isTop] || [(PUCropHandleView *)v5 isBottom])
    {
      v25 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[lineView]|" options:0x10000 metrics:v9 views:v11];
      [(PUCropHandleView *)v5 addConstraints:v25];

      BOOL v26 = [(PUCropHandleView *)v5 isTop];
      if (v26) {
        uint64_t v27 = 4;
      }
      else {
        uint64_t v27 = 3;
      }
      if (v26) {
        v28 = @"V:[lineView][referenceView]|";
      }
      else {
        v28 = @"V:|[referenceView][lineView]";
      }
      v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:v27 relatedBy:0 toItem:v5 attribute:10 multiplier:1.0 constant:0.0];
      [(PUCropHandleView *)v5 addConstraint:v29];

      v30 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v28 options:6 metrics:v9 views:v11];
      [(PUCropHandleView *)v5 addConstraints:v30];

      v31 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v7];
      [(PUCropHandleView *)v5 addConstraint:v31];

      v76 = v10;
      int v32 = 1;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      [(PUCropHandleView *)v5 _setLineViews:v33];
    }
    else
    {
      if ([(PUCropHandleView *)v5 isLeft]) {
        uint64_t v47 = 65560;
      }
      else {
        uint64_t v47 = 131096;
      }
      v48 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[lineView][referenceView]|" options:v47 metrics:v9 views:v11];
      [(PUCropHandleView *)v5 addConstraints:v48];

      v49 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[referenceView]|" options:0 metrics:v9 views:v11];
      [(PUCropHandleView *)v5 addConstraints:v49];

      v50 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[lineView]|" options:0 metrics:v9 views:v11];
      [(PUCropHandleView *)v5 addConstraints:v50];

      v51 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v7];
      [(PUCropHandleView *)v5 addConstraint:v51];

      if ([(PUCropHandleView *)v5 isLeft]) {
        uint64_t v52 = 2;
      }
      else {
        uint64_t v52 = 1;
      }
      v33 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:v52 relatedBy:0 toItem:v5 attribute:9 multiplier:1.0 constant:0.0];
      [(PUCropHandleView *)v5 addConstraint:v33];
      int v32 = 0;
    }

    v75 = v10;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    [(PUCropHandleView *)v5 _setLineViews:v53];

    v12 = [(PUCropHandleView *)v5 _createLineView];
    [(PUCropHandleView *)v5 addSubview:v12];
    if (v32)
    {
      v54 = [v12 heightAnchor];
      v55 = [v54 constraintEqualToConstant:3.0];
      [v55 setActive:1];

      v56 = [v12 widthAnchor];
      v57 = [v56 constraintEqualToConstant:25.0];
      [v57 setActive:1];

      v58 = [v6 centerXAnchor];
      v59 = [v12 centerXAnchor];
      v60 = [v58 constraintEqualToAnchor:v59];
      [v60 setActive:1];

      if ([(PUCropHandleView *)v5 isTop])
      {
        v46 = [v6 topAnchor];
        uint64_t v61 = [v12 topAnchor];
LABEL_41:
        v69 = (void *)v61;
        double v70 = 3.0;
LABEL_45:
        v72 = [v46 constraintEqualToAnchor:v69 constant:v70];
        [v72 setActive:1];

LABEL_46:
        goto LABEL_47;
      }
      v46 = [v6 bottomAnchor];
      uint64_t v71 = [v12 bottomAnchor];
    }
    else
    {
      v62 = [v12 widthAnchor];
      v63 = [v62 constraintEqualToConstant:3.0];
      [v63 setActive:1];

      v64 = [v12 heightAnchor];
      v65 = [v64 constraintEqualToConstant:25.0];
      [v65 setActive:1];

      v66 = [v6 centerYAnchor];
      v67 = [v12 centerYAnchor];
      v68 = [v66 constraintEqualToAnchor:v67];
      [v68 setActive:1];

      if ([(PUCropHandleView *)v5 isLeft])
      {
        v46 = [v6 leftAnchor];
        uint64_t v61 = [v12 leftAnchor];
        goto LABEL_41;
      }
      v46 = [v6 rightAnchor];
      uint64_t v71 = [v12 rightAnchor];
    }
    v69 = (void *)v71;
    double v70 = -3.0;
    goto LABEL_45;
  }
  return v5;
}

- (PUCropHandleView)initWithFrame:(CGRect)a3
{
  return (PUCropHandleView *)-[PUCropHandleView initForHandle:](self, "initForHandle:", 4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)allHandles
{
  if (allHandles___allHandlesToken != -1) {
    dispatch_once(&allHandles___allHandlesToken, &__block_literal_global_20761);
  }
  id v2 = (void *)allHandles___allHandles;
  return v2;
}

void __30__PUCropHandleView_allHandles__block_invoke()
{
  v0 = (void *)allHandles___allHandles;
  allHandles___allHandles = (uint64_t)&unk_1F078AD78;
}

@end