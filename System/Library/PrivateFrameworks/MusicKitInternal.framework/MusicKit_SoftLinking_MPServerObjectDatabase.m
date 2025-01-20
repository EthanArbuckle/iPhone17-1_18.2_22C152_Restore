@interface MusicKit_SoftLinking_MPServerObjectDatabase
+ (MusicKit_SoftLinking_MPServerObjectDatabase)sharedServerObjectDatabase;
- (id)_initWithUnderlyingServerObjectDatabase:(id)a3;
- (id)importObjectsFromRequest:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)payloadDataForIdentifier:(id)a3 identifierKinds:(int64_t)a4 error:(id *)a5;
@end

@implementation MusicKit_SoftLinking_MPServerObjectDatabase

+ (MusicKit_SoftLinking_MPServerObjectDatabase)sharedServerObjectDatabase
{
  if (sharedServerObjectDatabase_sSharedServerObjectDatabaseOnceToken[0] != -1) {
    dispatch_once(sharedServerObjectDatabase_sSharedServerObjectDatabaseOnceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedServerObjectDatabase_sSharedServerObjectDatabase;
  return (MusicKit_SoftLinking_MPServerObjectDatabase *)v2;
}

- (id)_initWithUnderlyingServerObjectDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPServerObjectDatabase;
  v6 = [(MusicKit_SoftLinking_MPServerObjectDatabase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingServerObjectDatabase, a3);
  }

  return v7;
}

- (id)importObjectsFromRequest:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  v8 = [a3 _underlyingImportRequest];
  objc_super v9 = [(MPServerObjectDatabase *)self->_underlyingServerObjectDatabase importObjectsFromRequest:v8 options:v6 & 1 error:a5];
  id v10 = [[MusicKit_SoftLinking_MPServerObjectDatabaseImportResult alloc] _initWithUnderlyingImportResult:v9];

  return v10;
}

- (id)payloadDataForIdentifier:(id)a3 identifierKinds:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  objc_super v9 = (void *)getMPModelGenericObjectKindClass_softClass;
  uint64_t v31 = getMPModelGenericObjectKindClass_softClass;
  if (!getMPModelGenericObjectKindClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getMPModelGenericObjectKindClass_block_invoke;
    v26 = &unk_1E6D453B0;
    v27 = &v28;
    __getMPModelGenericObjectKindClass_block_invoke((uint64_t)&v23);
    objc_super v9 = (void *)v29[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v28, 8);
  v11 = [v10 identityKind];
  v12 = [MEMORY[0x1E4F385C8] rawSourceFromSource:12];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v13 = (void *)getMPIdentifierSetClass_softClass_1;
  uint64_t v31 = getMPIdentifierSetClass_softClass_1;
  if (!getMPIdentifierSetClass_softClass_1)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getMPIdentifierSetClass_block_invoke_1;
    v26 = &unk_1E6D453B0;
    v27 = &v28;
    __getMPIdentifierSetClass_block_invoke_1((uint64_t)&v23);
    v13 = (void *)v29[3];
  }
  v14 = v13;
  _Block_object_dispose(&v28, 8);
  id v15 = [v14 alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke;
  v20[3] = &unk_1E6D45A20;
  id v21 = v8;
  int64_t v22 = a4;
  id v16 = v8;
  v17 = (void *)[v15 initWithSource:v12 modelKind:v11 block:v20];
  v18 = [(MPServerObjectDatabase *)self->_underlyingServerObjectDatabase payloadDataForIdentifierSet:v17 outError:a5];

  return v18;
}

- (void).cxx_destruct
{
}

@end