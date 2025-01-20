@interface PAEFracturedTransition
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7;
- (BOOL)frameSetup:(id *)a3 inputInfoA:(id *)a4 inputInfoB:(id *)a5 timeFraction:(float)a6 hardware:(BOOL *)a7 software:(BOOL *)a8;
- (PAEFracturedTransition)initWithAPIManager:(id)a3;
- (id).cxx_construct;
- (id)properties;
- (void)dealloc;
@end

@implementation PAEFracturedTransition

- (PAEFracturedTransition)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEFracturedTransition;
  if ([(PAESharedDefaultBase *)&v4 initWithAPIManager:a3]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  fxParams = self->_fxParams;
  if (fxParams) {
    MEMORY[0x1BA9BFBA0](fxParams, 0x1000C4085B916AELL);
  }
  begin = (id **)self->_fxPool.__begin_;
  end = self->_fxPool.__end_;
  if (begin != (id **)end)
  {
    do
    {
      if (*begin)
      {
        FracturedUtils::FracturedFXPoolItem::~FracturedFXPoolItem(*begin);
        MEMORY[0x1BA9BFBA0]();
        end = self->_fxPool.__end_;
      }
      ++begin;
    }
    while (begin != (id **)end);
    begin = (id **)self->_fxPool.__begin_;
  }
  self->_fxPool.__end_ = (FracturedFXPoolItem **)begin;

  v6.receiver = self;
  v6.super_class = (Class)PAEFracturedTransition;
  [(PAESharedDefaultBase *)&v6 dealloc];
}

- (id)properties
{
  return (id)FracturedUtils::properties(0);
}

- (BOOL)addParameters
{
  return FracturedUtils::addParameters(self, self->super.super._apiManager, 1, (uint64_t)self->_fxParams);
}

- (BOOL)frameSetup:(id *)a3 inputInfoA:(id *)a4 inputInfoB:(id *)a5 timeFraction:(float)a6 hardware:(BOOL *)a7 software:(BOOL *)a8
{
  *a7 = 1;
  *a8 = 0;
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7
{
  ReadyEffect = (HGFractured::Effect *)FracturedUtils::getReadyEffect(&self->_fxPool.__begin_, self->_fxPoolLock);
  FracturedUtils::renderOutput(self, self->super.super._apiManager, ReadyEffect, (uint64_t)self->_fxParams, a3, a4, a5, &a7->var0.var0, a6, 1);
  return 1;
}

- (void).cxx_destruct
{
  p_fxPool = &self->_fxPool;
  begin = self->_fxPool.__begin_;
  if (begin)
  {
    p_fxPool->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end