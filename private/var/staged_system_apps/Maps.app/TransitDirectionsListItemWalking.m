@interface TransitDirectionsListItemWalking
- (BOOL)_shouldHideWalkingSubStep:(id)a3;
- (BOOL)expanded;
- (BOOL)shouldDisplayExpandButton;
- (BOOL)shouldEnableExpandedButton;
- (NSArray)expandedItems;
- (NSArray)walkingSubItems;
- (TransitDirectionsListItemWalking)initWithWalkingSegment:(id)a3 toBoardStep:(id)a4;
- (id)_generateWalkingSubSteps;
- (id)_transitWalkingLegInstruction;
- (id)expandingButtonTitleForExpandedState:(BOOL)a3;
- (id)subItemsWithForceExpand:(BOOL)a3;
- (unint64_t)numberOfSubItemsWithForceExpand:(BOOL)a3;
- (void)_rebuildSubItems;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedItems:(id)a3;
- (void)setWalkingSubItems:(id)a3;
@end

@implementation TransitDirectionsListItemWalking

- (TransitDirectionsListItemWalking)initWithWalkingSegment:(id)a3 toBoardStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MNTransitWalkingSegmentInstruction instructionForWalkingSegment:v6 context:2];
  v9 = [v6 steps];
  v10 = [v9 firstObject];
  v11 = [v10 routeDetailsPrimaryArtwork];
  v12 = [v11 firstObject];

  if (v12)
  {
    v39 = &off_1013A78B8;
    v40 = v12;
    v13 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  }
  else
  {
    v13 = &__NSDictionary0__struct;
  }
  v37.receiver = self;
  v37.super_class = (Class)TransitDirectionsListItemWalking;
  v14 = [(TransitDirectionsListArtworkItem *)&v37 initWithArtworks:v13 alternateArtworks:0 instructions:v8];
  if (v12) {

  }
  if (v14)
  {
    uint64_t v15 = [(TransitDirectionsListItemWalking *)v14 _generateWalkingSubSteps];
    walkingSubItems = v14->_walkingSubItems;
    v14->_walkingSubItems = (NSArray *)v15;

    v17 = [v7 boardingInfo];
    unsigned int v18 = [v17 hasPreBoardingTimeInstruction];

    if (v18)
    {
      v19 = [v7 boardingInfo];
      v20 = [v19 preBoardingTimeInstruction];

      id v21 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
      if ([v20 hasPrimaryText])
      {
        id v22 = objc_alloc((Class)GEOComposedString);
        v23 = [v20 primaryText];
        id v24 = [v22 initWithGeoFormattedString:v23];
        [v21 addObject:v24];
      }
      if ([v20 hasSecondaryText])
      {
        id v25 = objc_alloc((Class)GEOComposedString);
        v26 = [v20 secondaryText];
        id v27 = [v25 initWithGeoFormattedString:v26];
        [v21 addObject:v27];
      }
      v28 = [[TransitDirectionsListBoardingInfoItem alloc] initWithPreboardingStrings:v21];
      [(TransitDirectionsListItem *)v28 setParentItem:v14];
      v38 = v28;
      v29 = +[NSArray arrayWithObjects:&v38 count:1];
      [(TransitDirectionsListItem *)v14 setFooterItems:v29];
    }
    [(TransitDirectionsListItem *)v14 setType:9];
    v30 = [v6 steps];
    [(TransitDirectionsListItem *)v14 setComposedRouteStepsDisplayedOnMap:v30];
    v31 = [v30 lastObject];
    unsigned int v32 = [v31 isArrivalStep];

    if (v32)
    {
      id v33 = [v30 mutableCopy];
      [v33 removeLastObject];
      id v34 = [v33 copy];

      v30 = v34;
    }
    [(TransitDirectionsListItem *)v14 setComposedRouteSteps:v30];
    v35 = v14;
  }
  return v14;
}

