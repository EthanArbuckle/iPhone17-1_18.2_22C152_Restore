@interface TransitDirectionsListItem
+ (int64_t)defaultInstructionContextForItemType:(int64_t)a3 forGuidance:(BOOL)a4;
- ($C79183323B9A0D5602617FF3BE5395AC)displayedMapRect;
- (BOOL)hideAccessoryStringsWhenCollapsed;
- (BOOL)selectable;
- (BOOL)shouldHideInExpandedDisplayStyle;
- (GEOComposedRouteStep)matchingRouteStep;
- (GEOComposedString)primaryAccessoryString;
- (GEOComposedString)secondaryAccessoryString;
- (MNTransitInstruction)transitInstruction;
- (NSArray)badges;
- (NSArray)composedRouteSteps;
- (NSArray)composedRouteStepsDisplayedOnMap;
- (NSArray)footerItems;
- (NSArray)majorFormattedStrings;
- (NSArray)minorFormattedStrings;
- (NSArray)postTertiaryItems;
- (NSArray)subItems;
- (NSArray)tertiaryFormattedStrings;
- (TransitDirectionsListItem)init;
- (TransitDirectionsListItem)initWithInstructions:(id)a3;
- (TransitDirectionsListItem)nextItem;
- (TransitDirectionsListItem)parentItem;
- (TransitDirectionsListItem)previousItem;
- (UIColor)alternateFromLineColor;
- (UIColor)alternateToLineColor;
- (UIColor)fromLineColor;
- (UIColor)toLineColor;
- (UIImage)majorStringImage;
- (UIImage)minorStringImage;
- (double)lineWidthForView:(id)a3;
- (id)_itemAfterSubItem:(id)a3;
- (id)_itemBeforeSubItem:(id)a3;
- (id)_subItemsForCurrentState;
- (id)alternateImageSourceForStyle:(unint64_t)a3;
- (id)description;
- (id)formattedStringsForType:(int64_t)a3;
- (id)imageSourceForStyle:(unint64_t)a3;
- (int64_t)type;
- (unint64_t)matchingRouteStepIndex;
- (void)_invalidateSubItems;
- (void)_rebuildSubItems;
- (void)setAlternateFromLineColor:(id)a3;
- (void)setAlternateToLineColor:(id)a3;
- (void)setBadges:(id)a3;
- (void)setComposedRouteSteps:(id)a3;
- (void)setComposedRouteStepsDisplayedOnMap:(id)a3;
- (void)setFooterItems:(id)a3;
- (void)setFromLineColor:(id)a3;
- (void)setHideAccessoryStringsWhenCollapsed:(BOOL)a3;
- (void)setMajorFormattedStrings:(id)a3;
- (void)setMajorStringImage:(id)a3;
- (void)setMinorFormattedStrings:(id)a3;
- (void)setMinorStringImage:(id)a3;
- (void)setNextItem:(id)a3;
- (void)setParentItem:(id)a3;
- (void)setPostTertiaryItems:(id)a3;
- (void)setPreviousItem:(id)a3;
- (void)setPrimaryAccessoryString:(id)a3;
- (void)setSecondaryAccessoryString:(id)a3;
- (void)setTertiaryFormattedStrings:(id)a3;
- (void)setToLineColor:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation TransitDirectionsListItem

- (TransitDirectionsListItem)init
{
  return [(TransitDirectionsListItem *)self initWithInstructions:0];
}

