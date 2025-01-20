@interface PGSharedLibraryAssetsQuestion
- (BOOL)isEquivalentToPersistedQuestion:(id)a3;
- (BOOL)isEquivalentToQuestion:(id)a3;
- (PGSharedLibraryAssetsQuestion)initWithAssetUUID:(id)a3;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGSharedLibraryAssetsQuestion

- (void).cxx_destruct
{
}

- (unsigned)state
{
  return self->_state;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 entityIdentifier];
  v6 = [(PGSharedLibraryAssetsQuestion *)self entityIdentifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 entityType], v7 == -[PGSharedLibraryAssetsQuestion entityType](self, "entityType")))
  {
    int v8 = [v4 type];
    BOOL v9 = v8 == -[PGSharedLibraryAssetsQuestion type](self, "type") || [v4 type] == 23;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEquivalentToQuestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 entityIdentifier];
  v6 = [(PGSharedLibraryAssetsQuestion *)self entityIdentifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 entityType], v7 == -[PGSharedLibraryAssetsQuestion entityType](self, "entityType")))
  {
    int v8 = [v4 type];
    BOOL v9 = v8 == [(PGSharedLibraryAssetsQuestion *)self type];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unsigned)entityType
{
  return 0;
}

- (unsigned)displayType
{
  return 0;
}

- (unsigned)type
{
  return 20;
}

- (PGSharedLibraryAssetsQuestion)initWithAssetUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSharedLibraryAssetsQuestion;
  v5 = [(PGSharedLibraryAssetsQuestion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    entityIdentifier = v5->_entityIdentifier;
    v5->_entityIdentifier = (NSString *)v6;

    v5->_state = 0;
  }

  return v5;
}

@end