@interface _UILayoutArrangement
+ (Class)_configurationHistoryClass;
- (BOOL)_allItemsHidden;
- (BOOL)_awaitingAnimationLayoutPass;
- (BOOL)_canvasConnectionConstraintsNeedUpdatePass;
- (BOOL)_configurationRequiresCanvasConnectionFittingConstraint;
- (BOOL)_hasStaleConfiguration;
- (BOOL)_itemWantsLayoutAsIfVisible:(id)a3;
- (BOOL)_monitorsSystemLayoutFittingSizeForItem:(id)a3;
- (BOOL)_requiresNotificationForHasBaselinePropertyChanges;
- (BOOL)_spanningGuideConstraintsNeedUpdate;
- (BOOL)_usesCenteringConnectionConstraint;
- (BOOL)_usesInequalitySpanningConstraintForAttribute:(int64_t)a3;
- (BOOL)layoutFillsCanvas;
- (BOOL)layoutUsesCanvasMarginsWhenFilling;
- (NSArray)items;
- (NSMutableArray)_mutableItems;
- (NSSet)_hiddenItems;
- (NSSet)_incomingItems;
- (NSSet)_newlyHiddenItems;
- (NSSet)_newlyUnhiddenItems;
- (NSSet)_outgoingItems;
- (NSSet)invalidBaselineConstraints;
- (NSString)description;
- (UIView)canvas;
- (_UILAConfigurationHistory)_configurationHistory;
- (_UILAConfigurationHistory)_unanimatedConfigurationTarget;
- (_UILAPropertySource)_propertySource;
- (_UILayoutArrangement)init;
- (_UILayoutArrangement)initWithItems:(id)a3;
- (_UILayoutArrangement)initWithItems:(id)a3 onAxis:(int64_t)a4;
- (_UILayoutSpacer)_spanningLayoutGuide;
- (float)_spanningLayoutGuideFittingPriority;
- (id)_baselineDependentConstraints;
- (id)_identifierForSpanningLayoutGuide;
- (id)_spanningLayoutGuideCreateIfNecessary;
- (id)_viewOrGuideForLocationAttribute:(int64_t)a3;
- (int64_t)_axisForSpanningLayoutGuide;
- (int64_t)_centerAttributeForCanvasConnections;
- (int64_t)_dimensionAttributeForCurrentAxis;
- (int64_t)_layoutRelationForCanvasConnectionForAttribute:(int64_t)a3;
- (int64_t)_minAttributeForCanvasConnections;
- (int64_t)axis;
- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3;
- (void)_clearAllConstraintsArrays;
- (void)_clearCanvasConnectionConstraints;
- (void)_createSpanningLayoutGuide;
- (void)_createUnanimatedConfigurationTargetIfNecessary;
- (void)_hasBaselineChangedNotification:(id)a3;
- (void)_hasBaselineChangedNotificationRequirementDidChange;
- (void)_invalidateBaselineConstraint:(id)a3;
- (void)_registerAnimationRequest;
- (void)_removeSpanningLayoutGuide;
- (void)_respondToChangesWithIncomingItem:(id)a3 outgoingItem:(id)a4 newlyHiddenItem:(id)a5 newlyUnhiddenItem:(id)a6;
- (void)_setAxis:(int64_t)a3 notify:(BOOL)a4;
- (void)_setLayoutFillsCanvas:(BOOL)a3 notify:(BOOL)a4;
- (void)_setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3 notify:(BOOL)a4;
- (void)_setMutableItems:(id)a3;
- (void)_setUnanimatedConfigurationTarget:(id)a3;
- (void)_trackChangesWithConfigBlock:(id)a3;
- (void)_updateArrangementConstraints;
- (void)_updateCanvasConnectionConstraintsIfNecessary;
- (void)_updateConfigurationHistory;
- (void)_updateSpanningLayoutGuideConstraintsIfNecessary;
- (void)_visibilityParameterChangedForItem:(id)a3;
- (void)addItem:(id)a3;
- (void)insertItem:(id)a3 atIndex:(unint64_t)a4;
- (void)removeItem:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setCanvas:(id)a3;
- (void)setLayoutFillsCanvas:(BOOL)a3;
- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3;
@end

@implementation _UILayoutArrangement

- (_UILayoutSpacer)_spanningLayoutGuide
{
  return self->_spanningLayoutGuide;
}

- (int64_t)_layoutRelationForCanvasConnectionForAttribute:(int64_t)a3
{
  return 0;
}

- (NSSet)invalidBaselineConstraints
{
  return &self->_invalidBaselineConstraints->super;
}

- (BOOL)_awaitingAnimationLayoutPass
{
  return self->_awaitingAnimationLayoutPass;
}

- (NSSet)_incomingItems
{
  return (NSSet *)self->_incomingItems;
}

- (void)_updateArrangementConstraints
{
  id v3 = [(_UILayoutArrangement *)self _configurationHistory];
  [v3 setInLayoutArrangementUpdateSection:1];
  [(_UILayoutArrangement *)self _updateSpanningLayoutGuideConstraintsIfNecessary];
  [(_UILayoutArrangement *)self _updateCanvasConnectionConstraintsIfNecessary];
  [(_UILayoutArrangement *)self _updateConfigurationHistory];
  [v3 setInLayoutArrangementUpdateSection:0];
}

