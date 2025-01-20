@interface SBFluidSwitcherSpaceTitleItem
- (BOOL)isEqual:(id)a3;
- (BOOL)showsMultiWindowIndicator;
- (NSString)subtitleText;
- (NSString)titleText;
- (SBDisplayItem)displayItem;
- (SBFluidSwitcherSpaceTitleItem)initWithDisplayItem:(id)a3;
- (UIColor)titleTextColor;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)subtitleInterfaceStyle;
- (unint64_t)hash;
- (void)setImage:(id)a3;
- (void)setShowsMultiWindowIndicator:(BOOL)a3;
- (void)setSubtitleInterfaceStyle:(int64_t)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation SBFluidSwitcherSpaceTitleItem

- (BOOL)isEqual:(id)a3
{
  v4 = (SBFluidSwitcherSpaceTitleItem *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = SBSafeCast(v5, v4);
    v7 = v6;
    if (v6)
    {
      v8 = [v6 displayItem];
      if (BSEqualObjects())
      {
        v9 = [v7 image];
        if (BSEqualObjects())
        {
          v10 = [v7 titleText];
          if (BSEqualStrings())
          {
            v11 = [(SBFluidSwitcherSpaceTitleItem *)v4 subtitleText];
            if (BSEqualStrings())
            {
              v12 = [(SBFluidSwitcherSpaceTitleItem *)v4 titleTextColor];
              BOOL v13 = BSEqualObjects()
                 && [v7 subtitleInterfaceStyle] == self->_subtitleInterfaceStyle
                 && self->_showsMultiWindowIndicator == [v7 showsMultiWindowIndicator];
            }
            else
            {
              BOOL v13 = 0;
            }
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (int64_t)subtitleInterfaceStyle
{
  return self->_subtitleInterfaceStyle;
}

- (BOOL)showsMultiWindowIndicator
{
  return self->_showsMultiWindowIndicator;
}

- (UIImage)image
{
  return self->_image;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (void)setTitleTextColor:(id)a3
{
}

- (void)setTitleText:(id)a3
{
}

- (void)setSubtitleText:(id)a3
{
}

- (void)setSubtitleInterfaceStyle:(int64_t)a3
{
  self->_subtitleInterfaceStyle = a3;
}

- (void)setShowsMultiWindowIndicator:(BOOL)a3
{
  self->_showsMultiWindowIndicator = a3;
}

- (void)setImage:(id)a3
{
}

- (SBFluidSwitcherSpaceTitleItem)initWithDisplayItem:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFluidSwitcherSpaceTitleItem;
  v7 = [(SBFluidSwitcherSpaceTitleItem *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"SBFluidSwitcherSpaceTitleItem.m", 20, @"Invalid parameter not satisfying: %@", @"displayItem" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_displayItem, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDisplayItem:", self->_displayItem);
  if (v4)
  {
    uint64_t v5 = [(UIImage *)self->_image copy];
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;

    uint64_t v7 = [(NSString *)self->_subtitleText copy];
    v8 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v7;

    uint64_t v9 = [(NSString *)self->_titleText copy];
    objc_super v10 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v9;

    uint64_t v11 = [(UIColor *)self->_titleTextColor copy];
    v12 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v11;

    *(void *)(v4 + 56) = self->_subtitleInterfaceStyle;
    *(unsigned char *)(v4 + 8) = self->_showsMultiWindowIndicator;
  }
  return (id)v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SBDisplayItem *)self->_displayItem hash];
  unint64_t v4 = [(UIImage *)self->_image hash] + v3;
  NSUInteger v5 = [(NSString *)self->_titleText hash];
  unint64_t v6 = v4 + v5 + [(NSString *)self->_subtitleText hash];
  return self->_showsMultiWindowIndicator
       + [(UIColor *)self->_titleTextColor hash]
       + self->_subtitleInterfaceStyle
       + v6
       + 67;
}

@end