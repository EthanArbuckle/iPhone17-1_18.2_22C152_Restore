@interface DebugDirectionAnnotationView
- (DebugDirectionAnnotation)annotation;
- (DebugDirectionAnnotationView)initWithAnnotation:(id)a3 debugAnnotation:(id)a4 reuseIdentifier:(id)a5;
- (void)_setMapPitchRadians:(double)a3;
- (void)_setMapRotationRadians:(double)a3;
- (void)_updateTransform;
- (void)setAnnotation:(id)a3;
@end

@implementation DebugDirectionAnnotationView

- (DebugDirectionAnnotationView)initWithAnnotation:(id)a3 debugAnnotation:(id)a4 reuseIdentifier:(id)a5
{
  id v8 = a3;
  v53.receiver = self;
  v53.super_class = (Class)DebugDirectionAnnotationView;
  v9 = [(DebugDirectionAnnotationView *)&v53 initWithAnnotation:v8 reuseIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    p_annotation = (id *)&v9->_annotation;
    objc_storeStrong((id *)&v9->_annotation, a3);
    uint64_t v12 = +[CALayer layer];
    directionView = v10->_directionView;
    v10->_directionView = (CALayer *)v12;

    [*p_annotation size];
    double v15 = v14;
    [*p_annotation size];
    -[CALayer setBounds:](v10->_directionView, "setBounds:", 0.0, 0.0, v15, v16);
    -[CALayer setPosition:](v10->_directionView, "setPosition:", 0.0, 0.0);
    -[CALayer setAnchorPoint:](v10->_directionView, "setAnchorPoint:", 0.5, 0.0);
    id v17 = [*p_annotation color];
    -[CALayer setBackgroundColor:](v10->_directionView, "setBackgroundColor:", [v17 CGColor]);

    v58[0] = @"bounds";
    v18 = +[NSNull null];
    v59[0] = v18;
    v58[1] = @"position";
    v19 = +[NSNull null];
    v59[1] = v19;
    v58[2] = @"cornerRadius";
    v20 = +[NSNull null];
    v59[2] = v20;
    v58[3] = @"transform";
    v21 = +[NSNull null];
    v59[3] = v21;
    v58[4] = @"hidden";
    v22 = +[NSNull null];
    v59[4] = v22;
    v23 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:5];
    [(CALayer *)v10->_directionView setActions:v23];

    v24 = [(DebugDirectionAnnotationView *)v10 layer];
    [v24 addSublayer:v10->_directionView];

    uint64_t v25 = +[CALayer layer];
    fovLeftDirectionView = v10->_fovLeftDirectionView;
    v10->_fovLeftDirectionView = (CALayer *)v25;

    [*p_annotation size];
    double v28 = v27;
    [*p_annotation size];
    -[CALayer setFrame:](v10->_fovLeftDirectionView, "setFrame:", 0.0, 0.0, v28, v29);
    -[CALayer setPosition:](v10->_fovLeftDirectionView, "setPosition:", 0.0, 0.0);
    -[CALayer setAnchorPoint:](v10->_fovLeftDirectionView, "setAnchorPoint:", 0.5, 0.0);
    id v30 = [*p_annotation color];
    -[CALayer setBackgroundColor:](v10->_fovLeftDirectionView, "setBackgroundColor:", [v30 CGColor]);

    v56[0] = @"bounds";
    v31 = +[NSNull null];
    v57[0] = v31;
    v56[1] = @"position";
    v32 = +[NSNull null];
    v57[1] = v32;
    v56[2] = @"cornerRadius";
    v33 = +[NSNull null];
    v57[2] = v33;
    v56[3] = @"transform";
    v34 = +[NSNull null];
    v57[3] = v34;
    v56[4] = @"hidden";
    v35 = +[NSNull null];
    v57[4] = v35;
    v36 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:5];
    [(CALayer *)v10->_fovLeftDirectionView setActions:v36];

    v37 = [(DebugDirectionAnnotationView *)v10 layer];
    [v37 addSublayer:v10->_fovLeftDirectionView];

    uint64_t v38 = +[CALayer layer];
    fovRightDirectionView = v10->_fovRightDirectionView;
    v10->_fovRightDirectionView = (CALayer *)v38;

    [*p_annotation size];
    double v41 = v40;
    [*p_annotation size];
    -[CALayer setFrame:](v10->_fovRightDirectionView, "setFrame:", 0.0, 0.0, v41, v42);
    -[CALayer setPosition:](v10->_fovRightDirectionView, "setPosition:", 0.0, 0.0);
    -[CALayer setAnchorPoint:](v10->_fovRightDirectionView, "setAnchorPoint:", 0.5, 0.0);
    id v43 = [*p_annotation color];
    -[CALayer setBackgroundColor:](v10->_fovRightDirectionView, "setBackgroundColor:", [v43 CGColor]);

    v54[0] = @"bounds";
    v44 = +[NSNull null];
    v55[0] = v44;
    v54[1] = @"position";
    v45 = +[NSNull null];
    v55[1] = v45;
    v54[2] = @"cornerRadius";
    v46 = +[NSNull null];
    v55[2] = v46;
    v54[3] = @"transform";
    v47 = +[NSNull null];
    v55[3] = v47;
    v54[4] = @"hidden";
    v48 = +[NSNull null];
    v55[4] = v48;
    v49 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:5];
    [(CALayer *)v10->_fovRightDirectionView setActions:v49];

    v50 = [(DebugDirectionAnnotationView *)v10 layer];
    [v50 addSublayer:v10->_fovRightDirectionView];

    v51 = v10;
  }

  return v10;
}

