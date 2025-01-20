@interface _MapsCustomRouteDirectionsRequestTicket
- (_MapsCustomRouteDirectionsRequestTicket)initWithRequestDetails:(id)a3;
- (void)cancel;
- (void)submitWithHandler:(id)a3;
@end

@implementation _MapsCustomRouteDirectionsRequestTicket

- (_MapsCustomRouteDirectionsRequestTicket)initWithRequestDetails:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MapsCustomRouteDirectionsRequestTicket;
  v6 = [(_MapsCustomRouteDirectionsRequestTicket *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_directionsRequestDetails, a3);
  }

  return v7;
}

- (void)submitWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MNDirectionsRequestDetails *)self->_directionsRequestDetails persistentData];
  v6 = +[GEOComposedRoute _maps_composedRouteWithPersistentData:v5];

  v7 = [(MNDirectionsRequestDetails *)self->_directionsRequestDetails traits];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10098D714;
  v13[3] = &unk_1012F68F8;
  id v14 = v4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10098D730;
  v11[3] = &unk_1013125F8;
  id v12 = v14;
  id v8 = v14;
  [v6 _maps_convertToNavigableRouteWithTraits:v7 errorHandler:v13 completionHandler:v11];
  objc_super v9 = (MNRouteEditorRequestTicket *)objc_claimAutoreleasedReturnValue();
  ticket = self->_ticket;
  self->_ticket = v9;
}

- (void)cancel
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);

  objc_storeStrong((id *)&self->_directionsRequestDetails, 0);
}

@end