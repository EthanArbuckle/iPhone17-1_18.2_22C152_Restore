@interface USORedactedData
- (NSArray)redactedList;
- (USORedactedData)initWithRedactedGraph:(void *)a3 redactedList:(id)a4;
- (id).cxx_construct;
- (unique_ptr<siri::ontology::UsoGraph,)redactedGraph;
- (void)setRedactedGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph;
- (void)setRedactedList:(id)a3;
@end

@implementation USORedactedData

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedList, 0);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&self->mRedactedGraph, 0);
}

- (void)setRedactedList:(id)a3
{
}

- (NSArray)redactedList
{
  return self->_redactedList;
}

- (unique_ptr<siri::ontology::UsoGraph,)redactedGraph
{
  value = self->mRedactedGraph.__ptr_.__value_;
  self->mRedactedGraph.__ptr_.__value_ = 0;
  *v2 = value;
  return (unique_ptr<siri::ontology::UsoGraph, std::default_delete<siri::ontology::UsoGraph>>)self;
}

- (void)setRedactedGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph
{
  v3 = *(siri::ontology::UsoGraph **)a3.__ptr_.__value_;
  *(void *)a3.__ptr_.__value_ = 0;
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&self->mRedactedGraph, v3);
}

- (USORedactedData)initWithRedactedGraph:(void *)a3 redactedList:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)USORedactedData;
  id v8 = [(USORedactedData *)&v12 init];
  v9 = (USORedactedData *)v8;
  if (v8)
  {
    v10 = *(siri::ontology::UsoGraph **)a3;
    *(void *)a3 = 0;
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)v8 + 1, v10);
    objc_storeStrong((id *)&v9->_redactedList, a4);
  }

  return v9;
}

@end