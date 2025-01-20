@interface _PXGViewSetupParameters
- ($3BA783FF50B239963188BE194EBFFEBA)textureInfo;
- (BOOL)needsParenting;
- (BOOL)separateLayers;
- (PXGSpriteTexture)texture;
- (unsigned)spriteIndex;
- (void)setNeedsParenting:(BOOL)a3;
- (void)setSeparateLayers:(BOOL)a3;
- (void)setSpriteIndex:(unsigned int)a3;
- (void)setTexture:(id)a3;
- (void)setTextureInfo:(id)a3;
@end

@implementation _PXGViewSetupParameters

- (void).cxx_destruct
{
}

- (void)setSpriteIndex:(unsigned int)a3
{
  self->_spriteIndex = a3;
}

- (unsigned)spriteIndex
{
  return self->_spriteIndex;
}

- (void)setTextureInfo:(id)a3
{
  long long v4 = *v3;
  long long v5 = v3[1];
  long long v6 = v3[3];
  *(_OWORD *)&self[2].super.isa = v3[2];
  *(_OWORD *)&self[2]._texture = v6;
  *(_OWORD *)&self[1].super.isa = v4;
  *(_OWORD *)&self[1]._texture = v5;
}

- ($3BA783FF50B239963188BE194EBFFEBA)textureInfo
{
  long long v3 = *(_OWORD *)&self[1]._texture;
  _OWORD *v2 = *(_OWORD *)&self[1].super.isa;
  v2[1] = v3;
  long long v4 = *(_OWORD *)&self[2].super.isa;
  long long v5 = *(_OWORD *)&self[2]._texture;
  v2[2] = v4;
  v2[3] = v5;
  return ($3BA783FF50B239963188BE194EBFFEBA)v4;
}

- (void)setTexture:(id)a3
{
}

- (PXGSpriteTexture)texture
{
  return self->_texture;
}

- (void)setSeparateLayers:(BOOL)a3
{
  self->_separateLayers = a3;
}

- (BOOL)separateLayers
{
  return self->_separateLayers;
}

- (void)setNeedsParenting:(BOOL)a3
{
  self->_needsParenting = a3;
}

- (BOOL)needsParenting
{
  return self->_needsParenting;
}

@end