- (TransitDirectionsListItem)initWithInstructions:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TransitDirectionsListItem;
  v6 = [(TransitDirectionsListItem *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitInstruction, a3);
    uint64_t v8 = [(MNTransitInstruction *)v7->_transitInstruction majorInstructionStrings];
    majorFormattedStrings = v7->_majorFormattedStrings;
    v7->_majorFormattedStrings = (NSArray *)v8;

    uint64_t v10 = [(MNTransitInstruction *)v7->_transitInstruction minorInstructionStrings];
    minorFormattedStrings = v7->_minorFormattedStrings;
    v7->_minorFormattedStrings = (NSArray *)v10;

    uint64_t v12 = [(MNTransitInstruction *)v7->_transitInstruction tertiaryInstructionStrings];
    tertiaryFormattedStrings = v7->_tertiaryFormattedStrings;
    v7->_tertiaryFormattedStrings = (NSArray *)v12;

    id v14 = +[GEOPlatform sharedPlatform];
    if ([v14 isInternalInstall])
    {
      v15 = +[NSUserDefaults standardUserDefaults];
      unsigned int v16 = [v15 BOOLForKey:@"__internal__EnableTransitDebugLocalInstruction"];

      if (!v5
        || !v16
        || [(NSArray *)v7->_majorFormattedStrings count]
        || [(NSArray *)v7->_minorFormattedStrings count]
        || [(NSArray *)v7->_tertiaryFormattedStrings count])
      {
        goto LABEL_10;
      }
      id v14 = [objc_alloc((Class)GEOComposedString) initWithString:@"Missing Instructions"];
      id v22 = v14;
      uint64_t v17 = +[NSArray arrayWithObjects:&v22 count:1];
      v18 = v7->_majorFormattedStrings;
      v7->_majorFormattedStrings = (NSArray *)v17;
    }
LABEL_10:
    v19 = v7;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v25.receiver = self;
  v25.super_class = (Class)TransitDirectionsListItem;
  v4 = [(TransitDirectionsListItem *)&v25 description];
  id v5 = [v3 initWithString:v4];

  unint64_t v6 = [(TransitDirectionsListItem *)self type];
  if (v6 >= 0x12)
  {
    v7 = +[NSString stringWithFormat:@"Unknown (%ld)", v6];
  }
  else
  {
    v7 = off_101319548[v6];
  }
  [v5 appendFormat:@" %@", v7];

  uint64_t v8 = [(TransitDirectionsListItem *)self majorFormattedStrings];
  id v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(TransitDirectionsListItem *)self majorFormattedStrings];
    v11 = [v10 firstObject];
    uint64_t v12 = [v11 stringWithDefaultOptions];
    [v5 appendFormat:@" | %@", v12];
  }
  v13 = [(TransitDirectionsListItem *)self minorFormattedStrings];
  id v14 = [v13 count];

  if (v14)
  {
    v15 = [(TransitDirectionsListItem *)self minorFormattedStrings];
    unsigned int v16 = [v15 firstObject];
    uint64_t v17 = [v16 stringWithDefaultOptions];
    [v5 appendFormat:@" | %@", v17];
  }
  v18 = [(TransitDirectionsListItem *)self tertiaryFormattedStrings];
  id v19 = [v18 count];

  if (v19)
  {
    v20 = [(TransitDirectionsListItem *)self tertiaryFormattedStrings];
    objc_super v21 = [v20 firstObject];
    id v22 = [v21 stringWithDefaultOptions];
    [v5 appendFormat:@" | %@", v22];
  }
  id v23 = [v5 copy];

  return v23;
}

- (BOOL)selectable
{
  return (id)[(TransitDirectionsListItem *)self type] != (id)13
      && (id)[(TransitDirectionsListItem *)self type] != (id)15
      && (id)[(TransitDirectionsListItem *)self type] != (id)7
      && (id)[(TransitDirectionsListItem *)self type] != (id)16;
}

- (BOOL)shouldHideInExpandedDisplayStyle
{
  return 0;
}

- (id)imageSourceForStyle:(unint64_t)a3
{
  return 0;
}

- (id)alternateImageSourceForStyle:(unint64_t)a3
{
  return 0;
}

