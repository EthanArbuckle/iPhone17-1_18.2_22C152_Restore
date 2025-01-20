@interface RidesharingFareLineItem
+ (id)_fareItemsFromRideOption:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)details;
- (NSString)title;
- (RidesharingFareLineItem)init;
- (id)_initWithTitle:(id)a3 details:(id)a4;
- (unint64_t)hash;
@end

@implementation RidesharingFareLineItem

- (RidesharingFareLineItem)init
{
  result = (RidesharingFareLineItem *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)_initWithTitle:(id)a3 details:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RidesharingFareLineItem;
  v8 = [(RidesharingFareLineItem *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    v11 = (NSString *)[v7 copy];
    details = v8->_details;
    v8->_details = v11;
  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  return [(NSString *)self->_details hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 title];
    v9 = [(RidesharingFareLineItem *)self title];
    if ([v8 isEqual:v9])
    {
      v10 = [v7 details];
      v11 = [(RidesharingFareLineItem *)self details];
      unsigned __int8 v12 = [v10 isEqual:v11];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

+ (id)_fareItemsFromRideOption:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = objc_opt_new();
  id v6 = [v3 fareLineItems];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A8BF2C;
  v11[3] = &unk_101315E60;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  v9 = sub_100099700(v6, v11);

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)details
{
  return self->_details;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end