@interface VFXTriggerManager
+ (BOOL)supportsSecureCoding;
- (VFXTriggerManager)initWithCoder:(id)a3;
- (id)world;
- (void)dealloc;
- (void)enableTriggerTypes:(id)a3;
- (void)setWorld:(id)a3;
- (void)triggerType:(id)a3 event:(id)a4 fromView:(id)a5;
@end

@implementation VFXTriggerManager

- (VFXTriggerManager)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VFXTriggerManager;
  return [(VFXTriggerManager *)&v4 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VFXTriggerManager;
  [(VFXTriggerManager *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)triggerType:(id)a3 event:(id)a4 fromView:(id)a5
{
}

- (void)setWorld:(id)a3
{
  self->_world = (VFXWorld *)a3;
  MEMORY[0x1F4181798](_TtC3VFX8VFXScene, sel_registerWithTriggerManager_inWorld_, self, a3);
}

- (id)world
{
  return self->_world;
}

- (void)enableTriggerTypes:(id)a3
{
  objc_sync_enter(self);
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFFE | objc_msgSend_containsObject_(a3, v5, @"VFXTriggerTypeMouseDown", v6);
  if (objc_msgSend_containsObject_(a3, v7, @"VFXTriggerTypeMouseUp", v8)) {
    __int16 v11 = 2;
  }
  else {
    __int16 v11 = 0;
  }
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFFD | v11;
  if (objc_msgSend_containsObject_(a3, v9, @"VFXTriggerTypeMouseDragged", v10)) {
    __int16 v14 = 8;
  }
  else {
    __int16 v14 = 0;
  }
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFF7 | v14;
  objc_msgSend_containsObject_(a3, v12, @"VFXTriggerTypeMouseMoved", v13);
  *(_WORD *)&self->_enabledTypes &= ~4u;
  if (objc_msgSend_containsObject_(a3, v15, @"VFXTriggerTypeKeyDown", v16)) {
    __int16 v19 = 16;
  }
  else {
    __int16 v19 = 0;
  }
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFEF | v19;
  if (objc_msgSend_containsObject_(a3, v17, @"VFXTriggerTypeKeyUp", v18)) {
    __int16 v22 = 32;
  }
  else {
    __int16 v22 = 0;
  }
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFDF | v22;
  if (objc_msgSend_containsObject_(a3, v20, @"VFXTriggerTypeTouchBegan", v21)) {
    __int16 v25 = 64;
  }
  else {
    __int16 v25 = 0;
  }
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFFBF | v25;
  if (objc_msgSend_containsObject_(a3, v23, @"VFXTriggerTypeTouchMoved", v24)) {
    __int16 v28 = 128;
  }
  else {
    __int16 v28 = 0;
  }
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFF7F | v28;
  if (objc_msgSend_containsObject_(a3, v26, @"VFXTriggerTypeTouchEnded", v27)) {
    __int16 v31 = 256;
  }
  else {
    __int16 v31 = 0;
  }
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFEFF | v31;
  if (objc_msgSend_containsObject_(a3, v29, @"VFXTriggerTypeTouchCanceled", v30)) {
    __int16 v32 = 512;
  }
  else {
    __int16 v32 = 0;
  }
  *(_WORD *)&self->_enabledTypes = *(_WORD *)&self->_enabledTypes & 0xFDFF | v32;

  objc_sync_exit(self);
}

@end