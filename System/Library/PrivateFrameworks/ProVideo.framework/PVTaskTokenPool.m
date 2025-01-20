@interface PVTaskTokenPool
- (PVTaskTokenPool)init;
- (PVTaskTokenPool)initWithOffset:(unint64_t)a3;
- (PVTaskTokenPoolDelegate)delegate;
- (id).cxx_construct;
- (id)getToken;
- (void)returnToken:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PVTaskTokenPool

- (PVTaskTokenPool)init
{
  return [(PVTaskTokenPool *)self initWithOffset:0];
}

- (PVTaskTokenPool)initWithOffset:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PVTaskTokenPool;
  result = [(PVTaskTokenPool *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (id)getToken
{
  v3 = (std::mutex *)((char *)self + 64);
  std::mutex::lock((std::mutex *)self + 1);
  uint64_t v4 = *((void *)self + 7);
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    uint64_t v6 = *(void *)(*(void *)(*((void *)self + 3)
                               + (((unint64_t)(*((void *)self + 6) + v5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * ((*((void *)self + 6) + v5) & 0x1FF));
    *((void *)self + 7) = v5;
    std::deque<unsigned long>::__maybe_remove_back_spare[abi:ne180100]((void *)self + 2, 1);
  }
  else
  {
    uint64_t v6 = *((void *)self + 1);
    *((void *)self + 1) = v6 + 1;
  }
  v7 = [[PVTaskToken alloc] initWithPool:self tokenId:v6];
  v8 = [(PVTaskTokenPool *)self delegate];

  if (v8)
  {
    v9 = [(PVTaskTokenPool *)self delegate];
    [v9 tokenTaken:v7];
  }
  std::mutex::unlock(v3);

  return v7;
}

- (void)returnToken:(id)a3
{
  id v4 = a3;
  if (([v4 returned] & 1) == 0)
  {
    uint64_t v5 = (std::mutex *)((char *)self + 64);
    std::mutex::lock((std::mutex *)self + 1);
    uint64_t v8 = [v4 tokenId];
    std::deque<unsigned long>::push_back((void *)self + 2, &v8);
    [v4 setReturned:1];
    uint64_t v6 = [(PVTaskTokenPool *)self delegate];

    if (v6)
    {
      v7 = [(PVTaskTokenPool *)self delegate];
      [v7 tokenReturned:v4];
    }
    std::mutex::unlock(v5);
  }
}

- (PVTaskTokenPoolDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 16);

  return (PVTaskTokenPoolDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 16);
  std::mutex::~mutex((std::mutex *)self + 1);

  std::deque<unsigned long>::~deque[abi:ne180100]((void *)self + 2);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((void *)self + 8) = 850045863;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = 0;
  return self;
}

@end