@interface PXGReusableAXInfo
+ (BOOL)_assetHasContentSourceInLayout:(id)a3 atSpriteIndex:(unsigned int)a4;
+ (Class)_viewClassInLayout:(id)a3 atSpriteIndex:(unsigned int)a4;
+ (PXReusableObjectPool)sharedPool;
+ (id)_imageAXLabelInLayout:(id)a3 atSpriteIndex:(unsigned int)a4;
+ (id)_textInLayout:(id)a3 atSpriteIndex:(unsigned int)a4;
+ (id)_titleSubtitleInLayout:(id)a3 atSpriteIndex:(unsigned int)a4;
- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteGeometry;
- ($225AF24142A77900D29617A74D173C5F)spriteStyle;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)spriteStyleCornerRadius;
- (BOOL)_fillForKind:(int64_t)a3 withLayout:(id)a4 spriteIndex:(unsigned int)a5;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)allowDecorations;
- (BOOL)axAccessibleWhenTransparent;
- (BOOL)axIsSelected;
- (BOOL)canBecomeFocused;
- (BOOL)fillContentForContentKind:(int64_t)a3 inLayout:(id)a4 atIndex:(unsigned int)a5;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)axFrame;
- (CGRect)frame;
- (NSArray)axDecorations;
- (NSArray)preferredFocusEnvironments;
- (NSString)axIdentifier;
- (NSString)axImageName;
- (NSString)axSubtitle;
- (NSString)axText;
- (NSString)axTitle;
- (NSString)description;
- (PXAccessibleDisplayAsset)axAsset;
- (PXAnonymousView)axView;
- (PXGBasicAXGroup)axContainingGroup;
- (PXGReusableAXInfo)init;
- (UIFocusEffect)focusEffect;
- (UIFocusItemContainer)focusItemContainer;
- (id)_viewAtSpriteIndex:(unsigned int)a3;
- (id)content;
- (int64_t)alternateUIVisibility;
- (int64_t)axContentKind;
- (int64_t)focusGroupPriority;
- (int64_t)focusRingType;
- (unsigned)spriteIndex;
- (void)applyToInfo:(id)a3;
- (void)didHintFocusMovement:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setAllowDecorations:(BOOL)a3;
- (void)setAlternateUIVisibility:(int64_t)a3;
- (void)setAxAccessibleWhenTransparent:(BOOL)a3;
- (void)setAxContainingGroup:(id)a3;
- (void)setAxContentKind:(int64_t)a3;
- (void)setAxDecorations:(id)a3;
- (void)setAxIdentifier:(id)a3;
- (void)setContent:(id)a3 ofContentKind:(int64_t)a4;
- (void)setFocusRingType:(int64_t)a3;
- (void)setNeedsFocusUpdate;
- (void)setSpriteGeometry:(id)a3;
- (void)setSpriteIndex:(unsigned int)a3;
- (void)setSpriteStyle:(id *)a3;
- (void)setSpriteStyleCornerRadius:(id)a3;
- (void)updateFocusIfNeeded;
@end

@implementation PXGReusableAXInfo

- (void)setSpriteIndex:(unsigned int)a3
{
  self->_spriteIndex = a3;
}

+ (PXReusableObjectPool)sharedPool
{
  if (sharedPool_onceToken != -1) {
    dispatch_once(&sharedPool_onceToken, &__block_literal_global_197350);
  }
  v2 = (void *)sharedPool_pool;
  return (PXReusableObjectPool *)v2;
}

- (void)setSpriteStyleCornerRadius:(id)a3
{
  self->_spriteStyleCornerRadius.var0.var0.topLeft = v3;
  self->_spriteStyleCornerRadius.var0.var0.topRight = v4;
  self->_spriteStyleCornerRadius.var0.var0.bottomLeft = v5;
  self->_spriteStyleCornerRadius.var0.var0.bottomRight = v6;
}

