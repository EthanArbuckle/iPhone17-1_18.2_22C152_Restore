@interface NPNetworkInfo
+ (BOOL)supportsSecureCoding;
+ (int64_t)failureReasonToFallbackReason:(unsigned int)a3;
- (BOOL)hasIPv6;
- (BOOL)isLatency:(id)a3 qualifiedForLatencyMap:(id)a4 parameters:(networkParameters *)a5 requireUniqueEdges:(BOOL)a6;
- (BOOL)isProbeInProgress;
- (NPEdgeSelection)edgeSelection;
- (NPNetworkInfo)initWithCoder:(id)a3;
- (NSArray)currentLatencyMap;
- (NSArray)edgeLatencies;
- (NSDate)lastUsed;
- (NSDate)lastVisited;
- (NSDate)probeRateLimit;
- (NSString)lastUsedDesc;
- (NSString)lastVisitedDesc;
- (int64_t)compareLastVisited:(id)a3;
- (int64_t)lastFallbackReason;
- (void)encodeWithCoder:(id)a3;
- (void)handleTFOFailedForAddressFamily:(unsigned __int8)a3;
- (void)mergeNewLatencies:(id)a3 usingComparator:(id)a4;
- (void)rebuildLatencyMapWithViewSize:(id)a3 edgeCount:(unint64_t)a4 parameters:(networkParameters *)a5;
- (void)resortEdgeLatenciesUsingComparator:(id)a3;
- (void)setCurrentLatencyMap:(id)a3;
- (void)setEdgeLatencies:(id)a3;
- (void)setEdgeSelection:(id)a3;
- (void)setHasIPv6:(BOOL)a3;
- (void)setIsProbeInProgress:(BOOL)a3;
- (void)setLastFallbackReason:(int64_t)a3;
- (void)setLastUsed:(id)a3;
- (void)setLastVisited:(id)a3;
- (void)setProbeRateLimit:(id)a3;
@end

@implementation NPNetworkInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)failureReasonToFallbackReason:(unsigned int)a3
{
  if (a3 - 1 > 0x10) {
    return 14;
  }
  else {
    return qword_1A1093068[a3 - 1];
  }
}

- (NPNetworkInfo)initWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NPNetworkInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SignatureLastVisited"];
    lastVisited = v5->_lastVisited;
    v5->_lastVisited = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NetworkLastUsed"];
    lastUsed = v5->_lastUsed;
    v5->_lastUsed = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EdgeSelection"];
    edgeSelection = v5->_edgeSelection;
    v5->_edgeSelection = (NPEdgeSelection *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"EdgeLatencies"];
    edgeLatencies = v5->_edgeLatencies;
    v5->_edgeLatencies = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v20 = [v4 decodeObjectOfClasses:v19 forKey:@"CurrentLatencyMap"];

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProbeRateLimit"];
    probeRateLimit = v5->_probeRateLimit;
    v5->_probeRateLimit = (NSDate *)v21;

    uint64_t v23 = [v4 decodeInt32ForKey:@"LastFailureReason"];
    if (v23) {
      int64_t v24 = +[NPNetworkInfo failureReasonToFallbackReason:v23];
    }
    else {
      int64_t v24 = (int)[v4 decodeInt32ForKey:@"LastFallbackReason"];
    }
    v5->_lastFallbackReason = v24;
    v5->_isProbeInProgress = [v4 decodeBoolForKey:@"isProbeInProgress"];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v25 = v20;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = 0;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v25);
          }
          v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          unint64_t v32 = [v31 unsignedIntegerValue];
          if (v32 < [(NSArray *)v5->_edgeLatencies count])
          {
            if (!v28) {
              id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            v33 = -[NSArray objectAtIndexedSubscript:](v5->_edgeLatencies, "objectAtIndexedSubscript:", [v31 unsignedIntegerValue]);
            [v28 addObject:v33];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v27);
    }
    else
    {
      id v28 = 0;
    }

    if ([v28 count])
    {
      uint64_t v34 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v28];
      currentLatencyMap = v5->_currentLatencyMap;
      v5->_currentLatencyMap = (NSArray *)v34;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NPNetworkInfo *)self lastVisited];
  [v4 encodeObject:v5 forKey:@"SignatureLastVisited"];

  uint64_t v6 = [(NPNetworkInfo *)self lastUsed];
  [v4 encodeObject:v6 forKey:@"NetworkLastUsed"];

  v7 = [(NPNetworkInfo *)self edgeSelection];
  [v4 encodeObject:v7 forKey:@"EdgeSelection"];

  uint64_t v8 = [(NPNetworkInfo *)self edgeLatencies];
  [v4 encodeObject:v8 forKey:@"EdgeLatencies"];

  v9 = [(NPNetworkInfo *)self probeRateLimit];
  [v4 encodeObject:v9 forKey:@"ProbeRateLimit"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[NPNetworkInfo lastFallbackReason](self, "lastFallbackReason"), @"LastFallbackReason");
  id v25 = v4;
  objc_msgSend(v4, "encodeBool:forKey:", -[NPNetworkInfo isProbeInProgress](self, "isProbeInProgress"), @"isProbeInProgress");
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = [(NPNetworkInfo *)self currentLatencyMap];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v17 = [(NPNetworkInfo *)self edgeLatencies];
        uint64_t v18 = [v17 count];

        if (v18)
        {
          unint64_t v19 = 0;
          while (1)
          {
            v20 = [(NPNetworkInfo *)self edgeLatencies];
            uint64_t v21 = [v20 objectAtIndexedSubscript:v19];

            if (v16 == v21) {
              break;
            }
            ++v19;
            v22 = [(NPNetworkInfo *)self edgeLatencies];
            unint64_t v23 = [v22 count];

            if (v19 >= v23) {
              goto LABEL_14;
            }
          }
          if (!v13) {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          int64_t v24 = [NSNumber numberWithUnsignedInteger:v19];
          [v13 addObject:v24];
        }
LABEL_14:
        ;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
  }

  [v25 encodeObject:v13 forKey:@"CurrentLatencyMap"];
}

