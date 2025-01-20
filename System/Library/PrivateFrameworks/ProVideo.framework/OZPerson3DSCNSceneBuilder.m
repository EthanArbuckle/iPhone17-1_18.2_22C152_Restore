@interface OZPerson3DSCNSceneBuilder
- (OZPerson3DSCNSceneBuilder)initWithName:(id)a3;
- (SCNMatrix4Pair)getJointTransformsForLimb:(SEL)a3;
- (__n128)defaultTransform:;
- (id).cxx_construct;
- (id)getRootNode;
- (id)newNodeForJoint:(unint64_t)a3;
- (id)newNodeForLimb:(unint64_t)a3;
- (id)newRoundCylinderForRoot;
- (uint64_t)setTransform:(__n128)a3 node:(__n128)a4;
- (uint64_t)setTransform:(double)a3 forJoint:(double)a4;
- (void)addNode:(id)a3 joint:(unint64_t)a4 node:(id)a5;
- (void)addNode:(id)a3 limb:(unint64_t)a4 node:(id)a5;
- (void)buildPersonGeometry:(id)a3;
- (void)enablePhysics:(BOOL)a3;
- (void)runOnAllBodyGeometry:(id)a3;
- (void)setFriction:(float)a3;
- (void)setMass:(float)a3;
- (void)setOpacity:(float)a3;
- (void)updateConeLimbGeometry:(id)a3 upperRadius:(float)a4 lowerRadius:(float)a5 length:(float)a6;
- (void)updateCylinderLimbGeometry:(id)a3 length:(float)a4;
- (void)updateSimpleGeometry:(float)a3;
@end

@implementation OZPerson3DSCNSceneBuilder

- (OZPerson3DSCNSceneBuilder)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OZPerson3DSCNSceneBuilder;
  v4 = [(OZPerson3DSCNSceneBuilder *)&v7 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    v4->_geometryMode = 1;
    v4->_rootNode = (SCNNode *)v5;
    [(OZPerson3DSCNSceneBuilder *)v4 buildPersonGeometry:a3];
  }
  return v4;
}

- (id)getRootNode
{
  return self->_rootNode;
}

- (void)enablePhysics:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __43__OZPerson3DSCNSceneBuilder_enablePhysics___block_invoke_2;
  v3[3] = &unk_1E616E450;
  v3[4] = self;
  v3[5] = &__block_literal_global_85;
  BOOL v4 = a3;
  [(OZPerson3DSCNSceneBuilder *)self runOnAllBodyGeometry:v3];
}

uint64_t __43__OZPerson3DSCNSceneBuilder_enablePhysics___block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    uint64_t result = [a3 physicsBody];
    if (result) {
      return result;
    }
    uint64_t v5 = [MEMORY[0x1E4F3B230] kinematicBody];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return [a3 setPhysicsBody:v5];
}

uint64_t __43__OZPerson3DSCNSceneBuilder_enablePhysics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = objc_msgSend(a2, "childNodes", 0);
    uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          ++v7;
        }
        while (v5 != v7);
        uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  else
  {
    v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v8();
  }
  return result;
}

- (void)setMass:(float)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __37__OZPerson3DSCNSceneBuilder_setMass___block_invoke;
  v3[3] = &__block_descriptor_36_e17_v16__0__SCNNode_8l;
  float v4 = a3;
  [(OZPerson3DSCNSceneBuilder *)self runOnAllBodyGeometry:v3];
}

uint64_t __37__OZPerson3DSCNSceneBuilder_setMass___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(float *)(a1 + 32);
  v3 = (void *)[a2 physicsBody];

  return [v3 setMass:v2];
}

- (void)setFriction:(float)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __41__OZPerson3DSCNSceneBuilder_setFriction___block_invoke;
  v3[3] = &__block_descriptor_36_e17_v16__0__SCNNode_8l;
  float v4 = a3;
  [(OZPerson3DSCNSceneBuilder *)self runOnAllBodyGeometry:v3];
}

uint64_t __41__OZPerson3DSCNSceneBuilder_setFriction___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(float *)(a1 + 32);
  v3 = (void *)[a2 physicsBody];

  return [v3 setFriction:v2];
}

- (void)setOpacity:(float)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __40__OZPerson3DSCNSceneBuilder_setOpacity___block_invoke;
  v3[3] = &__block_descriptor_36_e17_v16__0__SCNNode_8l;
  float v4 = a3;
  [(OZPerson3DSCNSceneBuilder *)self runOnAllBodyGeometry:v3];
}

uint64_t __40__OZPerson3DSCNSceneBuilder_setOpacity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:1.0 alpha:*(float *)(a1 + 32)];
  float v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "diffuse");

  return [v4 setContents:v3];
}

