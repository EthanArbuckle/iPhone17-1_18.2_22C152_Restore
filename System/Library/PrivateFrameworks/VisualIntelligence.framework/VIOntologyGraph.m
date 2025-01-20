@interface VIOntologyGraph
- (BOOL)isDescendentWithDescendent:(id)a3 ancestor:(id)a4;
- (VIOntologyGraph)initWithOntologyGraph:(id)a3;
- (id)findLeastCommonAncestorWithNode1:(id)a3 node2:(id)a4;
- (id)ontologyNodeWithKnowledgeGraphID:(id)a3;
- (unint64_t)count;
@end

@implementation VIOntologyGraph

- (VIOntologyGraph)initWithOntologyGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIOntologyGraph;
  v6 = [(VIOntologyGraph *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_compatGraph, a3);
  }

  return v7;
}

- (BOOL)isDescendentWithDescendent:(id)a3 ancestor:(id)a4
{
  return [(OntologyGraphCompatible *)self->_compatGraph isDescendentWithDescendent:a3 ancestor:a4];
}

- (id)ontologyNodeWithKnowledgeGraphID:(id)a3
{
  return [(OntologyGraphCompatible *)self->_compatGraph ontologyNodeWithKnowledgeGraphID:a3];
}

- (unint64_t)count
{
  return [(OntologyGraphCompatible *)self->_compatGraph count];
}

- (id)findLeastCommonAncestorWithNode1:(id)a3 node2:(id)a4
{
  return [(OntologyGraphCompatible *)self->_compatGraph findLeastCommonAncestorWithNode1:a3 node2:a4];
}

- (void).cxx_destruct
{
}

@end