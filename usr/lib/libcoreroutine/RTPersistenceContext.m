@interface RTPersistenceContext
- (BOOL)_processError:(id *)a3;
- (BOOL)_shouldExecute:(id *)a3;
- (BOOL)allowTombstones;
- (BOOL)save:(id *)a3;
- (BOOL)shouldSubstituteVariables:(id)a3 inPredicate:(id)a4 entityName:(id)a5 model:(id)a6;
- (BOOL)validateEntityName:(id)a3 inModel:(id)a4;
- (RTPersistenceContext)initWithConcurrencyType:(unint64_t)a3;
- (RTPersistenceContext)initWithConcurrencyType:(unint64_t)a3 options:(unint64_t)a4;
- (RTPersistenceContextDelegate)delegate;
- (RTPredicateInspector)predicateInspector;
- (id)executeFetchRequest:(id)a3 error:(id *)a4;
- (id)executeRequest:(id)a3 error:(id *)a4;
- (id)predicateWithDefaultSubstitutionVariables:(id)a3;
- (id)substitutionVariableKeys;
- (int64_t)mirroringQualityOfService;
- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4;
- (unint64_t)options;
- (void)_updateRequest:(id *)a3 includingContextOptions:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setMirroringQualityOfService:(int64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPredicateInspector:(id)a3;
@end

@implementation RTPersistenceContext

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(RTPersistenceContext *)self _shouldExecute:a4])
  {
    v7 = [(RTPersistenceContext *)self substitutionVariableKeys];
    v8 = [(RTPersistenceContext *)self persistentStoreCoordinator];
    v9 = [v8 managedObjectModel];

    v10 = [v6 predicate];
    v11 = [v6 entityName];
    BOOL v12 = [(RTPersistenceContext *)self shouldSubstituteVariables:v7 inPredicate:v10 entityName:v11 model:v9];

    if (v12)
    {
      v13 = [v6 predicate];
      v14 = [(RTPersistenceContext *)self predicateWithDefaultSubstitutionVariables:v13];
      [v6 setPredicate:v14];
    }
    id v23 = v6;
    [(RTPersistenceContext *)self _updateRequest:&v23 includingContextOptions:[(RTPersistenceContext *)self options]];
    id v15 = v23;

    v21.receiver = self;
    v21.super_class = (Class)RTPersistenceContext;
    id v22 = 0;
    v16 = [(RTPersistenceContext *)&v21 executeFetchRequest:v15 error:&v22];
    id v17 = v22;
    id v20 = v17;
    [(RTPersistenceContext *)self _processError:&v20];
    id v18 = v20;

    if (a4) {
      *a4 = v18;
    }

    id v6 = v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)_shouldExecute:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([WeakRetained persistenceContextShouldExecute:self] & 1) != 0
    || (self->_options & 1) != 0)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Request execution is unavailable.";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v6];
    v8 = v7;
    if (a3) {
      *a3 = v7;
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_processError:(id *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!a3 || !*a3) {
    return 0;
  }
  id v5 = *a3;
  id v6 = [(RTPersistenceContext *)self delegate];
  [v6 persistenceContext:self encounteredError:v5];

  v7 = [v5 localizedDescription];
  v8 = v7;
  if (v7)
  {
    BOOL v9 = v7;
  }
  else
  {
    BOOL v9 = [v5 description];
  }
  uint64_t v11 = v9;

  if (v11) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = @"no description";
  }
  uint64_t v21 = *MEMORY[0x1E4F28568];
  v22[0] = v12;
  BOOL v10 = 1;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v14 = (void *)MEMORY[0x1E4F28C58];
  id v15 = [v5 domain];
  v16 = [v14 errorWithDomain:v15 code:[v5 code] userInfo:v13];

  uint64_t v19 = *MEMORY[0x1E4F28A50];
  id v20 = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v17];

  return v10;
}

- (id)substitutionVariableKeys
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(RTPersistenceContext *)self options])
  {
    v7 = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v9 = @"RT_CURRENT_DEVICE";
    v4 = [(NSManagedObjectContext *)self currentDevice];
    v10[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = [v5 allKeys];
    v7 = [v3 setWithArray:v6];
  }

  return v7;
}

- (BOOL)shouldSubstituteVariables:(id)a3 inPredicate:(id)a4 entityName:(id)a5 model:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  predicateInspector = self->_predicateInspector;
  if (!predicateInspector)
  {
    id v15 = (RTPredicateInspector *)objc_opt_new();
    v16 = self->_predicateInspector;
    self->_predicateInspector = v15;

    predicateInspector = self->_predicateInspector;
  }
  BOOL v17 = [(RTPredicateInspector *)predicateInspector predicate:v11 referencesSubstitutionVariablesFromSet:v10];
  BOOL v18 = v17 & [(RTPersistenceContext *)self validateEntityName:v12 inModel:v13];

  return v18;
}

