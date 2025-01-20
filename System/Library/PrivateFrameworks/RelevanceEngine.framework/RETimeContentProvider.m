@interface RETimeContentProvider
+ (id)timeContentProviderWithDate:(id)a3 timeZone:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSTimeZone)timeZone;
- (RETimeContentProvider)initWithCoder:(id)a3;
- (RETimeContentProvider)initWithDate:(id)a3 timeZone:(id)a4;
- (id)attributedStringRepresentation;
- (id)clockKitTextProviderRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RETimeContentProvider

+ (id)timeContentProviderWithDate:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithDate:v7 timeZone:v6];

  return v8;
}

- (RETimeContentProvider)initWithDate:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RETimeContentProvider;
  v8 = [(RETimeContentProvider *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v9;

    uint64_t v11 = [v7 copy];
    timeZone = v8->_timeZone;
    v8->_timeZone = (NSTimeZone *)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  date = self->_date;
  timeZone = self->_timeZone;
  return (id)[v4 initWithDate:date timeZone:timeZone];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_date hash];
  return [(NSTimeZone *)self->_timeZone hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 date];
    id v7 = self->_date;
    if (v6 == v7)
    {
    }
    else
    {
      v8 = v7;
      int v9 = [(NSDate *)v6 isEqual:v7];

      if (!v9)
      {
        char v10 = 0;
LABEL_11:

        goto LABEL_12;
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

    goto LABEL_11;
  }
  char v10 = 0;
LABEL_12:

  return v10;
}

- (id)clockKitTextProviderRepresentation
{
  id CLKTimeTextProviderClass = getCLKTimeTextProviderClass();
  date = self->_date;
  timeZone = self->_timeZone;
  return (id)[CLKTimeTextProviderClass textProviderWithDate:date timeZone:timeZone];
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
}

- (RETimeContentProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];

  id v7 = [(RETimeContentProvider *)self initWithDate:v5 timeZone:v6];
  return v7;
}

- (id)attributedStringRepresentation
{
  if (attributedStringRepresentation_onceToken != -1) {
    dispatch_once(&attributedStringRepresentation_onceToken, &__block_literal_global_49);
  }
  id v3 = objc_alloc(MEMORY[0x263F086A0]);
  id v4 = [(id)attributedStringRepresentation_formatter stringFromDate:self->_date];
  id v5 = (void *)[v3 initWithString:v4];

  return v5;
}

uint64_t __55__RETimeContentProvider_attributedStringRepresentation__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)attributedStringRepresentation_formatter;
  attributedStringRepresentation_formatter = (uint64_t)v0;

  [(id)attributedStringRepresentation_formatter setTimeStyle:2];
  v2 = (void *)attributedStringRepresentation_formatter;
  return [v2 setDateStyle:0];
}

- (NSDate)date
{
  return self->_date;
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