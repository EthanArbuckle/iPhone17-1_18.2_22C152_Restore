@interface VenueAllBuildings
- (BOOL)describesParentVenue;
- (GEOVenueIdentifier)filterID;
- (GEOVenueLabel)label;
- (VenueAllBuildings)init;
- (VenueAllBuildings)initWithVenueIdentifier:(id)a3;
@end

@implementation VenueAllBuildings

- (VenueAllBuildings)init
{
  return 0;
}

- (VenueAllBuildings)initWithVenueIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VenueAllBuildings;
  v6 = [(VenueAllBuildings *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filterID, a3);
    v8 = objc_alloc_init(VenueAllLabel);
    label = v7->_label;
    v7->_label = (GEOVenueLabel *)v8;

    v7->_describesParentVenue = 1;
  }

  return v7;
}

- (GEOVenueIdentifier)filterID
{
  return self->_filterID;
}

- (GEOVenueLabel)label
{
  return self->_label;
}

- (BOOL)describesParentVenue
{
  return self->_describesParentVenue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_filterID, 0);
}

@end