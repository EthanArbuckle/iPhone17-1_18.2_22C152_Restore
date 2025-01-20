@interface OITSUMutableFormatObject
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFormatStruct:(id *)a3;
@end

@implementation OITSUMutableFormatObject

- (void)setFormatStruct:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OITSUMutableFormatObject;
  long long v3 = *(_OWORD *)&a3->var1.var7.var2;
  v4[0] = *(_OWORD *)&a3->var0;
  v4[1] = v3;
  uint64_t v5 = *((void *)&a3->var1.var7 + 3);
  [(OITSUFormatObject *)&v6 p_setFormatStruct:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [OITSUFormatObject alloc];
  if (self)
  {
    [(OITSUFormatObject *)self formatStruct];
  }
  else
  {
    uint64_t v8 = 0;
    long long v6 = 0u;
    long long v7 = 0u;
  }
  return [(OITSUFormatObject *)v4 initWithTSUFormatFormatStruct:&v6 useExpandedContents:[(OITSUFormatObject *)self useExpandedContents]];
}

@end