@interface FxPlug
+ (id)fxPlugWithDescriptor:(id)a3 andHost:(id)a4;
+ (id)pinInPinList:(id)a3 withUUID:(id)a4;
+ (unsigned)leastCommonMultipleOfA:(unsigned int)a3 andB:(unsigned int)a4;
- (BOOL)isContextTypeSupported:(int)a3 bySample:(id)a4;
- (BOOL)isSamplePredetermined:(id)a3;
- (BOOL)isStreamPremultiplied:(id)a3;
- (BOOL)renderImageOutputAtTime:(double)a3 withOptions:(id)a4 inFxContext:(id)a5 inRegionOfInterest:(id)a6;
- (Class)canvasControlClass;
- (FxPlug)initWithDescriptor:(id)a3 andHost:(id)a4;
- (double)durationForStream:(id)a3;
- (double)frameDurationForStream:(id)a3;
- (double)pixelAspectForStream:(id)a3;
- (double)startTimeForStream:(id)a3;
- (id)createInputPinArray;
- (id)createOutputPinArray;
- (id)descriptor;
- (id)domainOfDefinitionForSample:(id)a3;
- (id)evaluateSample:(id)a3 withOptions:(id)a4;
- (id)filterImageInputPin;
- (id)host;
- (id)imageOutputPin;
- (id)inputPinWithUUID:(id)a3;
- (id)inputPins;
- (id)outputPinWithUUID:(id)a3;
- (id)outputPins;
- (id)requiredSamplesForSample:(id)a3;
- (id)transitionImageAInputPin;
- (id)transitionImageBInputPin;
- (unint64_t)fieldOrderForSample:(id)a3;
- (unsigned)timeScaleForStream:(id)a3;
- (void)dealloc;
@end

@implementation FxPlug

- (FxPlug)initWithDescriptor:(id)a3 andHost:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)FxPlug;
  v6 = [(FxPlug *)&v9 init];
  if (v6)
  {
    v7 = (FxPlugPriv *)malloc_type_calloc(1uLL, 0x20uLL, 0x8004018A671A6uLL);
    v6->_priv = v7;
    if (v7)
    {
      v6->_priv->var1 = a3;
      v6->_priv->var0 = a4;
    }
  }
  return v6;
}

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v13.receiver);
  priv = self->_priv;
  if (priv)
  {
    id var1 = priv->var1;
    if (var1)
    {

      priv = self->_priv;
    }
    if (priv->var0)
    {

      priv = self->_priv;
    }
    id var2 = priv->var2;
    if (var2)
    {

      priv = self->_priv;
    }
    id var3 = priv->var3;
    if (var3)
    {

      priv = self->_priv;
    }
    free(priv);
  }
  v13.receiver = self;
  v13.super_class = (Class)FxPlug;
  [(FxPlug *)&v13 dealloc];
}

+ (id)pinInPinList:(id)a3 withUUID:(id)a4
{
  uint64_t v5 = (void *)[a3 objectEnumerator];
  do
  {
    uint64_t v6 = (void *)[v5 nextObject];
    uint64_t v7 = v6;
  }
  while (v6 && !objc_msgSend((id)objc_msgSend(v6, "uuid"), "isEqualToString:", a4));
  return v7;
}

- (id)inputPinWithUUID:(id)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = [(FxPlug *)self inputPins];

  return (id)[v5 pinInPinList:v6 withUUID:a3];
}

- (id)outputPinWithUUID:(id)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = [(FxPlug *)self outputPins];

  return (id)[v5 pinInPinList:v6 withUUID:a3];
}

- (id)descriptor
{
  return self->_priv->var1;
}

- (id)createInputPinArray
{
  return (id)[MEMORY[0x1E4F1CA48] array];
}

- (id)createOutputPinArray
{
  return (id)[MEMORY[0x1E4F1CA48] array];
}

- (id)imageOutputPin
{
  return 0;
}

- (id)filterImageInputPin
{
  return 0;
}

- (id)transitionImageAInputPin
{
  return 0;
}

- (id)transitionImageBInputPin
{
  return 0;
}

- (Class)canvasControlClass
{
  return (Class)objc_opt_class();
}

- (unsigned)timeScaleForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)startTimeForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_0.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0.0;
}

- (double)durationForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_1.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0.0;
}

- (double)frameDurationForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_2.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (BOOL)isStreamPremultiplied:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_3.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1;
}

- (double)pixelAspectForStream:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_4.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 1.0;
}

- (BOOL)isContextTypeSupported:(int)a3 bySample:(id)a4
{
  FxDebugLog(&cfstr_Fxstreamprovid_5.isa, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (unint64_t)fieldOrderForSample:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_6.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)isSamplePredetermined:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_7.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)requiredSamplesForSample:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_8.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)evaluateSample:(id)a3 withOptions:(id)a4
{
  FxDebugLog(&cfstr_Fxstreamprovid_9.isa, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)domainOfDefinitionForSample:(id)a3
{
  FxDebugLog(&cfstr_Fxstreamprovid_10.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

+ (id)fxPlugWithDescriptor:(id)a3 andHost:(id)a4
{
  uint64_t v6 = (void *)[a3 plugInClass];
  uint64_t v7 = [v6 isSubclassOfClass:objc_opt_class()];
  char v8 = NSStringFromClass((Class)v6);
  FxDebugAssert(v7, &cfstr_IsNotASubclass.isa, v9, v10, v11, v12, v13, v14, v8);
  v15 = (void *)[objc_alloc((Class)v6) initWithDescriptor:a3 andHost:a4];

  return v15;
}

- (id)host
{
  return self->_priv->var0;
}

- (id)inputPins
{
  id result = self->_priv->var2;
  if (!result)
  {
    id result = [(FxPlug *)self createInputPinArray];
    self->_priv->id var2 = result;
  }
  return result;
}

- (id)outputPins
{
  id result = self->_priv->var3;
  if (!result)
  {
    id result = [(FxPlug *)self createOutputPinArray];
    self->_priv->id var3 = result;
  }
  return result;
}

- (BOOL)renderImageOutputAtTime:(double)a3 withOptions:(id)a4 inFxContext:(id)a5 inRegionOfInterest:(id)a6
{
  id v10 = [(FxPlug *)self imageOutputPin];
  if (v10)
  {
    id v10 = (id)[v10 stream];
    if (v10)
    {
      id v10 = (id)[v10 createSampleAtTime:a3];
      if (v10)
      {
        uint64_t v11 = v10;
        [v10 setRegionOfInterest:a6];
        [v11 setContext:a5];
        LOBYTE(v10) = [v11 evaluateWithOptions:a4] != 0;
      }
    }
  }
  return (char)v10;
}

+ (unsigned)leastCommonMultipleOfA:(unsigned int)a3 andB:(unsigned int)a4
{
  if (a4)
  {
    unsigned int v4 = a4;
    unsigned int v5 = a3;
    do
    {
      unsigned int v6 = v4;
      unsigned int v4 = v5 % v4;
      unsigned int v5 = v6;
    }
    while (v4);
    return a4 * a3 / v6;
  }
  unsigned int v6 = a3;
  if (a3) {
    return a4 * a3 / v6;
  }
  return 0;
}

@end