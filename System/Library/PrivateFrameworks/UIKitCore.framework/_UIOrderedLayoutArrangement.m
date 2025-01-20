@interface _UIOrderedLayoutArrangement
+ (Class)_configurationHistoryClass;
- (BOOL)_canvasConnectionConstraintsNeedUpdatePass;
- (BOOL)_configurationRequiresCanvasConnectionFittingConstraint;
- (BOOL)_customSpacingChanged;
- (BOOL)_hasStaleConfiguration;
- (BOOL)_hasStaleSpacing;
- (BOOL)_itemCountChanged;
- (BOOL)_itemFittingSizeChanged;
- (BOOL)_itemOrderingChanged;
- (BOOL)_monitorsSystemLayoutFittingSizeForItem:(id)a3;
- (BOOL)_wantsProportionalDistribution;
- (BOOL)isBaselineRelativeArrangement;
- (NSMapTable)customSpacings;
- (NSString)description;
- (double)_calculatedIntrinsicHeight;
- (double)_constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:(unint64_t)a3;
- (double)_expectedEdgeToEdgeSpacingForPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6;
- (double)customSpacingAfterItem:(id)a3;
- (double)spacing;
- (id)_baselineViewVendTallest:(BOOL)a3 forFirstBaseline:(BOOL)a4;
- (id)_dimensionRefItemFromConstraint:(id)a3;
- (id)_edgeToEdgeConstraintForGapBetweenPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6;
- (id)_firstVisibleItem;
- (id)_identifierForSpanningLayoutGuide;
- (id)_lastVisibleItem;
- (id)_preparedFaultyCompatibleMultilineTextWidthDisambiguationConstraintForItem:(id)a3;
- (id)_preparedImprovedMultilineTextWidthDisambiguationConstraintForItem:(id)a3 numberOfVisibleMultilineItems:(unint64_t)a4;
- (id)_setUpSpacingOrCenteringGuideForGapIndex:(unint64_t)a3;
- (id)_tallestItem;
- (id)_visibleItemAtEndWithEnumerationOptions:(unint64_t)a3;
- (int64_t)_maxAttributeForGapConstraintRespectingBaselineRelative:(BOOL)a3;
- (int64_t)_minAttributeForGapConstraint;
- (int64_t)_minAttributeForGapConstraintRespectingBaselineRelative:(BOOL)a3;
- (int64_t)_precedingLocationAttributeForGuideConstraint;
- (int64_t)distribution;
- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3;
- (void)_activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6 isHidden:(BOOL)a7;
- (void)_activateAndInsertEdgeToEdgeConstraintForGapBetweenSpanningLayoutGuide:(id)a3 hiddenItem:(id)a4;
- (void)_adjustConstraintConstantsIfPossible;
- (void)_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:(id)a3 atIndex:(unint64_t)a4 processAdjacentHiddenItems:(BOOL)a5;
- (void)_cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:(id)a3 atIndex:(unint64_t)a4 processPrecedingVisibleItem:(BOOL)a5;
- (void)_cleanUpGuideAtGapFollowingItem:(id)a3;
- (void)_cleanUpGuides;
- (void)_cleanUpWithoutResettingKeepAliveWorkaround;
- (void)_clearAllConstraintsArrays;
- (void)_didEvaluateMultilineHeightForView:(id)a3;
- (void)_insertIndividualGuidesAndConstraintsAsNecessary;
- (void)_intrinsicContentSizeInvalidatedForItem:(id)a3;
- (void)_notifyCanvasesBaselineParametersDidChange;
- (void)_removeGuideAndConstraintGroupsAsNecessary;
- (void)_removeIndividualGuidesAndConstraintsAsNecessary;
- (void)_setItemFittingSizeChanged:(BOOL)a3;
- (void)_setItemOrderingChanged:(BOOL)a3;
- (void)_setUpDimensionConstraintForItem:(id)a3 referenceItem:(id)a4 atIndex:(unint64_t)a5;
- (void)_setUpHidingDimensionConstraintForItem:(id)a3;
- (void)_setUpMultilineTextWidthDisambiguationConstraintForItem:(id)a3 numberOfVisibleMultilineItems:(unint64_t)a4;
- (void)_systemLayoutFittingSizeDidChangeForItem:(id)a3;
- (void)_trackChangesAffectingExternalBaselineConstraints:(id)a3;
- (void)_updateArrangementConstraints;
- (void)_updateConfigurationHistory;
- (void)_visibilityParameterChangedForItem:(id)a3;
- (void)dealloc;
- (void)insertItem:(id)a3 atIndex:(unint64_t)a4;
- (void)removeItem:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setBaselineRelativeArrangement:(BOOL)a3;
- (void)setCustomSpacing:(double)a3 afterItem:(id)a4;
- (void)setDistribution:(int64_t)a3;
- (void)setLayoutFillsCanvas:(BOOL)a3;
- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3;
- (void)setSpacing:(double)a3;
@end

@implementation _UIOrderedLayoutArrangement

- (void)_removeGuideAndConstraintGroupsAsNecessary
{
  id v24 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  v3 = [(_UIOrderedLayoutArrangement *)self _orderedConfigurationHistory];
  uint64_t v4 = [v3 distribution];
  if ([v3 hasEstablishedOrderingValues])
  {
    uint64_t v5 = [v24 distribution];
    BOOL v6 = v4 != v5;
    BOOL v7 = (unint64_t)(v4 - 3) < 2;
    if ((unint64_t)(v4 - 3) <= 1 && v4 != v5)
    {
      [(_UIOrderedLayoutArrangement *)self _cleanUpGuides];
      BOOL v7 = 1;
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = (unint64_t)(v4 - 3) < 2;
  }
  unint64_t v8 = [v24 distribution] - 3;
  if (v7 != v8 < 2)
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  }
  if ([v24 _itemOrderingChanged])
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  }
  int v9 = [v3 layoutUsesCanvasMarginsWhenFilling];
  int v10 = v9 ^ [v24 layoutUsesCanvasMarginsWhenFilling];
  if ([(NSMapTable *)self->_relatedDimensionConstraints count])
  {
    if (v6
      || (([v3 proportionalFillDenominator], v11 != self->_proportionalFillDenominator)
        ? (int v12 = 1)
        : (int v12 = v10),
          v12 == 1))
    {
      _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
    }
  }
  NSUInteger v13 = [(NSMapTable *)self->_relatedDimensionConstraints count];
  if (v8 >= 2 && v13 && [v24 distribution] != 2)
  {
    v14 = [(NSMapTable *)self->_relatedDimensionConstraints objectEnumerator];
    v15 = [v14 nextObject];
    v16 = [(_UIOrderedLayoutArrangement *)self _dimensionRefItemFromConstraint:v15];

    if (![(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v16]
      || ([(_UILayoutArrangement *)self _outgoingItems],
          v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v17 containsObject:v16],
          v17,
          v18))
    {
      _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
    }
  }
  if (![(_UILayoutArrangement *)self axis])
  {
    if ((v10 & 1) != 0 || v6 && (unint64_t)([v24 distribution] - 3) > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_34;
    }
    v19 = [(_UILayoutArrangement *)self _newlyHiddenItems];
    if ([v19 count]) {
      goto LABEL_33;
    }
    v20 = [(_UILayoutArrangement *)self _newlyUnhiddenItems];
    if ([v20 count])
    {
LABEL_32:

LABEL_33:
LABEL_34:
      _UILACleanUpConstraintsMapTable(self->_multilineTextWidthDisambiguationConstraints);
      goto LABEL_35;
    }
    v21 = [(_UILayoutArrangement *)self _incomingItems];
    if ([v21 count])
    {

      goto LABEL_32;
    }
    v22 = [(_UILayoutArrangement *)self _outgoingItems];
    uint64_t v23 = [v22 count];

    if (v23) {
      goto LABEL_34;
    }
  }
LABEL_35:
}

- (BOOL)_hasStaleSpacing
{
  v3 = [(_UIOrderedLayoutArrangement *)self _orderedConfigurationHistory];
  uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  [v3 spacing];
  double v6 = v5;
  [v4 spacing];
  if (v6 == v7)
  {
    unint64_t v8 = [v4 _newlyHiddenItems];
    if ([v8 count])
    {
    }
    else
    {
      int v9 = [v4 _newlyUnhiddenItems];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        BOOL v11 = [(_UIOrderedLayoutArrangement *)self _customSpacingChanged];
        goto LABEL_6;
      }
    }
  }
  BOOL v11 = 1;
LABEL_6:

  return v11;
}

- (void)_updateArrangementConstraints
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)_UIOrderedLayoutArrangement;
  [(_UILayoutArrangement *)&v57 _updateArrangementConstraints];
  v3 = [(_UIOrderedLayoutArrangement *)self _orderedConfigurationHistory];
  [v3 setInOrderedArrangementUpdateSection:1];
  uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  if ([(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems count]
    && ![(NSMapTable *)self->_edgeToEdgeConstraintsForVisibleItems count])
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  }
  if ([v4 _itemOrderingChanged])
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  }
  double v5 = [v4 _newlyUnhiddenItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = [(_UILayoutArrangement *)self _hiddenItems];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      int v9 = [v4 _newlyUnhiddenItems];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v54 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            _UILACleanUpConstraintForItemInCollection(v14, self->_hidingDimensionConstraints);
            [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:v14 atIndex:0x7FFFFFFFFFFFFFFFLL processAdjacentHiddenItems:1];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v11);
      }
    }
    else
    {
      _UILACleanUpConstraintsMapTable(self->_hidingDimensionConstraints);
      _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
    }
  }
  if ([v4 distribution] != 2) {
    self->_proportionalFillDenominator = 0.0;
  }
  if ([v4 distribution] == 2)
  {
    if (([v4 _itemFittingSizeChanged] & 1) != 0
      || [(_UIOrderedLayoutArrangement *)self _itemCountChanged]
      || [v3 distribution] != 2
      || (uint64_t v15 = [v4 axis], v15 != objc_msgSend(v3, "axis")))
    {
      self->_proportionalFillDenominator = 0.0;
      v16 = [(_UILayoutArrangement *)self _mutableItems];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v50 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            if ([(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v21])
            {
              objc_msgSend(v21, "_proportionalFillLengthForOrderedArrangement:relevantParentAxis:", self, -[_UILayoutArrangement axis](self, "axis"));
              if (v22 > 0.0) {
                self->_proportionalFillDenominator = v22 + self->_proportionalFillDenominator;
              }
              [v4 spacing];
              self->_proportionalFillDenominator = v23 + self->_proportionalFillDenominator;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v18);
      }
      [v4 spacing];
      self->_proportionalFillDenominator = self->_proportionalFillDenominator - v24;
    }
  }
  if ([(_UIOrderedLayoutArrangement *)self _hasStaleConfiguration])
  {
    uint64_t v25 = [v3 axis];
    if (v25 == [(_UILayoutArrangement *)self axis])
    {
      [(_UIOrderedLayoutArrangement *)self _removeGuideAndConstraintGroupsAsNecessary];
      [(_UIOrderedLayoutArrangement *)self _removeIndividualGuidesAndConstraintsAsNecessary];
    }
    else
    {
      [(_UIOrderedLayoutArrangement *)self _cleanUpWithoutResettingKeepAliveWorkaround];
    }
    [(_UIOrderedLayoutArrangement *)self _adjustConstraintConstantsIfPossible];
    [(_UIOrderedLayoutArrangement *)self _insertIndividualGuidesAndConstraintsAsNecessary];
    v26 = [(_UILayoutArrangement *)self canvas];
    int v27 = objc_msgSend(v26, "_ola_shouldUseImprovedMultilineTextDisambiguation");

    if (!v27) {
      goto LABEL_61;
    }
    unint64_t v28 = [(NSMapTable *)self->_multilineTextWidthDisambiguationConstraints count];
    if (v28 < 2) {
      goto LABEL_61;
    }
    unint64_t v29 = v28;
    if (25.0 / (double)v28 <= 1.0) {
      double v30 = 25.0 / (double)v28;
    }
    else {
      double v30 = 1.0;
    }
    double v31 = *MEMORY[0x1E4F5B220];
    if (v30 == 0.0)
    {
      if (v31 > 0.0)
      {
LABEL_47:
        v32 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &_adjustMultilineTextDisambiguationConstraintPrioritiesAndActivate___s_category)+ 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = v32;
          v34 = [(_UILayoutArrangement *)self canvas];
          *(_DWORD *)buf = 134218242;
          unint64_t v61 = v29;
          __int16 v62 = 2112;
          v63 = v34;
          _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "Too many side-by-side multiline views (%lu) for optional width disambiguation. Making required constraints instead. Layout might be broken. Stack view: %@", buf, 0x16u);
        }
        float v35 = 1000.0;
        goto LABEL_52;
      }
    }
    else if (v30 < v31)
    {
      goto LABEL_47;
    }
    float v35 = 950.0;
