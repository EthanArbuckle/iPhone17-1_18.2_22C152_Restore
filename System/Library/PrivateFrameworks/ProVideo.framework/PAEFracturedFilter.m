@interface PAEFracturedFilter
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6;
- (BOOL)variesByDuration;
- (BOOL)variesOverTime;
- (PAEFracturedFilter)initWithAPIManager:(id)a3;
- (id).cxx_construct;
- (id)properties;
- (void)dealloc;
- (void)onVTBUserInteractionEventNotification:(id)a3;
@end

@implementation PAEFracturedFilter

- (PAEFracturedFilter)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEFracturedFilter;
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

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  v6.receiver = self;
  v6.super_class = (Class)PAEFracturedFilter;
  [(PAESharedDefaultBase *)&v6 dealloc];
}

- (void)onVTBUserInteractionEventNotification:(id)a3
{
  objc_super v4 = (void *)[a3 userInfo];
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"X"), "doubleValue");
  double v6 = v5;
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"Y"), "doubleValue");
  double v8 = v7;
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"VelocityX"), "doubleValue");
  double v10 = v9;
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"VelocityY"), "doubleValue");
  double v12 = v11;
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"Scale"), "doubleValue");
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"ScaleVelocity"), "doubleValue");
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"Rotation"), "doubleValue");
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"RotationVelocity"), "doubleValue");
  *(float *)&int v13 = v6;
  FracturedUtils::_lastTouchX = v13;
  *(float *)&int v14 = v8;
  FracturedUtils::_lastTouchY = v14;
  *(float *)&int v15 = v10;
  FracturedUtils::_lastVelocityTouchX = v15;
  *(float *)&int v16 = v12;
  FracturedUtils::_lastVelocityTouchY = v16;
  FracturedUtils::_frameTimeOffset = FracturedUtils::_lastFrameTime;
  [(NSLock *)self->_fxPoolLock lock];
  self->_fxPool.__end_ = self->_fxPool.__begin_;
  fxPoolLock = self->_fxPoolLock;

  [(NSLock *)fxPoolLock unlock];
}

- (id)properties
{
  return (id)FracturedUtils::properties(0);
}

- (BOOL)addParameters
{
  return FracturedUtils::addParameters(self, self->super.super._apiManager, 0, (uint64_t)self->_fxParams);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  LODWORD(v5) = FracturedUtils::_lastTouchX;
  LODWORD(v6) = FracturedUtils::_lastTouchY;
  if (*(float *)&FracturedUtils::_lastTouchX == -1.0 || *(float *)&FracturedUtils::_lastTouchY == -1.0)
  {
    if (a4) {
      objc_msgSend(a4, "heliumRef", a3, a4, a5, v5, v6);
    }
    else {
      uint64_t v17 = 0;
    }
    [a3 setHeliumRef:&v17];
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 24))(v17);
    }
  }
  else
  {
    ReadyEffect = (HGFractured::Effect *)FracturedUtils::getReadyEffect(&self->_fxPool.__begin_, self->_fxPoolLock);
    float v13 = *(float *)&FracturedUtils::_lastTouchY;
    fxParams = self->_fxParams;
    fxParams->var26[0] = -(float)(*(float *)&FracturedUtils::_lastTouchX + -0.5);
    fxParams->var26[1] = v13 + -0.5;
    int v15 = FracturedUtils::_lastVelocityTouchY;
    LODWORD(fxParams->var27[0]) = FracturedUtils::_lastVelocityTouchX;
    LODWORD(fxParams->var27[1]) = v15;
    FracturedUtils::renderOutput(self, self->super.super._apiManager, ReadyEffect, (uint64_t)fxParams, a3, a4, 0, &a5->var0.var0, 0.0, 0);
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  double v10 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  if (a3) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || a4 == 0;
  char v13 = v12;
  if (!v12)
  {
    double v16 = 0.0;
    [v10 getFloatValue:&v16 fromParm:19 atFxTime:a6->var0.var1];
    double v14 = v16;
    *a3 = (unint64_t)(v16 * (double)a5->var0);
    *a4 = (unint64_t)(v14 * (double)a5->var1);
  }
  return v13 ^ 1;
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)variesByDuration
{
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
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end