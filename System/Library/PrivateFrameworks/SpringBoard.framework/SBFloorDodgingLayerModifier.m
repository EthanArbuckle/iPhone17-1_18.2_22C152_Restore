@interface SBFloorDodgingLayerModifier
- (SBDodgingModel)overridingModel;
- (id)_framesForIdentifiersInModel:(id)a3;
- (id)_identifierIfAnyIllegallyClippingOtherIdentifiers:(id)a3 model:(id)a4 intersectionSize:(CGSize *)a5 intersectingFrame:(CGRect *)a6;
- (id)_identifierIfAnyIllegallyOutsideContentViewBounds:(id)a3 model:(id)a4;
- (id)_modelByClampingOverhangingIdentifiers:(id)a3;
- (id)_modelByPerformingDodgingInModel:(id)a3;
- (id)_modelsByResizingOverlappingIdentifiers:(id)a3;
- (id)_modelsByTranslatingOverlappingIdentifiers:(id)a3 allowedEdges:(unint64_t)a4;
- (id)framesForIdentifiers;
- (id)layoutSettingsForIdentifier:(id)a3;
- (id)model;
- (id)modelForInvalidatedModel:(id)a3;
- (id)zOrderedIdentifiers;
- (int64_t)animationBehaviorModeForIdentifier:(id)a3;
- (void)setOverridingModel:(id)a3;
@end

@implementation SBFloorDodgingLayerModifier

- (id)model
{
  overridingModel = self->_overridingModel;
  if (overridingModel)
  {
    v3 = overridingModel;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFloorDodgingLayerModifier;
    v3 = [(SBFloorDodgingLayerModifier *)&v5 model];
  }
  return v3;
}

- (id)modelForInvalidatedModel:(id)a3
{
  id v4 = a3;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __56__SBFloorDodgingLayerModifier_modelForInvalidatedModel___block_invoke;
  v14 = &unk_1E6B03908;
  id v15 = v4;
  v16 = self;
  id v5 = v4;
  v6 = [v5 modelByModifyingModelWithBlock:&v11];
  v7 = -[SBFloorDodgingLayerModifier _modelByPerformingDodgingInModel:](self, "_modelByPerformingDodgingInModel:", v6, v11, v12, v13, v14);
  v8 = v7;
  if (!v7) {
    v7 = v5;
  }
  id v9 = v7;

  return v9;
}

void __56__SBFloorDodgingLayerModifier_modelForInvalidatedModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "identifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v10 = [*(id *)(a1 + 40) preferenceForIdentifier:v9];
        [v10 preferredSize];
        double v12 = v11;
        double v14 = v13;
        [v10 minimumSize];
        if (v15 >= v12) {
          double v12 = v15;
        }
        if (v16 >= v14) {
          double v14 = v16;
        }
        [v10 preferredCenter];
        double v18 = v17;
        double v20 = v19;
        objc_msgSend(v3, "setSize:forIdentifier:", v9, v12, v14);
        objc_msgSend(v3, "setCenter:forIdentifier:", v9, v18, v20);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
}

- (id)framesForIdentifiers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(SBFloorDodgingLayerModifier *)self model];
  id v3 = [v2 identifiers];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v2, "sizeForIdentifier:", v10, (void)v14);
        [v2 centerForIdentifier:v10];
        SBRectWithSize();
        UIRectCenteredAboutPoint();
        uint64_t v18 = v10;
        double v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
        double v19 = v11;
        double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        [v4 addEntriesFromDictionary:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)zOrderedIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  id v3 = [(SBFloorDodgingLayerModifier *)self model];
  id v4 = [v3 identifiers];
  id v5 = objc_msgSend(v4, "bs_reverse");
  uint64_t v6 = [v2 orderedSetWithArray:v5];

  return v6;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  return 2;
}

- (id)layoutSettingsForIdentifier:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  return v3;
}

