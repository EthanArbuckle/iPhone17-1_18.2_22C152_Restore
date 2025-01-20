@interface MergedTransitRoutingIncidentMessage
- (GEOComposedRouteAdvisory)advisory;
- (MergedTransitRoutingIncidentMessage)initWithGEOComposedRouteAdvisory:(id)a3 transitIncidents:(id)a4;
- (MergedTransitRoutingIncidentMessage)initWithTransitIncidents:(id)a3;
- (NSArray)transitIncidents;
- (NSString)routingMessage;
@end

@implementation MergedTransitRoutingIncidentMessage

- (MergedTransitRoutingIncidentMessage)initWithTransitIncidents:(id)a3
{
  return [(MergedTransitRoutingIncidentMessage *)self initWithGEOComposedRouteAdvisory:0 transitIncidents:a3];
}

- (MergedTransitRoutingIncidentMessage)initWithGEOComposedRouteAdvisory:(id)a3 transitIncidents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MergedTransitRoutingIncidentMessage;
  v9 = [(MergedTransitRoutingIncidentMessage *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_advisory, a3);
    v11 = (NSArray *)[v8 copy];
    transitIncidents = v10->_transitIncidents;
    v10->_transitIncidents = v11;

    if (v10->_advisory)
    {
      v13 = [v7 titleString];
      uint64_t v14 = [v13 stringWithDefaultOptions];
    }
    else
    {
      if ((id)[(NSArray *)v10->_transitIncidents count] == (id)1)
      {
        v13 = [(NSArray *)v10->_transitIncidents objectAtIndexedSubscript:0];
        v15 = [v13 title];
        v16 = (NSString *)[v15 copy];
        routingMessage = v10->_routingMessage;
        v10->_routingMessage = v16;

LABEL_8:
        goto LABEL_9;
      }
      v18 = +[NSBundle mainBundle];
      v13 = [v18 localizedStringForKey:@"Transit_Routing_Incident_Message_Multiple_Incidents_Synthesized_Title" value:@"localized string not found" table:0];

      uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, [(NSArray *)v10->_transitIncidents count]);
    }
    v15 = v10->_routingMessage;
    v10->_routingMessage = (NSString *)v14;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (NSString)routingMessage
{
  return self->_routingMessage;
}

- (NSArray)transitIncidents
{
  return self->_transitIncidents;
}

- (GEOComposedRouteAdvisory)advisory
{
  return self->_advisory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisory, 0);
  objc_storeStrong((id *)&self->_transitIncidents, 0);

  objc_storeStrong((id *)&self->_routingMessage, 0);
}

@end