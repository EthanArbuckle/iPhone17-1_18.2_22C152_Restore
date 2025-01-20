@interface SignpostSupportObjectFilter
- (BOOL)passesObject:(id)a3;
- (SignpostSupportObjectFilter)initWithFilterBlock:(id)a3;
- (id)filterBlock;
@end

@implementation SignpostSupportObjectFilter

- (SignpostSupportObjectFilter)initWithFilterBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[SignpostSupportObjectFilter initWithFilterBlock:]();
  }
  v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)SignpostSupportObjectFilter;
  v6 = [(SignpostSupportObjectFilter *)&v10 init];
  if (v6)
  {
    uint64_t v7 = MEMORY[0x1A625EA50](v5);
    id filterBlock = v6->_filterBlock;
    v6->_id filterBlock = (id)v7;
  }
  return v6;
}

- (BOOL)passesObject:(id)a3
{
  id v4 = a3;
  v5 = [(SignpostSupportObjectFilter *)self filterBlock];
  char v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void).cxx_destruct
{
}

- (void)initWithFilterBlock:.cold.1()
{
}

@end