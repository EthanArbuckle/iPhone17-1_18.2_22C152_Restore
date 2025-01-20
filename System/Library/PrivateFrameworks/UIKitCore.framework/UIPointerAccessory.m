@interface UIPointerAccessory
+ (UIPointerAccessory)accessoryWithShape:(UIPointerShape *)shape position:(UIPointerAccessoryPosition)position;
+ (UIPointerAccessory)arrowAccessoryWithPosition:(UIPointerAccessoryPosition)position;
- (BOOL)_isArrowAccessory;
- (BOOL)isEqual:(id)a3;
- (BOOL)orientationMatchesAngle;
- (UIPointerAccessoryPosition)position;
- (UIPointerShape)shape;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setOrientationMatchesAngle:(BOOL)orientationMatchesAngle;
- (void)setPosition:(id)a3;
- (void)setShape:(id)a3;
@end

@implementation UIPointerAccessory

+ (UIPointerAccessory)accessoryWithShape:(UIPointerShape *)shape position:(UIPointerAccessoryPosition)position
{
  double angle = position.angle;
  double offset = position.offset;
  v6 = shape;
  v7 = objc_opt_new();
  [v7 setShape:v6];

  objc_msgSend(v7, "setPosition:", fmax(offset, 0.0), angle);
  return (UIPointerAccessory *)v7;
}

+ (UIPointerAccessory)arrowAccessoryWithPosition:(UIPointerAccessoryPosition)position
{
  double angle = position.angle;
  double offset = position.offset;
  if (_MergedGlobals_937 != -1) {
    dispatch_once(&_MergedGlobals_937, &__block_literal_global_20);
  }
  +[UIPointerAccessory accessoryWithShape:position:](UIPointerAccessory, "accessoryWithShape:position:", qword_1EB25EF40, offset, angle);
  v5 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  [v5 setOrientationMatchesAngle:1];
  v5[8] = 1;
  return (UIPointerAccessory *)v5;
}

void __49__UIPointerAccessory_arrowAccessoryWithPosition___block_invoke()
{
  uint64_t v0 = +[UIPointerShape _shapeWithSymbol:@"arrowtriangle.up.fill" pointSize:11.0];
  v1 = (void *)qword_1EB25EF40;
  qword_1EB25EF40 = v0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(UIPointerAccessory *)self shape];
  [v4 setShape:v5];

  [(UIPointerAccessory *)self position];
  objc_msgSend(v4, "setPosition:");
  v4[8] = [(UIPointerAccessory *)self _isArrowAccessory];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIPointerAccessory *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(UIPointerAccessory *)self shape];
      v7 = [(UIPointerAccessory *)v5 shape];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if (!v8 || !v9)
        {

          goto LABEL_17;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11) {
          goto LABEL_17;
        }
      }
      [(UIPointerAccessory *)self position];
      double v14 = v13;
      double v16 = v15;
      [(UIPointerAccessory *)v5 position];
      double v19 = vabdd_f64(v16, v18);
      if (vabdd_f64(v14, v17) <= 2.22044605e-16 && v19 <= 2.22044605e-16)
      {
        BOOL v21 = [(UIPointerAccessory *)self orientationMatchesAngle];
        BOOL v12 = v21 ^ [(UIPointerAccessory *)v5 orientationMatchesAngle] ^ 1;
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:
      LOBYTE(v12) = 0;
      goto LABEL_18;
    }
    LOBYTE(v12) = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(UIPointerAccessory *)self shape];
  uint64_t v4 = [v3 hash];
  [(UIPointerAccessory *)self position];
  uint64_t v6 = (int)v5;
  [(UIPointerAccessory *)self position];
  unint64_t v8 = v4 ^ [(UIPointerAccessory *)self orientationMatchesAngle] ^ v6 ^ (int)v7;

  return v8;
}

- (BOOL)_isArrowAccessory
{
  return self->_isArrowAccessory;
}

- (UIPointerShape)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
}

- (UIPointerAccessoryPosition)position
{
  double offset = self->_position.offset;
  double angle = self->_position.angle;
  result.double angle = angle;
  result.double offset = offset;
  return result;
}

- (void)setPosition:(id)a3
{
  self->_position = ($9AE93E77EC92CA8E9C6A5D1FC64A29A7)a3;
}

- (BOOL)orientationMatchesAngle
{
  return self->_orientationMatchesAngle;
}

- (void)setOrientationMatchesAngle:(BOOL)orientationMatchesAngle
{
  self->_orientationMatchesAngle = orientationMatchesAngle;
}

- (void).cxx_destruct
{
}

@end