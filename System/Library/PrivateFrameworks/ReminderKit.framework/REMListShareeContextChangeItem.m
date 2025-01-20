@interface REMListShareeContextChangeItem
- (NSArray)sharees;
- (REMListChangeItem)listChangeItem;
- (REMListShareeContextChangeItem)initWithListChangeItem:(id)a3;
- (id)addShareeWithDisplayName:(id)a3 firstName:(id)a4 lastName:(id)a5 address:(id)a6 status:(int64_t)a7 accessLevel:(int64_t)a8;
- (id)addShareeWithDisplayName:(id)a3 firstName:(id)a4 middleName:(id)a5 lastName:(id)a6 namePrefix:(id)a7 nameSuffix:(id)a8 nickname:(id)a9 address:(id)a10 status:(int64_t)a11 accessLevel:(int64_t)a12;
- (id)addShareeWithPersonNameComponents:(id)a3 address:(id)a4 status:(int64_t)a5 accessLevel:(int64_t)a6;
- (void)addSharee:(id)a3;
- (void)removeAllSharees;
- (void)removeSharee:(id)a3;
- (void)setListChangeItem:(id)a3;
@end

@implementation REMListShareeContextChangeItem

- (REMListShareeContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListShareeContextChangeItem;
  v6 = [(REMListShareeContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listChangeItem, a3);
  }

  return v7;
}

- (void)addSharee:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(REMListShareeContextChangeItem *)self listChangeItem];
    int v11 = 138412546;
    v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Adding sharee {listChangeItem: %@, sharee: %@}", (uint8_t *)&v11, 0x16u);
  }
  v7 = [(REMListShareeContextChangeItem *)self listChangeItem];
  v8 = [v7 sharees];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [v9 addObject:v4];
  v10 = [(REMListShareeContextChangeItem *)self listChangeItem];
  [v10 setSharees:v9];
}

- (NSArray)sharees
{
  v2 = [(REMListShareeContextChangeItem *)self listChangeItem];
  v3 = [v2 sharees];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)addShareeWithDisplayName:(id)a3 firstName:(id)a4 middleName:(id)a5 lastName:(id)a6 namePrefix:(id)a7 nameSuffix:(id)a8 nickname:(id)a9 address:(id)a10 status:(int64_t)a11 accessLevel:(int64_t)a12
{
  id v32 = a10;
  id v31 = a9;
  id v29 = a8;
  id v27 = a7;
  id v25 = a6;
  id v26 = a5;
  id v18 = a4;
  id v23 = a3;
  id v30 = +[REMSharee newObjectID];
  v19 = [REMSharee alloc];
  v33 = [(REMListShareeContextChangeItem *)self listChangeItem];
  v24 = [v33 accountID];
  v28 = [(REMListShareeContextChangeItem *)self listChangeItem];
  v20 = [v28 objectID];
  id v21 = [(REMSharee *)v19 initShareeWithObjectID:v30 accountID:v24 listID:v20 displayName:v23 firstName:v18 middleName:v26 lastName:v25 namePrefix:v27 nameSuffix:v29 nickname:v31 address:v32 status:a11 accessLevel:a12];

  [(REMListShareeContextChangeItem *)self addSharee:v21];

  return v21;
}

- (id)addShareeWithDisplayName:(id)a3 firstName:(id)a4 lastName:(id)a5 address:(id)a6 status:(int64_t)a7 accessLevel:(int64_t)a8
{
  return [(REMListShareeContextChangeItem *)self addShareeWithDisplayName:a3 firstName:a4 middleName:0 lastName:a5 namePrefix:0 nameSuffix:0 nickname:0 address:a6 status:a7 accessLevel:a8];
}

- (id)addShareeWithPersonNameComponents:(id)a3 address:(id)a4 status:(int64_t)a5 accessLevel:(int64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  int v11 = [v10 givenName];
  v12 = [v10 middleName];
  __int16 v13 = [v10 familyName];
  id v14 = [v10 namePrefix];
  uint64_t v15 = [v10 nameSuffix];
  v16 = [v10 nickname];

  v17 = [(REMListShareeContextChangeItem *)self addShareeWithDisplayName:0 firstName:v11 middleName:v12 lastName:v13 namePrefix:v14 nameSuffix:v15 nickname:v16 address:v9 status:a5 accessLevel:a6];

  return v17;
}

- (void)removeSharee:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(REMListShareeContextChangeItem *)self listChangeItem];
    int v11 = 138412546;
    v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Removing sharee {listChangeItem: %@, recurrenceRule: %@}", (uint8_t *)&v11, 0x16u);
  }
  v7 = [(REMListShareeContextChangeItem *)self listChangeItem];
  v8 = [v7 sharees];
  id v9 = (void *)[v8 mutableCopy];

  [v9 removeObject:v4];
  id v10 = [(REMListShareeContextChangeItem *)self listChangeItem];
  [v10 setSharees:v9];
}

- (void)removeAllSharees
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(REMListShareeContextChangeItem *)self listChangeItem];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_INFO, "Removing all sharee {listChangeItem: %@}", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(REMListShareeContextChangeItem *)self listChangeItem];
  [v5 setSharees:MEMORY[0x1E4F1CBF0]];
}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end