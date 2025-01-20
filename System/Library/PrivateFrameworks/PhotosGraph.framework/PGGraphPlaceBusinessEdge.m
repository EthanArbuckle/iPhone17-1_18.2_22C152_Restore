@interface PGGraphPlaceBusinessEdge
+ (id)filter;
- (PGGraphPlaceBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toBusinessNode:(id)a4 confidence:(double)a5 hasRoutineInfo:(BOOL)a6 universalStartDate:(id)a7 universalEndDate:(id)a8;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphPlaceBusinessEdge

- (unsigned)domain
{
  return 503;
}

- (id)label
{
  v2 = @"BUSINESS";
  return @"BUSINESS";
}

- (PGGraphPlaceBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  v13 = [v12 objectForKeyedSubscript:@"confidence"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [v12 objectForKeyedSubscript:@"routine"];
  uint64_t v17 = [v16 BOOLValue];

  v18 = [v12 objectForKeyedSubscript:@"universalStartDate"];
  if (v18)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v18 doubleValue];
    v20 = objc_msgSend(v19, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v20 = 0;
  }
  v21 = [v12 objectForKeyedSubscript:@"universalEndDate"];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v21 doubleValue];
    v23 = objc_msgSend(v22, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v23 = 0;
  }
  v24 = [(PGGraphBusinessEdge *)self initFromSourceNode:v10 toBusinessNode:v11 confidence:v17 hasRoutineInfo:v20 universalStartDate:v23 universalEndDate:v15];

  return v24;
}

- (id)initFromMomentNode:(id)a3 toBusinessNode:(id)a4 confidence:(double)a5 hasRoutineInfo:(BOOL)a6 universalStartDate:(id)a7 universalEndDate:(id)a8
{
  v9.receiver = self;
  v9.super_class = (Class)PGGraphPlaceBusinessEdge;
  return [(PGGraphBusinessEdge *)&v9 initFromSourceNode:a3 toBusinessNode:a4 confidence:a6 hasRoutineInfo:a7 universalStartDate:a8 universalEndDate:a5];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"BUSINESS" domain:503];
  return v2;
}

@end