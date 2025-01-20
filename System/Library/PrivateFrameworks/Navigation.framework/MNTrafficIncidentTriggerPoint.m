@interface MNTrafficIncidentTriggerPoint
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)referenceCoordinate;
- (BOOL)allowsShifting;
- (BOOL)shouldActivateForLocation:(id)a3;
- (MNTrafficIncidentTriggerPoint)initWithCoder:(id)a3;
- (MNTrafficIncidentTriggerPoint)initWithReferenceCoordinate:(id)a3 allowsShifting:(BOOL)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setReferenceCoordinate:(id)a3;
@end

@implementation MNTrafficIncidentTriggerPoint

- (MNTrafficIncidentTriggerPoint)initWithReferenceCoordinate:(id)a3 allowsShifting:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MNTrafficIncidentTriggerPoint;
  v6 = [(MNTrafficIncidentTriggerPoint *)&v10 init];
  v7 = (MNTrafficIncidentTriggerPoint *)v6;
  if (v6)
  {
    *($212C09783140BCCD23384160D545CE0D *)(v6 + 12) = a3;
    v6[8] = a4;
    v8 = v6;
  }

  return v7;
}

- (void)setReferenceCoordinate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_allowsShifting) {
    goto LABEL_2;
  }
  v5 = [NSString stringWithFormat:@"Attemped to change referenceCoordinate of MNTrafficIncidentTriggerPoint when shifting is now allowed. Ignoring change."];
  v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136316162;
    v8 = "-[MNTrafficIncidentTriggerPoint setReferenceCoordinate:]";
    __int16 v9 = 2080;
    objc_super v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNTrafficIncidentTriggerPoint.m";
    __int16 v11 = 1024;
    int v12 = 34;
    __int16 v13 = 2080;
    v14 = "_allowsShifting";
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v7, 0x30u);
  }

  if (self->_allowsShifting) {
LABEL_2:
  }
    self->_referenceCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (BOOL)shouldActivateForLocation:(id)a3
{
  v4 = [a3 routeMatch];
  [v4 routeCoordinate];

  [(MNTrafficIncidentTriggerPoint *)self referenceCoordinate];
  return GEOPolylineCoordinateIsABeforeOrEqualToB();
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = GEOPolylineCoordinateAsShortString();
  v5 = (void *)v4;
  if (self->_allowsShifting) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  int v7 = [v3 stringWithFormat:@"coordinate: [%@] | allowsShifting: %@", v4, v6];

  return v7;
}

- (MNTrafficIncidentTriggerPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNTrafficIncidentTriggerPoint;
  v5 = [(MNTrafficIncidentTriggerPoint *)&v12 init];
  if (v5)
  {
    unint64_t v11 = 0;
    id v6 = v4;
    int v7 = (const void *)[v6 decodeBytesForKey:@"_referenceCoordinate" returnedLength:&v11];
    if (v11 && v7)
    {
      if (v11 >= 8) {
        size_t v8 = 8;
      }
      else {
        size_t v8 = v11;
      }
      memcpy(&v5->_referenceCoordinate, v7, v8);
    }
    v5->_allowsShifting = [v6 decodeBoolForKey:@"_allowsShifting"];
    __int16 v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  p_referenceCoordinate = &self->_referenceCoordinate;
  id v5 = a3;
  [v5 encodeBytes:p_referenceCoordinate length:8 forKey:@"_referenceCoordinate"];
  [v5 encodeBool:self->_allowsShifting forKey:@"_allowsShifting"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- ($212C09783140BCCD23384160D545CE0D)referenceCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_referenceCoordinate;
}

- (BOOL)allowsShifting
{
  return self->_allowsShifting;
}

@end