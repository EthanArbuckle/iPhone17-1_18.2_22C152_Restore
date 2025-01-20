@interface BKHistoryEntity
- (BKHistoryEntity)init;
- (BKLocation)location;
- (NSMutableDictionary)pagination;
- (NSString)pageTitle;
- (id)description;
- (int64_t)pageForLookupKey:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPage:(int64_t)a3 forLookupKey:(id)a4;
- (void)setPageTitle:(id)a3;
@end

@implementation BKHistoryEntity

- (BKHistoryEntity)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKHistoryEntity;
  v2 = [(BKHistoryEntity *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pagination = v2->_pagination;
    v2->_pagination = v3;
  }
  return v2;
}

- (int64_t)pageForLookupKey:(id)a3
{
  id v4 = a3;
  v5 = [(BKHistoryEntity *)self pagination];
  objc_super v6 = [v5 objectForKey:v4];

  if (v6) {
    int64_t v7 = (int)[v6 intValue];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)setPage:(int64_t)a3 forLookupKey:(id)a4
{
  id v9 = a4;
  id v6 = [v9 length];
  if ((unint64_t)(a3 - 1) <= 0x7FFFFFFFFFFFFFFDLL && v6)
  {
    id v7 = [objc_alloc((Class)NSNumber) initWithInteger:a3];
    v8 = [(BKHistoryEntity *)self pagination];
    [v8 setObject:v7 forKey:v9];
  }
}

- (id)description
{
  v3 = [(BKHistoryEntity *)self pagination];
  id v4 = [v3 allValues];
  v5 = [v4 lastObject];

  uint64_t v6 = objc_opt_class();
  id v7 = [(BKHistoryEntity *)self location];
  uint64_t v8 = objc_opt_class();
  id v9 = [(BKHistoryEntity *)self location];
  id v10 = [v9 ordinal];
  v11 = [(BKHistoryEntity *)self pagination];
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p>(Location: %@ {Ordinal: %d}-- Pagination Keys: %d -- {Last Page Value: %@})", v6, self, v8, v10, [v11 count], v5);

  return v12;
}

- (BKLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSMutableDictionary)pagination
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_pagination, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end