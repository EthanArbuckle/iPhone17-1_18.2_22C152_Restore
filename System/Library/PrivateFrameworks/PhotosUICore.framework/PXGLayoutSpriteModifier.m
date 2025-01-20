@interface PXGLayoutSpriteModifier
- (PXGLayoutSpriteModifier)initWithStateHandler:(id)a3;
- (void)modifySpriteDataStore:(id)a3 spriteIndexRange:(_PXGSpriteIndexRange)a4 forLayout:(id)a5;
@end

@implementation PXGLayoutSpriteModifier

- (void).cxx_destruct
{
}

- (void)modifySpriteDataStore:(id)a3 spriteIndexRange:(_PXGSpriteIndexRange)a4 forLayout:(id)a5
{
  id v9 = a5;
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  if (a3) {
    [a3 spritesInRange:a4];
  }
  stateHandler = self->_stateHandler;
  v11 = (void (*)(void *, id, _PXGSpriteIndexRange, _OWORD *, uint64_t))stateHandler[2];
  v12[0] = v14;
  v12[1] = v15;
  uint64_t v13 = v16;
  ((void (*)(void, void, void, void, void))v11)(stateHandler, v9, a4, v12, v8);
}

- (PXGLayoutSpriteModifier)initWithStateHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGLayoutSpriteModifier;
  v5 = [(PXGLayoutSpriteModifier *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id stateHandler = v5->_stateHandler;
    v5->_id stateHandler = v6;
  }
  return v5;
}

@end