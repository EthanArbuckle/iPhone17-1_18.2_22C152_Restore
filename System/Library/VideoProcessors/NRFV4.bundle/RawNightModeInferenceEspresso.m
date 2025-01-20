@interface RawNightModeInferenceEspresso
- ($C4732ECC957FA13B9B3DF4A51A95735B)espressoNetwork;
- (BOOL)valid;
- (RawNightModeInferenceEspresso)initWithExecutionTarget:(int)a3;
- (int)resetState;
- (void)espressoContext;
- (void)espressoPlan;
- (void)loadEspressoNetworkFromPath:(const char *)a3 withStorageType:(int)a4;
@end

@implementation RawNightModeInferenceEspresso

- (RawNightModeInferenceEspresso)initWithExecutionTarget:(int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RawNightModeInferenceEspresso;
  v4 = [(RawNightModeInferenceEspresso *)&v10 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  v4->_valid = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      uint64_t context = espresso_create_context();
      v5->_espressoContext = (void *)context;
      if (!context) {
        goto LABEL_6;
      }
      break;
    case 3:
      v4->_espressoContext = 0;
      goto LABEL_6;
    default:
      if (!v4->_espressoContext) {
        goto LABEL_6;
      }
      break;
  }
  uint64_t plan = espresso_create_plan();
  v5->_espressoPlan = (void *)plan;
  if (plan)
  {
    v7 = v5;
  }
  else
  {
LABEL_6:
    [(RawNightModeInferenceEspresso *)v5 resetState];
    v7 = 0;
  }

  return v7;
}

- (void)loadEspressoNetworkFromPath:(const char *)a3 withStorageType:(int)a4
{
  int v5 = espresso_plan_add_network();
  if (!(espresso_plan_build() | v5)) {
    self->_valid = 1;
  }
}

- (int)resetState
{
  int result = espresso_plan_destroy();
  if (!result)
  {
    self->_espressoPlan = 0;
    int result = espresso_context_destroy();
    if (!result)
    {
      self->_espressoContext = 0;
      self->_valid = 0;
    }
  }
  return result;
}

- (void)espressoContext
{
  return self->_espressoContext;
}

- (void)espressoPlan
{
  return self->_espressoPlan;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)espressoNetwork
{
  uint64_t v2 = *(void *)&self->_espressoNetwork.network_index;
  uint64_t plan = self->_espressoNetwork.plan;
  result.var1 = v2;
  result.var0 = plan;
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

@end