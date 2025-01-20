@interface TUIHBox
- (BOOL)allowDynamicWindowInstantiation;
- (BOOL)childrenUsesModifiers;
- (Class)dynamicArrayLayoutContainerClass;
- (Class)layoutClass;
- (unint64_t)layoutMode;
- (void)setChildrenUsesModifiers:(BOOL)a3;
- (void)setLayoutMode:(unint64_t)a3;
@end

@implementation TUIHBox

- (void)setChildrenUsesModifiers:(BOOL)a3
{
  uint64_t v3 = *((unsigned __int16 *)&self->super.super._flags + 2) | (*((unsigned __int8 *)&self->super.super._flags + 6) << 16);
  uint64_t v4 = 0x4000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (*(_DWORD *)&self->super.super._flags | (unint64_t)(v3 << 32)) & 0xFFFBFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((_WORD *)&self->super.super._flags + 2) = v3;
  *((unsigned char *)&self->super.super._flags + 6) = BYTE6(v5);
}

- (BOOL)childrenUsesModifiers
{
  return (*((unsigned __int8 *)&self->super.super._flags + 6) >> 2) & 1;
}

- (void)setLayoutMode:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->super.super._flags + 6);
  __int16 v4 = *((_WORD *)&self->super.super._flags + 2);
  *(_DWORD *)&self->super.super._flags = *(_DWORD *)&self->super.super._flags & 0x3FFFFFFF | (a3 << 30);
  *((unsigned char *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = v4;
}

- (unint64_t)layoutMode
{
  return (unint64_t)*(_DWORD *)&self->super.super._flags >> 30;
}

- (BOOL)allowDynamicWindowInstantiation
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)dynamicArrayLayoutContainerClass
{
  return (Class)objc_opt_class();
}

@end