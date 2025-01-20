@interface _UIAlignedLayoutArrangement
+ (Class)_configurationHistoryClass;
- (BOOL)_canvasConnectionConstraintsNeedUpdatePass;
- (BOOL)_hasStaleConfiguration;
- (BOOL)_requiresNotificationForHasBaselinePropertyChanges;
- (BOOL)_spanningGuideConstraintsNeedUpdate;
- (BOOL)_usesCenteringConnectionConstraint;
- (BOOL)_usesInequalitySpanningConstraintForAttribute:(int64_t)a3;
- (BOOL)_wantsAmbiguitySuppressionConstraints;
- (BOOL)_wantsConstraintsForAttribute:(int64_t)a3;
- (BOOL)_wantsConstraintsUsingAttributesForAxis:(int64_t)a3;
- (NSString)description;
- (_UIAlignedLayoutArrangement)initWithItems:(id)a3;
- (id)_baselineDependentConstraints;
- (id)_identifierForSpanningLayoutGuide;
- (int64_t)_attributeForConstraintGroupName:(id)a3;
- (int64_t)_axisForSpanningLayoutGuide;
- (int64_t)_layoutRelationForCanvasConnectionForAttribute:(int64_t)a3;
- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3;
- (unint64_t)alignment;
- (void)_addConstraintGroupsAsNecessary;
- (void)_addIndividualConstraintsIfPossible;
- (void)_clearAllConstraintsArrays;
- (void)_removeConstraintGroupsAsNecessary;
- (void)_removeIndividualConstraintsAsNecessary;
- (void)_setUpConstraintForItem:(id)a3 referenceItem:(id)a4 attribute:(int64_t)a5 inConstraintsTable:(id)a6;
- (void)_updateArrangementConstraints;
- (void)_updateConfigurationHistory;
- (void)dealloc;
- (void)setAlignment:(unint64_t)a3;
- (void)setAxis:(int64_t)a3;
- (void)setLayoutFillsCanvas:(BOOL)a3;
- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3;
@end

@implementation _UIAlignedLayoutArrangement

- (int64_t)_layoutRelationForCanvasConnectionForAttribute:(int64_t)a3
{
  v5 = -[_UILayoutArrangement _viewOrGuideForLocationAttribute:](self, "_viewOrGuideForLocationAttribute:");
  v6 = [(_UILayoutArrangement *)self _spanningLayoutGuide];

  int64_t result = 0;
  if ((unint64_t)(a3 - 11) <= 0xFFFFFFFFFFFFFFFDLL && v5 != v6)
  {
    if ([(_UIAlignedLayoutArrangement *)self _usesInequalitySpanningConstraintForAttribute:a3])
    {
      if (a3 > 0x25) {
        return -1;
      }
      else {
        return qword_186B9DD40[(int)a3];
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)_usesInequalitySpanningConstraintForAttribute:(int64_t)a3
{
  v5 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  char v6 = [v5 alignment];

  switch(a3)
  {
    case 3:
      BOOL v7 = (v6 & 8) == 0;
      goto LABEL_7;
    case 4:
      BOOL v7 = (v6 & 0x10) == 0;
      goto LABEL_7;
    case 5:
      BOOL v7 = (v6 & 0x20) == 0;
      goto LABEL_7;
    case 6:
      BOOL v7 = (v6 & 0x40) == 0;
LABEL_7:
      BOOL result = v7;
      break;
    default:
      v9.receiver = self;
      v9.super_class = (Class)_UIAlignedLayoutArrangement;
      BOOL result = [(_UILayoutArrangement *)&v9 _usesInequalitySpanningConstraintForAttribute:a3];
      break;
  }
  return result;
}

- (void)_addIndividualConstraintsIfPossible
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIAlignedLayoutArrangement *)self _alignmentConfigurationHistory];
  v4 = [(_UILayoutArrangement *)self _incomingItems];
  if ([v3 hasEstablishedAlignmentValues])
  {
    v5 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
    if ([v4 count])
    {
      alignmentConstraints = self->_alignmentConstraints;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __66___UIAlignedLayoutArrangement__addIndividualConstraintsIfPossible__block_invoke;
      v42[3] = &unk_1E530E370;
      v42[4] = self;
      id v43 = v4;
      [(NSMutableDictionary *)alignmentConstraints enumerateKeysAndObjectsUsingBlock:v42];
    }
    if ([(_UIAlignedLayoutArrangement *)self _wantsConstraintsForAttribute:12]
      || [(_UIAlignedLayoutArrangement *)self _wantsConstraintsForAttribute:11])
    {
      v27 = v4;
      v28 = v3;
      [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v26 = long long v41 = 0u;
      BOOL v7 = _constraintGroupNamesForAlignmentOptions([v26 alignment], objc_msgSend(v26, "axis"));
      uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v45 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v39;
        uint64_t v29 = *(void *)v39;
        v30 = v7;
        do
        {
          uint64_t v11 = 0;
          uint64_t v31 = v9;
          do
          {
            if (*(void *)v39 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * v11);
            v13 = [*(id *)((char *)&self->super.super.isa + v5[805]) objectForKey:v12];
            v14 = [(_UILayoutArrangement *)self items];
            uint64_t v15 = [v14 count];
            if (v15 && [v13 count] < (unint64_t)(v15 - 1))
            {
              uint64_t v32 = v11;
              v33 = v14;
              v16 = [v13 objectEnumerator];
              v17 = [v16 nextObject];
              v18 = [v17 firstItem];

              if (v18)
              {
                long long v36 = 0u;
                long long v37 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                id v19 = v33;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v44 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v35;
                  do
                  {
                    for (uint64_t i = 0; i != v21; ++i)
                    {
                      if (*(void *)v35 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                      if (v24 != v18)
                      {
                        v25 = [v13 objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * i)];

                        if (!v25) {
                          [(_UIAlignedLayoutArrangement *)self _setUpConstraintForItem:v24 referenceItem:v18 attribute:[(_UIAlignedLayoutArrangement *)self _attributeForConstraintGroupName:v12] inConstraintsTable:v13];
                        }
                      }
                    }
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v44 count:16];
                  }
                  while (v21);
                }

                v5 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
                uint64_t v10 = v29;
                BOOL v7 = v30;
                uint64_t v9 = v31;
              }

              uint64_t v11 = v32;
              v14 = v33;
            }

            ++v11;
          }
          while (v11 != v9);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v45 count:16];
        }
        while (v9);
      }

      v4 = v27;
      v3 = v28;
    }
  }
}

