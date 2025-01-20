@interface SBHSimpleApplicationDataSource
- (id)allApplicationPlaceholdersForIconModel:(id)a3;
- (id)allApplicationsForIconModel:(id)a3;
- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4;
- (id)makeApplicationWithRecord:(id)a3;
- (id)simpleApplicationsWithEnumeratorOptions:(unint64_t)a3;
@end

@implementation SBHSimpleApplicationDataSource

- (id)allApplicationsForIconModel:(id)a3
{
  return [(SBHSimpleApplicationDataSource *)self simpleApplicationsWithEnumeratorOptions:0];
}

- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F223C8];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];

  if (v7)
  {
    v8 = [(SBHSimpleApplicationDataSource *)self makeApplicationWithRecord:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)allApplicationPlaceholdersForIconModel:(id)a3
{
  return [(SBHSimpleApplicationDataSource *)self simpleApplicationsWithEnumeratorOptions:64];
}

- (id)simpleApplicationsWithEnumeratorOptions:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:a3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v4 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      v8 = [(SBHSimpleApplicationDataSource *)self makeApplicationWithRecord:v7];
      if (v8) {
        [v5 addObject:v8];
      }

      uint64_t v9 = [v4 nextObject];

      v7 = (void *)v9;
    }
    while (v9);
  }

  return v5;
}

- (id)makeApplicationWithRecord:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "sbh_isValidType"))
  {
    id v5 = [[SBHSimpleApplication alloc] initWithApplicationRecord:v4];
    [(SBHSimpleApplication *)v5 setIconModelApplicationDataSource:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end