- (void)_updateSpanningLayoutGuideConstraintsIfNecessary
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (!self->_spanningLayoutGuide
    || ![(_UILayoutArrangement *)self _spanningGuideConstraintsNeedUpdate])
  {
    return;
  }
  int v3 = [(_UILayoutSpacer *)self->_spanningLayoutGuide _isHorizontal];
  if ([(_UILayoutArrangement *)self _axisForSpanningLayoutGuide] == v3)
  {
    [(_UILayoutArrangement *)self _removeSpanningLayoutGuide];
    [(_UILayoutArrangement *)self _createSpanningLayoutGuide];
  }
  v4 = [(UILayoutGuide *)self->_spanningLayoutGuide _systemConstraints];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke_2;
  aBlock[3] = &unk_1E530E470;
  aBlock[4] = self;
  id v72 = &__block_literal_global_629;
  id v6 = v5;
  id v71 = v6;
  v7 = (void (**)(void *, void *, BOOL, void))_Block_copy(aBlock);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke_3;
  v68[3] = &unk_1E52D9F98;
  v68[4] = self;
  id v51 = v6;
  id v69 = v51;
  v49 = (void (**)(void))_Block_copy(v68);
  v48 = [(_UILayoutArrangement *)self _propertySource];
  uint64_t v8 = [v48 axis];
  uint64_t v9 = [v4 count];
  if (v8) {
    uint64_t v10 = 5;
  }
  else {
    uint64_t v10 = 3;
  }
  if (v8) {
    uint64_t v11 = 6;
  }
  else {
    uint64_t v11 = 4;
  }
  BOOL v12 = [(_UILayoutArrangement *)self _usesInequalitySpanningConstraintForAttribute:v10];
  BOOL v13 = [(_UILayoutArrangement *)self _usesInequalitySpanningConstraintForAttribute:v11];
  BOOL v14 = v13;
  BOOL v15 = 1;
  if (!v12 && !v13) {
    BOOL v15 = [(_UILayoutArrangement *)self _spanningLayoutGuideAlwaysUsesFittingConstraint];
  }
  v53 = v4;
  if ([(_UILAConfigurationHistory *)self->_configurationHistory axis] == v8 && v9)
  {
    v52 = (void *)[(NSMutableSet *)self->_incomingItems mutableCopy];
    if ([v4 count])
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      v47 = v49 + 2;
      BOOL v50 = v15;
      while (1)
      {
        v18 = objc_msgSend(v4, "objectAtIndex:", v17, v47);
        v19 = v18;
        if (v17) {
          goto LABEL_19;
        }
        v26 = [v18 secondItem];

        if (v26) {
          break;
        }
        if (v15) {
          [v51 addObject:v19];
        }
        else {
          [v19 setActive:0];
        }
        uint64_t v17 = 0;
        uint64_t v16 = 1;
LABEL_37:

        if (++v17 >= (unint64_t)[v4 count]) {
          goto LABEL_55;
        }
      }
      if (v15) {
        v49[2]();
      }
LABEL_19:
      uint64_t v55 = v16;
      v20 = [v19 secondItem];
      if ([(NSMutableSet *)self->_outgoingItems containsObject:v20])
      {
        [v4 objectAtIndex:++v17];
        v22 = v21 = v4;
        [v19 setActive:0];
        [v22 setActive:0];

        v4 = v21;
      }
      else
      {
        if ((v17 & 1) == v16) {
          BOOL v23 = v12;
        }
        else {
          BOOL v23 = v14;
        }
        uint64_t v24 = -1;
        if ((v17 & 1) != v16) {
          uint64_t v24 = 1;
        }
        BOOL v54 = v15 && v23;
        if (v15 && v23) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = 0;
        }
        if ([v19 relation] == v25)
        {
          [v51 addObject:v19];
        }
        else
        {
          [v19 setActive:0];
          ((void (**)(void *, void *, BOOL, BOOL))v7)[2](v7, v20, (v17 & 1) == v16, v54);
        }
        [v52 removeObject:v20];
        v4 = v53;
        BOOL v15 = v50;
      }
      uint64_t v16 = v55;

      goto LABEL_37;
    }
LABEL_55:
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v27 = v52;
    uint64_t v33 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v60 objects:v74 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v61 != v35) {
            objc_enumerationMutation(v27);
          }
          v37 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v7[2](v7, v37, 1, v12);
          v7[2](v7, v37, 0, v14);
        }
        uint64_t v34 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v60 objects:v74 count:16];
      }
      while (v34);
    }
  }
  else
  {
    if ([v4 count]) {
      [MEMORY[0x1E4F5B268] deactivateConstraints:v4];
    }
    if (v15) {
      v49[2]();
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v27 = self->_mutableItems;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (!v28)
    {
      v38 = v4;
      goto LABEL_64;
    }
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v65 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v64 + 1) + 8 * j);
        v7[2](v7, v32, 1, v12);
        v7[2](v7, v32, 0, v14);
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v29);
  }
  v38 = v53;
LABEL_64:

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v39 = v51;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v57;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v56 + 1) + 8 * k);
        v45 = [v44 secondItem];
        objc_opt_class();
        BOOL v46 = (objc_opt_isKindOfClass() & 1) == 0
           || [(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v45];
        [v44 setActive:v46];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
    }
    while (v41);
  }

  [(UILayoutGuide *)self->_spanningLayoutGuide _setSystemConstraints:v39];
}

- (void)_updateCanvasConnectionConstraintsIfNecessary
{
  if (![(_UILayoutArrangement *)self _canvasConnectionConstraintsNeedUpdatePass])return; {
  int v3 = [(_UILayoutArrangement *)self _propertySource];
  }
  int v4 = [v3 layoutUsesCanvasMarginsWhenFilling];
  id v5 = [(_UILayoutArrangement *)self canvas];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 layoutMarginsGuide];

    id v6 = (void *)v7;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69___UILayoutArrangement__updateCanvasConnectionConstraintsIfNecessary__block_invoke;
  aBlock[3] = &unk_1E530E498;
  aBlock[4] = self;
  id v8 = v6;
  id v52 = v8;
  BOOL v50 = (void (**)(void *, void *, int64_t, void *))_Block_copy(aBlock);
  BOOL v49 = [(_UILayoutArrangement *)self _usesCenteringConnectionConstraint];
  int64_t v9 = [(_UILayoutArrangement *)self _minAttributeForCanvasConnections];
  v44 = v8;
  if ((unint64_t)(v9 - 3) > 9) {
    int64_t v47 = 0;
  }
  else {
    int64_t v47 = qword_186B9DE78[v9 - 3];
  }
  int v10 = [v3 layoutFillsCanvas];
  int v11 = v10;
  if (v49) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2;
  }
  if (v10) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = 0;
  }
  unint64_t v14 = [(NSMutableArray *)self->_canvasConnectionConstraints count];
  unint64_t v15 = v14;
  if (v14 && v14 < v13)
  {
    [(_UILayoutArrangement *)self _clearCanvasConnectionConstraints];
    unint64_t v15 = 0;
  }
  if (self->_canvasConnectionConstraints) {
    int v16 = 0;
  }
  else {
    int v16 = v11;
  }
  if (v16 == 1)
  {
    uint64_t v17 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
    canvasConnectionConstraints = self->_canvasConnectionConstraints;
    self->_canvasConnectionConstraints = v17;
  }
  -[_UILayoutArrangement _viewOrGuideForLocationAttribute:](self, "_viewOrGuideForLocationAttribute:", v9, v13);
  v19 = (_UILayoutSpacer *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19) {
    BOOL v46 = v19 == self->_spanningLayoutGuide;
  }
  else {
    BOOL v46 = 0;
  }
  BOOL v21 = [(_UILayoutArrangement *)self _configurationRequiresCanvasConnectionFittingConstraint];
  unint64_t v48 = v15;
  v45 = v3;
  if (v11)
  {
    unint64_t v22 = 0;
    while (1)
    {
      if (v22 >= v15)
      {
        BOOL v23 = 0;
      }
      else
      {
        BOOL v23 = [(NSMutableArray *)self->_canvasConnectionConstraints objectAtIndex:v22];
      }
      uint64_t v24 = v50[2](v50, v23, v9, v20);
      uint64_t v25 = (void *)v24;
      if (v23)
      {
        if ((void *)v24 != v23) {
          [(NSMutableArray *)self->_canvasConnectionConstraints replaceObjectAtIndex:v22 withObject:v24];
        }
        if (!v21)
        {
LABEL_35:
          BOOL v21 = [v25 relation] != 0;
          goto LABEL_36;
        }
      }
      else
      {
        [(NSMutableArray *)self->_canvasConnectionConstraints addObject:v24];
        if (!v21) {
          goto LABEL_35;
        }
      }
      BOOL v21 = 1;
LABEL_36:
      if (v22) {
        BOOL v26 = v49;
      }
      else {
        BOOL v26 = 0;
      }
      if (v22) {
        int64_t v9 = 0;
      }
      else {
        int64_t v9 = v47;
      }
      if (v26) {
        int64_t v9 = [(_UILayoutArrangement *)self _centerAttributeForCanvasConnections];
      }
      if (v9)
      {
        v27 = [(_UILayoutArrangement *)self _viewOrGuideForLocationAttribute:v9];

        if (!v46 && v27 != 0) {
          BOOL v46 = v27 == self->_spanningLayoutGuide;
        }
      }
      else
      {

        v27 = 0;
      }

      ++v22;
      v20 = v27;
      unint64_t v15 = v48;
      if (v12 == v22) {
        goto LABEL_51;
      }
    }
  }
  v27 = v20;
