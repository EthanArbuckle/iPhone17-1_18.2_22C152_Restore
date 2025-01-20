@interface SBSystemApertureElementAuthority
- (BOOL)elementRequiresBeingDisplayedAlone:(id)a3;
- (SBSystemApertureElementAuthorityDelegate)elementAuthorityDelegate;
- (id)elementsOrderedByPromotionFromTemporallyOrderedElements:(id)a3 withPreviousOrdering:(id)a4;
- (void)setElementAuthorityDelegate:(id)a3;
@end

@implementation SBSystemApertureElementAuthority

- (id)elementsOrderedByPromotionFromTemporallyOrderedElements:(id)a3 withPreviousOrdering:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] <= 1)
  {
    id v8 = v6;
    goto LABEL_29;
  }
  v9 = SBLogSystemApertureMediation();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_30_1);
    v11 = objc_msgSend(v7, "bs_mapNoNulls:", &__block_literal_global_32_1);
    *(_DWORD *)buf = 138543618;
    v39 = v10;
    __int16 v40 = 2114;
    v41 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Ordering elements by promotion: temporallyOrderedElements: %{public}@; previouslyOrderedElements: %{public}@",
      buf,
      0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementAuthorityDelegate);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_33;
  v34[3] = &unk_1E6B054B8;
  id v13 = WeakRetained;
  id v35 = v13;
  v36 = self;
  id v37 = v6;
  id v8 = [v37 sortedArrayUsingComparator:v34];
  v14 = SBLogSystemApertureMediation();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_63_1);
    *(_DWORD *)buf = 138543362;
    v39 = v15;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Ordered elements after initial sort: %{public}@", buf, 0xCu);
  }
  unint64_t v16 = [v13 systemApertureApertureElementAuthorityMaximumNumberOfSimultaneouslyVisibleElements:self];
  if ([v8 count] <= v16) {
    goto LABEL_28;
  }
  v17 = [v8 firstObject];
  uint64_t v18 = [v13 systemApertureApertureElementAuthority:self preferredLayoutModeForElement:v17];

  if (v18 > 2) {
    goto LABEL_28;
  }
  id v32 = v7;
  id v33 = v6;
  if (![v8 count])
  {
    id v20 = 0;
    id v19 = 0;
    goto LABEL_25;
  }
  id v19 = 0;
  id v20 = 0;
  unint64_t v21 = 0;
  while (1)
  {
    v22 = [v8 objectAtIndexedSubscript:v21];
    if ([v13 systemApertureApertureElementAuthority:self isElementRequiredToRemainVisible:v22])
    {
      if (v21 >= v16) {
        break;
      }
    }
LABEL_19:

    if (++v21 >= [v8 count]) {
      goto LABEL_25;
    }
  }
  if (v19)
  {
    if (v20) {
      goto LABEL_15;
    }
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v20) {
      goto LABEL_15;
    }
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E60]);
LABEL_15:
  if ([v19 count] < v16)
  {
    v23 = SBLogSystemApertureMediation();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = _SBShortElementDescription(v22);
      *(_DWORD *)buf = 138543362;
      v39 = v24;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Prioritizing '%{public}@' since it requires visibility", buf, 0xCu);
    }
    [v19 addObject:v22];
    [v20 addIndex:v21];
    goto LABEL_19;
  }

LABEL_25:
  uint64_t v25 = [v19 count];
  id v7 = v32;
  if (v25)
  {
    uint64_t v26 = v25;
    v27 = (void *)[v8 mutableCopy];
    [v27 removeObjectsAtIndexes:v20];
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v16 - v26, v26);
    [v27 insertObjects:v19 atIndexes:v28];

    id v8 = v27;
  }

  id v6 = v33;
LABEL_28:

LABEL_29:
  v29 = SBLogSystemApertureMediation();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_69);
    *(_DWORD *)buf = 138543362;
    v39 = v30;
    _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "Elements ordered by promotion: %{public}@", buf, 0xCu);
  }
  return v8;
}

id __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke(uint64_t a1, void *a2)
{
  return _SBShortElementDescription(a2);
}

id __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_2(uint64_t a1, void *a2)
{
  return _SBShortElementDescription(a2);
}

uint64_t __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) systemApertureApertureElementAuthority:*(void *)(a1 + 40) preferredLayoutModeForElement:v5];
  uint64_t v8 = [*(id *)(a1 + 32) systemApertureApertureElementAuthority:*(void *)(a1 + 40) preferredLayoutModeForElement:v6];
  if (v7 <= 0 && v8 < 1)
  {
    uint64_t v32 = 0;
    v31 = @"Neither element visible";
    goto LABEL_34;
  }
  uint64_t v10 = v8;
  if (v7 >= 1 && v8 <= 0)
  {
    uint64_t v25 = NSString;
    uint64_t v26 = _SBShortElementDescription(v5);
    v27 = _SBShortElementDescription(v6);
    v31 = [v25 stringWithFormat:@"Element '%@' visible while '%@' is not", v26, v27];

    uint64_t v32 = -1;
    goto LABEL_34;
  }
  if (v7 <= 0 && v8 >= 1)
  {
    v28 = NSString;
    v29 = _SBShortElementDescription(v6);
    v30 = _SBShortElementDescription(v5);
    v31 = [v28 stringWithFormat:@"Element '%@' visible while '%@' is not", v29, v30];

    uint64_t v32 = 1;
    goto LABEL_34;
  }
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_2_37;
  v51[3] = &unk_1E6B05490;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  id v52 = v13;
  uint64_t v53 = v14;
  v15 = (uint64_t (**)(void, void, void))MEMORY[0x1D948C7A0](v51);
  int v16 = [*(id *)(a1 + 32) systemApertureApertureElementAuthority:*(void *)(a1 + 40) isElementUrgentlyVisible:v5];
  int v17 = [*(id *)(a1 + 32) systemApertureApertureElementAuthority:*(void *)(a1 + 40) isElementUrgentlyVisible:v6];
  int v18 = ((uint64_t (**)(void, id, uint64_t))v15)[2](v15, v5, v7);
  int v19 = ((uint64_t (**)(void, id, uint64_t))v15)[2](v15, v6, v10);
  if (v16 && v17)
  {
    unint64_t v20 = [*(id *)(a1 + 48) indexOfObject:v5];
    unint64_t v21 = [*(id *)(a1 + 48) indexOfObject:v6];
    v22 = NSString;
    if (v20 <= v21)
    {
      v23 = _SBShortElementDescription(v6);
      v24 = v5;
    }
    else
    {
      v23 = _SBShortElementDescription(v5);
      v24 = v6;
    }
    v39 = _SBShortElementDescription(v24);
    [v22 stringWithFormat:@"Both elements urgent and important, element '%@' temporally after '%@'", v23, v39];
LABEL_28:
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v20 > v21)
    {

      goto LABEL_30;
    }