- (BOOL)validateEntityName:(id)a3 inModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:@"RT"])
  {
    v7 = [v6 entitiesByName];
    v8 = [v7 objectForKeyedSubscript:v5];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_updateRequest:(id *)a3 includingContextOptions:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v6 = *a3;
        goto LABEL_8;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [*a3 fetchRequest];
        id v6 = (id)[v7 copy];

LABEL_8:
        v8 = +[RTCloudManagedObject entityNamesEligibleForDeletionByOtherDevices];
        BOOL v9 = [v6 entityName];
        int v10 = [v8 containsObject:v9];

        if (v10)
        {
          id v11 = [v6 predicate];
          id v12 = [v11 predicateFormat];
          id v13 = +[RTCloudManagedObject notTombstonedPredicate];
          v14 = [v13 predicateFormat];
          char v15 = [v12 containsString:v14];

          if (v15)
          {
LABEL_16:

            return;
          }
          if (![(RTPersistenceContext *)self allowTombstones])
          {
            v16 = [v6 predicate];

            if (v16)
            {
              BOOL v17 = (void *)MEMORY[0x1E4F28BA0];
              BOOL v18 = [v6 predicate];
              uint64_t v19 = +[RTCloudManagedObject notTombstonedPredicate];
              v28[1] = v19;
              id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
              uint64_t v21 = [v17 andPredicateWithSubpredicates:v20];
              [v6 setPredicate:v21];
            }
            else
            {
              id v22 = +[RTCloudManagedObject notTombstonedPredicate];
              [v6 setPredicate:v22];
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v6];
          [v23 setResultType:[*a3 resultType]];
          id v24 = v23;
          *a3 = v24;
        }
        goto LABEL_16;
      }
      v25 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138412290;
        v30 = v27;
        _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "unhandled request class, %@", buf, 0xCu);
      }
      __break(1u);
    }
  }
}

- (BOOL)allowTombstones
{
  return ([(RTPersistenceContext *)self options] >> 1) & 1;
}

- (BOOL)save:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (-[RTPersistenceContext _shouldExecute:](self, "_shouldExecute:"))
  {
    id v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    BOOL v9 = NSStringFromSelector(a2);
    id v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];
    [v10 UTF8String];
    id v11 = (void *)os_transaction_create();

    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      uint64_t v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      __int16 v28 = 2112;
      v29 = v21;
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
    }
    v24.receiver = self;
    v24.super_class = (Class)RTPersistenceContext;
    id v25 = 0;
    unsigned int v13 = [(RTPersistenceContext *)&v24 save:&v25];
    id v14 = v25;
    id v15 = v14;
    if (v13 && !v14)
    {
      if ([(RTPersistenceContext *)self mirroringQualityOfService])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v23 = 0;
        LOBYTE(v13) = [WeakRetained persistenceContextPerformedSave:self error:&v23];
        id v15 = v23;
      }
      else
      {
        id v15 = 0;
        LOBYTE(v13) = 1;
      }
    }
    id v22 = v15;
    [(RTPersistenceContext *)self _processError:&v22];
    id v17 = v22;

    if (a3) {
      *a3 = v17;
    }
    [(RTPersistenceContext *)self setMirroringQualityOfService:0];
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (void)setMirroringQualityOfService:(int64_t)a3
{
  self->_mirroringQualityOfService = a3;
}

- (int64_t)mirroringQualityOfService
{
  return self->_mirroringQualityOfService;
}

- (RTPersistenceContext)initWithConcurrencyType:(unint64_t)a3
{
  return [(RTPersistenceContext *)self initWithConcurrencyType:a3 options:0];
}

- (RTPersistenceContext)initWithConcurrencyType:(unint64_t)a3 options:(unint64_t)a4
{
  if (a4 > 3)
  {
    id v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RTPersistenceContext;
    id v5 = [(RTPersistenceContext *)&v8 initWithConcurrencyType:a3];
    if (v5) {
      v5->_options = a4;
    }
    self = v5;
    id v6 = self;
  }

  return v6;
}

- (id)predicateWithDefaultSubstitutionVariables:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v9 = @"RT_CURRENT_DEVICE";
  id v4 = a3;
  id v5 = [(NSManagedObjectContext *)self currentDevice];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 predicateWithSubstitutionVariables:v6];

  return v7;
}

