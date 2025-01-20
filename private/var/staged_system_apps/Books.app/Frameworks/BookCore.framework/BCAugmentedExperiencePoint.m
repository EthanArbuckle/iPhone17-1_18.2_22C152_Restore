@interface BCAugmentedExperiencePoint
- (BCBookPosition)experiencePoint;
- (BCBookSection)validRange;
- (float)confidence;
- (id)description;
- (void)setConfidence:(float)a3;
- (void)setExperiencePoint:(id)a3;
- (void)setValidRange:(id)a3;
@end

@implementation BCAugmentedExperiencePoint

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"BCAugmentedExperiencePoint\n"];
  v4 = [(BCAugmentedExperiencePoint *)self experiencePoint];
  [v3 appendFormat:@"        experiencePoint . . . : %@\n", v4];

  v5 = [(BCAugmentedExperiencePoint *)self validRange];
  [v3 appendFormat:@"        validRange  . . . . . : %@", v5];

  return v3;
}

- (BCBookPosition)experiencePoint
{
  return self->_experiencePoint;
}

- (void)setExperiencePoint:(id)a3
{
}

- (BCBookSection)validRange
{
  return self->_validRange;
}

- (void)setValidRange:(id)a3
{
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRange, 0);

  objc_storeStrong((id *)&self->_experiencePoint, 0);
}

@end