- (void)_removeIndividualConstraintsAsNecessary
{
  v2 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIAlignedLayoutArrangement *)self _alignmentConfigurationHistory];
  if ([v3 hasEstablishedAlignmentValues])
  {
    v4 = [(_UILayoutArrangement *)v2 _outgoingItems];
    if ([v4 count])
    {
      id v19 = v2;
      uint64_t v20 = v3;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v5 = [(NSMutableDictionary *)v2->_alignmentConstraints allValues];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v28 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v10 count])
            {
              long long v25 = 0u;
              long long v26 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              id v11 = v4;
              uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v24;
                do
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v24 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    _UILACleanUpConstraintForItemInCollection(*(void **)(*((void *)&v23 + 1) + 8 * j), v10);
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
                }
                while (v13);
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v7);
      }

      v2 = v19;
      v3 = v20;
    }
    v16 = [(_UIAlignedLayoutArrangement *)v2 _alignmentPropertySource];
    v17 = [v16 invalidBaselineConstraints];
    if ([v17 count])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __70___UIAlignedLayoutArrangement__removeIndividualConstraintsAsNecessary__block_invoke;
      aBlock[3] = &unk_1E5305240;
      aBlock[4] = v2;
      id v22 = v17;
      v18 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
      v18[2](v18, @"Top");
      v18[2](v18, @"Bottom");
    }
  }
}

- (void)_setUpConstraintForItem:(id)a3 referenceItem:(id)a4 attribute:(int64_t)a5 inConstraintsTable:(id)a6
{
  id v18 = a3;
  id v9 = a4;
  id v10 = a6;
  if ((unint64_t)(a5 - 7) > 1)
  {
    if (qword_1EB25D130 != -1) {
      dispatch_once(&qword_1EB25D130, &__block_literal_global_628);
    }
    id v15 = v18;
    if ((a5 - 11) <= 1 && _MergedGlobals_17_5)
    {
      char v16 = [v18 _hasBaseline];
      id v15 = v18;
      int64_t v17 = 3;
      if (a5 != 12) {
        int64_t v17 = 4;
      }
      if ((v16 & 1) == 0) {
        a5 = v17;
      }
    }
    uint64_t v14 = [MEMORY[0x1E4F5B268] constraintWithItem:v9 attribute:a5 relatedBy:0 toItem:v15 attribute:a5];
    id v11 = v14;
    uint64_t v13 = @"UISV-alignment";
  }
  else
  {
    id v11 = [MEMORY[0x1E4F5B268] constraintWithItem:v18 attribute:a5 relatedBy:0 constant:0.0];
    LODWORD(v12) = 25.0;
    [v11 setPriority:v12];
    uint64_t v13 = @"UISV-ambiguity-suppression";
    uint64_t v14 = v11;
  }
  [v14 setIdentifier:v13];
  [v11 setActive:1];
  [v10 setObject:v11 forKey:v18];
}