- (void)setAnnotation:(id)a3
{
  p_annotation = &self->_annotation;
  objc_storeStrong((id *)&self->_annotation, a3);
  id v6 = a3;
  [(DebugDirectionAnnotation *)*p_annotation size];
  double v8 = v7;
  [(DebugDirectionAnnotation *)*p_annotation size];
  -[CALayer setBounds:](self->_directionView, "setBounds:", 0.0, 0.0, v8, v9);
  id v10 = [(DebugDirectionAnnotation *)*p_annotation color];
  -[CALayer setBackgroundColor:](self->_directionView, "setBackgroundColor:", [v10 CGColor]);

  [(DebugDirectionAnnotation *)*p_annotation size];
  double v12 = v11;
  [(DebugDirectionAnnotation *)*p_annotation size];
  -[CALayer setBounds:](self->_fovLeftDirectionView, "setBounds:", 0.0, 0.0, v12, v13);
  id v14 = [(DebugDirectionAnnotation *)*p_annotation color];
  -[CALayer setBackgroundColor:](self->_fovLeftDirectionView, "setBackgroundColor:", [v14 CGColor]);

  [(DebugDirectionAnnotation *)*p_annotation size];
  double v16 = v15;
  [(DebugDirectionAnnotation *)*p_annotation size];
  -[CALayer setBounds:](self->_fovRightDirectionView, "setBounds:", 0.0, 0.0, v16, v17);
  id v18 = [(DebugDirectionAnnotation *)*p_annotation color];
  -[CALayer setBackgroundColor:](self->_fovRightDirectionView, "setBackgroundColor:", [v18 CGColor]);

  [(DebugDirectionAnnotationView *)self _updateTransform];
}

- (void)_setMapPitchRadians:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DebugDirectionAnnotationView;
  [(DebugDirectionAnnotationView *)&v4 _setMapPitchRadians:a3];
  [(DebugDirectionAnnotationView *)self _updateTransform];
}

- (void)_setMapRotationRadians:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DebugDirectionAnnotationView;
  [(DebugDirectionAnnotationView *)&v4 _setMapRotationRadians:a3];
  [(DebugDirectionAnnotationView *)self _updateTransform];
}

- (void)_updateTransform
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  memset(&v27, 0, sizeof(v27));
  [(DebugDirectionAnnotationView *)self _mapPitchRadians];
  CATransform3DMakeRotation(&v27, v3, 1.0, 0.0, 0.0);
  [(DebugDirectionAnnotation *)self->_annotation direction];
  double v5 = v4 * 0.0174532925;
  [(DebugDirectionAnnotationView *)self _mapRotationRadians];
  CATransform3D v25 = v27;
  CATransform3DRotate(&v26, &v25, v5 - v6 + 3.14159265, 0.0, 0.0, 1.0);
  directionView = self->_directionView;
  CATransform3D v24 = v26;
  [(CALayer *)directionView setTransform:&v24];
  [(DebugDirectionAnnotation *)self->_annotation direction];
  double v9 = v8 * 0.0174532925;
  [(DebugDirectionAnnotation *)self->_annotation fov];
  double v11 = v9 - v10 * 0.5 * 0.0174532925;
  [(DebugDirectionAnnotationView *)self _mapRotationRadians];
  CATransform3D v25 = v27;
  CATransform3DRotate(&v23, &v25, v11 - v12 + 3.14159265, 0.0, 0.0, 1.0);
  fovLeftDirectionView = self->_fovLeftDirectionView;
  CATransform3D v22 = v23;
  [(CALayer *)fovLeftDirectionView setTransform:&v22];
  [(DebugDirectionAnnotation *)self->_annotation direction];
  double v15 = v14 * 0.0174532925;
  [(DebugDirectionAnnotation *)self->_annotation fov];
  double v17 = v15 + v16 * 0.5 * 0.0174532925;
  [(DebugDirectionAnnotationView *)self _mapRotationRadians];
  CATransform3D v25 = v27;
  CATransform3DRotate(&v21, &v25, v17 - v18 + 3.14159265, 0.0, 0.0, 1.0);
  fovRightDirectionView = self->_fovRightDirectionView;
  CATransform3D v20 = v21;
  [(CALayer *)fovRightDirectionView setTransform:&v20];
  +[CATransaction commit];
}

- (DebugDirectionAnnotation)annotation
{
  return self->_annotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fovRightDirectionView, 0);
  objc_storeStrong((id *)&self->_fovLeftDirectionView, 0);
  objc_storeStrong((id *)&self->_directionView, 0);

  objc_storeStrong((id *)&self->_annotation, 0);
}

@end