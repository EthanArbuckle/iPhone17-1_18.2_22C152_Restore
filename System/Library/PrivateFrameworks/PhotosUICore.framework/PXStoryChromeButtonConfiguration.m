@interface PXStoryChromeButtonConfiguration
- (BOOL)applyTintColorAsHierarchicalColor;
- (BOOL)backgroundColorAdaptsToHoveredState;
- (BOOL)backgroundExtendsUnderLabel;
- (BOOL)enabled;
- (BOOL)hasBadgeImageContent;
- (BOOL)hasPrimaryImageContent;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)transform;
- (CGPoint)offset;
- (CGSize)badgePadding;
- (NSArray)badgeSystemImageColors;
- (NSObject)customContextMenuInteractionDelegate;
- (NSString)axLabel;
- (NSString)badgeSystemImageName;
- (NSString)label;
- (NSString)systemImageName;
- (NSSymbolContentTransition)symbolTransition;
- (PXDisplayAsset)displayAsset;
- (PXStoryChromeButtonConfiguration)init;
- (PXStoryChromeButtonSpec)spec;
- (SEL)action;
- (UIColor)focusedTintColor;
- (UIColor)solidBackgroundColor;
- (UIColor)tintColor;
- (UIEdgeInsets)contentEdgeInsets;
- (UIEdgeInsets)hitTestEdgeOutsets;
- (UIEdgeInsets)pointerShapeInsets;
- (UIMenu)menu;
- (double)badgeBorderWidth;
- (double)preferredSystemImagePointSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)target;
- (int64_t)backgroundStyle;
- (int64_t)pointerShape;
- (int64_t)preferredSystemImageWeight;
- (int64_t)systemImageStyle;
- (unint64_t)badgeEdges;
- (unint64_t)hash;
- (void)setAction:(SEL)a3;
- (void)setApplyTintColorAsHierarchicalColor:(BOOL)a3;
- (void)setAxLabel:(id)a3;
- (void)setBackgroundColorAdaptsToHoveredState:(BOOL)a3;
- (void)setBackgroundExtendsUnderLabel:(BOOL)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBadgeBorderWidth:(double)a3;
- (void)setBadgeEdges:(unint64_t)a3;
- (void)setBadgePadding:(CGSize)a3;
- (void)setBadgeSystemImageColors:(id)a3;
- (void)setBadgeSystemImageName:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setCustomContextMenuInteractionDelegate:(id)a3;
- (void)setDisplayAsset:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusedTintColor:(id)a3;
- (void)setHitTestEdgeOutsets:(UIEdgeInsets)a3;
- (void)setLabel:(id)a3;
- (void)setMenu:(id)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setPointerShape:(int64_t)a3;
- (void)setPointerShapeInsets:(UIEdgeInsets)a3;
- (void)setPreferredSystemImagePointSize:(double)a3;
- (void)setPreferredSystemImageWeight:(int64_t)a3;
- (void)setSolidBackgroundColor:(id)a3;
- (void)setSpec:(id)a3;
- (void)setSymbolTransition:(id)a3;
- (void)setSystemImageName:(id)a3;
- (void)setSystemImageStyle:(int64_t)a3;
- (void)setTarget:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation PXStoryChromeButtonConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axLabel, 0);
  objc_storeStrong((id *)&self->_solidBackgroundColor, 0);
  objc_storeStrong((id *)&self->_focusedTintColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_badgeSystemImageColors, 0);
  objc_storeStrong((id *)&self->_badgeSystemImageName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_symbolTransition, 0);
  objc_destroyWeak((id *)&self->_customContextMenuInteractionDelegate);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (void)setAxLabel:(id)a3
{
}

- (NSString)axLabel
{
  return self->_axLabel;
}

- (void)setPointerShapeInsets:(UIEdgeInsets)a3
{
  self->_pointerShapeInsets = a3;
}

