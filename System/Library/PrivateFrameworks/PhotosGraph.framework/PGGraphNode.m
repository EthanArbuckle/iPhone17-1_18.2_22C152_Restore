@interface PGGraphNode
+ (MANodeFilter)filter;
- (BOOL)isEqualToNode:(id)a3;
- (MANodeFilter)entityFilter;
- (PGGraphNode)init;
- (PGGraphNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (float)weight;
- (id)UUID;
- (id)keywordDescription;
- (id)name;
- (id)propertyForKey:(id)a3;
- (id)shortDescription;
- (unint64_t)propertiesCount;
- (void)setWeight:(float)a3;
@end

@implementation PGGraphNode

- (unint64_t)propertiesCount
{
  PGMethodNotImplentedException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)propertyForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PGLogging sharedLogging];
  v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = objc_opt_class();
  }

  v9.receiver = self;
  v9.super_class = (Class)PGGraphNode;
  v7 = [(MANode *)&v9 propertyForKey:v4];

  return v7;
}

- (id)shortDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MANode *)self identifier];
  v6 = [(PGGraphNode *)self label];
  v7 = [v3 stringWithFormat:@"[%@ %p] id:[%lu] label:[%@]", v4, self, v5, v6];

  v8 = [NSString stringWithFormat:@"%@ edgesCount:[%ld] inEdgesCount:[%ld] outEdgesCount:[%ld]", v7, -[MANode edgesCount](self, "edgesCount"), -[MANode inEdgesCount](self, "inEdgesCount"), -[MANode outEdgesCount](self, "outEdgesCount")];

  return v8;
}

- (BOOL)isEqualToNode:(id)a3
{
  uint64_t v4 = (PGGraphNode *)a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (v4 == self)
  {
    BOOL v9 = 1;
    goto LABEL_11;
  }
  int v6 = [(PGGraphNode *)self domain];
  if (v6 == [(PGGraphNode *)v5 domain])
  {
    v7 = [(PGGraphNode *)self label];
    v8 = [(PGGraphNode *)v5 label];
    BOOL v9 = (v7 == v8 || [v7 isEqualToString:v8])
      && [(MANode *)self hasEqualPropertiesToNode:v5];
  }
  else
  {
LABEL_7:
    BOOL v9 = 0;
  }
LABEL_11:

  return v9;
}

- (void)setWeight:(float)a3
{
  PGMethodNotImplentedException(self, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (float)weight
{
  return *MEMORY[0x1E4F71F30];
}

- (id)keywordDescription
{
  id v3 = [(PGGraphNode *)self label];
  uint64_t v4 = [(PGGraphNode *)self name];
  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(PGGraphNode *)self UUID];
  }
  int v6 = v5;
  if (v5) {
    [NSString stringWithFormat:@"[%@] %@", v3, v5];
  }
  else {
  v7 = [NSString stringWithFormat:@"[%@]", v3, v9];
  }

  return v7;
}

- (id)UUID
{
  return 0;
}

- (id)name
{
  return 0;
}

- (MANodeFilter)entityFilter
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(MANode *)self propertyDictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [&unk_1F28D3960 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(&unk_1F28D3960);
      }
      uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
      uint64_t v9 = [v3 objectForKeyedSubscript:v8];

      if (v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [&unk_1F28D3960 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    uint64_t v20 = v8;
    v10 = [v3 objectForKeyedSubscript:v8];
    v21 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];

    if (v11) {
      goto LABEL_12;
    }
  }
LABEL_11:
  id v11 = v3;
LABEL_12:
  id v12 = objc_alloc(MEMORY[0x1E4F71F00]);
  v13 = [(PGGraphNode *)self label];
  v14 = objc_msgSend(v12, "initWithLabel:domain:properties:", v13, -[PGGraphNode domain](self, "domain"), v11);

  return (MANodeFilter *)v14;
}

- (PGGraphNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (*MEMORY[0x1E4F71F30] != a5) {
    __assert_rtn("-[PGGraphNode initWithLabel:domain:weight:properties:]", "PGGraphNode.m", 304, "weight == kMAElementDefaultWeight");
  }
  v13 = v11;
  LODWORD(v12) = *MEMORY[0x1E4F71F30];
  v14 = -[PGGraphNode initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", v10, v8, v11, v12);

  return v14;
}

- (PGGraphNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  uint64_t v6 = a4;
  id v9 = a3;
  id v10 = a5;
  LODWORD(v11) = *MEMORY[0x1E4F71F30];
  v14.receiver = self;
  v14.super_class = (Class)PGGraphNode;
  double v12 = [(MANode *)&v14 initWithLabel:v9 domain:v6 weight:v10 properties:v11];
  PGMethodNotImplentedException(v12, a2);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v13);
}

- (PGGraphNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGGraphNode;
  return [(MANode *)&v3 init];
}

+ (MANodeFilter)filter
{
  return (MANodeFilter *)[MEMORY[0x1E4F71F00] any];
}

@end