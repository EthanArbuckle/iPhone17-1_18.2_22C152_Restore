@interface MKHTTPContentDate
- (MKHTTPContentDate)initWithHeaderValue:(id)a3;
- (NSDate)date;
- (void)setDate:(id)a3;
@end

@implementation MKHTTPContentDate

- (MKHTTPContentDate)initWithHeaderValue:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKHTTPContentDate;
  v5 = [(MKHTTPContentDate *)&v12 init];
  if (v5)
  {
    if (!v4)
    {
      v10 = 0;
      goto LABEL_6;
    }
    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    v8 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [v6 setLocale:v7];
    [v6 setTimeZone:v8];
    [v6 setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss z"];
    v9 = [v6 dateFromString:v4];
    [(MKHTTPContentDate *)v5 setDate:v9];
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end