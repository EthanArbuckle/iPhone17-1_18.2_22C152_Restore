@interface ODIImageLinear
- (ODIImageLinear)initWithImagePresentationName:(id)a3 state:(id)a4;
- (void)mapPoint:(id)a3 bounds:(CGRect)a4;
@end

@implementation ODIImageLinear

- (ODIImageLinear)initWithImagePresentationName:(id)a3 state:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ODIImageLinear;
  v9 = [(ODILinear *)&v12 initWithState:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mImagePresentationName, a3);
    [(ODILinear *)v10 setIsTextCentered:0];
  }

  return v10;
}

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v27 = a3;
  LODWORD(v9) = 1033476506;
  v10 = +[ODIDrawable shapeGeometryForRoundedRectangleWithRadius:v9];
  v11 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v10, self->super.mState, x, y, width, height, 0.0);
  +[ODIDrawable mapStyleFromPoint:v27 shape:v11 state:self->super.mState];
  if (self->super.mIsHorizontal)
  {
    float v12 = width * 0.05;
    double v14 = y + v12;
    double v15 = width - (float)(v12 + v12);
    double v16 = v15 * 0.899999976;
    v29.origin.double x = x + v12;
    double v13 = v29.origin.x;
    v29.origin.double y = v14;
    v29.size.double width = v15;
    v29.size.double height = v15 * 0.899999976;
    CGFloat MaxY = CGRectGetMaxY(v29);
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    double v17 = CGRectGetMaxY(v30);
    v31.origin.double x = v13;
    v31.origin.double y = v14;
    v31.size.double width = v15;
    v31.size.double height = v15 * 0.899999976;
    double v18 = CGRectGetMaxY(v31);
    double height = v17 - v18;
    double y = MaxY;
  }
  else
  {
    float v19 = height * 0.05;
    double v14 = y + v19;
    double v16 = height - (float)(v19 + v19);
    double v15 = v16 * 1.11;
    v32.origin.double x = x + v19;
    double v13 = v32.origin.x;
    v32.origin.double y = v14;
    v32.size.double width = v16 * 1.11;
    v32.size.double height = v16;
    CGFloat MaxX = CGRectGetMaxX(v32);
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    double v20 = CGRectGetMaxX(v33);
    v34.origin.double x = v13;
    v34.origin.double y = v14;
    v34.size.double width = v16 * 1.11;
    v34.size.double height = v16;
    double v18 = CGRectGetMaxX(v34);
    double width = v20 - v18;
    double x = MaxX;
  }
  LODWORD(v18) = 1033476506;
  v21 = +[ODIDrawable shapeGeometryForRoundedRectangleWithRadius:v18];
  v22 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v21, self->super.mState, v13, v14, v15, v16, 0.0);
  +[ODIDrawable mapStyleForPresentationName:self->mImagePresentationName point:v27 shape:v22 state:self->super.mState];
  v23 = +[ODIDrawable shapeGeometryForRectangle];
  v24 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v23, self->super.mState, x, y, width, height, 0.0);

  +[ODIText mapTextFromPoint:v27 toShape:v24 isCenteredHorizontally:self->super.mIsTextCenteredHorizontally isCenteredVertically:self->super.mIsTextCenteredVertically includeChildren:1 state:self->super.mState];
}

- (void).cxx_destruct
{
}

@end