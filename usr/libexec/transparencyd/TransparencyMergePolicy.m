@interface TransparencyMergePolicy
- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4;
- (TransparencyMergePolicy)init;
- (void)updateDeviceRecord:(id)a3 withConflictingDevice:(id)a4;
- (void)updateMutation:(id)a3 withConflictingMutation:(id)a4;
- (void)updateTreeHead:(id)a3 withConflictingHead:(id)a4;
@end

@implementation TransparencyMergePolicy

- (TransparencyMergePolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)TransparencyMergePolicy;
  return [(TransparencyMergePolicy *)&v3 initWithMergeType:1];
}

- (void)updateTreeHead:(id)a3 withConflictingHead:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 failures];
  [v5 addFailures:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = [v6 failures];
  v9 = [v8 allObjects];

  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) setSth:v5];
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  v14 = [v6 failureEvent];
  [v5 setFailureEvent:v14];

  v15 = [v6 failureEvent];
  [v15 setSth:v5];

  if ([v5 inclusionVerified] == (id)2) {
    [v5 setInclusionVerified:[v6 inclusionVerified]];
  }
  if ([v5 consistencyVerified] == (id)2) {
    [v5 setConsistencyVerified:[v6 consistencyVerified]];
  }
  if ([v5 mmdVerified] == (id)2) {
    [v5 setMmdVerified:[v6 mmdVerified]];
  }
  v16 = [v5 sth];
  v17 = [v6 sth];
  unsigned __int8 v18 = [v16 isEqualToData:v17];

  id v19 = [v5 signatureVerified];
  if (v18)
  {
    if (v19 != (id)2) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v19 != (id)1 && [v6 signatureVerified] == (id)1)
  {
    v20 = [v6 sth];
    [v5 setSth:v20];

LABEL_20:
    [v5 setSignatureVerified:[v6 signatureVerified]];
  }
LABEL_21:
}

- (void)updateDeviceRecord:(id)a3 withConflictingDevice:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  id v6 = [v5 request];
  v7 = [v6 responseTime];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;
  id v10 = [v16 request];
  id v11 = [v10 responseTime];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  if (v9 > v13)
  {
    v14 = [v5 loggableData];
    [v16 setLoggableData:v14];

    v15 = [v5 request];
    [v16 setRequest:v15];
  }
}

- (void)updateMutation:(id)a3 withConflictingMutation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 failures];
  [v5 addFailures:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v8 = [v6 failures];
  double v9 = [v8 allObjects];

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      double v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v13) setMutation:v5];
        double v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v14 = [v6 failureEvent];

  if (v14)
  {
    v15 = [v6 failureEvent];
    [v5 setFailureEvent:v15];

    id v16 = [v6 failureEvent];
    [v16 setMutation:v5];
  }
  if ([v5 signatureResult] == (id)2) {
    [v5 setSignatureResult:[v6 signatureResult]];
  }
  if ([v5 mergeResult] == (id)2) {
    [v5 setMergeResult:[v6 mergeResult]];
  }
}

- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4
{
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = a3;
  id v5 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v45 = *(void *)v60;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        double v9 = [v8 databaseObject];
        id v10 = [v9 entity];
        id v11 = +[KTTreeHead entity];
        unsigned int v12 = [v10 isKindOfEntity:v11];

        double v13 = [v8 databaseObject];
        v14 = v13;
        if (v12)
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v15 = [v8 conflictingObjects];
          id v16 = [v15 countByEnumeratingWithState:&v55 objects:v65 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v56;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v56 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(id *)(*((void *)&v55 + 1) + 8 * (void)j);
                [(TransparencyMergePolicy *)self updateTreeHead:v14 withConflictingHead:v20];
                long long v21 = [v20 managedObjectContext];
                [v21 deleteObject:v20];
              }
              id v17 = [v15 countByEnumeratingWithState:&v55 objects:v65 count:16];
            }
            while (v17);
          }
        }
        else
        {
          long long v22 = [v13 entity];
          long long v23 = +[KTDeviceRecord entity];
          unsigned int v24 = [v22 isKindOfEntity:v23];

          v25 = [v8 databaseObject];
          v14 = v25;
          if (v24)
          {
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            v15 = [v8 conflictingObjects];
            id v26 = [v15 countByEnumeratingWithState:&v51 objects:v64 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v52;
              do
              {
                for (k = 0; k != v27; k = (char *)k + 1)
                {
                  if (*(void *)v52 != v28) {
                    objc_enumerationMutation(v15);
                  }
                  id v30 = *(id *)(*((void *)&v51 + 1) + 8 * (void)k);
                  [(TransparencyMergePolicy *)self updateDeviceRecord:v14 withConflictingDevice:v30];
                  v31 = [v30 managedObjectContext];
                  [v31 deleteObject:v30];
                }
                id v27 = [v15 countByEnumeratingWithState:&v51 objects:v64 count:16];
              }
              while (v27);
            }
          }
          else
          {
            v32 = [v25 entity];
            v33 = +[KTMutation entity];
            unsigned int v34 = [v32 isKindOfEntity:v33];

            if (!v34) {
              continue;
            }
            v14 = [v8 databaseObject];
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            v15 = [v8 conflictingObjects];
            id v35 = [v15 countByEnumeratingWithState:&v47 objects:v63 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v48;
              do
              {
                for (m = 0; m != v36; m = (char *)m + 1)
                {
                  if (*(void *)v48 != v37) {
                    objc_enumerationMutation(v15);
                  }
                  id v39 = *(id *)(*((void *)&v47 + 1) + 8 * (void)m);
                  [(TransparencyMergePolicy *)self updateMutation:v14 withConflictingMutation:v39];
                  v40 = [v39 managedObjectContext];
                  [v40 deleteObject:v39];
                }
                id v36 = [v15 countByEnumeratingWithState:&v47 objects:v63 count:16];
              }
              while (v36);
            }
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v6);
  }
  v46.receiver = self;
  v46.super_class = (Class)TransparencyMergePolicy;
  BOOL v41 = [(TransparencyMergePolicy *)&v46 resolveConstraintConflicts:obj error:a4];

  return v41;
}

@end