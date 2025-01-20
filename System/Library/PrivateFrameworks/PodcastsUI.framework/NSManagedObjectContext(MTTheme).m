@interface NSManagedObjectContext(MTTheme)
- (id)colorThemeForUuid:()MTTheme;
- (id)themeForUuid:()MTTheme;
@end

@implementation NSManagedObjectContext(MTTheme)

- (id)themeForUuid:()MTTheme
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"MTTheme"];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid = %@", v4];
  [v5 setPredicate:v6];

  [v5 setReturnsObjectsAsFaults:0];
  id v14 = 0;
  v7 = [a1 executeFetchRequest:v5 error:&v14];
  id v8 = v14;
  v9 = v8;
  if (!v7) {
    [v8 logAndThrow:1];
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    v10 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v7 count];
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1E3BC5000, v10, OS_LOG_TYPE_DEFAULT, "WARNING: Duplicate themes for %@ (%ld)", buf, 0x16u);
    }
  }
  v12 = [v7 firstObject];

  return v12;
}

- (id)colorThemeForUuid:()MTTheme
{
  v1 = objc_msgSend(a1, "themeForUuid:");
  v2 = [v1 convertToColorTheme];

  return v2;
}

@end