LABEL_52:
    v36 = [(_UILayoutArrangement *)self _mutableItems];
    if ([v36 count])
    {
      unint64_t v37 = 0;
      do
      {
        multilineTextWidthDisambiguationConstraints = self->_multilineTextWidthDisambiguationConstraints;
        v39 = [v36 objectAtIndexedSubscript:v37];
        v40 = [(NSMapTable *)multilineTextWidthDisambiguationConstraints objectForKey:v39];

        if (v40)
        {
          [v40 priority];
          if (v41 == v35)
          {
            double v42 = v35;
          }
          else
          {
            [v40 setActive:0];
            double v42 = v35;
            double v43 = fmax(v42, fmin(v42, 1000.0));
            *(float *)&double v43 = v43;
            [v40 setPriority:v43];
          }
          float v35 = v30 + v42;
          [v40 setActive:1];
        }

        ++v37;
      }
      while (v37 < [v36 count]);
    }

LABEL_61:
    v44 = [(_UILayoutArrangement *)self _incomingItems];
    if (![v44 count])
    {
      v45 = [(_UILayoutArrangement *)self _outgoingItems];
      if (![v45 count] && (objc_msgSend(v4, "_itemOrderingChanged") & 1) == 0)
      {
        v46 = [v4 _newlyHiddenItems];
        if (![v46 count])
        {
          v47 = [v4 _newlyUnhiddenItems];
          uint64_t v48 = [v47 count];

          if (!v48) {
            goto LABEL_69;
          }
          goto LABEL_68;
        }
      }
    }

LABEL_68:
    [(_UIOrderedLayoutArrangement *)self _notifyCanvasesBaselineParametersDidChange];
  }
LABEL_69:
  [(_UIOrderedLayoutArrangement *)self _updateConfigurationHistory];
  [v3 setInOrderedArrangementUpdateSection:0];
}

- (void)_updateConfigurationHistory
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIOrderedLayoutArrangement *)self _orderedConfigurationHistory];
  if ([v3 isInOrderedArrangementUpdateSection])
  {
    uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
    [v4 spacing];
    objc_msgSend(v3, "setSpacing:");
    objc_msgSend(v3, "setDistribution:", objc_msgSend(v4, "distribution"));
    [v3 setProportionalFillDenominator:self->_proportionalFillDenominator];
    [v3 setHasEstablishedOrderingValues:1];
    objc_msgSend(v3, "setBaselineRelativeArrangement:", objc_msgSend(v4, "isBaselineRelativeArrangement"));
    if (v3 != v4)
    {
      double v5 = [v3 customSpacings];
      [v5 removeAllObjects];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v6 = [v4 customSpacings];
      double v7 = [v6 keyEnumerator];

      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
            NSUInteger v13 = [v4 customSpacings];
            v14 = [v13 objectForKey:v12];
            [v14 doubleValue];
            objc_msgSend(v3, "setCustomSpacing:afterItem:", v12);

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
    }
    [v4 _setItemOrderingChanged:0];
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIOrderedLayoutArrangement;
  [(_UILayoutArrangement *)&v15 _updateConfigurationHistory];
}

- (BOOL)_customSpacingChanged
{
  v3 = [(_UIOrderedLayoutArrangement *)self _orderedConfigurationHistory];
  uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  double v5 = [v4 customSpacings];
  uint64_t v6 = [v3 customSpacings];
  double v7 = (void *)v6;
  if (v6) {
    int v8 = 0;
  }
  else {
    int v8 = v5 != 0;
  }
  if ((v5 != 0) != v8 && v6 != 0)
  {
    uint64_t v10 = [v4 customSpacings];
    uint64_t v11 = [v3 customSpacings];
    int v8 = [v10 isEqual:v11] ^ 1;
  }
  return v8;
}

- (int64_t)distribution
{
  return self->_distribution;
}

- (BOOL)_hasStaleConfiguration
{
  v9.receiver = self;
  v9.super_class = (Class)_UIOrderedLayoutArrangement;
  if ([(_UILayoutArrangement *)&v9 _hasStaleConfiguration]) {
    return 1;
  }
  uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _orderedConfigurationHistory];
  double v5 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  if (![v4 hasEstablishedOrderingValues]
    || [(_UIOrderedLayoutArrangement *)self _hasStaleSpacing]
    || ([v5 _itemOrderingChanged] & 1) != 0
    || (uint64_t v6 = [v4 distribution], v6 != objc_msgSend(v5, "distribution")))
  {
    BOOL v3 = 1;
  }
  else
  {
    [v4 proportionalFillDenominator];
    BOOL v3 = v7 != self->_proportionalFillDenominator;
  }

  return v3;
}

- (BOOL)_canvasConnectionConstraintsNeedUpdatePass
{
  v6.receiver = self;
  v6.super_class = (Class)_UIOrderedLayoutArrangement;
  if ([(_UILayoutArrangement *)&v6 _canvasConnectionConstraintsNeedUpdatePass])
  {
    return 1;
  }
  uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  char v3 = [v4 _itemOrderingChanged];

  return v3;
}

- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___UIOrderedLayoutArrangement__indexOfItemForLocationAttribute___block_invoke;
  aBlock[3] = &unk_1E52EF790;
  aBlock[4] = self;
  double v5 = (uint64_t (**)(void))_Block_copy(aBlock);
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(_UILayoutArrangement *)self axis])
  {
    if ((unint64_t)a3 > 0x10) {
      goto LABEL_13;
    }
    if (((1 << a3) & 0x9008) != 0)
    {
      v11.receiver = self;
      v11.super_class = (Class)_UIOrderedLayoutArrangement;
      id v9 = [(_UILayoutArrangement *)&v11 _indexOfItemForLocationAttribute:a3];
      goto LABEL_12;
    }
    uint64_t v7 = 1 << a3;
    uint64_t v8 = 67600;
  }
  else
  {
    if ((unint64_t)a3 > 0x12) {
      goto LABEL_13;
    }
    if (((1 << a3) & 0x22022) != 0)
    {
      v12.receiver = self;
      v12.super_class = (Class)_UIOrderedLayoutArrangement;
      id v9 = [(_UILayoutArrangement *)&v12 _indexOfItemForLocationAttribute:a3];
      goto LABEL_12;
    }
    uint64_t v7 = 1 << a3;
    uint64_t v8 = 278596;
  }
  if ((v7 & v8) != 0)
  {
    id v9 = (id)v5[2](v5);
LABEL_12:
    unint64_t v6 = (unint64_t)v9;
  }
LABEL_13:

  return v6;
}

- (void)_didEvaluateMultilineHeightForView:(id)a3
{
  id v7 = a3;
  if (![(_UILayoutArrangement *)self axis])
  {
    id v4 = [(_UILayoutArrangement *)self canvas];
    if (v4 == v7)
    {
    }
    else
    {
      double v5 = [(_UILayoutArrangement *)self _mutableItems];
      int v6 = [v5 containsObject:v7];

      if (!v6) {
        goto LABEL_7;
      }
    }
    [(_UIOrderedLayoutArrangement *)self _notifyCanvasesBaselineParametersDidChange];
  }
LABEL_7:
}

- (BOOL)_configurationRequiresCanvasConnectionFittingConstraint
{
  v2 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  BOOL v3 = (unint64_t)([v2 distribution] - 3) < 2;

  return v3;
}

+ (Class)_configurationHistoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_itemCountChanged
{
  BOOL v3 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  id v4 = [v3 _newlyHiddenItems];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    int v6 = [v3 _newlyUnhiddenItems];
    if ([v6 count])
    {
      BOOL v5 = 1;
    }
    else
    {
      id v7 = [(_UILayoutArrangement *)self _incomingItems];
      if ([v7 count])
      {
        BOOL v5 = 1;
      }
      else
      {
        uint64_t v8 = [(_UILayoutArrangement *)self _outgoingItems];
        BOOL v5 = [v8 count] != 0;
      }
    }
  }
  return v5;
}

- (BOOL)_itemOrderingChanged
{
  return self->_itemOrderingChanged;
}

- (id)_identifierForSpanningLayoutGuide
{
  return @"UISV-ordering-spanner";
}

- (void)removeItem:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42___UIOrderedLayoutArrangement_removeItem___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_UIOrderedLayoutArrangement *)self _trackChangesAffectingExternalBaselineConstraints:v6];
}

- (void)_activateAndInsertEdgeToEdgeConstraintForGapBetweenSpanningLayoutGuide:(id)a3 hiddenItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(_UIOrderedLayoutArrangement *)self _minAttributeForGapConstraintRespectingBaselineRelative:0];
  int64_t v9 = [(_UIOrderedLayoutArrangement *)self _maxAttributeForGapConstraintRespectingBaselineRelative:0];
  id v11 = [MEMORY[0x1E4F5B268] constraintWithItem:v6 attribute:v8 relatedBy:0 toItem:v7 attribute:v9 constant:0.0];

  [v11 setIdentifier:@"UISV-spacing-hidden"];
  LODWORD(v10) = 1112014848;
  [v11 setPriority:v10];
  [v11 setActive:1];
  [(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems setObject:v11 forKey:v6];
}

- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3
{
}

- (id)_baselineViewVendTallest:(BOOL)a3 forFirstBaseline:(BOOL)a4
{
  if (a3)
  {
    id v4 = [(_UIOrderedLayoutArrangement *)self _tallestItem];
  }
  else
  {
    if (a4) {
      [(_UIOrderedLayoutArrangement *)self _firstVisibleItem];
    }
    else {
    id v4 = [(_UIOrderedLayoutArrangement *)self _lastVisibleItem];
    }
  }
  return v4;
}

