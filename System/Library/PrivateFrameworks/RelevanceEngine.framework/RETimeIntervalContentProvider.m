@interface RETimeIntervalContentProvider
+ (id)timeIntervalContentProviderWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSTimeZone)timeZone;
- (RETimeIntervalContentProvider)initWithCoder:(id)a3;
- (RETimeIntervalContentProvider)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5;
- (id)attributedStringRepresentation;
- (id)clockKitTextProviderRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RETimeIntervalContentProvider

+ (id)timeIntervalContentProviderWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithStartDate:v10 endDate:v9 timeZone:v8];

  return v11;
}

- (RETimeIntervalContentProvider)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RETimeIntervalContentProvider;
  v11 = [(RETimeIntervalContentProvider *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    uint64_t v14 = [v9 copy];
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    timeZone = v11->_timeZone;
    v11->_timeZone = (NSTimeZone *)v16;
  }
  return v11;
}

- (id)attributedStringRepresentation
{
  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  v4 = NSString;
  v5 = NSNumber;
  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = NSNumber;
  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  id v9 = [v4 stringWithFormat:@"%@-%@", v6, v8];
  id v10 = (void *)[v3 initWithString:v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  startDate = self->_startDate;
  endDate = self->_endDate;
  timeZone = self->_timeZone;
  return (id)[v4 initWithStartDate:startDate endDate:endDate timeZone:timeZone];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  uint64_t v4 = [(NSDate *)self->_endDate hash] ^ v3;
  return v4 ^ [(NSTimeZone *)self->_timeZone hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 startDate];
    v7 = self->_startDate;
    if (v6 == v7)
    {
    }
    else
    {
      id v8 = v7;
      int v9 = [(NSDate *)v6 isEqual:v7];

      if (!v9)
      {
        char v10 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    v11 = [v5 endDate];
    uint64_t v12 = self->_endDate;
    if (v11 == v12)
    {
    }
    else
    {
      v13 = v12;
      int v14 = [(NSDate *)v11 isEqual:v12];

      if (!v14)
      {
        char v10 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v15 = [v5 timeZone];
    uint64_t v16 = v15;
    if (v15 == self->_timeZone) {
      char v10 = 1;
    }
    else {
      char v10 = -[NSTimeZone isEqual:](v15, "isEqual:");
    }

    goto LABEL_15;
  }
  char v10 = 0;
LABEL_17:

  return v10;
}

- (id)clockKitTextProviderRepresentation
{
  id CLKTimeIntervalTextProviderClass = getCLKTimeIntervalTextProviderClass();
  startDate = self->_startDate;
  endDate = self->_endDate;
  timeZone = self->_timeZone;
  return (id)[CLKTimeIntervalTextProviderClass textProviderWithStartDate:startDate endDate:endDate timeZone:timeZone];
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
}

- (RETimeIntervalContentProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];

  id v8 = [(RETimeIntervalContentProvider *)self initWithStartDate:v5 endDate:v6 timeZone:v7];
  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end