LABEL_51:
  unint64_t v28 = v43;
  if (v21)
  {
    unint64_t v28 = v43 + 1;
    if (v15 == v43 + 1)
    {
      uint64_t v29 = [(NSMutableArray *)self->_canvasConnectionConstraints lastObject];
      int64_t v30 = [(_UILayoutArrangement *)self _dimensionAttributeForCurrentAxis];
      if (v29)
      {
        v31 = [v29 firstItem];
        v32 = [(_UILayoutArrangement *)self canvas];
        if (v31 == v32)
        {
          uint64_t v34 = [v29 firstAttribute];

          if (v34 == v30)
          {
LABEL_64:

            goto LABEL_65;
          }
        }
        else
        {
        }
        int v33 = 0;
LABEL_60:
        [v29 setActive:0];
        uint64_t v35 = (void *)MEMORY[0x1E4F5B268];
        v36 = [(_UILayoutArrangement *)self canvas];
        v37 = [v35 constraintWithItem:v36 attribute:v30 relatedBy:0 constant:0.0];

        LODWORD(v38) = 1111752704;
        [v37 setPriority:v38];
        [v37 setIdentifier:@"UISV-canvas-fit"];
        [v37 setActive:1];
        id v39 = self->_canvasConnectionConstraints;
        if (v33) {
          [(NSMutableArray *)v39 addObject:v37];
        }
        else {
          [(NSMutableArray *)v39 replaceObjectAtIndex:v48 - 1 withObject:v37];
        }

        goto LABEL_64;
      }
    }
    else
    {
      int64_t v30 = [(_UILayoutArrangement *)self _dimensionAttributeForCurrentAxis];
      uint64_t v29 = 0;
    }
    int v33 = 1;
    goto LABEL_60;
  }
LABEL_65:
  unint64_t v40 = [(NSMutableArray *)self->_canvasConnectionConstraints count];
  if (v40 > v28)
  {
    unint64_t v41 = v40;
    do
    {
      uint64_t v42 = [(NSMutableArray *)self->_canvasConnectionConstraints lastObject];
      [v42 setActive:0];
      [(NSMutableArray *)self->_canvasConnectionConstraints removeObjectAtIndex:--v41];
    }
    while (v41 > v28);
  }
  if (!v46) {
    [(_UILayoutArrangement *)self _removeSpanningLayoutGuide];
  }
}

- (id)_viewOrGuideForLocationAttribute:(int64_t)a3
{
  unint64_t v5 = -[_UILayoutArrangement _indexOfItemForLocationAttribute:](self, "_indexOfItemForLocationAttribute:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (([(NSMutableArray *)self->_mutableItems objectAtIndexedSubscript:v5],
         id v6 = objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? ([v6 _viewOrGuideForLocationAttribute:a3], id v7 = (id)objc_claimAutoreleasedReturnValue())
      : (id v7 = v6),
        id v8 = v7,
        v6,
        !v8))
  {
    id v8 = [(_UILayoutArrangement *)self _spanningLayoutGuideCreateIfNecessary];
  }
  return v8;
}

