@interface PFXRadialGradient
- (void)end;
@end

@implementation PFXRadialGradient

- (void)end
{
  id v3 = +[TSDMutableTransformGradient radialGradientWithGradientStops:self->super.mStops];
  +[PFXStyleUtilities percentageStringToFraction:[(PFXSvgElement *)self valueForAttributeName:"fx"]];
  double v5 = v4;
  +[PFXStyleUtilities percentageStringToFraction:[(PFXSvgElement *)self valueForAttributeName:"fy"]];
  double v7 = v6;
  +[PFXStyleUtilities percentageStringToFraction:[(PFXSvgElement *)self valueForAttributeName:"r"]];
  double v9 = v8;
  id v10 = [(PFXSvgElement *)self valueForAttributeName:"baseNaturalSize"];
  double v13 = 0.0;
  double v14 = 0.0;
  if ([v10 length])
  {
    sscanf((const char *)[v10 UTF8String], "%lfpt,%lfpt", &v14, &v13);
    double v12 = v13;
    double v11 = v14;
  }
  else
  {
    double v12 = 0.0;
    double v11 = 0.0;
  }
  [v3 setStartPoint:v5 * v11, v7 * v12];
  [v3 setEndPoint:((v5 + v9 * 0.707106781) * v14, (v7 + v9 * 0.707106781) * v13)];
  [v3 setBaseNaturalSize:v14, v13];
  [(PFXSvgElement *)self cacheDefinition:v3];
}

@end