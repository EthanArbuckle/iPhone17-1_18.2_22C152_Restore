@interface FMDEventLoggerEventDataPeekError
+ (BOOL)supportsSecureCoding;
- (FMDEventLoggerEventDataPeekError)initWithCoder:(id)a3;
- (NSString)dataPeekEventName;
- (void)encodeWithCoder:(id)a3;
- (void)setDataPeekEventName:(id)a3;
- (void)setError:(id)a3;
@end

@implementation FMDEventLoggerEventDataPeekError

- (void)setError:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)FMDEventLoggerEventDataPeekError;
  id v4 = a3;
  [(FMDEventLoggerEventError *)&v13 setError:v4];
  id v5 = [v4 code];
  v6 = [v4 localizedFailureReason];
  v7 = +[NSString stringWithFormat:@"%lu-%@", v5, v6];
  [(FMDEventLoggerEventError *)self setObject:v7 forKey:@"FMDEventLoggerFacilityDataPeekDistributionValue"];

  v12.receiver = self;
  v12.super_class = (Class)FMDEventLoggerEventDataPeekError;
  v8 = [(FMDEventLoggerEventError *)&v12 eventName];
  v9 = [v4 domain];

  v10 = +[NSString stringWithFormat:@".%@", v9];
  v11 = [v8 stringByAppendingString:v10];
  [(FMDEventLoggerEventDataPeekError *)self setDataPeekEventName:v11];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDEventLoggerEventDataPeekError)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDEventLoggerEventDataPeekError;
  id v5 = [(FMDEventLoggerEventError *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataPeekEventName"];
    [(FMDEventLoggerEventDataPeekError *)v5 setDataPeekEventName:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMDEventLoggerEventDataPeekError;
  id v4 = a3;
  [(FMDEventLoggerEventError *)&v6 encodeWithCoder:v4];
  id v5 = [(FMDEventLoggerEventDataPeekError *)self dataPeekEventName];
  [v4 encodeObject:v5 forKey:@"dataPeekEventName"];
}

- (NSString)dataPeekEventName
{
  return self->_dataPeekEventName;
}

- (void)setDataPeekEventName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end