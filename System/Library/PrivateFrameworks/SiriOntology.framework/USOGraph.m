@interface USOGraph
+ (BOOL)supportsSecureCoding;
- (USOGraph)init;
- (USOGraph)initWithCoder:(id)a3;
- (USOGraph)initWithCppUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph;
- (id).cxx_construct;
- (id)createEntityNode:(const void *)a3;
- (id)createIntNode:(id)a3;
- (id)createOperatorNode:(const void *)a3;
- (id)createStringNode:(id)a3;
- (id)createTaskNode:(const void *)a3 verb:(const void *)a4;
- (id)getRoot;
- (void)encodeWithCoder:(id)a3;
- (void)getCppGraph;
- (void)getCppRootNode;
@end

@implementation USOGraph

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [[USOSerializedGraph alloc] initWithUsoGraph:self->_usoGraph.__ptr_.__value_ withError:0];
  [v5 encodeObject:v4 forKey:@"usoGraph"];
}

- (USOGraph)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)USOGraph;
  id v5 = [(USOGraph *)&v17 init];
  v6 = v5;
  if (v5)
  {
    siri::ontology::getSharedUsoVocabManager((siri::ontology *)v5);
    uint64_t v8 = siri::ontology::getSharedUsoVocabManager(void)::inst;
    v7 = (std::__shared_weak_count *)unk_1EBCA3AE0;
    if (unk_1EBCA3AE0) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(unk_1EBCA3AE0 + 8), 1uLL, memory_order_relaxed);
    }
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usoGraph"];
    v10 = v9;
    uint64_t v14 = v8;
    v15 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v9)
    {
      [v9 toCppUsoGraph:&v14 withError:0];
      v11 = v16;
    }
    else
    {
      v11 = 0;
    }
    v16 = 0;
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&v6->_usoGraph, v11);
    v12 = v16;
    v16 = 0;
    if (v12)
    {
      siri::ontology::UsoGraph::~UsoGraph(v12);
      MEMORY[0x1CB796510]();
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }

    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }

  return v6;
}

- (void)getCppGraph
{
  return self->_usoGraph.__ptr_.__value_;
}

- (void)getCppRootNode
{
  return (void *)*((void *)self->_usoGraph.__ptr_.__value_ + 11);
}

- (id)getRoot
{
  v2 = [[USORootNode alloc] initWithCppRootNode:*((void *)self->_usoGraph.__ptr_.__value_ + 11)];
  return v2;
}

- (id)createIntNode:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    [v3 longLongValue];
    siri::ontology::UsoGraph::createIntNode();
  }
  siri::ontology::UsoGraph::createIntNode();
}

- (id)createStringNode:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v7, (char *)[v3 UTF8String]);
    if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v7.__r_.__value_.__l.__data_, v7.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v7;
    }
    char v6 = 1;
    siri::ontology::UsoGraph::createStringNode();
  }
  __p.__r_.__value_.__s.__data_[0] = 0;
  char v6 = 0;
  siri::ontology::UsoGraph::createStringNode();
}

- (id)createTaskNode:(const void *)a3 verb:(const void *)a4
{
}

- (id)createEntityNode:(const void *)a3
{
}

- (id)createOperatorNode:(const void *)a3
{
}

- (USOGraph)initWithCppUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph
{
  v8.receiver = self;
  v8.super_class = (Class)USOGraph;
  id v4 = [(USOGraph *)&v8 init];
  id v5 = (USOGraph *)v4;
  if (v4)
  {
    char v6 = *(siri::ontology::UsoGraph **)a3.__ptr_.__value_;
    *(void *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)v4 + 1, v6);
  }
  return v5;
}

- (USOGraph)init
{
  v3.receiver = self;
  v3.super_class = (Class)USOGraph;
  if ([(USOGraph *)&v3 init]) {
    operator new();
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end