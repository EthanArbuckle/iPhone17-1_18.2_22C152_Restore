@interface PBBulletProperties
+ (id)readBulletProperties:(PptParaProperty9 *)a3 state:(id)a4;
+ (int)readBulletNumberScheme:(int)a3;
+ (int)readBulletNumberSchemeFromExtended:(unsigned int)a3;
+ (int)writeBulletNumberScheme:(int)a3;
@end

@implementation PBBulletProperties

+ (id)readBulletProperties:(PptParaProperty9 *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (LOBYTE(a3->var1))
  {
    v8 = -[OADAutoNumberBulletProperties initWithAutoNumberSchemeType:startIndex:]([OADAutoNumberBulletProperties alloc], "initWithAutoNumberSchemeType:startIndex:", [a1 readBulletNumberScheme:*(_DWORD *)&a3->var3 & 0x3F], a3->var3.var1);
  }
  else
  {
    int v9 = *((__int16 *)&a3->var0 + 1);
    if (v9 < 0)
    {
      v8 = 0;
    }
    else
    {
      v10 = [v6 tgtPresentation];
      unsigned int v11 = [v10 bulletBlipCount];

      if (v11 >= (unsigned __int16)v9) {
        v12 = [[OADBlipRef alloc] initWithIndex:(unsigned __int16)v9 name:0 blip:0];
      }
      else {
        v12 = 0;
      }
      v8 = [[OADImageBulletProperties alloc] initWithBlipRef:v12];
    }
  }

  return v8;
}

+ (int)readBulletNumberScheme:(int)a3
{
  if (a3 > 0x28) {
    return 1;
  }
  else {
    return dword_238EEFB4C[a3];
  }
}

+ (int)readBulletNumberSchemeFromExtended:(unsigned int)a3
{
  return 1;
}

+ (int)writeBulletNumberScheme:(int)a3
{
  if ((a3 - 1) > 0x28) {
    return 3;
  }
  else {
    return dword_238EEFBF0[a3 - 1];
  }
}

@end