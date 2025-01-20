@interface VKPointAnimatableProperty
- (CGPoint)presentationValue;
- (CGPoint)value;
- (UIViewFloatAnimatableProperty)x;
- (UIViewFloatAnimatableProperty)y;
- (VKPointAnimatableProperty)init;
- (void)setValue:(CGPoint)a3;
@end

@implementation VKPointAnimatableProperty

- (VKPointAnimatableProperty)init
{
  v8.receiver = self;
  v8.super_class = (Class)VKPointAnimatableProperty;
  v2 = [(VKPointAnimatableProperty *)&v8 init];
  if (v2)
  {
    v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
    x = v2->_x;
    v2->_x = v3;

    v5 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
    y = v2->_y;
    v2->_y = v5;
  }
  return v2;
}

- (void)setValue:(CGPoint)a3
{
  double y = a3.y;
  [(UIViewFloatAnimatableProperty *)self->_x setValue:a3.x];
  v5 = self->_y;
  [(UIViewFloatAnimatableProperty *)v5 setValue:y];
}

- (CGPoint)value
{
  [(UIViewFloatAnimatableProperty *)self->_x value];
  double v4 = v3;
  [(UIViewFloatAnimatableProperty *)self->_y value];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.x = v7;
  return result;
}

- (CGPoint)presentationValue
{
  [(UIViewFloatAnimatableProperty *)self->_x presentationValue];
  double v4 = v3;
  [(UIViewFloatAnimatableProperty *)self->_y presentationValue];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.x = v7;
  return result;
}

- (UIViewFloatAnimatableProperty)x
{
  return self->_x;
}

- (UIViewFloatAnimatableProperty)y
{
  return self->_y;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_y, 0);
  objc_storeStrong((id *)&self->_x, 0);
}

@end