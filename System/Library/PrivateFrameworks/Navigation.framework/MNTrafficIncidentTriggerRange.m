@interface MNTrafficIncidentTriggerRange
+ (BOOL)supportsSecureCoding;
- (MNTrafficIncidentTriggerPoint)hideTriggerPoint;
- (MNTrafficIncidentTriggerPoint)showTriggerPoint;
- (MNTrafficIncidentTriggerRange)initWithCoder:(id)a3;
- (MNTrafficIncidentTriggerRange)initWithTriggerPointShow:(id)a3 hide:(id)a4 displayTime:(double)a5;
- (double)displayTime;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNTrafficIncidentTriggerRange

- (MNTrafficIncidentTriggerRange)initWithTriggerPointShow:(id)a3 hide:(id)a4 displayTime:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MNTrafficIncidentTriggerRange;
  v11 = [(MNTrafficIncidentTriggerRange *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_showTriggerPoint, a3);
    objc_storeStrong((id *)&v12->_hideTriggerPoint, a4);
    double v13 = 1.79769313e308;
    if (a5 > 0.0) {
      double v13 = a5;
    }
    v12->_displayTime = v13;
    v14 = v12;
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{ displayTime %lf, | showTriggerPoint: %@ | hideTriggerPoint: [%@] }", *(void *)&self->_displayTime, self->_showTriggerPoint, self->_hideTriggerPoint];
}

- (MNTrafficIncidentTriggerRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MNTrafficIncidentTriggerRange;
  v5 = [(MNTrafficIncidentTriggerRange *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_showTriggerPoint"];
    showTriggerPoint = v5->_showTriggerPoint;
    v5->_showTriggerPoint = (MNTrafficIncidentTriggerPoint *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hideTriggerPoint"];
    hideTriggerPoint = v5->_hideTriggerPoint;
    v5->_hideTriggerPoint = (MNTrafficIncidentTriggerPoint *)v8;

    [v4 decodeDoubleForKey:@"_displayTime"];
    v5->_displayTime = v10;
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  showTriggerPoint = self->_showTriggerPoint;
  id v5 = a3;
  [v5 encodeObject:showTriggerPoint forKey:@"_showTriggerPoint"];
  [v5 encodeObject:self->_hideTriggerPoint forKey:@"_hideTriggerPoint"];
  [v5 encodeDouble:@"_displayTime" forKey:self->_displayTime];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTrafficIncidentTriggerPoint)showTriggerPoint
{
  return self->_showTriggerPoint;
}

- (MNTrafficIncidentTriggerPoint)hideTriggerPoint
{
  return self->_hideTriggerPoint;
}

- (double)displayTime
{
  return self->_displayTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideTriggerPoint, 0);
  objc_storeStrong((id *)&self->_showTriggerPoint, 0);
}

@end