- (void)_addConstraintGroupsAsNecessary
{
  v3 = [(_UILayoutArrangement *)self _mutableItems];
  if ([v3 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62___UIAlignedLayoutArrangement__addConstraintGroupsAsNecessary__block_invoke;
    aBlock[3] = &unk_1E52DE780;
    aBlock[4] = self;
    v4 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
    v4[2](v4, @"Top");
    v4[2](v4, @"Leading");
    v4[2](v4, @"Bottom");
    v4[2](v4, @"Trailing");
    v4[2](v4, @"CenterX");
    v4[2](v4, @"CenterY");
    v4[2](v4, @"Ambiguity Suppression");
    alignmentConstraints = self->_alignmentConstraints;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62___UIAlignedLayoutArrangement__addConstraintGroupsAsNecessary__block_invoke_2;
    v6[3] = &unk_1E530E370;
    v6[4] = self;
    id v7 = v3;
    [(NSMutableDictionary *)alignmentConstraints enumerateKeysAndObjectsUsingBlock:v6];
  }
}

- (BOOL)_wantsAmbiguitySuppressionConstraints
{
  v2 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  char v3 = ~[v2 alignment];
  BOOL v4 = (v3 & 0x60) != 0 && (v3 & 0x18) != 0;

  return v4;
}

- (void)_updateArrangementConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)_UIAlignedLayoutArrangement;
  [(_UILayoutArrangement *)&v4 _updateArrangementConstraints];
  char v3 = [(_UIAlignedLayoutArrangement *)self _alignmentConfigurationHistory];
  [v3 setInAlignmentLayoutUpdateSection:1];
  if ([(_UIAlignedLayoutArrangement *)self _hasStaleConfiguration])
  {
    [(_UIAlignedLayoutArrangement *)self _removeConstraintGroupsAsNecessary];
    [(_UIAlignedLayoutArrangement *)self _removeIndividualConstraintsAsNecessary];
    [(_UIAlignedLayoutArrangement *)self _addIndividualConstraintsIfPossible];
    [(_UIAlignedLayoutArrangement *)self _addConstraintGroupsAsNecessary];
  }
  [(_UIAlignedLayoutArrangement *)self _updateConfigurationHistory];
  [v3 setInAlignmentLayoutUpdateSection:0];
}

- (void)_updateConfigurationHistory
{
  char v3 = [(_UIAlignedLayoutArrangement *)self _alignmentConfigurationHistory];
  if ([v3 isInAlignmentLayoutUpdateSection])
  {
    [v3 setHasEstablishedAlignmentValues:1];
    objc_super v4 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
    objc_msgSend(v3, "setAlignment:", objc_msgSend(v4, "alignment"));
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIAlignedLayoutArrangement;
  [(_UILayoutArrangement *)&v5 _updateConfigurationHistory];
}

- (int64_t)_axisForSpanningLayoutGuide
{
  v2 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  int64_t v3 = [v2 axis] == 0;

  return v3;
}

- (int64_t)_attributeForConstraintGroupName:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  char v7 = [v6 alignment];

  if ([v5 isEqualToString:@"Top"])
  {
    BOOL v8 = (v7 & 8) == 0;
    uint64_t v9 = 3;
    uint64_t v10 = 12;
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"Leading"])
  {
    int64_t v11 = 5;
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"Bottom"])
  {
    BOOL v8 = (v7 & 0x10) == 0;
    uint64_t v9 = 4;
    uint64_t v10 = 11;
LABEL_7:
    if (v8) {
      int64_t v11 = v10;
    }
    else {
      int64_t v11 = v9;
    }
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"Trailing"])
  {
    int64_t v11 = 6;
  }
  else if ([v5 isEqualToString:@"CenterX"])
  {
    int64_t v11 = 9;
  }
  else if ([v5 isEqualToString:@"CenterY"])
  {
    int64_t v11 = 10;
  }
  else if (![v5 isEqualToString:@"Ambiguity Suppression"] {
         || (int64_t v11 = [(_UILayoutArrangement *)self _dimensionAttributeForCurrentAxis]) == 0)
  }
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIAlignedLayoutArrangement.m", 521, @"Couldn't find attribute for constraint group %@", v5 object file lineNumber description];

    int64_t v11 = 0;
  }
