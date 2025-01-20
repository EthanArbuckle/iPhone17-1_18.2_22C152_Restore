@interface FxParameterCustom
- (FxParameterCustom)init;
- (id)dataFromValue:(id)a3;
- (id)valueFromData:(id)a3;
- (void)dealloc;
@end

@implementation FxParameterCustom

- (FxParameterCustom)init
{
  v3.receiver = self;
  v3.super_class = (Class)FxParameterCustom;
  return [(FxPinParameter *)&v3 init];
}

- (void)dealloc
{
  FxDebugAssert(self->_customPriv != 0, &cfstr_CustomprivNull.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_customPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterCustom;
  [(FxPinParameter *)&v9 dealloc];
}

- (id)dataFromValue:(id)a3
{
  FxDebugLog(&cfstr_DatafromvalueN.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)valueFromData:(id)a3
{
  FxDebugLog(&cfstr_ValuefromdataN.isa, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

@end