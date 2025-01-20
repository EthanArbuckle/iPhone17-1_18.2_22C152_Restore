@interface PTEffectReaction
- (BOOL)uiTriggeredReaction;
- (double)position;
- (id)emoji;
- (int64_t)triggerID;
- (unint64_t)effectType;
- (unint64_t)orientation;
- (void)emoji;
- (void)setEffectType:(unint64_t)a3;
- (void)setOrientation:(unint64_t)a3;
- (void)setPosition:(PTEffectReaction *)self;
- (void)setTriggerID:(int64_t)a3;
- (void)setUiTriggeredReaction:(BOOL)a3;
@end

@implementation PTEffectReaction

- (id)emoji
{
  v3 = objc_opt_new();
  v4 = v3;
  unint64_t effectType = self->_effectType;
  p_unint64_t effectType = (uint64_t *)&self->_effectType;
  unint64_t v5 = effectType;
  if (effectType >= 8)
  {
    v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(PTEffectReaction *)p_effectType emoji];
    }

    id v8 = 0;
  }
  else
  {
    [v3 appendString:off_1E68845F0[v5]];
    id v8 = v4;
  }

  return v8;
}

- (int64_t)triggerID
{
  return self->_triggerID;
}

- (void)setTriggerID:(int64_t)a3
{
  self->_triggerID = a3;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(unint64_t)a3
{
  self->_unint64_t effectType = a3;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (double)position
{
  return *(double *)(a1 + 40);
}

- (void)setPosition:(PTEffectReaction *)self
{
  *(void *)self->_position = v2;
}

- (BOOL)uiTriggeredReaction
{
  return self->_uiTriggeredReaction;
}

- (void)setUiTriggeredReaction:(BOOL)a3
{
  self->_uiTriggeredReaction = a3;
}

- (void)emoji
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Invalid type %i", (uint8_t *)v3, 8u);
}

@end