- (id)_modelByPerformingDodgingInModel:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52 = [(SBFloorDodgingLayerModifier *)self _modelByClampingOverhangingIdentifiers:v4];
  id v5 = (void *)[v52 mutableCopy];
  uint64_t v6 = [(SBFloorDodgingLayerModifier *)self _modelsByTranslatingOverlappingIdentifiers:v5 allowedEdges:15];

  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __64__SBFloorDodgingLayerModifier__modelByPerformingDodgingInModel___block_invoke;
  v75[3] = &unk_1E6B03930;
  v75[4] = self;
  uint64_t v7 = objc_msgSend(v6, "bs_map:", v75);

  uint64_t v8 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v71 objects:v78 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v72 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [(SBFloorDodgingLayerModifier *)self _modelsByResizingOverlappingIdentifiers:*(void *)(*((void *)&v71 + 1) + 8 * i)];
        [v8 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v71 objects:v78 count:16];
    }
    while (v11);
  }
  v51 = v9;

  v53 = v4;
  long long v15 = [(SBFloorDodgingLayerModifier *)self _framesForIdentifiersInModel:v4];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v8;
  uint64_t v16 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v55 = self;
    id v56 = 0;
    uint64_t v18 = *(void *)v68;
    uint64_t v54 = *(void *)v68;
    do
    {
      uint64_t v19 = 0;
      uint64_t v57 = v17;
      do
      {
        if (*(void *)v68 != v18) {
          objc_enumerationMutation(obj);
        }
        double v20 = *(void **)(*((void *)&v67 + 1) + 8 * v19);
        uint64_t v21 = -[SBFloorDodgingLayerModifier _framesForIdentifiersInModel:](self, "_framesForIdentifiersInModel:", v20, v51);
        uint64_t v22 = [(SBFloorDodgingLayerModifier *)self _identifierIfAnyIllegallyOutsideContentViewBounds:v21 model:v20];
        v66[0] = 0;
        v66[1] = 0;
        uint64_t v23 = [(SBFloorDodgingLayerModifier *)self _identifierIfAnyIllegallyClippingOtherIdentifiers:v21 model:v20 intersectionSize:v66 intersectingFrame:0];
        if (!(v22 | v23))
        {
          uint64_t v59 = v23;
          uint64_t v60 = v22;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v24 = [v20 identifiers];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v62 objects:v76 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v63;
            double v28 = 0.0;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                double v61 = v28;
                if (*(void *)v63 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v30 = *(void *)(*((void *)&v62 + 1) + 8 * j);
                v31 = [v15 objectForKey:v30];
                [v31 CGRectValue];
                double v33 = v32;
                double v35 = v34;

                v36 = [v21 objectForKey:v30];
                [v36 CGRectValue];
                double v38 = v37;
                double v40 = v39;

                UIRectGetCenter();
                double v42 = v41;
                double v44 = v43;
                UIRectGetCenter();
                long double v47 = v61 + hypot(v45 - v42, v46 - v44);
                double v28 = v47 + hypot(v38 - v33, v40 - v35);
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v62 objects:v76 count:16];
            }
            while (v26);
          }

          if (BSFloatLessThanFloat())
          {
            id v48 = v20;

            id v56 = v48;
          }
          uint64_t v18 = v54;
          self = v55;
          uint64_t v17 = v57;
          uint64_t v23 = v59;
          uint64_t v22 = v60;
        }

        ++v19;
      }
      while (v19 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
    }
    while (v17);
  }
  else
  {
    id v56 = 0;
  }

  id v49 = v56;
  return v49;
}

uint64_t __64__SBFloorDodgingLayerModifier__modelByPerformingDodgingInModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _modelByClampingOverhangingIdentifiers:a2];
}