- (void)setSpriteStyle:(id *)a3
{
  long long v3 = *(long long *)((char *)&a3->var1 + 12);
  *(_OWORD *)&self->_spriteStyle.alpha = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self[1]._axAccessibleWhenTransparent = v3;
  long long v4 = *(_OWORD *)&a3->var5;
  $6FCFBD36564ECBB6D9D1614A84D6F83D var1 = a3[1].var1;
  $E57FD295544FE3DD2B3C272D7C23EB59 v6 = *($E57FD295544FE3DD2B3C272D7C23EB59 *)&a3[1].var6;
  *(_OWORD *)&self[1]._content = *(_OWORD *)&a3[1].var2;
  self[1]._spriteStyleCornerRadius = v6;
  *(_OWORD *)&self[1]._axContainingGroup = v4;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[1]._alternateUIVisibility = var1;
  long long v7 = *(long long *)((char *)&a3[2].var1 + 4);
  long long v8 = *(_OWORD *)&a3[2].var3;
  long long v9 = *(long long *)((char *)&a3[3].var1 + 8);
  *(_OWORD *)&self[1]._anon_70[8] = *(_OWORD *)&a3[2].var8;
  *(_OWORD *)&self[2].super.isa = v9;
  *(_OWORD *)&self[1]._spriteGeometry.center.x = v7;
  *(_OWORD *)&self[1]._spriteGeometry.center.z = v8;
}

- (void)setSpriteGeometry:(id)a3
{
  long long v4 = *v3;
  *(_OWORD *)&self->_spriteGeometry.center.z = v3[1];
  *(_OWORD *)&self->_spriteGeometry.center.x = v4;
}

- (void)setFocusRingType:(int64_t)a3
{
  self->_focusRingType = a3;
}

- (void)setAxAccessibleWhenTransparent:(BOOL)a3
{
  self->_axAccessibleWhenTransparent = a3;
}

- (BOOL)fillContentForContentKind:(int64_t)a3 inLayout:(id)a4 atIndex:(unsigned int)a5
{
  BOOL v7 = [(PXGReusableAXInfo *)self _fillForKind:a3 withLayout:a4 spriteIndex:*(void *)&a5];
  if (v7) {
    int64_t v8 = a3;
  }
  else {
    int64_t v8 = 0;
  }
  [(PXGReusableAXInfo *)self setAxContentKind:v8];
  return v7;
}

- (void)setAxContentKind:(int64_t)a3
{
  self->_axContentKind = a3;
}

- (BOOL)_fillForKind:(int64_t)a3 withLayout:(id)a4 spriteIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  switch(a3)
  {
    case 1:
      v11 = [(id)objc_opt_class() _titleSubtitleInLayout:v8 atSpriteIndex:v5];
      id content = self->_content;
      self->_id content = v11;
      id v13 = v11;

      v14 = [v13 first];

      char v10 = v14 != 0;
      break;
    case 2:
    case 3:
      long long v9 = [(id)objc_opt_class() _textInLayout:v8 atSpriteIndex:v5];
      goto LABEL_6;
    case 4:
      long long v9 = [(id)objc_opt_class() _imageAXLabelInLayout:v8 atSpriteIndex:v5];
LABEL_6:
      id v15 = self->_content;
      self->_id content = v9;

      BOOL v16 = self->_content == 0;
      goto LABEL_9;
    case 5:
      BOOL v16 = [(id)objc_opt_class() _viewClassInLayout:v8 atSpriteIndex:v5] == 0;
LABEL_9:
      char v10 = !v16;
      break;
    case 6:
      char v10 = [(id)objc_opt_class() _assetHasContentSourceInLayout:v8 atSpriteIndex:v5];
      break;
    default:
      char v10 = 0;
      break;
  }

  return v10;
}

+ (BOOL)_assetHasContentSourceInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PXGReusableAXInfo__assetHasContentSourceInLayout_atSpriteIndex___block_invoke;
  v7[3] = &unk_1E5DC3E30;
  v7[4] = &v8;
  [v5 enumerateSpritesInRange:a4 | 0x100000000 usingBlock:v7];
  LOBYTE(a4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return a4;
}

