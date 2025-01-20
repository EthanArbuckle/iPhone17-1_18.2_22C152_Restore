@interface TVRUICubicSpringTimingParameters
+ (id)standardTimingParameters;
- (UICubicTimingParameters)springCubicTimingParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cubicTimingParameters;
- (void)setSpringCubicTimingParameters:(id)a3;
@end

@implementation TVRUICubicSpringTimingParameters

+ (id)standardTimingParameters
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F82640]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
  v3 = -[TVRUICubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([TVRUICubicSpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 3.0, 500.0, 1000.0, 0.0, 0.0);
  [(TVRUICubicSpringTimingParameters *)v3 setSpringCubicTimingParameters:v2];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TVRUICubicSpringTimingParameters;
  id v4 = [(TVRUICubicSpringTimingParameters *)&v7 copyWithZone:a3];
  v5 = [(TVRUICubicSpringTimingParameters *)self springCubicTimingParameters];
  [v4 setSpringCubicTimingParameters:v5];

  return v4;
}

- (id)cubicTimingParameters
{
  return self->_springCubicTimingParameters;
}

- (UICubicTimingParameters)springCubicTimingParameters
{
  return self->_springCubicTimingParameters;
}

- (void)setSpringCubicTimingParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end