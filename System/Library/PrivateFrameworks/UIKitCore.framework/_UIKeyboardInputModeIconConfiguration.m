@interface _UIKeyboardInputModeIconConfiguration
+ (id)defaultConfiguration;
- (BOOL)background;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (double)scaleFactor;
- (id)description;
- (int64_t)weight;
- (unint64_t)hash;
- (void)setBackground:(BOOL)a3;
- (void)setScaleFactor:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setWeight:(int64_t)a3;
@end

@implementation _UIKeyboardInputModeIconConfiguration

+ (id)defaultConfiguration
{
  objc_opt_class();
  v2 = objc_opt_new();
  objc_msgSend(v2, "setSize:", 23.0, 18.0);
  [v2 setWeight:4];
  [v2 setBackground:1];
  [v2 setScaleFactor:1.0];
  return v2;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardInputModeIconConfiguration;
  double v3 = (double)(3 * [(_UIKeyboardInputModeIconConfiguration *)&v10 hash]);
  [(_UIKeyboardInputModeIconConfiguration *)self size];
  double v5 = (double)(3 * (unint64_t)(v4 + v3));
  [(_UIKeyboardInputModeIconConfiguration *)self size];
  double v7 = (double)(3 * (unint64_t)(v6 + v5));
  [(_UIKeyboardInputModeIconConfiguration *)self scaleFactor];
  return (unint64_t)(v8 + v7);
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendSize:withName:", @"size", self->_size.width, self->_size.height);
  id v5 = (id)[v3 appendInteger:self->_weight withName:@"fontWeight"];
  id v6 = (id)[v3 appendBool:self->_background withName:@"background"];
  id v7 = (id)[v3 appendFloat:@"scale" withName:self->_scaleFactor];
  double v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIKeyboardInputModeIconConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [(_UIKeyboardInputModeIconConfiguration *)v5 size];
      double v7 = v6;
      double v9 = v8;
      [(_UIKeyboardInputModeIconConfiguration *)self size];
      BOOL v12 = v7 == v11 && v9 == v10;
      if (v12
        && (uint64_t v13 = [(_UIKeyboardInputModeIconConfiguration *)v5 weight],
            v13 == [(_UIKeyboardInputModeIconConfiguration *)self weight])
        && (BOOL v14 = [(_UIKeyboardInputModeIconConfiguration *)v5 background],
            v14 == [(_UIKeyboardInputModeIconConfiguration *)self background]))
      {
        [(_UIKeyboardInputModeIconConfiguration *)v5 scaleFactor];
        double v18 = v17;
        [(_UIKeyboardInputModeIconConfiguration *)self scaleFactor];
        BOOL v15 = v18 == v19;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (BOOL)background
{
  return self->_background;
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

@end