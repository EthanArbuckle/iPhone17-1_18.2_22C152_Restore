@interface RETransformerInvocation
+ (id)invocationWithArguments:(unint64_t *)a3 count:(unint64_t)a4;
- (RETransformerInvocation)init;
- (id).cxx_construct;
- (unint64_t)getArgumentAtIndex:(unint64_t)a3;
- (unint64_t)numberOfArguments;
- (void)dealloc;
- (void)setArgument:(unint64_t)a3 atIndex:(unint64_t)a4;
@end

@implementation RETransformerInvocation

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void)dealloc
{
  begin = self->_values.__begin_;
  for (i = self->_values.__end_; begin != i; i = self->_values.__end_)
    REReleaseFeatureValueTaggedPointer((CFTypeRef)*begin++);
  v5.receiver = self;
  v5.super_class = (Class)RETransformerInvocation;
  [(RETransformerInvocation *)&v5 dealloc];
}

+ (id)invocationWithArguments:(unint64_t *)a3 count:(unint64_t)a4
{
  v6 = objc_alloc_init(RETransformerInvocation);
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      [(RETransformerInvocation *)v6 setArgument:a3[v7] atIndex:v7];
      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

- (void)setArgument:(unint64_t)a3 atIndex:(unint64_t)a4
{
  p_values = &self->_values;
  if (a4 >= self->_values.__end_ - self->_values.__begin_) {
    std::vector<unsigned long>::resize((uint64_t)&self->_values, a4 + 1);
  }
  RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)p_values->__begin_[a4]);
  p_values->__begin_[a4] = a3;
}

- (RETransformerInvocation)init
{
  v5.receiver = self;
  v5.super_class = (Class)RETransformerInvocation;
  v2 = [(RETransformerInvocation *)&v5 init];
  v3 = v2;
  if (v2) {
    std::vector<unsigned long>::resize((uint64_t)&v2->_values, 0);
  }
  return v3;
}

- (unint64_t)getArgumentAtIndex:(unint64_t)a3
{
  return self->_values.__begin_[a3];
}

- (unint64_t)numberOfArguments
{
  return self->_values.__end_ - self->_values.__begin_;
}

- (void).cxx_destruct
{
  begin = self->_values.__begin_;
  if (begin)
  {
    self->_values.__end_ = begin;
    operator delete(begin);
  }
}

@end