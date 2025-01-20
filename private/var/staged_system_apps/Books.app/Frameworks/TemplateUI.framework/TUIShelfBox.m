@interface TUIShelfBox
- ($881BB7C90C7D0DFCC1492E3DC022A30F)contentWidth;
- (Class)layoutClass;
- (TUIModelLayoutable)background;
- (TUIModelLayoutable)content;
- (TUIModelLayoutable)contentBackground;
- (void)onContainedModelsChanged;
- (void)setContentWidth:(id *)a3;
@end

@implementation TUIShelfBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (void)onContainedModelsChanged
{
  v3 = objc_opt_new();
  [(TUIContainerBox *)self appendLayoutChildrenToArray:v3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v7);
        v9 = v8;
        while (1)
        {
          if (objc_opt_respondsToSelector())
          {
            v10 = TUIProtocolCast(&OBJC_PROTOCOL___TUIModelWithRole, v9);
            if (v10) {
              break;
            }
          }
          v11 = [(TUIBox *)v9 parentModel];

          v12 = 0;
          if (v11)
          {
            v9 = v11;
            if (v11 != self) {
              continue;
            }
          }
          goto LABEL_13;
        }
        v13 = v10;
        v12 = [v10 role];

        v11 = v9;
LABEL_13:
        unsigned __int8 v14 = [v12 isEqualToString:@"content"];
        v15 = &OBJC_IVAR___TUIShelfBox__content;
        if ((v14 & 1) != 0
          || (unsigned __int8 v16 = [v12 isEqualToString:@"content-background"],
              v15 = &OBJC_IVAR___TUIShelfBox__contentBackground,
              (v16 & 1) != 0)
          || (unsigned int v17 = [v12 isEqualToString:@"background"],
              v15 = &OBJC_IVAR___TUIShelfBox__background,
              v17))
        {
          objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v15), v8);
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)contentWidth
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_contentWidth.value;
}

- (void)setContentWidth:(id *)a3
{
  *(void *)&self->_contentWidth.value = a3;
  *(void *)&self->_contentWidth.max = v3;
}

- (TUIModelLayoutable)content
{
  return self->_content;
}

- (TUIModelLayoutable)contentBackground
{
  return self->_contentBackground;
}

- (TUIModelLayoutable)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_contentBackground, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end