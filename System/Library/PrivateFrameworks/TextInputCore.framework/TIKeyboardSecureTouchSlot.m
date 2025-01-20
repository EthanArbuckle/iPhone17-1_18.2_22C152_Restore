@interface TIKeyboardSecureTouchSlot
- (BSInvalidatable)invalidatable;
- (unint64_t)authenticationMessageContext;
- (unsigned)slotID;
- (void)dealloc;
- (void)setAuthenticationMessageContext:(unint64_t)a3;
- (void)setInvalidatable:(id)a3;
- (void)setSlotID:(unsigned int)a3;
@end

@implementation TIKeyboardSecureTouchSlot

- (void).cxx_destruct
{
}

- (void)setInvalidatable:(id)a3
{
}

- (BSInvalidatable)invalidatable
{
  return self->_invalidatable;
}

- (void)setAuthenticationMessageContext:(unint64_t)a3
{
  self->_authenticationMessageContext = a3;
}

- (unint64_t)authenticationMessageContext
{
  return self->_authenticationMessageContext;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_slotID = a3;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unsigned int slotID = self->_slotID;
    *(_DWORD *)buf = 136315394;
    v7 = "-[TIKeyboardSecureTouchSlot dealloc]";
    __int16 v8 = 1024;
    unsigned int v9 = slotID;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Invalidating slotID %X", buf, 0x12u);
  }
  [(BSInvalidatable *)self->_invalidatable invalidate];
  self->_unsigned int slotID = 0;
  invalidatable = self->_invalidatable;
  self->_invalidatable = 0;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardSecureTouchSlot;
  [(TIKeyboardSecureTouchSlot *)&v5 dealloc];
}

@end