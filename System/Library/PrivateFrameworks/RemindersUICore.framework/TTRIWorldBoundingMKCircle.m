@interface TTRIWorldBoundingMKCircle
- ($C520CFB175AC9A293A25BE3F3A512759)boundingMapRect;
- ($C520CFB175AC9A293A25BE3F3A512759)originalBoundingMapRect;
@end

@implementation TTRIWorldBoundingMKCircle

- ($C520CFB175AC9A293A25BE3F3A512759)boundingMapRect
{
  double v2 = *MEMORY[0x1E4F30DA0];
  double v3 = *(double *)(MEMORY[0x1E4F30DA0] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F30DA0] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F30DA0] + 24);
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- ($C520CFB175AC9A293A25BE3F3A512759)originalBoundingMapRect
{
  v6.receiver = self;
  v6.super_class = (Class)TTRIWorldBoundingMKCircle;
  [(MKCircle *)&v6 boundingMapRect];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

@end