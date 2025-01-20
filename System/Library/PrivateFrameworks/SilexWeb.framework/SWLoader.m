@interface SWLoader
+ (id)loaderWithBlock:(id)a3;
- (id)loadBlock;
- (void)load;
@end

@implementation SWLoader

+ (id)loaderWithBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = MEMORY[0x22A621430](v4);

  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)load
{
  v2 = [(SWLoader *)self loadBlock];
  v2[2]();
}

- (id)loadBlock
{
  return self->_loadBlock;
}

- (void).cxx_destruct
{
}

@end