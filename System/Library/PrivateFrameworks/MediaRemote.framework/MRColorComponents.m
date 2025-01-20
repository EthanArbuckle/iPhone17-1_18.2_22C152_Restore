@interface MRColorComponents
- (BOOL)isEqual:(id)a3;
- (MRColorComponents)initWithProtobuf:(id)a3;
- (_MRColorProtobuf)protobuf;
- (float)alpha;
- (float)blue;
- (float)green;
- (float)red;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAlpha:(float)a3;
- (void)setBlue:(float)a3;
- (void)setGreen:(float)a3;
- (void)setRed:(float)a3;
@end

@implementation MRColorComponents

- (MRColorComponents)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MRColorComponents;
    v5 = [(MRColorComponents *)&v12 init];
    if (v5)
    {
      [v4 red];
      v5->_red = v6;
      [v4 green];
      v5->_green = v7;
      [v4 blue];
      v5->_blue = v8;
      [v4 alpha];
      v5->_alpha = v9;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_MRColorProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRColorProtobuf);
  [(MRColorComponents *)self red];
  -[_MRColorProtobuf setRed:](v3, "setRed:");
  [(MRColorComponents *)self green];
  -[_MRColorProtobuf setGreen:](v3, "setGreen:");
  [(MRColorComponents *)self blue];
  -[_MRColorProtobuf setBlue:](v3, "setBlue:");
  [(MRColorComponents *)self alpha];
  -[_MRColorProtobuf setAlpha:](v3, "setAlpha:");

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(MRColorComponents *)self red];
  double v6 = v5;
  [(MRColorComponents *)self green];
  double v8 = v7;
  [(MRColorComponents *)self blue];
  double v10 = v9;
  [(MRColorComponents *)self alpha];
  return (id)[v3 stringWithFormat:@"<%@: %p red = %f, green = %f, blue = %f, alpha = %f>", v4, self, *(void *)&v6, *(void *)&v8, *(void *)&v10, v11];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRColorComponents *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v5 = v4;
      [(MRColorComponents *)v5 red];
      float v7 = v6;
      [(MRColorComponents *)self red];
      if (vabds_f32(v7, v8) <= 0.00000011921
        && ([(MRColorComponents *)v5 green],
            float v10 = v9,
            [(MRColorComponents *)self green],
            vabds_f32(v10, v11) <= 0.00000011921)
        && ([(MRColorComponents *)v5 blue],
            float v13 = v12,
            [(MRColorComponents *)self blue],
            vabds_f32(v13, v14) <= 0.00000011921))
      {
        [(MRColorComponents *)v5 alpha];
        float v18 = v17;
        [(MRColorComponents *)self alpha];
        BOOL v15 = vabds_f32(v18, v19) <= 0.00000011921;
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(MRColorComponents *)self red];
  objc_msgSend(v4, "setRed:");
  [(MRColorComponents *)self green];
  objc_msgSend(v4, "setGreen:");
  [(MRColorComponents *)self blue];
  objc_msgSend(v4, "setBlue:");
  [(MRColorComponents *)self alpha];
  objc_msgSend(v4, "setAlpha:");
  return v4;
}

- (float)red
{
  return self->_red;
}

- (void)setRed:(float)a3
{
  self->_red = a3;
}

- (float)green
{
  return self->_green;
}

- (void)setGreen:(float)a3
{
  self->_green = a3;
}

- (float)blue
{
  return self->_blue;
}

- (void)setBlue:(float)a3
{
  self->_blue = a3;
}

- (float)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(float)a3
{
  self->_alpha = a3;
}

@end