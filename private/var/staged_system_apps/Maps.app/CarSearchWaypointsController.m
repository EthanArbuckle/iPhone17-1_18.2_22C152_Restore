@interface CarSearchWaypointsController
- (CarSearchWaypointsController)initWithSearchResults:(id)a3 selectedIndex:(unint64_t)a4;
- (NSArray)searchResults;
- (id)destinationSearchResultIfAvailable;
- (id)subtitleForCurrentDestination;
- (id)titleForCurrentDestination;
- (id)visuallySelectedItem;
- (unint64_t)selectedIndex;
- (unint64_t)totalDestinations;
- (void)nextPlaceWithTraits:(id)a3;
- (void)previousPlaceWithTraits:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
@end

@implementation CarSearchWaypointsController

- (CarSearchWaypointsController)initWithSearchResults:(id)a3 selectedIndex:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarSearchWaypointsController;
  v7 = [(CarSearchWaypointsController *)&v11 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    searchResults = v7->_searchResults;
    v7->_searchResults = v8;

    v7->_selectedIndex = a4;
  }

  return v7;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  if ([(CarSearchWaypointsController *)self totalDestinations])
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a3 = 0;
    }
    else if ([(CarSearchWaypointsController *)self totalDestinations] <= a3)
    {
      a3 = [(CarSearchWaypointsController *)self totalDestinations];
    }
  }
  else
  {
    a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_selectedIndex = a3;
}

- (id)visuallySelectedItem
{
  v3 = [(CarSearchWaypointsController *)self searchResults];
  v4 = [v3 objectAtIndexedSubscript:self->_selectedIndex];

  return v4;
}

- (void)nextPlaceWithTraits:(id)a3
{
  id v5 = a3;
  v4 = (char *)[(CarSearchWaypointsController *)self selectedIndex] + 1;
  if ([(CarWaypointsController *)self allowLooping]
    && v4 >= (char *)[(CarSearchWaypointsController *)self totalDestinations])
  {
    v4 = 0;
  }
  [(CarSearchWaypointsController *)self setSelectedIndex:v4];
  [(CarWaypointsController *)self startLoadWithTraits:v5];
}

- (void)previousPlaceWithTraits:(id)a3
{
  id v5 = a3;
  if ([(CarWaypointsController *)self allowLooping]
    && ![(CarSearchWaypointsController *)self selectedIndex])
  {
    unint64_t v4 = [(CarSearchWaypointsController *)self totalDestinations];
  }
  else
  {
    unint64_t v4 = [(CarSearchWaypointsController *)self selectedIndex];
  }
  [(CarSearchWaypointsController *)self setSelectedIndex:v4 - 1];
  [(CarWaypointsController *)self startLoadWithTraits:v5];
}

- (id)destinationSearchResultIfAvailable
{
  v3 = [(CarSearchWaypointsController *)self searchResults];
  unint64_t v4 = [v3 objectAtIndexedSubscript:[self selectedIndex]];

  return v4;
}

- (id)titleForCurrentDestination
{
  v2 = [(CarSearchWaypointsController *)self destinationSearchResultIfAvailable];
  v3 = [v2 title];

  return v3;
}

- (id)subtitleForCurrentDestination
{
  v2 = [(CarSearchWaypointsController *)self destinationSearchResultIfAvailable];
  v3 = [v2 mapItem];
  unint64_t v4 = [v3 _addressFormattedAsShortenedAddress];

  return v4;
}

- (unint64_t)totalDestinations
{
  v2 = [(CarSearchWaypointsController *)self searchResults];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
}

@end