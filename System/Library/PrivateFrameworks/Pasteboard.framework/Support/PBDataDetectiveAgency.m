@interface PBDataDetectiveAgency
- (PBDataDetectiveAgency)initWithDetectives:(id)a3;
- (id)detectionsForPatterns:(id)a3 inValue:(id)a4;
@end

@implementation PBDataDetectiveAgency

- (PBDataDetectiveAgency)initWithDetectives:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBDataDetectiveAgency;
  v5 = [(PBDataDetectiveAgency *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    detectives = v5->_detectives;
    v5->_detectives = v6;
  }
  return v5;
}

- (id)detectionsForPatterns:(id)a3 inValue:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v14 = +[PBItemDetection detectionAbsent];
        [v7 setObject:v14 forKeyedSubscript:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v10);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v15 = self->_detectives;
  id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        v21 = objc_msgSend(v20, "patterns", v25);
        unsigned int v22 = [v21 intersectsSet:v8];

        if (v22)
        {
          v23 = [v20 detectedPatternValuesInValue:v25];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_100013428;
          v26[3] = &unk_1000317F8;
          id v27 = v7;
          [v23 enumerateKeysAndObjectsUsingBlock:v26];
        }
      }
      id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v17);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end