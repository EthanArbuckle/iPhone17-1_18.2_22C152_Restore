@interface MUMathExpressionFloatBased
+ (float)evaluateString:(id)a3 error:(id *)a4;
+ (float)invalidResult;
- (BOOL)isConstant;
- (BOOL)isValueIllegal:(float)a3;
- (MUMathExpressionFloatBased)init;
- (MUMathExpressionFloatBased)initWithString:(id)a3 error:(id *)a4;
- (float)evaluate;
- (float)valueForVariable:(id)a3;
- (id)stringValue;
- (void)_resetVariableIndicies;
- (void)cleanup;
- (void)dealloc;
- (void)replaceVariable:(id)a3 withValue:(float)a4;
- (void)resetAllVariables;
- (void)setValue:(float)a3 forVariable:(id)a4;
- (void)setVariableValues:(id)a3;
@end

@implementation MUMathExpressionFloatBased

+ (float)evaluateString:(id)a3 error:(id *)a4
{
  [(id)objc_opt_class() invalidResult];
  float v6 = v5;
  if ([a3 UTF8String]) {
    operator new();
  }
  return v6;
}

- (MUMathExpressionFloatBased)init
{
  return [(MUMathExpressionFloatBased *)self initWithString:0 error:0];
}

- (MUMathExpressionFloatBased)initWithString:(id)a3 error:(id *)a4
{
  if ([a3 UTF8String])
  {
    v8.receiver = self;
    v8.super_class = (Class)MUMathExpressionFloatBased;
    float v6 = [(MUMathExpressionBase *)&v8 init];
    if (v6) {
      operator new();
    }
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  [(MUMathExpressionFloatBased *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MUMathExpressionFloatBased;
  [(MUMathExpressionBase *)&v3 dealloc];
}

- (void)cleanup
{
  mInterpreter = self->mInterpreter;
  if (mInterpreter) {
    (*(void (**)(void))(*(void *)mInterpreter + 152))();
  }
}

- (void)_resetVariableIndicies
{
  [(NSMutableDictionary *)self->super._indicesForVariables removeAllObjects];
  unsigned int v3 = (*(uint64_t (**)(void))(*(void *)self->mInterpreter + 296))();
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
    do
    {
      uint64_t v6 = (*(uint64_t (**)(void *, uint64_t))(*(void *)self->mInterpreter + 312))(self->mInterpreter, v4);
      if (v6) {
        [(NSMutableDictionary *)self->super._indicesForVariables setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4) forKey:+[NSString stringWithUTF8String:v6]];
      }
      ++v4;
    }
    while (v5 != v4);
  }
}

- (void)setValue:(float)a3 forVariable:(id)a4
{
  id v6 = [(NSMutableDictionary *)self->super._indicesForVariables objectForKey:a4];
  if (v6)
  {
    mInterpreter = self->mInterpreter;
    id v8 = [v6 unsignedIntValue];
    v9 = *(void (**)(void *, id, __n128))(*(void *)mInterpreter + 352);
    v10.n128_f32[0] = a3;
    v9(mInterpreter, v8, v10);
  }
}

- (float)valueForVariable:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->super._indicesForVariables objectForKey:a3];
  if (!v4) {
    return 0.0;
  }
  mInterpreter = self->mInterpreter;
  id v6 = [v4 intValue];
  v7 = *(void (**)(void *, id))(*(void *)mInterpreter + 320);
  v7(mInterpreter, v6);
  return result;
}

- (void)setVariableValues:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  indicesForVariables = self->super._indicesForVariables;
  id v6 = [(NSMutableDictionary *)indicesForVariables countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(indicesForVariables);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [a3 objectForKey:v10];
        if (v11)
        {
          v12 = v11;
          mInterpreter = self->mInterpreter;
          id v14 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->super._indicesForVariables, "objectForKey:", v10), "intValue");
          [v12 floatValue];
          (*(void (**)(void *, id))(*(void *)mInterpreter + 352))(mInterpreter, v14);
        }
      }
      id v7 = [(NSMutableDictionary *)indicesForVariables countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)replaceVariable:(id)a3 withValue:(float)a4
{
  if ([(NSMutableDictionary *)self->super._indicesForVariables objectForKey:a3]) {
    operator new();
  }
  [(MUMathExpressionFloatBased *)self _resetVariableIndicies];
}

- (void)resetAllVariables
{
  int v3 = (*(uint64_t (**)(void *, SEL))(*(void *)self->mInterpreter + 296))(self->mInterpreter, a2);
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = 0;
    do
    {
      (*(void (**)(void *, uint64_t, double))(*(void *)self->mInterpreter + 352))(self->mInterpreter, v5, 0.0);
      uint64_t v5 = (v5 + 1);
    }
    while (v4 != v5);
  }
}

- (float)evaluate
{
  (**(void (***)(void *, SEL))self->mInterpreter)(self->mInterpreter, a2);
  return result;
}

- (id)stringValue
{
  (*(void (**)(void *, SEL))(*(void *)self->mInterpreter + 96))(self->mInterpreter, a2);
  uint64_t v3 = (*(uint64_t (**)(void *))(*(void *)self->mInterpreter + 104))(self->mInterpreter);
  int v4 = +[NSString stringWithUTF8String:v3];
  if (v3) {
    operator delete[]();
  }
  return v4;
}

- (BOOL)isConstant
{
  return (*(unsigned int (**)(void *, SEL))(*(void *)self->mInterpreter + 40))(self->mInterpreter, a2) != 0;
}

+ (float)invalidResult
{
  return 3.4028e38;
}

- (BOOL)isValueIllegal:(float)a3
{
  [(id)objc_opt_class() invalidResult];
  return v4 == a3;
}

@end