LABEL_10:

  return v11;
}

- (BOOL)_wantsConstraintsForAttribute:(int64_t)a3
{
  BOOL v5 = a3 <= 0x25 && ((1 << a3) & 0x2A00119D19) != 0;
  LODWORD(v6) = [(_UIAlignedLayoutArrangement *)self _wantsConstraintsUsingAttributesForAxis:v5];
  if (v6)
  {
    if ((unint64_t)(a3 - 7) > 1)
    {
      char v7 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
      unint64_t v8 = [v7 alignment];

      LOBYTE(v6) = 0;
      switch(a3)
      {
        case 3:
          BOOL v6 = (v8 >> 3) & 1;
          break;
        case 4:
          BOOL v6 = (v8 >> 4) & 1;
          break;
        case 5:
          BOOL v6 = (v8 >> 5) & 1;
          break;
        case 6:
          BOOL v6 = (v8 >> 6) & 1;
          break;
        case 9:
          BOOL v6 = (v8 >> 9) & 1;
          break;
        case 10:
          BOOL v6 = (v8 >> 10) & 1;
          break;
        case 11:
          BOOL v6 = (v8 >> 11) & 1;
          break;
        case 12:
          BOOL v6 = (v8 >> 12) & 1;
          break;
        default:
          return v6;
      }
    }
    else
    {
      LOBYTE(v6) = [(_UIAlignedLayoutArrangement *)self _wantsAmbiguitySuppressionConstraints];
    }
  }
  return v6;
}

