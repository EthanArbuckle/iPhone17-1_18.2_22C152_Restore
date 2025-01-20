@interface BAExtensionRuntime
+ (BOOL)supportsSecureCoding;
- (BAExtensionRuntime)init;
- (BAExtensionRuntime)initWithCoder:(id)a3;
- (BAExtensionRuntime)initWithStartDate:(id)a3;
- (BOOL)isMoreThan24HoursAgo;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)elapsedTime;
- (void)encodeWithCoder:(id)a3;
- (void)extensionExited;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation BAExtensionRuntime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAExtensionRuntime)init
{
  v3 = +[NSDate date];
  v4 = [(BAExtensionRuntime *)self initWithStartDate:v3];

  return v4;
}

- (BAExtensionRuntime)initWithStartDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BAExtensionRuntime;
  v5 = [(BAExtensionRuntime *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BAExtensionRuntime *)v5 setStartDate:v4];
  }

  return v6;
}

- (BAExtensionRuntime)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAExtensionRuntime;
    self = [(BAExtensionRuntime *)&v9 init];
    if (!self) {
      goto LABEL_5;
    }
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    [(BAExtensionRuntime *)self setStartDate:v5];

    v6 = [(BAExtensionRuntime *)self startDate];

    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
      [(BAExtensionRuntime *)self setEndDate:v7];

      v6 = [(BAExtensionRuntime *)self endDate];

      if (v6)
      {
LABEL_5:
        self = self;
        v6 = self;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(BAExtensionRuntime *)self startDate];
    [v7 encodeObject:v4 forKey:@"startDate"];

    v5 = [(BAExtensionRuntime *)self endDate];

    if (v5) {
      [(BAExtensionRuntime *)self endDate];
    }
    else {
    v6 = +[NSDate date];
    }
    [v7 encodeObject:v6 forKey:@"endDate"];
  }
}

- (double)elapsedTime
{
  v3 = [(BAExtensionRuntime *)self endDate];

  if (v3) {
    [(BAExtensionRuntime *)self endDate];
  }
  else {
  id v4 = +[NSDate date];
  }
  v5 = [(BAExtensionRuntime *)self startDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (void)extensionExited
{
  id v3 = +[NSDate date];
  [(BAExtensionRuntime *)self setEndDate:v3];
}

- (BOOL)isMoreThan24HoursAgo
{
  id v3 = [(BAExtensionRuntime *)self endDate];
  if (v3) {
    [(BAExtensionRuntime *)self endDate];
  }
  else {
  id v4 = +[NSDate date];
  }

  [v4 timeIntervalSinceNow];
  BOOL v6 = v5 < -86400.0;

  return v6;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end