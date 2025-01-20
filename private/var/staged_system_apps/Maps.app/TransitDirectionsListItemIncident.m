@interface TransitDirectionsListItemIncident
- (GEOTransitRoutingIncidentMessage)incidentMessage;
- (TransitDirectionsListItemIncident)initWithIncidentMessage:(id)a3;
@end

@implementation TransitDirectionsListItemIncident

- (TransitDirectionsListItemIncident)initWithIncidentMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsListItemIncident;
  v6 = [(TransitDirectionsListItem *)&v9 initWithInstructions:0];
  v7 = v6;
  if (v6)
  {
    [(TransitDirectionsListItem *)v6 setType:13];
    objc_storeStrong((id *)&v7->_incidentMessage, a3);
  }

  return v7;
}

- (GEOTransitRoutingIncidentMessage)incidentMessage
{
  return self->_incidentMessage;
}

- (void).cxx_destruct
{
}

@end