- (UIEdgeInsets)pointerShapeInsets
{
  double top = self->_pointerShapeInsets.top;
  double left = self->_pointerShapeInsets.left;
  double bottom = self->_pointerShapeInsets.bottom;
  double right = self->_pointerShapeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPointerShape:(int64_t)a3
{
  self->_pointerShape = a3;
}

- (int64_t)pointerShape
{
  return self->_pointerShape;
}

- (void)setBackgroundColorAdaptsToHoveredState:(BOOL)a3
{
  self->_backgroundColorAdaptsToHoveredState = a3;
}

- (BOOL)backgroundColorAdaptsToHoveredState
{
  return self->_backgroundColorAdaptsToHoveredState;
}

- (void)setApplyTintColorAsHierarchicalColor:(BOOL)a3
{
  self->_applyTintColorAsHierarchicalColor = a3;
}

- (BOOL)applyTintColorAsHierarchicalColor
{
  return self->_applyTintColorAsHierarchicalColor;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[7].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].c;
  return self;
}

- (void)setSolidBackgroundColor:(id)a3
{
}

- (UIColor)solidBackgroundColor
{
  return self->_solidBackgroundColor;
}

- (void)setFocusedTintColor:(id)a3
{
}

- (UIColor)focusedTintColor
{
  return self->_focusedTintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setHitTestEdgeOutsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeOutsets = a3;
}

