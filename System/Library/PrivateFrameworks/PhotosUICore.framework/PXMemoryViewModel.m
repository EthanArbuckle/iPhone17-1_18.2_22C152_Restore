@interface PXMemoryViewModel
- (BOOL)isHighlighted;
- (NSString)localizedDateText;
- (NSString)localizedTitle;
- (PXDisplayAsset)keyAsset;
- (PXMemoryViewModel)init;
- (UIEdgeInsets)layoutMargins;
- (int64_t)specSet;
- (int64_t)variant;
- (void)performChanges:(id)a3;
- (void)setIsHighlighted:(BOOL)a3;
- (void)setKeyAsset:(id)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setLocalizedDateText:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setSpecSet:(int64_t)a3;
- (void)setVariant:(int64_t)a3;
@end

@implementation PXMemoryViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDateText, 0);
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)variant
{
  return self->_variant;
}

- (int64_t)specSet
{
  return self->_specSet;
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDateText
{
  return self->_localizedDateText;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXMemoryViewModel;
  [(PXMemoryViewModel *)&v3 performChanges:a3];
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
}

- (void)setVariant:(int64_t)a3
{
  if (self->_variant != a3)
  {
    [(PXMemoryViewModel *)self signalChange:16];
    self->_variant = a3;
  }
}

- (void)setSpecSet:(int64_t)a3
{
  if (self->_specSet != a3)
  {
    [(PXMemoryViewModel *)self signalChange:16];
    self->_specSet = a3;
  }
}

- (void)setIsHighlighted:(BOOL)a3
{
  if (self->_isHighlighted != a3)
  {
    [(PXMemoryViewModel *)self signalChange:8];
    self->_isHighlighted = a3;
  }
}

- (void)setKeyAsset:(id)a3
{
  v9 = (PXDisplayAsset *)a3;
  v4 = self->_keyAsset;
  keyAsset = v9;
  if (v4 != v9)
  {
    v6 = v4;
    char v7 = [(PXDisplayAsset *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    [(PXMemoryViewModel *)self signalChange:4];
    v8 = v9;
    keyAsset = self->_keyAsset;
    self->_keyAsset = v8;
  }

LABEL_5:
}

- (void)setLocalizedTitle:(id)a3
{
  v9 = (NSString *)a3;
  v4 = self->_localizedTitle;
  localizedTitle = v9;
  if (v4 != v9)
  {
    v6 = v4;
    BOOL v7 = [(NSString *)v4 isEqualToString:v9];

    if (v7) {
      goto LABEL_5;
    }
    [(PXMemoryViewModel *)self signalChange:2];
    v8 = v9;
    localizedTitle = self->_localizedTitle;
    self->_localizedTitle = v8;
  }

LABEL_5:
}

- (void)setLocalizedDateText:(id)a3
{
  v9 = (NSString *)a3;
  v4 = self->_localizedDateText;
  localizedDateText = v9;
  if (v4 != v9)
  {
    v6 = v4;
    BOOL v7 = [(NSString *)v4 isEqualToString:v9];

    if (v7) {
      goto LABEL_5;
    }
    [(PXMemoryViewModel *)self signalChange:1];
    v8 = v9;
    localizedDateText = self->_localizedDateText;
    self->_localizedDateText = v8;
  }

LABEL_5:
}

- (PXMemoryViewModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXMemoryViewModel;
  v2 = [(PXMemoryViewModel *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    localizedTitle = v2->_localizedTitle;
    v2->_localizedTitle = (NSString *)&stru_1F00B0030;

    localizedDateText = v3->_localizedDateText;
    v3->_localizedDateText = (NSString *)&stru_1F00B0030;
  }
  return v3;
}

@end