- (id)executeRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && ![(RTPersistenceContext *)self _shouldExecute:a4])
  {
    id v17 = 0;
    goto LABEL_20;
  }
  v7 = [(RTPersistenceContext *)self substitutionVariableKeys];
  objc_super v8 = [(RTPersistenceContext *)self persistentStoreCoordinator];
  BOOL v9 = [v8 managedObjectModel];

  if ([v6 requestType] == 1)
  {
    id v10 = [v6 predicate];
    id v11 = [v6 entityName];
    if ([(RTPersistenceContext *)self shouldSubstituteVariables:v7 inPredicate:v10 entityName:v11 model:v9])
    {
      id v12 = [v6 predicate];
      unsigned int v13 = [(RTPersistenceContext *)self predicateWithDefaultSubstitutionVariables:v12];
      [v6 setPredicate:v13];
    }
    id v35 = v6;
    id v14 = &v35;
LABEL_16:
    [(RTPersistenceContext *)self _updateRequest:v14 includingContextOptions:[(RTPersistenceContext *)self options]];
    id v25 = *v14;

    id v6 = v25;
    goto LABEL_17;
  }
  if ([v6 requestType] == 6)
  {
    id v10 = [v6 predicate];
    id v11 = [v6 entityName];
    if ([(RTPersistenceContext *)self shouldSubstituteVariables:v7 inPredicate:v10 entityName:v11 model:v9])
    {
      id v15 = [v6 predicate];
      v16 = [(RTPersistenceContext *)self predicateWithDefaultSubstitutionVariables:v15];
      [v6 setPredicate:v16];
    }
    id v34 = v6;
    id v14 = &v34;
    goto LABEL_16;
  }
  if ([v6 requestType] == 7)
  {
    BOOL v18 = [v6 fetchRequest];
    id v10 = [v18 predicate];

    uint64_t v19 = [v6 fetchRequest];
    id v11 = [v19 entityName];

    if ([(RTPersistenceContext *)self shouldSubstituteVariables:v7 inPredicate:v10 entityName:v11 model:v9])
    {
      id v20 = [v6 fetchRequest];
      v29 = (void *)[v20 copy];

      uint64_t v21 = [v6 fetchRequest];
      id v22 = [v21 predicate];
      id v23 = [(RTPersistenceContext *)self predicateWithDefaultSubstitutionVariables:v22];
      [v29 setPredicate:v23];

      objc_super v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v29];
      [v24 setResultType:[v6 resultType]];

      id v6 = v24;
    }
    id v33 = v6;
    id v14 = &v33;
    goto LABEL_16;
  }
LABEL_17:
  v31.receiver = self;
  v31.super_class = (Class)RTPersistenceContext;
  id v32 = 0;
  id v17 = [(RTPersistenceContext *)&v31 executeRequest:v6 error:&v32];
  id v26 = v32;
  id v30 = v26;
  [(RTPersistenceContext *)self _processError:&v30];
  id v27 = v30;

  if (a4) {
    *a4 = v27;
  }

LABEL_20:

  return v17;
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(RTPersistenceContext *)self _shouldExecute:a4])
  {
    v7 = [(RTPersistenceContext *)self substitutionVariableKeys];
    objc_super v8 = [(RTPersistenceContext *)self persistentStoreCoordinator];
    BOOL v9 = [v8 managedObjectModel];

    id v10 = [v6 predicate];
    id v11 = [v6 entityName];
    BOOL v12 = [(RTPersistenceContext *)self shouldSubstituteVariables:v7 inPredicate:v10 entityName:v11 model:v9];

    if (v12)
    {
      unsigned int v13 = [v6 predicate];
      id v14 = [(RTPersistenceContext *)self predicateWithDefaultSubstitutionVariables:v13];
      [v6 setPredicate:v14];
    }
    id v23 = v6;
    [(RTPersistenceContext *)self _updateRequest:&v23 includingContextOptions:[(RTPersistenceContext *)self options]];
    id v15 = v23;

    v21.receiver = self;
    v21.super_class = (Class)RTPersistenceContext;
    id v22 = 0;
    id v16 = [(RTPersistenceContext *)&v21 countForFetchRequest:v15 error:&v22];
    id v17 = v22;
    id v20 = v17;
    [(RTPersistenceContext *)self _processError:&v20];
    id v18 = v20;

    if (a4) {
      *a4 = v18;
    }

    id v6 = v15;
  }
  else
  {
    id v16 = 0;
  }

  return (unint64_t)v16;
}

- (RTPersistenceContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTPersistenceContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RTPredicateInspector)predicateInspector
{
  return self->_predicateInspector;
}

- (void)setPredicateInspector:(id)a3
{
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateInspector, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end