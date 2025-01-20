@interface SDAirDropDiscoveryLogger
+ (id)discoverabilityMetricsForNode:(__SFNode *)a3;
+ (id)updateMetrics:(id)a3 withNode:(__SFNode *)a4;
- (NSMutableDictionary)realNameToMetricsMap;
- (SDAirDropDiscoveryLogger)init;
- (void)logMetricsWithSessionTime:(double)a3;
- (void)setRealNameToMetricsMap:(id)a3;
- (void)updateWithAirDropNodes:(id)a3;
@end

@implementation SDAirDropDiscoveryLogger

- (SDAirDropDiscoveryLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDAirDropDiscoveryLogger;
  v2 = [(SDAirDropDiscoveryLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    realNameToMetricsMap = v2->_realNameToMetricsMap;
    v2->_realNameToMetricsMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)updateWithAirDropNodes:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        v10 = (void *)SFNodeCopyRealName();
        v11 = [(NSMutableDictionary *)self->_realNameToMetricsMap objectForKeyedSubscript:v10];
        if (!v11) {
          v11 = objc_opt_new();
        }
        v12 = +[SDAirDropDiscoveryLogger updateMetrics:v11 withNode:v9];

        [(NSMutableDictionary *)self->_realNameToMetricsMap setObject:v12 forKeyedSubscript:v10];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)logMetricsWithSessionTime:(double)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableDictionary *)self->_realNameToMetricsMap allValues];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v9);
        CFStringRef v17 = @"sessionTime";
        if (a3 == 0.0)
        {
          v11 = &off_100902BF8;
        }
        else
        {
          uint64_t v3 = +[NSNumber numberWithDouble:a3];
          v11 = v3;
        }
        v18 = v11;
        v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        [v10 addEntriesFromDictionary:v12];

        if (a3 != 0.0) {
        SFMetricsLog();
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

+ (id)updateMetrics:(id)a3 withNode:(__SFNode *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"contactLevel"];
  if (v6) {
    uint64_t v7 = (uint64_t)v6;
  }
  else {
    uint64_t v7 = -1;
  }
  uint64_t v51 = v7;

  uint64_t v8 = [v5 objectForKeyedSubscript:@"foundBonjour"];
  unsigned int v54 = [v8 BOOLValueSafe];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"foundRapport"];
  unsigned int v55 = [v9 BOOLValueSafe];

  v10 = [v5 objectForKeyedSubscript:@"rpFlagMyiCloud"];
  id v11 = [v10 BOOLValueSafe];

  v12 = [v5 objectForKeyedSubscript:@"rpFlagFriend"];
  id v13 = [v12 BOOLValueSafe];

  long long v14 = [v5 objectForKeyedSubscript:@"rpFlagFamily"];
  id v15 = [v14 BOOLValueSafe];

  long long v16 = [v5 objectForKeyedSubscript:@"rpFlagSharedHome"];
  id v17 = [v16 BOOLValueSafe];

  v18 = [v5 objectForKeyedSubscript:@"rpFlagStranger"];
  id v19 = [v18 BOOLValueSafe];

  v20 = (void *)SFNodeCopySiblingNodes();
  id v21 = [v20 mutableCopy];

  if (!v21) {
    id v21 = [objc_alloc((Class)NSArray) initWithObjects:a4, 0];
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v21;
  id v52 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v52)
  {
    id v46 = v5;
    v22 = 0;
    v23 = 0;
    uint64_t v50 = *(void *)v57;
    uint64_t v49 = kSFNodeKindBonjour;
    uint64_t v48 = kSFNodeKindRapport;
    do
    {
      v24 = 0;
      v25 = v22;
      v26 = v23;
      do
      {
        if (*(void *)v57 != v50) {
          objc_enumerationMutation(obj);
        }
        if (*(void *)(*((void *)&v56 + 1) + 8 * (void)v24))
        {
          char v53 = (char)v11;
          char v27 = (char)v13;
          char v28 = (char)v15;
          char v29 = (char)v17;
          char v30 = (char)v19;
          char v31 = sub_10005068C();
          v32 = (void *)SFNodeCopyContactIdentifier();
          v33 = (void *)SFNodeCopyUserName();
          uint64_t v34 = 2;
          if (!v33) {
            uint64_t v34 = 3;
          }
          if (v32) {
            uint64_t v34 = 1;
          }
          BOOL v35 = (v31 & 1) == 0;
          LOBYTE(v19) = v30;
          LOBYTE(v17) = v29;
          LOBYTE(v15) = v28;
          LOBYTE(v13) = v27;
          LOBYTE(v11) = v53;
          if (!v35) {
            uint64_t v34 = 0;
          }
          uint64_t v51 = v34;
        }
        else
        {
          uint64_t v51 = -1;
        }
        v23 = (void *)SFNodeCopyKinds();

        v54 |= [v23 containsObject:v49];
        v55 |= [v23 containsObject:v48];
        v22 = (void *)SFNodeCopyRapportFlags();

        unsigned __int16 v36 = (unsigned __int16)[v22 unsignedIntegerValue];
        id v11 = (id)((v36 | v11) & 1);
        id v13 = (id)(v13 & 1u | ((v36 & 4) != 0));
        id v15 = (id)(v15 & 1u | ((v36 & 8) != 0));
        id v17 = (id)(v17 & 1u | ((v36 & 0x40) != 0));
        id v19 = (id)((v19 | HIBYTE(v36)) & 1);
        v24 = (char *)v24 + 1;
        v25 = v22;
        v26 = v23;
      }
      while (v52 != v24);
      id v52 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v52);

    id v5 = v46;
  }

  v37 = +[NSNumber numberWithInteger:v51];
  [v5 setObject:v37 forKeyedSubscript:@"contactLevel"];

  v38 = +[NSNumber numberWithBool:v54 & 1];
  [v5 setObject:v38 forKeyedSubscript:@"foundBonjour"];

  v39 = +[NSNumber numberWithBool:v55 & 1];
  [v5 setObject:v39 forKeyedSubscript:@"foundRapport"];

  v40 = +[NSNumber numberWithBool:v11];
  [v5 setObject:v40 forKeyedSubscript:@"rpFlagMyiCloud"];

  v41 = +[NSNumber numberWithBool:v13];
  [v5 setObject:v41 forKeyedSubscript:@"rpFlagFriend"];

  v42 = +[NSNumber numberWithBool:v15];
  [v5 setObject:v42 forKeyedSubscript:@"rpFlagFamily"];

  v43 = +[NSNumber numberWithBool:v17];
  [v5 setObject:v43 forKeyedSubscript:@"rpFlagSharedHome"];

  v44 = +[NSNumber numberWithBool:v19];
  [v5 setObject:v44 forKeyedSubscript:@"rpFlagStranger"];

  return v5;
}

+ (id)discoverabilityMetricsForNode:(__SFNode *)a3
{
  id v4 = objc_opt_new();
  id v5 = +[SDAirDropDiscoveryLogger updateMetrics:v4 withNode:a3];

  return v5;
}

- (NSMutableDictionary)realNameToMetricsMap
{
  return self->_realNameToMetricsMap;
}

- (void)setRealNameToMetricsMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end