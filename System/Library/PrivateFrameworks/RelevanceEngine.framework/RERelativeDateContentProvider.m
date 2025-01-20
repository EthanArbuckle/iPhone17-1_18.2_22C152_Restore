@interface RERelativeDateContentProvider
+ (id)relativeDateContentProviderWithDate:(id)a3 style:(int64_t)a4 units:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (RERelativeDateContentProvider)initWithCoder:(id)a3;
- (RERelativeDateContentProvider)initWithDate:(id)a3 style:(int64_t)a4 units:(unint64_t)a5;
- (id)attributedStringRepresentation;
- (id)clockKitTextProviderRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (unint64_t)hash;
- (unint64_t)units;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RERelativeDateContentProvider

+ (id)relativeDateContentProviderWithDate:(id)a3 style:(int64_t)a4 units:(unint64_t)a5
{
  id v7 = a3;
  v8 = [[RERelativeDateContentProvider alloc] initWithDate:v7 style:a4 units:a5];

  return v8;
}

- (RERelativeDateContentProvider)initWithDate:(id)a3 style:(int64_t)a4 units:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RERelativeDateContentProvider;
  v9 = [(RERelativeDateContentProvider *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    date = v9->_date;
    v9->_date = (NSDate *)v10;

    v9->_style = a4;
    v9->_units = a5;
  }

  return v9;
}

- (id)attributedStringRepresentation
{
  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  v4 = NSNumber;
  [(NSDate *)self->_date timeIntervalSinceNow];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = [v5 stringValue];
  id v7 = (void *)[v3 initWithString:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  date = self->_date;
  int64_t style = self->_style;
  unint64_t units = self->_units;
  return (id)[v4 initWithDate:date style:style units:units];
}

- (unint64_t)hash
{
  return self->_style ^ self->_units ^ [(NSDate *)self->_date hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 units] == self->_units && objc_msgSend(v5, "style") == self->_style)
    {
      v6 = [v5 date];
      id v7 = v6;
      if (v6 == self->_date) {
        char v8 = 1;
      }
      else {
        char v8 = -[NSDate isEqual:](v6, "isEqual:");
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)clockKitTextProviderRepresentation
{
  if ((unint64_t)(self->_style - 1) >= 3) {
    int64_t style = 0;
  }
  else {
    int64_t style = self->_style;
  }
  id CLKRelativeDateTextProviderClass = getCLKRelativeDateTextProviderClass();
  date = self->_date;
  unint64_t units = self->_units;
  return (id)[CLKRelativeDateTextProviderClass textProviderWithDate:date style:style units:units];
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_units];
  [v5 encodeObject:v6 forKey:@"units"];

  id v7 = [NSNumber numberWithInteger:self->_style];
  [v5 encodeObject:v7 forKey:@"style"];
}

- (RERelativeDateContentProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"units"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"style"];

  uint64_t v9 = [v8 unsignedIntegerValue];
  uint64_t v10 = [(RERelativeDateContentProvider *)self initWithDate:v5 style:v9 units:v7];

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)style
{
  return self->_style;
}

- (unint64_t)units
{
  return self->_units;
}

- (void).cxx_destruct
{
}

@end