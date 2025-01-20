@interface _UIDragPreviewBlockProvider
+ (id)previewProviderWithBlock:(id)a3;
- (UIDragPreview)preview;
- (id)_createImageComponent;
- (id)_duiPreview;
- (id)imageComponent;
@end

@implementation _UIDragPreviewBlockProvider

+ (id)previewProviderWithBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"UIDragPreview.m", 149, @"Invalid parameter not satisfying: %@", @"previewProviderBlock" object file lineNumber description];
  }
  objc_opt_class();
  v6 = objc_opt_new();
  v7 = _Block_copy(v5);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (UIDragPreview)preview
{
  preview = (void (**)(void *, SEL))self->_preview;
  if (!preview)
  {
    preview = (void (**)(void *, SEL))self->_previewProviderBlock;
    if (preview)
    {
      preview[2](preview, a2);
      v4 = (UIDragPreview *)objc_claimAutoreleasedReturnValue();
      id v5 = self->_preview;
      self->_preview = v4;

      id previewProviderBlock = self->_previewProviderBlock;
      self->_id previewProviderBlock = 0;

      preview = (void (**)(void *, SEL))self->_preview;
    }
  }
  return (UIDragPreview *)preview;
}

- (id)_duiPreview
{
  v2 = [(_UIDragPreviewBlockProvider *)self preview];
  v3 = [v2 _duiPreview];

  return v3;
}

- (id)imageComponent
{
  imageComponent = self->_imageComponent;
  if (!imageComponent)
  {
    v4 = [(_UIDragPreviewBlockProvider *)self _createImageComponent];
    id v5 = self->_imageComponent;
    self->_imageComponent = v4;

    imageComponent = self->_imageComponent;
  }
  return imageComponent;
}

- (id)_createImageComponent
{
  v3 = [(_UIDragPreviewBlockProvider *)self preview];

  if (v3)
  {
    v4 = [(_UIDragPreviewBlockProvider *)self preview];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_4;
    }
    v6 = [(_UIDragPreviewBlockProvider *)self preview];
    v7 = [v6 _dragPreviewProvider];
    v8 = [v7 imageComponent];

    if (!v8)
    {
LABEL_4:
      v9 = [(_UIDragPreviewBlockProvider *)self preview];
      v10 = [v9 view];
      v11 = [v9 parameters];
      uint64_t v12 = [v11 _previewMode];

      if ((unint64_t)(v12 - 3) > 1)
      {
        if ([(id)UIApp _isSpringBoard]) {
          int v13 = 0;
        }
        else {
          int v13 = [v9 _preventAfterScreenUpdatesSnapshot] ^ 1;
        }
        BOOL CanBeRenderedAfterCommit = _UIViewCanBeRenderedAfterCommit(v10, v13);
        uint64_t v15 = [v10 accessibilityIgnoresInvertColors];
        [v10 bounds];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        if (!CanBeRenderedAfterCommit
          || (_UIRenderViewImageAfterCommit(v10, 0, v13), (v24 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v25 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v21, v23);
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __52___UIDragPreviewBlockProvider__createImageComponent__block_invoke;
          v27[3] = &unk_1E52DD848;
          double v29 = v17;
          double v30 = v19;
          double v31 = v21;
          double v32 = v23;
          id v28 = v10;
          v24 = [(UIGraphicsImageRenderer *)v25 imageWithActions:v27];
        }
        v8 = -[_UIDraggingImageComponent initWithImage:frame:ignoreAccessibilityFilters:]([_UIDraggingImageComponent alloc], "initWithImage:frame:ignoreAccessibilityFilters:", v24, v15, v17, v19, v21, v23);
      }
      else
      {
        v8 = [[_UIDraggingImageComponent alloc] initWithView:v10];
      }
    }
  }
  else
  {
    v8 = [[_UIDraggingImageComponent alloc] initHidingDragImage];
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
  objc_storeStrong(&self->_previewProviderBlock, 0);
}

@end