- (unint64_t)matchingRouteStepIndex
{
  v2 = [(TransitDirectionsListItem *)self matchingRouteStep];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 stepIndex];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (GEOComposedRouteStep)matchingRouteStep
{
  id v3 = [(TransitDirectionsListItem *)self composedRouteSteps];
  unint64_t v4 = [v3 firstObject];

  switch([(TransitDirectionsListItem *)self type])
  {
    case 2:
    case 5:
    case 0xBLL:
      id v5 = [(TransitDirectionsListItem *)self composedRouteSteps];
      uint64_t v6 = [v5 lastObject];

      unint64_t v4 = (void *)v6;
      goto LABEL_28;
    case 3:
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v7 = [(TransitDirectionsListItem *)self subItems];
      id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v8) {
        goto LABEL_27;
      }
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      while (1)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v12 type] == (id)10)
          {
            id v22 = [v12 matchingRouteStep];
            goto LABEL_26;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (!v9) {
          goto LABEL_27;
        }
      }
    case 8:
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v7 = [(TransitDirectionsListItem *)self composedRouteSteps];
      id v13 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (!v13) {
        goto LABEL_27;
      }
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      break;
    default:
      if (v4) {
        goto LABEL_28;
      }
      v7 = [(TransitDirectionsListItem *)self parentItem];
      unint64_t v4 = [v7 matchingRouteStep];
      goto LABEL_27;
  }
  while (2)
  {
    for (j = 0; j != v14; j = (char *)j + 1)
    {
      if (*(void *)v26 != v15) {
        objc_enumerationMutation(v7);
      }
      uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
      v18 = [v17 transitStep];
      unsigned int v19 = [v18 maneuverType];

      if (v19 != 6)
      {
        v20 = [v17 transitStep];
        unsigned int v21 = [v20 maneuverType];

        if (v21 != 3) {
          continue;
        }
      }
      id v22 = v17;
LABEL_26:
      id v23 = v22;

      unint64_t v4 = v23;
      goto LABEL_27;
    }
    id v14 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_27:

LABEL_28:

  return (GEOComposedRouteStep *)v4;
}

- ($C79183323B9A0D5602617FF3BE5395AC)displayedMapRect
{
  double x = MKMapRectNull.origin.x;
  double y = MKMapRectNull.origin.y;
  double width = MKMapRectNull.size.width;
  double height = MKMapRectNull.size.height;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [(TransitDirectionsListItem *)self composedRouteStepsDisplayedOnMap];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v10) mapRectAroundStartCoordinate];
        v27.origin.double x = v11;
        v27.origin.double y = v12;
        v27.size.double width = v13;
        v27.size.double height = v14;
        v24.origin.double x = x;
        v24.origin.double y = y;
        v24.size.double width = width;
        v24.size.double height = height;
        MKMapRect v25 = MKMapRectUnion(v24, v27);
        double x = v25.origin.x;
        double y = v25.origin.y;
        double width = v25.size.width;
        double height = v25.size.height;
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.var1.var1 = v18;
  result.var1.var0 = v17;
  result.var0.var1 = v16;
  result.var0.var0 = v15;
  return result;
}

- (id)formattedStringsForType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v4 = [(TransitDirectionsListItem *)self majorFormattedStrings];
      goto LABEL_6;
    case 1:
      uint64_t v4 = [(TransitDirectionsListItem *)self minorFormattedStrings];
      goto LABEL_6;
    case 2:
      uint64_t v4 = [(TransitDirectionsListItem *)self tertiaryFormattedStrings];
LABEL_6:
      id v5 = (void *)v4;
      goto LABEL_14;
    case 3:
      uint64_t v6 = [(TransitDirectionsListItem *)self primaryAccessoryString];
      if (!v6) {
        goto LABEL_12;
      }
      id v7 = [(TransitDirectionsListItem *)self primaryAccessoryString];
      double v11 = v7;
      id v8 = &v11;
      goto LABEL_11;
    case 4:
      uint64_t v6 = [(TransitDirectionsListItem *)self secondaryAccessoryString];
      if (v6)
      {
        id v7 = [(TransitDirectionsListItem *)self secondaryAccessoryString];
        uint64_t v10 = v7;
        id v8 = &v10;
LABEL_11:
        id v5 = +[NSArray arrayWithObjects:v8 count:1];
      }
      else
      {
LABEL_12:
        id v5 = 0;
      }

LABEL_14:
      return v5;
    default:
      id v5 = 0;
      goto LABEL_14;
  }
}

- (NSArray)subItems
{
  subItems = self->_subItems;
  if (!subItems)
  {
    [(TransitDirectionsListItem *)self _rebuildSubItems];
    subItems = self->_subItems;
  }

  return subItems;
}

- (void)setPostTertiaryItems:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  postTertiaryItems = self->_postTertiaryItems;
  self->_postTertiaryItems = v4;

  [(TransitDirectionsListItem *)self _invalidateSubItems];
}

- (void)setFooterItems:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  footerItems = self->_footerItems;
  self->_footerItems = v4;

  [(TransitDirectionsListItem *)self _invalidateSubItems];
}

- (void)_rebuildSubItems
{
  id v3 = +[NSMutableArray arrayWithArray:self->_postTertiaryItems];
  [(NSArray *)v3 addObjectsFromArray:self->_footerItems];
  subItems = self->_subItems;
  self->_subItems = v3;
}

