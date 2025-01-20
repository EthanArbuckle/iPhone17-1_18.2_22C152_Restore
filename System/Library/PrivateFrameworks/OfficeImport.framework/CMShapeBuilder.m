@interface CMShapeBuilder
+ (CGRect)canonicalBounds;
- (BOOL)isOffice12;
- (CGAffineTransform)affineTransform;
- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3;
- (float)maxAdjustedValue;
- (void)setAdjustValues:(id)a3;
- (void)setFileFormat:(unint64_t)a3;
- (void)setOrientedBounds:(id)a3;
- (void)setShapeType:(int)a3;
@end

@implementation CMShapeBuilder

- (void)setOrientedBounds:(id)a3
{
}

- (void)setShapeType:(int)a3
{
  self->_type = a3;
}

- (void)setAdjustValues:(id)a3
{
}

- (void)setFileFormat:(unint64_t)a3
{
  self->_format = a3;
}

+ (CGRect)canonicalBounds
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 10.0;
  double v5 = 10.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)maxAdjustedValue
{
  BOOL v2 = [(CMShapeBuilder *)self isOffice12];
  float result = 10800.0;
  if (v2) {
    return 50000.0;
  }
  return result;
}

- (BOOL)isOffice12
{
  return (self->_format < 7) & (0x54u >> self->_format);
}

- (CGAffineTransform)affineTransform
{
  orientedBounds = self->_orientedBounds;
  if (!orientedBounds)
  {
    v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:a3 object:self file:@"CMShapeBuilder.mm" lineNumber:44 description:@"oriented bounds not set"];

    orientedBounds = self->_orientedBounds;
  }
  uint64_t v6 = MEMORY[0x263F000D0];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  [(OADOrientedBounds *)orientedBounds bounds];
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  +[CMShapeBuilder canonicalBounds];
  double v17 = v16;
  double v19 = v18;
  [(OADOrientedBounds *)self->_orientedBounds rotation];
  BOOL v20 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  if (v20)
  {
    double v9 = NSTransposedRectWithSameCenter(v9, v11, v13, v15);
    CGFloat v11 = v21;
    CGFloat v13 = v22;
    CGFloat v15 = v23;
  }
  long long v24 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v58.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v58.c = v24;
  *(_OWORD *)&v58.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(retstr, &v58, v9, v11);
  [(OADOrientedBounds *)self->_orientedBounds rotation];
  float v26 = v25 * 3.14159265 / 180.0;
  if (v26 != 0.0)
  {
    if (v20) {
      float v27 = v26;
    }
    else {
      float v27 = -v26;
    }
    long long v28 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v56.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v56.c = v28;
    *(_OWORD *)&v56.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v57, &v56, v13 * 0.5, v15 * 0.5);
    long long v29 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v29;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
    long long v30 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v55.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v55.c = v30;
    *(_OWORD *)&v55.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v57, &v55, v27);
    long long v31 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v31;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
    long long v32 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v54.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v54.c = v32;
    *(_OWORD *)&v54.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v57, &v54, -(v13 * 0.5), -(v15 * 0.5));
    long long v33 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v33;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  }
  if ([(OADOrientedBounds *)self->_orientedBounds flipX])
  {
    long long v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v53.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v53.c = v34;
    *(_OWORD *)&v53.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v57, &v53, -1.0, 1.0);
    long long v35 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v35;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
    long long v36 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v52.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v52.c = v36;
    *(_OWORD *)&v52.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v57, &v52, -v13, 0.0);
    long long v37 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v37;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  }
  if (![(OADOrientedBounds *)self->_orientedBounds flipY])
  {
    long long v38 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v51.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v51.c = v38;
    *(_OWORD *)&v51.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v57, &v51, 1.0, -1.0);
    long long v39 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v39;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
    long long v40 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v50.c = v40;
    *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v57, &v50, 0.0, -v15);
    long long v41 = *(_OWORD *)&v57.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
    *(_OWORD *)&retstr->c = v41;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  }
  float v42 = v13 / v17;
  float v43 = v15 / v19;
  long long v44 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v49.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v49.c = v44;
  *(_OWORD *)&v49.tx = *(_OWORD *)&retstr->tx;
  float result = CGAffineTransformScale(&v57, &v49, v42, v43);
  long long v46 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v46;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  return result;
}

- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustValues, 0);
  objc_storeStrong((id *)&self->_orientedBounds, 0);
}

@end