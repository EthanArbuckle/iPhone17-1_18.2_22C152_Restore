@interface TUResultGroup
- (NSMutableArray)resultsCache;
- (TUGroupTitle)title;
- (TUResultGroup)initWithTitle:(id)a3 results:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)groupType;
- (void)removeSearchItem:(id)a3;
- (void)setResultsCache:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TUResultGroup

- (TUResultGroup)initWithTitle:(id)a3 results:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUResultGroup;
  v8 = [(TUResultGroup *)&v12 init];
  if (v8)
  {
    if ([v6 length])
    {
      v9 = [[TUGroupTitle alloc] initWithString:v6];
      title = v8->_title;
      v8->_title = v9;
    }
    objc_storeStrong((id *)&v8->_resultsCache, a4);
  }

  return v8;
}

- (void)removeSearchItem:(id)a3
{
  id v4 = a3;
  id v5 = [(TUResultGroup *)self resultsCache];
  [v5 removeObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_title);
    objc_storeStrong(v5 + 2, self->_resultsCache);
  }
  return v5;
}

- (unint64_t)groupType
{
  v3 = [(TUResultGroup *)self results];
  uint64_t v4 = [v3 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 0;
  }
  id v7 = [(TUResultGroup *)self results];
  v8 = [v7 lastObject];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9) {
    return 1;
  }
  v10 = [(TUResultGroup *)self results];
  v11 = [v10 lastObject];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if (v12) {
    return 2;
  }
  else {
    return 0;
  }
}

- (TUGroupTitle)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSMutableArray)resultsCache
{
  return self->_resultsCache;
}

- (void)setResultsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsCache, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end