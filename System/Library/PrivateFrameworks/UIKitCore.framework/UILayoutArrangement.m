@interface UILayoutArrangement
@end

@implementation UILayoutArrangement

id __69___UILayoutArrangement__updateCanvasConnectionConstraintsIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = v7;
  uint64_t v10 = [*(id *)(a1 + 32) _layoutRelationForCanvasConnectionForAttribute:a3];
  if ([v9 firstAttribute] != a3) {
    goto LABEL_6;
  }
  v11 = [v9 firstItem];
  if (v11 != *(void **)(a1 + 40)) {
    goto LABEL_5;
  }
  id v12 = [v9 secondItem];
  if (v12 != v8)
  {

LABEL_5:
LABEL_6:
    [v9 setActive:0];
    v13 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(a1 + 40) attribute:a3 relatedBy:v10 toItem:v8 attribute:a3];

    [v13 setIdentifier:@"UISV-canvas-connection"];
LABEL_7:
    [v13 setActive:1];
    goto LABEL_8;
  }
  uint64_t v15 = [v9 relation];

  if (v15 != v10) {
    goto LABEL_6;
  }
  v13 = v9;
  if (([v9 isActive] & 1) == 0) {
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

void __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v13 = a2;
  uint64_t v5 = 5;
  if (!*(void *)(*(void *)(a1 + 32) + 112)) {
    uint64_t v5 = 3;
  }
  uint64_t v6 = 6;
  if (!*(void *)(*(void *)(a1 + 32) + 112)) {
    uint64_t v6 = 4;
  }
  if (a3) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v13;
  }
  else
  {
    id v8 = [v13 _viewOrGuideForLocationAttribute:v7];
  }
  id v9 = v8;
  uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  v11 = [MEMORY[0x1E4F5B268] constraintWithItem:*(void *)(*(void *)(a1 + 32) + 88) attribute:v7 relatedBy:v10 toItem:v9 attribute:v7];
  [v11 setIdentifier:@"UISV-spanning-boundary"];
  LODWORD(v12) = 1148846080;
  if (!v10) {
    *(float *)&double v12 = 999.5;
  }
  [v11 setPriority:v12];
  [*(id *)(a1 + 40) addObject:v11];
}

uint64_t __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = -1;
  if (!a2) {
    uint64_t v3 = 1;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t __53___UILayoutArrangement__setLayoutFillsCanvas_notify___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLayoutFillsCanvas:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __70___UILayoutArrangement__setLayoutUsesCanvasMarginsWhenFilling_notify___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLayoutUsesCanvasMarginsWhenFilling:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __40___UILayoutArrangement__setAxis_notify___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAxis:*(void *)(a1 + 32)];
}

void __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke_3(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F5B268], "constraintWithItem:attribute:relatedBy:constant:", *(void *)(*(void *)(a1 + 32) + 88), objc_msgSend(*(id *)(a1 + 32), "_dimensionAttributeForCurrentAxis"), 0, 0.0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _spanningLayoutGuideFittingPriority];
  objc_msgSend(v2, "setPriority:");
  [v2 setIdentifier:@"UISV-spanning-fit"];
  [*(id *)(a1 + 40) addObject:v2];
}

uint64_t __105___UILayoutArrangement__respondToChangesWithIncomingItem_outgoingItem_newlyHiddenItem_newlyUnhiddenItem___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _pendingHiddenCount];
  if (result >= 1)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 setHidden:1];
  }
  return result;
}

uint64_t __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v14 = __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_2;
  uint64_t v15 = &unk_1E530E400;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v16 = v4;
  uint64_t v17 = v5;
  id v6 = v3;
  uint64_t v7 = v6;
  id v18 = v6;
  if (v6) {
    id v6 = (id)objc_msgSend((id)objc_msgSend(v6, "firstItem"), "_referenceView");
  }
  id v8 = v6;
  if (((uint64_t (*)(void *, id, void))v14)(v13, v8, 0))
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 1;
    if ((((uint64_t (*)(void *, id, uint64_t))v14)(v13, v8, 1) & 1) == 0)
    {
      if (v7) {
        uint64_t v10 = objc_msgSend((id)objc_msgSend(v7, "secondItem"), "_referenceView");
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;
      if ((((uint64_t (*)(void *, id, void))v14)(v13, v11, 0) & 1) == 0) {
        uint64_t v9 = ((uint64_t (*)(void *, id, uint64_t))v14)(v13, v11, 1);
      }
    }
  }

  return v9;
}

BOOL __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  if (a3) {
    uint64_t v4 = 12;
  }
  else {
    uint64_t v4 = 11;
  }
  uint64_t v5 = [a2 _viewForLoweringBaselineLayoutAttribute:v4];
  id v6 = *(void **)(a1 + 32);
  if (v5 == v6)
  {
    [*(id *)(a1 + 40) _invalidateBaselineConstraint:*(void *)(a1 + 48)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_3;
    v9[3] = &unk_1E530E3D8;
    uint64_t v7 = *(void **)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v7 _trackChangesWithConfigBlock:v9];
  }
  return v5 == v6;
}

uint64_t __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _invalidateBaselineConstraint:*(void *)(a1 + 32)];
}

@end