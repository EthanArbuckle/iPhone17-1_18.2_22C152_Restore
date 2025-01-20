@interface UIBarItem
+ (id)_appearanceBlindViewClasses;
+ (id)_appearanceWhenContainedIn:(id)a3;
+ (id)appearance;
+ (id)appearanceForTraitCollection:(id)a3;
+ (id)appearanceForTraitCollection:(id)a3 whenContainedIn:(Class)a4;
+ (id)appearanceForTraitCollection:(id)a3 whenContainedInInstancesOfClasses:(id)a4;
+ (id)appearanceWhenContainedIn:(Class)a3;
+ (id)appearanceWhenContainedInInstancesOfClasses:(id)a3;
- (BOOL)_hasCustomizableInstanceAppearanceModifications;
- (BOOL)_shouldArchiveUIAppearanceTags;
- (BOOL)hasImage;
- (BOOL)hasTitle;
- (BOOL)selected;
- (NSDictionary)titleTextAttributesForState:(UIControlState)state;
- (NSInteger)tag;
- (UIBarItem)init;
- (UIBarItem)initWithCoder:(NSCoder *)coder;
- (UIEdgeInsets)largeContentSizeImageInsets;
- (UIImage)largeContentSizeImage;
- (id)_attributedTitleForState:(unint64_t)a3 withDefaultAttributes:(id)a4;
- (void)_setHasCustomizableInstanceAppearanceModifications:(BOOL)a3;
- (void)_setShouldArchiveUIAppearanceTags:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLargeContentSizeImage:(UIImage *)largeContentSizeImage;
- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)largeContentSizeImageInsets;
- (void)setTag:(NSInteger)tag;
@end

@implementation UIBarItem

- (void).cxx_destruct
{
}

- (NSInteger)tag
{
  return self->_tag;
}

- (UIBarItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIBarItem;
  return [(UIBarItem *)&v3 init];
}

- (void)setTag:(NSInteger)tag
{
  self->_tag = tag;
}

- (UIImage)largeContentSizeImage
{
  return self->_largeContentSizeImage;
}

- (UIEdgeInsets)largeContentSizeImageInsets
{
  double top = self->_largeContentSizeImageInsets.top;
  double left = self->_largeContentSizeImageInsets.left;
  double bottom = self->_largeContentSizeImageInsets.bottom;
  double right = self->_largeContentSizeImageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIBarItem)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v13.receiver = self;
  v13.super_class = (Class)UIBarItem;
  v5 = [(UIBarItem *)&v13 init];
  if (v5)
  {
    v6 = [(NSCoder *)v4 decodeObjectForKey:0x1ED12AC00];
    if (v6) {
      objc_setAssociatedObject(v5, &_UIAppearanceCustomizedSelectorsAssociationKey, v6, (void *)1);
    }
    v7 = [(NSCoder *)v4 decodeObjectForKey:@"_UIBarItemLargeContentSizeImageCodingKey"];
    if (v7) {
      objc_storeStrong((id *)&v5->_largeContentSizeImage, v7);
    }
    [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"_UIBarItemLargeContentSizeImageInsetsCodingKey"];
    v5->_largeContentSizeImageInsets.double top = v8;
    v5->_largeContentSizeImageInsets.double left = v9;
    v5->_largeContentSizeImageInsets.double bottom = v10;
    v5->_largeContentSizeImageInsets.double right = v11;
  }
  return v5;
}

+ (id)_appearanceBlindViewClasses
{
  return 0;
}

+ (id)appearance
{
  return +[_UIBarItemAppearance _appearanceForClass:a1 withContainerList:0];
}

+ (id)_appearanceWhenContainedIn:(id)a3
{
  return +[_UIBarItemAppearance _appearanceForClass:a1 withContainerList:a3];
}

+ (id)appearanceWhenContainedInInstancesOfClasses:(id)a3
{
  v4 = _UIInternalContainerClassArrayForContainerClassArray(a3);
  v5 = [a1 _appearanceWhenContainedIn:v4];

  return v5;
}

+ (id)appearanceWhenContainedIn:(Class)a3
{
  if (!a3
    || (_UIInternalContainerClassesForContainerClasses(a3, &v9, 0), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v4 = [MEMORY[0x1E4F1C978] array];
  }
  v5 = (void *)v4;
  v6 = [a1 _appearanceWhenContainedIn:v4];

  return v6;
}

+ (id)appearanceForTraitCollection:(id)a3
{
  return 0;
}

+ (id)appearanceForTraitCollection:(id)a3 whenContainedInInstancesOfClasses:(id)a4
{
  return 0;
}

+ (id)appearanceForTraitCollection:(id)a3 whenContainedIn:(Class)a4
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (self->_shouldArchiveUIAppearanceTags)
  {
    uint64_t v4 = objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
    if (v4) {
      [v6 encodeObject:v4 forKey:0x1ED12AC00];
    }
  }
  largeContentSizeImage = self->_largeContentSizeImage;
  if (largeContentSizeImage) {
    [v6 encodeObject:largeContentSizeImage forKey:@"_UIBarItemLargeContentSizeImageCodingKey"];
  }
  if (self->_largeContentSizeImageInsets.top != 0.0
    || self->_largeContentSizeImageInsets.bottom != 0.0
    || self->_largeContentSizeImageInsets.left != 0.0
    || self->_largeContentSizeImageInsets.right != 0.0)
  {
    objc_msgSend(v6, "encodeUIEdgeInsets:forKey:", @"_UIBarItemLargeContentSizeImageInsetsCodingKey");
  }
}

- (NSDictionary)titleTextAttributesForState:(UIControlState)state
{
  return 0;
}

- (BOOL)selected
{
  return 0;
}

- (BOOL)hasTitle
{
  return 0;
}

- (BOOL)hasImage
{
  return 0;
}

- (id)_attributedTitleForState:(unint64_t)a3 withDefaultAttributes:(id)a4
{
  id v6 = a4;
  if ([(UIBarItem *)self hasTitle])
  {
    id v7 = v6;
    CGFloat v8 = [(UIBarItem *)self titleTextAttributesForState:a3];
    if ([v8 count])
    {
      CGFloat v9 = (void *)[v7 mutableCopy];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__UIBarItem__attributedTitleForState_withDefaultAttributes___block_invoke;
      v16[3] = &unk_1E52DDE90;
      id v10 = v9;
      id v17 = v10;
      [v8 enumerateKeysAndObjectsUsingBlock:v16];
      id v11 = v10;

      id v7 = v11;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    objc_super v13 = [(UIBarItem *)self resolvedTitle];
    v14 = (void *)[v12 initWithString:v13 attributes:v7];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __60__UIBarItem__attributedTitleForState_withDefaultAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (BOOL)_hasCustomizableInstanceAppearanceModifications
{
  return self->_hasCustomizableInstanceAppearanceModifications;
}

- (void)_setHasCustomizableInstanceAppearanceModifications:(BOOL)a3
{
  self->_hasCustomizableInstanceAppearanceModifications = a3;
}

- (BOOL)_shouldArchiveUIAppearanceTags
{
  return self->_shouldArchiveUIAppearanceTags;
}

- (void)_setShouldArchiveUIAppearanceTags:(BOOL)a3
{
  self->_shouldArchiveUIAppearanceTags = a3;
}

- (void)setLargeContentSizeImage:(UIImage *)largeContentSizeImage
{
}

- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)largeContentSizeImageInsets
{
  self->_largeContentSizeImageInsets = largeContentSizeImageInsets;
}

@end