- (BOOL)_hasStaleConfiguration
{
  int v3 = [(_UILayoutArrangement *)self _configurationHistory];
  int v4 = [(_UILayoutArrangement *)self _propertySource];
  if (![(NSMutableSet *)self->_incomingItems count]
    && ![(NSMutableSet *)self->_outgoingItems count]
    && [v3 hasEstablishedBaseValues]
    && (uint64_t v5 = [v3 axis], v5 == objc_msgSend(v4, "axis"))
    && (int v6 = [v3 layoutFillsCanvas], v6 == objc_msgSend(v4, "layoutFillsCanvas"))
    && (![v4 layoutFillsCanvas]
     || (int v9 = [v3 layoutUsesCanvasMarginsWhenFilling],
         v9 == [v4 layoutUsesCanvasMarginsWhenFilling])))
  {
    int v10 = [v4 _newlyHiddenItems];
    if ([v10 count])
    {
      BOOL v7 = 1;
    }
    else
    {
      int v11 = [v4 _newlyUnhiddenItems];
      if ([v11 count])
      {
        BOOL v7 = 1;
      }
      else
      {
        uint64_t v12 = [v4 invalidBaselineConstraints];
        BOOL v7 = [v12 count] != 0;
      }
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)_updateConfigurationHistory
{
  id v14 = [(_UILayoutArrangement *)self _configurationHistory];
  int v3 = [(_UILayoutArrangement *)self _propertySource];
  if ([v14 isInLayoutArrangementUpdateSection])
  {
    [v14 setHasEstablishedBaseValues:1];
    objc_msgSend(v14, "setLayoutFillsCanvas:", objc_msgSend(v3, "layoutFillsCanvas"));
  }
  else
  {
    [(NSMutableSet *)self->_incomingItems removeAllObjects];
    [(NSMutableSet *)self->_outgoingItems removeAllObjects];
    int v4 = [v14 _newlyUnhiddenItems];
    [v4 removeAllObjects];

    uint64_t v5 = [v14 _newlyHiddenItems];
    [v5 removeAllObjects];

    int v6 = [v14 invalidBaselineConstraints];
    [v6 removeAllObjects];

    objc_msgSend(v14, "setAxis:", objc_msgSend(v3, "axis"));
    objc_msgSend(v14, "setLayoutUsesCanvasMarginsWhenFilling:", objc_msgSend(v3, "layoutUsesCanvasMarginsWhenFilling"));
    if (self->_unanimatedConfigurationTarget
      || (id v7 = objc_loadWeakRetained((id *)&self->_canvas),
          char v8 = [v7 _isInAnimatedLayout],
          v7,
          (v8 & 1) == 0))
    {
      [(_UILayoutArrangement *)self _setUnanimatedConfigurationTarget:0];
      if (self->_awaitingAnimationLayoutPass)
      {
        unint64_t v13 = [(_UILayoutArrangement *)self canvas];
        [v13 setNeedsLayout];
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
      if (WeakRetained)
      {
        int v10 = WeakRetained;
        id v11 = objc_loadWeakRetained((id *)&self->_canvas);
        int v12 = [v11 _isInAnimatedLayout];

        if (v12) {
          self->_awaitingAnimationLayoutPass = 0;
        }
      }
    }
    if (!self->_awaitingAnimationLayoutPass)
    {
      [(NSMutableSet *)self->_newlyHiddenItems removeAllObjects];
      [(NSMutableSet *)self->_newlyUnhiddenItems removeAllObjects];
      [(NSMutableSet *)self->_invalidBaselineConstraints removeAllObjects];
    }
  }
}

- (_UILAConfigurationHistory)_configurationHistory
{
  configurationHistory = self->_configurationHistory;
  if (!configurationHistory)
  {
    int v4 = (_UILAConfigurationHistory *)objc_alloc_init((Class)[(id)objc_opt_class() _configurationHistoryClass]);
    uint64_t v5 = self->_configurationHistory;
    self->_configurationHistory = v4;

    int v6 = [(_UILAConfigurationHistory *)self->_configurationHistory _newlyHiddenItems];
    [v6 unionSet:self->_newlyHiddenItems];

    id v7 = [(_UILAConfigurationHistory *)self->_configurationHistory _newlyUnhiddenItems];
    [v7 unionSet:self->_newlyUnhiddenItems];

    configurationHistory = self->_configurationHistory;
  }
  return configurationHistory;
}

- (BOOL)_itemWantsLayoutAsIfVisible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UILayoutArrangement *)self _propertySource];
  int v6 = objc_msgSend(v4, "_la_isVisible");
  int v7 = 0;
  int v8 = v6 ^ 1;
  if (((v6 ^ 1) & 1) == 0 && v5 != self)
  {
    int v9 = [(_UILayoutArrangement *)v5 _newlyUnhiddenItems];
    if ([v9 containsObject:v4])
    {
      int v7 = 0;
    }
    else
    {
      int v10 = [(_UILayoutArrangement *)self _newlyUnhiddenItems];
      int v7 = [v10 containsObject:v4];
    }
  }
  if (v5 == self) {
    char v11 = 1;
  }
  else {
    char v11 = v6;
  }
  if (v11)
  {
    char v12 = 0;
  }
  else
  {
    unint64_t v13 = [(_UILayoutArrangement *)v5 _newlyHiddenItems];
    if ([v13 containsObject:v4])
    {
      char v12 = 0;
    }
    else
    {
      id v14 = [(_UILayoutArrangement *)self _newlyHiddenItems];
      char v12 = [v14 containsObject:v4];
    }
  }
  if ((v8 | v7) == 1) {
    char v15 = v8 & v12;
  }
  else {
    char v15 = 1;
  }

  return v15;
}

- (_UILAPropertySource)_propertySource
{
  p_canvas = &self->_canvas;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  if (WeakRetained
    && (uint64_t v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_canvas),
        char v7 = [v6 _isInAnimatedLayout],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    unanimatedConfigurationTarget = self;
  }
  else
  {
    unanimatedConfigurationTarget = self->_unanimatedConfigurationTarget;
    if (!unanimatedConfigurationTarget) {
      unanimatedConfigurationTarget = self->_configurationHistory;
    }
  }
  return (_UILAPropertySource *)unanimatedConfigurationTarget;
}

- (NSSet)_newlyUnhiddenItems
{
  return (NSSet *)self->_newlyUnhiddenItems;
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)_setUnanimatedConfigurationTarget:(id)a3
{
}

- (BOOL)_canvasConnectionConstraintsNeedUpdatePass
{
  int v3 = [(_UILayoutArrangement *)self _propertySource];
  if (![(_UILAConfigurationHistory *)self->_configurationHistory hasEstablishedBaseValues]
    && [v3 layoutFillsCanvas]
    && [(NSMutableArray *)self->_mutableItems count])
  {
    goto LABEL_10;
  }
  if (![(_UILAConfigurationHistory *)self->_configurationHistory hasEstablishedBaseValues])
  {
    BOOL v7 = 0;
    goto LABEL_12;
  }
  int v4 = [(_UILAConfigurationHistory *)self->_configurationHistory layoutFillsCanvas];
  if (v4 == [v3 layoutFillsCanvas]
    && (int v5 = -[_UILAConfigurationHistory layoutUsesCanvasMarginsWhenFilling](self->_configurationHistory, "layoutUsesCanvasMarginsWhenFilling"), v5 == [v3 layoutUsesCanvasMarginsWhenFilling])&& (v6 = -[_UILAConfigurationHistory axis](self->_configurationHistory, "axis"), v6 == objc_msgSend(v3, "axis"))&& !-[NSMutableSet count](self->_incomingItems, "count")&& !-[NSMutableSet count](self->_outgoingItems, "count"))
  {
    int v9 = [v3 _newlyUnhiddenItems];
    if ([v9 count])
    {
      BOOL v7 = 1;
    }
    else
    {
      int v10 = [v3 _newlyHiddenItems];
      BOOL v7 = [v10 count] != 0;
    }
  }
  else
  {
LABEL_10:
    BOOL v7 = 1;
  }
LABEL_12:

  return v7;
}

- (NSSet)_newlyHiddenItems
{
  return (NSSet *)self->_newlyHiddenItems;
}

- (int64_t)_dimensionAttributeForCurrentAxis
{
  if ([(_UILayoutArrangement *)self _axisForSpanningLayoutGuide]) {
    return 8;
  }
  else {
    return 7;
  }
}

- (id)_spanningLayoutGuideCreateIfNecessary
{
  spanningLayoutGuide = self->_spanningLayoutGuide;
  if (!spanningLayoutGuide)
  {
    [(_UILayoutArrangement *)self _createSpanningLayoutGuide];
    [(_UILayoutArrangement *)self _updateSpanningLayoutGuideConstraintsIfNecessary];
    spanningLayoutGuide = self->_spanningLayoutGuide;
  }
  return spanningLayoutGuide;
}

- (int64_t)_minAttributeForCanvasConnections
{
  if ([(_UILayoutArrangement *)self _axisForSpanningLayoutGuide]) {
    return 3;
  }
  else {
    return 5;
  }
}

- (void)_clearAllConstraintsArrays
{
  [(_UILayoutArrangement *)self _removeSpanningLayoutGuide];
  [(_UILayoutArrangement *)self _clearCanvasConnectionConstraints];
}