- (void)_invalidateSubItems
{
  subItems = self->_subItems;
  self->_subItems = 0;

  subItemsExpanded = self->_subItemsExpanded;
  self->_subItemsExpanded = 0;
}

- (TransitDirectionsListItem)nextItem
{
  id v3 = [(TransitDirectionsListItem *)self _subItemsForCurrentState];
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_nextItem);
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      id v4 = WeakRetained;
    }
    else
    {
      id v7 = [(TransitDirectionsListItem *)self parentItem];
      id v4 = [v7 _itemAfterSubItem:self];
    }
  }

  return (TransitDirectionsListItem *)v4;
}

- (TransitDirectionsListItem)previousItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousItem);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    uint64_t v6 = [(TransitDirectionsListItem *)self parentItem];
    id v5 = [v6 _itemBeforeSubItem:self];
  }

  return (TransitDirectionsListItem *)v5;
}

- (id)_itemBeforeSubItem:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a3 == self)
  {
    uint64_t v10 = [v5 previousItem];
  }
  else
  {
    id v7 = [(TransitDirectionsListItem *)self _subItemsForCurrentState];
    id v8 = (char *)[v7 indexOfObject:v6];

    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = 0;
    }
    else
    {
      if (v8)
      {
        uint64_t v9 = [v7 objectAtIndexedSubscript:v8 - 1];
      }
      else
      {
        uint64_t v9 = self;
      }
      uint64_t v10 = v9;
    }
    uint64_t v6 = v7;
  }

  return v10;
}

- (id)_itemAfterSubItem:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a3 == self)
  {
    uint64_t v9 = [v5 nextItem];
  }
  else
  {
    id v7 = [(TransitDirectionsListItem *)self _subItemsForCurrentState];
    id v8 = (char *)[v7 indexOfObject:v6];

    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = 0;
    }
    else
    {
      if (v8 + 1 == [v7 count])
      {
        uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)&self->_nextItem);
      }
      else
      {
        uint64_t WeakRetained = [v7 objectAtIndexedSubscript:v8 + 1];
      }
      uint64_t v9 = (void *)WeakRetained;
    }
    uint64_t v6 = v7;
  }

  return v9;
}

- (id)_subItemsForCurrentState
{
  if ([(TransitDirectionsListItem *)self conformsToProtocol:&OBJC_PROTOCOL___TransitDirectionsListExpandableItem])
  {
    id v3 = self;
    id v4 = [(TransitDirectionsListItem *)v3 subItemsWithForceExpand:[(TransitDirectionsListItem *)v3 expanded]];
  }
  else
  {
    id v4 = [(TransitDirectionsListItem *)self subItems];
  }

  return v4;
}

- (NSArray)composedRouteStepsDisplayedOnMap
{
  composedRouteStepsDisplayedOnMap = self->_composedRouteStepsDisplayedOnMap;
  if (!composedRouteStepsDisplayedOnMap)
  {
    id v4 = (NSArray *)[(NSArray *)self->_composedRouteSteps copy];
    id v5 = self->_composedRouteStepsDisplayedOnMap;
    self->_composedRouteStepsDisplayedOnMap = v4;

    composedRouteStepsDisplayedOnMap = self->_composedRouteStepsDisplayedOnMap;
  }

  return composedRouteStepsDisplayedOnMap;
}

- (UIColor)alternateFromLineColor
{
  id v3 = self->_alternateFromLineColor;
  if (!v3) {
    id v3 = self->_fromLineColor;
  }

  return v3;
}

- (UIColor)alternateToLineColor
{
  id v3 = self->_alternateToLineColor;
  if (!v3) {
    id v3 = self->_toLineColor;
  }

  return v3;
}

- (double)lineWidthForView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 traitCollection];
  double v5 = 5.0;
  if ([v4 userInterfaceIdiom] == (id)5)
  {
    uint64_t v6 = [v3 traitCollection];
    [v6 displayScale];
    if ((int)v7) {
      int v8 = 4;
    }
    else {
      int v8 = 3;
    }
    double v5 = (double)v8;
  }
  return v5;
}

