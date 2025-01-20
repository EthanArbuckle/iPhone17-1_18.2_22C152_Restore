@interface NUAnimationRunner
- (NUAnimationRunner)initWithRunBlock:(id)a3;
- (id)runBlock;
- (void)runWithFinishBlock:(id)a3;
@end

@implementation NUAnimationRunner

- (void)runWithFinishBlock:(id)a3
{
  v6 = (void (**)(void))a3;
  v4 = [(NUAnimationRunner *)self runBlock];

  if (v4)
  {
    v5 = [(NUAnimationRunner *)self runBlock];
    ((void (**)(void, void (**)(void)))v5)[2](v5, v6);
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (id)runBlock
{
  return self->_runBlock;
}

- (NUAnimationRunner)initWithRunBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUAnimationRunner;
  v5 = [(NUAnimationRunner *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x223C968A0](v4);
    id runBlock = v5->_runBlock;
    v5->_id runBlock = (id)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end