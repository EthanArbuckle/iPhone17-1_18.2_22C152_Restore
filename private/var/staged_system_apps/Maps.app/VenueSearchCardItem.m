@interface VenueSearchCardItem
- (BOOL)isVenueItem;
- (GEOSearchCategory)venueSearchCategory;
- (MKMapItem)venueMapItem;
- (VenueSearchCardItem)init;
- (VenueSearchCardItem)initWithMapItem:(id)a3 searchCategory:(id)a4;
- (unint64_t)venueCardID;
- (unint64_t)venueID;
@end

@implementation VenueSearchCardItem

- (VenueSearchCardItem)init
{
  return 0;
}

- (VenueSearchCardItem)initWithMapItem:(id)a3 searchCategory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VenueSearchCardItem;
  v9 = [(VenueSearchCardItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_venueMapItem, a3);
    objc_storeStrong((id *)&v10->_venueSearchCategory, a4);
  }

  return v10;
}

- (unint64_t)venueID
{
  v2 = [(MKMapItem *)self->_venueMapItem _venueInfo];
  v3 = [v2 venueIdentifier];
  id v4 = [v3 venueID];

  return (unint64_t)v4;
}

- (unint64_t)venueCardID
{
  return (unint64_t)[(MKMapItem *)self->_venueMapItem _muid];
}

- (BOOL)isVenueItem
{
  return [(VenueSearchCardItem *)self venueID] != 0;
}

- (MKMapItem)venueMapItem
{
  return self->_venueMapItem;
}

- (GEOSearchCategory)venueSearchCategory
{
  return self->_venueSearchCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueSearchCategory, 0);

  objc_storeStrong((id *)&self->_venueMapItem, 0);
}

@end