- (void)_removeIndividualGuidesAndConstraintsAsNecessary
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UILayoutArrangement *)self _outgoingItems];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v84 objects:v91 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v85 != v6) {
          objc_enumerationMutation(v3);
        }
        int64_t v8 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        [(_UIOrderedLayoutArrangement *)self _cleanUpGuideAtGapFollowingItem:v8];
        [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:v8 atIndex:0x7FFFFFFFFFFFFFFFLL processPrecedingVisibleItem:1];
        [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:v8 atIndex:0x7FFFFFFFFFFFFFFFLL processAdjacentHiddenItems:1];
        _UILACleanUpConstraintForItemInCollection(v8, self->_hidingDimensionConstraints);
        _UILACleanUpConstraintForItemInCollection(v8, self->_relatedDimensionConstraints);
        _UILACleanUpConstraintForItemInCollection(v8, self->_multilineTextWidthDisambiguationConstraints);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v84 objects:v91 count:16];
    }
    while (v5);
  }
  int64_t v9 = [(_UILayoutArrangement *)self _mutableItems];
  unint64_t v10 = [v9 count];
  v69 = [(_UILayoutArrangement *)self _incomingItems];
  if (v10)
  {
    id v11 = [v9 objectAtIndexedSubscript:v10 - 1];
    [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:v11 atIndex:v10 - 1 processPrecedingVisibleItem:1];

    objc_super v12 = [v9 objectAtIndexedSubscript:v10 - 1];
    [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:v12 atIndex:v10 - 1 processAdjacentHiddenItems:0];
  }
  v70 = v3;
  if (([(NSMapTable *)self->_edgeToEdgeConstraintsForVisibleItems count]
     || [(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems count]
     || [(NSMapTable *)self->_spacingOrCenteringGuides count]
     || [(NSMapTable *)self->_multilineTextWidthDisambiguationConstraints count])
    && v10)
  {
    unint64_t v13 = 0;
    while (1)
    {
      v14 = [v9 objectAtIndexedSubscript:v13];
      if ([(NSMapTable *)self->_multilineTextWidthDisambiguationConstraints count]
        && (objc_msgSend(v14, "_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged") & 1) == 0)
      {
        _UILACleanUpConstraintForItemInCollection(v14, self->_multilineTextWidthDisambiguationConstraints);
      }
      if ([(NSMapTable *)self->_edgeToEdgeConstraintsForVisibleItems count]
        || [(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems count]
        || [(NSMapTable *)self->_spacingOrCenteringGuides count])
      {
        break;
      }
LABEL_43:

      if (++v13 == v10) {
        goto LABEL_44;
      }
    }
    if (v10 >= 2 && v13 < v10 - 2)
    {
      objc_super v15 = [v9 objectAtIndexedSubscript:v13 + 1];
      int v16 = [v69 containsObject:v15];

      if (v16)
      {
        [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:v14 atIndex:v13 processPrecedingVisibleItem:0];
        [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:v14 atIndex:v13 processAdjacentHiddenItems:1];
      }
    }
    long long v17 = [(_UILayoutArrangement *)self _newlyHiddenItems];
    if ([v17 containsObject:v14])
    {
    }
    else
    {
      long long v18 = [(_UILayoutArrangement *)self _newlyUnhiddenItems];
      int v19 = [v18 containsObject:v14];

      if (!v19)
      {
LABEL_30:
        if (![(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v14])
        {
          [(_UIOrderedLayoutArrangement *)self _cleanUpGuideAtGapFollowingItem:v14];
          _UILACleanUpConstraintForItemInCollection(v14, self->_relatedDimensionConstraints);
        }
        v20 = [(NSMapTable *)self->_spacingOrCenteringGuides objectForKey:v14];
        uint64_t v21 = v20;
        if (v20)
        {
          unint64_t v22 = v13;
          if ([v20 followingItemIndex] >= v10)
          {
            [(_UIOrderedLayoutArrangement *)self _cleanUpGuideAtGapFollowingItem:v14];
          }
          else
          {
            while (++v22 < v10)
            {
              if ([(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:0])
              {
                double v23 = [v9 objectAtIndexedSubscript:v22];
                goto LABEL_39;
              }
            }
            double v23 = 0;
LABEL_39:
            double v24 = [v21 followingItem];

            if (v24 != v23)
            {
              [(_UIOrderedLayoutArrangement *)self _cleanUpGuideAtGapFollowingItem:v14];
              _UILACleanUpConstraintForItemInCollection(v14, self->_relatedDimensionConstraints);
            }
          }
        }

        BOOL v3 = v70;
        goto LABEL_43;
      }
    }
    [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:v14 atIndex:v13 processPrecedingVisibleItem:1];
    [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:v14 atIndex:v13 processAdjacentHiddenItems:1];
    goto LABEL_30;
  }
LABEL_44:
  if ((unint64_t)(self->_distribution - 3) >= 2
    && [(NSMapTable *)self->_relatedDimensionConstraints count])
  {
    uint64_t v25 = v9;
    v26 = (void *)[(NSMapTable *)self->_relatedDimensionConstraints copy];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    int v27 = [v26 allKeys];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v81 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v80 + 1) + 8 * j);
          if (![(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v32]) {
            _UILACleanUpConstraintForItemInCollection(v32, self->_relatedDimensionConstraints);
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v80 objects:v90 count:16];
      }
      while (v29);
    }

    int64_t v9 = v25;
  }
  if ([(_UIOrderedLayoutArrangement *)self _hasStaleSpacing])
  {
    v68 = v9;
    v33 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
    v34 = [(_UIOrderedLayoutArrangement *)self _orderedConfigurationHistory];
    float v35 = (void *)[(NSMapTable *)self->_edgeToEdgeConstraintsForVisibleItems copy];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v67 = v35;
    v36 = [v35 keyEnumerator];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v76 objects:v89 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v77 != v39) {
            objc_enumerationMutation(v36);
          }
          float v41 = *(void **)(*((void *)&v76 + 1) + 8 * k);
          id v42 = v34;
          [v42 customSpacingAfterItem:v41];
          if (v43 == 3.40282347e38)
          {
            [v42 spacing];
            if (v44 == 3.40282347e38) {
              double v45 = 0.0;
            }
            else {
              double v45 = v44;
            }
          }
          else
          {
            double v45 = v43;
          }

          id v46 = v33;
          [v46 customSpacingAfterItem:v41];
          if (v47 == 3.40282347e38)
          {
            [v46 spacing];
            if (v48 == 3.40282347e38) {
              double v49 = 0.0;
            }
            else {
              double v49 = v48;
            }
          }
          else
          {
            double v49 = v47;
          }

          if (v45 != v49 && (v45 == 1.17549435e-38 || v49 == 1.17549435e-38)) {
            _UILACleanUpConstraintForItemInCollection(v41, self->_edgeToEdgeConstraintsForVisibleItems);
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v76 objects:v89 count:16];
      }
      while (v38);
    }

    long long v51 = (void *)[(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems copy];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v71 = v51;
    long long v52 = [v51 keyEnumerator];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v73;
      do
      {
        for (uint64_t m = 0; m != v54; ++m)
        {
          if (*(void *)v73 != v55) {
            objc_enumerationMutation(v52);
          }
          uint64_t v57 = *(void *)(*((void *)&v72 + 1) + 8 * m);
          id v58 = v34;
          [v58 customSpacingAfterItem:v57];
          if (v59 == 3.40282347e38)
          {
            [v58 spacing];
            if (v60 == 3.40282347e38) {
              double v61 = 0.0;
            }
            else {
              double v61 = v60;
            }
          }
          else
          {
            double v61 = v59;
          }

          id v62 = v33;
          [v62 customSpacingAfterItem:v57];
          if (v63 == 3.40282347e38)
          {
            [v62 spacing];
            if (v64 == 3.40282347e38) {
              double v65 = 0.0;
            }
            else {
              double v65 = v64;
            }
          }
          else
          {
            double v65 = v63;
          }

          if (v61 != v65 && (v61 == 1.17549435e-38 || v65 == 1.17549435e-38)) {
            [(_UIOrderedLayoutArrangement *)self _cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:v57 atIndex:0x7FFFFFFFFFFFFFFFLL processAdjacentHiddenItems:1];
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v72 objects:v88 count:16];
      }
      while (v54);
    }

    BOOL v3 = v70;
    int64_t v9 = v68;
  }
}

- (void)insertItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(_UILayoutArrangement *)self _mutableItems];
  uint64_t v8 = [v7 indexOfObject:v6];
  if (v8 != a4)
  {
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL
      || ([(_UILayoutArrangement *)self _outgoingItems],
          int64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 containsObject:v6],
          v9,
          v10))
    {
      [(_UIOrderedLayoutArrangement *)self _setItemOrderingChanged:1];
      [(_UILayoutArrangement *)self _createUnanimatedConfigurationTargetIfNecessary];
      id v11 = [(_UILayoutArrangement *)self canvas];
      BOOL v12 = _UILAIsAnimatingOnCanvas(v11);

      if (v12)
      {
        [(_UILayoutArrangement *)self _registerAnimationRequest];
      }
      else
      {
        unint64_t v13 = [(_UILayoutArrangement *)self _unanimatedConfigurationTarget];
        [v13 _setItemOrderingChanged:1];
      }
      v14 = [(_UILayoutArrangement *)self canvas];
      [v14 setNeedsUpdateConstraints];
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50___UIOrderedLayoutArrangement_insertItem_atIndex___block_invoke;
  v16[3] = &unk_1E52DA070;
  long long v18 = self;
  unint64_t v19 = a4;
  id v17 = v6;
  id v15 = v6;
  [(_UIOrderedLayoutArrangement *)self _trackChangesAffectingExternalBaselineConstraints:v16];
}

