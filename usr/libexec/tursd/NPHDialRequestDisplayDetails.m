@interface NPHDialRequestDisplayDetails
- (NPHDialRequestDisplayDetails)initWithHandle:(id)a3;
- (NSString)subTitle;
- (NSString)title;
- (TUHandle)handle;
- (id)description;
@end

@implementation NPHDialRequestDisplayDetails

- (NPHDialRequestDisplayDetails)initWithHandle:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NPHDialRequestDisplayDetails;
  v6 = [(NPHDialRequestDisplayDetails *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handle, a3);
    if (v7->_handle)
    {
      id v8 = [objc_alloc((Class)TUContactsDataProviderFetchRequest) initWithHandle:v7->_handle];
      v9 = objc_opt_new();
      v10 = [v9 executeFetchRequest:v8];
      uint64_t v11 = [v10 localizedName];
      title = v7->_title;
      v7->_title = (NSString *)v11;

      uint64_t v13 = [v10 contactLabel];
      subTitle = v7->_subTitle;
      v7->_subTitle = (NSString *)v13;
    }
    else
    {
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v15 = [v8 localizedStringForKey:@"UNKNOWN" value:&stru_100010A90 table:0];
      v9 = v7->_title;
      v7->_title = (NSString *)v15;
    }
  }
  return v7;
}

- (id)description
{
  v3 = [(NPHDialRequestDisplayDetails *)self handle];
  v4 = [(NPHDialRequestDisplayDetails *)self title];
  id v5 = [(NPHDialRequestDisplayDetails *)self subTitle];
  v6 = +[NSString stringWithFormat:@"%@: title: %@ subtitle: %@", v3, v4, v5];

  return v6;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end