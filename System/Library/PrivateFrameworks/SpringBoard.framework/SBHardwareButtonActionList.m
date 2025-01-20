@interface SBHardwareButtonActionList
- (BOOL)isButtonDown;
- (NSMutableArray)actionBlocks;
- (void)performQueuedButtonUpActions;
- (void)scheduleButtonUpActionBlock:(id)a3;
- (void)setActionBlocks:(id)a3;
- (void)setButtonDown:(BOOL)a3;
@end

@implementation SBHardwareButtonActionList

- (void)scheduleButtonUpActionBlock:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_buttonDown)
  {
    if (!self->_actionBlocks)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      actionBlocks = self->_actionBlocks;
      self->_actionBlocks = v5;
    }
    v7 = (void *)[v10 copy];
    v8 = self->_actionBlocks;
    v9 = (void *)MEMORY[0x1D948C7A0]();
    [(NSMutableArray *)v8 addObject:v9];
  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)performQueuedButtonUpActions
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "maximum reentrant queued button list actions exceeded (%d)", (uint8_t *)v3, 8u);
}

- (BOOL)isButtonDown
{
  return self->_buttonDown;
}

- (void)setButtonDown:(BOOL)a3
{
  self->_buttonDown = a3;
}

- (NSMutableArray)actionBlocks
{
  return self->_actionBlocks;
}

- (void)setActionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end