@interface BKAudiobookCollection
- (BKAudiobookCollection)initWithStoreID:(id)a3;
- (NSArray)items;
- (NSMutableArray)mutableItems;
- (NSNumber)storeID;
- (id)description;
- (void)addItem:(id)a3;
- (void)setMutableItems:(id)a3;
@end

@implementation BKAudiobookCollection

- (BKAudiobookCollection)initWithStoreID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKAudiobookCollection;
  v6 = [(BKAudiobookCollection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeID, a3);
    uint64_t v8 = +[NSMutableArray array];
    mutableItems = v7->_mutableItems;
    v7->_mutableItems = (NSMutableArray *)v8;
  }
  return v7;
}

- (NSArray)items
{
  v2 = [(BKAudiobookCollection *)self mutableItems];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAudiobookCollection *)self mutableItems];
  [v5 addObject:v4];
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BKAudiobookCollection *)self items];
  v6 = +[NSString stringWithFormat:@"<%@(%p) %@>", v4, self, v5];

  return v6;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (NSMutableArray)mutableItems
{
  return self->_mutableItems;
}

- (void)setMutableItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableItems, 0);

  objc_storeStrong((id *)&self->_storeID, 0);
}

@end