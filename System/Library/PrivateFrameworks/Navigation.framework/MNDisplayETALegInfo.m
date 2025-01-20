@interface MNDisplayETALegInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MNDisplayETALegInfo)initWithCoder:(id)a3;
- (NSDate)eta;
- (NSTimeZone)timeZone;
- (NSUUID)waypointID;
- (id)description;
- (unint64_t)legIndex;
- (unint64_t)remainingMinutes;
- (void)encodeWithCoder:(id)a3;
- (void)setEta:(id)a3;
- (void)setLegIndex:(unint64_t)a3;
- (void)setRemainingMinutes:(unint64_t)a3;
- (void)setTimeZone:(id)a3;
- (void)setWaypointID:(id)a3;
@end

@implementation MNDisplayETALegInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNDisplayETALegInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNDisplayETALegInfo;
  v5 = [(MNDisplayETALegInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_waypointID"];
    waypointID = v5->_waypointID;
    v5->_waypointID = (NSUUID *)v6;

    v5->_legIndex = [v4 decodeIntegerForKey:@"_legIndex"];
    v5->_remainingMinutes = [v4 decodeIntegerForKey:@"_remainingMinutes"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eta"];
    eta = v5->_eta;
    v5->_eta = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  waypointID = self->_waypointID;
  id v5 = a3;
  [v5 encodeObject:waypointID forKey:@"_waypointID"];
  [v5 encodeInteger:self->_legIndex forKey:@"_legIndex"];
  [v5 encodeInteger:self->_remainingMinutes forKey:@"_remainingMinutes"];
  [v5 encodeObject:self->_eta forKey:@"_eta"];
  [v5 encodeObject:self->_timeZone forKey:@"_timeZone"];
}

- (id)description
{
  v3 = NSString;
  unint64_t legIndex = self->_legIndex;
  id v5 = +[MNDisplayETAInfo dateFormatter];
  uint64_t v6 = [v5 stringFromDate:self->_eta];
  v7 = [v3 stringWithFormat:@"[%d]: %@ / %d min | %@", legIndex, v6, self->_remainingMinutes, self->_waypointID];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(NSUUID *)self->_waypointID isEqual:v5[1]]
      && self->_legIndex == v5[2]
      && self->_remainingMinutes == v5[3]
      && +[MNDisplayETAInfo isDisplayDate:self->_eta equalTo:v5[4]];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSUUID)waypointID
{
  return self->_waypointID;
}

- (void)setWaypointID:(id)a3
{
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (void)setLegIndex:(unint64_t)a3
{
  self->_unint64_t legIndex = a3;
}

- (unint64_t)remainingMinutes
{
  return self->_remainingMinutes;
}

- (void)setRemainingMinutes:(unint64_t)a3
{
  self->_remainingMinutes = a3;
}

- (NSDate)eta
{
  return self->_eta;
}

- (void)setEta:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_eta, 0);
  objc_storeStrong((id *)&self->_waypointID, 0);
}

@end