- (void)_insertIndividualGuidesAndConstraintsAsNecessary
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  v118 = [(_UILayoutArrangement *)self _mutableItems];
  uint64_t v4 = [v118 count];
  unint64_t v5 = v4;
  unint64_t v101 = v4 - 1;
  if (v4) {
    unint64_t v6 = v4 - 1;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = [(_UILayoutArrangement *)self _hiddenItems];
  uint64_t v8 = [v7 count];
  int64_t v9 = [(_UILayoutArrangement *)self _newlyHiddenItems];
  uint64_t v10 = [v9 count];
  v106 = v3;
  id v11 = [v3 _newlyHiddenItems];
  unint64_t v12 = [v11 count] - v10 + v8;

  unint64_t v114 = v5;
  unint64_t v13 = v5 - v12;
  v14 = self->_hidingDimensionConstraints;
  if (v12 && !v14) {
    v14 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:v12];
  }
  hidingDimensionConstraints = self->_hidingDimensionConstraints;
  self->_hidingDimensionConstraints = v14;

  edgeToEdgeConstraintsForVisibleItems = self->_edgeToEdgeConstraintsForVisibleItems;
  BOOL v25 = v13 == 1;
  unint64_t v17 = v13 - 1;
  if (!v25 && v5 != v12)
  {
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v18 = [(NSMapTable *)edgeToEdgeConstraintsForVisibleItems objectEnumerator];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v123 objects:v127 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      unint64_t v21 = 0;
      uint64_t v22 = *(void *)v124;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v124 != v22) {
            objc_enumerationMutation(v18);
          }
          v21 += [*(id *)(*((void *)&v123 + 1) + 8 * i) isActive];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v123 objects:v127 count:16];
      }
      while (v20);
    }
    else
    {
      unint64_t v21 = 0;
    }

    double v24 = self->_edgeToEdgeConstraintsForVisibleItems;
    BOOL v113 = v21 < v17;
    BOOL v25 = v21 < v17 && v24 == 0;
    if (v25)
    {
      double v24 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:v17];
      BOOL v113 = 1;
    }
  }
  else
  {
    double v24 = edgeToEdgeConstraintsForVisibleItems;
    BOOL v113 = 0;
  }
  v26 = self->_edgeToEdgeConstraintsForVisibleItems;
  self->_edgeToEdgeConstraintsForVisibleItems = v24;

  edgeToEdgeConstraintsForHiddenItems = self->_edgeToEdgeConstraintsForHiddenItems;
  if (v12)
  {
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    uint64_t v28 = [(NSMapTable *)edgeToEdgeConstraintsForHiddenItems objectEnumerator];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v123 objects:v127 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      unint64_t v31 = 0;
      uint64_t v32 = *(void *)v124;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v124 != v32) {
            objc_enumerationMutation(v28);
          }
          v31 += [*(id *)(*((void *)&v123 + 1) + 8 * j) isActive];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v123 objects:v127 count:16];
      }
      while (v30);
    }
    else
    {
      unint64_t v31 = 0;
    }

    v34 = self->_edgeToEdgeConstraintsForHiddenItems;
    BOOL v111 = v31 < v12;
    if (v31 < v12 && v34 == 0)
    {
      v34 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:v12];
      BOOL v111 = 1;
    }
  }
  else
  {
    v34 = edgeToEdgeConstraintsForHiddenItems;
    BOOL v111 = 0;
  }
  v36 = self->_edgeToEdgeConstraintsForHiddenItems;
  self->_edgeToEdgeConstraintsForHiddenItems = v34;

  unint64_t v37 = [v106 distribution] - 3;
  spacingOrCenteringGuides = self->_spacingOrCenteringGuides;
  unint64_t v104 = v37;
  if (v37 >= 2)
  {
    v40 = spacingOrCenteringGuides;
    BOOL v109 = 0;
  }
  else
  {
    unint64_t v39 = [(NSMapTable *)spacingOrCenteringGuides count];
    v40 = self->_spacingOrCenteringGuides;
    BOOL v109 = v39 < v6;
    if (v39 < v6 && v40 == 0)
    {
      v40 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:v6];
      BOOL v109 = 1;
    }
  }
  id v42 = self->_spacingOrCenteringGuides;
  self->_spacingOrCenteringGuides = v40;

  if (v114)
  {
    if ((unint64_t)([v106 distribution] - 1) > 3)
    {
      unint64_t v110 = 0;
      id v107 = 0;
    }
    else
    {
      double v43 = [(NSMapTable *)self->_relatedDimensionConstraints objectEnumerator];
      double v44 = [v43 nextObject];
      id v107 = [(_UIOrderedLayoutArrangement *)self _dimensionRefItemFromConstraint:v44];

      if (v104 > 1)
      {
        BOOL v46 = [(_UIOrderedLayoutArrangement *)self _wantsProportionalDistribution];
        unint64_t v45 = v114;
        if (!v46) {
          unint64_t v45 = v101;
        }
      }
      else
      {
        unint64_t v45 = v114 - 2;
        if (v114 <= 1) {
          unint64_t v45 = 0;
        }
      }
      unint64_t v110 = v45;
    }
  }
  else
  {
    unint64_t v110 = 0;
    id v107 = 0;
  }
  relatedDimensionConstraints = self->_relatedDimensionConstraints;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  double v48 = [(NSMapTable *)relatedDimensionConstraints objectEnumerator];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v123 objects:v127 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    unint64_t v51 = 0;
    uint64_t v52 = *(void *)v124;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v124 != v52) {
          objc_enumerationMutation(v48);
        }
        v51 += [*(id *)(*((void *)&v123 + 1) + 8 * k) isActive];
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v123 objects:v127 count:16];
    }
    while (v50);
  }
  else
  {
    unint64_t v51 = 0;
  }

  uint64_t v54 = self->_relatedDimensionConstraints;
  if (v51 < v110 && v54 == 0) {
    uint64_t v54 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:v6];
  }
  long long v56 = self->_relatedDimensionConstraints;
  self->_relatedDimensionConstraints = v54;

  uint64_t v57 = v106;
  if ([v106 axis]) {
    BOOL v112 = 0;
  }
  else {
    BOOL v112 = (unint64_t)([v106 distribution] - 3) < 0xFFFFFFFFFFFFFFFELL;
  }
  int v58 = v113;
  if (v12) {
    int v58 = 1;
  }
  if (((v58 | v109) & 1) != 0 || (v51 >= v110 ? (BOOL v59 = !v112) : (BOOL v59 = 0), !v59))
  {
    uint64_t v62 = [(_UIOrderedLayoutArrangement *)self _firstVisibleItem];
    uint64_t v63 = [(_UIOrderedLayoutArrangement *)self _lastVisibleItem];
    double v61 = v118;
    unint64_t v105 = [v118 indexOfObject:v62];
    v115 = (void *)v62;
    unint64_t v116 = [v118 indexOfObject:v63];
    v99 = (void *)v63;
    if (v62) {
      BOOL v64 = v63 == 0;
    }
    else {
      BOOL v64 = 1;
    }
    char v65 = !v64;
    char v100 = v65;
    if (v114)
    {
      unint64_t v66 = 0;
      uint64_t v102 = 0;
      v103 = 0;
      unint64_t v108 = 0;
      id v67 = 0;
      while (1)
      {
        v68 = [v61 objectAtIndexedSubscript:v66];
        BOOL v69 = [(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v68];
        if (v113 && v69 && v67 != 0)
        {
          v71 = [(NSMapTable *)self->_edgeToEdgeConstraintsForVisibleItems objectForKey:v67];
          long long v72 = v71;
          if (v71)
          {
            if (([v71 isActive] & 1) == 0) {
              [v72 setActive:1];
            }
          }
          else
          {
            [(_UIOrderedLayoutArrangement *)self _activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:v67 followingItem:v68 isPrecededByVisibleItem:v105 < v108 isFollowedByVisibleItem:v116 > v66 isHidden:0];
          }
        }
        id v117 = v67;
        if (!v111) {
          goto LABEL_115;
        }
        if (v69) {
          break;
        }
        if (v67)
        {
          long long v83 = [(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems objectForKey:v68];
          if (!v83)
          {
            [(_UIOrderedLayoutArrangement *)self _activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:v117 followingItem:v68 isPrecededByVisibleItem:1 isFollowedByVisibleItem:v116 > v66 isHidden:1];
            goto LABEL_148;
          }
          goto LABEL_138;
        }
        if ((v100 & 1) == 0)
        {
          long long v83 = [(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems objectForKey:v68];
          if (v83) {
            goto LABEL_138;
          }
          v89 = [(_UILayoutArrangement *)self _spanningLayoutGuideCreateIfNecessary];
          [(_UIOrderedLayoutArrangement *)self _activateAndInsertEdgeToEdgeConstraintForGapBetweenSpanningLayoutGuide:v89 hiddenItem:v68];

LABEL_148:
LABEL_149:
          id v67 = v117;
        }
        if (v112 && objc_msgSend(v68, "_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged"))
        {
          v90 = [(_UILayoutArrangement *)self canvas];
          int v91 = objc_msgSend(v90, "_ola_shouldUseImprovedMultilineTextDisambiguation");

          if (v91)
          {
            id v92 = v103;
            if (!v103) {
              id v92 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            }
            v103 = v92;
            [v92 addIndex:v66];
            v102 += objc_msgSend(v68, "_la_isVisible");
          }
          else
          {
            [(_UIOrderedLayoutArrangement *)self _setUpMultilineTextWidthDisambiguationConstraintForItem:v68 numberOfVisibleMultilineItems:0x7FFFFFFFFFFFFFFFLL];
          }
          double v61 = v118;
        }
        if (v69)
        {
          v93 = v67;
          id v67 = v68;
          unint64_t v108 = v66;
LABEL_167:

          goto LABEL_168;
        }
        v94 = [(NSMapTable *)self->_hidingDimensionConstraints objectForKey:v68];

        if (!v94)
        {
          v95 = [(NSMapTable *)self->_hidingDimensionConstraints objectForKey:v68];
          v93 = v95;
          if (v95)
          {
            if (([v95 isActive] & 1) == 0) {
              [v93 setActive:1];
            }
          }
          else
          {
            [(_UIOrderedLayoutArrangement *)self _setUpHidingDimensionConstraintForItem:v68];
          }
          double v61 = v118;
          goto LABEL_167;
        }
        double v61 = v118;
LABEL_168:

        if (++v66 == v114) {
          goto LABEL_171;
        }
      }
      if (v66 && v68 == v115 && v105)
      {
        for (uint64_t m = 0; m != v66; ++m)
        {
          long long v74 = self->_edgeToEdgeConstraintsForHiddenItems;
          [v61 objectAtIndexedSubscript:m];
          v76 = long long v75 = v61;
          long long v77 = [(NSMapTable *)v74 objectForKey:v76];

          if (v77)
          {
            if (([v77 isActive] & 1) == 0) {
              [v77 setActive:1];
            }
          }
          else
          {
            long long v78 = [v75 objectAtIndexedSubscript:m];
            [(_UIOrderedLayoutArrangement *)self _activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:v78 followingItem:v115 isPrecededByVisibleItem:0 isFollowedByVisibleItem:v116 > v66 isHidden:1];
          }
          double v61 = v118;
        }
      }
LABEL_115:
      if (v109 && v69)
      {
        long long v79 = [(NSMapTable *)self->_spacingOrCenteringGuides objectForKey:v68];

        if (!v79) {
          id v80 = [(_UIOrderedLayoutArrangement *)self _setUpSpacingOrCenteringGuideForGapIndex:v66];
        }
      }
      if (v51 >= v110 || !v69) {
        goto LABEL_149;
      }
      uint64_t v82 = [(NSMapTable *)self->_relatedDimensionConstraints objectForKey:v68];
      if (v82)
      {
        long long v83 = (void *)v82;
LABEL_138:
        if (([v83 isActive] & 1) == 0) {
          [v83 setActive:1];
        }
        goto LABEL_148;
      }
      uint64_t v84 = (uint64_t)v107;
      if (!v107)
      {
        if (v104 > 1)
        {
          if (![(_UIOrderedLayoutArrangement *)self _wantsProportionalDistribution])
          {
            id v107 = v68;
            goto LABEL_147;
          }
          uint64_t v84 = [(_UILayoutArrangement *)self canvas];
LABEL_142:
          long long v83 = 0;
          id v107 = (id)v84;
          if (v104 < 2 || (void *)v84 == v68) {
            goto LABEL_148;
          }
          [(_UIOrderedLayoutArrangement *)self _setUpDimensionConstraintForItem:v68 referenceItem:v84 atIndex:v66];
LABEL_147:
          long long v83 = 0;
          goto LABEL_148;
        }
        long long v85 = [(NSMapTable *)self->_spacingOrCenteringGuides objectEnumerator];
        uint64_t v86 = [v85 nextObject];

        uint64_t v84 = v86;
        double v61 = v118;
      }
      if (v104 <= 1 && v66 < v101)
      {
        id v107 = (id)v84;
        uint64_t v87 = [(NSMapTable *)self->_spacingOrCenteringGuides objectForKey:v68];
        v88 = (void *)v87;
        if (v87 && v107 != (id)v87) {
          [(_UIOrderedLayoutArrangement *)self _setUpDimensionConstraintForItem:v87 referenceItem:v107 atIndex:v66];
        }

        goto LABEL_147;
      }
      goto LABEL_142;
    }
    id v67 = 0;
    uint64_t v102 = 0;
    v103 = 0;
LABEL_171:
    v96 = [(_UILayoutArrangement *)self canvas];
    if (objc_msgSend(v96, "_ola_shouldUseImprovedMultilineTextDisambiguation"))
    {
      v97 = v103;
      unint64_t v98 = [v103 count];

      if (v98 < 2)
      {
LABEL_175:

        uint64_t v57 = v106;
        double v60 = v107;
        goto LABEL_176;
      }
      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __79___UIOrderedLayoutArrangement__insertIndividualGuidesAndConstraintsAsNecessary__block_invoke;
      v119[3] = &unk_1E52E34A0;
      id v120 = v61;
      v121 = self;
      uint64_t v122 = v102;
      [v103 enumerateIndexesUsingBlock:v119];
      v96 = v120;
    }

    v97 = v103;
    goto LABEL_175;
  }
  double v60 = v107;
  double v61 = v118;
LABEL_176:
}

- (id)_visibleItemAtEndWithEnumerationOptions:(unint64_t)a3
{
  unint64_t v5 = [(_UILayoutArrangement *)self _mutableItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71___UIOrderedLayoutArrangement__visibleItemAtEndWithEnumerationOptions___block_invoke;
  v9[3] = &unk_1E52EB3A8;
  v9[4] = self;
  uint64_t v6 = [v5 indexOfObjectWithOptions:a3 passingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndex:v6];
  }

  return v7;
}

- (void)_trackChangesAffectingExternalBaselineConstraints:(id)a3
{
  uint64_t v10 = (void (**)(void))a3;
  if ([(_UILayoutArrangement *)self axis] == 1)
  {
    uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _firstVisibleItem];
    unint64_t v5 = [(_UIOrderedLayoutArrangement *)self _lastVisibleItem];
    v10[2]();
    uint64_t v6 = [(_UIOrderedLayoutArrangement *)self _firstVisibleItem];

    if (v4 != v6)
    {
      id v7 = [(_UILayoutArrangement *)self canvas];
      [v7 _vendedBaselineViewDidMoveForFirst:1];
    }
    uint64_t v8 = [(_UIOrderedLayoutArrangement *)self _lastVisibleItem];

    if (v5 != v8)
    {
      int64_t v9 = [(_UILayoutArrangement *)self canvas];
      [v9 _vendedBaselineViewDidMoveForFirst:0];
    }
  }
  else
  {
    v10[2]();
    unint64_t v5 = 0;
    uint64_t v4 = 0;
  }
}

- (id)_lastVisibleItem
{
  return [(_UIOrderedLayoutArrangement *)self _visibleItemAtEndWithEnumerationOptions:2];
}

- (id)_firstVisibleItem
{
  return [(_UIOrderedLayoutArrangement *)self _visibleItemAtEndWithEnumerationOptions:0];
}

- (void)_notifyCanvasesBaselineParametersDidChange
{
  id v4 = [(_UILayoutArrangement *)self canvas];
  v2 = v4;
  if ([v4 _hasLayoutArrangements])
  {
    BOOL v3 = v4;
    do
    {
      [v3 _vendedBaselineViewParametersDidChange];
      v2 = [v3 superview];

      BOOL v3 = v2;
    }
    while (([v2 _hasLayoutArrangements] & 1) != 0);
  }
}

- (void)_activateAndInsertEdgeToEdgeConstraintForGapBetweenPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6 isHidden:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v17 = a3;
  id v12 = a4;
  unint64_t v13 = [(_UIOrderedLayoutArrangement *)self _edgeToEdgeConstraintForGapBetweenPrecedingItem:v17 followingItem:v12 isPrecededByVisibleItem:v9 isFollowedByVisibleItem:v8];
  v14 = v13;
  LODWORD(v15) = 1148846080;
  if (v7) {
    *(float *)&double v15 = 50.0;
  }
  [v13 setPriority:v15];
  if (v7)
  {
    if (v9) {
      id v16 = v12;
    }
    else {
      id v16 = v17;
    }
    [(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems setObject:v14 forKey:v16];
    [v14 setIdentifier:@"UISV-spacing-hidden"];
  }
  else
  {
    [(NSMapTable *)self->_edgeToEdgeConstraintsForVisibleItems setObject:v14 forKey:v17];
  }
  [v14 setActive:1];
}

- (id)_edgeToEdgeConstraintForGapBetweenPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  unint64_t v13 = [v12 distribution] - 3;
  BOOL v14 = [(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v10];
  BOOL v15 = [(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v11];
  id v16 = v12;
  [v16 customSpacingAfterItem:v10];
  if (v17 == 3.40282347e38)
  {
    [v16 spacing];
    if (v17 == 3.40282347e38)
    {

LABEL_11:
      BOOL v23 = v13 < 2;
      int64_t v24 = [(_UIOrderedLayoutArrangement *)self _minAttributeForGapConstraintRespectingBaselineRelative:[(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v11]];
      int64_t v25 = [(_UIOrderedLayoutArrangement *)self _maxAttributeForGapConstraintRespectingBaselineRelative:[(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v10]];
      [(_UIOrderedLayoutArrangement *)self _expectedEdgeToEdgeSpacingForPrecedingItem:v10 followingItem:v11 isPrecededByVisibleItem:v7 isFollowedByVisibleItem:v6];
      v26 = objc_msgSend(MEMORY[0x1E4F5B268], "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", v11, v24, v23, v10, v25);
      goto LABEL_25;
    }
  }
  double v18 = v17;

  if (v14 && v15) {
    float v19 = 1.0;
  }
  else {
    float v19 = 0.5;
  }
  if (v18 != 1.17549435e-38) {
    goto LABEL_11;
  }
  uint64_t v20 = [v16 axis];
  id v21 = v10;
  if (v20)
  {
    id v22 = v11;
    if ([v16 isBaselineRelativeArrangement]) {
      [v21 lastBaselineAnchor];
    }
    else {
    int v27 = [v21 bottomAnchor];
    }
    if ([v16 isBaselineRelativeArrangement]) {
      [v22 firstBaselineAnchor];
    }
    else {
    uint64_t v29 = [v22 topAnchor];
    }
    uint64_t v30 = v29;
    double v31 = v19;
    if (v13 > 1) {
      [v29 constraintEqualToSystemSpacingBelowAnchor:v27 multiplier:v31];
    }
    else {
    v26 = [v29 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v27 multiplier:v31];
    }
  }
  else
  {
    id v22 = [v11 leadingAnchor];
    int v27 = [v21 trailingAnchor];
    double v28 = v19;
    if (v13 > 1) {
      [v22 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:v28];
    }
    else {
    v26 = [v22 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v27 multiplier:v28];
    }
  }

LABEL_25:
  [v26 setIdentifier:@"UISV-spacing"];

  return v26;
}

- (int64_t)_minAttributeForGapConstraintRespectingBaselineRelative:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  uint64_t v5 = [v4 axis];
  if (v5) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = 5;
  }
  if (v5 && v3)
  {
    if ([v4 isBaselineRelativeArrangement]) {
      int64_t v6 = 12;
    }
    else {
      int64_t v6 = 3;
    }
  }

  return v6;
}

- (int64_t)_maxAttributeForGapConstraintRespectingBaselineRelative:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  uint64_t v5 = [v4 axis];
  if (v5) {
    int64_t v6 = 4;
  }
  else {
    int64_t v6 = 6;
  }
  if (v5 && v3)
  {
    if ([v4 isBaselineRelativeArrangement]) {
      int64_t v6 = 11;
    }
    else {
      int64_t v6 = 4;
    }
  }

  return v6;
}

- (double)_expectedEdgeToEdgeSpacingForPrecedingItem:(id)a3 followingItem:(id)a4 isPrecededByVisibleItem:(BOOL)a5 isFollowedByVisibleItem:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v10];
  BOOL v13 = [(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v11];

  double v14 = 0.0;
  if ((v12 || v7) && (v13 || v6))
  {
    BOOL v15 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
    [v15 customSpacingAfterItem:v10];
    if (v16 == 3.40282347e38) {
      [v15 spacing];
    }
    double v17 = [(_UILayoutArrangement *)self canvas];
    UIRoundToViewScale(v17);
    double v14 = v18;

    if (!v12 || !v13) {
      double v14 = v14 * 0.5;
    }
  }
  return v14;
}

