@interface RAPDisplayedDirectionsPlan
- (BOOL)getRoutesIndex:(unint64_t *)a3 directionsResponseIndex:(unint64_t *)a4 forRouteSuggestion:(id)a5;
- (NSArray)displayedRouteSuggestions;
- (RAPDirectionsRecording)recording;
- (RAPDisplayedDirectionsPlan)initWithRouteCollection:(id)a3 recording:(id)a4;
- (int)requestedTransportType;
@end

@implementation RAPDisplayedDirectionsPlan

- (RAPDisplayedDirectionsPlan)initWithRouteCollection:(id)a3 recording:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RAPDisplayedDirectionsPlan;
  v9 = [(RAPDisplayedDirectionsPlan *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_routeCollection, a3);
    objc_storeStrong((id *)&v10->_recording, a4);
  }

  return v10;
}

- (RAPDirectionsRecording)recording
{
  return self->_recording;
}

- (int)requestedTransportType
{
  recording = self->_recording;
  if (!recording) {
    return 4;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(RAPDirectionsRecording *)recording directionsRequests];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = [v8 routeAttributes];
        unsigned __int8 v10 = [v9 hasMainTransportType];

        if (v10)
        {
          objc_super v12 = [v8 routeAttributes];
          int v11 = [v12 mainTransportType];

          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v11 = 4;
LABEL_12:

  return v11;
}

- (NSArray)displayedRouteSuggestions
{
  return [(RouteCollection *)self->_routeCollection routes];
}

- (BOOL)getRoutesIndex:(unint64_t *)a3 directionsResponseIndex:(unint64_t *)a4 forRouteSuggestion:(id)a5
{
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  int v11 = [(RAPDirectionsRecording *)self->_recording directionsResponses];
  id v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    while (1)
    {
      long long v14 = [(RAPDirectionsRecording *)self->_recording directionsResponses];
      long long v15 = [v14 objectAtIndexedSubscript:v13];

      long long v16 = [v15 directionsResponseID];
      long long v17 = [v10 directionsResponseID];
      unsigned int v18 = [v16 isEqualToData:v17];

      if (v18) {
        break;
      }

      ++v13;
      v19 = [(RAPDirectionsRecording *)self->_recording directionsResponses];
      id v20 = [v19 count];

      if (v13 >= (unint64_t)v20) {
        goto LABEL_8;
      }
    }
    if (a3) {
      *a3 = (unint64_t)[v10 indexInResponse];
    }
    if (a4) {
      *a4 = v13;
    }

    BOOL v21 = 1;
  }
  else
  {
LABEL_8:
    BOOL v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recording, 0);

  objc_storeStrong((id *)&self->_routeCollection, 0);
}

@end