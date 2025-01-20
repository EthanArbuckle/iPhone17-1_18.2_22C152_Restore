@interface PGGraphAudioFeatureNode
+ (id)filter;
+ (id)filterForAudioFeatureLabel:(id)a3;
+ (id)filterForAudioFeatureLabels:(id)a3;
+ (id)momentOfAudioFeature;
- (NSString)featureIdentifier;
- (PGGraphAudioFeatureNode)initWithLabel:(id)a3;
- (PGGraphAudioFeatureNodeCollection)collection;
- (id)label;
- (unint64_t)featureType;
- (unsigned)domain;
@end

@implementation PGGraphAudioFeatureNode

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
  v6 = [(PGGraphAudioFeatureNode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 37;
}

- (PGGraphAudioFeatureNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphAudioFeatureNodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  return 1201;
}

- (PGGraphAudioFeatureNode)initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphAudioFeatureNode;
  v5 = [(PGGraphNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (id)momentOfAudioFeature
{
  v2 = +[PGGraphMomentFeaturesEdge filter];
  v3 = [v2 inRelation];

  return v3;
}

+ (id)filterForAudioFeatureLabels:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = (void *)[v5 initWithLabels:v4 domain:1201 properties:MEMORY[0x1E4F1CC08]];

  return v6;
}

+ (id)filterForAudioFeatureLabel:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithLabel:v4 domain:1201];

  return v5;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:1201];
  return v2;
}

@end