void __66__PXGReusableAXInfo__assetHasContentSourceInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned char *a9)
{
  uint64_t v10 = [a7 contentSource];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a9 = 1;
  }
}

- (unsigned)spriteIndex
{
  return self->_spriteIndex;
}

- (void)applyToInfo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_spriteIndex;
  long long v3 = *(_OWORD *)&self->_spriteGeometry.center.x;
  *(_OWORD *)((char *)a3 + 104) = *(_OWORD *)&self->_spriteGeometry.center.z;
  *(_OWORD *)((char *)a3 + 88) = v3;
  $E57FD295544FE3DD2B3C272D7C23EB59 spriteStyleCornerRadius = self[1]._spriteStyleCornerRadius;
  long long v6 = *(_OWORD *)&self[1]._axContainingGroup;
  long long v5 = *(_OWORD *)&self[1]._alternateUIVisibility;
  *((_OWORD *)a3 + 12) = *(_OWORD *)&self[1]._content;
  *(($E57FD295544FE3DD2B3C272D7C23EB59 *)a3 + 13) = spriteStyleCornerRadius;
  *((_OWORD *)a3 + 10) = v6;
  *((_OWORD *)a3 + 11) = v5;
  long long v7 = *(_OWORD *)&self[2].super.isa;
  long long v9 = *(_OWORD *)&self[1]._spriteGeometry.center.x;
  long long v8 = *(_OWORD *)&self[1]._spriteGeometry.center.z;
  *((_OWORD *)a3 + 16) = *(_OWORD *)&self[1]._anon_70[8];
  *((_OWORD *)a3 + 17) = v7;
  *((_OWORD *)a3 + 14) = v9;
  *((_OWORD *)a3 + 15) = v8;
  long long v10 = *(_OWORD *)&self[1]._axAccessibleWhenTransparent;
  *((_OWORD *)a3 + 8) = *(_OWORD *)&self->_spriteStyle.alpha;
  *((_OWORD *)a3 + 9) = v10;
  *($E57FD295544FE3DD2B3C272D7C23EB59 *)((char *)a3 + 72) = self->_spriteStyleCornerRadius;
  *((void *)a3 + 4) = self->_focusRingType;
  *((void *)a3 + 6) = self->_axContentKind;
  *((unsigned char *)a3 + 8) = self->_axAccessibleWhenTransparent;
  objc_storeStrong((id *)a3 + 7, self->_content);
}

PXGReusableAXInfo *__31__PXGReusableAXInfo_sharedPool__block_invoke_2()
{
  v0 = objc_alloc_init(PXGReusableAXInfo);
  return v0;
}

- (PXGReusableAXInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXGReusableAXInfo;
  result = [(PXGReusableAXInfo *)&v4 init];
  if (result)
  {
    result->_spriteIndex = -1;
    long long v3 = *((_OWORD *)off_1E5DAAF70 + 1);
    *(_OWORD *)&result->_spriteGeometry.center.x = *(_OWORD *)off_1E5DAAF70;
    *(_OWORD *)&result->_spriteGeometry.center.z = v3;
    *(void *)&result->_spriteStyleCornerRadius.var0.var0.topLeft = 0;
    *(void *)&result->_spriteStyleCornerRadius.var0.byIndex[2] = 0;
    result->_focusRingType = 1;
  }
  return result;
}

- (void)setAxContainingGroup:(id)a3
{
}

- (void)setAlternateUIVisibility:(int64_t)a3
{
  self->_alternateUIVisibility = a3;
}

- (void)setAllowDecorations:(BOOL)a3
{
  self->_allowDecorations = a3;
}

