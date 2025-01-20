@interface _UIImageSystemImageVisualStyle
+ (id)_iosVisualStyle;
- (void)actionsImage;
- (void)addImage;
- (void)checkmarkImage;
- (void)removeImage;
- (void)strokedCheckmarkImage;
@end

@implementation _UIImageSystemImageVisualStyle

+ (id)_iosVisualStyle
{
  self;
  if (_MergedGlobals_1266 != -1) {
    dispatch_once(&_MergedGlobals_1266, &__block_literal_global_568);
  }
  v0 = (void *)qword_1EB2647E8;
  return v0;
}

- (void)actionsImage
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[1];
    if (!v3)
    {
      v4 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
      uint64_t v5 = +[UIImage systemImageNamed:@"ellipsis.circle.fill" withConfiguration:v4];
      v6 = (void *)v2[1];
      v2[1] = v5;

      v3 = (void *)v2[1];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addImage
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[2];
    if (!v3)
    {
      v4 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
      uint64_t v5 = +[UIImage systemImageNamed:@"plus.circle.fill" withConfiguration:v4];
      v6 = (void *)v2[2];
      v2[2] = v5;

      v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)removeImage
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[3];
    if (!v3)
    {
      v4 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
      uint64_t v5 = +[UIImage systemImageNamed:@"minus.circle.fill" withConfiguration:v4];
      v6 = (void *)v2[3];
      v2[3] = v5;

      v3 = (void *)v2[3];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)checkmarkImage
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      v3 = +[UIColor systemWhiteColor];
      v10[0] = v3;
      v4 = +[UIColor tintColor];
      v10[1] = v4;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
      v6 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v5];
      uint64_t v7 = +[UIImage systemImageNamed:@"checkmark.circle.fill" withConfiguration:v6];
      v8 = (void *)v1[4];
      v1[4] = v7;

      v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (void)strokedCheckmarkImage
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[5];
    if (!v3)
    {
      v4 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
      uint64_t v5 = +[UIImage _systemImageNamed:@"checkmark.circle.platter" withConfiguration:v4];
      v6 = (void *)v2[5];
      v2[5] = v5;

      v3 = (void *)v2[5];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_checkmarkImage, 0);
  objc_storeStrong((id *)&self->_removeImage, 0);
  objc_storeStrong((id *)&self->_addImage, 0);
  objc_storeStrong((id *)&self->_actionsImage, 0);
}

@end