LABEL_32:
    uint64_t v32 = 1;
    goto LABEL_33;
  }
  if (!v16)
  {
    if (v17)
    {
      v36 = NSString;
      id v37 = _SBShortElementDescription(v6);
      v38 = _SBShortElementDescription(v5);
      [v36 stringWithFormat:@"Element '%@' is urgent while '%@' is not", v37, v38];
    }
    else
    {
      if ((v18 & v19) == 1)
      {
        unint64_t v20 = [*(id *)(a1 + 48) indexOfObject:v5];
        unint64_t v21 = [*(id *)(a1 + 48) indexOfObject:v6];
        v46 = NSString;
        if (v20 <= v21)
        {
          v23 = _SBShortElementDescription(v6);
          v47 = v5;
        }
        else
        {
          v23 = _SBShortElementDescription(v5);
          v47 = v6;
        }
        v39 = _SBShortElementDescription(v47);
        [v46 stringWithFormat:@"Both elements alerts, alerting activities, or expanded due to user interaction, element '%@' temporally after '%@'", v23, v39];
        goto LABEL_28;
      }
      if (v18)
      {
        v48 = NSString;
        v34 = _SBShortElementDescription(v5);
        id v35 = _SBShortElementDescription(v6);
        [v48 stringWithFormat:@"Element '%@' is an alert, alerting activity, or expanded due to user interaction while '%@' is not", v34, v35];
        goto LABEL_22;
      }
      if (!v19)
      {
        id v50 = 0;
        uint64_t v32 = _CompareActivityElementsByElementIdentifier(v5, v6, &v50);
        v31 = (__CFString *)v50;
        goto LABEL_33;
      }
      v49 = NSString;
      id v37 = _SBShortElementDescription(v6);
      v38 = _SBShortElementDescription(v5);
      [v49 stringWithFormat:@"Element '%@' is an alert, alerting activity, or expanded due to user interaction while '%@' is not", v37, v38];
    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  id v33 = NSString;
  v34 = _SBShortElementDescription(v5);
  id v35 = _SBShortElementDescription(v6);
  [v33 stringWithFormat:@"Element '%@' is urgent while '%@' is not", v34, v35];
LABEL_22:
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_30:
  uint64_t v32 = -1;
LABEL_33:

LABEL_34:
  __int16 v40 = SBLogSystemApertureMediation();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    if (v32 == 1)
    {
      v41 = _SBShortElementDescription(v6);
      uint64_t v42 = @"over";
      v43 = v5;
    }
    else
    {
      v41 = _SBShortElementDescription(v5);
      if (v32) {
        uint64_t v42 = @"over";
      }
      else {
        uint64_t v42 = @"same as";
      }
      v43 = v6;
    }
    v44 = _SBShortElementDescription(v43);
    *(_DWORD *)buf = 138544130;
    v55 = v41;
    __int16 v56 = 2114;
    v57 = v42;
    __int16 v58 = 2114;
    v59 = v44;
    __int16 v60 = 2114;
    v61 = v31;
    _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "Prioritizing '%{public}@' %{public}@ '%{public}@' (%{public}@)", buf, 0x2Au);
  }
  return v32;
}

uint64_t __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_2_37(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((SAHasAlertBehavior() & 1) != 0
    || SAHasActivityBehavior()
    && ([*(id *)(a1 + 32) systemApertureApertureElementAuthority:*(void *)(a1 + 40) isActivityElementAlerting:v5] & 1) != 0)
  {
    uint64_t v6 = 1;
  }
  else if (a3 == 3)
  {
    uint64_t v6 = [*(id *)(a1 + 32) systemApertureApertureElementAuthority:*(void *)(a1 + 40) isElementExpandedDueToUserInteraction:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_61(uint64_t a1, void *a2)
{
  return _SBShortElementDescription(a2);
}

id __113__SBSystemApertureElementAuthority_elementsOrderedByPromotionFromTemporallyOrderedElements_withPreviousOrdering___block_invoke_67(uint64_t a1, void *a2)
{
  return _SBShortElementDescription(a2);
}

- (BOOL)elementRequiresBeingDisplayedAlone:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementAuthorityDelegate);
  if (SAHasActivityBehavior()
    && ([WeakRetained systemApertureApertureElementAuthority:self isActivityElementAlerting:v4] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [WeakRetained systemApertureApertureElementAuthority:self isElementUrgentlyVisible:v4];
  }

  return v6;
}

- (SBSystemApertureElementAuthorityDelegate)elementAuthorityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementAuthorityDelegate);
  return (SBSystemApertureElementAuthorityDelegate *)WeakRetained;
}

- (void)setElementAuthorityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end