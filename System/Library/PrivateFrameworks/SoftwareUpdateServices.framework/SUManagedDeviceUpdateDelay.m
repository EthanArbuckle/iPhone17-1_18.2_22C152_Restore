@interface SUManagedDeviceUpdateDelay
+ (BOOL)supportsSecureCoding;
- (BOOL)isDelayed;
- (NSDate)delayedStartDate;
- (SUManagedDeviceUpdateDelay)initWithCoder:(id)a3;
- (SUManagedDeviceUpdateDelay)initWithDelay:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delayEndDate;
- (id)description;
- (unint64_t)delayPeriod;
- (unint64_t)delayUnit;
- (void)encodeWithCoder:(id)a3;
- (void)setDelayPeriod:(unint64_t)a3;
- (void)setDelayedStartDate:(id)a3;
- (void)setIsDelayed:(BOOL)a3;
@end

@implementation SUManagedDeviceUpdateDelay

- (SUManagedDeviceUpdateDelay)initWithDelay:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUManagedDeviceUpdateDelay;
  v5 = [(SUManagedDeviceUpdateDelay *)&v13 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_isDelayed = [v4 isDelayed];
      v7 = [v4 delayedStartDate];
      uint64_t v8 = [v7 copy];
      delayedStartDate = v6->_delayedStartDate;
      v6->_delayedStartDate = (NSDate *)v8;

      uint64_t v10 = [v4 delayPeriod];
    }
    else
    {
      v5->_isDelayed = 0;
      v11 = v5->_delayedStartDate;
      v5->_delayedStartDate = 0;

      uint64_t v10 = 0;
    }
    v6->_delayPeriod = v10;
  }

  return v6;
}

- (id)delayEndDate
{
  unint64_t v3 = [(SUManagedDeviceUpdateDelay *)self delayUnit];
  unint64_t delayPeriod = self->_delayPeriod;
  if (delayPeriod - 1 > 0x59)
  {
    uint64_t v12 = 30 * v3;
    SULogInfo(@"delay interval is outside 1-90 day range. Defaulting to %d day delay interval", v4, v5, v6, v7, v8, v9, v10, 30);
  }
  else
  {
    uint64_t v12 = [(SUManagedDeviceUpdateDelay *)self delayUnit] * delayPeriod;
  }
  delayedStartDate = self->_delayedStartDate;
  return [(NSDate *)delayedStartDate dateByAddingTimeInterval:(double)(unint64_t)v12];
}

- (id)description
{
  v2 = NSString;
  BOOL isDelayed = self->_isDelayed;
  delayedStartDate = self->_delayedStartDate;
  uint64_t v5 = [(SUManagedDeviceUpdateDelay *)self delayEndDate];
  uint64_t v6 = [v2 stringWithFormat:@"isDelayed:%d delayedStartDate: %@ delayedEndDate: %@", isDelayed, delayedStartDate, v5];

  return v6;
}

- (unint64_t)delayUnit
{
  v2 = +[SUPreferences sharedInstance];
  int v3 = [v2 shouldDelayInMinutes];

  if (v3) {
    return 60;
  }
  else {
    return 86400;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUManagedDeviceUpdateDelay)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUManagedDeviceUpdateDelay;
  uint64_t v5 = [(SUManagedDeviceUpdateDelay *)&v8 init];
  if (v5)
  {
    -[SUManagedDeviceUpdateDelay setIsDelayed:](v5, "setIsDelayed:", [v4 decodeBoolForKey:@"isDelayedKey"]);
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delayedStartDateKey"];
    [(SUManagedDeviceUpdateDelay *)v5 setDelayedStartDate:v6];

    -[SUManagedDeviceUpdateDelay setDelayPeriod:](v5, "setDelayPeriod:", [v4 decodeIntegerForKey:@"delayedPeriod"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[SUManagedDeviceUpdateDelay isDelayed](self, "isDelayed"), @"isDelayedKey");
  id v4 = [(SUManagedDeviceUpdateDelay *)self delayedStartDate];
  [v5 encodeObject:v4 forKey:@"delayedStartDateKey"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[SUManagedDeviceUpdateDelay delayPeriod](self, "delayPeriod"), @"delayedPeriod");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11 = objc_alloc_init(SUManagedDeviceUpdateDelay);
  if (v11)
  {
    [(SUManagedDeviceUpdateDelay *)v11 setIsDelayed:[(SUManagedDeviceUpdateDelay *)self isDelayed]];
    uint64_t v12 = [(SUManagedDeviceUpdateDelay *)self delayedStartDate];
    [(SUManagedDeviceUpdateDelay *)v11 setDelayedStartDate:v12];

    [(SUManagedDeviceUpdateDelay *)v11 setDelayPeriod:[(SUManagedDeviceUpdateDelay *)self delayPeriod]];
    objc_super v13 = v11;
  }
  else
  {
    SULogInfo(@"Failed to create copy of SUManagedDeviceUpdateDelay", v4, v5, v6, v7, v8, v9, v10, v15);
  }

  return v11;
}

- (BOOL)isDelayed
{
  return self->_isDelayed;
}

- (void)setIsDelayed:(BOOL)a3
{
  self->_BOOL isDelayed = a3;
}

- (NSDate)delayedStartDate
{
  return self->_delayedStartDate;
}

- (void)setDelayedStartDate:(id)a3
{
}

- (unint64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(unint64_t)a3
{
  self->_unint64_t delayPeriod = a3;
}

- (void).cxx_destruct
{
}

@end