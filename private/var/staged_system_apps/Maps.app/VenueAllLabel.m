@interface VenueAllLabel
- (NSString)detail;
- (NSString)name;
- (NSString)shortName;
- (VenueAllLabel)init;
@end

@implementation VenueAllLabel

- (VenueAllLabel)init
{
  v7.receiver = self;
  v7.super_class = (Class)VenueAllLabel;
  v2 = [(VenueAllLabel *)&v7 init];
  if (v2)
  {
    v3 = +[NSBundle mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"[Venues] All" value:@"localized string not found" table:0];
    name = v2->_name;
    v2->_name = (NSString *)v4;
  }
  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_shortName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end