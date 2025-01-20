@interface VFXModelWrapDeformer
+ (BOOL)supportsSecureCoding;
- (BOOL)_getDeformedMeshBoundingBox:(id *)a3;
- (VFXModelWrapDeformer)initWithCoder:(id)a3;
- (VFXModelWrapDeformer)initWithDrivingNode:(id)a3 parameters:(id)a4;
- (VFXModelWrapDeformer)initWithInnerLayerNode:(id)a3 outerLayerNode:(id)a4 parameters:(id)a5;
- (VFXNode)drivingNode;
- (id)dependencyNodeAtIndex:(unint64_t)a3;
- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6;
- (unint64_t)requiredInputs;
- (unint64_t)supportedOutputs;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initParametersIfNeededForDeformedNode:(id)a3;
@end

@implementation VFXModelWrapDeformer

- (VFXModelWrapDeformer)initWithDrivingNode:(id)a3 parameters:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VFXModelWrapDeformer;
  v6 = [(VFXModelWrapDeformer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isLegacySingleLayerDeformer = 1;
    objc_storeWeak((id *)&v6->_legacyDrivingNode, a3);
    v7->_parameters = (VFXModelWrapDeformerParameters *)a4;
  }
  return v7;
}

- (VFXModelWrapDeformer)initWithInnerLayerNode:(id)a3 outerLayerNode:(id)a4 parameters:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)VFXModelWrapDeformer;
  v8 = [(VFXModelWrapDeformer *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_innerLayerNode, a3);
    objc_storeWeak((id *)&v9->_outerLayerNode, a4);
    v9->_parameters = (VFXModelWrapDeformerParameters *)a5;
  }
  return v9;
}

- (void)initParametersIfNeededForDeformedNode:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->_innerLayerNode);
  id v6 = objc_loadWeak((id *)&self->_outerLayerNode);
  parameters = self->_parameters;
  uint64_t v11 = objc_msgSend_nodeRef(Weak, v8, v9, v10);
  uint64_t v15 = objc_msgSend_nodeRef(v6, v12, v13, v14);
  objc_msgSend_nodeRef(a3, v16, v17, v18);

  MEMORY[0x1F4181798](parameters, sel_initParametersIfNeededWithInnerLayerNodeRef_outerLayerNodeRef_deformedNodeRef_, v11, v15);
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_innerLayerNode, 0);
  objc_storeWeak((id *)&self->_outerLayerNode, 0);
  objc_storeWeak((id *)&self->_legacyDrivingNode, 0);

  v3.receiver = self;
  v3.super_class = (Class)VFXModelWrapDeformer;
  [(VFXModelWrapDeformer *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VFXModelWrapDeformer;
  -[VFXModelDeformer encodeWithCoder:](&v8, sel_encodeWithCoder_);
  objc_msgSend_initParametersIfNeededForDeformedNode_(self, v5, 0, v6);
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_parameters, @"parameters");
}

- (VFXModelWrapDeformer)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VFXModelWrapDeformer;
  v4 = -[VFXModelDeformer initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_parameters = (VFXModelWrapDeformerParameters *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"parameters");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXNode)drivingNode
{
  if (self->_legacyDrivingNode) {
    return (VFXNode *)objc_loadWeak((id *)&self->_legacyDrivingNode);
  }
  else {
    return (VFXNode *)objc_loadWeak((id *)&self->_innerLayerNode);
  }
}

- (unint64_t)requiredInputs
{
  if (self->_isLegacySingleLayerDeformer) {
    return 257;
  }
  else {
    return 2305;
  }
}

- (unint64_t)supportedOutputs
{
  return 1;
}

- (BOOL)_getDeformedMeshBoundingBox:(id *)a3
{
  if (self->_isLegacySingleLayerDeformer)
  {
    id Weak = objc_loadWeak((id *)&self->_legacyDrivingNode);
    uint64_t v9 = objc_msgSend_nodeRef(Weak, v6, v7, v8);
    LOBYTE(v10) = sub_1B649F7D4(v9, a3);
  }
  else
  {
    id v11 = objc_loadWeak((id *)&self->_innerLayerNode);
    id v12 = objc_loadWeak((id *)&self->_outerLayerNode);
    uint64_t v16 = objc_msgSend_nodeRef(v11, v13, v14, v15);
    uint64_t v20 = objc_msgSend_nodeRef(v12, v17, v18, v19);
    int v10 = sub_1B649F7D4(v16, &v28);
    if (v10)
    {
      LOBYTE(v10) = sub_1B649F7D4(v20, v27);
      float32x4_t v22 = (float32x4_t)v27[0];
      float32x4_t v21 = (float32x4_t)v27[1];
    }
    float32x4_t v23 = vminnmq_f32(vsubq_f32(v28, v29), vsubq_f32(v22, v21));
    float32x4_t v24 = vmaxnmq_f32(vaddq_f32(v28, v29), vaddq_f32(v22, v21));
    v25.i64[0] = 0x3F0000003F000000;
    v25.i64[1] = 0x3F0000003F000000;
    *(float32x4_t *)a3 = vmulq_f32(vaddq_f32(v23, v24), v25);
    *((float32x4_t *)a3 + 1) = vmulq_f32(vsubq_f32(v24, v23), v25);
  }
  return v10;
}

- (id)dependencyNodeAtIndex:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_super v3 = &OBJC_IVAR___VFXModelWrapDeformer__outerLayerNode;
    return objc_loadWeak((id *)((char *)&self->super.super.isa + *v3));
  }
  if (!a3)
  {
    if (self->_isLegacySingleLayerDeformer) {
      objc_super v3 = &OBJC_IVAR___VFXModelWrapDeformer__legacyDrivingNode;
    }
    else {
      objc_super v3 = &OBJC_IVAR___VFXModelWrapDeformer__innerLayerNode;
    }
    return objc_loadWeak((id *)((char *)&self->super.super.isa + *v3));
  }
  return 0;
}

- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6
{
  int v7 = a5;
  if (self->_isLegacySingleLayerDeformer)
  {
    id Weak = objc_loadWeak((id *)&self->_legacyDrivingNode);
    id v11 = [VFXModelWrapDeformerInstance alloc];
    return sub_1B65669B0(v11, a3, Weak, self, v12, v7, a6);
  }
  else
  {
    id v14 = objc_loadWeak((id *)&self->_innerLayerNode);
    id v15 = objc_loadWeak((id *)&self->_outerLayerNode);
    uint64_t v16 = [VFXModelWrapDeformerInstance alloc];
    return sub_1B6566CD8(v16, a3, v14, v15, self, v17, v7, a6);
  }
}

@end