+ (int64_t)defaultInstructionContextForItemType:(int64_t)a3 forGuidance:(BOOL)a4
{
  uint64_t v4 = 1;
  if (!a4) {
    uint64_t v4 = 2;
  }
  if (((1 << a3) & 0x3E2DF) != 0) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 2;
  }
  if ((unint64_t)a3 <= 0x11) {
    return v5;
  }
  else {
    return 2;
  }
}

- (MNTransitInstruction)transitInstruction
{
  return self->_transitInstruction;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)majorFormattedStrings
{
  return self->_majorFormattedStrings;
}

- (void)setMajorFormattedStrings:(id)a3
{
}

- (UIImage)majorStringImage
{
  return self->_majorStringImage;
}

- (void)setMajorStringImage:(id)a3
{
}

- (NSArray)minorFormattedStrings
{
  return self->_minorFormattedStrings;
}

- (void)setMinorFormattedStrings:(id)a3
{
}

- (UIImage)minorStringImage
{
  return self->_minorStringImage;
}

- (void)setMinorStringImage:(id)a3
{
}

- (NSArray)tertiaryFormattedStrings
{
  return self->_tertiaryFormattedStrings;
}

- (void)setTertiaryFormattedStrings:(id)a3
{
}

- (NSArray)badges
{
  return self->_badges;
}

- (void)setBadges:(id)a3
{
}

- (GEOComposedString)primaryAccessoryString
{
  return self->_primaryAccessoryString;
}

- (void)setPrimaryAccessoryString:(id)a3
{
}

- (GEOComposedString)secondaryAccessoryString
{
  return self->_secondaryAccessoryString;
}

- (void)setSecondaryAccessoryString:(id)a3
{
}

- (BOOL)hideAccessoryStringsWhenCollapsed
{
  return self->_hideAccessoryStringsWhenCollapsed;
}

- (void)setHideAccessoryStringsWhenCollapsed:(BOOL)a3
{
  self->_hideAccessoryStringsWhenCollapsed = a3;
}

- (UIColor)fromLineColor
{
  return self->_fromLineColor;
}

- (void)setFromLineColor:(id)a3
{
}

- (UIColor)toLineColor
{
  return self->_toLineColor;
}

- (void)setToLineColor:(id)a3
{
}

- (void)setAlternateFromLineColor:(id)a3
{
}

- (void)setAlternateToLineColor:(id)a3
{
}

- (NSArray)composedRouteSteps
{
  return self->_composedRouteSteps;
}

- (void)setComposedRouteSteps:(id)a3
{
}

- (void)setComposedRouteStepsDisplayedOnMap:(id)a3
{
}

- (TransitDirectionsListItem)parentItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentItem);

  return (TransitDirectionsListItem *)WeakRetained;
}

- (void)setParentItem:(id)a3
{
}

- (NSArray)postTertiaryItems
{
  return self->_postTertiaryItems;
}

- (NSArray)footerItems
{
  return self->_footerItems;
}

- (void)setPreviousItem:(id)a3
{
}

- (void)setNextItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextItem);
  objc_destroyWeak((id *)&self->_previousItem);
  objc_storeStrong((id *)&self->_footerItems, 0);
  objc_storeStrong((id *)&self->_postTertiaryItems, 0);
  objc_destroyWeak((id *)&self->_parentItem);
  objc_storeStrong((id *)&self->_composedRouteStepsDisplayedOnMap, 0);
  objc_storeStrong((id *)&self->_composedRouteSteps, 0);
  objc_storeStrong((id *)&self->_alternateToLineColor, 0);
  objc_storeStrong((id *)&self->_alternateFromLineColor, 0);
  objc_storeStrong((id *)&self->_toLineColor, 0);
  objc_storeStrong((id *)&self->_fromLineColor, 0);
  objc_storeStrong((id *)&self->_secondaryAccessoryString, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryString, 0);
  objc_storeStrong((id *)&self->_tertiaryFormattedStrings, 0);
  objc_storeStrong((id *)&self->_minorStringImage, 0);
  objc_storeStrong((id *)&self->_minorFormattedStrings, 0);
  objc_storeStrong((id *)&self->_majorStringImage, 0);
  objc_storeStrong((id *)&self->_majorFormattedStrings, 0);
  objc_storeStrong((id *)&self->_transitInstruction, 0);
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_subItemsExpanded, 0);

  objc_storeStrong((id *)&self->_subItems, 0);
}

@end