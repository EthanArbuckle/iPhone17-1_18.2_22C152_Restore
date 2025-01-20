@interface VFXModelDeformer
+ (BOOL)supportsSecureCoding;
- (BOOL)_getDeformedMeshBoundingBox:(id *)a3;
- (BOOL)deformedMeshReliesOnFrustum;
- (BOOL)deformedMeshReliesOnTransforms;
- (VFXModelDeformer)initWithCoder:(id)a3;
- (id)dependencyNodeAtIndex:(unint64_t)a3;
- (id)meshForDeformedTopology;
- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6;
- (unint64_t)requiredInputs;
- (unint64_t)requiredOutputs;
- (unint64_t)supportedOutputs;
- (void)_enumerateDependencyNodesUsingBlock:(id)a3;
@end

@implementation VFXModelDeformer

- (VFXModelDeformer)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VFXModelDeformer;
  return [(VFXModelDeformer *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)requiredInputs
{
  return 0;
}

- (unint64_t)supportedOutputs
{
  return 1;
}

- (unint64_t)requiredOutputs
{
  return 1;
}

- (BOOL)deformedMeshReliesOnTransforms
{
  return 0;
}

- (BOOL)deformedMeshReliesOnFrustum
{
  return 0;
}

- (BOOL)_getDeformedMeshBoundingBox:(id *)a3
{
  return 0;
}

- (id)meshForDeformedTopology
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return 0;
}

- (id)dependencyNodeAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)_enumerateDependencyNodesUsingBlock:(id)a3
{
  char v11 = 0;
  uint64_t v8 = objc_msgSend_requiredInputs(self, a2, (uint64_t)a3, v3);
  if ((v8 & 0x700) != 0)
  {
    uint64_t v9 = objc_msgSend_dependencyNodeAtIndex_(self, v6, 0, v7);
    (*((void (**)(id, void, uint64_t, uint64_t, char *))a3 + 2))(a3, 0, v9, v8, &v11);
  }
  if ((v8 & 0x3800) != 0)
  {
    uint64_t v10 = objc_msgSend_dependencyNodeAtIndex_(self, v6, 1, v7);
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, char *))a3 + 2))(a3, 1, v10, v8, &v11);
  }
}

- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6
{
  return 0;
}

@end