@interface TUIVSpacer
- ($881BB7C90C7D0DFCC1492E3DC022A30F)height;
- (Class)layoutClass;
- (void)setHeight:(id *)a3;
@end

@implementation TUIVSpacer

- (void)setHeight:(id *)a3
{
  *(void *)&self->_height.value = a3;
  *(void *)&self->_height.max = v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)height
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_height.value;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

@end