- (void)runOnAllBodyGeometry:(id)a3
{
  begin_node = (OZPerson3DSCNSceneBuilder *)self->_jointNodeMap.__tree_.__begin_node_;
  p_pair1 = &self->_jointNodeMap.__tree_.__pair1_;
  if (begin_node != (OZPerson3DSCNSceneBuilder *)&self->_jointNodeMap.__tree_.__pair1_)
  {
    do
    {
      (*((void (**)(id, void *))a3 + 2))(a3, begin_node->_limbNodeMap.__tree_.__pair1_.__value_.__left_);
      isa = (OZPerson3DSCNSceneBuilder *)begin_node->_jointNodeMap.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (OZPerson3DSCNSceneBuilder *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (OZPerson3DSCNSceneBuilder *)begin_node->_jointNodeMap.__tree_.__pair1_.__value_.__left_;
          BOOL v9 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v9);
      }
      begin_node = left;
    }
    while (left != (OZPerson3DSCNSceneBuilder *)p_pair1);
  }
  long long v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *)self->_limbNodeMap.__tree_.__begin_node_;
  long long v11 = &self->_limbNodeMap.__tree_.__pair1_;
  if (v10 != v11)
  {
    do
    {
      (*((void (**)(id, void *))a3 + 2))(a3, v10[5].__value_.__left_);
      long long v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *)v10[1].__value_.__left_;
      if (v12)
      {
        do
        {
          v13 = v12;
          long long v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *)v12->__value_.__left_;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *)v10[2].__value_.__left_;
          BOOL v9 = v13->__value_.__left_ == v10;
          long long v10 = v13;
        }
        while (!v9);
      }
      long long v10 = v13;
    }
    while (v13 != v11);
  }
}

- (uint64_t)setTransform:(double)a3 forJoint:(double)a4
{
  unint64_t v8 = a7;
  BOOL v9 = &v8;
  return objc_msgSend(a1, "setTransform:node:", std::__tree<std::__value_type<ProShade::SamplerNode const*,LiMaterialSamplerInfo *>,std::__map_value_compare<ProShade::SamplerNode const*,std::__value_type<ProShade::SamplerNode const*,LiMaterialSamplerInfo *>,std::less<ProShade::SamplerNode const*>,true>,std::allocator<std::__value_type<ProShade::SamplerNode const*,LiMaterialSamplerInfo *>>>::__emplace_unique_key_args<ProShade::SamplerNode const*,std::piecewise_construct_t const&,std::tuple<ProShade::SamplerNode const* const&>,std::tuple<>>(a1 + 1, &v8, (uint64_t)&std::piecewise_construct, (uint64_t **)&v9)[5], a2, a3, a4, a5);
}

- (void)updateSimpleGeometry:(float)a3
{
  id v4 = [(NSArray *)[(SCNNode *)self->_rootNode childNodes] firstObject];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "childNodes"), "firstObject");
  [v5 geometry];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (void *)[v5 geometry];
    double v7 = a3 + -400.0;
    [v6 setHeight:v7];
    if ([v5 physicsBody])
    {
      [v5 setPhysicsBody:0];
      objc_msgSend(v5, "setPhysicsBody:", objc_msgSend(MEMORY[0x1E4F3B230], "kinematicBody"));
      objc_msgSend((id)objc_msgSend(v5, "physicsBody"), "setPhysicsShape:", objc_msgSend(MEMORY[0x1E4F3B248], "shapeWithGeometry:options:", v6, 0));
    }
  }
  else
  {
    double v7 = a3 + -400.0;
  }
  unint64_t v8 = objc_msgSend((id)objc_msgSend(v4, "childNodes"), "objectAtIndexedSubscript:", 1);
  float v9 = v7 * 0.5;
  int v10 = 1065353216;
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  int v13 = 1065353216;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 1065353216;
  int v17 = 0;
  float v18 = v9;
  uint64_t v19 = 0x3F80000000000000;
  [v8 setTransform:&v10];
}

- (void)buildPersonGeometry:(id)a3
{
  if (self->_geometryMode)
  {
    id v8 = [(OZPerson3DSCNSceneBuilder *)self newRoundCylinderForRoot];
    [v8 setName:a3];
    [(OZPerson3DSCNSceneBuilder *)self addNode:v8 joint:0 node:self->_rootNode];
  }
  else
  {
    id v8 = [(OZPerson3DSCNSceneBuilder *)self newNodeForJoint:0];
    [v8 setName:a3];
    [(OZPerson3DSCNSceneBuilder *)self addNode:v8 joint:0 node:self->_rootNode];
    for (uint64_t i = 0; i != 16; ++i)
    {
      id v6 = [(OZPerson3DSCNSceneBuilder *)self newNodeForJoint:i];
      [(OZPerson3DSCNSceneBuilder *)self addNode:v6 joint:i node:v8];
      [(OZPerson3DSCNSceneBuilder *)self defaultTransform:i];
      -[OZPerson3DSCNSceneBuilder setTransform:node:](self, "setTransform:node:", v6);
    }
    for (uint64_t j = 0; j != 9; ++j)
      [(OZPerson3DSCNSceneBuilder *)self addNode:[(OZPerson3DSCNSceneBuilder *)self newNodeForLimb:j] limb:j node:v8];
  }
}

- (__n128)defaultTransform:
{
  return *(__n128 *)MEMORY[0x1E4F149A0];
}