- (void)prepareForReuse
{
  id content = self->_content;
  self->_axContentKind = 0;
  self->_id content = 0;

  self->_spriteIndex = -1;
  objc_storeWeak((id *)&self->_axContainingGroup, 0);
  long long v4 = *((_OWORD *)off_1E5DAAF70 + 1);
  *(_OWORD *)&self->_spriteGeometry.center.x = *(_OWORD *)off_1E5DAAF70;
  *(_OWORD *)&self->_spriteGeometry.center.z = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 7);
  *(_OWORD *)&self[1]._spriteGeometry.center.x = *((_OWORD *)off_1E5DAAF90 + 6);
  *(_OWORD *)&self[1]._spriteGeometry.center.z = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 9);
  *(_OWORD *)&self[1]._anon_70[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  *(_OWORD *)&self[2].super.isa = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 3);
  *(_OWORD *)&self[1]._axContainingGroup = *((_OWORD *)off_1E5DAAF90 + 2);
  *(_OWORD *)&self[1]._alternateUIVisibility = v7;
  $E57FD295544FE3DD2B3C272D7C23EB59 v8 = ($E57FD295544FE3DD2B3C272D7C23EB59)*((_OWORD *)off_1E5DAAF90 + 5);
  *(_OWORD *)&self[1]._id content = *((_OWORD *)off_1E5DAAF90 + 4);
  self[1]._$E57FD295544FE3DD2B3C272D7C23EB59 spriteStyleCornerRadius = v8;
  long long v9 = *((_OWORD *)off_1E5DAAF90 + 1);
  *(_OWORD *)&self->_spriteStyle.alpha = *(_OWORD *)off_1E5DAAF90;
  *(_OWORD *)&self[1]._axAccessibleWhenTransparent = v9;
  self->_alternateUIVisibility = 0;
  axDecorations = self->_axDecorations;
  self->_axDecorations = 0;
}

uint64_t __31__PXGReusableAXInfo_sharedPool__block_invoke()
{
  id v0 = objc_alloc_init((Class)off_1E5DA8338);
  v1 = (void *)sharedPool_pool;
  sharedPool_pool = (uint64_t)v0;

  v2 = (void *)sharedPool_pool;
  return [v2 registerReusableObjectForReuseIdentifier:1 creationHandler:&__block_literal_global_3_197353];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axDecorations, 0);
  objc_storeStrong(&self->_content, 0);
  objc_destroyWeak((id *)&self->_axContainingGroup);
  objc_storeStrong((id *)&self->axIdentifier, 0);
}

- (void)didHintFocusMovement:(id)a3
{
  id v7 = a3;
  long long v4 = [(PXGReusableAXInfo *)self axContainingGroup];
  long long v5 = [v4 axInfoSource];
  if (v5)
  {
    uint64_t v6 = [(PXGReusableAXInfo *)self spriteIndex];
    if (v6 != -1) {
      [v5 axDidReceiveFocusMovementHint:v7 forSpriteAtIndex:v6];
    }
  }
}

- (int64_t)focusGroupPriority
{
  if ([(PXGReusableAXInfo *)self axIsSelected]) {
    return 2000;
  }
  else {
    return 0;
  }
}

- (UIFocusEffect)focusEffect
{
  return 0;
}