- (void)_removeSpanningLayoutGuide
{
  spanningLayoutGuide = self->_spanningLayoutGuide;
  if (spanningLayoutGuide)
  {
    [(UILayoutGuide *)spanningLayoutGuide _setLockedToOwningView:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    [WeakRetained removeLayoutGuide:self->_spanningLayoutGuide];

    int v5 = self->_spanningLayoutGuide;
    self->_spanningLayoutGuide = 0;
  }
}

- (int64_t)_axisForSpanningLayoutGuide
{
  v2 = [(_UILayoutArrangement *)self _propertySource];
  int64_t v3 = [v2 axis];

  return v3;
}

- (int64_t)_centerAttributeForCanvasConnections
{
  if ([(_UILayoutArrangement *)self _axisForSpanningLayoutGuide]) {
    return 10;
  }
  else {
    return 9;
  }
}

- (BOOL)_usesCenteringConnectionConstraint
{
  return 0;
}

- (BOOL)_configurationRequiresCanvasConnectionFittingConstraint
{
  return 0;
}

- (BOOL)_usesInequalitySpanningConstraintForAttribute:(int64_t)a3
{
  return 0;
}

- (BOOL)layoutFillsCanvas
{
  return self->_layoutFillsCanvas;
}

- (BOOL)layoutUsesCanvasMarginsWhenFilling
{
  return self->_layoutUsesCanvasMarginsWhenFilling;
}

- (void)_createSpanningLayoutGuide
{
  if ([(_UILayoutArrangement *)self _axisForSpanningLayoutGuide]) {
    +[_UILayoutSpacer _verticalLayoutSpacer];
  }
  else {
  int64_t v3 = +[_UILayoutSpacer _horizontalLayoutSpacer];
  }
  spanningLayoutGuide = self->_spanningLayoutGuide;
  self->_spanningLayoutGuide = v3;

  int v5 = [(_UILayoutArrangement *)self _identifierForSpanningLayoutGuide];
  [(UILayoutGuide *)self->_spanningLayoutGuide setIdentifier:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_canvas);
    [v7 addLayoutGuide:self->_spanningLayoutGuide];

    int v8 = self->_spanningLayoutGuide;
    [(UILayoutGuide *)v8 _setLockedToOwningView:1];
  }
}

- (void)insertItem:(id)a3 atIndex:(unint64_t)a4
{
  id v24 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || [(NSMutableArray *)self->_mutableItems count] < a4)
  {
    BOOL v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"_UILayoutArrangement.m" lineNumber:462 description:@"index for item in layout arrangement is out of bounds"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v24;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    if (WeakRetained)
    {
      int v10 = WeakRetained;
      id v11 = objc_loadWeakRetained((id *)&self->_canvas);
      char v12 = [v8 isDescendantOfView:v11];

      if ((v12 & 1) == 0)
      {
        p_mutableItems = &self->_mutableItems;
        [(NSMutableArray *)self->_mutableItems insertObject:v8 atIndex:a4];
        id v19 = v8;
        v18 = v24;
        if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_18;
        }
        uint64_t v20 = [(NSMutableArray *)*p_mutableItems indexOfObject:v19];
        v18 = v24;
        if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_18;
        }
        uint64_t v15 = v20;
        int v17 = 1;
        v18 = v24;
        goto LABEL_16;
      }
    }
    p_mutableItems = &self->_mutableItems;
    uint64_t v14 = [(NSMutableArray *)self->_mutableItems indexOfObject:v8];
    if (v14 != a4)
    {
      uint64_t v15 = v14;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v16 = v8;
        int v17 = 0;
        v18 = v24;
        goto LABEL_17;
      }
      v18 = 0;
      int v17 = 0;
LABEL_16:
      [(NSMutableArray *)*p_mutableItems removeObjectAtIndex:v15];
LABEL_17:
      [(NSMutableArray *)*p_mutableItems insertObject:v8 atIndex:(void)((__PAIR128__(a4, [(NSMutableArray *)*p_mutableItems count]) - a4) >> 64)];
      if (!v17)
      {
LABEL_19:
        if (objc_msgSend(v18, "_la_isVisible")) {
          unint64_t v22 = 0;
        }
        else {
          unint64_t v22 = v18;
        }
        [(_UILayoutArrangement *)self _respondToChangesWithIncomingItem:v18 outgoingItem:0 newlyHiddenItem:v22 newlyUnhiddenItem:0];

        goto LABEL_23;
      }
LABEL_18:
      id v21 = objc_loadWeakRetained((id *)&self->_canvas);
      [v21 addSubview:v8];

      goto LABEL_19;
    }
  }
LABEL_23:
}

