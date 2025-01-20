@interface PGGraphSceneFeatureNode
+ (id)filter;
+ (id)filterForSceneName:(id)a3;
+ (id)filterForSceneNames:(id)a3;
+ (id)momentOfSceneFeature;
- (NSString)featureIdentifier;
- (PGGraphSceneFeatureNode)initWithLabel:(id)a3;
- (PGGraphSceneFeatureNodeCollection)collection;
- (id)label;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphSceneFeatureNode

- (void).cxx_destruct
{
}

- (id)label
{
  return self->_label;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphSceneFeatureNode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 27;
}

- (PGGraphSceneFeatureNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphSceneFeatureNodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  return 601;
}

- (PGGraphSceneFeatureNode)initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSceneFeatureNode;
  v5 = [(PGGraphNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (id)momentOfSceneFeature
{
  v2 = +[PGGraphMomentFeaturesEdge filter];
  v3 = [v2 inRelation];

  return v3;
}

+ (id)filterForSceneNames:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithArray:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F71F00]);
  v7 = (void *)[v6 initWithLabels:v5 domain:601 properties:MEMORY[0x1E4F1CC08]];

  return v7;
}

+ (id)filterForSceneName:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithLabel:v4 domain:601];

  return v5;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:601];
  return v2;
}

@end