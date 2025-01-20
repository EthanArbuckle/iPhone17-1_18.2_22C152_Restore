@interface PGAssetCollectionFeatureInstance
- (PGAssetCollectionFeatureInstance)initWithSpecification:(id)a3 momentNode:(id)a4;
- (PGAssetCollectionFeatureInstance)initWithSpecification:(id)a3 momentNode:(id)a4 featureNodes:(id)a5;
- (PGAssetCollectionFeatureSpecification)specification;
- (PGGraphFeatureNodeCollection)featureNodes;
- (PGGraphMomentNode)momentNode;
@end

@implementation PGAssetCollectionFeatureInstance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNodes, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
  objc_storeStrong((id *)&self->_specification, 0);
}

- (PGGraphFeatureNodeCollection)featureNodes
{
  return (PGGraphFeatureNodeCollection *)objc_getProperty(self, a2, 24, 1);
}

- (PGGraphMomentNode)momentNode
{
  return (PGGraphMomentNode *)objc_getProperty(self, a2, 16, 1);
}

- (PGAssetCollectionFeatureSpecification)specification
{
  return (PGAssetCollectionFeatureSpecification *)objc_getProperty(self, a2, 8, 1);
}

- (PGAssetCollectionFeatureInstance)initWithSpecification:(id)a3 momentNode:(id)a4 featureNodes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGAssetCollectionFeatureInstance;
  v12 = [(PGAssetCollectionFeatureInstance *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_specification, a3);
    objc_storeStrong((id *)&v13->_momentNode, a4);
    objc_storeStrong((id *)&v13->_featureNodes, a5);
  }

  return v13;
}

- (PGAssetCollectionFeatureInstance)initWithSpecification:(id)a3 momentNode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGAssetCollectionFeatureInstance;
  id v9 = [(PGAssetCollectionFeatureInstance *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_specification, a3);
    objc_storeStrong((id *)&v10->_momentNode, a4);
  }

  return v10;
}

@end