@interface RAPPhoto
- (CLLocation)location;
- (NSDate)date;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)identifier;
- (RAPPhoto)initWithPhoto:(id)a3 date:(id)a4 location:(id)a5;
- (UIImage)photo;
@end

@implementation RAPPhoto

- (RAPPhoto)initWithPhoto:(id)a3 date:(id)a4 location:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)RAPPhoto;
  v12 = [(RAPPhoto *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photo, a3);
    v14 = (CLLocation *)[v11 copy];
    location = v13->_location;
    v13->_location = v14;

    v16 = (NSDate *)[v10 copy];
    date = v13->_date;
    v13->_date = v16;

    v18 = +[NSUUID UUID];
    uint64_t v19 = [v18 UUIDString];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v19;
  }
  return v13;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return self->_identifier;
}

- (UIImage)photo
{
  return self->_photo;
}

- (NSDate)date
{
  return self->_date;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_photo, 0);
}

@end