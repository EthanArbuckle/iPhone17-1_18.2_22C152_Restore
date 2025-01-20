@interface PXFileNameUniquifierInMemoryCacheSource
- (BOOL)fileExistsAtPath:(id)a3;
- (NSMutableSet)knownFilePaths;
- (NSString)debugDescription;
- (PXFileNameUniquifierInMemoryCacheSource)init;
- (void)rememberUniquifiedFilePath:(id)a3;
@end

@implementation PXFileNameUniquifierInMemoryCacheSource

- (void).cxx_destruct
{
}

- (NSMutableSet)knownFilePaths
{
  return self->_knownFilePaths;
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PXFileNameUniquifierInMemoryCacheSource *)self knownFilePaths];
  v6 = [v3 stringWithFormat:@"<%@:%p known file paths: %@  >", v4, self, v5];

  return (NSString *)v6;
}

- (void)rememberUniquifiedFilePath:(id)a3
{
  id v4 = a3;
  id v5 = [(PXFileNameUniquifierInMemoryCacheSource *)self knownFilePaths];
  [v5 addObject:v4];
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PXFileNameUniquifierInMemoryCacheSource *)self knownFilePaths];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (PXFileNameUniquifierInMemoryCacheSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXFileNameUniquifierInMemoryCacheSource;
  v2 = [(PXFileNameUniquifierInMemoryCacheSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    knownFilePaths = v2->_knownFilePaths;
    v2->_knownFilePaths = (NSMutableSet *)v3;
  }
  return v2;
}

@end