- (void)_cleanUpEdgeToEdgeConstraintsForHiddenItemsForItem:(id)a3 atIndex:(unint64_t)a4 processAdjacentHiddenItems:(BOOL)a5
{
  BOOL v5 = a5;
  id v17 = a3;
  _UILACleanUpConstraintForItemInCollection(v17, self->_edgeToEdgeConstraintsForHiddenItems);
  if (v5)
  {
    BOOL v8 = [(_UILayoutArrangement *)self items];
    BOOL v9 = v8;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL && (a4 = [v8 indexOfObject:v17], a4 == 0x7FFFFFFFFFFFFFFFLL))
    {
      _removeEntriesFromCollectionIfConstraintContainsItem(v17, self->_edgeToEdgeConstraintsForHiddenItems);
    }
    else
    {
      if (a4)
      {
        unint64_t v10 = a4 - 1;
        id v11 = v17;
        while (1)
        {
          BOOL v12 = v11;
          id v17 = [v9 objectAtIndexedSubscript:v10];

          if ([(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v17]) {
            break;
          }
          _UILACleanUpConstraintForItemInCollection(v17, self->_edgeToEdgeConstraintsForHiddenItems);
          --v10;
          id v11 = v17;
          if (v10 == -1) {
            goto LABEL_11;
          }
        }
      }
      id v11 = v17;
LABEL_11:
      id v17 = v11;
      unint64_t v13 = [v9 count];
      if (v13 >= 3)
      {
        unint64_t v14 = v13;
        if (a4 < v13 - 2)
        {
          unint64_t v15 = a4 + 1;
          do
          {
            double v16 = v17;
            id v17 = [v9 objectAtIndexedSubscript:v15];

            if ([(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v17]) {
              break;
            }
            _UILACleanUpConstraintForItemInCollection(v17, self->_edgeToEdgeConstraintsForHiddenItems);
            ++v15;
          }
          while (v15 < v14);
        }
      }
    }
  }
}

- (void)_intrinsicContentSizeInvalidatedForItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIOrderedLayoutArrangement;
  id v3 = a3;
  [(_UILayoutArrangement *)&v4 _intrinsicContentSizeInvalidatedForItem:v3];
  _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v3);
}

- (BOOL)_monitorsSystemLayoutFittingSizeForItem:(id)a3
{
  if (self->_distribution != 2) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(_UILayoutArrangement *)self _mutableItems];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setLayoutFillsCanvas:(BOOL)a3
{
}

- (void)_clearAllConstraintsArrays
{
  v3.receiver = self;
  v3.super_class = (Class)_UIOrderedLayoutArrangement;
  [(_UILayoutArrangement *)&v3 _clearAllConstraintsArrays];
  [(_UIOrderedLayoutArrangement *)self _cleanUpWithoutResettingKeepAliveWorkaround];
}

- (void)_cleanUpWithoutResettingKeepAliveWorkaround
{
  _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
  _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
  _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
  _UILACleanUpConstraintsMapTable(self->_hidingDimensionConstraints);
  _UILACleanUpConstraintsMapTable(self->_multilineTextWidthDisambiguationConstraints);
  [(_UIOrderedLayoutArrangement *)self _cleanUpGuides];
}

- (void)_cleanUpGuides
{
  if ([(NSMapTable *)self->_spacingOrCenteringGuides count])
  {
    id v7 = [(NSMapTable *)self->_spacingOrCenteringGuides objectEnumerator];
    uint64_t v3 = [v7 nextObject];
    if (v3)
    {
      id v4 = (void *)v3;
      do
      {
        [v4 _setLockedToOwningView:0];
        BOOL v5 = [v4 owningView];
        [v5 removeLayoutGuide:v4];

        uint64_t v6 = [v7 nextObject];

        id v4 = (void *)v6;
      }
      while (v6);
    }
    [(NSMapTable *)self->_spacingOrCenteringGuides removeAllObjects];
  }
}

