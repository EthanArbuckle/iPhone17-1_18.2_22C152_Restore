@interface SRSubsystemCategoryNameFilter
- (BOOL)shouldReportObject:(id)a3;
- (FilterTier)filterTreeRoot;
- (SRSubsystemCategoryNameFilter)initWithDictionaryArray:(id)a3;
- (id)downsampleEntryForObject:(id)a3;
- (void)addEntryWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 cap:(unint64_t)a6 downsampleRatio:(unint64_t)a7;
@end

@implementation SRSubsystemCategoryNameFilter

- (SRSubsystemCategoryNameFilter)initWithDictionaryArray:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_24:
    v19 = 0;
    goto LABEL_25;
  }
  v45.receiver = self;
  v45.super_class = (Class)SRSubsystemCategoryNameFilter;
  self = [(SRSubsystemCategoryNameFilter *)&v45 init];
  if (!self) {
    goto LABEL_14;
  }
  v5 = objc_alloc_init(FilterRootTier);
  filterTreeRoot = self->_filterTreeRoot;
  self->_filterTreeRoot = &v5->super;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (!v7) {
    goto LABEL_13;
  }
  id v8 = v7;
  id v37 = v4;
  uint64_t v9 = *(void *)v42;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v42 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      uint64_t v12 = [v11 objectForKeyedSubscript:@"Subsystem"];
      if (!v12)
      {
        v13 = sub_100002D74();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_1000095E4(v13, v20, v21, v22, v23, v24, v25, v26);
        }
        goto LABEL_23;
      }
      v13 = v12;
      uint64_t v14 = [v11 objectForKeyedSubscript:@"Cap"];
      if (!v14)
      {
        v27 = sub_100002D74();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          sub_10000961C(v27, v28, v29, v30, v31, v32, v33, v34);
        }

        goto LABEL_23;
      }
      v15 = (void *)v14;
      v16 = [v11 objectForKeyedSubscript:@"DownsampleRatio"];
      if (!v16)
      {
        v35 = sub_100002D74();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          sub_100009654(&buf, v40, v35);
        }

LABEL_23:
        id v4 = v37;

        goto LABEL_24;
      }
      v17 = [v11 objectForKeyedSubscript:@"Category"];
      v18 = [v11 objectForKeyedSubscript:@"Name"];
      -[SRSubsystemCategoryNameFilter addEntryWithSubsystem:category:name:cap:downsampleRatio:](self, "addEntryWithSubsystem:category:name:cap:downsampleRatio:", v13, v17, v18, [v15 unsignedLongLongValue], [v16 unsignedLongLongValue]);
    }
    id v8 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    id v4 = v37;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_13:

LABEL_14:
  self = self;
  v19 = self;
LABEL_25:

  return v19;
}

- (BOOL)shouldReportObject:(id)a3
{
  v3 = [(SRSubsystemCategoryNameFilter *)self downsampleEntryForObject:a3];
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 shouldReportThisTime];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (id)downsampleEntryForObject:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [FilterQuery alloc];
  v6 = [v4 subsystem];
  id v7 = [v4 category];
  id v8 = [v4 name];

  uint64_t v9 = [(FilterQuery *)v5 initWithSubsystem:v6 category:v7 name:v8];
  v10 = [(SRSubsystemCategoryNameFilter *)self filterTreeRoot];
  v11 = [v10 entryForQuery:v9];

  return v11;
}

- (void)addEntryWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 cap:(unint64_t)a6 downsampleRatio:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v16 = [[FilterQuery alloc] initWithSubsystem:v14 category:v13 name:v12];

  v15 = [(SRSubsystemCategoryNameFilter *)self filterTreeRoot];
  [v15 setCap:a6 downsampleRatio:a7 forQuery:v16];
}

- (FilterTier)filterTreeRoot
{
  return (FilterTier *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end