- (CGRect)frame
{
  [(PXGReusableAXInfo *)self axFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  char v11 = [(PXGReusableAXInfo *)self axContainingGroup];
  v12 = [v11 axScrollParent];
  id v13 = [v12 axGroupSource];
  objc_msgSend(v13, "axConvertRect:fromDescendantGroup:", v11, v4, v6, v8, v10);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)canBecomeFocused
{
  double v4 = [(PXGReusableAXInfo *)self axContainingGroup];
  double v5 = [v4 axInfoSource];
  if (v5)
  {
    uint64_t v6 = [(PXGReusableAXInfo *)self spriteIndex];
    if (v6 == -1)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXGAXInfo+iOS.m" lineNumber:122 description:@"An info should not be getting focus if it has no backing sprite"];
    }
    BOOL v7 = [v5 axFocusabilityForSpriteAtIndex:v6] == 2;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isEligibleForFocusInteraction
{
  double v4 = [(PXGReusableAXInfo *)self axContainingGroup];
  if (!v4)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXGAXInfo+iOS.m" lineNumber:98 description:@"An info should not be getting focus if it has no containing group"];
  }
  double v5 = [v4 axInfoSource];
  if (v5)
  {
    uint64_t v6 = [(PXGReusableAXInfo *)self spriteIndex];
    if (v6 == -1)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXGAXInfo+iOS.m" lineNumber:109 description:@"An info should not be getting focus if it has no backing sprite"];
    }
    BOOL v7 = [v5 axFocusabilityForSpriteAtIndex:v6] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v26 = a3;
  uint64_t v6 = [v26 nextFocusedItem];

  BOOL v7 = [v26 previouslyFocusedItem];

  if (v6 == self || v7 == self)
  {
    uint64_t v8 = [(PXGReusableAXInfo *)self axContainingGroup];
    double v9 = (void *)v8;
    if (v6 == self && !v8)
    {
      double v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"PXGAXInfo+iOS.m" lineNumber:62 description:@"An info should not be getting focus if it has no containing group"];
    }
    uint64_t v10 = [(PXGReusableAXInfo *)self spriteIndex];
    uint64_t v11 = v10;
    if (v6 == self && v10 == -1)
    {
      double v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"PXGAXInfo+iOS.m" lineNumber:65 description:@"An info should not be getting focus if it has no backing sprite"];
    }
    if (v6 == self) {
      id v12 = (id)[v9 loadLeafAtSpriteIndexIfNeeded:v11 usingOptions:1];
    }
    id v13 = [v26 previouslyFocusedItem];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    double v15 = [v26 nextFocusedItem];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    double v17 = [v14 axContainingGroup];
    double v18 = [v16 axContainingGroup];
    double v19 = [v17 axInfoSource];
    uint64_t v20 = [v14 spriteIndex];
    if (v17 == v18)
    {
      uint64_t v21 = [v16 spriteIndex];
      double v22 = v19;
      uint64_t v23 = v20;
    }
    else
    {
      [v19 axDidUpdateFocusFromSpriteAtIndex:v20 toSpriteAtIndex:0xFFFFFFFFLL];

      double v19 = [v18 axInfoSource];
      uint64_t v21 = [v16 spriteIndex];
      double v22 = v19;
      uint64_t v23 = 0xFFFFFFFFLL;
    }
    [v22 axDidUpdateFocusFromSpriteAtIndex:v23 toSpriteAtIndex:v21];

    if (v7 == self) {
      [v9 unloadLeafAtSpriteIndex:v11 usingOptions:3];
    }
  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)updateFocusIfNeeded
{
  id v2 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (void)setNeedsFocusUpdate
{
  id v3 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (UIFocusItemContainer)focusItemContainer
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(PXGReusableAXInfo *)self axContentKind] == 5)
  {
    uint64_t v3 = [(PXGReusableAXInfo *)self axView];
    double v4 = (void *)v3;
    if (v3)
    {
      v9[0] = v3;
      double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
    else
    {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setAxDecorations:(id)a3
{
}

- (NSArray)axDecorations
{
  return self->_axDecorations;
}

- (BOOL)allowDecorations
{
  return self->_allowDecorations;
}

- (BOOL)axAccessibleWhenTransparent
{
  return self->_axAccessibleWhenTransparent;
}

- (id)content
{
  return self->_content;
}

- (int64_t)axContentKind
{
  return self->_axContentKind;
}

- (int64_t)alternateUIVisibility
{
  return self->_alternateUIVisibility;
}

- (int64_t)focusRingType
{
  return self->_focusRingType;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)spriteStyleCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- ($225AF24142A77900D29617A74D173C5F)spriteStyle
{
  long long v3 = *(_OWORD *)&self[5].var2;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[2].var1 + 4) = self[5].var1;
  *(_OWORD *)&retstr[2].var3 = v3;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v4 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&self[6].var1 + 4);
  *(_OWORD *)&retstr[2].var8 = *(_OWORD *)&self[5].var6;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[3].var1 + 8) = v4;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v5 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&self[4].var0;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[3].var4;
  retstr[1].$6FCFBD36564ECBB6D9D1614A84D6F83D var1 = v5;
  long long v6 = *(_OWORD *)&self[4].var5;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)&retstr[1].var2 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&self[4].var1
                                                                                               + 12);
  *(_OWORD *)&retstr[1].var6 = v6;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v7 = *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&self[3].var1 + 8);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var8;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr->var1 + 12) = v7;
  return self;
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteGeometry
{
  long long v3 = *(_OWORD *)&self->_spriteGeometry.center.x;
  long long v4 = *(_OWORD *)&self->_spriteGeometry.center.z;
  _OWORD *v2 = v3;
  v2[1] = v4;
  result.var0.$6FCFBD36564ECBB6D9D1614A84D6F83D var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (PXGBasicAXGroup)axContainingGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axContainingGroup);
  return (PXGBasicAXGroup *)WeakRetained;
}