- (UIEdgeInsets)hitTestEdgeOutsets
{
  double top = self->_hitTestEdgeOutsets.top;
  double left = self->_hitTestEdgeOutsets.left;
  double bottom = self->_hitTestEdgeOutsets.bottom;
  double right = self->_hitTestEdgeOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBadgeBorderWidth:(double)a3
{
  self->_badgeBorderWidth = a3;
}

- (double)badgeBorderWidth
{
  return self->_badgeBorderWidth;
}

- (void)setBadgePadding:(CGSize)a3
{
  self->_badgePadding = a3;
}

- (CGSize)badgePadding
{
  double width = self->_badgePadding.width;
  double height = self->_badgePadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBadgeEdges:(unint64_t)a3
{
  self->_badgeEdges = a3;
}

- (unint64_t)badgeEdges
{
  return self->_badgeEdges;
}

- (void)setBadgeSystemImageColors:(id)a3
{
}

- (NSArray)badgeSystemImageColors
{
  return self->_badgeSystemImageColors;
}

- (void)setBadgeSystemImageName:(id)a3
{
}

- (NSString)badgeSystemImageName
{
  return self->_badgeSystemImageName;
}

- (void)setBackgroundExtendsUnderLabel:(BOOL)a3
{
  self->_backgroundExtendsUnderLabel = a3;
}

- (BOOL)backgroundExtendsUnderLabel
{
  return self->_backgroundExtendsUnderLabel;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setDisplayAsset:(id)a3
{
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (void)setSystemImageName:(id)a3
{
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSymbolTransition:(id)a3
{
}

- (NSSymbolContentTransition)symbolTransition
{
  return self->_symbolTransition;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreferredSystemImagePointSize:(double)a3
{
  self->_preferredSystemImagePointSize = a3;
}

- (void)setPreferredSystemImageWeight:(int64_t)a3
{
  self->_preferredSystemImageWeight = a3;
}

- (void)setSystemImageStyle:(int64_t)a3
{
  self->_systemImageStyle = a3;
}

- (int64_t)systemImageStyle
{
  return self->_systemImageStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setCustomContextMenuInteractionDelegate:(id)a3
{
}

- (NSObject)customContextMenuInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customContextMenuInteractionDelegate);
  return WeakRetained;
}

- (void)setMenu:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (SEL)action
{
  return self->_action;
}

- (void)setTarget:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setSpec:(id)a3
{
}

- (PXStoryChromeButtonSpec)spec
{
  return self->_spec;
}

- (double)preferredSystemImagePointSize
{
  double preferredSystemImagePointSize = self->_preferredSystemImagePointSize;
  if (preferredSystemImagePointSize == *(double *)off_1E5DAAFD8)
  {
    int64_t v4 = [(PXStoryChromeButtonConfiguration *)self backgroundStyle];
    v5 = [(PXStoryChromeButtonConfiguration *)self spec];
    v6 = v5;
    if (v4) {
      [v5 systemImageSizeWithBackground];
    }
    else {
      [v5 systemImageSizeWithoutBackground];
    }
    double preferredSystemImagePointSize = v7;
  }
  return preferredSystemImagePointSize;
}

- (int64_t)preferredSystemImageWeight
{
  int64_t preferredSystemImageWeight = self->_preferredSystemImageWeight;
  if (preferredSystemImageWeight == *(void *)off_1E5DAAFE0)
  {
    int64_t v4 = [(PXStoryChromeButtonConfiguration *)self backgroundStyle];
    v5 = [(PXStoryChromeButtonConfiguration *)self spec];
    v6 = v5;
    if (v4) {
      uint64_t v7 = [v5 systemImageWeightWithBackground];
    }
    else {
      uint64_t v7 = [v5 systemImageWeightWithoutBackground];
    }
    int64_t preferredSystemImageWeight = v7;
  }
  return preferredSystemImageWeight;
}

- (BOOL)hasBadgeImageContent
{
  v2 = [(PXStoryChromeButtonConfiguration *)self badgeSystemImageName];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPrimaryImageContent
{
  BOOL v3 = [(PXStoryChromeButtonConfiguration *)self displayAsset];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(PXStoryChromeButtonConfiguration *)self systemImageName];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (PXStoryChromeButtonConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = [(PXStoryChromeButtonConfiguration *)self target];
  uint64_t v7 = [(PXStoryChromeButtonConfiguration *)v5 target];
  if (v6 == v7)
  {
    v8 = [(PXStoryChromeButtonConfiguration *)self action];
    if (v8 == [(PXStoryChromeButtonConfiguration *)v5 action])
    {
      id v11 = [(PXStoryChromeButtonConfiguration *)self menu];
      id v12 = [(PXStoryChromeButtonConfiguration *)v5 menu];
      if (v11 == v12)
      {
      }
      else
      {
        int v13 = [v11 isEqual:v12];

        if (!v13)
        {
          LOBYTE(v9) = 0;
LABEL_29:

          goto LABEL_6;
        }
      }
      id v14 = [(PXStoryChromeButtonConfiguration *)self systemImageName];
      id v15 = [(PXStoryChromeButtonConfiguration *)v5 systemImageName];
      if (v14 == v15)
      {
      }
      else
      {
        int v9 = [v14 isEqualToString:v15];

        if (!v9) {
          goto LABEL_28;
        }
      }
      id v16 = [(PXStoryChromeButtonConfiguration *)self label];
      id v17 = [(PXStoryChromeButtonConfiguration *)v5 label];
      v26 = v17;
      v27 = v16;
      if (v16 == v17)
      {
      }
      else
      {
        id v25 = v12;
        v18 = v11;
        id v19 = v15;
        v20 = v14;
        v21 = v17;
        int v9 = [v16 isEqualToString:v17];

        id v14 = v20;
        id v15 = v19;
        id v11 = v18;
        id v12 = v25;
        if (!v9)
        {
LABEL_27:

LABEL_28:
          goto LABEL_29;
        }
      }
      int64_t v22 = [(PXStoryChromeButtonConfiguration *)self backgroundStyle];
      if (v22 == [(PXStoryChromeButtonConfiguration *)v5 backgroundStyle])
      {
        BOOL v23 = [(PXStoryChromeButtonConfiguration *)self backgroundExtendsUnderLabel];
        if (v23 == [(PXStoryChromeButtonConfiguration *)v5 backgroundExtendsUnderLabel])
        {
          int64_t v24 = [(PXStoryChromeButtonConfiguration *)self preferredSystemImageWeight];
          if (v24 == [(PXStoryChromeButtonConfiguration *)v5 preferredSystemImageWeight])
          {
            [(PXStoryChromeButtonConfiguration *)self preferredSystemImagePointSize];
            [(PXStoryChromeButtonConfiguration *)v5 preferredSystemImagePointSize];
            PXFloatApproximatelyEqualToFloat();
          }
        }
      }
      LOBYTE(v9) = 0;
      goto LABEL_27;
    }
  }
  LOBYTE(v9) = 0;
LABEL_6:

LABEL_9:
  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(PXStoryChromeButtonConfiguration *)self backgroundStyle];
  BOOL v4 = [(PXStoryChromeButtonConfiguration *)self systemImageName];
  uint64_t v5 = v3 ^ (4 * [v4 hash]);

  v6 = [(PXStoryChromeButtonConfiguration *)self spec];
  uint64_t v7 = v5 ^ (8 * [v6 hash]);

  int64_t v8 = v7 ^ (16 * [(PXStoryChromeButtonConfiguration *)self pointerShape]);
  int v9 = [(PXStoryChromeButtonConfiguration *)self symbolTransition];
  uint64_t v10 = v8 ^ (32 * [v9 hash]);

  id v11 = [(PXStoryChromeButtonConfiguration *)self displayAsset];
  uint64_t v12 = [v11 hash];

  int v13 = [(PXStoryChromeButtonConfiguration *)self badgeSystemImageName];
  uint64_t v14 = v12 ^ [v13 hash];

  return v10 ^ v14 ^ [(PXStoryChromeButtonConfiguration *)self systemImageStyle];
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_storeWeak(v4 + 3, WeakRetained);

  v4[4] = self->_action;
  objc_storeStrong(v4 + 5, self->_menu);
  v4[7] = self->_backgroundStyle;
  v4[9] = self->_preferredSystemImageWeight;
  v4[10] = *(id *)&self->_preferredSystemImagePointSize;
  *((_OWORD *)v4 + 12) = self->_offset;
  uint64_t v6 = [(NSString *)self->_systemImageName copy];
  id v7 = v4[12];
  v4[12] = (id)v6;

  uint64_t v8 = [(NSString *)self->_label copy];
  id v9 = v4[14];
  v4[14] = (id)v8;

  *((unsigned char *)v4 + 8) = self->_backgroundExtendsUnderLabel;
  objc_storeStrong(v4 + 2, self->_spec);
  objc_storeStrong(v4 + 19, self->_tintColor);
  objc_storeStrong(v4 + 20, self->_focusedTintColor);
  objc_storeStrong(v4 + 21, self->_solidBackgroundColor);
  v4[8] = self->_systemImageStyle;
  objc_storeStrong(v4 + 11, self->_symbolTransition);
  long long v10 = *(_OWORD *)&self->_contentEdgeInsets.bottom;
  *((_OWORD *)v4 + 14) = *(_OWORD *)&self->_contentEdgeInsets.top;
  *((_OWORD *)v4 + 15) = v10;
  long long v11 = *(_OWORD *)&self->_hitTestEdgeOutsets.bottom;
  *((_OWORD *)v4 + 16) = *(_OWORD *)&self->_hitTestEdgeOutsets.top;
  *((_OWORD *)v4 + 17) = v11;
  id v12 = objc_loadWeakRetained((id *)&self->_customContextMenuInteractionDelegate);
  objc_storeWeak(v4 + 6, v12);

  uint64_t v13 = [(PXDisplayAsset *)self->_displayAsset copyWithZone:0];
  id v14 = v4[13];
  v4[13] = (id)v13;

  long long v15 = *(_OWORD *)&self->_transform.a;
  long long v16 = *(_OWORD *)&self->_transform.tx;
  *((_OWORD *)v4 + 21) = *(_OWORD *)&self->_transform.c;
  *((_OWORD *)v4 + 22) = v16;
  *((_OWORD *)v4 + 20) = v15;
  v4[17] = self->_badgeEdges;
  uint64_t v17 = [(NSString *)self->_badgeSystemImageName copy];
  id v18 = v4[15];
  v4[15] = (id)v17;

  *((_OWORD *)v4 + 13) = self->_badgePadding;
  uint64_t v19 = [(NSArray *)self->_badgeSystemImageColors copy];
  id v20 = v4[16];
  v4[16] = (id)v19;

  *((unsigned char *)v4 + 9) = self->_enabled;
  *((unsigned char *)v4 + 11) = self->_backgroundColorAdaptsToHoveredState;
  *((unsigned char *)v4 + 10) = self->_applyTintColorAsHierarchicalColor;
  v4[22] = self->_pointerShape;
  long long v21 = *(_OWORD *)&self->_pointerShapeInsets.bottom;
  *((_OWORD *)v4 + 18) = *(_OWORD *)&self->_pointerShapeInsets.top;
  *((_OWORD *)v4 + 19) = v21;
  uint64_t v22 = [(NSString *)self->_axLabel copy];
  id v23 = v4[23];
  v4[23] = (id)v22;

  return v4;
}

- (PXStoryChromeButtonConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryChromeButtonConfiguration;
  CGPoint result = [(PXStoryChromeButtonConfiguration *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tdouble x = *(_OWORD *)(v3 + 32);
    result->_enabled = 1;
    result->_backgroundColorAdaptsToHoveredState = 1;
  }
  return result;
}

@end