- (BOOL)_wantsConstraintsUsingAttributesForAxis:(int64_t)a3
{
  objc_super v4 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  LOBYTE(a3) = [v4 axis] != a3;

  return a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (BOOL)_hasStaleConfiguration
{
  v8.receiver = self;
  v8.super_class = (Class)_UIAlignedLayoutArrangement;
  if ([(_UILayoutArrangement *)&v8 _hasStaleConfiguration]) {
    return 1;
  }
  objc_super v4 = [(_UIAlignedLayoutArrangement *)self _alignmentConfigurationHistory];
  BOOL v5 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  if ([v4 hasEstablishedAlignmentValues])
  {
    uint64_t v6 = [v4 alignment];
    BOOL v3 = v6 != [v5 alignment];
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (BOOL)_canvasConnectionConstraintsNeedUpdatePass
{
  v10.receiver = self;
  v10.super_class = (Class)_UIAlignedLayoutArrangement;
  if ([(_UILayoutArrangement *)&v10 _canvasConnectionConstraintsNeedUpdatePass])
  {
    return 1;
  }
  objc_super v4 = [(_UILayoutArrangement *)self _mutableItems];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [(_UIAlignedLayoutArrangement *)self _alignmentConfigurationHistory];
  uint64_t v7 = [v6 alignment];
  objc_super v8 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  BOOL v3 = v7 != [v8 alignment];

  return v3;
}

- (void)_removeConstraintGroupsAsNecessary
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIAlignedLayoutArrangement *)self _alignmentConfigurationHistory];
  if ([v3 hasEstablishedAlignmentValues])
  {
    uint64_t v46 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
    uint64_t v4 = [v46 alignment];
    uint64_t v5 = [v3 alignment];
    v44 = [(_UILayoutArrangement *)self _outgoingItems];
    uint64_t v6 = [v3 axis];
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__233;
    v75 = __Block_byref_object_dispose__233;
    id v76 = 0;
    if (v6 == [(_UILayoutArrangement *)self axis])
    {
      if ([v44 count])
      {
        uint64_t v7 = _constraintGroupNamesForAlignmentOptions(v5, [(_UILayoutArrangement *)self axis]);
        alignmentConstraints = self->_alignmentConstraints;
        uint64_t v9 = [v7 anyObject];
        objc_super v10 = [(NSMutableDictionary *)alignmentConstraints objectForKey:v9];

        int64_t v11 = [v10 objectEnumerator];
        double v12 = [v11 nextObject];

        if (v12)
        {
          uint64_t v13 = [v12 firstItem];
          if ([v44 containsObject:v13]) {
            int v14 = 1;
          }
          else {
            int v14 = ![(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:v13];
          }
          int v45 = v14;
        }
        else
        {
          int v45 = 0;
        }
      }
      else
      {
        int v45 = 0;
      }
    }
    else
    {
      int v45 = 1;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65___UIAlignedLayoutArrangement__removeConstraintGroupsAsNecessary__block_invoke;
    aBlock[3] = &unk_1E530E320;
    aBlock[4] = &v71;
    id v15 = _Block_copy(aBlock);
    char v16 = (void (**)(void, void))v15;
    if (!(v45 & 1 | (v5 == v4)))
    {
      if ((v5 & 8) != 0 && (v4 & 8) == 0) {
        (*((void (**)(void *, __CFString *))v15 + 2))(v15, @"Top");
      }
      if ((v5 & 0x20) != 0 && (v4 & 0x20) == 0) {
        ((void (**)(void, __CFString *))v16)[2](v16, @"Leading");
      }
      if ((v5 & 0x10) != 0 && (v4 & 0x10) == 0) {
        ((void (**)(void, __CFString *))v16)[2](v16, @"Bottom");
      }
      if ((v5 & 0x40) != 0 && (v4 & 0x40) == 0) {
        ((void (**)(void, __CFString *))v16)[2](v16, @"Trailing");
      }
      if ((v5 & 0x200) != 0 && (v4 & 0x200) == 0) {
        ((void (**)(void, __CFString *))v16)[2](v16, @"CenterX");
      }
      if ((v5 & 0x400) != 0 && (v4 & 0x400) == 0) {
        ((void (**)(void, __CFString *))v16)[2](v16, @"CenterY");
      }
      if ((v5 & 0x1000) != 0 && (v4 & 0x1000) == 0) {
        ((void (**)(void, __CFString *))v16)[2](v16, @"Top");
      }
      if ((v5 & 0x800) != 0 && (v4 & 0x800) == 0) {
        ((void (**)(void, __CFString *))v16)[2](v16, @"Bottom");
      }
      if ((~v5 & 0x18) != 0 && (v5 & 0x60) != 0x60 && ((~(_BYTE)v4 & 0x18) == 0 || (v4 & 0x60) == 0x60)) {
        ((void (**)(void, __CFString *))v16)[2](v16, @"Ambiguity Suppression");
      }
    }
    BOOL v17 = [(_UIAlignedLayoutArrangement *)self _wantsConstraintsForAttribute:12]
       || [(_UIAlignedLayoutArrangement *)self _wantsConstraintsForAttribute:11];
    id v18 = [v46 _newlyHiddenItems];
    uint64_t v19 = [v18 count];
    uint64_t v20 = [v46 _newlyUnhiddenItems];
    uint64_t v21 = [v20 count];
    v42 = v18;
    id v43 = v20;
    [(_UILayoutArrangement *)self _incomingItems];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 countByEnumeratingWithState:&v66 objects:v80 count:16];
    BOOL v41 = v21 != 0;
    if (v23)
    {
      uint64_t v24 = *(void *)v67;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v67 != v24) {
            objc_enumerationMutation(v22);
          }
          if ([(_UILayoutArrangement *)self _itemWantsLayoutAsIfVisible:*(void *)(*((void *)&v66 + 1) + 8 * i)])
          {
            LODWORD(v23) = 1;
            goto LABEL_56;
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v66 objects:v80 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
LABEL_56:
    BOOL v26 = v21 != 0;

    if ((v17 & ~v45) == 1 && (v19 != 0 || v26) | v23)
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v27 = [(_UILayoutArrangement *)self items];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v62 objects:v79 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v63;
        while (2)
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v63 != v29) {
              objc_enumerationMutation(v27);
            }
            if (([*(id *)(*((void *)&v62 + 1) + 8 * j) _hasBaseline] & 1) == 0)
            {

              v55[0] = MEMORY[0x1E4F143A8];
              v55[1] = 3221225472;
              v55[2] = __65___UIAlignedLayoutArrangement__removeConstraintGroupsAsNecessary__block_invoke_2;
              v55[3] = &unk_1E530E348;
              v55[4] = self;
              id v56 = v42;
              v59 = v16;
              BOOL v60 = v41;
              char v61 = v23;
              id v57 = v43;
              id v58 = v22;
              uint64_t v31 = (void (**)(void *, __CFString *))_Block_copy(v55);
              v31[2](v31, @"Top");
              v31[2](v31, @"Bottom");

              goto LABEL_69;
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v62 objects:v79 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }
    }
LABEL_69:
    if (v45)
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v32 = [(NSMutableDictionary *)self->_alignmentConstraints allValues];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v78 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v52;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v52 != v34) {
              objc_enumerationMutation(v32);
            }
            _UILACleanUpConstraintsMapTable(*(void **)(*((void *)&v51 + 1) + 8 * k));
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v78 count:16];
        }
        while (v33);
      }
    }
    else
    {
      long long v36 = (void *)v72[5];
      if (!v36)
      {
LABEL_87:

        _Block_object_dispose(&v71, 8);
        goto LABEL_88;
      }
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v32 = v36;
      uint64_t v37 = [v32 countByEnumeratingWithState:&v47 objects:v77 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v48;
        do
        {
          for (uint64_t m = 0; m != v37; ++m)
          {
            if (*(void *)v48 != v38) {
              objc_enumerationMutation(v32);
            }
            long long v40 = [(NSMutableDictionary *)self->_alignmentConstraints objectForKeyedSubscript:*(void *)(*((void *)&v47 + 1) + 8 * m)];
            _UILACleanUpConstraintsMapTable(v40);
          }
          uint64_t v37 = [v32 countByEnumeratingWithState:&v47 objects:v77 count:16];
        }
        while (v37);
      }
    }

    goto LABEL_87;
  }