- (void)setAxIdentifier:(id)a3
{
}

- (NSString)axIdentifier
{
  return self->axIdentifier;
}

- (NSString)description
{
  long long v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t spriteIndex = self->_spriteIndex;
  unint64_t v6 = [(PXGReusableAXInfo *)self axContentKind];
  if (v6 >= 8)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"NSString *_NSStringFromPXGAXInfoKind(PXGAXInfoKind)"];
    [v11 handleFailureInFunction:v12 file:@"PXGAXInfo.m" lineNumber:47 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  $6FCFBD36564ECBB6D9D1614A84D6F83D v7 = off_1E5DC3EA0[v6];
  [(PXGReusableAXInfo *)self axFrame];
  uint64_t v8 = NSStringFromCGRect(v14);
  double v9 = [v3 stringWithFormat:@"<%@: %p index: %u, kind: %@, frame: %@>", v4, self, spriteIndex, v7, v8];

  return (NSString *)v9;
}

- (id)_viewAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(PXGReusableAXInfo *)self axContainingGroup];
  $6FCFBD36564ECBB6D9D1614A84D6F83D v5 = [v4 axRootParent];
  unint64_t v6 = [v4 containingLayout];
  $6FCFBD36564ECBB6D9D1614A84D6F83D v7 = [v5 containingLayout];
  uint64_t v8 = objc_msgSend(v7, "viewForSpriteIndex:", objc_msgSend(v7, "convertSpriteIndex:fromDescendantLayout:", v3, v6));

  return v8;
}

- (void)setContent:(id)a3 ofContentKind:(int64_t)a4
{
  id v7 = a3;
  if (!v7 && a4 != 5)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXGAXInfo.m" lineNumber:157 description:@"Content can only be nil when contentKind is View"];
  }
  [(PXGReusableAXInfo *)self setAxContentKind:a4];
  id content = self->_content;
  self->_id content = v7;
}

- (PXAnonymousView)axView
{
  if ([(PXGReusableAXInfo *)self axContentKind] != 5)
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXGAXInfo.m" lineNumber:132 description:@"Should not request view from element that is not view"];
  }
  uint64_t spriteIndex = self->_spriteIndex;
  return (PXAnonymousView *)[(PXGReusableAXInfo *)self _viewAtSpriteIndex:spriteIndex];
}