- (id)_transitWalkingLegInstruction
{
  v3 = [(TransitDirectionsListItem *)self transitInstruction];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(TransitDirectionsListItem *)self transitInstruction];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_generateWalkingSubSteps
{
  v3 = [(TransitDirectionsListItemWalking *)self _transitWalkingLegInstruction];
  v4 = [v3 walkingSegment];

  id v27 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 stepCount]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v25 = v4;
  id obj = [v4 steps];
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    v8 = &NavigationConfig_Dodgeball_ETAU_FakeIncidentHideTriggerPointAllowTruncating_ptr;
    v9 = (void **)GEOResultRefinementSort_ptr;
    uint64_t v26 = *(void *)v30;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (![(TransitDirectionsListItemWalking *)self _shouldHideWalkingSubStep:v11])
        {
          v12 = [v11 contentsForContext:1];
          v13 = [v12 instruction];

          if (v13)
          {
            v14 = objc_alloc_init(TransitDirectionsListItem);
            id v15 = [objc_alloc((Class)v8[290]) initWithString:v13];
            id v34 = v15;
            v16 = v9;
            v17 = [v9[501] arrayWithObjects:&v34 count:1];
            [(TransitDirectionsListItem *)v14 setMajorFormattedStrings:v17];

            [v11 distance];
            if (v18 <= 0.0)
            {
              [(TransitDirectionsListItem *)v14 setPrimaryAccessoryString:0];
            }
            else
            {
              id v19 = objc_alloc((Class)v8[290]);
              v20 = [v11 distanceString];
              id v21 = [v19 initWithString:v20];
              [(TransitDirectionsListItem *)v14 setPrimaryAccessoryString:v21];
            }
            [(TransitDirectionsListItem *)v14 setParentItem:self];
            [(TransitDirectionsListItem *)v14 setType:14];
            id v33 = v11;
            v9 = v16;
            id v22 = [v16[501] arrayWithObjects:&v33 count:1];
            [(TransitDirectionsListItem *)v14 setComposedRouteSteps:v22];

            [v27 addObject:v14];
            v8 = &NavigationConfig_Dodgeball_ETAU_FakeIncidentHideTriggerPointAllowTruncating_ptr;
            uint64_t v7 = v26;
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v6);
  }

  id v23 = [v27 copy];

  return v23;
}

- (BOOL)_shouldHideWalkingSubStep:(id)a3
{
  id v3 = a3;
  v4 = [v3 geoStep];
  if ([v4 maneuverType] == 18)
  {
    [v3 distance];
    BOOL v6 = v5 < 3.048;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (NSArray)walkingSubItems
{
  return self->_walkingSubItems;
}

- (void)setWalkingSubItems:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSArray)expandedItems
{
  return [(TransitDirectionsListItemWalking *)self walkingSubItems];
}

- (void)setExpandedItems:(id)a3
{
  [(TransitDirectionsListItemWalking *)self setWalkingSubItems:a3];

  [(TransitDirectionsListItem *)self _invalidateSubItems];
}

- (id)expandingButtonTitleForExpandedState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(TransitDirectionsListItemWalking *)self expandedItems];
  id v5 = [v4 count];

  if (v5)
  {
    BOOL v6 = +[NSBundle mainBundle];
    uint64_t v7 = v6;
    if (v3) {
      CFStringRef v8 = @"Transit_Walking_Steps_Hide";
    }
    else {
      CFStringRef v8 = @"Details_Stepping_List_iOS";
    }
    v9 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldEnableExpandedButton
{
  return 1;
}

- (BOOL)shouldDisplayExpandButton
{
  return 0;
}

- (void)_rebuildSubItems
{
  sub_100C4645C(self, 0);
  BOOL v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  subItems = self->super.super._subItems;
  self->super.super._subItems = v3;
}

- (id)subItemsWithForceExpand:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TransitDirectionsListItemWalking *)self expanded] || v3)
  {
    subItemsExpanded = self->super.super._subItemsExpanded;
    if (!subItemsExpanded)
    {
      sub_100C4645C(self, 1);
      uint64_t v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      CFStringRef v8 = self->super.super._subItemsExpanded;
      self->super.super._subItemsExpanded = v7;

      subItemsExpanded = self->super.super._subItemsExpanded;
    }
    id v5 = subItemsExpanded;
  }
  else
  {
    id v5 = [(TransitDirectionsListItem *)self subItems];
  }

  return v5;
}

- (unint64_t)numberOfSubItemsWithForceExpand:(BOOL)a3
{
  BOOL v3 = [(TransitDirectionsListItemWalking *)self subItemsWithForceExpand:a3];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

@end