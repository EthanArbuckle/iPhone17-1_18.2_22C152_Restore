@interface SPSearchResultMarker
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (SPSearchResultMarker)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation SPSearchResultMarker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSearchResultMarker)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];

  [(SPSearchResultMarker *)self setDate:v5];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SPSearchResultMarker *)self date];
  [v4 encodeObject:v5 forKey:@"date"];
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