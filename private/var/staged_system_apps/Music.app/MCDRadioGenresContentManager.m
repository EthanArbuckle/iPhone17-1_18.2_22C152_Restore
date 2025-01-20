@interface MCDRadioGenresContentManager
- (BOOL)wantsGridCellAtIndexPath:(id)a3;
- (NSArray)genreCategories;
- (id)_modelRequest;
- (id)itemAtIndexPath:(id)a3;
- (void)setGenreCategories:(id)a3;
@end

@implementation MCDRadioGenresContentManager

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MCDRadioGenresContentManager *)self genreCategories];

  if (!v5)
  {
    v6 = +[NSMutableArray array];
    v7 = [(MCDFuseContentManager *)self lastReceivedResponse];
    v8 = [v7 results];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000B4B6C;
    v18[3] = &unk_100FC41D0;
    id v19 = v6;
    id v9 = v6;
    [v8 enumerateSectionsUsingBlock:v18];

    v10 = +[UILocalizedIndexedCollation currentCollation];
    v11 = [v10 sortedArrayFromArray:v9 collationStringSelector:"title"];
    [(MCDRadioGenresContentManager *)self setGenreCategories:v11];
  }
  id v12 = [v4 row];
  v13 = [(MCDRadioGenresContentManager *)self genreCategories];
  id v14 = [v13 count];

  if (v12 >= v14)
  {
    v16 = 0;
  }
  else
  {
    v15 = [(MCDRadioGenresContentManager *)self genreCategories];
    v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }

  return v16;
}

- (id)_modelRequest
{
  id v3 = objc_alloc_init((Class)MPModelStoreBrowseRequest);
  [v3 setFilteringPolicy:1];
  id v4 = [(MCDFuseContentManager *)self dataSource];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(MCDFuseContentManager *)self dataSource];
    v7 = [v6 parentSection];
    [v3 configureWithParentSection:v7];
  }
  v8 = [(MCDFuseContentManager *)self dataSource];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(MCDFuseContentManager *)self dataSource];
    [v3 setDomain:[v10 domain]];
  }

  return v3;
}

- (NSArray)genreCategories
{
  return self->_genreCategories;
}

- (void)setGenreCategories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end