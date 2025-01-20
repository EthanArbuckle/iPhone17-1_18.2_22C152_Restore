@interface IncompleteTransitLineItem
- (BOOL)departuresAreVehicleSpecific;
- (BOOL)hasEncyclopedicInfo;
- (BOOL)hasIncidentComponent;
- (BOOL)hasLineColorString;
- (BOOL)isBus;
- (BOOL)isIncidentsTTLExpired;
- (BOOL)showVehicleNumber;
- (GEOEncyclopedicInfo)encyclopedicInfo;
- (GEOMapItemIdentifier)identifier;
- (GEOMapRegion)mapRegion;
- (GEOTransitArtworkDataSource)alternateArtwork;
- (GEOTransitArtworkDataSource)artwork;
- (GEOTransitArtworkDataSource)headerArtwork;
- (GEOTransitArtworkDataSource)modeArtwork;
- (GEOTransitAttribution)attribution;
- (GEOTransitSystem)system;
- (IncompleteTransitLineItem)initWithIdentifier:(id)a3 name:(id)a4;
- (IncompleteTransitLineItem)initWithLabelMarker:(id)a3;
- (IncompleteTransitLineItem)initWithLabelMarker:(id)a3 system:(id)a4;
- (IncompleteTransitLineItem)initWithTransitLine:(id)a3;
- (NSArray)incidents;
- (NSArray)labelItems;
- (NSArray)operatingHours;
- (NSString)lineColorString;
- (NSString)name;
- (VKLabelMarker)labelMarker;
- (unint64_t)departureTimeDisplayStyle;
- (unint64_t)muid;
@end

@implementation IncompleteTransitLineItem

- (IncompleteTransitLineItem)initWithLabelMarker:(id)a3
{
  return [(IncompleteTransitLineItem *)self initWithLabelMarker:a3 system:0];
}

- (IncompleteTransitLineItem)initWithLabelMarker:(id)a3 system:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IncompleteTransitLineItem;
  v9 = [(IncompleteTransitLineItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_labelMarker, a3);
    objc_storeStrong((id *)&v10->_system, a4);
  }

  return v10;
}

- (IncompleteTransitLineItem)initWithIdentifier:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IncompleteTransitLineItem;
  v9 = [(IncompleteTransitLineItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = (NSString *)[v8 copy];
    name = v10->_name;
    v10->_name = v11;
  }
  return v10;
}

- (IncompleteTransitLineItem)initWithTransitLine:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IncompleteTransitLineItem;
  v6 = [(IncompleteTransitLineItem *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_line, a3);
  }

  return v7;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (unint64_t)muid
{
  if (self->_line)
  {
    line = self->_line;
  }
  else
  {
    if (self->_labelMarker)
    {
      v4 = [(VKLabelMarker *)self->_labelMarker _maps_lineIdentifiers];
      id v5 = [v4 firstObject];
      id v6 = [v5 muid];

      return (unint64_t)v6;
    }
    line = self->_identifier;
  }

  return (unint64_t)[(GEOTransitLine *)line muid];
}

- (GEOMapItemIdentifier)identifier
{
  line = self->_line;
  if (line)
  {
    uint64_t v4 = [(GEOTransitLine *)line identifier];
  }
  else
  {
    labelMarker = self->_labelMarker;
    if (labelMarker)
    {
      id v6 = [(VKLabelMarker *)labelMarker _maps_lineIdentifiers];
      id v7 = [v6 firstObject];

      if (v7)
      {
        id v8 = [v7 geoMapItemIdentifier];

        goto LABEL_8;
      }
    }
    uint64_t v4 = [(MKMapItemIdentifier *)self->_identifier geoMapItemIdentifier];
  }
  id v8 = (void *)v4;
LABEL_8:

  return (GEOMapItemIdentifier *)v8;
}

- (NSString)name
{
  if (self->_line)
  {
    v2 = [(GEOTransitLine *)self->_line name];
  }
  else if (self->_labelMarker)
  {
    v2 = [(VKLabelMarker *)self->_labelMarker _annotationTitle];
  }
  else
  {
    v2 = self->_name;
  }

  return v2;
}

- (GEOTransitSystem)system
{
  system = self->_system;
  if (system)
  {
    v3 = system;
  }
  else
  {
    v3 = [(GEOTransitLine *)self->_line system];
  }

  return v3;
}

- (unint64_t)departureTimeDisplayStyle
{
  unint64_t result = (unint64_t)self->_line;
  if (result) {
    return (unint64_t)[(id)result departureTimeDisplayStyle];
  }
  return result;
}

- (BOOL)departuresAreVehicleSpecific
{
  line = self->_line;
  if (line) {
    LOBYTE(line) = [(GEOTransitLine *)line departuresAreVehicleSpecific];
  }
  return (char)line;
}

- (GEOTransitArtworkDataSource)artwork
{
  line = self->_line;
  if (line)
  {
    uint64_t v4 = [(GEOTransitLine *)line artwork];
  }
  else
  {
    uint64_t v4 = self->_labelMarker;
  }

  return v4;
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOTransitLine *)self->_line modeArtwork];
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOTransitLine *)self->_line headerArtwork];
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOTransitLine *)self->_line alternateArtwork];
}

- (BOOL)hasLineColorString
{
  line = self->_line;
  if (line) {
    LOBYTE(line) = [(GEOTransitLine *)line hasLineColorString];
  }
  return (char)line;
}

- (NSString)lineColorString
{
  return (NSString *)[(GEOTransitLine *)self->_line lineColorString];
}

- (BOOL)showVehicleNumber
{
  line = self->_line;
  if (line) {
    LOBYTE(line) = [(GEOTransitLine *)line showVehicleNumber];
  }
  return (char)line;
}

- (NSArray)operatingHours
{
  return (NSArray *)[(GEOTransitLine *)self->_line operatingHours];
}

- (NSArray)labelItems
{
  return 0;
}

- (GEOTransitAttribution)attribution
{
  return 0;
}

- (GEOMapRegion)mapRegion
{
  return 0;
}

- (NSArray)incidents
{
  return 0;
}

- (BOOL)isIncidentsTTLExpired
{
  return 0;
}

- (BOOL)hasIncidentComponent
{
  return 0;
}

- (BOOL)hasEncyclopedicInfo
{
  return 0;
}

- (GEOEncyclopedicInfo)encyclopedicInfo
{
  return 0;
}

- (BOOL)isBus
{
  return [(GEOTransitLine *)self->_line isBus];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_line, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end