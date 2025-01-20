@interface REDateContentProvider
+ (id)dateContentProviderWithDate:(id)a3 units:(unint64_t)a4 timeZone:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSTimeZone)timeZone;
- (REDateContentProvider)initWithCoder:(id)a3;
- (REDateContentProvider)initWithDate:(id)a3 units:(unint64_t)a4 timeZone:(id)a5;
- (id)attributedStringRepresentation;
- (id)clockKitTextProviderRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)units;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REDateContentProvider

+ (id)dateContentProviderWithDate:(id)a3 units:(unint64_t)a4 timeZone:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithDate:v9 units:a4 timeZone:v8];

  return v10;
}

- (REDateContentProvider)initWithDate:(id)a3 units:(unint64_t)a4 timeZone:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)REDateContentProvider;
  v10 = [(REDateContentProvider *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    date = v10->_date;
    v10->_date = (NSDate *)v11;

    v10->_units = a4;
    uint64_t v13 = [v9 copy];
    timeZone = v10->_timeZone;
    v10->_timeZone = (NSTimeZone *)v13;
  }
  return v10;
}

- (id)attributedStringRepresentation
{
  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  v4 = NSNumber;
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = [v5 stringValue];
  v7 = (void *)[v3 initWithString:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  date = self->_date;
  unint64_t units = self->_units;
  timeZone = self->_timeZone;
  return (id)[v4 initWithDate:date units:units timeZone:timeZone];
}

- (unint64_t)hash
{
  unint64_t v3 = self->_units ^ [(NSDate *)self->_date hash];
  return v3 ^ [(NSTimeZone *)self->_timeZone hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 units] != self->_units)
    {
      char v10 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v6 = [v5 date];
    v7 = self->_date;
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
LABEL_13:

        goto LABEL_14;
      }
    }
    uint64_t v11 = [v5 timeZone];
    v12 = v11;
    if (v11 == self->_timeZone) {
      char v10 = 1;
    }
    else {
      char v10 = -[NSTimeZone isEqual:](v11, "isEqual:");
    }

    goto LABEL_13;
  }
  char v10 = 0;
LABEL_15:

  return v10;
}

- (id)clockKitTextProviderRepresentation
{
  id CLKDateTextProviderClass = getCLKDateTextProviderClass();
  date = self->_date;
  unint64_t units = self->_units;
  timeZone = self->_timeZone;
  return (id)[CLKDateTextProviderClass textProviderWithDate:date units:units timeZone:timeZone];
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v6 = a3;
  [v6 encodeObject:date forKey:@"date"];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_units];
  [v6 encodeObject:v5 forKey:@"units"];

  [v6 encodeObject:self->_timeZone forKey:@"timeZone"];
}

- (REDateContentProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"units"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];

  int v9 = [(REDateContentProvider *)self initWithDate:v5 units:v7 timeZone:v8];
  return v9;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)units
{
  return self->_units;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end