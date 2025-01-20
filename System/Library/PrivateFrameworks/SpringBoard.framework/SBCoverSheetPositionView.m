@interface SBCoverSheetPositionView
- (CGPoint)_simulatedTouchLocationForProgress;
- (CGRect)positionContentForTouchAtLocation:(CGPoint)a3;
- (CGRect)positionContentForTouchAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4 transformMode:(int64_t)a5 forPresentationValue:(BOOL)a6;
- (SBCoverSheetPositionView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (double)_progressForTouchLocation:(CGPoint)a3;
- (double)_progressFromContenViewFrame:(CGRect)a3;
- (double)progress;
- (void)_createContentView;
- (void)setFrame:(CGRect)a3;
- (void)setProgress:(double)a3;
@end

@implementation SBCoverSheetPositionView

- (SBCoverSheetPositionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBCoverSheetPositionView;
  v3 = -[SBCoverSheetPositionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SBCoverSheetPositionView *)v3 _createContentView];
  }
  return v4;
}

- (void)_createContentView
{
  if (!self->_contentView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
    [(SBCoverSheetPositionView *)self bounds];
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v4;

    [(SBCoverSheetPositionView *)self addSubview:self->_contentView];
    [(UIView *)self->_contentView setOpaque:0];
    [(UIView *)self->_contentView setAutoresizingMask:18];
    objc_super v6 = self->_contentView;
    [(UIView *)v6 setClipsToBounds:1];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBCoverSheetPositionView *)self frame];
  double v9 = v8;
  double v11 = v10;
  [(UIView *)self->_contentView frame];
  -[SBCoverSheetPositionView _progressFromContenViewFrame:](self, "_progressFromContenViewFrame:");
  -[SBCoverSheetPositionView setProgress:](self, "setProgress:");
  v13.receiver = self;
  v13.super_class = (Class)SBCoverSheetPositionView;
  -[SBCoverSheetPositionView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    [(SBCoverSheetPositionView *)self _simulatedTouchLocationForProgress];
    -[SBCoverSheetPositionView positionContentForTouchAtLocation:](self, "positionContentForTouchAtLocation:");
  }
}

- (CGRect)positionContentForTouchAtLocation:(CGPoint)a3
{
  -[SBCoverSheetPositionView positionContentForTouchAtLocation:withVelocity:transformMode:forPresentationValue:](self, "positionContentForTouchAtLocation:withVelocity:transformMode:forPresentationValue:", 1, 0, a3.x, a3.y, 0.0, 0.0);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)positionContentForTouchAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4 transformMode:(int64_t)a5 forPresentationValue:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat y = a4.y;
  double v9 = a3.y;
  [(SBCoverSheetPositionView *)self bounds];
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v71.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v71.c = v12;
  *(_OWORD *)&v71.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  objc_super v13 = (uint64_t *)MEMORY[0x1E4F1DAD8];
  long long v53 = v12;
  long long v54 = *(_OWORD *)&v71.a;
  long long v52 = *(_OWORD *)&v71.tx;
  if (a5 == 2)
  {
    CGFloat v51 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGAffineTransformMakeScale(&v71, (v11 + (v11 - v9) * -2.0) / v11, (v11 + (v11 - v9) * -2.0) / v11);
    [(SBCoverSheetPositionView *)self bounds];
    CGAffineTransform v65 = v71;
    CGRect v73 = CGRectApplyAffineTransform(v72, &v65);
    double x = v73.origin.x;
    double v14 = v73.origin.y;
    double width = v73.size.width;
    double height = v73.size.height;
  }
  else
  {
    SBScreenScale();
    BSFloatRoundForScale();
    double v18 = v17;
    [(SBCoverSheetPositionView *)self bounds];
    CGFloat v51 = y;
    double height = v19;
    double width = v20;
    double v14 = v18;
    double x = v21;
  }
  UIRectGetCenter();
  double v23 = v22;
  double v25 = v24;
  CGAffineTransform v65 = v71;
  IsIdentitCGFloat y = CGAffineTransformIsIdentity(&v65);
  [(UIView *)self->_contentView center];
  BOOL v29 = v25 == v28 && v23 == v27;
  if (v6)
  {
    if (!IsIdentity)
    {
      contentView = self->_contentView;
      long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      long long v67 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      long long v68 = v31;
      long long v32 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      long long v69 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      long long v70 = v32;
      long long v33 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v65.a = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v65.c = v33;
      long long v34 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v65.tdouble x = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      long long v66 = v34;
      v35 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v65];
      [(UIView *)contentView _setPresentationValue:v35 forKey:@"transform"];
    }
    if (!v29)
    {
      uint64_t v36 = *v13;
      v37 = self->_contentView;
      *(double *)v64 = v23;
      *(double *)&v64[1] = v25;
      v38 = [MEMORY[0x1E4F29238] valueWithBytes:v64 objCType:"{CGPoint=dd}"];
      v63[0] = v36;
      *(CGFloat *)&v63[1] = v51;
      v39 = [MEMORY[0x1E4F29238] valueWithBytes:v63 objCType:"{CGPoint=dd}"];
      [(UIView *)v37 _setPresentationValue:v38 velocity:v39 preferredFrameRateRangeMaximum:120 forKey:@"position"];
    }
    double v40 = x;
    if (!IsIdentity)
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v66 = 0u;
      memset(&v65, 0, sizeof(v65));
      SBVelocityMatrixForUniform2DScaling();
      v41 = self->_contentView;
      v42 = (void *)MEMORY[0x1E4F29238];
      CGAffineTransform m = v71;
      CATransform3DMakeAffineTransform(&v62, &m);
      v43 = [v42 valueWithCATransform3D:&v62];
      long long v58 = v67;
      long long v59 = v68;
      long long v60 = v69;
      long long v61 = v70;
      CGAffineTransform m = v65;
      long long v57 = v66;
      v44 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&m];
      [(UIView *)v41 _setPresentationValue:v43 velocity:v44 preferredFrameRateRangeMaximum:120 forKey:@"transform"];
    }
  }
  else
  {
    v45 = self->_contentView;
    *(_OWORD *)&v65.a = v54;
    *(_OWORD *)&v65.c = v53;
    *(_OWORD *)&v65.tdouble x = v52;
    [(UIView *)v45 setTransform:&v65];
    -[UIView setCenter:](self->_contentView, "setCenter:", v23, v25);
    v46 = self->_contentView;
    CGAffineTransform v65 = v71;
    [(UIView *)v46 setTransform:&v65];
    double v40 = x;
    -[SBCoverSheetPositionView _progressFromContenViewFrame:](self, "_progressFromContenViewFrame:", x, v14, width, height);
    -[SBCoverSheetPositionView setProgress:](self, "setProgress:");
  }
  double v47 = v40;
  double v48 = v14;
  double v49 = width;
  double v50 = height;
  result.size.double height = v50;
  result.size.double width = v49;
  result.origin.CGFloat y = v48;
  result.origin.double x = v47;
  return result;
}

- (double)_progressForTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  [(UIView *)self->_contentView bounds];
  return (v4 - y) / v4;
}

- (double)_progressFromContenViewFrame:(CGRect)a3
{
  return -a3.origin.y / CGRectGetHeight(a3);
}

- (CGPoint)_simulatedTouchLocationForProgress
{
  [(UIView *)self->_contentView frame];
  double Height = CGRectGetHeight(v8);
  [(SBCoverSheetPositionView *)self progress];
  double v5 = Height * (1.0 - v4);
  double v6 = 0.0;
  result.double y = v5;
  result.double x = v6;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
}

@end