- (id)_modelsByTranslatingOverlappingIdentifiers:(id)a3 allowedEdges:(unint64_t)a4
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SBFloorDodgingLayerModifier *)self _framesForIdentifiersInModel:v6];
  long long v67 = 0u;
  *(_OWORD *)long long v68 = 0u;
  v66[0] = 0;
  v66[1] = 0;
  uint64_t v8 = [(SBFloorDodgingLayerModifier *)self _identifierIfAnyIllegallyClippingOtherIdentifiers:v7 model:v6 intersectionSize:v66 intersectingFrame:&v67];
  if (v8)
  {
    [(SBFloorDodgingLayerModifier *)self spaceBetweenIdentifiers];
    double v10 = v9;
    uint64_t v11 = [(SBFloorDodgingLayerModifier *)self preferenceForIdentifier:v8];
    uint64_t v12 = [v11 dodgingAxisMask];

    double v13 = [v7 objectForKey:v8];
    [v13 CGRectValue];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v72.origin.CGFloat x = v15;
    v72.origin.CGFloat y = v17;
    v72.size.double width = v19;
    v72.size.double height = v21;
    CGRect v73 = CGRectInset(v72, -(v10 * 0.5), -(v10 * 0.5));
    CGFloat x = v73.origin.x;
    CGFloat y = v73.origin.y;
    double width = v73.size.width;
    double height = v73.size.height;
    uint64_t v26 = objc_opt_new();
    if ((a4 & 2) != 0 && SBDodgingAxisMaskContainsAxis(v12, 0))
    {
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke;
      v60[3] = &unk_1E6B03958;
      double v62 = *(double *)&v67 - width;
      CGFloat v63 = y;
      double v64 = width;
      double v65 = height;
      id v61 = v8;
      uint64_t v27 = [v6 modelByModifyingModelWithBlock:v60];
      double v28 = [(SBFloorDodgingLayerModifier *)self _modelsByTranslatingOverlappingIdentifiers:v27 allowedEdges:a4 & 0xFFFFFFFFFFFFFFF7];
      [v26 addObjectsFromArray:v28];
    }
    double v29 = v10 * 0.5;
    if ((a4 & 8) != 0 && SBDodgingAxisMaskContainsAxis(v12, 0))
    {
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_2;
      v54[3] = &unk_1E6B03958;
      double v56 = v29 + *(double *)&v67 + v68[0];
      CGFloat v57 = y;
      double v58 = width;
      double v59 = height;
      id v55 = v8;
      uint64_t v30 = [v6 modelByModifyingModelWithBlock:v54];
      v31 = [(SBFloorDodgingLayerModifier *)self _modelsByTranslatingOverlappingIdentifiers:v30 allowedEdges:a4 & 0xFFFFFFFFFFFFFFFDLL];
      [v26 addObjectsFromArray:v31];
    }
    if ((a4 & 1) != 0 && SBDodgingAxisMaskContainsAxis(v12, 1))
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_3;
      v48[3] = &unk_1E6B03958;
      CGFloat v50 = x;
      double v51 = *((double *)&v67 + 1) - height;
      double v52 = width;
      double v53 = height;
      id v49 = v8;
      double v32 = [v6 modelByModifyingModelWithBlock:v48];
      double v33 = [(SBFloorDodgingLayerModifier *)self _modelsByTranslatingOverlappingIdentifiers:v32 allowedEdges:a4 & 0xFFFFFFFFFFFFFFFBLL];
      [v26 addObjectsFromArray:v33];
    }
    if ((a4 & 4) != 0 && SBDodgingAxisMaskContainsAxis(v12, 1))
    {
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      double v41 = __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_4;
      double v42 = &unk_1E6B03958;
      CGFloat v44 = x;
      double v45 = v29 + *((double *)&v67 + 1) + v68[1];
      double v46 = width;
      double v47 = height;
      id v43 = v8;
      double v34 = [v6 modelByModifyingModelWithBlock:&v39];
      double v35 = -[SBFloorDodgingLayerModifier _modelsByTranslatingOverlappingIdentifiers:allowedEdges:](self, "_modelsByTranslatingOverlappingIdentifiers:allowedEdges:", v34, a4 & 0xFFFFFFFFFFFFFFFELL, v39, v40, v41, v42);
      [v26 addObjectsFromArray:v35];
    }
    if ([v26 count])
    {
      id v36 = v26;
    }
    else
    {
      v70[0] = v6;
      id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
    }
    double v37 = v36;
  }
  else
  {
    id v69 = v6;
    double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  }

  return v37;
}

void __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:forIdentifier:", *(void *)(a1 + 32));
}

void __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:forIdentifier:", *(void *)(a1 + 32));
}

void __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:forIdentifier:", *(void *)(a1 + 32));
}

