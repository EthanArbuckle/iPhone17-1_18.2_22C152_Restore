@interface _UIDragMonitorSessionPreview
- (CGPoint)previewContentOffset;
- (CGSize)previewContentSize;
- (CGSize)previewScaledSize;
- (UIBezierPath)outline;
- (UIDragPreviewParameters)parameters;
- (UIImage)previewImage;
- (_DUIImageComponent)imageComponent;
- (_DUIPreview)preview;
- (_UIDragMonitorSessionPreview)initWithImageComponent:(id)a3 preview:(id)a4;
- (void)setImageComponent:(id)a3;
- (void)setPreview:(id)a3;
@end

@implementation _UIDragMonitorSessionPreview

- (_UIDragMonitorSessionPreview)initWithImageComponent:(id)a3 preview:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIDragMonitorSessionPreview;
  v9 = [(_UIDragMonitorSessionPreview *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageComponent, a3);
    objc_storeStrong((id *)&v10->_preview, a4);
    v11 = [v8 parameters];
    v12 = v11;
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = objc_alloc_init(UIDragPreviewParameters);
    }
    parameters = v10->_parameters;
    v10->_parameters = v13;
  }
  return v10;
}

- (UIImage)previewImage
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v3 = [(_UIDragMonitorSessionPreview *)self imageComponent];
  v4 = [v3 createSnapshotViewForPreview:self->_preview];

  [(_UIDragMonitorSessionPreview *)self previewContentSize];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  v9 = [(UIPreviewParameters *)self->_parameters visiblePath];
  if (v9)
  {
    [(_DUIPreview *)self->_preview contentOffset];
    id v10 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    [v4 bounds];
    objc_msgSend(v10, "setFrame:");
    id v11 = v9;
    objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
    v12 = [v4 layer];
    [v12 setMask:v10];

    [v11 bounds];
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v6 = v17;
    uint64_t v8 = v18;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
  }
  v29[0] = @"dst-size";
  v19 = (void *)MEMORY[0x1E4F29238];
  [(_UIDragMonitorSessionPreview *)self previewContentSize];
  v28[0] = v20;
  v28[1] = v21;
  v22 = [v19 valueWithBytes:v28 objCType:"{CGSize=dd}"];
  v30[0] = v22;
  v29[1] = @"src-rect";
  v27[0] = v14;
  v27[1] = v16;
  v27[2] = v6;
  v27[3] = v8;
  v23 = [MEMORY[0x1E4F29238] valueWithBytes:v27 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v30[1] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  v25 = _UIRenderViewImageAfterCommit(v4, v24, 1);

  return (UIImage *)v25;
}

- (CGSize)previewScaledSize
{
  v2 = [(_UIDragMonitorSessionPreview *)self preview];
  [v2 scaledSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)previewContentSize
{
  v2 = [(_UIDragMonitorSessionPreview *)self preview];
  [v2 contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGPoint)previewContentOffset
{
  v2 = [(_UIDragMonitorSessionPreview *)self preview];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (UIBezierPath)outline
{
  v2 = [(_UIDragMonitorSessionPreview *)self preview];
  double v3 = [v2 outline];

  return (UIBezierPath *)v3;
}

- (_DUIImageComponent)imageComponent
{
  return self->_imageComponent;
}

- (void)setImageComponent:(id)a3
{
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (UIDragPreviewParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
}

@end