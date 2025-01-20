@interface TRIExperimentDeploymentRefStore
- (BOOL)hasReferenceToPath:(id)a3;
- (TRIExperimentDeploymentRefStore)initWithServerContext:(id)a3;
@end

@implementation TRIExperimentDeploymentRefStore

- (TRIExperimentDeploymentRefStore)initWithServerContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIExperimentDeploymentRefStore;
  v6 = [(TRIExperimentDeploymentRefStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (BOOL)hasReferenceToPath:(id)a3
{
  id v4 = a3;
  id v5 = [TRINamespaceResolverStorage alloc];
  v6 = [(TRIServerContext *)self->_context paths];
  v7 = [(TRINamespaceResolverStorage *)v5 initWithPaths:v6];

  v8 = [(TRINamespaceResolverStorage *)v7 parentDirForExperimentDeployments];
  objc_super v9 = [v8 stringByAppendingString:@"/"];

  v10 = [v4 triStringByResolvingSymlinksInPath];
  v11 = [v9 triStringByResolvingSymlinksInPath];
  int v12 = [v10 hasPrefix:v11];

  if (v12)
  {
    v13 = [v4 pathComponents];
    if ((unint64_t)[v13 count] >= 2)
    {
      v15 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 2);
      v16 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 1);
      uint64_t v22 = -1;
      BOOL v14 = 0;
      if ([MEMORY[0x1E4FB0198] convertFromString:v16 usingBase:10 toI64:&v22]
        && (v22 & 0x8000000000000000) == 0
        && v22 <= 0x7FFFFFFF)
      {
        id v17 = objc_alloc(MEMORY[0x1E4FB00F8]);
        v18 = (void *)[v17 initWithExperimentId:v15 deploymentId:v22];
        v19 = [(TRIServerContext *)self->_context experimentDatabase];
        v20 = [v19 experimentRecordWithExperimentDeployment:v18];

        if (v20) {
          BOOL v14 = [v20 status] == 1;
        }
        else {
          BOOL v14 = 0;
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
}

@end