void __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:forIdentifier:", *(void *)(a1 + 32));
}

- (id)_modelByClampingOverhangingIdentifiers:(id)a3
{
  id v4 = a3;
  [(SBFloorDodgingLayerModifier *)self contentViewBounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [(SBFloorDodgingLayerModifier *)self spaceBetweenIdentifiers];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__SBFloorDodgingLayerModifier__modelByClampingOverhangingIdentifiers___block_invoke;
  v16[3] = &unk_1E6AF4A48;
  v16[4] = self;
  v16[5] = v6;
  v16[6] = v8;
  v16[7] = v10;
  v16[8] = v12;
  v16[9] = v13;
  double v14 = [v4 modelByModifyingModelWithBlock:v16];

  return v14;
}

void __70__SBFloorDodgingLayerModifier__modelByClampingOverhangingIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "identifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [*(id *)(a1 + 32) preferenceForIdentifier:v9];
        char v11 = [v10 canBePositionedOutsideContainerBounds];

        if ((v11 & 1) == 0)
        {
          [v3 sizeForIdentifier:v9];
          SBRectWithSize();
          [v3 centerForIdentifier:v9];
          UIRectCenteredAboutPoint();
          UIRectGetCenter();
          objc_msgSend(v3, "setCenter:forIdentifier:", v9);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)_modelsByResizingOverlappingIdentifiers:(id)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBFloorDodgingLayerModifier *)self _framesForIdentifiersInModel:v4];
  double v55 = 0.0;
  double v56 = 0.0;
  uint64_t v6 = [(SBFloorDodgingLayerModifier *)self _identifierIfAnyIllegallyClippingOtherIdentifiers:v5 model:v4 intersectionSize:&v55 intersectingFrame:0];
  if (v6)
  {
    double v34 = v5;
    uint64_t v7 = [v5 objectForKey:v6];
    [v7 CGRectValue];
    double v35 = v9;
    double v36 = v8;
    double v11 = v10;
    double v13 = v12;

    long long v14 = objc_opt_new();
    long long v15 = [(SBFloorDodgingLayerModifier *)self preferenceForIdentifier:v6];
    [v15 minimumSize];

    for (int i = 0; i != 4; ++i)
    {
      int v17 = i & 0x7FFFFFFD;
      double v18 = v55;
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        if (v17 == 1) {
          double v19 = v18;
        }
        else {
          double v19 = 0.0;
        }
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke;
        v49[3] = &unk_1E6B03958;
        double v51 = v36 + v19;
        double v52 = v35;
        double v53 = v11 - v18;
        double v54 = v13;
        id v50 = v6;
        double v20 = [v4 modelByModifyingModelWithBlock:v49];
        [v14 addObject:v20];
      }
      int v21 = i & 0x7FFFFFFE;
      double v22 = v56;
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        if (v21 == 2) {
          double v23 = v22;
        }
        else {
          double v23 = 0.0;
        }
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke_2;
        v43[3] = &unk_1E6B03958;
        double v45 = v36;
        double v46 = v35 + v23;
        double v47 = v11;
        double v48 = v13 - v22;
        id v44 = v6;
        long long v24 = [v4 modelByModifyingModelWithBlock:v43];
        [v14 addObject:v24];
      }
      double v25 = v55;
      if (v17 == 1) {
        double v26 = v55;
      }
      else {
        double v26 = 0.0;
      }
      if (v21 == 2) {
        double v27 = v56;
      }
      else {
        double v27 = 0.0;
      }
      double v28 = v13 - v56;
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        double v29 = v11 - v25;
        if (BSFloatGreaterThanOrEqualToFloat())
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke_3;
          v37[3] = &unk_1E6B03958;
          double v39 = v36 + v26;
          double v40 = v35 + v27;
          double v41 = v29;
          double v42 = v28;
          id v38 = v6;
          uint64_t v30 = [v4 modelByModifyingModelWithBlock:v37];
          [v14 addObject:v30];
        }
      }
    }
    if ([v14 count])
    {
      id v31 = v14;
    }
    else
    {
      v58[0] = v4;
      id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
    }
    double v32 = v31;
    uint64_t v5 = v34;
  }
  else
  {
    id v57 = v4;
    double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
  }

  return v32;
}

