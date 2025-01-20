@interface TransitDirectionsListItemTransitTrip
- (BOOL)expanded;
- (BOOL)shouldDisplayExpandButton;
- (BOOL)shouldEnableExpandedButton;
- (GEOComposedTransitTripRouteStep)tripStep;
- (NSArray)expandedItems;
- (TransitDirectionsListItemTransitTrip)initWithTripStep:(id)a3;
- (id)_collapseButtonTitleByVehicleType;
- (id)_countStopsStringClientFallback;
- (id)_countStopsStringFromServer;
- (id)_expandButtonTitleFromServer;
- (id)expandingButtonTitleForExpandedState:(BOOL)a3;
- (id)subItemsWithForceExpand:(BOOL)a3;
- (unint64_t)numberOfSubItemsWithForceExpand:(BOOL)a3;
- (void)_rebuildSubItems;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedItems:(id)a3;
@end

@implementation TransitDirectionsListItemTransitTrip

- (TransitDirectionsListItemTransitTrip)initWithTripStep:(id)a3
{
  id v5 = a3;
  v6 = [v5 routeDetailsPrimaryArtwork];
  v7 = [v6 firstObject];

  v8 = [v5 steppingArtwork];
  v9 = [v8 firstObject];

  v10 = +[MNTransitStepInstruction instructionForStep:v5 context:1];
  if (v7)
  {
    v23 = &off_1013A78B8;
    v24 = v7;
    v11 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    if (v9)
    {
LABEL_3:
      v21 = &off_1013A78B8;
      v22 = v9;
      v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      goto LABEL_6;
    }
  }
  else
  {
    v11 = &__NSDictionary0__struct;
    if (v9) {
      goto LABEL_3;
    }
  }
  v12 = &__NSDictionary0__struct;
LABEL_6:
  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsListItemTransitTrip;
  v13 = [(TransitDirectionsListArtworkItem *)&v20 initWithArtworks:v11 alternateArtworks:v12 instructions:v10];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tripStep, a3);
    v15 = [v5 transitStep];
    v16 = [v15 badges];
    v17 = (NSArray *)[v16 copy];
    badges = v14->super.super._badges;
    v14->super.super._badges = v17;
  }
  return v14;
}

- (void)setExpandedItems:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  expandedItems = self->_expandedItems;
  self->_expandedItems = v4;

  [(TransitDirectionsListItem *)self _invalidateSubItems];
}

- (GEOComposedTransitTripRouteStep)tripStep
{
  return self->_tripStep;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (NSArray)expandedItems
{
  return self->_expandedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedItems, 0);
  objc_storeStrong((id *)&self->_tripStep, 0);

  objc_storeStrong((id *)&self->_locallyGeneratedSubstepsFooter, 0);
}

- (id)expandingButtonTitleForExpandedState:(BOOL)a3
{
  if (a3
    && ([(TransitDirectionsListItemTransitTrip *)self expandedItems],
        v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 count],
        v4,
        v5))
  {
    v6 = [(TransitDirectionsListItemTransitTrip *)self _collapseButtonTitleByVehicleType];
  }
  else
  {
    v6 = [(TransitDirectionsListItemTransitTrip *)self _expandButtonTitleFromServer];
    if (![v6 length])
    {
      uint64_t v7 = [(TransitDirectionsListItemTransitTrip *)self _countStopsStringFromServer];

      v6 = (void *)v7;
    }
    if (![v6 length])
    {
      uint64_t v8 = [(TransitDirectionsListItemTransitTrip *)self _countStopsStringClientFallback];

      v6 = (void *)v8;
    }
  }

  return v6;
}

- (id)_collapseButtonTitleByVehicleType
{
  v3 = [(TransitDirectionsListItemTransitTrip *)self tripStep];
  unsigned int v4 = [v3 isBus];

  if (v4)
  {
    id v5 = +[NSBundle mainBundle];
    v6 = v5;
    CFStringRef v7 = @"Transit_Ride_Steps_Hide_Bus";
  }
  else
  {
    uint64_t v8 = [(TransitDirectionsListItemTransitTrip *)self tripStep];
    unsigned int v9 = [v8 isRail];

    id v5 = +[NSBundle mainBundle];
    v6 = v5;
    if (v9) {
      CFStringRef v7 = @"Transit_Ride_Steps_Hide_Rail";
    }
    else {
      CFStringRef v7 = @"Transit_Ride_Steps_Hide_Other";
    }
  }
  v10 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];
  v11 = [(TransitDirectionsListItemTransitTrip *)self expandedItems];
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, [v11 count]);

  return v12;
}

