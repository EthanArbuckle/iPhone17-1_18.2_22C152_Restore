@interface TSPTemporaryObjectContextDelegate
- (BOOL)ignoreDocumentSupport;
- (NSError)error;
- (NSSet)persistenceWarnings;
- (NSURL)packageURL;
- (TSPTemporaryObjectContextDelegate)init;
- (TSPTemporaryObjectContextDelegate)initWithPackageURL:(id)a3;
- (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5;
- (void)addPersistenceWarnings:(id)a3;
- (void)performReadUsingAccessor:(id)a3;
- (void)presentPersistenceError:(id)a3;
- (void)setIgnoreDocumentSupport:(BOOL)a3;
- (void)setPackageURL:(id)a3;
@end

@implementation TSPTemporaryObjectContextDelegate

- (TSPTemporaryObjectContextDelegate)init
{
  return [(TSPTemporaryObjectContextDelegate *)self initWithPackageURL:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);

  objc_storeStrong((id *)&self->_persistenceWarnings, 0);
}

- (TSPTemporaryObjectContextDelegate)initWithPackageURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TSPTemporaryObjectContextDelegate;
  v5 = [(TSPTemporaryObjectContextDelegate *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    packageURL = v5->_packageURL;
    v5->_packageURL = (NSURL *)v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    persistenceWarnings = v5->_persistenceWarnings;
    v5->_persistenceWarnings = v8;

    v5->_ignoreDocumentSupport = 1;
    v10 = v5;
  }

  return v5;
}

- (void)presentPersistenceError:(id)a3
{
}

- (void)addPersistenceWarnings:(id)a3
{
}

- (void)performReadUsingAccessor:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  id v4 = [(TSPTemporaryObjectContextDelegate *)self packageURL];
  v5[2](v5, v4);
}

- (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = v7;
  if (a4)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFFA08];
    v11 = NSString;
    uint64_t v12 = [v7 filename];
    v13 = (void *)v12;
    v14 = @"Package";
    if (v5) {
      v14 = @"External";
    }
    v15 = [v11 stringWithFormat:@"%@ data %@ is missing.", v14, v12];
    v9 = [v10 setWithObject:v15];
  }

  return v9;
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setPackageURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (NSSet)persistenceWarnings
{
  return &self->_persistenceWarnings->super;
}

- (BOOL)ignoreDocumentSupport
{
  return self->_ignoreDocumentSupport;
}

- (void)setIgnoreDocumentSupport:(BOOL)a3
{
  self->_ignoreDocumentSupport = a3;
}

@end