@interface PXSmartAlbumPersonCondition
+ (id)defaultSingleQueryForEditingContext:(id)a3;
- (NSArray)personNames;
- (NSString)personName;
- (void)setPersonName:(id)a3;
@end

@implementation PXSmartAlbumPersonCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  v3 = [a3 personNames];
  v4 = [v3 firstObject];

  id v5 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v5 setKey:550];
  [v5 setStringValue:v4];
  [v5 setComparator:20];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setPersonName:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSmartAlbumPersonCondition.m", 38, @"Invalid parameter not satisfying: %@", @"personName" object file lineNumber description];
  }
  v6 = [(PXSmartAlbumCondition *)self singleQuery];
  [v6 setStringValue:v5];
  v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: person name set to: \"%@\"", buf, 0xCu);
  }

  v8 = [(PXSmartAlbumCondition *)self delegate];
  [v8 conditionDidChange:self];
}

- (NSString)personName
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  v3 = [v2 stringValue];
  v4 = v3;
  if (!v3) {
    v3 = &stru_1F00B0030;
  }
  id v5 = v3;

  return v5;
}

- (NSArray)personNames
{
  personNames = self->_personNames;
  if (!personNames)
  {
    v4 = [(PXSmartAlbumCondition *)self editingContext];
    id v5 = [v4 personNames];
    v6 = self->_personNames;
    self->_personNames = v5;

    personNames = self->_personNames;
  }
  return personNames;
}

@end