- (int64_t)compareLastVisited:(id)a3
{
  id v4 = a3;
  v5 = [(NPNetworkInfo *)self lastVisited];
  uint64_t v6 = [v4 lastVisited];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)lastVisitedDesc
{
  v3 = [(NPNetworkInfo *)self lastVisited];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [(NPNetworkInfo *)self lastVisited];
    uint64_t v6 = [v4 localizedStringFromDate:v5 dateStyle:1 timeStyle:2];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)lastUsedDesc
{
  v3 = [(NPNetworkInfo *)self lastUsed];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C10];
    v5 = [(NPNetworkInfo *)self lastUsed];
    uint64_t v6 = [v4 localizedStringFromDate:v5 dateStyle:1 timeStyle:2];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (void)resortEdgeLatenciesUsingComparator:(id)a3
{
  id v4 = a3;
  id v6 = [(NPNetworkInfo *)self edgeLatencies];
  v5 = [v6 sortedArrayUsingComparator:v4];

  [(NPNetworkInfo *)self setEdgeLatencies:v5];
}

- (BOOL)isLatency:(id)a3 qualifiedForLatencyMap:(id)a4 parameters:(networkParameters *)a5 requireUniqueEdges:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 edgeIndex] == 0xFFFFFFFFLL
    || a5
    && (a5->var0 && [v9 TFOStatus] != 2
     || (int var1 = a5->var1, var1 != [v9 probeNoTFOCookie]))
    || ![v9 isComplete:1])
  {
    BOOL v21 = 0;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v23 = v10;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "probeEndpoint", v23);
          uint64_t v18 = [v9 probeEndpoint];
          if ([v17 isEqual:v18])
          {

            goto LABEL_23;
          }
          if (v6)
          {
            uint64_t v19 = [v16 edgeIndex];
            uint64_t v20 = [v9 edgeIndex];

            if (v19 == v20) {
              goto LABEL_23;
            }
          }
          else
          {
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    v16 = 0;
LABEL_23:

    BOOL v21 = v16 == 0;
    id v10 = v23;
  }

  return v21;
}

