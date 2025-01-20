@interface MTItemListManifest
- (MTItemListManifest)initWithItems:(id)a3;
- (NSArray)items;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)setItems:(id)a3;
@end

@implementation MTItemListManifest

- (MTItemListManifest)initWithItems:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTItemListManifest;
  v5 = [(MTPlayerManifest *)&v12 init];
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000CFB40;
    v10[3] = &unk_100550880;
    unsigned __int8 v11 = +[PFRestrictionsController isExplicitContentAllowed];
    v6 = [v4 ams_filterUsingTest:v10];
    [(MTItemListManifest *)v5 setItems:v6];

    v7 = [(MTItemListManifest *)v5 items];
    id v8 = [v7 count];

    if (v8) {
      [(MTItemListManifest *)v5 setCurrentIndex:0];
    }
    [(MTItemListManifest *)v5 setIsLoaded:1];
  }

  return v5;
}

- (void)setItems:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_items, a3);
  if ([v9 count])
  {
    id v5 = [(MTItemListManifest *)self currentIndex];
    if (v5 < [v9 count]) {
      goto LABEL_6;
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(MTItemListManifest *)self setCurrentIndex:v6];
LABEL_6:
  if ([v9 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [v9 objectAtIndex:v7];
      [v8 setManifestIndex:v7];

      ++v7;
    }
    while ((unint64_t)[v9 count] > v7);
  }
  [(MTItemListManifest *)self postManifestDidChangeNotification];
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v5 = [(MTItemListManifest *)self items];
  uint64_t v6 = [v5 objectAtIndex:a3];

  [v6 setManifest:self];

  return v6;
}

- (unint64_t)count
{
  v2 = [(MTItemListManifest *)self items];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end