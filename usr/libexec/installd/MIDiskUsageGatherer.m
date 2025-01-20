@interface MIDiskUsageGatherer
- (BOOL)calcDynamic;
- (BOOL)calcShared;
- (BOOL)calcStatic;
- (MIDiskUsageGatherer)initWithIdentifiers:(id)a3 options:(id)a4;
- (NSArray)identifiers;
- (id)_gatherForIdentifier:(id)a3;
- (id)gatherUsageInfoWithError:(id *)a3;
@end

@implementation MIDiskUsageGatherer

- (MIDiskUsageGatherer)initWithIdentifiers:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MIDiskUsageGatherer;
  v9 = [(MIDiskUsageGatherer *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifiers, a3);
    v11 = [v8 objectForKeyedSubscript:@"DynamicDiskUsage"];
    v10->_calcDynamic = sub_100014D34(v11, 0);

    v12 = [v8 objectForKeyedSubscript:@"SharedDiskUsage"];
    v10->_calcShared = sub_100014D34(v12, 0);

    v13 = [v8 objectForKeyedSubscript:@"StaticDiskUsage"];
    v10->_calcStatic = sub_100014D34(v13, 0);
  }
  return v10;
}

- (id)_gatherForIdentifier:(id)a3
{
  id v26 = a3;
  sub_100054F80(v26);
  unsigned int v4 = [(MIDiskUsageGatherer *)self calcDynamic];
  unsigned int v5 = [(MIDiskUsageGatherer *)self calcShared];
  unsigned int v6 = [(MIDiskUsageGatherer *)self calcStatic];
  uint64_t v7 = 2;
  if (!v4) {
    uint64_t v7 = 0;
  }
  if (v5) {
    v7 |= 8uLL;
  }
  id v31 = 0;
  id v8 = +[MIContainer allContainersForAllPersonasForIdentifier:v26 options:v7 | v6 error:&v31];
  id v25 = v31;
  if (v8)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    id v24 = v8;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    if (v10)
    {
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([(MIDiskUsageGatherer *)self calcStatic]
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v13 += (uint64_t)[v16 diskUsage];
          }
          else if ([(MIDiskUsageGatherer *)self calcShared] {
                 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          }
          {
            v11 += (uint64_t)[v16 diskUsage];
          }
          else if ([(MIDiskUsageGatherer *)self calcDynamic])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v12 += (uint64_t)[v16 diskUsage];
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }

    id v8 = v24;
    v17 = objc_opt_new();
    if ([(MIDiskUsageGatherer *)self calcStatic])
    {
      v18 = +[NSNumber numberWithUnsignedLongLong:v13];
      [v17 setObject:v18 forKeyedSubscript:@"StaticDiskUsage"];
    }
    if ([(MIDiskUsageGatherer *)self calcDynamic])
    {
      v19 = +[NSNumber numberWithUnsignedLongLong:v12];
      [v17 setObject:v19 forKeyedSubscript:@"DynamicDiskUsage"];
    }
    if ([(MIDiskUsageGatherer *)self calcShared])
    {
      v20 = +[NSNumber numberWithUnsignedLongLong:v11];
      [v17 setObject:v20 forKeyedSubscript:@"SharedDiskUsage"];
    }
    int v21 = 0;
  }
  else
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      MOLogWrite();
    }
    int v21 = 8;
  }

  sub_1000550D8(v26);
  if ((v21 | 8) == 8)
  {
    v22 = v25;
    id v8 = [v17 copy];
  }
  else
  {
    v22 = v25;
  }

  return v8;
}

- (id)gatherUsageInfoWithError:(id *)a3
{
  unsigned int v5 = objc_opt_new();
  if (![(MIDiskUsageGatherer *)self calcDynamic]
    && ![(MIDiskUsageGatherer *)self calcStatic]
    && ![(MIDiskUsageGatherer *)self calcShared])
  {
    objc_super v15 = sub_100014A08((uint64_t)"-[MIDiskUsageGatherer gatherUsageInfoWithError:]", 138, MIInstallerErrorDomain, 25, 0, 0, @"No usage type to fetch specified.", v6, v17);
    id v14 = 0;
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(MIDiskUsageGatherer *)self identifiers];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [(MIDiskUsageGatherer *)self _gatherForIdentifier:v12];
          if (v13) {
            [v5 setObject:v13 forKeyedSubscript:v12];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v14 = v5;
  objc_super v15 = 0;
  if (a3)
  {
LABEL_16:
    if (!v14) {
      *a3 = v15;
    }
  }
LABEL_18:

  return v14;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)calcStatic
{
  return self->_calcStatic;
}

- (BOOL)calcDynamic
{
  return self->_calcDynamic;
}

- (BOOL)calcShared
{
  return self->_calcShared;
}

- (void).cxx_destruct
{
}

@end