LABEL_88:
}

+ (Class)_configurationHistoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_usesCenteringConnectionConstraint
{
  v2 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  __int16 v3 = [v2 alignment];

  return (v3 & 0x600) != 0;
}

- (id)_identifierForSpanningLayoutGuide
{
  return @"UISV-alignment-spanner";
}

- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3
{
}

- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIAlignedLayoutArrangement;
  id v5 = -[_UILayoutArrangement _indexOfItemForLocationAttribute:](&v10, sel__indexOfItemForLocationAttribute_);
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(_UILayoutArrangement *)self _mutableItems];
    unint64_t v8 = [v7 count];

    unint64_t result = (unint64_t)v5;
    if (v8 >= 2)
    {
      if ([(_UILayoutArrangement *)self axis])
      {
        if (a3 > 0x25) {
          goto LABEL_29;
        }
        if (((1 << a3) & 0x2A00119D19) != 0) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
        if (((1 << a3) & 0x14000C42C4) == 0)
        {
LABEL_29:
          if ((self->_alignment & 0x22) != 0) {
            return 0;
          }
        }
        if ((a3 > 0x23 || ((1 << a3) & 0xF001ABFABLL) == 0) && (self->_alignment & 0x44) != 0)
        {
          return 0;
        }
        else
        {
          unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
          if (a3 == 9 && (self->_alignment & 0x200) != 0) {
            return 0;
          }
        }
      }
      else
      {
        unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
        if (a3 <= 0x25 && ((1 << a3) & 0x2A00119D19) != 0)
        {
          switch(a3)
          {
            case 3:
            case 12:
              unint64_t alignment = self->_alignment;
              if ((alignment & 0x1008) != 0) {
                return 0;
              }
              switch(a3)
              {
                case 11:
                  goto LABEL_14;
                case 10:
                  goto LABEL_25;
                case 4:
                  goto LABEL_14;
              }
              break;
            case 4:
            case 11:
LABEL_14:
              unint64_t alignment = self->_alignment;
              if ((alignment & 0x810) != 0) {
                return 0;
              }
              if (a3 == 10) {
                goto LABEL_25;
              }
              break;
            case 10:
              unint64_t alignment = self->_alignment;
LABEL_25:
              if ((alignment & 0x400) != 0) {
                unint64_t result = 0;
              }
              else {
                unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
              }
              break;
            default:
              return result;
          }
        }
      }
    }
  }
  return result;
}