- (PXAccessibleDisplayAsset)axAsset
{
  if ([(PXGReusableAXInfo *)self axContentKind] != 6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXGAXInfo.m" lineNumber:123 description:@"Should not request asset from element that is not asset"];
  }
  uint64_t v4 = [(PXGReusableAXInfo *)self axContainingGroup];
  $6FCFBD36564ECBB6D9D1614A84D6F83D v5 = [v4 containingLayout];

  unint64_t v6 = [v5 contentSource];
  id v7 = [v6 displayAssetFetchResultForSpritesInRange:self->_spriteIndex | 0x100000000 inLayout:v5];
  uint64_t v8 = [v7 objectAtIndex:self->_spriteIndex];

  return (PXAccessibleDisplayAsset *)v8;
}

- (NSString)axImageName
{
  if ([(PXGReusableAXInfo *)self axContentKind] != 4)
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXGAXInfo.m" lineNumber:117 description:@"Should not request imageName from element that is not namedImage"];
  }
  id v4 = self->_content;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v10);
    uint64_t v11 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 118, @"%@ should be an instance inheriting from %@, but it is %@", @"_content", v9, v11 object file lineNumber description];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 118, @"%@ should be an instance inheriting from %@, but it is nil", @"_content", v9 object file lineNumber description];
  }

LABEL_5:
  return (NSString *)v4;
}

- (NSString)axSubtitle
{
  if ([(PXGReusableAXInfo *)self axContentKind] != 1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXGAXInfo.m" lineNumber:110 description:@"Should not request title from element that is not titlesubtitle"];
  }
  id v4 = self->_content;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 111, @"%@ should be an instance inheriting from %@, but it is nil", @"_content", v10 object file lineNumber description];
LABEL_13:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v11);
    id v12 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 111, @"%@ should be an instance inheriting from %@, but it is %@", @"_content", v10, v12 object file lineNumber description];

    goto LABEL_13;
  }
LABEL_5:
  $6FCFBD36564ECBB6D9D1614A84D6F83D v5 = [v4 second];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v14 = (objc_class *)objc_opt_class();
      double v15 = NSStringFromClass(v14);
      id v16 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v13 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 112, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"titleSubtitle.second", v15, v16 object file lineNumber description];
    }
  }

  return (NSString *)v5;
}

- (NSString)axTitle
{
  if ([(PXGReusableAXInfo *)self axContentKind] != 1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXGAXInfo.m" lineNumber:103 description:@"Should not request title from element that is not titlesubtitle"];
  }
  id v4 = self->_content;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v11);
    id v12 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 104, @"%@ should be an instance inheriting from %@, but it is %@", @"_content", v10, v12 object file lineNumber description];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 104, @"%@ should be an instance inheriting from %@, but it is nil", @"_content", v10 object file lineNumber description];
  }

LABEL_5:
  $6FCFBD36564ECBB6D9D1614A84D6F83D v5 = [v4 first];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v16);
    double v17 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 105, @"%@ should be an instance inheriting from %@, but it is %@", @"titleSubtitle.first", v15, v17 object file lineNumber description];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    CGRect v14 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 105, @"%@ should be an instance inheriting from %@, but it is nil", @"titleSubtitle.first", v15 object file lineNumber description];
  }

LABEL_7:
  return (NSString *)v5;
}

- (NSString)axText
{
  if ([(PXGReusableAXInfo *)self axContentKind] != 2
    && [(PXGReusableAXInfo *)self axContentKind] != 3)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXGAXInfo.m" lineNumber:97 description:@"Should not request text from element that is not text/button"];
  }
  id v4 = self->_content;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v9);
    uint64_t v10 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v6 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 98, @"%@ should be an instance inheriting from %@, but it is %@", @"_content", v8, v10 object file lineNumber description];
  }
  else
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"PXGAXInfo.m", 98, @"%@ should be an instance inheriting from %@, but it is nil", @"_content", v8 object file lineNumber description];
  }

LABEL_6:
  return (NSString *)v4;
}

- (BOOL)axIsSelected
{
  id v2 = self;
  uint64_t v3 = [(PXGReusableAXInfo *)self axContainingGroup];
  id v4 = [v3 axInfoSource];

  $6FCFBD36564ECBB6D9D1614A84D6F83D v5 = [v4 axSelectedSpriteIndexes];
  LOBYTE(v2) = objc_msgSend(v5, "containsIndex:", -[PXGReusableAXInfo spriteIndex](v2, "spriteIndex"));

  return (char)v2;
}