- (uint64_t)setTransform:(__n128)a3 node:(__n128)a4
{
  v8[0] = a1;
  v8[1] = a2;
  v8[2] = a3;
  v8[3] = a4;
  return [a7 setTransform:v8];
}

- (void)addNode:(id)a3 joint:(unint64_t)a4 node:(id)a5
{
  *(void *)&long long v7 = a4;
  *((void *)&v7 + 1) = a3;
  std::__tree<std::__value_type<unsigned long,SCNNode *>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,SCNNode *>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,SCNNode *>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,SCNNode *>>((uint64_t **)&self->_jointNodeMap, (unint64_t *)&v7, &v7);
  [a5 addChildNode:a3];
}

- (void)addNode:(id)a3 limb:(unint64_t)a4 node:(id)a5
{
  unint64_t v7 = a4;
  id v8 = &v7;
  std::__tree<std::__value_type<ProShade::SamplerNode const*,LiMaterialSamplerInfo *>,std::__map_value_compare<ProShade::SamplerNode const*,std::__value_type<ProShade::SamplerNode const*,LiMaterialSamplerInfo *>,std::less<ProShade::SamplerNode const*>,true>,std::allocator<std::__value_type<ProShade::SamplerNode const*,LiMaterialSamplerInfo *>>>::__emplace_unique_key_args<ProShade::SamplerNode const*,std::piecewise_construct_t const&,std::tuple<ProShade::SamplerNode const* const&>,std::tuple<>>((uint64_t **)&self->_limbNodeMap, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = (uint64_t)a3;
  [a5 addChildNode:a3];
}

- (id)newRoundCylinderForRoot
{
  double v2 = objc_opt_new();
  uint64_t v3 = objc_opt_new();
  [v3 setName:@"LIMB core"];
  objc_msgSend(v3, "setGeometry:", objc_msgSend(MEMORY[0x1E4F3B200], "cylinderWithRadius:height:", 200.0, 1000.0));
  [v2 addChildNode:v3];

  id v4 = objc_opt_new();
  [v4 setName:@"LIMB top"];
  objc_msgSend(v4, "setGeometry:", objc_msgSend(MEMORY[0x1E4F3B278], "sphereWithRadius:", 200.0));
  int v6 = 1065353216;
  uint64_t v8 = 0;
  uint64_t v7 = 0;
  int v9 = 1065353216;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  long long v12 = xmmword_1B83848B0;
  uint64_t v13 = 0x3F80000000000000;
  [v4 setTransform:&v6];
  [v2 addChildNode:v4];

  return v2;
}

- (id)newNodeForJoint:(unint64_t)a3
{
  id v4 = objc_opt_new();
  [v4 setName:objc_msgSend(NSString, "stringWithFormat:", @"JOINT %lu", a3)];
  objc_msgSend(v4, "setGeometry:", objc_msgSend(MEMORY[0x1E4F3B278], "sphereWithRadius:", 100.0));
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "geometry"), "firstMaterial"), "diffuse"), "setContents:", objc_msgSend(MEMORY[0x1E4F428B8], "blueColor"));
  return v4;
}

- (id)newNodeForLimb:(unint64_t)a3
{
  id v4 = objc_opt_new();
  [v4 setName:objc_msgSend(NSString, "stringWithFormat:", @"LIMB %lu", a3)];
  if (a3) {
    uint64_t v5 = [MEMORY[0x1E4F3B200] cylinderWithRadius:100.0 height:10.0];
  }
  else {
    uint64_t v5 = [MEMORY[0x1E4F3B1F8] coneWithTopRadius:100.0 bottomRadius:50.0 height:10.0];
  }
  [v4 setGeometry:v5];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "geometry"), "firstMaterial"), "diffuse"), "setContents:", objc_msgSend(MEMORY[0x1E4F428B8], "blueColor"));
  return v4;
}

- (SCNMatrix4Pair)getJointTransformsForLimb:(SEL)a3
{
  *(_OWORD *)&retstr->var1.m31 = 0u;
  *(_OWORD *)&retstr->var1.m41 = 0u;
  *(_OWORD *)&retstr->var1.m11 = 0u;
  *(_OWORD *)&retstr->var1.m21 = 0u;
  *(_OWORD *)&retstr->var0.m31 = 0u;
  *(_OWORD *)&retstr->var0.m41 = 0u;
  *(_OWORD *)&retstr->var0.m11 = 0u;
  *(_OWORD *)&retstr->var0.m21 = 0u;
  return self;
}

- (void)updateConeLimbGeometry:(id)a3 upperRadius:(float)a4 lowerRadius:(float)a5 length:(float)a6
{
  int v9 = (void *)[a3 geometry];
  [v9 setHeight:a6];
  [v9 setTopRadius:a4];

  [v9 setBottomRadius:a5];
}

- (void)updateCylinderLimbGeometry:(id)a3 length:(float)a4
{
  uint64_t v5 = (void *)[a3 geometry];

  [v5 setHeight:a4];
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&self->_limbNodeMap, (void *)self->_limbNodeMap.__tree_.__pair1_.__value_.__left_);
  left = self->_jointNodeMap.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&self->_jointNodeMap, left);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

@end