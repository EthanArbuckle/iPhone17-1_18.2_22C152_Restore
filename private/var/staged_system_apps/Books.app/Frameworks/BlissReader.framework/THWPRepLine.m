@interface THWPRepLine
+ (id)lineWithLineMetrics:(id *)a3;
- ($7BE0D44FB4096312BEEDFE684BFD847A)lineMetrics;
@end

@implementation THWPRepLine

+ (id)lineWithLineMetrics:(id *)a3
{
  id result = objc_alloc_init(THWPRepLine);
  long long v5 = *(_OWORD *)&a3->var1;
  long long v6 = *(_OWORD *)&a3->var3;
  CGSize size = a3->var0.size;
  *(CGPoint *)((char *)result + 8) = a3->var0.origin;
  *(_OWORD *)((char *)result + 56) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  *(CGSize *)((char *)result + 24) = size;
  return result;
}

- ($7BE0D44FB4096312BEEDFE684BFD847A)lineMetrics
{
  CGSize v3 = *(CGSize *)&self->var0.size.height;
  retstr->var0.origin = *(CGPoint *)&self->var0.origin.y;
  retstr->var0.CGSize size = v3;
  long long v4 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self->var2;
  *(_OWORD *)&retstr->var3 = v4;
  return self;
}

@end