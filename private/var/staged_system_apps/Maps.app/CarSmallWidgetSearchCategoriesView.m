@interface CarSmallWidgetSearchCategoriesView
- (NSArray)categories;
- (id)data;
- (id)modelForItemAtIndexPath:(id)a3;
- (void)didSelectItemAtIndexPath:(id)a3;
- (void)setCategories:(id)a3;
@end

@implementation CarSmallWidgetSearchCategoriesView

- (void)setCategories:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_categories, "isEqualToArray:")) {
    objc_storeStrong((id *)&self->_categories, a3);
  }
  [(CarSmallWidgetCollectionView *)self refreshData];
}

- (id)data
{
  return self->_categories;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CarSmallWidgetSearchCategoriesView *)self categories];
  id v6 = [v4 row];

  v7 = [v5 objectAtIndexedSubscript:v6];

  v8 = [[CarSmallWidgetSearchCategoriesCellModel alloc] initWithBrowseCategory:v7];

  return v8;
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CarSmallWidgetSearchCategoriesView *)self categories];
  id v6 = [v5 objectAtIndexedSubscript:[v4 row]];

  v7 = sub_100577F64();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    if (!v8)
    {
      v13 = @"<nil>";
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(CarSmallWidgetSearchCategoriesView *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v18 = v13;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] didSelectItemAtIndexPath: %@", buf, 0x16u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004B4320;
  v15[3] = &unk_1012E5D58;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:v15];
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
}

@end