- (void)setAlignment:(unint64_t)a3
{
  if ((~(_WORD)a3 & 0x1008) == 0 || (a3 & 0x810) == 0x810)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIAlignedLayoutArrangement.m" lineNumber:231 description:@" Can't align Top and FirstBaseline or Bottom and LastBaseline at the same time."];
  }
  if (self->_alignment != a3)
  {
    BOOL v6 = [(_UIAlignedLayoutArrangement *)self _requiresNotificationForHasBaselinePropertyChanges];
    self->_unint64_t alignment = a3;
    if (v6 != [(_UIAlignedLayoutArrangement *)self _requiresNotificationForHasBaselinePropertyChanges])[(_UILayoutArrangement *)self _hasBaselineChangedNotificationRequirementDidChange]; {
    v10[0] = MEMORY[0x1E4F143A8];
    }
    v10[1] = 3221225472;
    v10[2] = __44___UIAlignedLayoutArrangement_setAlignment___block_invoke;
    v10[3] = &__block_descriptor_40_e36_v16__0___UIALAConfigurationHistory_8l;
    v10[4] = a3;
    [(_UILayoutArrangement *)self _trackChangesWithConfigBlock:v10];
    uint64_t v7 = [(_UILayoutArrangement *)self canvas];
    _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(v7);

    unint64_t v8 = [(_UILayoutArrangement *)self canvas];
    [v8 _vendedBaselineViewParametersDidChange];
  }
}

- (BOOL)_requiresNotificationForHasBaselinePropertyChanges
{
  if (qword_1EB25D130 != -1) {
    dispatch_once(&qword_1EB25D130, &__block_literal_global_628);
  }
  if (_MergedGlobals_17_5)
  {
    unint64_t alignment = self->_alignment;
    if ((alignment & 0x1000) != 0) {
      LOBYTE(v4) = 1;
    }
    else {
      return (alignment >> 11) & 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setLayoutFillsCanvas:(BOOL)a3
{
}

- (_UIAlignedLayoutArrangement)initWithItems:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAlignedLayoutArrangement;
  __int16 v3 = [(_UILayoutArrangement *)&v7 initWithItems:a3];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
    alignmentConstraints = v3->_alignmentConstraints;
    v3->_alignmentConstraints = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)_clearAllConstraintsArrays
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UIAlignedLayoutArrangement;
  [(_UILayoutArrangement *)&v12 _clearAllConstraintsArrays];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  __int16 v3 = [(NSMutableDictionary *)self->_alignmentConstraints allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        _UILACleanUpConstraintsMapTable(*(void **)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setAxis:(int64_t)a3
{
}

- (BOOL)_spanningGuideConstraintsNeedUpdate
{
  v8.receiver = self;
  v8.super_class = (Class)_UIAlignedLayoutArrangement;
  if ([(_UILayoutArrangement *)&v8 _spanningGuideConstraintsNeedUpdate]) {
    return 1;
  }
  uint64_t v4 = [(_UIAlignedLayoutArrangement *)self _alignmentConfigurationHistory];
  uint64_t v5 = [v4 alignment];
  uint64_t v6 = [(_UIAlignedLayoutArrangement *)self _alignmentPropertySource];
  BOOL v3 = v5 != [v6 alignment];

  return v3;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v3 = [(NSMutableDictionary *)self->_alignmentConstraints allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          _UILACleanUpConstraintsMapTable(*(void **)(*((void *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIAlignedLayoutArrangement;
  [(_UIAlignedLayoutArrangement *)&v8 dealloc];
}

- (id)_baselineDependentConstraints
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSMutableDictionary *)self->_alignmentConstraints objectForKeyedSubscript:@"Top"];
  if ([v3 count])
  {
  }
  else
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_alignmentConstraints objectForKeyedSubscript:@"Bottom"];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      id v6 = 0;
      goto LABEL_19;
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_alignmentConstraints objectForKeyedSubscript:@"Top"];
  objc_super v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 addObject:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [(NSMutableDictionary *)self->_alignmentConstraints objectForKeyedSubscript:@"Bottom", 0];
  uint64_t v14 = [v13 objectEnumerator];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [v6 addObject:*(void *)(*((void *)&v20 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

LABEL_19:
  return v6;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIAlignedLayoutArrangement;
  BOOL v3 = [(_UILayoutArrangement *)&v6 description];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v5 = objc_msgSend(v3, "stringByAppendingFormat:", @" alignmentConstraints=%p", self->_alignmentConstraints);

    BOOL v3 = (void *)v5;
  }
  return (NSString *)v3;
}

@end