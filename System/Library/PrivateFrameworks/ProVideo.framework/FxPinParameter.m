@interface FxPinParameter
- (Class)customPinControl;
- (FxPinParameter)init;
- (id)defaultValue;
- (void)dealloc;
- (void)setDefaultValue:(id)a3;
@end

@implementation FxPinParameter

- (FxPinParameter)init
{
  v3.receiver = self;
  v3.super_class = (Class)FxPinParameter;
  result = [(FxPin *)&v3 init];
  if (result) {
    result->customUI = 0;
  }
  return result;
}

- (void)dealloc
{
  FxDebugAssert(self->_paramPriv != 0, &cfstr_ParamprivNull.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_paramPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxPinParameter;
  [(FxPin *)&v9 dealloc];
}

- (id)defaultValue
{
  return self->defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  id defaultValue = self->defaultValue;
  if (defaultValue) {

  }
  self->id defaultValue = a3;
}

- (Class)customPinControl
{
  return self->customUI;
}

@end