void __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke(double *a1, void *a2)
{
  uint64_t v3 = *((void *)a1 + 4);
  double v4 = a1[7];
  double v5 = a1[8];
  id v6 = a2;
  objc_msgSend(v6, "setSize:forIdentifier:", v3, v4, v5);
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:forIdentifier:", *((void *)a1 + 4));
}

void __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke_2(double *a1, void *a2)
{
  uint64_t v3 = *((void *)a1 + 4);
  double v4 = a1[7];
  double v5 = a1[8];
  id v6 = a2;
  objc_msgSend(v6, "setSize:forIdentifier:", v3, v4, v5);
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:forIdentifier:", *((void *)a1 + 4));
}

void __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke_3(double *a1, void *a2)
{
  uint64_t v3 = *((void *)a1 + 4);
  double v4 = a1[7];
  double v5 = a1[8];
  id v6 = a2;
  objc_msgSend(v6, "setSize:forIdentifier:", v3, v4, v5);
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:forIdentifier:", *((void *)a1 + 4));
}

- (id)_framesForIdentifiersInModel:(id)a3
{
  double v4 = (SBDodgingModel *)a3;
  double v5 = self->_overridingModel;
  overridingModel = self->_overridingModel;
  self->_overridingModel = v4;
  uint64_t v7 = v4;

  double v8 = [(SBFloorDodgingLayerModifier *)self framesForIdentifiers];
  double v9 = self->_overridingModel;
  self->_overridingModel = v5;

  return v8;
}

