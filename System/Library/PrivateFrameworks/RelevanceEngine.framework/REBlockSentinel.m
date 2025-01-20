@interface REBlockSentinel
- (BOOL)isCompleted;
- (REBlockSentinel)init;
- (REBlockSentinel)initWithFailureBlock:(id)a3;
- (id)failureBlock;
- (void)complete;
- (void)dealloc;
- (void)setCompleted:(BOOL)a3;
@end

@implementation REBlockSentinel

- (REBlockSentinel)init
{
  return [(REBlockSentinel *)self initWithFailureBlock:0];
}

- (REBlockSentinel)initWithFailureBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REBlockSentinel;
  v5 = [(REBlockSentinel *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x223C31700](v4);
    id failureBlock = v5->_failureBlock;
    v5->_id failureBlock = (id)v6;

    [(REBlockSentinel *)v5 setCompleted:0];
  }

  return v5;
}

- (void)dealloc
{
  if (![(REBlockSentinel *)self isCompleted])
  {
    id failureBlock = (void (**)(void))self->_failureBlock;
    if (failureBlock) {
      failureBlock[2]();
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)REBlockSentinel;
  [(REBlockSentinel *)&v4 dealloc];
}

- (void)complete
{
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
}

@end