- (CGRect)axFrame
{
}

+ (Class)_viewClassInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  uint64_t v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PXGReusableAXInfo__viewClassInLayout_atSpriteIndex___block_invoke;
  v8[3] = &unk_1E5DC3E80;
  v8[4] = &v10;
  unsigned int v9 = a4;
  [v5 enumerateSpritesInRange:a4 | 0x100000000 usingBlock:v8];
  id v6 = (id)v11[3];
  _Block_object_dispose(&v10, 8);

  return (Class)v6;
}

void __54__PXGReusableAXInfo__viewClassInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned char *a9)
{
  id v12 = a7;
  uint64_t v10 = [v12 contentSource];
  uint64_t v11 = v10;
  if (v10) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v10 viewClassForSpriteAtIndex:*(unsigned int *)(a1 + 40) inLayout:v12];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a9 = 1;
  }
}

+ (id)_imageAXLabelInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__197348;
  uint64_t v13 = __Block_byref_object_dispose__197349;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PXGReusableAXInfo__imageAXLabelInLayout_atSpriteIndex___block_invoke;
  v8[3] = &unk_1E5DC3E30;
  v8[4] = &v9;
  [v5 enumerateSpritesInRange:a4 | 0x100000000 usingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __57__PXGReusableAXInfo__imageAXLabelInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned char *a9)
{
  id v16 = a7;
  uint64_t v11 = [v16 contentSource];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 imageConfigurationAtIndex:a8 inLayout:v16];
    id v14 = [v13 accessibilityLabel];
    double v15 = v14;
    if (!v14)
    {
      double v15 = [v13 imageName];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v15);
    if (!v14) {
  }
    }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a9 = 1;
  }
}

+ (id)_titleSubtitleInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy__197348;
  uint64_t v20 = __Block_byref_object_dispose__197349;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__197348;
  id v14 = __Block_byref_object_dispose__197349;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __58__PXGReusableAXInfo__titleSubtitleInLayout_atSpriteIndex___block_invoke;
  v9[3] = &unk_1E5DC3E58;
  v9[4] = &v16;
  v9[5] = &v10;
  [v5 enumerateSpritesInRange:a4 | 0x100000000 usingBlock:v9];
  id v6 = objc_alloc((Class)off_1E5DA9668);
  id v7 = (void *)[v6 initWithFirst:v17[5] second:v11[5]];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __58__PXGReusableAXInfo__titleSubtitleInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned char *a9)
{
  uint64_t v11 = [a7 contentSource];
  if (v11)
  {
    id v18 = v11;
    uint64_t v12 = [v11 titleForSpriteAtIndex:a8];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = [v18 subtitleForSpriteAtIndex:a8];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    double v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    uint64_t v11 = v18;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a9 = 1;
  }
}

+ (id)_textInLayout:(id)a3 atSpriteIndex:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__197348;
  uint64_t v13 = __Block_byref_object_dispose__197349;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PXGReusableAXInfo__textInLayout_atSpriteIndex___block_invoke;
  v8[3] = &unk_1E5DC3E30;
  v8[4] = &v9;
  [v5 enumerateSpritesInRange:a4 | 0x100000000 usingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__PXGReusableAXInfo__textInLayout_atSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned char *a9)
{
  id v16 = a7;
  uint64_t v11 = [v16 contentSource];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 attributedStringForSpriteAtIndex:a8 inLayout:v16];
    id v14 = [v13 string];
    uint64_t v15 = v14;
    if (!v14)
    {
      uint64_t v15 = [v12 stringAtIndex:a8 inLayout:v16];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v15);
    if (!v14) {
  }
    }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a9 = 1;
  }
}

@end