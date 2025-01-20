@interface TRIExperimentAllocationStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToStatus:(id)a3;
- (NSArray)namespaces;
- (NSString)experimentId;
- (NSString)treatmentId;
- (TRIExperimentAllocationStatus)initWithCoder:(id)a3;
- (TRIExperimentAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4 experimentId:(id)a5 deploymentId:(int)a6 treatmentId:(id)a7;
- (TRIExperimentAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4 experimentId:(id)a5 deploymentId:(int)a6 treatmentId:(id)a7 namespaces:(id)a8;
- (int)deploymentId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIExperimentAllocationStatus

- (TRIExperimentAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4 experimentId:(id)a5 deploymentId:(int)a6 treatmentId:(id)a7 namespaces:(id)a8
{
  uint64_t v12 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 829, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
LABEL_10:
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 831, @"Invalid parameter not satisfying: %@", @"treatmentId" object file lineNumber description];

      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 830, @"Invalid parameter not satisfying: %@", @"experimentId" object file lineNumber description];

  if (!v16) {
    goto LABEL_10;
  }
LABEL_4:
  if (v17) {
    goto LABEL_5;
  }
LABEL_11:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 832, @"Invalid parameter not satisfying: %@", @"namespaces" object file lineNumber description];

LABEL_5:
  v26.receiver = self;
  v26.super_class = (Class)TRIExperimentAllocationStatus;
  v18 = [(TRIAllocationStatus *)&v26 initWithType:v12 date:v14];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_experimentId, a5);
    v19->_deploymentId = a6;
    objc_storeStrong((id *)&v19->_treatmentId, a7);
    objc_storeStrong((id *)&v19->_namespaces, a8);
  }

  return v19;
}

- (TRIExperimentAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4 experimentId:(id)a5 deploymentId:(int)a6 treatmentId:(id)a7
{
  return [(TRIExperimentAllocationStatus *)self initWithType:a3 date:a4 experimentId:a5 deploymentId:*(void *)&a6 treatmentId:a7 namespaces:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)isEqualToStatus:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13.receiver = self;
    v13.super_class = (Class)TRIExperimentAllocationStatus;
    if ([(TRIAllocationStatus *)&v13 isEqualToStatus:v4])
    {
      v5 = (id *)v4;
      if ([(NSString *)self->_experimentId isEqualToString:v5[4]]
        && self->_deploymentId == *((_DWORD *)v5 + 6))
      {
        v6 = self->_treatmentId;
        v7 = (NSString *)v5[5];
        if (v6 == v7)
        {

LABEL_15:
          BOOL v10 = [(NSArray *)self->_namespaces isEqualToArray:v5[6]];
LABEL_17:

          goto LABEL_18;
        }
        v8 = v7;
        if (v6) {
          BOOL v9 = v7 == 0;
        }
        else {
          BOOL v9 = 1;
        }
        if (v9)
        {
        }
        else
        {
          BOOL v11 = [(NSString *)v6 isEqualToString:v7];

          if (v11) {
            goto LABEL_15;
          }
        }
      }
      BOOL v10 = 0;
      goto LABEL_17;
    }
  }
  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)TRIExperimentAllocationStatus;
  unint64_t v3 = [(TRIAllocationStatus *)&v7 hash];
  NSUInteger v4 = self->_deploymentId + 37 * ([(NSString *)self->_experimentId hash] + 37 * v3);
  NSUInteger v5 = [(NSString *)self->_treatmentId hash] + 37 * v4;
  return [(NSArray *)self->_namespaces hash] + 37 * v5;
}

- (TRIExperimentAllocationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v5)
  {
    id v29 = 0;
    v6 = +[TRIPBMessage parseFromData:v5 error:&v29];
    id v7 = v29;
    if (!v6)
    {
      [v4 failWithError:v7];
      goto LABEL_15;
    }
    if ([v6 hasCommon])
    {
      v8 = [v6 common];
      if ([v8 hasType])
      {
        BOOL v9 = [v6 common];
        if ([v9 hasTimestamp]
          && [v6 hasExperimentId]
          && ([v6 hasDeploymentId] & 1) != 0)
        {
          int v10 = [v6 hasTreatmentId];

          if (v10)
          {
            uint64_t v23 = 0;
            v24 = &v23;
            uint64_t v25 = 0x3032000000;
            objc_super v26 = __Block_byref_object_copy__7;
            v27 = __Block_byref_object_dispose__7;
            id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "namespaceArray_Count"));
            BOOL v11 = [v6 namespaceArray];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __47__TRIExperimentAllocationStatus_initWithCoder___block_invoke;
            v22[3] = &unk_1E596B170;
            v22[4] = &v23;
            [v11 enumerateObjectsUsingBlock:v22];

            if (v24[5])
            {
              v21 = [v6 common];
              unsigned __int8 v19 = [v21 type];
              v20 = [v6 common];
              uint64_t v12 = [v20 timestamp];
              objc_super v13 = [v12 date];
              id v14 = [v6 experimentId];
              uint64_t v15 = [v6 deploymentId];
              id v16 = [v6 treatmentId];
              self = [(TRIExperimentAllocationStatus *)self initWithType:v19 date:v13 experimentId:v14 deploymentId:v15 treatmentId:v16 namespaces:v24[5]];

              id v17 = self;
            }
            else
            {
              id v17 = 0;
            }
            _Block_object_dispose(&v23, 8);

            goto LABEL_16;
          }
          goto LABEL_15;
        }
      }
    }
LABEL_15:
    id v17 = 0;
LABEL_16:

    goto LABEL_17;
  }
  id v17 = 0;
LABEL_17:

  return v17;
}

void __47__TRIExperimentAllocationStatus_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if [v11 hasName] && (objc_msgSend(v11, "hasCompatibilityVersion"))
  {
    v6 = [TRIVersionedNamespace alloc];
    id v7 = [v11 name];
    v8 = -[TRIVersionedNamespace initWithName:compatibilityVersion:](v6, "initWithName:compatibilityVersion:", v7, [v11 compatibilityVersion]);

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    *a4 = 1;
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [(TRIAllocationStatus *)self type];
  v6 = [v4 common];
  [v6 setType:v5];

  id v7 = objc_alloc(MEMORY[0x1E4FB05F0]);
  v8 = [(TRIAllocationStatus *)self date];
  uint64_t v9 = (void *)[v7 initWithDate:v8];
  int v10 = [v4 common];
  [v10 setTimestamp:v9];

  [v4 setExperimentId:self->_experimentId];
  [v4 setDeploymentId:self->_deploymentId];
  [v4 setTreatmentId:self->_treatmentId];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = self->_namespaces;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v17 = objc_opt_new();
        v18 = [v16 name];
        [v17 setName:v18];

        objc_msgSend(v17, "setCompatibilityVersion:", objc_msgSend(v16, "compatibilityVersion"));
        unsigned __int8 v19 = [v4 namespaceArray];
        [v19 addObject:v17];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  v20 = [v4 data];
  if (!v20)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 947, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  [v23 encodeObject:v20 forKey:@"data"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end