- (void)_cleanUpEdgeToEdgeConstraintsForVisibleItemsForItem:(id)a3 atIndex:(unint64_t)a4 processPrecedingVisibleItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  _UILACleanUpConstraintForItemInCollection(v13, self->_edgeToEdgeConstraintsForVisibleItems);
  if (v5)
  {
    BOOL v8 = [(_UILayoutArrangement *)self items];
    BOOL v9 = v8;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL && (a4 = [v8 indexOfObject:v13], a4 == 0x7FFFFFFFFFFFFFFFLL))
    {
      _removeEntriesFromCollectionIfConstraintContainsItem(v13, self->_edgeToEdgeConstraintsForVisibleItems);
    }
    else if (a4)
    {
      unint64_t v10 = a4 - 1;
      while (1)
      {
        id v11 = v13;
        id v13 = [v9 objectAtIndexedSubscript:v10];

        if ([(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v13]) {
          break;
        }
        if (--v10 == -1) {
          goto LABEL_13;
        }
      }
      id v12 = v13;
      if (v12)
      {
        id v13 = v12;
        _UILACleanUpConstraintForItemInCollection(v12, self->_edgeToEdgeConstraintsForVisibleItems);
      }
      else
      {
        id v13 = 0;
      }
    }
LABEL_13:
  }
}

- (NSMapTable)customSpacings
{
  return self->_customSpacings;
}

- (id)_tallestItem
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(_UILayoutArrangement *)self _mutableItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "_la_isVisible"))
        {
          [v9 _calculatedIntrinsicHeight];
          if (v10 > v7)
          {
            double v11 = v10;
            id v12 = v9;

            double v7 = v11;
            BOOL v5 = v12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setUpHidingDimensionConstraintForItem:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F5B268];
  id v5 = a3;
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:constant:", v5, -[_UILayoutArrangement _dimensionAttributeForCurrentAxis](self, "_dimensionAttributeForCurrentAxis"), 0, 0.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setIdentifier:@"UISV-hiding"];
  LODWORD(v6) = 1148846064;
  [v7 setPriority:v6];
  [v7 setActive:1];
  [(NSMapTable *)self->_hidingDimensionConstraints setObject:v7 forKey:v5];
}

- (void)_cleanUpGuideAtGapFollowingItem:(id)a3
{
  id v9 = a3;
  uint64_t v4 = -[NSMapTable objectForKey:](self->_spacingOrCenteringGuides, "objectForKey:");
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_relatedDimensionConstraints objectEnumerator];
    double v6 = [v5 nextObject];
    id v7 = [(_UIOrderedLayoutArrangement *)self _dimensionRefItemFromConstraint:v6];

    if (v4 == v7)
    {
      _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
      [(_UIOrderedLayoutArrangement *)self _cleanUpGuides];
    }
    else
    {
      [v4 _setLockedToOwningView:0];
      BOOL v8 = [v4 owningView];
      [v8 removeLayoutGuide:v4];

      [(NSMapTable *)self->_spacingOrCenteringGuides removeObjectForKey:v9];
    }
  }
}

- (id)_setUpSpacingOrCenteringGuideForGapIndex:(unint64_t)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(_UILayoutArrangement *)self _mutableItems];
  double v6 = [v5 objectAtIndexedSubscript:a3];
  if (a3 + 1 >= [v5 count])
  {
LABEL_4:
    BOOL v8 = 0;
LABEL_5:
    double v11 = 0;
    goto LABEL_6;
  }
  while (1)
  {
    unint64_t v7 = a3 + 1;
    BOOL v8 = [v5 objectAtIndexedSubscript:a3 + 1];
    if ([(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v8]) {
      break;
    }

    unint64_t v9 = [v5 count];
    unint64_t v10 = a3 + 2;
    ++a3;
    if (v10 >= v9) {
      goto LABEL_4;
    }
  }
  if (a3 == 0x7FFFFFFFFFFFFFFELL) {
    goto LABEL_5;
  }
  id v13 = [(_UILayoutArrangement *)self canvas];
  double v11 = objc_alloc_init(_UIOLAGapGuide);
  [v13 addLayoutGuide:v11];
  [(UILayoutGuide *)v11 setIdentifier:@"UISV-distributing"];
  [(UILayoutGuide *)v11 _setLockedToOwningView:1];
  [(_UIOLAGapGuide *)v11 setFollowingItemIndex:v7];
  [(_UIOLAGapGuide *)v11 setFollowingItem:v8];
  int64_t v14 = [(_UIOrderedLayoutArrangement *)self _minAttributeForGapConstraint];
  int64_t v15 = [(_UIOrderedLayoutArrangement *)self _precedingLocationAttributeForGuideConstraint];
  long long v16 = [MEMORY[0x1E4F5B268] constraintWithItem:v11 attribute:v14 relatedBy:0 toItem:v6 attribute:v15];
  uint64_t v17 = 0;
  v21[0] = v16;
  if ((unint64_t)(v14 - 3) <= 9) {
    uint64_t v17 = qword_186B9DEE0[v14 - 3];
  }
  if ((unint64_t)(v15 - 3) > 9) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = qword_186B9DEE0[v15 - 3];
  }
  uint64_t v19 = [MEMORY[0x1E4F5B268] constraintWithItem:v11 attribute:v17 relatedBy:0 toItem:v8 attribute:v18];
  v21[1] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  [v20 makeObjectsPerformSelector:sel_setIdentifier_ withObject:@"UISV-distributing-edge"];
  [MEMORY[0x1E4F5B268] activateConstraints:v20];
  [(UILayoutGuide *)v11 _setSystemConstraints:v20];
  [(NSMapTable *)self->_spacingOrCenteringGuides setObject:v11 forKey:v6];

LABEL_6:
  return v11;
}

- (void)_setItemOrderingChanged:(BOOL)a3
{
  self->_itemOrderingChanged = a3;
}

- (void)_adjustConstraintConstantsIfPossible
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _orderedConfigurationHistory];
  [v4 spacing];
  double v6 = v5;
  [v3 spacing];
  double v8 = v7;

  BOOL v9 = [(_UIOrderedLayoutArrangement *)self _customSpacingChanged];
  unint64_t v10 = [v3 _newlyHiddenItems];
  double v11 = [v3 _newlyUnhiddenItems];
  id v12 = [v10 setByAddingObjectsFromSet:v11];

  [v3 spacing];
  double v14 = v13;
  if (v13 == 0.0)
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v107 objects:v115 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v108 != v18) {
            objc_enumerationMutation(v15);
          }
          [(_UIOrderedLayoutArrangement *)self customSpacingAfterItem:*(void *)(*((void *)&v107 + 1) + 8 * i)];
          if (v20 != 0.0 && v20 != 3.40282347e38 && v20 != 1.17549435e-38)
          {

            goto LABEL_23;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v107 objects:v115 count:16];
      }
      while (v17);
    }
  }
  char v22 = v6 != v8 || v9;
  if ((v22 & 1) != 0 || v14 != 0.0 && v14 != 1.17549435e-38 && [v12 count])
  {
LABEL_23:
    long long v83 = v12;
    uint64_t v84 = v3;
    BOOL v23 = [(_UILayoutArrangement *)self items];
    uint64_t v24 = [(_UIOrderedLayoutArrangement *)self _firstVisibleItem];
    uint64_t v25 = [(_UIOrderedLayoutArrangement *)self _lastVisibleItem];
    uint64_t v82 = (void *)v24;
    unint64_t v88 = [v23 indexOfObject:v24];
    v89 = v23;
    long long v81 = (void *)v25;
    unint64_t v87 = [v23 indexOfObject:v25];
    v90 = self;
    [(NSMapTable *)self->_edgeToEdgeConstraintsForVisibleItems objectEnumerator];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [obj countByEnumeratingWithState:&v103 objects:v114 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v104;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v104 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void **)(*((void *)&v103 + 1) + 8 * j);
          [v30 constant];
          double v32 = v31;
          v33 = [v30 secondItem];
          v34 = [v30 firstItem];
          unint64_t v35 = [v89 indexOfObject:v33];
          unint64_t v36 = [v89 indexOfObject:v34];
          unint64_t v37 = [v30 secondItem];
          uint64_t v38 = [v30 firstItem];
          [(_UIOrderedLayoutArrangement *)v90 _expectedEdgeToEdgeSpacingForPrecedingItem:v37 followingItem:v38 isPrecededByVisibleItem:v88 < v35 isFollowedByVisibleItem:v87 > v36];
          double v40 = v39;

          if (v32 != v40) {
            [v30 setConstant:v40];
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v103 objects:v114 count:16];
      }
      while (v27);
    }
    float v41 = [(NSMapTable *)v90->_edgeToEdgeConstraintsForHiddenItems objectEnumerator];

    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id obja = v41;
    uint64_t v42 = [obja countByEnumeratingWithState:&v99 objects:v113 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v100;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v100 != v44) {
            objc_enumerationMutation(obja);
          }
          BOOL v46 = *(void **)(*((void *)&v99 + 1) + 8 * k);
          [v46 constant];
          double v48 = v47;
          uint64_t v49 = [v46 secondItem];
          uint64_t v50 = [v46 firstItem];
          unint64_t v51 = [v89 indexOfObject:v49];
          unint64_t v52 = [v89 indexOfObject:v50];
          uint64_t v53 = [v46 secondItem];
          uint64_t v54 = [v46 firstItem];
          [(_UIOrderedLayoutArrangement *)v90 _expectedEdgeToEdgeSpacingForPrecedingItem:v53 followingItem:v54 isPrecededByVisibleItem:v88 < v51 isFollowedByVisibleItem:v87 > v52];
          double v56 = v55;

          if (v48 != v56) {
            [v46 setConstant:v56];
          }
        }
        uint64_t v43 = [obja countByEnumeratingWithState:&v99 objects:v113 count:16];
      }
      while (v43);
    }

    if ([(NSMapTable *)v90->_multilineTextWidthDisambiguationConstraints count])
    {
      uint64_t v57 = [(_UILayoutArrangement *)v90 _mutableItems];
      uint64_t v58 = [v57 count];
      BOOL v59 = [(_UILayoutArrangement *)v90 _hiddenItems];
      uint64_t v60 = [v59 count];

      if ([(NSMapTable *)v90->_multilineTextWidthDisambiguationConstraints count])
      {
        double v61 = [(_UILayoutArrangement *)v90 canvas];
        int v62 = objc_msgSend(v61, "_ola_shouldUseImprovedMultilineTextDisambiguation");

        if (v62)
        {
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          uint64_t v63 = [(_UILayoutArrangement *)v90 _mutableItems];
          uint64_t v64 = [v63 countByEnumeratingWithState:&v95 objects:v112 count:16];
          if (v64)
          {
            uint64_t v65 = v64;
            uint64_t v66 = 0;
            uint64_t v67 = *(void *)v96;
            do
            {
              for (uint64_t m = 0; m != v65; ++m)
              {
                if (*(void *)v96 != v67) {
                  objc_enumerationMutation(v63);
                }
                BOOL v69 = *(void **)(*((void *)&v95 + 1) + 8 * m);
                if (objc_msgSend(v69, "_la_isVisible")) {
                  v66 += 8
                }
                       * objc_msgSend(v69, "_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged");
              }
              uint64_t v65 = [v63 countByEnumeratingWithState:&v95 objects:v112 count:16];
            }
            while (v65);
          }
          else
          {
            uint64_t v66 = 0;
          }
        }
        else
        {
          uint64_t v66 = v58 - v60;
        }
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        v70 = [(NSMapTable *)v90->_multilineTextWidthDisambiguationConstraints objectEnumerator];
        uint64_t v71 = [v70 countByEnumeratingWithState:&v91 objects:v111 count:16];
        if (v71)
        {
          uint64_t v72 = v71;
          uint64_t v73 = *(void *)v92;
          do
          {
            for (uint64_t n = 0; n != v72; ++n)
            {
              if (*(void *)v92 != v73) {
                objc_enumerationMutation(v70);
              }
              long long v75 = *(void **)(*((void *)&v91 + 1) + 8 * n);
              long long v76 = [v75 firstItem];
              BOOL v77 = [(_UILayoutArrangement *)v90 _itemWantsLayoutAsIfVisible:v76];

              if (v77)
              {
                [v75 constant];
                double v79 = v78;
                [(_UIOrderedLayoutArrangement *)v90 _constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:v66];
                if (v79 != v80) {
                  objc_msgSend(v75, "setConstant:");
                }
              }
            }
            uint64_t v72 = [v70 countByEnumeratingWithState:&v91 objects:v111 count:16];
          }
          while (v72);
        }
      }
    }

    id v12 = v83;
    uint64_t v3 = v84;
  }
}

