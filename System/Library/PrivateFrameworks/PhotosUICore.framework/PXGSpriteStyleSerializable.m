@interface PXGSpriteStyleSerializable
- ($225AF24142A77900D29617A74D173C5F)spriteStyle;
- (PXGSpriteStyleSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setSpriteStyle:(id *)a3;
@end

@implementation PXGSpriteStyleSerializable

- (void)setSpriteStyle:(id *)a3
{
  long long v3 = *(long long *)((char *)&a3->var1 + 12);
  *(_OWORD *)&self->_spriteStyle.alpha = *(_OWORD *)&a3->var0;
  *(_OWORD *)self[1]._anon_8 = v3;
  long long v4 = *(_OWORD *)&a3->var5;
  $6FCFBD36564ECBB6D9D1614A84D6F83D var1 = a3[1].var1;
  long long v6 = *(_OWORD *)&a3[1].var6;
  *(_OWORD *)self[3]._anon_8 = *(_OWORD *)&a3[1].var2;
  *(_OWORD *)&self[4].super.isa = v6;
  *(_OWORD *)&self[2].super.isa = v4;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[2]._spriteStyle.alpha = var1;
  long long v7 = *(long long *)((char *)&a3[2].var1 + 4);
  long long v8 = *(_OWORD *)&a3[2].var3;
  long long v9 = *(long long *)((char *)&a3[3].var1 + 8);
  *(_OWORD *)&self[6].super.isa = *(_OWORD *)&a3[2].var8;
  *(_OWORD *)&self[6]._spriteStyle.alpha = v9;
  *(_OWORD *)&self[4]._spriteStyle.alpha = v7;
  *(_OWORD *)self[5]._anon_8 = v8;
}

- ($225AF24142A77900D29617A74D173C5F)spriteStyle
{
  long long v3 = *(_OWORD *)&self[2].var8;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[2].var1 + 4) = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[2].var3;
  *(_OWORD *)&retstr[2].var3 = v3;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v4 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[3].var4;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&retstr[2].var8 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&self[3].var1
                                                                                               + 8);
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[3].var1 + 8) = v4;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v5 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[1].var2;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&retstr->var5 = self[1].var1;
  retstr[1].$6FCFBD36564ECBB6D9D1614A84D6F83D var1 = v5;
  long long v6 = *(long long *)((char *)&self[2].var1 + 4);
  *(_OWORD *)&retstr[1].var2 = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr[1].var6 = v6;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v7 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self->var5;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&retstr->var0 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&self->var1 + 12);
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr->var1 + 12) = v7;
  return self;
}

- (id)createSerializableObject
{
  v5[21] = *MEMORY[0x1E4F143B8];
  [(PXGSpriteStyleSerializable *)self spriteStyle];
  long long v3 = PXGSerializeSpriteStyle((uint64_t)v5, v2);
  return v3;
}

- (PXGSpriteStyleSerializable)initWithSerializableObject:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXGSpriteStyleSerializable;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v5 = [(PXGSpriteStyleSerializable *)&v7 init];
  if (v5)
  {
    PXGDeserializeSpriteStyle(v4, (uint64_t)v8);
    [(PXGSpriteStyleSerializable *)v5 setSpriteStyle:v8];
  }

  return v5;
}

@end