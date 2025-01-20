@interface PGGraphBasePresentEdge
+ (MAEdgeFilter)consolidatedFilter;
+ (MAEdgeFilter)consolidatedPresentInAssetsFilter;
+ (id)filter;
+ (void)setImportance:(double)a3 onPresentEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
+ (void)setNumberOfAssets:(unint64_t)a3 onPresentEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5;
- (BOOL)hasProperties:(id)a3;
- (PGGraphBasePresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphBasePresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (double)importance;
- (id)edgeDescription;
- (id)initFromPersonNode:(id)a3 toMomentNode:(id)a4 importance:(double)a5 numberOfAssets:(unint64_t)a6;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)numberOfAssets;
- (unsigned)domain;
@end

@implementation PGGraphBasePresentEdge

- (unint64_t)numberOfAssets
{
  return *((unsigned int *)self + 10);
}

- (double)importance
{
  return self->_importance;
}

- (unsigned)domain
{
  return 300;
}

- (id)label
{
  PGAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)edgeDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphBasePresentEdge;
  v4 = [(PGGraphOptimizedEdge *)&v7 edgeDescription];
  v5 = [v3 stringWithFormat:@"%@ (importance = %f, %u assets)", v4, *(void *)&self->_importance, *((unsigned int *)self + 10)];

  return v5;
}

- (id)propertyDictionary
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"importance";
  v3 = [NSNumber numberWithDouble:self->_importance];
  v7[1] = @"numberOfAssets";
  v8[0] = v3;
  v4 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 10)];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"importance"];
    objc_super v7 = v6;
    BOOL v10 = 0;
    if (!v6 || ([v6 doubleValue], v8 == self->_importance))
    {

      v9 = [v5 objectForKeyedSubscript:@"numberOfAssets"];
      objc_super v7 = v9;
      if (!v9 || [v9 unsignedIntegerValue] == *((_DWORD *)self + 10)) {
        BOOL v10 = 1;
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (PGGraphBasePresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [v17 objectForKeyedSubscript:@"importance"];

  if (v18)
  {
    v19 = v17;
  }
  else
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"importance"];

    v22 = [v17 objectForKeyedSubscript:@"cnt"];

    if (v22)
    {
      v23 = [v17 objectForKeyedSubscript:@"cnt"];
      [v19 setObject:v23 forKeyedSubscript:@"numberOfAssets"];

      [v19 setObject:0 forKeyedSubscript:@"cnt"];
    }
  }
  v24 = [(PGGraphBasePresentEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v19];

  return v24;
}

- (PGGraphBasePresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  PGAbstractMethodException(self, a2);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v16);
}

- (id)initFromPersonNode:(id)a3 toMomentNode:(id)a4 importance:(double)a5 numberOfAssets:(unint64_t)a6
{
  int v6 = a6;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBasePresentEdge;
  id result = [(PGGraphEdge *)&v9 initWithSourceNode:a3 targetNode:a4];
  if (result)
  {
    *((double *)result + 6) = a5;
    *((_DWORD *)result + 10) = v6;
  }
  return result;
}

+ (void)setNumberOfAssets:(unint64_t)a3 onPresentEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  objc_super v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithUnsignedInteger:a3];
  [v8 persistModelProperty:v9 forKey:@"numberOfAssets" forEdgeWithIdentifier:a4];
}

+ (void)setImportance:(double)a3 onPresentEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  objc_super v7 = NSNumber;
  id v8 = a5;
  id v9 = [v7 numberWithDouble:a3];
  [v8 persistModelProperty:v9 forKey:@"importance" forEdgeWithIdentifier:a4];
}

+ (MAEdgeFilter)consolidatedPresentInAssetsFilter
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F71EB0]);
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PRESENT", @"CPRESENT", 0);
  id v8 = @"numberOfAssets";
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:5 value:&unk_1F28D2AC0];
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  int v6 = (void *)[v2 initWithLabels:v3 domain:300 properties:v5];

  return (MAEdgeFilter *)v6;
}

+ (MAEdgeFilter)consolidatedFilter
{
  id v2 = objc_alloc(MEMORY[0x1E4F71EB0]);
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PRESENT", @"CPRESENT", 0);
  id v4 = (void *)[v2 initWithLabels:v3 domain:300 properties:MEMORY[0x1E4F1CC08]];

  return (MAEdgeFilter *)v4;
}

+ (id)filter
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:0 domain:300];
  return v2;
}

@end