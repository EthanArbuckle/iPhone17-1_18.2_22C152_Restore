@interface TUIHFlowBox
- ($881BB7C90C7D0DFCC1492E3DC022A30F)hspacing;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)vspacing;
- (Class)layoutClass;
- (unint64_t)layoutMode;
- (void)setHspacing:(id *)a3;
- (void)setLayoutMode:(unint64_t)a3;
- (void)setVspacing:(id *)a3;
@end

@implementation TUIHFlowBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(unint64_t)a3
{
  self->_layoutMode = a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)hspacing
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_hspacing.value;
}

- (void)setHspacing:(id *)a3
{
  *(void *)&self->_hspacing.value = a3;
  *(void *)&self->_hspacing.max = v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)vspacing
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_hspacing._flags;
}

- (void)setVspacing:(id *)a3
{
  *(void *)&self->_hspacing._flags = a3;
  *(void *)&self->_vspacing.min = v3;
}

@end