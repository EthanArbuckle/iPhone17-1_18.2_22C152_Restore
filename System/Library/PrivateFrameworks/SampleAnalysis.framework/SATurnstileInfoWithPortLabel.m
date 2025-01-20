@interface SATurnstileInfoWithPortLabel
- (NSString)portName;
- (SATurnstileInfoWithPortLabel)initWithKCDataTurnstileInfo:(const stackshot_thread_turnstileinfo_v2 *)a3;
- (unint64_t)portDomain;
- (unint64_t)portFlags;
- (void)setPortDomain:(unint64_t)a3;
- (void)setPortFlags:(unint64_t)a3;
- (void)setPortName:(id)a3;
@end

@implementation SATurnstileInfoWithPortLabel

- (SATurnstileInfoWithPortLabel)initWithKCDataTurnstileInfo:(const stackshot_thread_turnstileinfo_v2 *)a3
{
  int v3 = *__error();
  v4 = _sa_logt();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_error_impl(&dword_1BF22B000, v4, OS_LOG_TYPE_ERROR, "SATurnstileInfoWithPortLabel init with port info", v12, 2u);
  }

  *__error() = v3;
  _SASetCrashLogMessage(3433, "SATurnstileInfoWithPortLabel init with port info", v5, v6, v7, v8, v9, v10, v12[0]);
  result = (SATurnstileInfoWithPortLabel *)_os_crash();
  __break(1u);
  return result;
}

- (NSString)portName
{
  return self->_portName;
}

- (void)setPortName:(id)a3
{
}

- (unint64_t)portFlags
{
  return self->_portFlags;
}

- (void)setPortFlags:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0x10000)
  {
    int v5 = *__error();
    uint64_t v6 = _sa_logt();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_fault_impl(&dword_1BF22B000, v6, OS_LOG_TYPE_FAULT, "port label flags 0x%llx is too large", (uint8_t *)&v7, 0xCu);
    }

    *__error() = v5;
  }
  self->_portFlags = a3;
}

- (unint64_t)portDomain
{
  return self->_portDomain;
}

- (void)setPortDomain:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0x100)
  {
    int v5 = *__error();
    uint64_t v6 = _sa_logt();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_fault_impl(&dword_1BF22B000, v6, OS_LOG_TYPE_FAULT, "port label domain %llu is too large", (uint8_t *)&v7, 0xCu);
    }

    *__error() = v5;
  }
  self->_portDomain = a3;
}

- (void).cxx_destruct
{
}

@end