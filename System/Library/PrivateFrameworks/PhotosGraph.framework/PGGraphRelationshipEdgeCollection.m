@interface PGGraphRelationshipEdgeCollection
+ (Class)edgeClass;
+ (id)confirmedRelationshipEdgesInGraph:(id)a3;
+ (id)inferredRelationshipEdgesInGraph:(id)a3;
+ (id)relationshipEdgesWithInferenceSource:(id)a3 source:(unsigned __int8)a4;
@end

@implementation PGGraphRelationshipEdgeCollection

+ (id)relationshipEdgesWithInferenceSource:(id)a3 source:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  v6 = +[PGGraphRelationshipEdge filterWithSource:v4];
  v7 = +[MAEdgeCollection edgesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (id)confirmedRelationshipEdgesInGraph:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PGGraphRelationshipEdge confirmedRelationshipFilter];
  id v5 = +[MAEdgeCollection edgesMatchingFilter:v4 inGraph:v3];

  return v5;
}

+ (id)inferredRelationshipEdgesInGraph:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PGGraphRelationshipEdge inferredRelationshipFilter];
  id v5 = +[MAEdgeCollection edgesMatchingFilter:v4 inGraph:v3];

  return v5;
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end