- (void)_trackChangesWithConfigBlock:(id)a3
{
  int64_t v6 = (void (**)(id, _UILAConfigurationHistory *))a3;
  [(_UILayoutArrangement *)self _createUnanimatedConfigurationTargetIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  BOOL v5 = _UILAIsAnimatingOnCanvas(WeakRetained);

  if (v5) {
    [(_UILayoutArrangement *)self _registerAnimationRequest];
  }
  else {
    v6[2](v6, self->_unanimatedConfigurationTarget);
  }
  [(_UILayoutArrangement *)self _respondToChangesWithIncomingItem:0 outgoingItem:0 newlyHiddenItem:0 newlyUnhiddenItem:0];
}

- (void)_respondToChangesWithIncomingItem:(id)a3 outgoingItem:(id)a4 newlyHiddenItem:(id)a5 newlyUnhiddenItem:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = (unint64_t)a5;
  unint64_t v13 = (unint64_t)a6;
  [(_UILayoutArrangement *)self _createUnanimatedConfigurationTargetIfNecessary];
  p_canvas = &self->_canvas;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  BOOL v16 = _UILAIsAnimatingOnCanvas(WeakRetained);

  if (v11)
  {
    [v11 _decrementHiddenManagedByLayoutArrangementCount];
    [(NSMutableSet *)self->_outgoingItems addObject:v11];
    [(NSMutableSet *)self->_incomingItems removeObject:v11];
    [(NSMutableSet *)self->_hiddenItems removeObject:v11];
    int v17 = [(_UILAConfigurationHistory *)self->_unanimatedConfigurationTarget _newlyHiddenItems];
    [v17 removeObject:v11];

    [(NSMutableSet *)self->_newlyHiddenItems removeObject:v11];
    if ([(_UILayoutArrangement *)self _requiresNotificationForHasBaselinePropertyChanges])
    {
      v18 = [v11 _viewForLoweringBaselineLayoutAttribute:11];
      if (v18)
      {
        id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v19 removeObserver:self name:@"_UIViewHasBaselinePropertyChanged" object:v18];
      }
    }
  }
  if (v10)
  {
    [v10 _incrementHiddenManagedByLayoutArrangementCount];
    [(NSMutableSet *)self->_incomingItems addObject:v10];
    [(NSMutableSet *)self->_outgoingItems removeObject:v10];
    if ((objc_msgSend(v10, "_la_isVisible") & 1) == 0)
    {
      [(NSMutableSet *)self->_hiddenItems addObject:v10];
      uint64_t v20 = [(_UILAConfigurationHistory *)self->_unanimatedConfigurationTarget _newlyHiddenItems];
      [v20 addObject:v10];

      [(NSMutableSet *)self->_newlyHiddenItems addObject:v10];
    }
    if ([(_UILayoutArrangement *)self _requiresNotificationForHasBaselinePropertyChanges])
    {
      id v21 = [v10 _viewForLoweringBaselineLayoutAttribute:11];
      if ([v21 _isHasBaselinePropertyChangeable])
      {
        unint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v22 addObserver:self selector:sel__hasBaselineChangedNotification_ name:@"_UIViewHasBaselinePropertyChanged" object:v21];
      }
      BOOL v23 = [v10 _viewForLoweringBaselineLayoutAttribute:12];
      id v24 = v23;
      if (v23 != v21 && [v23 _isHasBaselinePropertyChangeable])
      {
        uint64_t v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v25 addObserver:self selector:sel__hasBaselineChangedNotification_ name:@"_UIViewHasBaselinePropertyChanged" object:v24];
      }
    }
  }
  if (v12 | v13)
  {
    if (v16) {
      [(_UILayoutArrangement *)self _registerAnimationRequest];
    }
    if (v12)
    {
      [(NSMutableSet *)self->_newlyHiddenItems addObject:v12];
      [(NSMutableSet *)self->_newlyUnhiddenItems removeObject:v12];
      if (v16)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __105___UILayoutArrangement__respondToChangesWithIncomingItem_outgoingItem_newlyHiddenItem_newlyUnhiddenItem___block_invoke;
        v32[3] = &unk_1E52D9F70;
        id v33 = (id)v12;
        +[UIViewAnimationState _addSystemPostAnimationAction:v32];

        goto LABEL_26;
      }
      int64_t v30 = [(_UILAConfigurationHistory *)self->_unanimatedConfigurationTarget _newlyHiddenItems];
      [v30 addObject:v12];

      v27 = [(_UILAConfigurationHistory *)self->_unanimatedConfigurationTarget _newlyUnhiddenItems];
      unint64_t v28 = v27;
      unint64_t v29 = v12;
    }
    else
    {
      [(NSMutableSet *)self->_newlyUnhiddenItems addObject:v13];
      [(NSMutableSet *)self->_newlyHiddenItems removeObject:v13];
      if (v16) {
        goto LABEL_26;
      }
      BOOL v26 = [(_UILAConfigurationHistory *)self->_unanimatedConfigurationTarget _newlyUnhiddenItems];
      [v26 addObject:v13];

      v27 = [(_UILAConfigurationHistory *)self->_unanimatedConfigurationTarget _newlyHiddenItems];
      unint64_t v28 = v27;
      unint64_t v29 = v13;
    }
    [v27 removeObject:v29];
  }
LABEL_26:
  id v31 = objc_loadWeakRetained((id *)p_canvas);
  [v31 setNeedsUpdateConstraints];
}

- (void)_createUnanimatedConfigurationTargetIfNecessary
{
  if (!self->_unanimatedConfigurationTarget)
  {
    id v5 = [(_UILayoutArrangement *)self _configurationHistory];
    int64_t v3 = (_UILAConfigurationHistory *)[v5 copy];
    unanimatedConfigurationTarget = self->_unanimatedConfigurationTarget;
    self->_unanimatedConfigurationTarget = v3;
  }
}

- (BOOL)_requiresNotificationForHasBaselinePropertyChanges
{
  return 0;
}

- (void)_registerAnimationRequest
{
  p_canvas = &self->_canvas;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_canvas);
    +[UIViewAnimationState _addViewForConstraintBasedAnimation:v5];

    self->_awaitingAnimationLayoutPass = 1;
  }
}

- (void)_setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3 notify:(BOOL)a4
{
  if (self->_layoutUsesCanvasMarginsWhenFilling != a3)
  {
    BOOL v4 = a4;
    self->_layoutUsesCanvasMarginsWhenFilling = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70___UILayoutArrangement__setLayoutUsesCanvasMarginsWhenFilling_notify___block_invoke;
    v7[3] = &__block_descriptor_33_e35_v16__0___UILAConfigurationHistory_8l;
    BOOL v8 = a3;
    [(_UILayoutArrangement *)self _trackChangesWithConfigBlock:v7];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
      _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(WeakRetained);
    }
  }
}

- (NSSet)_outgoingItems
{
  return (NSSet *)self->_outgoingItems;
}

- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3
{
  BOOL v4 = [(_UILayoutArrangement *)self _mutableItems];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    while (1)
    {
      BOOL v8 = [v4 objectAtIndexedSubscript:v7];
      BOOL v9 = [(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v8];

      if (v9) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSMutableArray)_mutableItems
{
  return self->_mutableItems;
}

- (UIView)canvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  return (UIView *)WeakRetained;
}

- (NSSet)_hiddenItems
{
  return (NSSet *)self->_hiddenItems;
}

- (void)setCanvas:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  p_canvas = &self->_canvas;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);

  if (WeakRetained != v4)
  {
    unint64_t v7 = self;
    id v8 = objc_loadWeakRetained((id *)p_canvas);
    -[UIView _removeLayoutArrangement:](v8, v7);

    -[UIView _addLayoutArrangement:](v4, v7);
    objc_storeWeak((id *)p_canvas, v4);
    [(_UILayoutArrangement *)v7 _clearAllConstraintsArrays];
    id v9 = objc_loadWeakRetained((id *)p_canvas);

    if (v9)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v7->_mutableItems;
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
            id v16 = objc_loadWeakRetained((id *)p_canvas);
            char v17 = objc_msgSend(v15, "isDescendantOfView:", v16, (void)v19);

            if ((v17 & 1) == 0)
            {
              id v18 = objc_loadWeakRetained((id *)p_canvas);
              [v18 addSubview:v15];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
    }
    -[_UILayoutArrangement _respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:](v7, "_respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:", 0, 0, 0, 0, (void)v19);
  }
}

- (void)_setLayoutFillsCanvas:(BOOL)a3 notify:(BOOL)a4
{
  if (self->_layoutFillsCanvas != a3)
  {
    BOOL v4 = a4;
    self->_layoutFillsCanvas = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53___UILayoutArrangement__setLayoutFillsCanvas_notify___block_invoke;
    v7[3] = &__block_descriptor_33_e35_v16__0___UILAConfigurationHistory_8l;
    BOOL v8 = a3;
    [(_UILayoutArrangement *)self _trackChangesWithConfigBlock:v7];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
      _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(WeakRetained);
    }
  }
}

