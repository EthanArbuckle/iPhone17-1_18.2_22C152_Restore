@interface _UIFluidSliderInteractionConfiguration
+ (id)configurationWithTrackSize:(CGSize)a3;
- (CGSize)trackSize;
- (NSArray)_customDrivers;
- (_UIFluidSliderInteractionConfiguration)init;
- (double)stretchAmount;
- (double)velocityMultiplier;
- (id)copyWithTrackSize:(CGSize)a3;
- (id)copyWithVelocityMultiplier:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)preferredInputMethods;
- (unint64_t)stepCount;
- (void)_setCustomDrivers:(id)a3;
- (void)setPreferredInputMethods:(unint64_t)a3;
- (void)setStepCount:(unint64_t)a3;
- (void)setStretchAmount:(double)a3;
- (void)setVelocityMultiplier:(double)a3;
@end

@implementation _UIFluidSliderInteractionConfiguration

+ (id)configurationWithTrackSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = (CGFloat *)objc_opt_new();
  v5[6] = width;
  v5[7] = height;
  return v5;
}

- (_UIFluidSliderInteractionConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFluidSliderInteractionConfiguration;
  v2 = [(_UIFluidSliderInteractionConfiguration *)&v6 init];
  if (v2)
  {
    v3 = +[_UIFluidSliderSettingsDomain rootSettings];
    [(_UIFluidSliderInteractionConfiguration *)v2 setPreferredInputMethods:3];
    [v3 defaultStretchAmount];
    -[_UIFluidSliderInteractionConfiguration setStretchAmount:](v2, "setStretchAmount:");
    [(_UIFluidSliderInteractionConfiguration *)v2 setVelocityMultiplier:1.0];
    [v3 sliderStepCount];
    [(_UIFluidSliderInteractionConfiguration *)v2 setStepCount:(unint64_t)v4];
  }
  return v2;
}

- (id)copyWithTrackSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id result = (id)[(_UIFluidSliderInteractionConfiguration *)self copy];
  *((CGFloat *)result + 6) = width;
  *((CGFloat *)result + 7) = height;
  return result;
}

- (id)copyWithVelocityMultiplier:(double)a3
{
  id result = (id)[(_UIFluidSliderInteractionConfiguration *)self copy];
  *((double *)result + 3) = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(_UIFluidSliderInteractionConfiguration *)self trackSize];
  v4[6] = v5;
  v4[7] = v6;
  [(_UIFluidSliderInteractionConfiguration *)self stretchAmount];
  objc_msgSend(v4, "setStretchAmount:");
  [(_UIFluidSliderInteractionConfiguration *)self velocityMultiplier];
  objc_msgSend(v4, "setVelocityMultiplier:");
  objc_msgSend(v4, "setStepCount:", -[_UIFluidSliderInteractionConfiguration stepCount](self, "stepCount"));
  objc_msgSend(v4, "setPreferredInputMethods:", -[_UIFluidSliderInteractionConfiguration preferredInputMethods](self, "preferredInputMethods"));
  uint64_t v7 = [(_UIFluidSliderInteractionConfiguration *)self _customDrivers];
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (void)_setCustomDrivers:(id)a3
{
  id v5 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0 && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIFluidSliderInteraction.m" lineNumber:84 description:@"This SPI may only be used by approved clients."];
  }
  customDrivers = self->_customDrivers;
  v14 = (NSArray *)v5;
  uint64_t v7 = customDrivers;
  if (v7 == v14)
  {

    v11 = v14;
LABEL_12:

    v10 = v14;
    goto LABEL_13;
  }
  v8 = v7;
  if (!v14 || !v7)
  {

    v10 = v14;
    goto LABEL_11;
  }
  char v9 = [(NSArray *)v14 isEqual:v7];

  v10 = v14;
  if ((v9 & 1) == 0)
  {
LABEL_11:
    v12 = v10;
    v11 = self->_customDrivers;
    self->_customDrivers = v12;
    goto LABEL_12;
  }
LABEL_13:
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  [(_UIFluidSliderInteractionConfiguration *)self trackSize];
  uint64_t v5 = v4;
  [(_UIFluidSliderInteractionConfiguration *)self trackSize];
  [v3 appendFormat:@"; trackSize = (%g, %g)", v5, v6];
  [(_UIFluidSliderInteractionConfiguration *)self stretchAmount];
  objc_msgSend(v3, "appendFormat:", @"; stretchAmount = %g", v7);
  [(_UIFluidSliderInteractionConfiguration *)self velocityMultiplier];
  objc_msgSend(v3, "appendFormat:", @"; velocityMultiplier = %g", v8);
  objc_msgSend(v3, "appendFormat:", @"; stepCount = %lu",
    [(_UIFluidSliderInteractionConfiguration *)self stepCount]);
  char v9 = [(_UIFluidSliderInteractionConfiguration *)self preferredInputMethods];
  v10 = objc_opt_new();
  v11 = v10;
  if (v9) {
    [v10 addObject:@"touch"];
  }
  if ((v9 & 2) != 0) {
    [v11 addObject:@"volumeButtons"];
  }
  v12 = [v11 componentsJoinedByString:@", "];
  [v3 appendFormat:@"; inputMethods = (%@)", v12];

  v13 = [(_UIFluidSliderInteractionConfiguration *)self _customDrivers];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v16 = [(_UIFluidSliderInteractionConfiguration *)self _customDrivers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) name];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }

    v22 = [v15 componentsJoinedByString:@", "];
    [v3 appendFormat:@"; customDrivers = (%@)", v22];
  }
  [v3 appendString:@">"];

  return v3;
}

- (NSArray)_customDrivers
{
  return self->_customDrivers;
}

- (CGSize)trackSize
{
  double width = self->_trackSize.width;
  double height = self->_trackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)stretchAmount
{
  return self->_stretchAmount;
}

- (void)setStretchAmount:(double)a3
{
  self->_stretchAmount = a3;
}

- (double)velocityMultiplier
{
  return self->_velocityMultiplier;
}

- (void)setVelocityMultiplier:(double)a3
{
  self->_velocityMultiplier = a3;
}

- (unint64_t)stepCount
{
  return self->_stepCount;
}

- (void)setStepCount:(unint64_t)a3
{
  self->_stepCount = a3;
}

- (unint64_t)preferredInputMethods
{
  return self->_preferredInputMethods;
}

- (void)setPreferredInputMethods:(unint64_t)a3
{
  self->_preferredInputMethods = a3;
}

- (void).cxx_destruct
{
}

@end