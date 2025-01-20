@interface PXSmartAlbumStringValueCondition
- (NSString)stringValue;
- (void)setStringValue:(id)a3;
@end

@implementation PXSmartAlbumStringValueCondition

- (void)setStringValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSmartAlbumStringValueCondition.m", 27, @"Invalid parameter not satisfying: %@", @"stringValue" object file lineNumber description];
  }
  v6 = [(PXSmartAlbumCondition *)self singleQuery];
  [v6 setStringValue:v5];
  v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: string value set to: \"%@\"", buf, 0xCu);
  }

  v8 = [(PXSmartAlbumCondition *)self delegate];
  [v8 conditionDidChange:self];
}

- (NSString)stringValue
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

@end