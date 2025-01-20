@interface AnimationSettings
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
@end

@implementation AnimationSettings

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  if (a5 == 1 && (LOBYTE(self[1].var1) & 1) == 0)
  {
    p_var9 = &self->var9;
    p_var8 = self + 1;
    p_var10 = &self->var10;
  }
  else
  {
    p_var9 = &self->var6;
    p_var10 = &self->var7;
    p_var8 = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)&self->var8;
  }
  double v8 = *p_var10;
  double var0 = p_var8->var0;
  retstr->double var0 = *p_var9;
  retstr->var1 = v8;
  *(_WORD *)&retstr->var2 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  retstr->var10 = var0;
  return self;
}

@end