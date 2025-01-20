@interface MFDynamicCellOffsetRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MFDynamicCellOffsetRepresentation)initWithCoder:(id)a3;
- (MFDynamicCellOffsetRepresentation)initWithRelativeCellAnchor:(double)a3 relativeDistanceFromTop:(double)a4;
- (NSString)ef_publicDescription;
- (double)relativeCellAnchor;
- (double)relativeDistanceFromTop;
- (void)encodeWithCoder:(id)a3;
- (void)setRelativeCellAnchor:(double)a3;
- (void)setRelativeDistanceFromTop:(double)a3;
@end

@implementation MFDynamicCellOffsetRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFDynamicCellOffsetRepresentation)initWithRelativeCellAnchor:(double)a3 relativeDistanceFromTop:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MFDynamicCellOffsetRepresentation;
  result = [(MFDynamicCellOffsetRepresentation *)&v7 init];
  if (result)
  {
    result->_relativeCellAnchor = a3;
    result->_relativeDistanceFromTop = a4;
  }
  return result;
}

- (MFDynamicCellOffsetRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFDynamicCellOffsetRepresentation;
  v5 = [(MFDynamicCellOffsetRepresentation *)&v13 init];
  if (v5)
  {
    v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    objc_super v7 = [v4 decodeObjectOfClasses:v6 forKey:@"EFPropertyKey_relativeCellAnchor"];
    [v7 floatValue];
    v5->_relativeCellAnchor = v8;

    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"EFPropertyKey_relativeDistanceFromTop"];
    [v10 floatValue];
    v5->_relativeDistanceFromTop = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [(MFDynamicCellOffsetRepresentation *)self relativeCellAnchor];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_relativeCellAnchor"];

  [(MFDynamicCellOffsetRepresentation *)self relativeDistanceFromTop];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_relativeDistanceFromTop"];
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = objc_opt_class();
  [(MFDynamicCellOffsetRepresentation *)self relativeCellAnchor];
  double v5 = v4 * 100.0;
  [(MFDynamicCellOffsetRepresentation *)self relativeDistanceFromTop];
  return +[NSString stringWithFormat:@"<%@:%p cellAnchor=%.02f%% distanceFromTop=%.02f%%>", v3, self, *(void *)&v5, v6 * 100.0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(MFDynamicCellOffsetRepresentation *)self relativeCellAnchor];
    double v7 = v6;
    [v5 relativeCellAnchor];
    if (v7 == v8)
    {
      [(MFDynamicCellOffsetRepresentation *)self relativeDistanceFromTop];
      double v10 = v9;
      [v5 relativeDistanceFromTop];
      BOOL v12 = v10 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (double)relativeCellAnchor
{
  return self->_relativeCellAnchor;
}

- (void)setRelativeCellAnchor:(double)a3
{
  self->_relativeCellAnchor = a3;
}

- (double)relativeDistanceFromTop
{
  return self->_relativeDistanceFromTop;
}

- (void)setRelativeDistanceFromTop:(double)a3
{
  self->_relativeDistanceFromTop = a3;
}

@end