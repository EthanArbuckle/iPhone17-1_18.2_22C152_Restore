@interface MTConvenienceEnvironmentDelegate
- (MTConvenienceEnvironmentDelegate)init;
- (MTConvenienceEnvironmentDelegate)initWithPageURLBlock:(id)a3 resourceRevNumBlock:(id)a4 hostAppBlock:(id)a5;
- (id)_hostAppBlock;
- (id)_pageURLBlock;
- (id)_resourceRevNumBlock;
- (id)hostApp;
- (id)pageUrl;
- (id)resourceRevNum;
- (void)set_hostAppBlock:(id)a3;
- (void)set_pageURLBlock:(id)a3;
- (void)set_resourceRevNumBlock:(id)a3;
@end

@implementation MTConvenienceEnvironmentDelegate

- (MTConvenienceEnvironmentDelegate)initWithPageURLBlock:(id)a3 resourceRevNumBlock:(id)a4 hostAppBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MTConvenienceEnvironmentDelegate;
  v11 = [(MTConvenienceEnvironmentDelegate *)&v19 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x21D465290](v8);
    id pageURLBlock = v11->__pageURLBlock;
    v11->__id pageURLBlock = (id)v12;

    uint64_t v14 = MEMORY[0x21D465290](v9);
    id resourceRevNumBlock = v11->__resourceRevNumBlock;
    v11->__id resourceRevNumBlock = (id)v14;

    uint64_t v16 = MEMORY[0x21D465290](v10);
    id hostAppBlock = v11->__hostAppBlock;
    v11->__id hostAppBlock = (id)v16;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__hostAppBlock, 0);
  objc_storeStrong(&self->__resourceRevNumBlock, 0);

  objc_storeStrong(&self->__pageURLBlock, 0);
}

- (MTConvenienceEnvironmentDelegate)init
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"-init is not a valid initializer for the class %@", v4];

  id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v5 userInfo:0];
  objc_exception_throw(v6);
}

- (id)hostApp
{
  v3 = [(MTConvenienceEnvironmentDelegate *)self _hostAppBlock];
  if (v3)
  {
    v4 = [(MTConvenienceEnvironmentDelegate *)self _hostAppBlock];
    uint64_t v5 = v4[2]();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)pageUrl
{
  v3 = [(MTConvenienceEnvironmentDelegate *)self _pageURLBlock];
  if (v3)
  {
    v4 = [(MTConvenienceEnvironmentDelegate *)self _pageURLBlock];
    uint64_t v5 = v4[2]();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)resourceRevNum
{
  v3 = [(MTConvenienceEnvironmentDelegate *)self _resourceRevNumBlock];
  if (v3)
  {
    v4 = [(MTConvenienceEnvironmentDelegate *)self _resourceRevNumBlock];
    uint64_t v5 = v4[2]();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_pageURLBlock
{
  return self->__pageURLBlock;
}

- (void)set_pageURLBlock:(id)a3
{
}

- (id)_resourceRevNumBlock
{
  return self->__resourceRevNumBlock;
}

- (void)set_resourceRevNumBlock:(id)a3
{
}

- (id)_hostAppBlock
{
  return self->__hostAppBlock;
}

- (void)set_hostAppBlock:(id)a3
{
}

@end