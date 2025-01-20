@interface PGSyndicatedAssetsQuestion
- (BOOL)isEquivalentToPersistedQuestion:(id)a3;
- (BOOL)isEquivalentToQuestion:(id)a3;
- (PGSyndicatedAssetsQuestion)initWithAssetSyndicationIdentifier:(id)a3;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGSyndicatedAssetsQuestion

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
  v6 = [(PGSyndicatedAssetsQuestion *)self entityIdentifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 entityType], v7 == -[PGSyndicatedAssetsQuestion entityType](self, "entityType")))
  {
    int v8 = [v4 type];
    BOOL v9 = v8 == [(PGSyndicatedAssetsQuestion *)self type];
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
  v6 = [(PGSyndicatedAssetsQuestion *)self entityIdentifier];
  if ([v5 isEqualToString:v6]
    && (int v7 = [v4 entityType], v7 == -[PGSyndicatedAssetsQuestion entityType](self, "entityType")))
  {
    int v8 = [v4 type];
    BOOL v9 = v8 == [(PGSyndicatedAssetsQuestion *)self type];
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
  return 18;
}

- (PGSyndicatedAssetsQuestion)initWithAssetSyndicationIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSyndicatedAssetsQuestion;
  v6 = [(PGSyndicatedAssetsQuestion *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entityIdentifier, a3);
    v7->_state = 0;
  }

  return v7;
}

@end