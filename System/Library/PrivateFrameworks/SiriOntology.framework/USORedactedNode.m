@interface USORedactedNode
- (USORedactedNode)initWithIndex:(int64_t)a3 usoGraph:(void *)a4;
- (id).cxx_construct;
- (int64_t)index;
- (unique_ptr<siri::ontology::UsoGraph,)usoGraph;
- (void)setIndex:(int64_t)a3;
- (void)setUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph;
@end

@implementation USORedactedNode

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (int64_t)index
{
  return self->_index;
}

- (unique_ptr<siri::ontology::UsoGraph,)usoGraph
{
  value = self->mUsoGraph.__ptr_.__value_;
  self->mUsoGraph.__ptr_.__value_ = 0;
  *v2 = value;
  return (unique_ptr<siri::ontology::UsoGraph, std::default_delete<siri::ontology::UsoGraph>>)self;
}

- (void)setUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph
{
  v3 = *(siri::ontology::UsoGraph **)a3.__ptr_.__value_;
  *(void *)a3.__ptr_.__value_ = 0;
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&self->mUsoGraph, v3);
}

- (USORedactedNode)initWithIndex:(int64_t)a3 usoGraph:(void *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)USORedactedNode;
  id v6 = [(USORedactedNode *)&v10 init];
  v7 = (USORedactedNode *)v6;
  if (v6)
  {
    *((void *)v6 + 2) = a3;
    v8 = *(siri::ontology::UsoGraph **)a4;
    *(void *)a4 = 0;
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)v6 + 1, v8);
  }
  return v7;
}

@end