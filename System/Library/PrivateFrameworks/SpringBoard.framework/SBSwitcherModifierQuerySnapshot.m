@interface SBSwitcherModifierQuerySnapshot
- (NSArray)contextMethods;
- (NSArray)implementingQueryMethods;
- (NSArray)nonImplementingQueryMethods;
- (NSDictionary)contextMethodsToDescriptions;
- (NSDictionary)queryMethodsToDescriptions;
- (SBSwitcherModifierQuerySnapshot)initWithModifier:(id)a3;
- (void)_buildFromModifier:(id)a3;
@end

@implementation SBSwitcherModifierQuerySnapshot

- (SBSwitcherModifierQuerySnapshot)initWithModifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBSwitcherModifierTimelineEntry.m", 177, @"Invalid parameter not satisfying: %@", @"modifier" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)SBSwitcherModifierQuerySnapshot;
  v6 = [(SBSwitcherModifierQuerySnapshot *)&v10 init];
  v7 = v6;
  if (v6) {
    [(SBSwitcherModifierQuerySnapshot *)v6 _buildFromModifier:v5];
  }

  return v7;
}

- (void)_buildFromModifier:(id)a3
{
  uint64_t v3 = MEMORY[0x1F4188790](self);
  uint64_t v505 = v4;
  uint64_t v507 = v3;
  v793[1] = *MEMORY[0x1E4F143B8];
  id v6 = v5;
  id obj = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v506 = [v6 appLayouts];
  v7 = NSStringFromSelector(sel_adjustedAppLayoutsForAppLayouts_);
  v792 = v7;
  v8 = [v6 adjustedAppLayoutsForAppLayouts:v506];
  v9 = objc_msgSend(v8, "sb_switcherModifierDebugTimelineDescription");
  v793[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v793 forKeys:&v792 count:1];
  [obj addEntriesFromDictionary:v10];

  v780[0] = MEMORY[0x1E4F143A8];
  v780[1] = 3221225472;
  v780[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke;
  v780[3] = &unk_1E6AFD560;
  id v11 = v6;
  id v781 = v11;
  v12 = _SBCallDescriptionBlock(v780);
  v13 = NSStringFromSelector(sel_visibleAppLayouts);
  [obj setObject:v12 forKey:v13];

  v778[0] = MEMORY[0x1E4F143A8];
  v778[1] = 3221225472;
  v778[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_2;
  v778[3] = &unk_1E6AFD560;
  id v14 = v11;
  id v779 = v14;
  v15 = _SBCallDescriptionBlock(v778);
  v16 = NSStringFromSelector(sel_foregroundAppLayouts);
  [obj setObject:v15 forKey:v16];

  v776[0] = MEMORY[0x1E4F143A8];
  v776[1] = 3221225472;
  v776[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_3;
  v776[3] = &unk_1E6B0CAB0;
  id v17 = v14;
  id v777 = v17;
  v18 = _SBCallDescriptionBlockForEachVisibleAppLayout(v17, v776);
  v19 = NSStringFromSelector(sel_activityModeForAppLayout_);
  [obj setObject:v18 forKey:v19];

  v774[0] = MEMORY[0x1E4F143A8];
  v774[1] = 3221225472;
  v774[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_4;
  v774[3] = &unk_1E6B0CAD8;
  id v20 = v17;
  id v775 = v20;
  v21 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v20, v774);
  v22 = NSStringFromSelector(sel_frameForIndex_);
  [obj setObject:v21 forKey:v22];

  v772[0] = MEMORY[0x1E4F143A8];
  v772[1] = 3221225472;
  v772[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_5;
  v772[3] = &unk_1E6B0CAD8;
  id v23 = v20;
  id v773 = v23;
  v24 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v23, v772);
  v25 = NSStringFromSelector(sel_scaleForIndex_);
  [obj setObject:v24 forKey:v25];

  v770[0] = MEMORY[0x1E4F143A8];
  v770[1] = 3221225472;
  v770[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_6;
  v770[3] = &unk_1E6B0CAD8;
  id v26 = v23;
  id v771 = v26;
  v27 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v26, v770);
  v28 = NSStringFromSelector(sel_anchorPointForIndex_);
  [obj setObject:v27 forKey:v28];

  v768[0] = MEMORY[0x1E4F143A8];
  v768[1] = 3221225472;
  v768[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_7;
  v768[3] = &unk_1E6B0CAD8;
  id v29 = v26;
  id v769 = v29;
  v30 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v29, v768);
  v31 = NSStringFromSelector(sel_shouldPinLayoutRolesToSpace_);
  [obj setObject:v30 forKey:v31];

  v766[0] = MEMORY[0x1E4F143A8];
  v766[1] = 3221225472;
  v766[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_8;
  v766[3] = &unk_1E6B0CAD8;
  id v32 = v29;
  id v767 = v32;
  v33 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v32, v766);
  v34 = NSStringFromSelector(sel_shouldUseAnchorPointToPinLayoutRolesToSpace_);
  [obj setObject:v33 forKey:v34];

  v764[0] = MEMORY[0x1E4F143A8];
  v764[1] = 3221225472;
  v764[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_9;
  v764[3] = &unk_1E6B0CAD8;
  id v35 = v32;
  id v765 = v35;
  v36 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v35, v764);
  v37 = NSStringFromSelector(sel_clipsToUnobscuredMarginAtIndex_);
  [obj setObject:v36 forKey:v37];

  v762[0] = MEMORY[0x1E4F143A8];
  v762[1] = 3221225472;
  v762[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_10;
  v762[3] = &unk_1E6B0CAD8;
  id v38 = v35;
  id v763 = v38;
  v39 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v38, v762);
  v40 = NSStringFromSelector(sel_visibleMarginForItemContainerAtIndex_);
  [obj setObject:v39 forKey:v40];

  v760[0] = MEMORY[0x1E4F143A8];
  v760[1] = 3221225472;
  v760[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_11;
  v760[3] = &unk_1E6B0CAD8;
  id v41 = v38;
  id v761 = v41;
  v42 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v41, v760);
  v43 = NSStringFromSelector(sel_wallpaperOverlayAlphaForIndex_);
  [obj setObject:v42 forKey:v43];

  v758[0] = MEMORY[0x1E4F143A8];
  v758[1] = 3221225472;
  v758[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_12;
  v758[3] = &unk_1E6B0CAD8;
  id v44 = v41;
  id v759 = v44;
  v45 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v44, v758);
  v46 = NSStringFromSelector(sel_lighteningAlphaForIndex_);
  [obj setObject:v45 forKey:v46];

  v756[0] = MEMORY[0x1E4F143A8];
  v756[1] = 3221225472;
  v756[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_13;
  v756[3] = &unk_1E6B0CAD8;
  id v47 = v44;
  id v757 = v47;
  v48 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v47, v756);
  v49 = NSStringFromSelector(sel_headerStyleForIndex_);
  [obj setObject:v48 forKey:v49];

  v754[0] = MEMORY[0x1E4F143A8];
  v754[1] = 3221225472;
  v754[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_14;
  v754[3] = &unk_1E6B0CAD8;
  id v50 = v47;
  id v755 = v50;
  v51 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v50, v754);
  v52 = NSStringFromSelector(sel_titleOpacityForIndex_);
  [obj setObject:v51 forKey:v52];

  v752[0] = MEMORY[0x1E4F143A8];
  v752[1] = 3221225472;
  v752[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_15;
  v752[3] = &unk_1E6B0CAD8;
  id v53 = v50;
  id v753 = v53;
  v54 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v53, v752);
  v55 = NSStringFromSelector(sel_isContentStatusBarVisibleForIndex_);
  [obj setObject:v54 forKey:v55];

  v750[0] = MEMORY[0x1E4F143A8];
  v750[1] = 3221225472;
  v750[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_16;
  v750[3] = &unk_1E6B0CAD8;
  id v56 = v53;
  id v751 = v56;
  v57 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v56, v750);
  v58 = NSStringFromSelector(sel_shouldUseBrightMaterialForIndex_);
  [obj setObject:v57 forKey:v58];

  v748[0] = MEMORY[0x1E4F143A8];
  v748[1] = 3221225472;
  v748[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_17;
  v748[3] = &unk_1E6B0CAD8;
  id v59 = v56;
  id v749 = v59;
  v60 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v59, v748);
  v61 = NSStringFromSelector(sel_cornerRadiiForIndex_);
  [obj setObject:v60 forKey:v61];

  v746[0] = MEMORY[0x1E4F143A8];
  v746[1] = 3221225472;
  v746[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_18;
  v746[3] = &unk_1E6B0CAD8;
  id v62 = v59;
  id v747 = v62;
  v63 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v62, v746);
  v64 = NSStringFromSelector(sel_maskedCornersForIndex_);
  [obj setObject:v63 forKey:v64];

  v744[0] = MEMORY[0x1E4F143A8];
  v744[1] = 3221225472;
  v744[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_19;
  v744[3] = &unk_1E6B0CAD8;
  id v65 = v62;
  id v745 = v65;
  v66 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v65, v744);
  v67 = NSStringFromSelector(sel_isIndexRubberbandableForSwipeToKill_);
  [obj setObject:v66 forKey:v67];

  v742[0] = MEMORY[0x1E4F143A8];
  v742[1] = 3221225472;
  v742[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_20;
  v742[3] = &unk_1E6B0CAD8;
  id v68 = v65;
  id v743 = v68;
  v69 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v68, v742);
  v70 = NSStringFromSelector(sel_minimumTranslationToKillIndex_);
  [obj setObject:v69 forKey:v70];

  v740[0] = MEMORY[0x1E4F143A8];
  v740[1] = 3221225472;
  v740[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_21;
  v740[3] = &unk_1E6B0CAD8;
  id v71 = v68;
  id v741 = v71;
  v72 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v71, v740);
  v73 = NSStringFromSelector(sel_backgroundOpacityForIndex_);
  [obj setObject:v72 forKey:v73];

  v738[0] = MEMORY[0x1E4F143A8];
  v738[1] = 3221225472;
  v738[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_22;
  v738[3] = &unk_1E6B0CAD8;
  id v74 = v71;
  id v739 = v74;
  v75 = _SBCallDescriptionBlockForEachVisibleAppLayoutByIndex(v74, v738);
  v76 = NSStringFromSelector(sel_clipsToBoundsAtIndex_);
  [obj setObject:v75 forKey:v76];

  id v77 = v74;
  NSStringFromSelector(sel_clippingFrameForIndex_withBounds_);
  p = (Protocol *)objc_claimAutoreleasedReturnValue();
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v79 = [v77 visibleAppLayouts];
  v80 = [v77 appLayouts];
  v81 = [v77 methodSignatureForSelector:sel_clippingFrameForIndex_withBounds_];
  if (v81)
  {
    *(void *)outCount = MEMORY[0x1E4F143A8];
    uint64_t v783 = 3221225472;
    v784 = ___SBCallDescriptionBlockForEachVisibleAppLayoutByIndexWithBounds_block_invoke;
    v785 = &unk_1E6B0CB70;
    id v786 = v79;
    id v787 = v77;
    id v788 = v81;
    id v790 = &__block_literal_global_190_0;
    v791 = sel_clippingFrameForIndex_withBounds_;
    id v82 = v78;
    id v789 = v82;
    [v80 enumerateObjectsUsingBlock:outCount];
    v83 = objc_msgSend(v82, "sb_switcherModifierDebugTimelineDescription");
  }
  else
  {
    v83 = [NSString stringWithFormat:@"No context method for %@", p];
  }

  v84 = NSStringFromSelector(sel_clippingFrameForIndex_withBounds_);
  [obj setObject:v83 forKey:v84];

  id v85 = v77;
  NSStringFromSelector(sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_);
  pa = (Protocol *)objc_claimAutoreleasedReturnValue();
  id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v87 = [v85 visibleAppLayouts];
  v88 = [v85 appLayouts];
  v89 = [v85 methodSignatureForSelector:sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_];
  if (v89)
  {
    *(void *)outCount = MEMORY[0x1E4F143A8];
    uint64_t v783 = 3221225472;
    v784 = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithIndexAndBounds_block_invoke;
    v785 = &unk_1E6B0CB70;
    id v786 = v87;
    id v787 = v85;
    id v788 = v89;
    id v790 = &__block_literal_global_194_1;
    v791 = sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_;
    id v90 = v86;
    id v789 = v90;
    [v88 enumerateObjectsUsingBlock:outCount];
    v91 = objc_msgSend(v90, "sb_switcherModifierDebugTimelineDescription");
  }
  else
  {
    v91 = [NSString stringWithFormat:@"No context method for %@", pa];
  }

  v92 = NSStringFromSelector(sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_);
  [obj setObject:v91 forKey:v92];

  v93 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_snapshotScaleForLayoutRole_inAppLayout_, &__block_literal_global_198);
  v94 = NSStringFromSelector(sel_snapshotScaleForLayoutRole_inAppLayout_);
  [obj setObject:v93 forKey:v94];

  v95 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_scaleForLayoutRole_inAppLayout_, &__block_literal_global_202_1);
  v96 = NSStringFromSelector(sel_scaleForLayoutRole_inAppLayout_);
  [obj setObject:v95 forKey:v96];

  v97 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isLayoutRoleBlurred_inAppLayout_, &__block_literal_global_206);
  v98 = NSStringFromSelector(sel_isLayoutRoleBlurred_inAppLayout_);
  [obj setObject:v97 forKey:v98];

  v99 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_blurDelayForLayoutRole_inAppLayout_, &__block_literal_global_210_0);
  v100 = NSStringFromSelector(sel_blurDelayForLayoutRole_inAppLayout_);
  [obj setObject:v99 forKey:v100];

  v101 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_blurTargetPreferenceForLayoutRole_inAppLayout_, &__block_literal_global_214_0);
  v102 = NSStringFromSelector(sel_blurTargetPreferenceForLayoutRole_inAppLayout_);
  [obj setObject:v101 forKey:v102];

  v103 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_dimmingAlphaForLayoutRole_inAppLayout_, &__block_literal_global_218_1);
  v104 = NSStringFromSelector(sel_dimmingAlphaForLayoutRole_inAppLayout_);
  [obj setObject:v103 forKey:v104];

  v105 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_shouldSuppressHighlightEffectForLayoutRole_inAppLayout_, &__block_literal_global_222);
  v106 = NSStringFromSelector(sel_shouldSuppressHighlightEffectForLayoutRole_inAppLayout_);
  [obj setObject:v105 forKey:v106];

  v107 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, &__block_literal_global_226_0);
  v108 = NSStringFromSelector(sel_isLayoutRoleMatchMovedToScene_inAppLayout_);
  [obj setObject:v107 forKey:v108];

  v109 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isLayoutRoleSelectable_inAppLayout_, &__block_literal_global_230_0);
  v110 = NSStringFromSelector(sel_isLayoutRoleSelectable_inAppLayout_);
  [obj setObject:v109 forKey:v110];

  v111 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isLayoutRoleDraggable_inAppLayout_, &__block_literal_global_234);
  v112 = NSStringFromSelector(sel_isLayoutRoleDraggable_inAppLayout_);
  [obj setObject:v111 forKey:v112];

  v113 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_shouldUseNonuniformSnapshotScalingForLayoutRole_inAppLayout_, &__block_literal_global_238_0);
  v114 = NSStringFromSelector(sel_shouldUseNonuniformSnapshotScalingForLayoutRole_inAppLayout_);
  [obj setObject:v113 forKey:v114];

  v115 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_hiddenContentStatusBarPartsForLayoutRole_inAppLayout_, &__block_literal_global_242);
  v116 = NSStringFromSelector(sel_hiddenContentStatusBarPartsForLayoutRole_inAppLayout_);
  [obj setObject:v115 forKey:v116];

  v117 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_shadowStyleForLayoutRole_inAppLayout_, &__block_literal_global_246_0);
  v118 = NSStringFromSelector(sel_shadowStyleForLayoutRole_inAppLayout_);
  [obj setObject:v117 forKey:v118];

  v119 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_isItemResizingAllowedForLayoutRole_inAppLayout_, &__block_literal_global_250_1);
  v120 = NSStringFromSelector(sel_isItemResizingAllowedForLayoutRole_inAppLayout_);
  [obj setObject:v119 forKey:v120];

  v121 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v85, sel_shouldAllowContentViewTouchesForLayoutRole_inAppLayout_, &__block_literal_global_254);
  v122 = NSStringFromSelector(sel_shouldAllowContentViewTouchesForLayoutRole_inAppLayout_);
  [obj setObject:v121 forKey:v122];

  v123 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex(v85, sel_opacityForLayoutRole_inAppLayout_atIndex_, &__block_literal_global_258);
  v124 = NSStringFromSelector(sel_opacityForLayoutRole_inAppLayout_atIndex_);
  [obj setObject:v123 forKey:v124];

  v125 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex(v85, sel_isLayoutRoleKillable_inAppLayout_atIndex_, &__block_literal_global_262_0);
  v126 = NSStringFromSelector(sel_isLayoutRoleKillable_inAppLayout_atIndex_);
  [obj setObject:v125 forKey:v126];

  id v127 = v85;
  NSStringFromSelector(sel_frameForLayoutRole_inAppLayout_withBounds_);
  pb = (Protocol *)objc_claimAutoreleasedReturnValue();
  id v128 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v129 = [v127 visibleAppLayouts];
  v130 = [v127 appLayouts];
  v131 = [v127 methodSignatureForSelector:sel_frameForLayoutRole_inAppLayout_withBounds_];
  if (v131)
  {
    *(void *)outCount = MEMORY[0x1E4F143A8];
    uint64_t v783 = 3221225472;
    v784 = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds_block_invoke;
    v785 = &unk_1E6B0CB70;
    id v786 = v129;
    id v787 = v127;
    id v788 = v131;
    id v790 = &__block_literal_global_266_0;
    v791 = sel_frameForLayoutRole_inAppLayout_withBounds_;
    id v132 = v128;
    id v789 = v132;
    [v130 enumerateObjectsUsingBlock:outCount];
    v133 = objc_msgSend(v132, "sb_switcherModifierDebugTimelineDescription");
  }
  else
  {
    v133 = [NSString stringWithFormat:@"No context method for %@", pb];
  }

  v134 = NSStringFromSelector(sel_frameForLayoutRole_inAppLayout_withBounds_);
  [obj setObject:v133 forKey:v134];

  v736[0] = MEMORY[0x1E4F143A8];
  v736[1] = 3221225472;
  v736[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_43;
  v736[3] = &unk_1E6B0CAB0;
  id v135 = v127;
  id v737 = v135;
  v136 = _SBCallDescriptionBlockForEachVisibleAppLayout(v135, v736);
  v137 = NSStringFromSelector(sel_animationAttributesForLayoutElement_);
  [obj setObject:v136 forKey:v137];

  v734[0] = MEMORY[0x1E4F143A8];
  v734[1] = 3221225472;
  v734[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_44;
  v734[3] = &unk_1E6B0CAB0;
  id v138 = v135;
  id v735 = v138;
  v139 = _SBCallDescriptionBlockForEachVisibleAppLayout(v138, v734);
  v140 = NSStringFromSelector(sel_frameForIconOverlayInAppLayout_);
  [obj setObject:v139 forKey:v140];

  v732[0] = MEMORY[0x1E4F143A8];
  v732[1] = 3221225472;
  v732[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_45;
  v732[3] = &unk_1E6B0CAB0;
  id v141 = v138;
  id v733 = v141;
  v142 = _SBCallDescriptionBlockForEachVisibleAppLayout(v141, v732);
  v143 = NSStringFromSelector(sel_isFocusEnabledForAppLayout_);
  [obj setObject:v142 forKey:v143];

  v730[0] = MEMORY[0x1E4F143A8];
  v730[1] = 3221225472;
  v730[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_46;
  v730[3] = &unk_1E6B0CAB0;
  id v144 = v141;
  id v731 = v144;
  v145 = _SBCallDescriptionBlockForEachVisibleAppLayout(v144, v730);
  v146 = NSStringFromSelector(sel_multipleWindowsIndicatorLayoutRoleMaskForAppLayout_);
  [obj setObject:v145 forKey:v146];

  v728[0] = MEMORY[0x1E4F143A8];
  v728[1] = 3221225472;
  v728[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_47;
  v728[3] = &unk_1E6B0CAB0;
  id v147 = v144;
  id v729 = v147;
  v148 = _SBCallDescriptionBlockForEachVisibleAppLayout(v147, v728);
  v149 = NSStringFromSelector(sel_preferredSnapshotOrientationForAppLayout_);
  [obj setObject:v148 forKey:v149];

  v726[0] = MEMORY[0x1E4F143A8];
  v726[1] = 3221225472;
  v726[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_48;
  v726[3] = &unk_1E6B0CAB0;
  id v150 = v147;
  id v727 = v150;
  v151 = _SBCallDescriptionBlockForEachVisibleAppLayout(v150, v726);
  v152 = NSStringFromSelector(sel_wantsSceneResizesHostedContextForAppLayout_);
  [obj setObject:v151 forKey:v152];

  v724[0] = MEMORY[0x1E4F143A8];
  v724[1] = 3221225472;
  v724[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_49;
  v724[3] = &unk_1E6B0CAB0;
  id v153 = v150;
  id v725 = v153;
  v154 = _SBCallDescriptionBlockForEachVisibleAppLayout(v153, v724);
  v155 = NSStringFromSelector(sel_canSelectLeafWithModifierKeysInAppLayout_);
  [obj setObject:v154 forKey:v155];

  v722[0] = MEMORY[0x1E4F143A8];
  v722[1] = 3221225472;
  v722[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_50;
  v722[3] = &unk_1E6B0CAB0;
  id v156 = v153;
  id v723 = v156;
  v157 = _SBCallDescriptionBlockForEachVisibleAppLayout(v156, v722);
  v158 = NSStringFromSelector(sel_shouldAllowGroupOpacityForAppLayout_);
  [obj setObject:v157 forKey:v158];

  v720[0] = MEMORY[0x1E4F143A8];
  v720[1] = 3221225472;
  v720[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_51;
  v720[3] = &unk_1E6B0CAB0;
  id v159 = v156;
  id v721 = v159;
  v160 = _SBCallDescriptionBlockForEachVisibleAppLayout(v159, v720);
  v161 = NSStringFromSelector(sel_asyncRenderingAttributesForAppLayout_);
  [obj setObject:v160 forKey:v161];

  v718[0] = MEMORY[0x1E4F143A8];
  v718[1] = 3221225472;
  v718[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_52;
  v718[3] = &unk_1E6AFD560;
  id v162 = v159;
  id v719 = v162;
  v163 = _SBCallDescriptionBlock(v718);
  v164 = NSStringFromSelector(sel_contentViewScale);
  [obj setObject:v163 forKey:v164];

  v716[0] = MEMORY[0x1E4F143A8];
  v716[1] = 3221225472;
  v716[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_53;
  v716[3] = &unk_1E6AFD560;
  id v165 = v162;
  id v717 = v165;
  v166 = _SBCallDescriptionBlock(v716);
  v167 = NSStringFromSelector(sel_homeScreenAlpha);
  [obj setObject:v166 forKey:v167];

  v714[0] = MEMORY[0x1E4F143A8];
  v714[1] = 3221225472;
  v714[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_54;
  v714[3] = &unk_1E6AFD560;
  id v168 = v165;
  id v715 = v168;
  v169 = _SBCallDescriptionBlock(v714);
  v170 = NSStringFromSelector(sel_homeScreenBackdropBlurProgress);
  [obj setObject:v169 forKey:v170];

  v712[0] = MEMORY[0x1E4F143A8];
  v712[1] = 3221225472;
  v712[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_55;
  v712[3] = &unk_1E6AFD560;
  id v171 = v168;
  id v713 = v171;
  v172 = _SBCallDescriptionBlock(v712);
  v173 = NSStringFromSelector(sel_homeScreenScale);
  [obj setObject:v172 forKey:v173];

  v710[0] = MEMORY[0x1E4F143A8];
  v710[1] = 3221225472;
  v710[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_56;
  v710[3] = &unk_1E6AFD560;
  id v174 = v171;
  id v711 = v174;
  v175 = _SBCallDescriptionBlock(v710);
  v176 = NSStringFromSelector(sel_wallpaperScale);
  [obj setObject:v175 forKey:v176];

  v708[0] = MEMORY[0x1E4F143A8];
  v708[1] = 3221225472;
  v708[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_57;
  v708[3] = &unk_1E6AFD560;
  id v177 = v174;
  id v709 = v177;
  v178 = _SBCallDescriptionBlock(v708);
  v179 = NSStringFromSelector(sel_homeScreenDimmingAlpha);
  [obj setObject:v178 forKey:v179];

  v706[0] = MEMORY[0x1E4F143A8];
  v706[1] = 3221225472;
  v706[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_58;
  v706[3] = &unk_1E6AFD560;
  id v180 = v177;
  id v707 = v180;
  v181 = _SBCallDescriptionBlock(v706);
  v182 = NSStringFromSelector(sel_containerStatusBarAnimationDuration);
  [obj setObject:v181 forKey:v182];

  v704[0] = MEMORY[0x1E4F143A8];
  v704[1] = 3221225472;
  v704[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_59;
  v704[3] = &unk_1E6AFD560;
  id v183 = v180;
  id v705 = v183;
  v184 = _SBCallDescriptionBlock(v704);
  v185 = NSStringFromSelector(sel_hiddenContainerStatusBarParts);
  [obj setObject:v184 forKey:v185];

  v702[0] = MEMORY[0x1E4F143A8];
  v702[1] = 3221225472;
  v702[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_60;
  v702[3] = &unk_1E6AFD560;
  id v186 = v183;
  id v703 = v186;
  v187 = _SBCallDescriptionBlock(v702);
  v188 = NSStringFromSelector(sel_dockProgress);
  [obj setObject:v187 forKey:v188];

  v700[0] = MEMORY[0x1E4F143A8];
  v700[1] = 3221225472;
  v700[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_61;
  v700[3] = &unk_1E6AFD560;
  id v189 = v186;
  id v701 = v189;
  v190 = _SBCallDescriptionBlock(v700);
  v191 = NSStringFromSelector(sel_dockWindowLevelPriority);
  [obj setObject:v190 forKey:v191];

  v698[0] = MEMORY[0x1E4F143A8];
  v698[1] = 3221225472;
  v698[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_62;
  v698[3] = &unk_1E6AFD560;
  id v192 = v189;
  id v699 = v192;
  v193 = _SBCallDescriptionBlock(v698);
  v194 = NSStringFromSelector(sel_dockWindowLevel);
  [obj setObject:v193 forKey:v194];

  v696[0] = MEMORY[0x1E4F143A8];
  v696[1] = 3221225472;
  v696[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_63;
  v696[3] = &unk_1E6AFD560;
  id v195 = v192;
  id v697 = v195;
  v196 = _SBCallDescriptionBlock(v696);
  v197 = NSStringFromSelector(sel_shelfBackgroundBlurOpacity);
  [obj setObject:v196 forKey:v197];

  v694[0] = MEMORY[0x1E4F143A8];
  v694[1] = 3221225472;
  v694[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_64;
  v694[3] = &unk_1E6AFD560;
  id v198 = v195;
  id v695 = v198;
  v199 = _SBCallDescriptionBlock(v694);
  v200 = NSStringFromSelector(sel_shelfBackgroundBlurFrame);
  [obj setObject:v199 forKey:v200];

  v692[0] = MEMORY[0x1E4F143A8];
  v692[1] = 3221225472;
  v692[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_65;
  v692[3] = &unk_1E6AFD560;
  id v201 = v198;
  id v693 = v201;
  v202 = _SBCallDescriptionBlock(v692);
  v203 = NSStringFromSelector(sel_wantsSlideOverTongue);
  [obj setObject:v202 forKey:v203];

  v690[0] = MEMORY[0x1E4F143A8];
  v690[1] = 3221225472;
  v690[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_66;
  v690[3] = &unk_1E6AFD560;
  id v204 = v201;
  id v691 = v204;
  v205 = _SBCallDescriptionBlock(v690);
  v206 = NSStringFromSelector(sel_slideOverTongueState);
  [obj setObject:v205 forKey:v206];

  v688[0] = MEMORY[0x1E4F143A8];
  v688[1] = 3221225472;
  v688[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_67;
  v688[3] = &unk_1E6AFD560;
  id v207 = v204;
  id v689 = v207;
  v208 = _SBCallDescriptionBlock(v688);
  v209 = NSStringFromSelector(sel_slideOverTongueDirection);
  [obj setObject:v208 forKey:v209];

  v686[0] = MEMORY[0x1E4F143A8];
  v686[1] = 3221225472;
  v686[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_68;
  v686[3] = &unk_1E6AFD560;
  id v210 = v207;
  id v687 = v210;
  v211 = _SBCallDescriptionBlock(v686);
  v212 = NSStringFromSelector(sel_appLayoutToAttachSlideOverTongue);
  [obj setObject:v211 forKey:v212];

  v684[0] = MEMORY[0x1E4F143A8];
  v684[1] = 3221225472;
  v684[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_69;
  v684[3] = &unk_1E6AFD560;
  id v213 = v210;
  id v685 = v213;
  v214 = _SBCallDescriptionBlock(v684);
  v215 = NSStringFromSelector(sel_isScrollEnabled);
  [obj setObject:v214 forKey:v215];

  v682[0] = MEMORY[0x1E4F143A8];
  v682[1] = 3221225472;
  v682[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_70;
  v682[3] = &unk_1E6AFD560;
  id v216 = v213;
  id v683 = v216;
  v217 = _SBCallDescriptionBlock(v682);
  v218 = NSStringFromSelector(sel_shouldScrollViewBlockTouches);
  [obj setObject:v217 forKey:v218];

  v680[0] = MEMORY[0x1E4F143A8];
  v680[1] = 3221225472;
  v680[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_71;
  v680[3] = &unk_1E6AFD560;
  id v219 = v216;
  id v681 = v219;
  v220 = _SBCallDescriptionBlock(v680);
  v221 = NSStringFromSelector(sel_isContainerStatusBarVisible);
  [obj setObject:v220 forKey:v221];

  v678[0] = MEMORY[0x1E4F143A8];
  v678[1] = 3221225472;
  v678[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_72;
  v678[3] = &unk_1E6AFD560;
  id v222 = v219;
  id v679 = v222;
  v223 = _SBCallDescriptionBlock(v678);
  v224 = NSStringFromSelector(sel_isWallpaperRequiredForSwitcher);
  [obj setObject:v223 forKey:v224];

  v676[0] = MEMORY[0x1E4F143A8];
  v676[1] = 3221225472;
  v676[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_73;
  v676[3] = &unk_1E6AFD560;
  id v225 = v222;
  id v677 = v225;
  v226 = _SBCallDescriptionBlock(v676);
  v227 = NSStringFromSelector(sel_isHomeScreenContentRequired);
  [obj setObject:v226 forKey:v227];

  v674[0] = MEMORY[0x1E4F143A8];
  v674[1] = 3221225472;
  v674[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_74;
  v674[3] = &unk_1E6AFD560;
  id v228 = v225;
  id v675 = v228;
  v229 = _SBCallDescriptionBlock(v674);
  v230 = NSStringFromSelector(sel_isSwitcherWindowVisible);
  [obj setObject:v229 forKey:v230];

  v672[0] = MEMORY[0x1E4F143A8];
  v672[1] = 3221225472;
  v672[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_75;
  v672[3] = &unk_1E6AFD560;
  id v231 = v228;
  id v673 = v231;
  v232 = _SBCallDescriptionBlock(v672);
  v233 = NSStringFromSelector(sel_isSwitcherWindowUserInteractionEnabled);
  [obj setObject:v232 forKey:v233];

  v670[0] = MEMORY[0x1E4F143A8];
  v670[1] = 3221225472;
  v670[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_76;
  v670[3] = &unk_1E6AFD560;
  id v234 = v231;
  id v671 = v234;
  v235 = _SBCallDescriptionBlock(v670);
  v236 = NSStringFromSelector(sel_shouldAcceleratedHomeButtonPressBegin);
  [obj setObject:v235 forKey:v236];

  v668[0] = MEMORY[0x1E4F143A8];
  v668[1] = 3221225472;
  v668[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_77;
  v668[3] = &unk_1E6AFD560;
  id v237 = v234;
  id v669 = v237;
  v238 = _SBCallDescriptionBlock(v668);
  v239 = NSStringFromSelector(sel_shouldFireTransitionCompletionInDefaultRunLoopMode);
  [obj setObject:v238 forKey:v239];

  v666[0] = MEMORY[0x1E4F143A8];
  v666[1] = 3221225472;
  v666[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_78;
  v666[3] = &unk_1E6AFD560;
  id v240 = v237;
  id v667 = v240;
  v241 = _SBCallDescriptionBlock(v666);
  v242 = NSStringFromSelector(sel_wantsDockBehaviorAssertion);
  [obj setObject:v241 forKey:v242];

  v664[0] = MEMORY[0x1E4F143A8];
  v664[1] = 3221225472;
  v664[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_79;
  v664[3] = &unk_1E6AFD560;
  id v243 = v240;
  id v665 = v243;
  v244 = _SBCallDescriptionBlock(v664);
  v245 = NSStringFromSelector(sel_wantsDockWindowLevelAssertion);
  [obj setObject:v244 forKey:v245];

  v662[0] = MEMORY[0x1E4F143A8];
  v662[1] = 3221225472;
  v662[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_80;
  v662[3] = &unk_1E6AFD560;
  id v246 = v243;
  id v663 = v246;
  v247 = _SBCallDescriptionBlock(v662);
  v248 = NSStringFromSelector(sel_wantsAsynchronousSurfaceRetentionAssertion);
  [obj setObject:v247 forKey:v248];

  v660[0] = MEMORY[0x1E4F143A8];
  v660[1] = 3221225472;
  v660[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_81;
  v660[3] = &unk_1E6AFD560;
  id v249 = v246;
  id v661 = v249;
  v250 = _SBCallDescriptionBlock(v660);
  v251 = NSStringFromSelector(sel_isItemContainerPointerInteractionEnabled);
  [obj setObject:v250 forKey:v251];

  v658[0] = MEMORY[0x1E4F143A8];
  v658[1] = 3221225472;
  v658[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_82;
  v658[3] = &unk_1E6AFD560;
  id v252 = v249;
  id v659 = v252;
  v253 = _SBCallDescriptionBlock(v658);
  v254 = NSStringFromSelector(sel_shouldRubberbandFullScreenHomeGrabberView);
  [obj setObject:v253 forKey:v254];

  v656[0] = MEMORY[0x1E4F143A8];
  v656[1] = 3221225472;
  v656[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_83;
  v656[3] = &unk_1E6AFD560;
  id v255 = v252;
  id v657 = v255;
  v256 = _SBCallDescriptionBlock(v656);
  v257 = NSStringFromSelector(sel_wallpaperStyle);
  [obj setObject:v256 forKey:v257];

  v654[0] = MEMORY[0x1E4F143A8];
  v654[1] = 3221225472;
  v654[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_84;
  v654[3] = &unk_1E6AFD560;
  id v258 = v255;
  id v655 = v258;
  v259 = _SBCallDescriptionBlock(v654);
  v260 = NSStringFromSelector(sel_homeScreenBackdropBlurType);
  [obj setObject:v259 forKey:v260];

  v652[0] = MEMORY[0x1E4F143A8];
  v652[1] = 3221225472;
  v652[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_85;
  v652[3] = &unk_1E6AFD560;
  id v261 = v258;
  id v653 = v261;
  v262 = _SBCallDescriptionBlock(v652);
  v263 = NSStringFromSelector(sel_dockUpdateMode);
  [obj setObject:v262 forKey:v263];

  v650[0] = MEMORY[0x1E4F143A8];
  v650[1] = 3221225472;
  v650[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_86;
  v650[3] = &unk_1E6AFD560;
  id v264 = v261;
  id v651 = v264;
  v265 = _SBCallDescriptionBlock(v650);
  v266 = NSStringFromSelector(sel_appLayoutToScrollToBeforeTransitioning);
  [obj setObject:v265 forKey:v266];

  v648[0] = MEMORY[0x1E4F143A8];
  v648[1] = 3221225472;
  v648[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_87;
  v648[3] = &unk_1E6AFD560;
  id v267 = v264;
  id v649 = v267;
  v268 = _SBCallDescriptionBlock(v648);
  v269 = NSStringFromSelector(sel_appLayoutToScrollToBeforeReopeningClosedWindows);
  [obj setObject:v268 forKey:v269];

  v646[0] = MEMORY[0x1E4F143A8];
  v646[1] = 3221225472;
  v646[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_88;
  v646[3] = &unk_1E6AFD560;
  id v270 = v267;
  id v647 = v270;
  v271 = _SBCallDescriptionBlock(v646);
  v272 = NSStringFromSelector(sel_topMostLayoutElements);
  [obj setObject:v271 forKey:v272];

  v644[0] = MEMORY[0x1E4F143A8];
  v644[1] = 3221225472;
  v644[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_89;
  v644[3] = &unk_1E6AFD560;
  id v273 = v270;
  id v645 = v273;
  v274 = _SBCallDescriptionBlock(v644);
  v275 = NSStringFromSelector(sel_appLayoutsToCacheSnapshots);
  [obj setObject:v274 forKey:v275];

  v642[0] = MEMORY[0x1E4F143A8];
  v642[1] = 3221225472;
  v642[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_90;
  v642[3] = &unk_1E6AFD560;
  id v276 = v273;
  id v643 = v276;
  v277 = _SBCallDescriptionBlock(v642);
  v278 = NSStringFromSelector(sel_appLayoutsToCacheFullsizeSnapshots);
  [obj setObject:v277 forKey:v278];

  v640[0] = MEMORY[0x1E4F143A8];
  v640[1] = 3221225472;
  v640[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_91;
  v640[3] = &unk_1E6AFD560;
  id v279 = v276;
  id v641 = v279;
  v280 = _SBCallDescriptionBlock(v640);
  v281 = NSStringFromSelector(sel_appLayoutsToResignActive);
  [obj setObject:v280 forKey:v281];

  v638[0] = MEMORY[0x1E4F143A8];
  v638[1] = 3221225472;
  v638[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_92;
  v638[3] = &unk_1E6AFD560;
  id v282 = v279;
  id v639 = v282;
  v283 = _SBCallDescriptionBlock(v638);
  v284 = NSStringFromSelector(sel_keyboardSuppressionMode);
  [obj setObject:v283 forKey:v284];

  v636[0] = MEMORY[0x1E4F143A8];
  v636[1] = 3221225472;
  v636[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_93;
  v636[3] = &unk_1E6AFD560;
  id v285 = v282;
  id v637 = v285;
  v286 = _SBCallDescriptionBlock(v636);
  v287 = NSStringFromSelector(sel_keyboardFocusedAppLayout);
  [obj setObject:v286 forKey:v287];

  v634[0] = MEMORY[0x1E4F143A8];
  v634[1] = 3221225472;
  v634[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_94;
  v634[3] = &unk_1E6AFD560;
  id v288 = v285;
  id v635 = v288;
  v289 = _SBCallDescriptionBlock(v634);
  v290 = NSStringFromSelector(sel_leafAppLayoutForKeyboardFocusedScene);
  [obj setObject:v289 forKey:v290];

  v632[0] = MEMORY[0x1E4F143A8];
  v632[1] = 3221225472;
  v632[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_95;
  v632[3] = &unk_1E6AFD560;
  id v291 = v288;
  id v633 = v291;
  v292 = _SBCallDescriptionBlock(v632);
  v293 = NSStringFromSelector(sel_shelfFocusedDisplayItems);
  [obj setObject:v292 forKey:v293];

  v630[0] = MEMORY[0x1E4F143A8];
  v630[1] = 3221225472;
  v630[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_96;
  v630[3] = &unk_1E6AFD560;
  id v294 = v291;
  id v631 = v294;
  v295 = _SBCallDescriptionBlock(v630);
  v296 = NSStringFromSelector(sel_activeLeafAppLayoutsReachableByKeyboardShortcut);
  [obj setObject:v295 forKey:v296];

  v628[0] = MEMORY[0x1E4F143A8];
  v628[1] = 3221225472;
  v628[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_97;
  v628[3] = &unk_1E6AFD560;
  id v297 = v294;
  id v629 = v297;
  v298 = _SBCallDescriptionBlock(v628);
  v299 = NSStringFromSelector(sel_inactiveAppLayoutsReachableByKeyboardShortcut);
  [obj setObject:v298 forKey:v299];

  v626[0] = MEMORY[0x1E4F143A8];
  v626[1] = 3221225472;
  v626[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_98;
  v626[3] = &unk_1E6B0CAB0;
  id v300 = v297;
  id v627 = v300;
  v301 = _SBCallDescriptionBlockForEachVisibleAppLayout(v300, v626);
  v302 = NSStringFromSelector(sel_isHomeAffordanceSupportedForAppLayout_);
  [obj setObject:v301 forKey:v302];

  v624[0] = MEMORY[0x1E4F143A8];
  v624[1] = 3221225472;
  v624[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_99;
  v624[3] = &unk_1E6AFD560;
  id v303 = v300;
  id v625 = v303;
  v304 = _SBCallDescriptionBlock(v624);
  v305 = NSStringFromSelector(sel_visibleHomeAffordanceLayoutElements);
  [obj setObject:v304 forKey:v305];

  v622[0] = MEMORY[0x1E4F143A8];
  v622[1] = 3221225472;
  v622[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_100;
  v622[3] = &unk_1E6B0CAB0;
  id v306 = v303;
  id v623 = v306;
  v307 = _SBCallDescriptionBlockForEachVisibleAppLayout(v306, v622);
  v308 = NSStringFromSelector(sel_shouldAccessoryDrawShadowForAppLayout_);
  [obj setObject:v307 forKey:v308];

  v620[0] = MEMORY[0x1E4F143A8];
  v620[1] = 3221225472;
  v620[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_101;
  v620[3] = &unk_1E6B0CAB0;
  id v309 = v306;
  id v621 = v309;
  v310 = _SBCallDescriptionBlockForEachVisibleAppLayout(v309, v620);
  v311 = NSStringFromSelector(sel_isResizeGrabberVisibleForAppLayout_);
  [obj setObject:v310 forKey:v311];

  v618[0] = MEMORY[0x1E4F143A8];
  v618[1] = 3221225472;
  v618[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_102;
  v618[3] = &unk_1E6AFD560;
  id v312 = v309;
  id v619 = v312;
  v313 = _SBCallDescriptionBlock(v618);
  v314 = NSStringFromSelector(sel_visibleShelves);
  [obj setObject:v313 forKey:v314];

  v616[0] = MEMORY[0x1E4F143A8];
  v616[1] = 3221225472;
  v616[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_103;
  v616[3] = &unk_1E6B0CB20;
  id v315 = v312;
  id v617 = v315;
  v316 = _SBCallDescriptionBlockForEachShelf(v315, v616);
  v317 = NSStringFromSelector(sel_containerLeafAppLayoutForShelf_);
  [obj setObject:v316 forKey:v317];

  v614[0] = MEMORY[0x1E4F143A8];
  v614[1] = 3221225472;
  v614[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_104;
  v614[3] = &unk_1E6B0CB20;
  id v318 = v315;
  id v615 = v318;
  v319 = _SBCallDescriptionBlockForEachShelf(v318, v614);
  v320 = NSStringFromSelector(sel_frameForShelf_);
  [obj setObject:v319 forKey:v320];

  v612[0] = MEMORY[0x1E4F143A8];
  v612[1] = 3221225472;
  v612[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_105;
  v612[3] = &unk_1E6B0CB20;
  id v321 = v318;
  id v613 = v321;
  v322 = _SBCallDescriptionBlockForEachShelf(v321, v612);
  v323 = NSStringFromSelector(sel_presentationAttributesForShelf_);
  [obj setObject:v322 forKey:v323];

  v610[0] = MEMORY[0x1E4F143A8];
  v610[1] = 3221225472;
  v610[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_106;
  v610[3] = &unk_1E6B0CB20;
  id v324 = v321;
  id v611 = v324;
  v325 = _SBCallDescriptionBlockForEachShelf(v324, v610);
  v326 = NSStringFromSelector(sel_focusedAppLayoutForShelf_);
  [obj setObject:v325 forKey:v326];

  v608[0] = MEMORY[0x1E4F143A8];
  v608[1] = 3221225472;
  v608[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_107;
  v608[3] = &unk_1E6B0CB20;
  id v327 = v324;
  id v609 = v327;
  v328 = _SBCallDescriptionBlockForEachShelf(v327, v608);
  v329 = NSStringFromSelector(sel_ignoredDisplayItemsForShelf_);
  [obj setObject:v328 forKey:v329];

  v606[0] = MEMORY[0x1E4F143A8];
  v606[1] = 3221225472;
  v606[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_108;
  v606[3] = &unk_1E6B0CB20;
  id v330 = v327;
  id v607 = v330;
  v331 = _SBCallDescriptionBlockForEachShelf(v330, v606);
  v332 = NSStringFromSelector(sel_hiddenAppLayoutsInShelf_);
  [obj setObject:v331 forKey:v332];

  v604[0] = MEMORY[0x1E4F143A8];
  v604[1] = 3221225472;
  v604[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_109;
  v604[3] = &unk_1E6AFD560;
  id v333 = v330;
  id v605 = v333;
  v334 = _SBCallDescriptionBlock(v604);
  v335 = NSStringFromSelector(sel_animatablePropertyIdentifiers);
  [obj setObject:v334 forKey:v335];

  v602[0] = MEMORY[0x1E4F143A8];
  v602[1] = 3221225472;
  v602[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_110;
  v602[3] = &unk_1E6AFD560;
  id v336 = v333;
  id v603 = v336;
  v337 = _SBCallDescriptionBlock(v602);
  v338 = NSStringFromSelector(sel_appExposeAccessoryButtonsBundleIdentifier);
  [obj setObject:v337 forKey:v338];

  v600[0] = MEMORY[0x1E4F143A8];
  v600[1] = 3221225472;
  v600[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_111;
  v600[3] = &unk_1E6AFD560;
  id v339 = v336;
  id v601 = v339;
  v340 = _SBCallDescriptionBlock(v600);
  v341 = NSStringFromSelector(sel_plusButtonAlpha);
  [obj setObject:v340 forKey:v341];

  v598[0] = MEMORY[0x1E4F143A8];
  v598[1] = 3221225472;
  v598[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_112;
  v598[3] = &unk_1E6AFD560;
  id v342 = v339;
  id v599 = v342;
  v343 = _SBCallDescriptionBlock(v598);
  v344 = NSStringFromSelector(sel_reopenClosedWindowsButtonAlpha);
  [obj setObject:v343 forKey:v344];

  v596[0] = MEMORY[0x1E4F143A8];
  v596[1] = 3221225472;
  v596[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_113;
  v596[3] = &unk_1E6AFD560;
  id v345 = v342;
  id v597 = v345;
  v346 = _SBCallDescriptionBlock(v596);
  v347 = NSStringFromSelector(sel_reopenClosedWindowsButtonScale);
  [obj setObject:v346 forKey:v347];

  v594[0] = MEMORY[0x1E4F143A8];
  v594[1] = 3221225472;
  v594[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_114;
  v594[3] = &unk_1E6AFD560;
  id v348 = v345;
  id v595 = v348;
  v349 = _SBCallDescriptionBlock(v594);
  v350 = NSStringFromSelector(sel_appExposeAccessoryButtonsOverrideUserInterfaceStyle);
  [obj setObject:v349 forKey:v350];

  v592[0] = MEMORY[0x1E4F143A8];
  v592[1] = 3221225472;
  v592[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_115;
  v592[3] = &unk_1E6AFD560;
  id v351 = v348;
  id v593 = v351;
  v352 = _SBCallDescriptionBlock(v592);
  v353 = NSStringFromSelector(sel_plusButtonStyle);
  [obj setObject:v352 forKey:v353];

  v590[0] = MEMORY[0x1E4F143A8];
  v590[1] = 3221225472;
  v590[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_116;
  v590[3] = &unk_1E6B0CAB0;
  id v354 = v351;
  id v591 = v354;
  v355 = _SBCallDescriptionBlockForEachVisibleAppLayout(v354, v590);
  v356 = NSStringFromSelector(sel_perspectiveAngleForAppLayout_);
  [obj setObject:v355 forKey:v356];

  v588[0] = MEMORY[0x1E4F143A8];
  v588[1] = 3221225472;
  v588[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_117;
  v588[3] = &unk_1E6AFD560;
  id v357 = v354;
  id v589 = v357;
  v358 = _SBCallDescriptionBlock(v588);
  v359 = NSStringFromSelector(sel_wantsContinuousExposeHoverGesture);
  [obj setObject:v358 forKey:v359];

  v586[0] = MEMORY[0x1E4F143A8];
  v586[1] = 3221225472;
  v586[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_118;
  v586[3] = &unk_1E6AFD560;
  id v360 = v357;
  id v587 = v360;
  v361 = _SBCallDescriptionBlock(v586);
  v362 = NSStringFromSelector(sel_isContinuousExposeStripVisible);
  [obj setObject:v361 forKey:v362];

  v584[0] = MEMORY[0x1E4F143A8];
  v584[1] = 3221225472;
  v584[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_119;
  v584[3] = &unk_1E6AFD560;
  id v363 = v360;
  id v585 = v363;
  v364 = _SBCallDescriptionBlock(v584);
  v365 = NSStringFromSelector(sel_wantsContinuousExposeHoverGesture);
  [obj setObject:v364 forKey:v365];

  v582[0] = MEMORY[0x1E4F143A8];
  v582[1] = 3221225472;
  v582[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_120;
  v582[3] = &unk_1E6AFD560;
  id v366 = v363;
  id v583 = v366;
  v367 = _SBCallDescriptionBlock(v582);
  v368 = NSStringFromSelector(sel_continuousExposeStripTongueAttributes);
  [obj setObject:v367 forKey:v368];

  objc_storeStrong((id *)(v507 + 24), obj);
  id v369 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v370 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v371 = (id)[(id)objc_opt_class() baseClassForQueryProtocol];
  outCount[0] = 0;
  uint64_t v372 = +[SBSwitcherModifier queryProtocol];
  if (v372)
  {
    v373 = (Protocol *)v372;
    v374 = &selRef__deviceBlockedChanged_;
    while (1)
    {
      pc = v373;
      if (protocol_isEqual(v373, (Protocol *)v374[38])) {
        break;
      }
      v375 = protocol_copyMethodDescriptionList(pc, 1, 1, outCount);
      v376 = v375;
      if (outCount[0])
      {
        unint64_t v377 = 0;
        v378 = v375;
        do
        {
          name = v378->name;
          uint64_t v380 = [(id)objc_opt_class() instanceMethodForSelector:v378->name];
          uint64_t v381 = [v371 instanceMethodForSelector:name];
          v382 = NSStringFromSelector(name);
          if (v380 == v381 || v380 == 0) {
            v384 = v370;
          }
          else {
            v384 = v369;
          }
          [v384 addObject:v382];

          ++v377;
          ++v378;
        }
        while (v377 < outCount[0]);
      }
      free(v376);
      unsigned int v581 = 0;
      v385 = protocol_copyProtocolList(pc, &v581);
      if (!v581)
      {

        goto LABEL_28;
      }
      v386 = (id *)v385;
      if (v581 != 1)
      {
        v388 = [MEMORY[0x1E4F28B00] currentHandler];
        [v388 handleFailureInMethod:v505 object:v507 file:@"SBSwitcherModifierTimelineEntry.m" lineNumber:851 description:@"Multiple sub protocols not currently supported"];
      }
      v387 = (Protocol *)*v386;

      free(v386);
      v373 = v387;
      v374 = &selRef__deviceBlockedChanged_;
      if (!v387) {
        goto LABEL_28;
      }
    }
  }
  else
  {
LABEL_28:
    pc = 0;
  }
  objc_msgSend(v369, "sortUsingSelector:");
  [v370 sortUsingSelector:sel_compare_];
  v389 = *(void **)(v507 + 8);
  *(void *)(v507 + 8) = v369;
  id v504 = v369;

  v390 = *(void **)(v507 + 16);
  *(void *)(v507 + 16) = v370;
  id v503 = v370;

  id v391 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v579[0] = MEMORY[0x1E4F143A8];
  v579[1] = 3221225472;
  v579[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_121;
  v579[3] = &unk_1E6AFD560;
  id v392 = v366;
  id v580 = v392;
  v393 = _SBCallDescriptionBlock(v579);
  v394 = NSStringFromSelector(sel_appLayouts);
  [v391 setObject:v393 forKey:v394];

  v577[0] = MEMORY[0x1E4F143A8];
  v577[1] = 3221225472;
  v577[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_122;
  v577[3] = &unk_1E6AFD560;
  id v395 = v392;
  id v578 = v395;
  v396 = _SBCallDescriptionBlock(v577);
  v397 = NSStringFromSelector(sel_appLayoutsGenerationCount);
  [v391 setObject:v396 forKey:v397];

  v575[0] = MEMORY[0x1E4F143A8];
  v575[1] = 3221225472;
  v575[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_123;
  v575[3] = &unk_1E6AFD560;
  id v398 = v395;
  id v576 = v398;
  v399 = _SBCallDescriptionBlock(v575);
  v400 = NSStringFromSelector(sel_continuousExposeIdentifiersInStrip);
  [v391 setObject:v399 forKey:v400];

  v573[0] = MEMORY[0x1E4F143A8];
  v573[1] = 3221225472;
  v573[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_124;
  v573[3] = &unk_1E6AFD560;
  id v401 = v398;
  id v574 = v401;
  v402 = _SBCallDescriptionBlock(v573);
  v403 = NSStringFromSelector(sel_continuousExposeIdentifiersInSwitcher);
  [v391 setObject:v402 forKey:v403];

  v571[0] = MEMORY[0x1E4F143A8];
  v571[1] = 3221225472;
  v571[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_125;
  v571[3] = &unk_1E6AFD560;
  id v404 = v401;
  id v572 = v404;
  v405 = _SBCallDescriptionBlock(v571);
  v406 = NSStringFromSelector(sel_containerViewBounds);
  [v391 setObject:v405 forKey:v406];

  v569[0] = MEMORY[0x1E4F143A8];
  v569[1] = 3221225472;
  v569[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_126;
  v569[3] = &unk_1E6AFD560;
  id v407 = v404;
  id v570 = v407;
  v408 = _SBCallDescriptionBlock(v569);
  v409 = NSStringFromSelector(sel_switcherViewBounds);
  [v391 setObject:v408 forKey:v409];

  v567[0] = MEMORY[0x1E4F143A8];
  v567[1] = 3221225472;
  v567[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_127;
  v567[3] = &unk_1E6AFD560;
  id v410 = v407;
  id v568 = v410;
  v411 = _SBCallDescriptionBlock(v567);
  v412 = NSStringFromSelector(sel_isDevicePad);
  [v391 setObject:v411 forKey:v412];

  v565[0] = MEMORY[0x1E4F143A8];
  v565[1] = 3221225472;
  v565[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_128;
  v565[3] = &unk_1E6AFD560;
  id v413 = v410;
  id v566 = v413;
  v414 = _SBCallDescriptionBlock(v565);
  v415 = NSStringFromSelector(sel_hasHomeButton);
  [v391 setObject:v414 forKey:v415];

  v563[0] = MEMORY[0x1E4F143A8];
  v563[1] = 3221225472;
  v563[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_129;
  v563[3] = &unk_1E6AFD560;
  id v416 = v413;
  id v564 = v416;
  v417 = _SBCallDescriptionBlock(v563);
  v418 = NSStringFromSelector(sel_isChamoisWindowingUIEnabled);
  [v391 setObject:v417 forKey:v418];

  v561[0] = MEMORY[0x1E4F143A8];
  v561[1] = 3221225472;
  v561[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_130;
  v561[3] = &unk_1E6AFD560;
  id v419 = v416;
  id v562 = v419;
  v420 = _SBCallDescriptionBlock(v561);
  v421 = NSStringFromSelector(sel_isReduceMotionEnabled);
  [v391 setObject:v420 forKey:v421];

  v559[0] = MEMORY[0x1E4F143A8];
  v559[1] = 3221225472;
  v559[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_131;
  v559[3] = &unk_1E6AFD560;
  id v422 = v419;
  id v560 = v422;
  v423 = _SBCallDescriptionBlock(v559);
  v424 = NSStringFromSelector(sel_isRTLEnabled);
  [v391 setObject:v423 forKey:v424];

  v557[0] = MEMORY[0x1E4F143A8];
  v557[1] = 3221225472;
  v557[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_132;
  v557[3] = &unk_1E6AFD560;
  id v425 = v422;
  id v558 = v425;
  v426 = _SBCallDescriptionBlock(v557);
  v427 = NSStringFromSelector(sel_isFloatingDockSupported);
  [v391 setObject:v426 forKey:v427];

  v555[0] = MEMORY[0x1E4F143A8];
  v555[1] = 3221225472;
  v555[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_133;
  v555[3] = &unk_1E6AFD560;
  id v428 = v425;
  id v556 = v428;
  v429 = _SBCallDescriptionBlock(v555);
  v430 = NSStringFromSelector(sel_isStudyLogEnabled);
  [v391 setObject:v429 forKey:v430];

  v553[0] = MEMORY[0x1E4F143A8];
  v553[1] = 3221225472;
  v553[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_134;
  v553[3] = &unk_1E6AFD560;
  id v431 = v428;
  id v554 = v431;
  v432 = _SBCallDescriptionBlock(v553);
  v433 = NSStringFromSelector(sel_isMedusaCapable);
  [v391 setObject:v432 forKey:v433];

  v551[0] = MEMORY[0x1E4F143A8];
  v551[1] = 3221225472;
  v551[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_135;
  v551[3] = &unk_1E6AFD560;
  id v434 = v431;
  id v552 = v434;
  v435 = _SBCallDescriptionBlock(v551);
  v436 = NSStringFromSelector(sel_isSplitViewSupported);
  [v391 setObject:v435 forKey:v436];

  v549[0] = MEMORY[0x1E4F143A8];
  v549[1] = 3221225472;
  v549[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_136;
  v549[3] = &unk_1E6AFD560;
  id v437 = v434;
  id v550 = v437;
  v438 = _SBCallDescriptionBlock(v549);
  v439 = NSStringFromSelector(sel_isInMedusaCapableSpace);
  [v391 setObject:v438 forKey:v439];

  v547[0] = MEMORY[0x1E4F143A8];
  v547[1] = 3221225472;
  v547[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_137;
  v547[3] = &unk_1E6AFD560;
  id v440 = v437;
  id v548 = v440;
  v441 = _SBCallDescriptionBlock(v547);
  v442 = NSStringFromSelector(sel_prefersStripHidden);
  [v391 setObject:v441 forKey:v442];

  v545[0] = MEMORY[0x1E4F143A8];
  v545[1] = 3221225472;
  v545[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_138;
  v545[3] = &unk_1E6AFD560;
  id v443 = v440;
  id v546 = v443;
  v444 = _SBCallDescriptionBlock(v545);
  v445 = NSStringFromSelector(sel_prefersDockHidden);
  [v391 setObject:v444 forKey:v445];

  v543[0] = MEMORY[0x1E4F143A8];
  v543[1] = 3221225472;
  v543[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_139;
  v543[3] = &unk_1E6AFD560;
  id v446 = v443;
  id v544 = v446;
  v447 = _SBCallDescriptionBlock(v543);
  v448 = NSStringFromSelector(sel_isSoftwareKeyboardVisible);
  [v391 setObject:v447 forKey:v448];

  v541[0] = MEMORY[0x1E4F143A8];
  v541[1] = 3221225472;
  v541[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_140;
  v541[3] = &unk_1E6AFD560;
  id v449 = v446;
  id v542 = v449;
  v450 = _SBCallDescriptionBlock(v541);
  v451 = NSStringFromSelector(sel_isDisplayEmbedded);
  [v391 setObject:v450 forKey:v451];

  v539[0] = MEMORY[0x1E4F143A8];
  v539[1] = 3221225472;
  v539[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_141;
  v539[3] = &unk_1E6B0CAB0;
  id v452 = v449;
  id v540 = v452;
  v453 = _SBCallDescriptionBlockForEachVisibleAppLayout(v452, v539);
  v454 = NSStringFromSelector(sel_appLayoutContainsOnlyResizableApps_);
  [v391 setObject:v453 forKey:v454];

  v537[0] = MEMORY[0x1E4F143A8];
  v537[1] = 3221225472;
  v537[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_142;
  v537[3] = &unk_1E6B0CAB0;
  id v455 = v452;
  id v538 = v455;
  v456 = _SBCallDescriptionBlockForEachVisibleAppLayout(v455, v537);
  v457 = NSStringFromSelector(sel_appLayoutContainsAnUnoccludedMaximizedDisplayItem_);
  [v391 setObject:v456 forKey:v457];

  v535[0] = MEMORY[0x1E4F143A8];
  v535[1] = 3221225472;
  v535[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_143;
  v535[3] = &unk_1E6B0CAB0;
  id v458 = v455;
  id v536 = v458;
  v459 = _SBCallDescriptionBlockForEachVisibleAppLayout(v458, v535);
  v460 = NSStringFromSelector(sel_homeScreenIconFrameForAppLayout_);
  [v391 setObject:v459 forKey:v460];

  v533[0] = MEMORY[0x1E4F143A8];
  v533[1] = 3221225472;
  v533[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_144;
  v533[3] = &unk_1E6B0CAB0;
  id v461 = v458;
  id v534 = v461;
  v462 = _SBCallDescriptionBlockForEachVisibleAppLayout(v461, v533);
  v463 = NSStringFromSelector(sel_homeScreenIconScaleForAppLayout_);
  [v391 setObject:v462 forKey:v463];

  v531[0] = MEMORY[0x1E4F143A8];
  v531[1] = 3221225472;
  v531[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_145;
  v531[3] = &unk_1E6B0CAB0;
  id v464 = v461;
  id v532 = v464;
  v465 = _SBCallDescriptionBlockForEachVisibleAppLayout(v464, v531);
  v466 = NSStringFromSelector(sel_homeScreenIconCornerRadiusForAppLayout_);
  [v391 setObject:v465 forKey:v466];

  v529[0] = MEMORY[0x1E4F143A8];
  v529[1] = 3221225472;
  v529[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_146;
  v529[3] = &unk_1E6B0CAB0;
  id v467 = v464;
  id v530 = v467;
  v468 = _SBCallDescriptionBlockForEachVisibleAppLayout(v467, v529);
  v469 = NSStringFromSelector(sel_homeScreenIconLocationForAppLayout_);
  [v391 setObject:v468 forKey:v469];

  v527[0] = MEMORY[0x1E4F143A8];
  v527[1] = 3221225472;
  v527[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_147;
  v527[3] = &unk_1E6B0CAB0;
  id v470 = v467;
  id v528 = v470;
  v471 = _SBCallDescriptionBlockForEachVisibleAppLayout(v470, v527);
  v472 = NSStringFromSelector(sel_homeScreenIconGridSizeClassForAppLayout_);
  [v391 setObject:v471 forKey:v472];

  v525[0] = MEMORY[0x1E4F143A8];
  v525[1] = 3221225472;
  v525[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_148;
  v525[3] = &unk_1E6B0CAB0;
  id v473 = v470;
  id v526 = v473;
  v474 = _SBCallDescriptionBlockForEachVisibleAppLayout(v473, v525);
  v475 = NSStringFromSelector(sel_itemContainerForAppLayoutOverlapsFloatingDock_);
  [v391 setObject:v474 forKey:v475];

  v523[0] = MEMORY[0x1E4F143A8];
  v523[1] = 3221225472;
  v523[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_149;
  v523[3] = &unk_1E6AFD560;
  id v476 = v473;
  id v524 = v476;
  v477 = _SBCallDescriptionBlock(v523);
  v478 = NSStringFromSelector(sel_keyboardFocusedAppLayout);
  [v391 setObject:v477 forKey:v478];

  v521[0] = MEMORY[0x1E4F143A8];
  v521[1] = 3221225472;
  v521[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_150;
  v521[3] = &unk_1E6AFD560;
  id v479 = v476;
  id v522 = v479;
  v480 = _SBCallDescriptionBlock(v521);
  v481 = NSStringFromSelector(sel_leafAppLayoutForKeyboardFocusedScene);
  [v391 setObject:v480 forKey:v481];

  v519[0] = MEMORY[0x1E4F143A8];
  v519[1] = 3221225472;
  v519[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_151;
  v519[3] = &unk_1E6AFD560;
  id v482 = v479;
  id v520 = v482;
  v483 = _SBCallDescriptionBlock(v519);
  v484 = NSStringFromSelector(sel_shelfFocusedDisplayItems);
  [v391 setObject:v483 forKey:v484];

  v517[0] = MEMORY[0x1E4F143A8];
  v517[1] = 3221225472;
  v517[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_152;
  v517[3] = &unk_1E6AFD560;
  id v485 = v482;
  id v518 = v485;
  v486 = _SBCallDescriptionBlock(v517);
  v487 = NSStringFromSelector(sel_userInterfaceStyle);
  [v391 setObject:v486 forKey:v487];

  v515[0] = MEMORY[0x1E4F143A8];
  v515[1] = 3221225472;
  v515[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_153;
  v515[3] = &unk_1E6AFD560;
  id v488 = v485;
  id v516 = v488;
  v489 = _SBCallDescriptionBlock(v515);
  v490 = NSStringFromSelector(sel_draggingAppLayoutsForWindowDrag);
  [v391 setObject:v489 forKey:v490];

  v513[0] = MEMORY[0x1E4F143A8];
  v513[1] = 3221225472;
  v513[2] = __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_154;
  v513[3] = &unk_1E6AFD560;
  id v514 = v488;
  id v491 = v488;
  v492 = _SBCallDescriptionBlock(v513);
  v493 = NSStringFromSelector(sel_proposedAppLayoutsForWindowDrag);
  [v391 setObject:v492 forKey:v493];

  v494 = _SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayout(v491, sel_isLayoutRoleContentReady_inAppLayout_, &__block_literal_global_534_0);
  v495 = NSStringFromSelector(sel_isLayoutRoleContentReady_inAppLayout_);
  [v391 setObject:v494 forKey:v495];

  id v496 = v491;
  v497 = *(void **)(v507 + 40);
  *(void *)(v507 + 40) = v391;
  id v498 = v391;

  v499 = v496;
  v500 = [v498 allKeys];
  uint64_t v501 = [v500 sortedArrayUsingSelector:sel_compare_];
  v502 = *(void **)(v507 + 32);
  *(void *)(v507 + 32) = v501;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) visibleAppLayouts];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) foregroundAppLayouts];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) activityModeForAppLayout:a2];
  return NSStringFromFBSSceneActivityMode();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x1E4F29238];
  [*(id *)(a1 + 32) frameForIndex:a2];
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  v7 = [v2 valueWithBytes:v10 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v8 = [v7 description];

  return v8;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v2 = NSNumber;
  [*(id *)(a1 + 32) scaleForIndex:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

NSString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_6(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) anchorPointForIndex:a2];
  return NSStringFromCGPoint(*(CGPoint *)&v2);
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_7(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) shouldPinLayoutRolesToSpace:a2];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) shouldUseAnchorPointToPinLayoutRolesToSpace:a2];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_9(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) clipsToUnobscuredMarginAtIndex:a2];
  return NSStringFromBOOL();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) visibleMarginForItemContainerAtIndex:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) wallpaperOverlayAlphaForIndex:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) lighteningAlphaForIndex:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "headerStyleForIndex:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) titleOpacityForIndex:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_15(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) isContentStatusBarVisibleForIndex:a2];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_16(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) shouldUseBrightMaterialForIndex:a2];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) cornerRadiiForIndex:a2];
  return MEMORY[0x1F415C608](v2);
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) maskedCornersForIndex:a2];
  return MEMORY[0x1F415C600](v2);
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isIndexRubberbandableForSwipeToKill:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) minimumTranslationToKillIndex:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_21(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) backgroundOpacityForIndex:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_22(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) clipsToBoundsAtIndex:a2];
  return NSStringFromBOOL();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_23(uint64_t a1, void *a2)
{
  long long v6 = 0u;
  long long v7 = 0u;
  [a2 getReturnValue:&v6];
  v5[0] = v6;
  v5[1] = v7;
  uint64_t v2 = [MEMORY[0x1E4F29238] valueWithBytes:v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_24(uint64_t a1, void *a2)
{
  long long v6 = 0u;
  long long v7 = 0u;
  [a2 getReturnValue:&v6];
  v5[0] = v6;
  v5[1] = v7;
  uint64_t v2 = [MEMORY[0x1E4F29238] valueWithBytes:v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_25(uint64_t a1, void *a2)
{
  double v5 = 0.0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithDouble:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_26(uint64_t a1, void *a2)
{
  double v5 = 0.0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithDouble:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_27(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_28(uint64_t a1, void *a2)
{
  double v5 = 0.0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithDouble:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v4 = 0;
  [a2 getReturnValue:&v4];
  uint64_t v2 = SBStringForBlurTargetPreference(v4);
  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_30(uint64_t a1, void *a2)
{
  double v5 = 0.0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithDouble:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_31(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_32(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_33(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_34(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_35(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithInteger:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_38(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_39(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_40(uint64_t a1, void *a2)
{
  double v5 = 0.0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithDouble:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_41(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_42(uint64_t a1, void *a2)
{
  long long v6 = 0u;
  long long v7 = 0u;
  [a2 getReturnValue:&v6];
  v5[0] = v6;
  v5[1] = v7;
  uint64_t v2 = [MEMORY[0x1E4F29238] valueWithBytes:v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_43(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) animationAttributesForLayoutElement:a2];
  uint64_t v3 = objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F29238];
  [*(id *)(a1 + 32) frameForIconOverlayInAppLayout:a2];
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  long long v7 = [v2 valueWithBytes:v10 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v8 = [v7 description];

  return v8;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_45(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isFocusEnabledForAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "multipleWindowsIndicatorLayoutRoleMaskForAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_47(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "preferredSnapshotOrientationForAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "wantsSceneResizesHostedContextForAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_49(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "canSelectLeafWithModifierKeysInAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_50(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "shouldAllowGroupOpacityForAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_51(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) asyncRenderingAttributesForAppLayout:a2];
  return SBStringForSwitcherAsyncRenderingAttributes();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_52(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) contentViewScale];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_53(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) homeScreenAlpha];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_54(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) homeScreenBackdropBlurProgress];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_55(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) homeScreenScale];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_56(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) wallpaperScale];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_57(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) homeScreenDimmingAlpha];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_58(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) containerStatusBarAnimationDuration];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_59(uint64_t a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hiddenContainerStatusBarParts"));
  uint64_t v2 = [v1 description];

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_60(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) dockProgress];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_61(uint64_t a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "dockWindowLevelPriority"));
  uint64_t v2 = [v1 description];

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_62(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) dockWindowLevel];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_63(uint64_t a1)
{
  v1 = NSNumber;
  [*(id *)(a1 + 32) shelfBackgroundBlurOpacity];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_64(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F29238];
  [*(id *)(a1 + 32) shelfBackgroundBlurFrame];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  uint64_t v6 = [v1 valueWithBytes:v9 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  long long v7 = [v6 description];

  return v7;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_65(uint64_t a1)
{
  [*(id *)(a1 + 32) wantsSlideOverTongue];
  return NSStringFromBOOL();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_66(uint64_t a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "slideOverTongueState"));
  uint64_t v2 = [v1 description];

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_67(uint64_t a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "slideOverTongueDirection"));
  uint64_t v2 = [v1 description];

  return v2;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_68(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) appLayoutToAttachSlideOverTongue];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_69(uint64_t a1)
{
  [*(id *)(a1 + 32) isScrollEnabled];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_70(uint64_t a1)
{
  [*(id *)(a1 + 32) shouldScrollViewBlockTouches];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_71(uint64_t a1)
{
  [*(id *)(a1 + 32) isContainerStatusBarVisible];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_72(uint64_t a1)
{
  [*(id *)(a1 + 32) isWallpaperRequiredForSwitcher];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_73(uint64_t a1)
{
  [*(id *)(a1 + 32) isHomeScreenContentRequired];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_74(uint64_t a1)
{
  [*(id *)(a1 + 32) isSwitcherWindowVisible];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_75(uint64_t a1)
{
  [*(id *)(a1 + 32) isSwitcherWindowUserInteractionEnabled];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_76(uint64_t a1)
{
  [*(id *)(a1 + 32) shouldAcceleratedHomeButtonPressBegin];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_77(uint64_t a1)
{
  [*(id *)(a1 + 32) shouldFireTransitionCompletionInDefaultRunLoopMode];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_78(uint64_t a1)
{
  [*(id *)(a1 + 32) wantsDockBehaviorAssertion];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_79(uint64_t a1)
{
  [*(id *)(a1 + 32) wantsDockWindowLevelAssertion];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_80(uint64_t a1)
{
  [*(id *)(a1 + 32) wantsAsynchronousSurfaceRetentionAssertion];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_81(uint64_t a1)
{
  [*(id *)(a1 + 32) isItemContainerPointerInteractionEnabled];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_82(uint64_t a1)
{
  [*(id *)(a1 + 32) shouldRubberbandFullScreenHomeGrabberView];
  return NSStringFromBOOL();
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_83(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) wallpaperStyle];
  return SBStringForSwitcherWallpaperStyle(v1);
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_84(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) homeScreenBackdropBlurType];
  return SBStringForSwitcherHomeScreenBackdropBlurType(v1);
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_85(uint64_t a1)
{
  [*(id *)(a1 + 32) dockUpdateMode];
  return SBStringFromAnimationUpdateMode();
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_86(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appLayoutToScrollToBeforeTransitioning];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_87(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appLayoutToScrollToBeforeReopeningClosedWindows];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_88(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) topMostLayoutElements];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_89(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appLayoutsToCacheSnapshots];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_90(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appLayoutsToCacheFullsizeSnapshots];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_91(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appLayoutsToResignActive];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_92(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) keyboardSuppressionMode];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_93(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) keyboardFocusedAppLayout];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_94(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) leafAppLayoutForKeyboardFocusedScene];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_95(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) shelfFocusedDisplayItems];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_96(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) activeLeafAppLayoutsReachableByKeyboardShortcut];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_97(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) inactiveAppLayoutsReachableByKeyboardShortcut];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isHomeAffordanceSupportedForAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_99(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) visibleHomeAffordanceLayoutElements];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_100(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "shouldAccessoryDrawShadowForAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_101(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isResizeGrabberVisibleForAppLayout:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_102(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) visibleShelves];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_103(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) containerLeafAppLayoutForShelf:a2];
  uint64_t v3 = objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_104(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F29238];
  [*(id *)(a1 + 32) frameForShelf:a2];
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  long long v7 = [v2 valueWithBytes:v10 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v8 = [v7 description];

  return v8;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_105(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 presentationAttributesForShelf:a2];
  }
  else
  {
    uint64_t v6 = 0;
    memset(v5, 0, sizeof(v5));
  }
  uint64_t v3 = SBStringForSwitcherShelfPresentationAttributes((uint64_t)v5);
  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_106(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) focusedAppLayoutForShelf:a2];
  uint64_t v3 = objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_107(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) ignoredDisplayItemsForShelf:a2];
  uint64_t v3 = objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_108(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) hiddenAppLayoutsInShelf:a2];
  uint64_t v3 = objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");

  return v3;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_109(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) animatablePropertyIdentifiers];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_110(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appExposeAccessoryButtonsBundleIdentifier];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_111(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  [*(id *)(a1 + 32) plusButtonAlpha];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_112(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  [*(id *)(a1 + 32) reopenClosedWindowsButtonAlpha];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_113(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  [*(id *)(a1 + 32) reopenClosedWindowsButtonScale];
  uint64_t v2 = objc_msgSend(v1, "numberWithDouble:");
  uint64_t v3 = [v2 description];

  return v3;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_114(uint64_t a1)
{
  [*(id *)(a1 + 32) appExposeAccessoryButtonsOverrideUserInterfaceStyle];
  return SBFStringForUIUserInterfaceStyle();
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_115(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) plusButtonStyle];
  return SBStringFromSwitcherPlusButtonStyle(v1);
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_116(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) perspectiveAngleForAppLayout:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_117(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "wantsContinuousExposeHoverGesture"));
  uint64_t v2 = [v1 description];

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_118(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isContinuousExposeStripVisible"));
  uint64_t v2 = [v1 description];

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_119(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "wantsContinuousExposeHoverGesture"));
  uint64_t v2 = [v1 description];

  return v2;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_120(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) continuousExposeStripTongueAttributes];
  return SBSwitcherContinuousExposeStripTongueAttributesDescription(v1, v2);
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_121(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appLayouts];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_122(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "appLayoutsGenerationCount"));
  uint64_t v2 = [v1 description];

  return v2;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_123(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) continuousExposeIdentifiersInStrip];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_124(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) continuousExposeIdentifiersInSwitcher];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_125(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F29238];
  [*(id *)(a1 + 32) containerViewBounds];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  uint64_t v6 = [v1 valueWithBytes:v9 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  long long v7 = [v6 description];

  return v7;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_126(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F29238];
  [*(id *)(a1 + 32) switcherViewBounds];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  uint64_t v6 = [v1 valueWithBytes:v9 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  long long v7 = [v6 description];

  return v7;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_127(uint64_t a1)
{
  [*(id *)(a1 + 32) isDevicePad];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_128(uint64_t a1)
{
  [*(id *)(a1 + 32) hasHomeButton];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_129(uint64_t a1)
{
  [*(id *)(a1 + 32) isChamoisWindowingUIEnabled];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_130(uint64_t a1)
{
  [*(id *)(a1 + 32) isReduceMotionEnabled];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_131(uint64_t a1)
{
  [*(id *)(a1 + 32) isRTLEnabled];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_132(uint64_t a1)
{
  [*(id *)(a1 + 32) isFloatingDockSupported];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_133(uint64_t a1)
{
  [*(id *)(a1 + 32) isStudyLogEnabled];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_134(uint64_t a1)
{
  [*(id *)(a1 + 32) isMedusaCapable];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_135(uint64_t a1)
{
  [*(id *)(a1 + 32) isSplitViewSupported];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_136(uint64_t a1)
{
  [*(id *)(a1 + 32) isInMedusaCapableSpace];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_137(uint64_t a1)
{
  [*(id *)(a1 + 32) prefersStripHidden];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_138(uint64_t a1)
{
  [*(id *)(a1 + 32) prefersDockHidden];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_139(uint64_t a1)
{
  [*(id *)(a1 + 32) isSoftwareKeyboardVisible];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_140(uint64_t a1)
{
  [*(id *)(a1 + 32) isDisplayEmbedded];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_141(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appLayoutContainsOnlyResizableApps:a2];
  return NSStringFromBOOL();
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_142(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appLayoutContainsAnUnoccludedMaximizedDisplayItem:a2];
  return NSStringFromBOOL();
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_143(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F29238];
  [*(id *)(a1 + 32) homeScreenIconFrameForAppLayout:a2];
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  long long v7 = [v2 valueWithBytes:v10 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v8 = [v7 description];

  return v8;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_144(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) homeScreenIconScaleForAppLayout:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_145(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  [*(id *)(a1 + 32) homeScreenIconCornerRadiusForAppLayout:a2];
  uint64_t v3 = objc_msgSend(v2, "numberWithDouble:");
  uint64_t v4 = [v3 description];

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_146(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) homeScreenIconLocationForAppLayout:a2];
  objc_msgSend(v2, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = @"nil";
  }
  uint64_t v5 = v3;

  return v5;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_147(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) homeScreenIconGridSizeClassForAppLayout:a2];
  uint64_t v3 = SBHStringForIconGridSizeClass();

  return v3;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_148(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "itemContainerForAppLayoutOverlapsFloatingDock:", a2));
  uint64_t v3 = [v2 description];

  return v3;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_149(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) keyboardFocusedAppLayout];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_150(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) leafAppLayoutForKeyboardFocusedScene];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_151(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) shelfFocusedDisplayItems];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

uint64_t __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_152(uint64_t a1)
{
  [*(id *)(a1 + 32) userInterfaceStyle];
  return SBFStringForUIUserInterfaceStyle();
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_153(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) draggingAppLayoutsForWindowDrag];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

__CFString *__54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_154(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) proposedAppLayoutsForWindowDrag];
  objc_msgSend(v1, "sb_switcherModifierDebugTimelineDescription");
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"nil";
  }
  uint64_t v4 = v2;

  return v4;
}

id __54__SBSwitcherModifierQuerySnapshot__buildFromModifier___block_invoke_155(uint64_t a1, void *a2)
{
  unsigned __int8 v5 = 0;
  [a2 getReturnValue:&v5];
  uint64_t v2 = [NSNumber numberWithBool:v5];
  uint64_t v3 = [v2 description];

  return v3;
}

- (NSArray)implementingQueryMethods
{
  return self->_implementingQueryMethods;
}

- (NSArray)nonImplementingQueryMethods
{
  return self->_nonImplementingQueryMethods;
}

- (NSDictionary)queryMethodsToDescriptions
{
  return self->_queryMethodsToDescriptions;
}

- (NSArray)contextMethods
{
  return self->_contextMethods;
}

- (NSDictionary)contextMethodsToDescriptions
{
  return self->_contextMethodsToDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMethodsToDescriptions, 0);
  objc_storeStrong((id *)&self->_contextMethods, 0);
  objc_storeStrong((id *)&self->_queryMethodsToDescriptions, 0);
  objc_storeStrong((id *)&self->_nonImplementingQueryMethods, 0);
  objc_storeStrong((id *)&self->_implementingQueryMethods, 0);
}

@end