@interface ReachabilityCallbacker
- (ReachabilityCallbacker)initWithListener:(function<void)( queue:;
- (id).cxx_construct;
- (void)_reachabilityChanged:(id)a3;
- (void)clearListener;
- (void)dealloc;
@end

@implementation ReachabilityCallbacker

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 6) = 850045863;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((void *)self + 13) = 0;
  return self;
}

- (ReachabilityCallbacker)initWithListener:(function<void)( queue:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ReachabilityCallbacker;
  id v8 = [(ReachabilityCallbacker *)&v14 init];
  v9 = v8;
  v10 = (ReachabilityCallbacker *)v8;
  if (!v8) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)v8 + 5, a4);
  f = (function<void ()> *)a3->__f_.__f_;
  if (f)
  {
    if (f == a3)
    {
      v16 = (function<void ()> *)v15;
      (*(void (**)(function<void ()> *, void *))(*(void *)a3->__f_.__buf_.__lx + 24))(a3, v15);
      goto LABEL_7;
    }
    f = (function<void ()> *)(*(uint64_t (**)(function<void ()> *))(*(void *)f->__f_.__buf_.__lx + 16))(f);
  }
  v16 = f;
LABEL_7:
  std::__function::__value_func<void ()(void)>::swap[abi:nn180100](v15, v9 + 1);
  if (v16 == (function<void ()> *)v15)
  {
    (*(void (**)(void *))(v15[0] + 32))(v15);
  }
  else if (v16)
  {
    (*(void (**)(void))(*(void *)v16->__f_.__buf_.__lx + 40))();
  }
  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:v10 selector:sel__reachabilityChanged_ name:*MEMORY[0x1E4F641B8] object:0];

LABEL_12:
  return v10;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 48));
  objc_storeStrong((id *)self + 5, 0);
  v3 = (ReachabilityCallbacker *)*((void *)self + 4);
  if (v3 == (ReachabilityCallbacker *)((char *)self + 8))
  {
    v5 = *(void (**)(char *))(*((void *)self + 1) + 32);
    v5((char *)self + 8);
  }
  else if (v3)
  {
    v4 = *(void (**)(void))(*(void *)v3 + 40);
    v4();
  }
}

- (void)_reachabilityChanged:(id)a3
{
  objc_initWeak(&location, self);
  v4 = *((void *)self + 5);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ReachabilityCallbacker__reachabilityChanged___block_invoke;
  v5[3] = &unk_1E5A914C8;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__ReachabilityCallbacker__reachabilityChanged___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (std::mutex *)(WeakRetained + 48);
    v4 = WeakRetained;
    std::mutex::lock((std::mutex *)(WeakRetained + 48));
    uint64_t v3 = *((void *)v4 + 4);
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 48))(v3);
    }
    std::mutex::unlock(v2);
    WeakRetained = v4;
  }
}

- (void)clearListener
{
  uint64_t v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = (ReachabilityCallbacker *)*((void *)self + 4);
  *((void *)self + 4) = 0;
  if (v4 == (ReachabilityCallbacker *)((char *)self + 8))
  {
    (*(void (**)(char *))(*((void *)self + 1) + 32))((char *)self + 8);
  }
  else if (v4)
  {
    (*(void (**)(ReachabilityCallbacker *))(*(void *)v4 + 40))(v4);
  }
  std::mutex::unlock(v3);
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F641B8] object:0];

  v4 = (ReachabilityCallbacker *)*((void *)self + 4);
  *((void *)self + 4) = 0;
  if (v4 == (ReachabilityCallbacker *)((char *)self + 8))
  {
    (*(void (**)(char *))(*((void *)self + 1) + 32))((char *)self + 8);
  }
  else if (v4)
  {
    (*(void (**)(ReachabilityCallbacker *))(*(void *)v4 + 40))(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)ReachabilityCallbacker;
  [(ReachabilityCallbacker *)&v5 dealloc];
}

@end