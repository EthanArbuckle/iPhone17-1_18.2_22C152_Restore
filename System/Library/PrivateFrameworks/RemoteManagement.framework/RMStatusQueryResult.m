@interface RMStatusQueryResult
- (BOOL)hasStatusToReport;
- (NSDictionary)errorByKeyPath;
- (NSDictionary)statusByKeyPath;
- (NSSet)statusKeyPaths;
- (RMStatusQueryResult)init;
- (RMStatusQueryResult)initWithStatusKeyPaths:(id)a3 statusByKeyPath:(id)a4 errorByKeyPath:(id)a5;
- (id)protocolStatusReportWithFullReport:(BOOL)a3;
@end

@implementation RMStatusQueryResult

- (RMStatusQueryResult)init
{
  v3 = +[NSSet set];
  v4 = [(RMStatusQueryResult *)self initWithStatusKeyPaths:v3 statusByKeyPath:&__NSDictionary0__struct errorByKeyPath:&__NSDictionary0__struct];

  return v4;
}

- (RMStatusQueryResult)initWithStatusKeyPaths:(id)a3 statusByKeyPath:(id)a4 errorByKeyPath:(id)a5
{
  id v8 = a3;
  id v55 = a4;
  id v54 = a5;
  v69.receiver = self;
  v69.super_class = (Class)RMStatusQueryResult;
  v9 = [(RMStatusQueryResult *)&v69 init];
  if (v9)
  {
    v10 = (NSSet *)[v8 copy];
    statusKeyPaths = v9->_statusKeyPaths;
    v48 = v9;
    v9->_statusKeyPaths = v10;

    v12 = objc_opt_new();
    v52 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v49 = v8;
    id obj = v8;
    id v56 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v56)
    {
      uint64_t v53 = *(void *)v66;
      v51 = v12;
      do
      {
        for (i = 0; i != v56; i = (char *)i + 1)
        {
          if (*(void *)v66 != v53) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(id *)(*((void *)&v65 + 1) + 8 * i);
          v15 = (char *)[v14 rangeOfString:@"/"];
          if (v16)
          {
            v17 = v15;
            uint64_t v18 = v16;
            id v19 = [v14 substringToIndex:v15];
            id v20 = [v14 substringFromIndex:&v17[v18]];
          }
          else
          {
            id v19 = 0;
            id v20 = 0;
          }

          id v21 = v19;
          id v22 = v20;
          v23 = [v54 objectForKeyedSubscript:v14];
          if (v21)
          {
            v24 = [v55 valueForKeyPath:v21];
            v57 = [v24 allKeys];
            [v24 allValues];
            v26 = v25 = v23;
            v58 = v22;
            v27 = [v26 valueForKeyPath:v22];

            v28 = +[NSSet setWithArray:v27];
            v29 = +[NSNull null];
            v30 = +[NSSet setWithObject:v29];
            unsigned int v31 = [v28 isEqualToSet:v30];

            v23 = v25;
            if (v31 && v25)
            {
              [v52 setObject:v25 forKeyedSubscript:v14];
              v12 = v51;
              v32 = v57;
              id v22 = v58;
            }
            else
            {
              v12 = v51;
              sub_100034F1C(v51, v21);
              v35 = [v51 valueForKeyPath:v21];
              v59[0] = _NSConcreteStackBlock;
              v59[1] = 3221225472;
              v59[2] = sub_1000674C8;
              v59[3] = &unk_1000C6930;
              id v22 = v58;
              id v60 = v58;
              id v61 = v27;
              id v62 = v35;
              id v63 = v21;
              id v64 = v52;
              id v36 = v35;
              v32 = v57;
              [v57 enumerateObjectsUsingBlock:v59];
            }
          }
          else
          {
            v24 = [v55 valueForKeyPath:v14];
            if (v24) {
              BOOL v33 = 1;
            }
            else {
              BOOL v33 = v23 == 0;
            }
            if (v33)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v34 = [v24 copy];
                [v52 setObject:v34 forKeyedSubscript:v14];
              }
              else
              {
                v37 = +[RMJSONSerialization serializeValue:v24];
                if (v37)
                {
                  v38 = v23;
                  v39 = [v14 pathExtension];
                  id v40 = [v39 length];

                  if (v40)
                  {
                    v41 = [v14 stringByDeletingPathExtension];
                    sub_100034F1C(v12, v41);
                  }
                  [v12 setValue:v37 forKeyPath:v14];
                  v23 = v38;
                }
                else if (v24)
                {
                  v42 = +[RMErrorUtilities createUnsupportedStatusValueErrorWithKeyPath:v14];
                  [v52 setObject:v42 forKeyedSubscript:v14];
                }
              }
            }
            else
            {
              [v52 setObject:v23 forKeyedSubscript:v14];
            }
          }
        }
        id v56 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v56);
    }

    v43 = (NSDictionary *)[v12 copy];
    v9 = v48;
    statusByKeyPath = v48->_statusByKeyPath;
    v48->_statusByKeyPath = v43;

    v45 = (NSDictionary *)[v52 copy];
    errorByKeyPath = v48->_errorByKeyPath;
    v48->_errorByKeyPath = v45;

    id v8 = v49;
  }

  return v9;
}

- (BOOL)hasStatusToReport
{
  v3 = [(RMStatusQueryResult *)self statusByKeyPath];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(RMStatusQueryResult *)self errorByKeyPath];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (NSSet)statusKeyPaths
{
  return self->_statusKeyPaths;
}

- (NSDictionary)statusByKeyPath
{
  return self->_statusByKeyPath;
}

- (NSDictionary)errorByKeyPath
{
  return self->_errorByKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorByKeyPath, 0);
  objc_storeStrong((id *)&self->_statusByKeyPath, 0);

  objc_storeStrong((id *)&self->_statusKeyPaths, 0);
}

- (id)protocolStatusReportWithFullReport:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(RMStatusQueryResult *)self statusByKeyPath];
  v6 = [(RMStatusQueryResult *)self errorByKeyPath];
  if ([v6 count])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100067AF4;
    v12[3] = &unk_1000C6958;
    id v7 = (id)objc_opt_new();
    id v13 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }

  id v8 = +[RMModelAnyPayload buildFromDictionary:v5];
  v9 = +[NSNumber numberWithBool:v3];
  v10 = +[RMProtocolStatusReport requestWithStatusItems:v8 errors:v7 fullReport:v9];

  return v10;
}

@end