- (BOOL)_monitorsSystemLayoutFittingSizeForItem:(id)a3
{
  return 0;
}

- (_UILayoutArrangement)initWithItems:(id)a3 onAxis:(int64_t)a4
{
  result = [(_UILayoutArrangement *)self initWithItems:a3];
  if (result) {
    result->_axis = a4;
  }
  return result;
}

- (_UILayoutArrangement)initWithItems:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UILayoutArrangement;
  uint64_t v5 = [(_UILayoutArrangement *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    mutableItems = v5->_mutableItems;
    v5->_mutableItems = (NSMutableArray *)v6;

    uint64_t v8 = [(NSMutableArray *)v5->_mutableItems mutableCopy];
    incomingItems = v5->_incomingItems;
    v5->_incomingItems = (NSMutableSet *)v8;

    id v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    outgoingItems = v5->_outgoingItems;
    v5->_outgoingItems = v10;

    uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hiddenItems = v5->_hiddenItems;
    v5->_hiddenItems = v12;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v27 + 1) + 8 * v18);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v20 = v19;
          }
          else {
            long long v20 = 0;
          }
          id v21 = v20;
          objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0, (void)v27);
          if ((objc_msgSend(v21, "_la_isVisible") & 1) == 0) {
            [(NSMutableSet *)v5->_hiddenItems addObject:v19];
          }
          [v21 _incrementHiddenManagedByLayoutArrangementCount];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v16);
    }

    uint64_t v22 = [(NSMutableSet *)v5->_hiddenItems mutableCopy];
    newlyHiddenItems = v5->_newlyHiddenItems;
    v5->_newlyHiddenItems = (NSMutableSet *)v22;

    uint64_t v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    newlyUnhiddenItems = v5->_newlyUnhiddenItems;
    v5->_newlyUnhiddenItems = v24;
  }
  return v5;
}

- (void)_clearCanvasConnectionConstraints
{
  if (self->_canvasConnectionConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    canvasConnectionConstraints = self->_canvasConnectionConstraints;
    self->_canvasConnectionConstraints = 0;
  }
}

- (void)removeItem:(id)a3
{
  id v8 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_mutableItems, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    objc_opt_class();
    id v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
    id v7 = v6;
    [(NSMutableArray *)self->_mutableItems removeObjectAtIndex:v5];
    if (v7)
    {
      [(_UILayoutArrangement *)self _respondToChangesWithIncomingItem:0 outgoingItem:v7 newlyHiddenItem:0 newlyUnhiddenItem:0];
    }
  }
}

- (void)_hasBaselineChangedNotificationRequirementDidChange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(_UILayoutArrangement *)self _requiresNotificationForHasBaselinePropertyChanges])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int64_t v3 = [(_UILayoutArrangement *)self items];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v9 = [v8 _viewForLoweringBaselineLayoutAttribute:11];
          if ([v9 _isHasBaselinePropertyChangeable])
          {
            id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v10 addObserver:self selector:sel__hasBaselineChangedNotification_ name:@"_UIViewHasBaselinePropertyChanged" object:v9];
          }
          uint64_t v11 = [v8 _viewForLoweringBaselineLayoutAttribute:12];
          uint64_t v12 = v11;
          if (v11 != v9)
          {
            if ([v11 _isHasBaselinePropertyChangeable])
            {
              uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
              [v13 addObserver:self selector:sel__hasBaselineChangedNotification_ name:@"_UIViewHasBaselinePropertyChanged" object:v12];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 removeObserver:self name:@"_UIViewHasBaselinePropertyChanged" object:0];
  }
}

- (_UILAConfigurationHistory)_unanimatedConfigurationTarget
{
  return self->_unanimatedConfigurationTarget;
}

- (float)_spanningLayoutGuideFittingPriority
{
  BOOL v2 = [(_UILayoutArrangement *)self _allItemsHidden];
  float result = 51.0;
  if (v2) {
    return 0.001;
  }
  return result;
}

- (BOOL)_allItemsHidden
{
  int64_t v3 = [(_UILayoutArrangement *)self items];
  if ([v3 count])
  {
    uint64_t v4 = [(_UILayoutArrangement *)self items];
    uint64_t v5 = [v4 count];
    uint64_t v6 = [(_UILayoutArrangement *)self _hiddenItems];
    BOOL v7 = v5 == [v6 count];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)addItem:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = v8;
  if (v8 && (isKindOfClass & 1) != 0)
  {
    mutableItems = self->_mutableItems;
    id v7 = v8;
    [(_UILayoutArrangement *)self insertItem:v7 atIndex:[(NSMutableArray *)mutableItems count]];

    uint64_t v5 = v8;
  }
}

- (NSArray)items
{
  BOOL v2 = (void *)[(NSMutableArray *)self->_mutableItems copy];
  return (NSArray *)v2;
}

- (void)_setAxis:(int64_t)a3 notify:(BOOL)a4
{
  if (self->_axis != a3)
  {
    BOOL v4 = a4;
    self->_axis = a3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40___UILayoutArrangement__setAxis_notify___block_invoke;
    v8[3] = &__block_descriptor_40_e35_v16__0___UILAConfigurationHistory_8l;
    v8[4] = a3;
    [(_UILayoutArrangement *)self _trackChangesWithConfigBlock:v8];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
      _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(WeakRetained);
    }
    id v7 = objc_loadWeakRetained((id *)&self->_canvas);
    [v7 _vendedBaselineViewParametersDidChange];
  }
}

- (BOOL)_spanningGuideConstraintsNeedUpdate
{
  int64_t v3 = [(_UILayoutArrangement *)self _propertySource];
  if ([(NSMutableSet *)self->_incomingItems count] || [(NSMutableSet *)self->_outgoingItems count])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v6 = [v3 _newlyUnhiddenItems];
    if ([v6 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v7 = [v3 _newlyHiddenItems];
      if ([v7 count])
      {
        BOOL v4 = 1;
      }
      else
      {
        id v8 = [(UILayoutGuide *)self->_spanningLayoutGuide _systemConstraints];
        if ([v8 count])
        {
          int64_t v9 = [(_UILAConfigurationHistory *)self->_configurationHistory axis];
          BOOL v4 = v9 != [v3 axis];
        }
        else
        {
          BOOL v4 = 1;
        }
      }
    }
  }
  return v4;
}

