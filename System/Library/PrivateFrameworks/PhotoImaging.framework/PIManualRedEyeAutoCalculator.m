@interface PIManualRedEyeAutoCalculator
- (PIManualRedEyeAutoCalculator)initWithComposition:(id)a3 location:(CGPoint)a4 touchDiameter:(double)a5;
- (id)_options;
- (void)_configureRequest:(id)a3;
@end

@implementation PIManualRedEyeAutoCalculator

- (void)_configureRequest:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PIManualRedEyeAutoCalculator;
  [(PIRedEyeAutoCalculator *)&v6 _configureRequest:v4];
  v5 = [MEMORY[0x1E4F7A478] oneToOneScalePolicy];
  [v4 setScalePolicy:v5];
}

- (id)_options
{
  v12[3] = *MEMORY[0x1E4F143B8];
  p_location = &self->_location;
  if (*MEMORY[0x1E4F1DAD8] == self->_location.x && *(double *)(MEMORY[0x1E4F1DAD8] + 8) == self->_location.y)
  {
    v10.receiver = self;
    v10.super_class = (Class)PIManualRedEyeAutoCalculator;
    v8 = [(PIRedEyeAutoCalculator *)&v10 _options];
  }
  else
  {
    v11[0] = @"locationX";
    v5 = objc_msgSend(NSNumber, "numberWithDouble:");
    v12[0] = v5;
    v11[1] = @"locationY";
    objc_super v6 = [NSNumber numberWithDouble:p_location->y];
    v12[1] = v6;
    v11[2] = @"touchDiameter";
    v7 = [NSNumber numberWithDouble:self->_touchDiameter];
    v12[2] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  }
  return v8;
}

- (PIManualRedEyeAutoCalculator)initWithComposition:(id)a3 location:(CGPoint)a4 touchDiameter:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PIManualRedEyeAutoCalculator;
  objc_super v10 = [(NURenderRequest *)&v12 initWithComposition:v9];
  v10->_location.CGFloat x = x;
  v10->_location.CGFloat y = y;
  v10->_touchDiameter = a5;
  [(PIRedEyeAutoCalculator *)v10 setForce:1];

  return v10;
}

@end