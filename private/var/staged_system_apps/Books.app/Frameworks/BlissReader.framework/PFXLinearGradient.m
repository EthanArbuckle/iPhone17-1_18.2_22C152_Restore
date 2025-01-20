@interface PFXLinearGradient
- (void)end;
@end

@implementation PFXLinearGradient

- (void)end
{
  id v3 = +[TSDMutableAngleGradient linearGradientWithGradientStops:self->super.mStops];
  +[PFXStyleUtilities percentageStringToFraction:[(PFXSvgElement *)self valueForAttributeName:"x1"]];
  double v5 = v4;
  +[PFXStyleUtilities percentageStringToFraction:[(PFXSvgElement *)self valueForAttributeName:"y1"]];
  double v7 = v6;
  +[PFXStyleUtilities percentageStringToFraction:[(PFXSvgElement *)self valueForAttributeName:"x2"]];
  double v9 = v8;
  +[PFXStyleUtilities percentageStringToFraction:[(PFXSvgElement *)self valueForAttributeName:"y2"]];
  [v3 setGradientAngle:atan2(v10 - v7, v9 - v5)];

  [(PFXSvgElement *)self cacheDefinition:v3];
}

@end