- (id)_identifierIfAnyIllegallyOutsideContentViewBounds:(id)a3 model:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(SBFloorDodgingLayerModifier *)self contentViewBounds];
  rect1[0] = v6;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(SBFloorDodgingLayerModifier *)self spaceBetweenIdentifiers];
  double v14 = v13;
  memset(&rect1[1], 0, 32);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v15 = [v5 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&rect1[1] objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)rect1[3];
    double v19 = -v14;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)rect1[3] != v18) {
          objc_enumerationMutation(v15);
        }
        int v21 = *(void **)(rect1[2] + 8 * i);
        double v22 = [(SBFloorDodgingLayerModifier *)self preferenceForIdentifier:v21];
        char v23 = [v22 canBePositionedOutsideContainerBounds];

        if ((v23 & 1) == 0)
        {
          long long v24 = [v5 objectForKey:v21];
          [v24 CGRectValue];
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;

          v41.origin.CGFloat x = v26;
          v41.origin.CGFloat y = v28;
          v41.size.double width = v30;
          v41.size.double height = v32;
          CGRect v43 = CGRectInset(v41, v19, v19);
          *(void *)&v42.origin.CGFloat x = rect1[0];
          v42.origin.CGFloat y = v8;
          v42.size.double width = v10;
          v42.size.double height = v12;
          if (!CGRectContainsRect(v42, v43))
          {
            id v33 = v21;
            goto LABEL_12;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&rect1[1] objects:v38 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  id v33 = 0;
LABEL_12:

  return v33;
}

- (id)_identifierIfAnyIllegallyClippingOtherIdentifiers:(id)a3 model:(id)a4 intersectionSize:(CGSize *)a5 intersectingFrame:(CGRect *)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  [(SBFloorDodgingLayerModifier *)self spaceBetweenIdentifiers];
  double v13 = v12;
  double v14 = [v11 identifiers];
  long long v15 = (char *)malloc_type_malloc(32 * [v14 count], 0x1000040E0EAB150uLL);

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = [v11 identifiers];
  uint64_t v57 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v57)
  {
    id v49 = a5;
    id v50 = a6;
    uint64_t v16 = 0;
    uint64_t v56 = *(void *)v67;
    double v60 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v61 = *MEMORY[0x1E4F1DB20];
    double v58 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v59 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    dCGFloat x = v13 * -0.5;
    double v51 = (CGFloat *)(v15 + 16);
    double v52 = v15;
    id v53 = v10;
    while (2)
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v67 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        double v19 = [v10 allKeys];
        int v20 = [v19 containsObject:v18];

        if (v20)
        {
          int v21 = [v10 objectForKey:v18];
          [v21 CGRectValue];
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;

          v73.origin.CGFloat x = v23;
          v73.origin.CGFloat y = v25;
          v73.size.CGFloat width = v27;
          v73.size.CGFloat height = v29;
          CGRect v74 = CGRectInset(v73, dx, dx);
          CGFloat y = v74.origin.y;
          CGFloat x = v74.origin.x;
          CGFloat height = v74.size.height;
          CGFloat width = v74.size.width;
          CGFloat v30 = v60;
          CGFloat v31 = v61;
          CGFloat v32 = v61;
          CGFloat v33 = v60;
          CGFloat v34 = v58;
          CGFloat v35 = v59;
          double v36 = v59;
          double v37 = v58;
          if (v16)
          {
            uint64_t v38 = 0;
            uint64_t v39 = v51;
            double v37 = v58;
            double v36 = v59;
            CGFloat v33 = v60;
            CGFloat v32 = v61;
            while (1)
            {
              CGFloat v31 = *(v39 - 2);
              CGFloat v30 = *(v39 - 1);
              CGFloat v35 = *v39;
              CGFloat v34 = v39[1];
              double v40 = [v11 identifiers];
              CGRect v41 = [v40 objectAtIndex:v38];

              CGRect v42 = [(SBFloorDodgingLayerModifier *)self preferenceForIdentifier:v18];
              CGRect v43 = [v42 excludedDodgingIdentifiers];

              if (([v43 containsObject:v41] & 1) == 0)
              {
                v75.origin.CGFloat y = y;
                v75.origin.CGFloat x = x;
                v75.size.CGFloat height = height;
                v75.size.CGFloat width = width;
                v79.origin.CGFloat x = v31;
                v79.origin.CGFloat y = v30;
                v79.size.CGFloat width = v35;
                v79.size.CGFloat height = v34;
                CGRect v76 = CGRectIntersection(v75, v79);
                CGFloat v32 = v76.origin.x;
                CGFloat v33 = v76.origin.y;
                double v36 = v76.size.width;
                double v37 = v76.size.height;
                if ((BSFloatLessThanFloat() & 1) != 0 || BSFloatLessThanFloat())
                {
                  CGFloat v33 = v60;
                  CGFloat v32 = v61;
                  double v37 = v58;
                  double v36 = v59;
                }
                v77.origin.CGFloat x = v32;
                v77.origin.CGFloat y = v33;
                v77.size.CGFloat width = v36;
                v77.size.CGFloat height = v37;
                if (!CGRectIsNull(v77)) {
                  break;
                }
              }

              ++v38;
              v39 += 4;
              if (v16 == v38)
              {
                CGFloat v34 = v58;
                CGFloat v35 = v59;
                CGFloat v30 = v60;
                CGFloat v31 = v61;
                goto LABEL_17;
              }
            }

LABEL_17:
            long long v15 = v52;
            id v10 = v53;
          }
          v78.origin.CGFloat x = v32;
          v78.origin.CGFloat y = v33;
          v78.size.CGFloat width = v36;
          v78.size.CGFloat height = v37;
          if (!CGRectIsNull(v78))
          {
            id v45 = v18;
            if (v49)
            {
              float v46 = v36;
              float v47 = v37;
              v49->CGFloat width = ceilf(v46);
              v49->CGFloat height = ceilf(v47);
            }
            if (v50)
            {
              v50->origin.CGFloat x = v31;
              v50->origin.CGFloat y = v30;
              v50->size.CGFloat width = v35;
              v50->size.CGFloat height = v34;
            }
            goto LABEL_27;
          }
          id v44 = (CGFloat *)&v15[32 * v16];
          *id v44 = x;
          v44[1] = y;
          ++v16;
          v44[2] = width;
          v44[3] = height;
        }
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v57) {
        continue;
      }
      break;
    }
  }
  id v45 = 0;
LABEL_27:

  free(v15);
  return v45;
}

- (SBDodgingModel)overridingModel
{
  return self->_overridingModel;
}

- (void)setOverridingModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end