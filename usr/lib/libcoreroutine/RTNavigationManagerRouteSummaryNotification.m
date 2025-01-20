@interface RTNavigationManagerRouteSummaryNotification
- (NSString)destinationName;
- (RTNavigationManagerRouteSummaryNotification)initWithRouteSummary:(id)a3;
- (double)destinationLatitude;
- (double)destinationLongitude;
- (double)originLatitude;
- (double)originLongitude;
- (id)description;
- (unint64_t)transportType;
- (void)setDestinationLatitude:(double)a3;
- (void)setDestinationLongitude:(double)a3;
- (void)setDestinationName:(id)a3;
- (void)setOriginLatitude:(double)a3;
- (void)setOriginLongitude:(double)a3;
@end

@implementation RTNavigationManagerRouteSummaryNotification

- (RTNavigationManagerRouteSummaryNotification)initWithRouteSummary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  v6 = [v4 origin];
  uint64_t v7 = [v6 latLng];
  if (!v7)
  {

    goto LABEL_8;
  }
  v8 = (void *)v7;
  v9 = [v5 destination];
  v10 = [v9 latLng];

  if (!v10)
  {
LABEL_8:
    v26 = 0;
    goto LABEL_9;
  }
  v28.receiver = self;
  v28.super_class = (Class)RTNavigationManagerRouteSummaryNotification;
  v11 = [(RTNotification *)&v28 init];
  if (v11)
  {
    v12 = [v5 origin];
    v13 = [v12 latLng];
    [v13 lat];
    v11->_originLatitude = v14;

    v15 = [v5 origin];
    v16 = [v15 latLng];
    [v16 lng];
    v11->_originLongitude = v17;

    uint64_t v18 = [v5 destinationName];
    destinationName = v11->_destinationName;
    v11->_destinationName = (NSString *)v18;

    v20 = [v5 destination];
    v21 = [v20 latLng];
    [v21 lat];
    v11->_destinationLatitude = v22;

    v23 = [v5 destination];
    v24 = [v23 latLng];
    [v24 lng];
    v11->_destinationLongitude = v25;

    v11->_transportType = (int)[v5 transportType];
  }
  self = v11;
  v26 = self;
LABEL_9:

  return v26;
}

- (id)description
{
  v3 = NSString;
  [(RTNavigationManagerRouteSummaryNotification *)self originLatitude];
  uint64_t v5 = v4;
  [(RTNavigationManagerRouteSummaryNotification *)self originLongitude];
  uint64_t v7 = v6;
  v8 = [(RTNavigationManagerRouteSummaryNotification *)self destinationName];
  [(RTNavigationManagerRouteSummaryNotification *)self destinationLatitude];
  uint64_t v10 = v9;
  [(RTNavigationManagerRouteSummaryNotification *)self destinationLongitude];
  v12 = [v3 stringWithFormat:@"origin location, <%f, %f>, destination name, %@, destination location, <%f, %f>", v5, v7, v8, v10, v11];

  return v12;
}

- (double)originLatitude
{
  return self->_originLatitude;
}

- (void)setOriginLatitude:(double)a3
{
  self->_originLatitude = a3;
}

- (double)originLongitude
{
  return self->_originLongitude;
}

- (void)setOriginLongitude:(double)a3
{
  self->_originLongitude = a3;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
}

- (double)destinationLatitude
{
  return self->_destinationLatitude;
}

- (void)setDestinationLatitude:(double)a3
{
  self->_destinationLatitude = a3;
}

- (double)destinationLongitude
{
  return self->_destinationLongitude;
}

- (void)setDestinationLongitude:(double)a3
{
  self->_destinationLongitude = a3;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void).cxx_destruct
{
}

@end