- (void)rebuildLatencyMapWithViewSize:(id)a3 edgeCount:(unint64_t)a4 parameters:(networkParameters *)a5
{
  id v23 = a3;
  unint64_t v8 = [v23 unsignedIntegerValue];
  if (v8 >= a4) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = v8;
  }
  id v10 = [(NPNetworkInfo *)self edgeLatencies];
  id v11 = 0;
  if ([v10 count])
  {
    unint64_t v12 = 0;
    while (1)
    {
      unint64_t v13 = [v11 count];

      if (v13 >= v9) {
        break;
      }
      uint64_t v14 = [(NPNetworkInfo *)self edgeLatencies];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v12];

      if ([(NPNetworkInfo *)self isLatency:v15 qualifiedForLatencyMap:v11 parameters:a5 requireUniqueEdges:1])
      {
        if (!v11) {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v11 addObject:v15];
      }

      ++v12;
      id v10 = [(NPNetworkInfo *)self edgeLatencies];
      if (v12 >= [v10 count]) {
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
  }
  if (v9 < [v23 unsignedIntegerValue])
  {
    unint64_t v16 = [v23 unsignedIntegerValue];
    v17 = [(NPNetworkInfo *)self edgeLatencies];
    if ([v17 count])
    {
      unint64_t v18 = 0;
      while (1)
      {
        unint64_t v19 = [v11 count];

        if (v19 >= v16) {
          break;
        }
        uint64_t v20 = [(NPNetworkInfo *)self edgeLatencies];
        BOOL v21 = [v20 objectAtIndexedSubscript:v18];

        if ([(NPNetworkInfo *)self isLatency:v21 qualifiedForLatencyMap:v11 parameters:a5 requireUniqueEdges:0])
        {
          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v11 addObject:v21];
        }

        ++v18;
        v17 = [(NPNetworkInfo *)self edgeLatencies];
        if (v18 >= [v17 count]) {
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
    }
  }
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v11];
  [(NPNetworkInfo *)self setCurrentLatencyMap:v22];
}

- (void)mergeNewLatencies:(id)a3 usingComparator:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  int64_t v7 = [(NPNetworkInfo *)self edgeLatencies];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = [(NPNetworkInfo *)self edgeLatencies];
    id v10 = (id)[v9 mutableCopy];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
        v17 = [(NPNetworkInfo *)self edgeLatencies];
        uint64_t v18 = [v17 count];

        if (!v18) {
          goto LABEL_15;
        }
        unint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = [(NPNetworkInfo *)self edgeLatencies];
          BOOL v21 = [(id)v20 objectAtIndexedSubscript:v19];

          LOBYTE(v20) = [v21 isMatched:v16];
          if (v20) {
            break;
          }
          ++v19;
          v22 = [(NPNetworkInfo *)self edgeLatencies];
          unint64_t v23 = [v22 count];

          if (v19 >= v23) {
            goto LABEL_15;
          }
        }
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v24 = [(NPNetworkInfo *)self edgeLatencies];
          long long v25 = [v24 objectAtIndexedSubscript:v19];

          objc_msgSend(v16, "setProbeCount:", objc_msgSend(v16, "probeCount") + objc_msgSend(v25, "probeCount"));
          long long v26 = [v25 creationDate];
          [v16 setCreationDate:v26];

          [v10 replaceObjectAtIndex:v19 withObject:v16];
        }
        else
        {
LABEL_15:
          [v10 addObject:v16];
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v27 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v13 = v27;
    }
    while (v27);
  }

  long long v28 = [v10 sortedArrayUsingComparator:v29];
  [(NPNetworkInfo *)self setEdgeLatencies:v28];
}

- (void)handleTFOFailedForAddressFamily:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NPNetworkInfo *)self edgeLatencies];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 probeTFO])
        {
          id v10 = [v9 addressFamily];
          int v11 = [v10 unsignedCharValue];

          if (v11 == v3) {
            [v9 setTFOStatus:1];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSDate)lastVisited
{
  return self->_lastVisited;
}

- (void)setLastVisited:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (int64_t)lastFallbackReason
{
  return self->_lastFallbackReason;
}

- (void)setLastFallbackReason:(int64_t)a3
{
  self->_lastFallbackReason = a3;
}

- (BOOL)hasIPv6
{
  return self->_hasIPv6;
}

- (void)setHasIPv6:(BOOL)a3
{
  self->_hasIPuint64_t v6 = a3;
}

- (NSArray)edgeLatencies
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEdgeLatencies:(id)a3
{
}

- (NSArray)currentLatencyMap
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentLatencyMap:(id)a3
{
}

- (NSDate)probeRateLimit
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProbeRateLimit:(id)a3
{
}

- (NPEdgeSelection)edgeSelection
{
  return (NPEdgeSelection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEdgeSelection:(id)a3
{
}

- (BOOL)isProbeInProgress
{
  return self->_isProbeInProgress;
}

- (void)setIsProbeInProgress:(BOOL)a3
{
  self->_isProbeInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeSelection, 0);
  objc_storeStrong((id *)&self->_probeRateLimit, 0);
  objc_storeStrong((id *)&self->_currentLatencyMap, 0);
  objc_storeStrong((id *)&self->_edgeLatencies, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_lastVisited, 0);
}

@end