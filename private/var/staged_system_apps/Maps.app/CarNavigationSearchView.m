@interface CarNavigationSearchView
- (CarNavigationSearchView)initWithFrame:(CGRect)a3;
- (NSArray)categories;
- (double)preferredHeightForAvailableSize:(CGSize)a3;
- (id)categorySearchHandler;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)siriSearchHandler;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)_numberOfItems;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)setCategories:(id)a3;
- (void)setCategorySearchHandler:(id)a3;
- (void)setSiriSearchHandler:(id)a3;
@end

@implementation CarNavigationSearchView

- (void)dealloc
{
  [(UICollectionView *)self->_collectionView setDelegate:0];
  [(UICollectionView *)self->_collectionView setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)CarNavigationSearchView;
  [(CarNavigationSearchView *)&v3 dealloc];
}

- (CarNavigationSearchView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CarNavigationSearchView;
  objc_super v3 = -[CarNavigationSearchView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CarNavigationSearchViewLayout);
    id v5 = objc_alloc((Class)UICollectionView);
    [(CarNavigationSearchView *)v3 bounds];
    v6 = [v5 initWithFrame:v4 collectionViewLayout:];
    collectionView = v3->_collectionView;
    v3->_collectionView = v6;

    [(UICollectionView *)v3->_collectionView setScrollEnabled:0];
    [(UICollectionView *)v3->_collectionView setAutoresizingMask:18];
    v8 = +[UIColor clearColor];
    [(UICollectionView *)v3->_collectionView setBackgroundColor:v8];

    [(UICollectionView *)v3->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Cell"];
    [(UICollectionView *)v3->_collectionView setDelegate:v3];
    [(UICollectionView *)v3->_collectionView setDataSource:v3];
    [(CarNavigationSearchView *)v3 addSubview:v3->_collectionView];
  }
  return v3;
}

- (double)preferredHeightForAvailableSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  [v6 preferredHeightForItemCount:[self _numberOfItems] availableSize:width, height];
  double v8 = v7;

  return v8;
}

- (void)setCategories:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_categories, "isEqualToArray:"))
  {
    if ((unint64_t)[v7 count] <= 3) {
      uint64_t v4 = (uint64_t)[v7 count];
    }
    else {
      uint64_t v4 = 3;
    }
    [v7 subarrayWithRange:0, v4];
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    categories = self->_categories;
    self->_categories = v5;

    [(UICollectionView *)self->_collectionView reloadData];
  }
}

- (unint64_t)_numberOfItems
{
  v2 = [(CarNavigationSearchView *)self categories];
  objc_super v3 = (char *)[v2 count] + 1;

  return (unint64_t)v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:v6];
  id v8 = [v6 row];
  v9 = [(CarNavigationSearchView *)self categories];
  id v10 = [v9 count];

  if (v8 == v10)
  {
    if (qword_101610FC0 != -1) {
      dispatch_once(&qword_101610FC0, &stru_101321CC0);
    }
    [v7 setImage:qword_101610FB8];
  }
  else
  {
    v11 = +[NSUUID UUID];
    [v7 setUpdateIdentifier:v11];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100D090C0;
    v20[3] = &unk_1012F4C10;
    id v21 = v11;
    id v22 = v7;
    id v12 = v11;
    v13 = objc_retainBlock(v20);
    v14 = [(CarNavigationSearchView *)self categories];
    v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100D0914C;
    v18[3] = &unk_1012E60A0;
    id v19 = v13;
    v16 = v13;
    [v15 imageWithScale:1 isCarplay:v18 resultHandler:0.0];
  }

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [v6 row];
  id v8 = [(CarNavigationSearchView *)self categories];
  id v9 = [v8 count];

  if (v7 == v9)
  {
    id v10 = [(CarNavigationSearchView *)self siriSearchHandler];

    if (!v10) {
      goto LABEL_7;
    }
    v11 = [(CarNavigationSearchView *)self siriSearchHandler];
    v11[2]();
  }
  else
  {
    id v12 = [(CarNavigationSearchView *)self categorySearchHandler];

    if (!v12) {
      goto LABEL_7;
    }
    v11 = [(CarNavigationSearchView *)self categorySearchHandler];
    v13 = [(CarNavigationSearchView *)self categories];
    v14 = [v13 objectAtIndexedSubscript:[v6 row]];
    ((void (*)(void (**)(void), void *))v11[2])(v11, v14);
  }
LABEL_7:
  [v15 deselectItemAtIndexPath:v6 animated:1];
}

- (NSArray)categories
{
  return self->_categories;
}

- (id)siriSearchHandler
{
  return self->_siriSearchHandler;
}

- (void)setSiriSearchHandler:(id)a3
{
}

- (id)categorySearchHandler
{
  return self->_categorySearchHandler;
}

- (void)setCategorySearchHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_categorySearchHandler, 0);
  objc_storeStrong(&self->_siriSearchHandler, 0);
  objc_storeStrong((id *)&self->_categories, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end