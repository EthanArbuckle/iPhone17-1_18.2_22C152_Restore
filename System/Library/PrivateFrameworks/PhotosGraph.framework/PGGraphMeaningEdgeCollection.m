@interface PGGraphMeaningEdgeCollection
+ (Class)edgeClass;
+ (id)meaningEdgesWithConfidenceThreshold:(double)a3 inGraph:(id)a4;
- (PGGraphMeaningNodeCollection)meaningNodes;
- (PGGraphMomentNodeCollection)momentNodes;
@end

@implementation PGGraphMeaningEdgeCollection

+ (id)meaningEdgesWithConfidenceThreshold:(double)a3 inGraph:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = +[PGGraphMeaningEdge filter];
  v15 = @"confidence";
  id v8 = objc_alloc(MEMORY[0x1E4F71E28]);
  v9 = [NSNumber numberWithDouble:a3];
  v10 = (void *)[v8 initWithComparator:6 value:v9];
  v16[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v12 = [v7 filterBySettingProperties:v11];

  v13 = [a1 edgesMatchingFilter:v12 inGraph:v6];

  return v13;
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (PGGraphMeaningNodeCollection)meaningNodes
{
  return (PGGraphMeaningNodeCollection *)+[MANodeCollection targetNodesOfEdges:self];
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return (PGGraphMomentNodeCollection *)+[MANodeCollection sourceNodesOfEdges:self];
}

@end