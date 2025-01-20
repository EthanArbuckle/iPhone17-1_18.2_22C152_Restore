@interface _UISliderTick
+ (id)tickWithPosition:(float)a3 title:(id)a4 image:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (UIImage)image;
- (_UISliderTick)initWithCoder:(id)a3;
- (_UISliderTick)initWithPosition:(float)a3 title:(id)a4 image:(id)a5;
- (float)position;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UISliderTick

+ (id)tickWithPosition:(float)a3 title:(id)a4 image:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc((Class)a1);
  *(float *)&double v11 = a3;
  v12 = (void *)[v10 initWithPosition:v9 title:v8 image:v11];

  return v12;
}

- (_UISliderTick)initWithPosition:(float)a3 title:(id)a4 image:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UISliderTick;
  id v10 = [(_UISliderTick *)&v18 init];
  double v11 = v10;
  if (v10)
  {
    float v12 = fmax(fmin(a3, 1.0), 0.0);
    v10->_position = v12;
    uint64_t v13 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    image = v11->_image;
    v11->_image = (UIImage *)v15;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  float position = self->_position;
  id v6 = a3;
  *(float *)&double v5 = position;
  [v6 encodeFloat:@"position" forKey:v5];
  [v6 encodeObject:self->_title forKey:@"title"];
  [v6 encodeObject:self->_image forKey:@"image"];
}

- (_UISliderTick)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(_UISliderTick *)self init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"position"];
    v5->_float position = v6;
    uint64_t v7 = [v4 decodeObjectForKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"image"];
    image = v5->_image;
    v5->_image = (UIImage *)v9;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)(self->_position * 100.0);
  NSUInteger v4 = [(NSString *)self->_title hash];
  return v4 ^ [(UIImage *)self->_image hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISliderTick;
  if ([(_UISliderTick *)&v9 isEqual:v4])
  {
    double v5 = (id *)v4;
    float v6 = v5;
    if (*((float *)v5 + 2) == self->_position && [v5[2] isEqualToString:self->_title]) {
      char v7 = [v6[3] isEqual:self->_image];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (float)position
{
  return self->_position;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end