- (id)_expandButtonTitleFromServer
{
  v3 = [(TransitDirectionsListItem *)self transitInstruction];
  unsigned int v4 = [v3 expandableListString];

  if (!v4)
  {
    if ((id)[(TransitDirectionsListItem *)self type] == (id)3
      && ([(TransitDirectionsListItem *)self previousItem],
          id v5 = objc_claimAutoreleasedReturnValue(),
          id v6 = [v5 type],
          v5,
          v6 == (id)2))
    {
      CFStringRef v7 = [(TransitDirectionsListItem *)self previousItem];
      uint64_t v8 = [v7 transitInstruction];
      unsigned int v4 = [v8 expandableListString];
    }
    else
    {
      unsigned int v4 = 0;
    }
  }
  unsigned int v9 = [v4 stringWithDefaultOptions];

  return v9;
}

- (id)_countStopsStringFromServer
{
  v2 = [(TransitDirectionsListItem *)self transitInstruction];
  v3 = [v2 countStopsString];

  unsigned int v4 = [v3 optionsWithArgumentHandler:&stru_10131C2E8];
  id v5 = [v3 stringWithOptions:v4];

  return v5;
}

- (id)_countStopsStringClientFallback
{
  v3 = [(TransitDirectionsListItemTransitTrip *)self expandedItems];
  uint64_t v4 = (uint64_t)[v3 count];
  uint64_t v5 = v4 + 1;

  id v6 = [(TransitDirectionsListItemTransitTrip *)self expandedItems];
  CFStringRef v7 = [v6 lastObject];

  if (v7 && [v7 type] != (id)5)
  {
    uint64_t v8 = [(TransitDirectionsListItemTransitTrip *)self expandedItems];
    id v9 = [v8 count];

    if (v9 == (id)2)
    {
      v10 = [(TransitDirectionsListItemTransitTrip *)self expandedItems];
      v11 = [v10 firstObject];

      v12 = [v11 composedRouteSteps];
      v13 = [v12 lastObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 maneuver] == 5) {
        uint64_t v4 = 1;
      }
    }
    uint64_t v5 = v4;
  }
  v14 = [(TransitDirectionsListItemTransitTrip *)self tripStep];
  unsigned int v15 = [v14 isBus];

  if (v15)
  {
    v16 = +[NSBundle mainBundle];
    v17 = v16;
    CFStringRef v18 = @"%d stop [BUS]";
  }
  else
  {
    v19 = [(TransitDirectionsListItemTransitTrip *)self tripStep];
    unsigned int v20 = [v19 isRail];

    v16 = +[NSBundle mainBundle];
    v17 = v16;
    if (v20) {
      CFStringRef v18 = @"%d stop [RAIL]";
    }
    else {
      CFStringRef v18 = @"%d stop [OTHER]";
    }
  }
  v21 = [v16 localizedStringForKey:v18 value:@"localized string not found" table:0];

  v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v5);

  return v22;
}

- (BOOL)shouldEnableExpandedButton
{
  v2 = [(TransitDirectionsListItemTransitTrip *)self expandedItems];
  BOOL v3 = [v2 count] != 0;

  return v3;
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
  if ([(TransitDirectionsListItemTransitTrip *)self expanded] || v3)
  {
    subItemsExpanded = self->super.super._subItemsExpanded;
    if (!subItemsExpanded)
    {
      sub_100C4645C(self, 1);
      CFStringRef v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = self->super.super._subItemsExpanded;
      self->super.super._subItemsExpanded = v7;

      subItemsExpanded = self->super.super._subItemsExpanded;
    }
    uint64_t v5 = subItemsExpanded;
  }
  else
  {
    uint64_t v5 = [(TransitDirectionsListItem *)self subItems];
  }

  return v5;
}

- (unint64_t)numberOfSubItemsWithForceExpand:(BOOL)a3
{
  BOOL v3 = [(TransitDirectionsListItemTransitTrip *)self subItemsWithForceExpand:a3];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

@end