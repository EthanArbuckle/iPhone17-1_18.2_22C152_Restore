@interface PPScoreInterpreterCtx
- (id).cxx_construct;
- (id)initWithScoreInputs:(void *)a3 previousSubscores:(uint64_t)a4 scalarSubscoreCount:(uint64_t)a5 arraySubscoreCount:(uint64_t)a6 objectSubscoreCount:;
@end

@implementation PPScoreInterpreterCtx

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscores, 0);
  objc_storeStrong((id *)&self->_previousSubscores, 0);
  objc_storeStrong((id *)&self->_scoreInputs, 0);
  std::unique_ptr<std::vector<PPScoreInterpreterValue>>::reset[abi:ne180100]((void ***)&self->_stack, 0);
}

- (id)initWithScoreInputs:(void *)a3 previousSubscores:(uint64_t)a4 scalarSubscoreCount:(uint64_t)a5 arraySubscoreCount:(uint64_t)a6 objectSubscoreCount:
{
  id v12 = a2;
  id v13 = a3;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)PPScoreInterpreterCtx;
    v14 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      v15 = [[PPScoreDict alloc] initWithScalarValueCount:a4 arrayValueCount:a5 objectCount:a6];
      id v16 = a1[4];
      a1[4] = v15;

      operator new();
    }
  }

  return a1;
}

@end