@interface PGGraphEdge
+ (MAEdgeFilter)filter;
- (BOOL)isEqualToEdge:(id)a3;
- (PGGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (PGGraphEdge)initWithSourceNode:(id)a3 targetNode:(id)a4;
- (float)weight;
- (id)keywordDescription;
- (id)propertyForKey:(id)a3;
- (unint64_t)propertiesCount;
- (void)setWeight:(float)a3;
@end

@implementation PGGraphEdge

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
  v9.super_class = (Class)PGGraphEdge;
  v7 = [(MAEdge *)&v9 propertyForKey:v4];

  return v7;
}

- (BOOL)isEqualToEdge:(id)a3
{
  id v4 = a3;
  if (v4 && (int v5 = -[PGGraphEdge domain](self, "domain"), v5 == [v4 domain]))
  {
    v6 = [(PGGraphEdge *)self label];
    v7 = [v4 label];
    if ((v6 == v7 || [v6 isEqualToString:v7])
      && [(MAEdge *)self hasEqualPropertiesToEdge:v4])
    {
      v8 = [(MAEdge *)self sourceNode];
      objc_super v9 = [(MAEdge *)self targetNode];
      v10 = [v4 sourceNode];
      uint64_t v11 = [v4 targetNode];
      BOOL v12 = (v8 == v10 || [v8 isEqualToNode:v10])
         && (v9 == v11 || ([v9 isEqualToNode:v11] & 1) != 0);
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
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
  id v3 = NSString;
  id v4 = [(PGGraphEdge *)self label];
  int v5 = [(PGGraphEdge *)self propertyForKey:@"name"];
  v6 = [v3 stringWithFormat:@"[%@] %@", v4, v5];

  return v6;
}

- (PGGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (*MEMORY[0x1E4F71F30] != a7) {
    __assert_rtn("-[PGGraphEdge initWithLabel:sourceNode:targetNode:domain:weight:properties:]", "PGGraphEdge.m", 154, "weight == kMAElementDefaultWeight");
  }
  v19 = v17;
  LODWORD(v18) = *MEMORY[0x1E4F71F30];
  v20 = -[PGGraphEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v17, v18);

  return v20;
}

- (PGGraphEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  uint64_t v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  LODWORD(v17) = *MEMORY[0x1E4F71F30];
  v20.receiver = self;
  v20.super_class = (Class)PGGraphEdge;
  double v18 = [(MAEdge *)&v20 initWithLabel:v13 sourceNode:v14 targetNode:v15 domain:v8 weight:v16 properties:v17];
  PGMethodNotImplentedException(v18, a2);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v19);
}

- (PGGraphEdge)initWithSourceNode:(id)a3 targetNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphEdge;
  return [(MAEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (MAEdgeFilter)filter
{
  return (MAEdgeFilter *)[MEMORY[0x1E4F71EB0] any];
}

@end