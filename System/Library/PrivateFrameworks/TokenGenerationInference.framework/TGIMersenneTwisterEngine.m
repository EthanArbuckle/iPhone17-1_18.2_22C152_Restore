@interface TGIMersenneTwisterEngine
- (TGIMersenneTwisterEngine)initWithSeed:(unint64_t)a3;
- (id).cxx_construct;
- (unint64_t)next;
@end

@implementation TGIMersenneTwisterEngine

- (TGIMersenneTwisterEngine)initWithSeed:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TGIMersenneTwisterEngine;
  v4 = [(TGIMersenneTwisterEngine *)&v9 init];
  v5 = v4;
  if (v4)
  {
    __src[0] = a3;
    for (uint64_t i = 1; i != 312; ++i)
    {
      a3 = i + 0x5851F42D4C957F2DLL * (a3 ^ (a3 >> 62));
      __src[i] = a3;
    }
    __src[312] = 0;
    memcpy(&v4->_mersenneTwisterEngine, __src, sizeof(v4->_mersenneTwisterEngine));
  }
  return v5;
}

- (unint64_t)next
{
  return std::mersenne_twister_engine<unsigned long long,64ul,312ul,156ul,31ul,13043109905998158313ull,29ul,6148914691236517205ull,17ul,8202884508482404352ull,37ul,18444473444759240704ull,43ul,6364136223846793005ull>::operator()((std::mersenne_twister_engine<unsigned long long, 64, 312, 156, 31, 13043109905998158313, 29, 6148914691236517205, 17, 8202884508482404352, 37, 18444473444759240704, 43, 6364136223846793005> *)&self->_mersenneTwisterEngine);
}

- (id).cxx_construct
{
  unint64_t v2 = 5489;
  *((void *)self + 1) = 5489;
  uint64_t v3 = 1;
  for (uint64_t i = 2; i != 313; ++i)
  {
    uint64_t v5 = 0x5851F42D4C957F2DLL * (v2 ^ (v2 >> 62));
    unint64_t v2 = v5 + v3;
    *((void *)self + i) = i + v5 - 1;
    ++v3;
  }
  *((void *)self + 313) = 0;
  return self;
}

@end