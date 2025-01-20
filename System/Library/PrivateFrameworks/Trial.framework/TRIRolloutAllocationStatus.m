@interface TRIRolloutAllocationStatus
+ (BOOL)supportsSecureCoding;
- (NSDictionary)factorPackIds;
- (NSString)rampId;
- (NSString)rolloutId;
- (TRIRolloutAllocationStatus)initWithCoder:(id)a3;
- (TRIRolloutAllocationStatus)initWithRolloutId:(id)a3 deploymentId:(int)a4 rampId:(id)a5 factorPackIds:(id)a6;
- (int)deploymentId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIRolloutAllocationStatus

- (TRIRolloutAllocationStatus)initWithRolloutId:(id)a3 deploymentId:(int)a4 rampId:(id)a5 factorPackIds:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 964, @"Invalid parameter not satisfying: %@", @"deploymentId" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 963, @"Invalid parameter not satisfying: %@", @"rolloutId" object file lineNumber description];

  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 965, @"Invalid parameter not satisfying: %@", @"factorPackIds" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)TRIRolloutAllocationStatus;
  v15 = [(TRIRolloutAllocationStatus *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rolloutId, a3);
    v16->_deploymentId = a4;
    objc_storeStrong((id *)&v16->_rampId, a5);
    objc_storeStrong((id *)&v16->_factorPackIds, a6);
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = self->_deploymentId + 37 * [(NSString *)self->_rolloutId hash];
  return [(NSDictionary *)self->_factorPackIds hash] + 37 * v3;
}

- (TRIRolloutAllocationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v5)
  {
    id v21 = 0;
    v6 = +[TRIPBMessage parseFromData:v5 error:&v21];
    id v7 = v21;
    if (v6)
    {
      if ([v6 hasRolloutId] && objc_msgSend(v6, "hasDeploymentId"))
      {
        uint64_t v15 = 0;
        v16 = &v15;
        uint64_t v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__7;
        v19 = __Block_byref_object_dispose__7;
        id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "namespaceFactorPackArray_Count"));
        v8 = [v6 namespaceFactorPackArray];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __44__TRIRolloutAllocationStatus_initWithCoder___block_invoke;
        v14[3] = &unk_1E596B198;
        v14[4] = &v15;
        [v8 enumerateObjectsUsingBlock:v14];

        if (v16[5])
        {
          v9 = [v6 rolloutId];
          uint64_t v10 = [v6 deploymentId];
          v11 = [v6 rampId];
          self = [(TRIRolloutAllocationStatus *)self initWithRolloutId:v9 deploymentId:v10 rampId:v11 factorPackIds:v16[5]];

          id v12 = self;
        }
        else
        {
          id v12 = 0;
        }
        _Block_object_dispose(&v15, 8);

        goto LABEL_10;
      }
    }
    else
    {
      [v4 failWithError:v7];
    }
    id v12 = 0;
LABEL_10:

    goto LABEL_11;
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

void __44__TRIRolloutAllocationStatus_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if objc_msgSend(v11, "hasNamespace_p") && (objc_msgSend(v11, "hasFactorPack"))
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = [v11 factorPack];
    v8 = objc_msgSend(v11, "namespace_p");
    [v6 setObject:v7 forKey:v8];
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    *a4 = 1;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setRolloutId:self->_rolloutId];
  [v6 setDeploymentId:self->_deploymentId];
  [v6 setRampId:self->_rampId];
  factorPackIds = self->_factorPackIds;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __46__TRIRolloutAllocationStatus_encodeWithCoder___block_invoke;
  id v14 = &unk_1E596B1C0;
  id v8 = v6;
  id v15 = v8;
  [(NSDictionary *)factorPackIds enumerateKeysAndObjectsUsingBlock:&v11];
  uint64_t v9 = [v8 data];
  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 1033, @"Invalid parameter not satisfying: %@", @"data", v11, v12, v13, v14 object file lineNumber description];
  }
  [v5 encodeObject:v9 forKey:@"data"];
}

void __46__TRIRolloutAllocationStatus_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setNamespace_p:", v6);

  [v8 setFactorPack:v5];
  id v7 = [*(id *)(a1 + 32) namespaceFactorPackArray];
  [v7 addObject:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)rampId
{
  return self->_rampId;
}

- (NSDictionary)factorPackIds
{
  return self->_factorPackIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackIds, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

@end