- (double)spacing
{
  return self->_spacing;
}

- (BOOL)isBaselineRelativeArrangement
{
  return self->_baselineRelativeArrangement;
}

- (void)setAxis:(int64_t)a3
{
}

- (void)setSpacing:(double)a3
{
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42___UIOrderedLayoutArrangement_setSpacing___block_invoke;
    v5[3] = &__block_descriptor_40_e36_v16__0___UIOLAConfigurationHistory_8l;
    *(double *)&v5[4] = a3;
    [(_UILayoutArrangement *)self _trackChangesWithConfigBlock:v5];
    uint64_t v4 = [(_UILayoutArrangement *)self canvas];
    _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v4);
  }
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  if (self->_baselineRelativeArrangement != a3)
  {
    self->_baselineRelativeArrangement = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62___UIOrderedLayoutArrangement_setBaselineRelativeArrangement___block_invoke;
    v5[3] = &__block_descriptor_33_e36_v16__0___UIOLAConfigurationHistory_8l;
    BOOL v6 = a3;
    [(_UILayoutArrangement *)self _trackChangesWithConfigBlock:v5];
    uint64_t v4 = [(_UILayoutArrangement *)self canvas];
    _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v4);
  }
}

- (void)setDistribution:(int64_t)a3
{
  if (self->_distribution != a3)
  {
    self->_distributiouint64_t n = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47___UIOrderedLayoutArrangement_setDistribution___block_invoke;
    v5[3] = &__block_descriptor_40_e36_v16__0___UIOLAConfigurationHistory_8l;
    void v5[4] = a3;
    [(_UILayoutArrangement *)self _trackChangesWithConfigBlock:v5];
    uint64_t v4 = [(_UILayoutArrangement *)self canvas];
    _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v4);
  }
}

- (void)_visibilityParameterChangedForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(_UILayoutArrangement *)self _mutableItems];
  uint64_t v6 = [v5 indexOfObject:v4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    if ([(_UILayoutArrangement *)self axis] != 1)
    {
LABEL_15:
      v19.receiver = self;
      v19.super_class = (Class)_UIOrderedLayoutArrangement;
      [(_UILayoutArrangement *)&v19 _visibilityParameterChangedForItem:v4];
      goto LABEL_16;
    }
    double v8 = [(_UIOrderedLayoutArrangement *)self _firstVisibleItem];
    BOOL v9 = [(_UIOrderedLayoutArrangement *)self _lastVisibleItem];
    if (objc_msgSend(v4, "_la_isVisible"))
    {
      id v10 = [(_UIOrderedLayoutArrangement *)self _firstVisibleItem];

      if (v10 == v4)
      {
        double v11 = [(_UILayoutArrangement *)self canvas];
        [v11 _vendedBaselineViewDidMoveForFirst:1];
      }
      id v12 = [(_UIOrderedLayoutArrangement *)self _lastVisibleItem];

      if (v12 != v4) {
        goto LABEL_14;
      }
    }
    else
    {
      if (!v8
        || ([(_UILayoutArrangement *)self _mutableItems],
            double v13 = objc_claimAutoreleasedReturnValue(),
            unint64_t v14 = [v13 indexOfObject:v8],
            v13,
            v7 < v14))
      {
        id v15 = [(_UILayoutArrangement *)self canvas];
        [v15 _vendedBaselineViewDidMoveForFirst:1];
      }
      if (v9)
      {
        uint64_t v16 = [(_UILayoutArrangement *)self _mutableItems];
        unint64_t v17 = [v16 indexOfObject:v9];

        if (v7 <= v17) {
          goto LABEL_14;
        }
      }
    }
    uint64_t v18 = [(_UILayoutArrangement *)self canvas];
    [v18 _vendedBaselineViewDidMoveForFirst:0];

LABEL_14:
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_dimensionRefItemFromConstraint:(id)a3
{
  double v5 = objc_msgSend(a3, "_ola_dimensionRefItem");
  if (a3 && !v5)
  {
    if ([(_UIOrderedLayoutArrangement *)self _wantsProportionalDistribution])
    {
      double v5 = [(_UILayoutArrangement *)self canvas];
    }
    else
    {
      double v5 = 0;
    }
  }
  return v5;
}

- (void)setCustomSpacing:(double)a3 afterItem:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(_UILayoutArrangement *)self items];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    [(_UIOrderedLayoutArrangement *)self customSpacingAfterItem:v6];
    if (v9 != a3)
    {
      customSpacings = self->_customSpacings;
      if (!customSpacings)
      {
        double v11 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:0];
        id v12 = self->_customSpacings;
        self->_customSpacings = v11;

        customSpacings = self->_customSpacings;
      }
      double v13 = [NSNumber numberWithDouble:a3];
      [(NSMapTable *)customSpacings setObject:v13 forKey:v6];

      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      unint64_t v17 = __58___UIOrderedLayoutArrangement_setCustomSpacing_afterItem___block_invoke;
      uint64_t v18 = &unk_1E530E4E0;
      double v20 = a3;
      id v19 = v6;
      [(_UILayoutArrangement *)self _trackChangesWithConfigBlock:&v15];
      unint64_t v14 = [(_UILayoutArrangement *)self canvas];
      _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v14);
    }
  }
}

- (double)customSpacingAfterItem:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_customSpacings objectForKey:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 3.40282347e38;
  }

  return v6;
}

- (int64_t)_precedingLocationAttributeForGuideConstraint
{
  uint64_t v3 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  if ([v3 distribution] == 3)
  {
    int64_t v4 = [(_UIOrderedLayoutArrangement *)self _minAttributeForGapConstraint];
    if ((unint64_t)(v4 - 3) < 0xA)
    {
      int64_t v5 = qword_186B9DEE0[v4 - 3];
      goto LABEL_9;
    }
LABEL_8:
    int64_t v5 = 0;
    goto LABEL_9;
  }
  if ([v3 distribution] != 4) {
    goto LABEL_8;
  }
  if ([(_UILayoutArrangement *)self axis]) {
    int64_t v5 = 10;
  }
  else {
    int64_t v5 = 9;
  }
LABEL_9:

  return v5;
}

- (int64_t)_minAttributeForGapConstraint
{
  return [(_UIOrderedLayoutArrangement *)self _minAttributeForGapConstraintRespectingBaselineRelative:1];
}

- (double)_calculatedIntrinsicHeight
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(_UILayoutArrangement *)self axis])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v3 = [(_UILayoutArrangement *)self _mutableItems];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v16;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v3);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "_la_isVisible"))
          {
            ++v6;
            [v10 _calculatedIntrinsicHeight];
            double v8 = v8 + v11;
          }
          if (v6) {
            double v8 = v8 + self->_spacing * (double)(unint64_t)(v6 - 1);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
    else
    {
      double v8 = 0.0;
    }
  }
  else
  {
    id v12 = [(_UIOrderedLayoutArrangement *)self _tallestItem];
    [v12 _calculatedIntrinsicHeight];
    double v8 = v13;
  }
  return v8;
}

- (void)_setUpDimensionConstraintForItem:(id)a3 referenceItem:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    double v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"_UIOrderedLayoutArrangement.m" lineNumber:1169 description:@"Can't set up dimension constraint"];
  }
  double v11 = [(_UILayoutArrangement *)self _mutableItems];
  id v12 = [v11 objectAtIndexedSubscript:a5];

  BOOL v13 = [(_UIOrderedLayoutArrangement *)self _wantsProportionalDistribution];
  int64_t v14 = [(_UILayoutArrangement *)self _dimensionAttributeForCurrentAxis];
  if (v13)
  {
    long long v15 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
    objc_msgSend(v9, "_proportionalFillLengthForOrderedArrangement:relevantParentAxis:", self, objc_msgSend(v15, "axis"));
    double v17 = v16;

    double v18 = fmax(v17, 0.0) / self->_proportionalFillDenominator;
    if (v18 <= 0.0)
    {
      uint64_t v25 = [MEMORY[0x1E4F5B268] constraintWithItem:v9 attribute:v14 relatedBy:0 constant:0.0];
LABEL_13:
      uint64_t v26 = v25;
      if (self->_distribution != 4)
      {
        [v25 multiplier];
        if (v29 == 1.0)
        {
          LODWORD(v29) = 1148846080;
          goto LABEL_18;
        }
        double v27 = 999.0 - (double)a5;
        double v28 = 751.0;
LABEL_17:
        double v29 = fmax(v27, v28);
        *(float *)&double v29 = v29;
LABEL_18:
        [v26 setPriority:v29];
        goto LABEL_19;
      }
LABEL_14:
      double v27 = 150.0 - (double)a5;
      double v28 = 50.0;
      goto LABEL_17;
    }
    id v19 = [(_UILayoutArrangement *)self _propertySource];
    int v20 = [v19 layoutUsesCanvasMarginsWhenFilling];

    if (!v20)
    {
LABEL_9:
      uint64_t v25 = [MEMORY[0x1E4F5B268] constraintWithItem:v9 attribute:v14 relatedBy:0 toItem:v10 attribute:v14 multiplier:v18];
      goto LABEL_13;
    }
    id v21 = [(_UILayoutArrangement *)self canvas];

    if (v21 == v10)
    {
LABEL_7:
      id v22 = [(_UILayoutArrangement *)self canvas];

      if (v22 == v10)
      {
        BOOL v23 = [(_UILayoutArrangement *)self canvas];
        uint64_t v24 = [v23 layoutMarginsGuide];

        id v10 = (id)v24;
      }
      goto LABEL_9;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v33 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        goto LABEL_28;
      }
      v34 = [(_UILayoutArrangement *)self canvas];
      int v35 = 138412546;
      unint64_t v36 = v34;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_fault_impl(&dword_1853B0000, v33, OS_LOG_TYPE_FAULT, "Unexpected referenceItem for proportional fill constraint for stack view. UIStackView = %@, referenceIteuint64_t m = %@", (uint8_t *)&v35, 0x16u);
    }
    else
    {
      double v32 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setUpDimensionConstraintForItem_referenceItem_atIndex____s_category)+ 8);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      v33 = v32;
      v34 = [(_UILayoutArrangement *)self canvas];
      int v35 = 138412546;
      unint64_t v36 = v34;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "Unexpected referenceItem for proportional fill constraint for stack view. UIStackView = %@, referenceIteuint64_t m = %@", (uint8_t *)&v35, 0x16u);
    }

