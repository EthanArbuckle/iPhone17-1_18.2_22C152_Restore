@interface RTFavoritePlace
- (NSString)title;
- (RTFavoritePlace)init;
- (RTFavoritePlace)initWithTitle:(id)a3 mapItem:(id)a4;
- (RTMapItem)mapItem;
- (id)description;
@end

@implementation RTFavoritePlace

- (RTFavoritePlace)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithTitle_mapItem_);
}

- (RTFavoritePlace)initWithTitle:(id)a3 mapItem:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)RTFavoritePlace;
    v8 = [(RTFavoritePlace *)&v14 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      title = v8->_title;
      v8->_title = (NSString *)v9;

      objc_storeStrong((id *)&v8->_mapItem, a4);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTFavoritePlace initWithTitle:mapItem:]";
      __int16 v17 = 1024;
      int v18 = 27;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", buf, 0x12u);
    }

    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"title, %@, mapItem, %@", self->_title, self->_mapItem];
}

- (NSString)title
{
  return self->_title;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end