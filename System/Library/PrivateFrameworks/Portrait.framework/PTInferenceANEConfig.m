@interface PTInferenceANEConfig
- (PTInferenceANEConfig)initWithEspressoPlanPriority:(int)a3 espressoEngine:(int)a4;
- (id)MLANEExecutionPriority;
- (int)espressoEngine;
- (int)espressoPlanPriority;
- (unint64_t)VNRequestModelExecutionPriority;
- (void)MLANEExecutionPriority;
@end

@implementation PTInferenceANEConfig

- (int)espressoPlanPriority
{
  return self->_espressoPlanPriority;
}

- (int)espressoEngine
{
  return self->_espressoEngine;
}

- (PTInferenceANEConfig)initWithEspressoPlanPriority:(int)a3 espressoEngine:(int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PTInferenceANEConfig;
  v6 = [(PTInferenceANEConfig *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_espressoPlanPriority = a3;
    v6->_espressoEngine = a4;
    v8 = v6;
  }

  return v7;
}

- (unint64_t)VNRequestModelExecutionPriority
{
  p_espressoPlanPriority = &self->_espressoPlanPriority;
  unint64_t result = self->_espressoPlanPriority;
  if (result != 1)
  {
    if (result == 0x2000)
    {
      return 2;
    }
    else
    {
      v4 = _PTLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(PTInferenceANEConfig *)p_espressoPlanPriority MLANEExecutionPriority];
      }

      return 0;
    }
  }
  return result;
}

- (id)MLANEExecutionPriority
{
  p_int espressoPlanPriority = &self->_espressoPlanPriority;
  int espressoPlanPriority = self->_espressoPlanPriority;
  if (espressoPlanPriority == 1)
  {
    v4 = (void **)MEMORY[0x1E4F1E878];
  }
  else if (espressoPlanPriority == 0x2000)
  {
    v4 = (void **)MEMORY[0x1E4F1E880];
  }
  else
  {
    v5 = _PTLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(PTInferenceANEConfig *)p_espressoPlanPriority MLANEExecutionPriority];
    }

    v4 = (void **)MEMORY[0x1E4F1E888];
  }
  v6 = *v4;

  return v6;
}

- (void)MLANEExecutionPriority
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Unsupported priority %i", (uint8_t *)v3, 8u);
}

@end