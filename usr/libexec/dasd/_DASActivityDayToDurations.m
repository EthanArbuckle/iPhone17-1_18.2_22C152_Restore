@interface _DASActivityDayToDurations
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSDictionary)activityDurations;
- (_DASActivityDayToDurations)initWithCoder:(id)a3;
- (_DASActivityDayToDurations)initWithDate:(id)a3 activityDurations:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityDurations:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation _DASActivityDayToDurations

- (id)description
{
  v3 = [(_DASActivityDayToDurations *)self date];
  v4 = [(_DASActivityDayToDurations *)self activityDurations];
  v5 = +[NSString stringWithFormat:@"Date: %@, Activity Durations %@", v3, v4];

  return v5;
}

- (_DASActivityDayToDurations)initWithDate:(id)a3 activityDurations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DASActivityDayToDurations;
  v9 = [(_DASActivityDayToDurations *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    objc_storeStrong((id *)&v10->_activityDurations, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(_DASActivityDayToDurations *)self date];
  v6 = [(_DASActivityDayToDurations *)self activityDurations];
  id v7 = [v4 initWithDate:v5 activityDurations:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_activityDurations forKey:@"activityDurations"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASActivityDayToDurations)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"activityDurations"];

  v10 = 0;
  if (v5) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    v10 = (_DASActivityDayToDurations *)[objc_alloc((Class)objc_opt_class()) initWithDate:v5 activityDurations:v9];
  }

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDictionary)activityDurations
{
  return self->_activityDurations;
}

- (void)setActivityDurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDurations, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end