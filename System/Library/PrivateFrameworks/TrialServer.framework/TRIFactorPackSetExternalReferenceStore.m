@interface TRIFactorPackSetExternalReferenceStore
- (BOOL)hasReferenceToPath:(id)a3;
- (TRIFactorPackSetExternalReferenceStore)initWithServerContext:(id)a3;
@end

@implementation TRIFactorPackSetExternalReferenceStore

- (TRIFactorPackSetExternalReferenceStore)initWithServerContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFactorPackSetExternalReferenceStore;
  v6 = [(TRIFactorPackSetExternalReferenceStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (BOOL)hasReferenceToPath:(id)a3
{
  id v4 = a3;
  id v5 = [TRIFactorPackSetStorage alloc];
  v6 = [(TRIServerContext *)self->_context paths];
  v7 = [(TRIFactorPackSetStorage *)v5 initWithPaths:v6];

  v8 = [(TRIFactorPackSetStorage *)v7 parentDirForFactorPackSets];
  objc_super v9 = [v8 stringByAppendingString:@"/"];

  v10 = [v4 triStringByResolvingSymlinksInPath];
  v11 = [v9 triStringByResolvingSymlinksInPath];
  int v12 = [v10 hasPrefix:v11];

  if (v12)
  {
    v13 = [v4 lastPathComponent];
    v14 = TRIValidateFactorPackSetId();

    if (v14)
    {
      v15 = [(TRIServerContext *)self->_context rolloutDatabase];
      char v16 = [v15 hasRecordReferencingFactorPackSetId:v14 withReferenceType:3];

      if (_os_feature_enabled_impl())
      {
        v17 = [(TRIServerContext *)self->_context experimentDatabase];
        char v18 = [v17 hasRecordReferencingFactorPackSetId:v14 withReferenceType:3];
      }
      else
      {
        char v18 = 0;
      }
      char v19 = v16 | v18;
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
}

@end