- (void)_visibilityParameterChangedForItem:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(NSMutableArray *)self->_mutableItems indexOfObject:v9];
  uint64_t v5 = v9;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v6 = objc_msgSend(v9, "_la_isVisible");
    int v7 = [(NSMutableSet *)self->_hiddenItems containsObject:v9];
    int v8 = v7;
    if (v6 && v7)
    {
      [(NSMutableSet *)self->_hiddenItems removeObject:v9];
      [(_UILayoutArrangement *)self _respondToChangesWithIncomingItem:0 outgoingItem:0 newlyHiddenItem:0 newlyUnhiddenItem:v9];
    }
    uint64_t v5 = v9;
    if (((v6 | v8) & 1) == 0)
    {
      [(NSMutableSet *)self->_hiddenItems addObject:v9];
      [(_UILayoutArrangement *)self _respondToChangesWithIncomingItem:0 outgoingItem:0 newlyHiddenItem:v9 newlyUnhiddenItem:0];
      uint64_t v5 = v9;
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_canvas);
  objc_storeStrong((id *)&self->_configurationHistory, 0);
  objc_storeStrong((id *)&self->_spanningLayoutGuide, 0);
  objc_storeStrong((id *)&self->_mutableItems, 0);
  objc_storeStrong((id *)&self->_unanimatedConfigurationTarget, 0);
  objc_storeStrong((id *)&self->_canvasConnectionConstraints, 0);
  objc_storeStrong((id *)&self->_invalidBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_newlyUnhiddenItems, 0);
  objc_storeStrong((id *)&self->_newlyHiddenItems, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_outgoingItems, 0);
  objc_storeStrong((id *)&self->_incomingItems, 0);
}

+ (Class)_configurationHistoryClass
{
  return 0;
}

- (id)_identifierForSpanningLayoutGuide
{
  return @"UISV-arrangement";
}

- (void)setAxis:(int64_t)a3
{
}

- (void)setLayoutFillsCanvas:(BOOL)a3
{
}

- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3
{
}

- (_UILayoutArrangement)init
{
  int64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = [NSString stringWithUTF8String:"-[_UILayoutArrangement init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (void)_invalidateBaselineConstraint:(id)a3
{
  id v4 = a3;
  invalidBaselineConstraints = self->_invalidBaselineConstraints;
  id v8 = v4;
  if (!invalidBaselineConstraints)
  {
    int v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v7 = self->_invalidBaselineConstraints;
    self->_invalidBaselineConstraints = v6;

    id v4 = v8;
    invalidBaselineConstraints = self->_invalidBaselineConstraints;
  }
  [(NSMutableSet *)invalidBaselineConstraints addObject:v4];
}

- (void)_hasBaselineChangedNotification:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(_UILayoutArrangement *)self _requiresNotificationForHasBaselinePropertyChanges])
  {
    if (os_variant_has_internal_diagnostics())
    {
      long long v15 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        goto LABEL_19;
      }
      long long v16 = [(_UILayoutArrangement *)self canvas];
      long long v17 = [(_UILayoutArrangement *)self canvas];
      long long v18 = [v17 constraints];
      *(_DWORD *)buf = 138412546;
      long long v30 = v16;
      __int16 v31 = 2112;
      v32 = v18;
      _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Layout arrangement received undesired -_hasBaselineChangedNotification for stackView. This is a UIStackView bug.\n UIStackView = %@,\n cosntraints = %@", buf, 0x16u);
    }
    else
    {
      id v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_hasBaselineChangedNotification____s_category) + 8);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_20:
        id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v6 removeObserver:self name:@"_UIViewHasBaselinePropertyChanged" object:0];
        goto LABEL_14;
      }
      long long v15 = v14;
      long long v16 = [(_UILayoutArrangement *)self canvas];
      long long v17 = [(_UILayoutArrangement *)self canvas];
      long long v18 = [v17 constraints];
      *(_DWORD *)buf = 138412546;
      long long v30 = v16;
      __int16 v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Layout arrangement received undesired -_hasBaselineChangedNotification for stackView. This is a UIStackView bug.\n UIStackView = %@,\n cosntraints = %@", buf, 0x16u);
    }

LABEL_19:
    goto LABEL_20;
  }
  uint64_t v5 = [v4 object];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  uint64_t v24 = __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke;
  uint64_t v25 = &unk_1E530E428;
  id v6 = v5;
  id v26 = v6;
  long long v27 = self;
  int v7 = [(_UILayoutArrangement *)self _baselineDependentConstraints];
  if ([v7 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 |= v24((uint64_t)v23, *(void **)(*((void *)&v19 + 1) + 8 * i));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v10);

      if ((v11 & 1) == 0) {
        goto LABEL_13;
      }
      id v8 = [(_UILayoutArrangement *)self canvas];
      [v8 setNeedsUpdateConstraints];
    }
  }
LABEL_13:

LABEL_14:
}

- (id)_baselineDependentConstraints
{
  return 0;
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)_UILayoutArrangement;
  int64_t v3 = [(_UILayoutArrangement *)&v13 description];
  if (os_variant_has_internal_diagnostics())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    id v6 = objc_msgSend(v3, "stringByAppendingFormat:", @" stackView=%p", WeakRetained);

    if ([(NSMutableSet *)self->_incomingItems count])
    {
      uint64_t v7 = objc_msgSend(v6, "stringByAppendingFormat:", @" incomingItems=%p", self->_incomingItems);

      id v6 = (void *)v7;
    }
    if ([(NSMutableSet *)self->_outgoingItems count])
    {
      uint64_t v8 = objc_msgSend(v6, "stringByAppendingFormat:", @" outgoingItems=%p", self->_outgoingItems);

      id v6 = (void *)v8;
    }
    if ([(NSMutableSet *)self->_hiddenItems count])
    {
      uint64_t v9 = objc_msgSend(v6, "stringByAppendingFormat:", @" hiddenItems=%p", self->_hiddenItems);

      id v6 = (void *)v9;
    }
    if ([(NSMutableSet *)self->_newlyHiddenItems count])
    {
      uint64_t v10 = objc_msgSend(v6, "stringByAppendingFormat:", @" newlyHiddenItems=%p", self->_newlyHiddenItems);

      id v6 = (void *)v10;
    }
    if ([(NSMutableSet *)self->_newlyUnhiddenItems count])
    {
      uint64_t v11 = objc_msgSend(v6, "stringByAppendingFormat:", @" newlyUnhiddenItems=%p", self->_newlyUnhiddenItems);

      id v6 = (void *)v11;
    }
    if ([(NSMutableSet *)self->_invalidBaselineConstraints count])
    {
      uint64_t v12 = objc_msgSend(v6, "stringByAppendingFormat:", @" invalidBaselineConstraints=%p", self->_invalidBaselineConstraints);

      id v6 = (void *)v12;
    }
    if ([(NSMutableArray *)self->_canvasConnectionConstraints count])
    {
      int64_t v3 = objc_msgSend(v6, "stringByAppendingFormat:", @" canvasConnectionConstraints=%p", self->_canvasConnectionConstraints);
    }
    else
    {
      int64_t v3 = v6;
    }
  }
  return (NSString *)v3;
}

- (void)_setMutableItems:(id)a3
{
}

@end