LABEL_28:
    goto LABEL_7;
  }
  uint64_t v26 = [MEMORY[0x1E4F5B268] constraintWithItem:v9 attribute:v14 relatedBy:0 toItem:v10 attribute:v14];
  if (self->_distribution == 4) {
    goto LABEL_14;
  }
LABEL_19:
  if (v13) {
    uint64_t v30 = @"UISV-fill-proportionally";
  }
  else {
    uint64_t v30 = @"UISV-fill-equally";
  }
  [v26 setIdentifier:v30];
  [v26 setActive:1];
  [(NSMapTable *)self->_relatedDimensionConstraints setObject:v26 forKey:v12];
}

- (BOOL)_wantsProportionalDistribution
{
  uint64_t v3 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  uint64_t v4 = [(_UILayoutArrangement *)self _mutableItems];
  uint64_t v5 = [v4 count];

  BOOL v6 = 0;
  if ([v3 distribution] == 2 && v5)
  {
    double proportionalFillDenominator = self->_proportionalFillDenominator;
    [v3 spacing];
    BOOL v6 = proportionalFillDenominator > fmax(v8 * (double)(unint64_t)(v5 - 1), 1.0);
  }

  return v6;
}

- (void)dealloc
{
  if (dyld_program_sdk_at_least())
  {
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForVisibleItems);
    _UILACleanUpConstraintsMapTable(self->_edgeToEdgeConstraintsForHiddenItems);
    _UILACleanUpConstraintsMapTable(self->_relatedDimensionConstraints);
    _UILACleanUpConstraintsMapTable(self->_hidingDimensionConstraints);
    _UILACleanUpConstraintsMapTable(self->_multilineTextWidthDisambiguationConstraints);
  }
  v3.receiver = self;
  v3.super_class = (Class)_UIOrderedLayoutArrangement;
  [(_UIOrderedLayoutArrangement *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSpacings, 0);
  objc_storeStrong((id *)&self->_multilineTextWidthDisambiguationConstraints, 0);
  objc_storeStrong((id *)&self->_hidingDimensionConstraints, 0);
  objc_storeStrong((id *)&self->_relatedDimensionConstraints, 0);
  objc_storeStrong((id *)&self->_edgeToEdgeConstraintsForHiddenItems, 0);
  objc_storeStrong((id *)&self->_edgeToEdgeConstraintsForVisibleItems, 0);
  objc_storeStrong((id *)&self->_spacingOrCenteringGuides, 0);
}

- (void)_systemLayoutFittingSizeDidChangeForItem:(id)a3
{
  uint64_t v4 = a3;
  [(_UILayoutArrangement *)self _createUnanimatedConfigurationTargetIfNecessary];
  [(_UIOrderedLayoutArrangement *)self _setItemFittingSizeChanged:1];
  uint64_t v5 = [(_UILayoutArrangement *)self canvas];
  BOOL v6 = _UILAIsAnimatingOnCanvas(v5);

  if (v6)
  {
    [(_UILayoutArrangement *)self _registerAnimationRequest];
  }
  else
  {
    uint64_t v7 = [(_UILayoutArrangement *)self _unanimatedConfigurationTarget];
    [v7 _setItemFittingSizeChanged:1];
  }
  id v9 = [(_UILayoutArrangement *)self canvas];
  uint64_t v8 = v4[13];

  [v9 _setNeedsUpdateConstraintsNeedingLayout:(v8 & 0x60) == 0];
}

- (double)_constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:(unint64_t)a3
{
  uint64_t v4 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  uint64_t v5 = v4;
  if (a3)
  {
    [v4 spacing];
    double v7 = -(v6 * ((double)a3 + -1.0)) / (double)a3;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)_preparedFaultyCompatibleMultilineTextWidthDisambiguationConstraintForItem:(id)a3
{
  id v5 = a3;
  double v6 = [(_UILayoutArrangement *)self canvas];
  int v7 = objc_msgSend(v6, "_ola_shouldUseImprovedMultilineTextDisambiguation");

  if (v7)
  {
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"_UIOrderedLayoutArrangement.m" lineNumber:1229 description:@"Incorrect use of faulty logic. Internal UIKit bug."];
  }
  id v8 = v5;
  uint64_t v9 = [(_UILayoutArrangement *)self _mutableItems];
  uint64_t v10 = [(id)v9 count];
  double v11 = [(_UILayoutArrangement *)self _hiddenItems];
  uint64_t v12 = [v11 count];
  unint64_t v13 = v10 - v12;

  int64_t v14 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  LOBYTE(v9) = [v14 layoutUsesCanvasMarginsWhenFilling];
  long long v15 = [(_UILayoutArrangement *)self canvas];
  double v16 = v15;
  if (v9)
  {
    double v17 = [v15 layoutMarginsGuide];
    double v18 = [v17 widthAnchor];
  }
  else
  {
    double v18 = [v15 widthAnchor];
  }

  id v19 = [v8 widthAnchor];
  double v20 = 0.0;
  if (v10 != v12) {
    double v20 = 1.0 / (double)v13;
  }
  [(_UIOrderedLayoutArrangement *)self _constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:v13];
  id v22 = [v19 constraintEqualToAnchor:v18 multiplier:v20 constant:v21];

  [v8 contentCompressionResistancePriorityForAxis:0];
  float v24 = v23;
  [v8 contentHuggingPriorityForAxis:0];
  if (v24 >= v25) {
    float v25 = v24;
  }
  double v26 = v25 + 10.0;
  if (v26 > 999.0) {
    double v26 = 999.0;
  }
  *(float *)&double v26 = v26;
  [v22 setPriority:v26];

  return v22;
}

- (id)_preparedImprovedMultilineTextWidthDisambiguationConstraintForItem:(id)a3 numberOfVisibleMultilineItems:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend(v6, "_ola_willApplyMultilineTextWidthDisambiguationConstraint");
  int v7 = [(_UIOrderedLayoutArrangement *)self _orderedPropertySource];
  char v8 = [v7 layoutUsesCanvasMarginsWhenFilling];
  uint64_t v9 = [(_UILayoutArrangement *)self canvas];
  uint64_t v10 = v9;
  if (v8)
  {
    double v11 = [v9 layoutMarginsGuide];
    uint64_t v12 = [v11 widthAnchor];
  }
  else
  {
    uint64_t v12 = [v9 widthAnchor];
  }

  unint64_t v13 = [v6 widthAnchor];

  if (a4) {
    double v14 = 1.0 / (double)a4;
  }
  else {
    double v14 = 1.0;
  }
  [(_UIOrderedLayoutArrangement *)self _constantForMultilineTextWidthDisambiguationConstraintWithNumberOfRelevantItems:a4];
  double v16 = [v13 constraintLessThanOrEqualToAnchor:v12 multiplier:v14 constant:v15];

  LODWORD(v17) = 1148026880;
  [v16 setPriority:v17];

  return v16;
}

- (void)_setUpMultilineTextWidthDisambiguationConstraintForItem:(id)a3 numberOfVisibleMultilineItems:(unint64_t)a4
{
  id v11 = a3;
  id v6 = -[NSMapTable objectForKey:](self->_multilineTextWidthDisambiguationConstraints, "objectForKey:");
  if (v6)
  {
    int v7 = v6;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      [v6 setActive:1];
    }
  }
  else
  {
    char v8 = self->_multilineTextWidthDisambiguationConstraints;
    if (!v8)
    {
      if (a4 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0) {
        unint64_t v9 = a4 - 1;
      }
      else {
        unint64_t v9 = 0;
      }
      char v8 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:v9];
    }
    multilineTextWidthDisambiguationConstraints = self->_multilineTextWidthDisambiguationConstraints;
    self->_multilineTextWidthDisambiguationConstraints = v8;

    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v7 = [(_UIOrderedLayoutArrangement *)self _preparedFaultyCompatibleMultilineTextWidthDisambiguationConstraintForItem:v11];
      [v7 setActive:1];
    }
    else
    {
      int v7 = [(_UIOrderedLayoutArrangement *)self _preparedImprovedMultilineTextWidthDisambiguationConstraintForItem:v11 numberOfVisibleMultilineItems:a4];
    }
    [v7 setIdentifier:@"UISV-text-width-disambiguation"];
    [(NSMapTable *)self->_multilineTextWidthDisambiguationConstraints setObject:v7 forKey:v11];
  }
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)_UIOrderedLayoutArrangement;
  objc_super v3 = [(_UILayoutArrangement *)&v13 description];
  if (os_variant_has_internal_diagnostics())
  {
    if ([(NSMapTable *)self->_edgeToEdgeConstraintsForVisibleItems count])
    {
      uint64_t v5 = objc_msgSend(v3, "stringByAppendingFormat:", @" edgeToEdgeConstraintsForVisibleItems=%p", self->_edgeToEdgeConstraintsForVisibleItems);

      objc_super v3 = (void *)v5;
    }
    if ([(NSMapTable *)self->_edgeToEdgeConstraintsForHiddenItems count])
    {
      uint64_t v6 = objc_msgSend(v3, "stringByAppendingFormat:", @" edgeToEdgeConstraintsForHiddenItems=%p", self->_edgeToEdgeConstraintsForHiddenItems);

      objc_super v3 = (void *)v6;
    }
    if ([(NSMapTable *)self->_hidingDimensionConstraints count])
    {
      uint64_t v7 = objc_msgSend(v3, "stringByAppendingFormat:", @" hidingDimensionConstraints=%p", self->_hidingDimensionConstraints);

      objc_super v3 = (void *)v7;
    }
    if ([(NSMapTable *)self->_multilineTextWidthDisambiguationConstraints count])
    {
      uint64_t v8 = objc_msgSend(v3, "stringByAppendingFormat:", @" multilineTextWidthDisambiguationConstraints=%p", self->_multilineTextWidthDisambiguationConstraints);

      objc_super v3 = (void *)v8;
    }
    if ([(NSMapTable *)self->_spacingOrCenteringGuides count])
    {
      uint64_t v9 = objc_msgSend(v3, "stringByAppendingFormat:", @" spacingOrCenteringGuides=%p", self->_spacingOrCenteringGuides);

      objc_super v3 = (void *)v9;
    }
    if ([(NSMapTable *)self->_relatedDimensionConstraints count])
    {
      uint64_t v10 = objc_msgSend(v3, "stringByAppendingFormat:", @" relatedDimensionConstraints=%p", self->_relatedDimensionConstraints);

      objc_super v3 = (void *)v10;
    }
    if (self->_distribution == 2)
    {
      uint64_t v11 = objc_msgSend(v3, "stringByAppendingFormat:", @" proportionalFillDenominator=%f", *(void *)&self->_proportionalFillDenominator);

      objc_super v3 = (void *)v11;
    }
    if (self->_spacing == 1.17549435e-38) {
      [v3 stringByAppendingString:@" spacing=system"];
    }
    else {
    uint64_t v12 = objc_msgSend(v3, "stringByAppendingFormat:", @" spacing=%g", *(void *)&self->_spacing);
    }

    if ([(NSMapTable *)self->_customSpacings count])
    {
      objc_super v3 = objc_msgSend(v12, "stringByAppendingFormat:", @" customSpacings=%p", self->_customSpacings);
    }
    else
    {
      objc_super v3 = v12;
    }
  }
  return (NSString *)v3;
}

- (BOOL)_itemFittingSizeChanged
{
  return self->_itemFittingSizeChanged;
}

- (void)_setItemFittingSizeChanged:(BOOL)a3
{
  self->_itemFittingSizeChanged = a3;
}

@end