@interface PETailspin
- (OS_dispatch_queue)tailspinPropertyQueue;
- (PETailspin)init;
- (tailspin_config)tailspinConfig;
- (void)dealloc;
- (void)dumpTailspinOutputWithCompletion:(id)a3;
- (void)setTailspinConfig:(tailspin_config *)a3;
- (void)setTailspinPropertyQueue:(id)a3;
@end

@implementation PETailspin

- (void).cxx_destruct
{
}

- (void)setTailspinPropertyQueue:(id)a3
{
}

- (OS_dispatch_queue)tailspinPropertyQueue
{
  return self->_tailspinPropertyQueue;
}

- (void)setTailspinConfig:(tailspin_config *)a3
{
  self->_tailspinConfig = a3;
}

- (tailspin_config)tailspinConfig
{
  return self->_tailspinConfig;
}

- (void)dumpTailspinOutputWithCompletion:(id)a3
{
  v19[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateStyle:1];
  [v4 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  v5 = NSTemporaryDirectory();
  v6 = NSString;
  v7 = [MEMORY[0x263EFF910] date];
  v8 = [v4 stringFromDate:v7];
  v9 = [v6 stringWithFormat:@"tailspin_trace_%@.tailspin", v8];

  v10 = [v5 stringByAppendingPathComponent:v9];
  mode_t v11 = umask(0);
  id v12 = v10;
  LODWORD(v8) = open((const char *)[v12 UTF8String], 2562, 432);
  umask(v11);
  if (v8)
  {
    uint64_t v13 = *MEMORY[0x263F8C808];
    v18[0] = *MEMORY[0x263F8C850];
    v18[1] = v13;
    v19[0] = MEMORY[0x263EFFA88];
    v19[1] = MEMORY[0x263EFFA88];
    v18[2] = *MEMORY[0x263F8C800];
    v19[2] = MEMORY[0x263EFFA88];
    v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    v15 = dispatch_get_global_queue(0, 0);
    id v16 = v12;
    id v17 = v3;
    tailspin_dump_output_with_options();
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

void __47__PETailspin_dumpTailspinOutputWithCompletion___block_invoke(uint64_t a1, int a2)
{
  close(*(_DWORD *)(a1 + 48));
  if (a2)
  {
    id v5 = [NSURL fileURLWithPath:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)dealloc
{
  id v3 = [(PETailspin *)self tailspinPropertyQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __21__PETailspin_dealloc__block_invoke;
  block[3] = &unk_2642BF020;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)PETailspin;
  [(PETailspin *)&v4 dealloc];
}

uint64_t __21__PETailspin_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tailspinConfig];
  if (result)
  {
    MEMORY[0x21D458BC0]([*(id *)(a1 + 32) tailspinConfig]);
    id v3 = *(void **)(a1 + 32);
    return [v3 setTailspinConfig:0];
  }
  return result;
}

- (PETailspin)init
{
  v5.receiver = self;
  v5.super_class = (Class)PETailspin;
  v2 = [(PETailspin *)&v5 init];
  dispatch_queue_t v3 = dispatch_queue_create("PETailspin", 0);
  [(PETailspin *)v2 setTailspinPropertyQueue:v3];

  return v2;
}

@end