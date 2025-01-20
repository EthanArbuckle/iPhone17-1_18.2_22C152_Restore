@interface PGGraphHighlightGroupNode
+ (MARelation)highlightOfHighlightGroup;
+ (MARelation)typeOfHighlightGroup;
+ (id)filter;
+ (id)filterWithUUIDs:(id)a3;
+ (id)inclusivePathFromTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4;
+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4;
+ (id)momentInHighlight;
+ (id)pathFromMoment;
+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3;
+ (id)pathToMoment;
+ (id)pathToTargetNodeDomain:(unsigned __int16)a3;
- (BOOL)isAggregation;
- (BOOL)isLongTrip;
- (BOOL)isShortTrip;
- (BOOL)isTrip;
- (NSArray)highlightNodes;
- (NSArray)sortedHighlightNodes;
- (PGGraphHighlightGroupNodeCollection)collection;
- (id)label;
- (unint64_t)featureType;
- (void)enumerateHighlightEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateHighlightNodesUsingBlock:(id)a3;
- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3;
@end

@implementation PGGraphHighlightGroupNode

- (unint64_t)featureType
{
  return 16;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PGGraphHighlightGroupNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E9C90;
  id v7 = v4;
  id v5 = v4;
  [(PGGraphHighlightGroupNode *)self enumerateHighlightNodesUsingBlock:v6];
}

void __68__PGGraphHighlightGroupNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PGGraphHighlightGroupNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke_2;
  v5[3] = &unk_1E68E48A8;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a3;
  [a2 enumerateMomentEdgesAndNodesUsingBlock:v5];
}

uint64_t __68__PGGraphHighlightGroupNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  **(unsigned char **)(a1 + 40) = *a4;
  return result;
}

- (NSArray)sortedHighlightNodes
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PGGraphHighlightGroupNode *)self highlightNodes];
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  id v4 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v3);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  uint64_t v7 = [v2 sortedArrayUsingDescriptors:v6];

  return (NSArray *)v7;
}

- (NSArray)highlightNodes
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PGGraphHighlightGroupNode_highlightNodes__block_invoke;
  v6[3] = &unk_1E68EB678;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphHighlightGroupNode *)self enumerateHighlightNodesUsingBlock:v6];

  return (NSArray *)v4;
}

uint64_t __43__PGGraphHighlightGroupNode_highlightNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateHighlightNodesUsingBlock:(id)a3
{
}

- (void)enumerateHighlightEdgesAndNodesUsingBlock:(id)a3
{
}

- (BOOL)isAggregation
{
  v2 = [(PGGraphHighlightGroupNode *)self collection];
  v3 = [v2 typeNodes];
  id v4 = [v3 anyNode];

  id v5 = [v4 label];
  LOBYTE(v3) = [v5 isEqualToString:@"Aggregation"];

  return (char)v3;
}

- (BOOL)isShortTrip
{
  v2 = [(PGGraphHighlightGroupNode *)self collection];
  v3 = [v2 typeNodes];
  id v4 = [v3 anyNode];

  id v5 = [v4 label];
  LOBYTE(v3) = [v5 isEqualToString:@"ShortTrip"];

  return (char)v3;
}

- (BOOL)isLongTrip
{
  v2 = [(PGGraphHighlightGroupNode *)self collection];
  v3 = [v2 typeNodes];
  id v4 = [v3 anyNode];

  id v5 = [v4 label];
  LOBYTE(v3) = [v5 isEqualToString:@"LongTrip"];

  return (char)v3;
}

- (BOOL)isTrip
{
  v2 = [(PGGraphHighlightGroupNode *)self collection];
  v3 = [v2 typeNodes];
  id v4 = [v3 anyNode];

  id v5 = [v4 label];
  if (([v5 isEqualToString:@"LongTrip"] & 1) != 0
    || ([v5 isEqualToString:@"ShortTrip"] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v5 isEqualToString:@"OngoingTrip"];
  }

  return v6;
}

- (PGGraphHighlightGroupNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphHighlightGroupNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"HighlightGroup";
  return @"HighlightGroup";
}

+ (id)momentInHighlight
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphHighlightGroupNode highlightOfHighlightGroup];
  v8[0] = v3;
  id v4 = +[PGGraphHighlightNode momentInDayHighlight];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  char v6 = [v2 chain:v5];

  return v6;
}

+ (MARelation)typeOfHighlightGroup
{
  v2 = +[PGGraphHasTypeEdge filter];
  v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)highlightOfHighlightGroup
{
  v2 = +[PGGraphGroupContainsEdge filter];
  v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)filterWithUUIDs:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  v9 = @"id";
  v10[0] = v4;
  char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = (void *)[v5 initWithLabel:@"HighlightGroup" domain:102 properties:v6];
  return v7;
}

+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4 = a3;
  id v5 = (__CFString *)a4;
  if (v4 == 100)
  {
    char v6 = @"(:HighlightGroup)-[:GROUP_CONTAINS]->(:Highlight)-[:CONTAINS]->(%@:Moment)";
  }
  else
  {
    if (v4 != 102)
    {
      v8 = 0;
      goto LABEL_9;
    }
    char v6 = @"(%@:HighlightGroup)";
  }
  id v7 = &stru_1F283BC78;
  if (v5) {
    id v7 = v5;
  }
  v8 = objc_msgSend(NSString, "stringWithFormat:", v6, v7);
LABEL_9:

  return v8;
}

+ (id)inclusivePathFromTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4 = a3;
  id v5 = (__CFString *)a4;
  if (v4 == 100)
  {
    char v6 = @"(%@:Moment)<-[:CONTAINS]-(:Highlight)<-[:GROUP_CONTAINS]-(:HighlightGroup)";
  }
  else
  {
    if (v4 != 102)
    {
      v8 = 0;
      goto LABEL_9;
    }
    char v6 = @"(%@:HighlightGroup)";
  }
  id v7 = &stru_1F283BC78;
  if (v5) {
    id v7 = v5;
  }
  v8 = objc_msgSend(NSString, "stringWithFormat:", v6, v7);
LABEL_9:

  return v8;
}

+ (id)pathToTargetNodeDomain:(unsigned __int16)a3
{
  if (a3 == 100)
  {
    objc_msgSend((id)objc_opt_class(), "pathToMoment", v3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 102) {
      id v5 = &stru_1F283BC78;
    }
    else {
      id v5 = 0;
    }
  }
  return v5;
}

+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3
{
  if (a3 == 100)
  {
    objc_msgSend((id)objc_opt_class(), "pathFromMoment", v3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 102) {
      id v5 = &stru_1F283BC78;
    }
    else {
      id v5 = 0;
    }
  }
  return v5;
}

+ (id)pathToMoment
{
  return @"-[:GROUP_CONTAINS]->(:Highlight)-[:CONTAINS]->(:Moment)";
}

+ (id)pathFromMoment
{
  return @"(:Moment)<-[:CONTAINS]-(:Highlight)<-[:GROUP_CONTAINS]-";
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"HighlightGroup" domain:102];
  return v2;
}

@end