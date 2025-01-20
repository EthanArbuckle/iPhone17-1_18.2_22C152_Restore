@interface VFXRenderGraph
+ (BOOL)supportsSecureCoding;
+ (id)renderGraphDescriptionWithSCNTechniqueDescription:(id)a3;
- (NSArray)attachments;
- (NSString)identifier;
- (NSString)name;
- (VFXRenderGraph)init;
- (VFXRenderGraph)initWithCoder:(id)a3;
- (id)authoringGraph;
- (id)copyWithZone:(_NSZone *)a3;
- (id)diagnostics;
- (id)graph;
- (id)world;
- (void)_compileRenderGraphIfNeeded;
- (void)addWorldReference:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateCompiledGraph;
- (void)removeWorldReference:(id)a3;
- (void)setAuthoringGraph:(id)a3;
- (void)setName:(id)a3;
@end

@implementation VFXRenderGraph

+ (id)renderGraphDescriptionWithSCNTechniqueDescription:(id)a3
{
  return 0;
}

- (VFXRenderGraph)init
{
  v4.receiver = self;
  v4.super_class = (Class)VFXRenderGraph;
  v2 = [(VFXRenderGraph *)&v4 init];
  if (v2) {
    v2->_authoringGraph = sub_1B68BC3AC();
  }
  return v2;
}

- (void)dealloc
{
  self->_world = 0;
  v3.receiver = self;
  v3.super_class = (Class)VFXRenderGraph;
  [(VFXRenderGraph *)&v3 dealloc];
}

- (id)world
{
  return self->_world;
}

- (void)addWorldReference:(id)a3
{
  self->_world = (VFXWorld *)a3;
}

- (void)removeWorldReference:(id)a3
{
  self->_world = 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend_allocWithZone_(VFXRenderGraph, a2, (uint64_t)a3, v3);
  v8 = (id *)objc_msgSend_init(v4, v5, v6, v7);

  v8[1] = sub_1B68BCA18();
  return v8;
}

- (id)graph
{
  objc_msgSend__compileRenderGraphIfNeeded(self, a2, v2, v3);
  return self->_graph;
}

- (id)diagnostics
{
  objc_msgSend__compileRenderGraphIfNeeded(self, a2, v2, v3);
  return self->_diagnostics;
}

- (id)authoringGraph
{
  return self->_authoringGraph;
}

- (void)setAuthoringGraph:(id)a3
{
  id authoringGraph = self->_authoringGraph;
  if (authoringGraph != a3)
  {

    self->_id authoringGraph = a3;
  }
}

- (void)_compileRenderGraphIfNeeded
{
  if (!self->_graph)
  {
    id v10 = 0;
    id v11 = 0;
    world = self->_world;
    uint64_t v6 = objc_msgSend_authoringGraph(self, a2, v2, v3);
    uint64_t v7 = CFXRGAuthoringGraphCompile(world, v6, &v10, &v11);
    id v8 = v11;

    self->_diagnostics = v11;
    if (v7)
    {
      id v9 = v10;

      self->_graph = v10;
    }
  }
}

- (void)invalidateCompiledGraph
{
  self->_graph = 0;
  self->_diagnostics = 0;
}

- (NSArray)attachments
{
  objc_msgSend_graph(self, a2, v2, v3);

  return (NSArray *)sub_1B68BF84C();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = objc_msgSend_valueForKey_(VFXTransaction, a2, @"serializationContext", v3);
  uint64_t v10 = objc_msgSend_authoringGraph(self, v7, v8, v9);
  id v11 = sub_1B68BF7C0(v10, v6);
  if (v11) {
    objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)v11, @"authoringGraph");
  }
  name = self->_name;

  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)name, @"name");
}

- (VFXRenderGraph)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)VFXRenderGraph;
  uint64_t v6 = [(VFXRenderGraph *)&v18 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_valueForKey_(VFXTransaction, v4, @"VFXWorldLoadingContextKey", v5);
    uint64_t v10 = objc_msgSend_valueForKey_(v7, v8, @"serializationContext", v9);
    uint64_t v11 = objc_opt_class();
    v6->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"name");
    uint64_t v13 = objc_opt_class();
    v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"authoringGraph");
    if (v15) {
      id v16 = sub_1B68BF734(v15, v10);
    }
    else {
      id v16 = sub_1B68BC3AC();
    }
    v6->_id authoringGraph = v16;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->identifier;
}

@end