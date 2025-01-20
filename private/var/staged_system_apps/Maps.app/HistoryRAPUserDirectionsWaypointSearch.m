@interface HistoryRAPUserDirectionsWaypointSearch
+ (void)loadAllRequestsFromStorage:(id)a3 completion:(id)a4;
- (BOOL)hasOriginatingAuxiliaryControlIndex;
- (HistoryEntryRecentsItem)historyItem;
- (HistoryRAPUserDirectionsWaypointSearch)initWithHistoryItem:(id)a3 recording:(id)a4 waypointIndex:(unint64_t)a5;
- (NSArray)auxiliaryControls;
- (NSString)locationDisplayString;
- (NSString)searchText;
- (SearchResult)searchResult;
- (id)correctedSearchTemplate;
- (id)geoMapItemForSearchResultAtIndex:(unint64_t)a3;
- (unint64_t)originatingAuxiliaryControlIndex;
- (unint64_t)searchResultsCount;
- (unint64_t)waypointIndex;
- (void)applyToCorrectedSearch:(id)a3;
@end

@implementation HistoryRAPUserDirectionsWaypointSearch

+ (void)loadAllRequestsFromStorage:(id)a3 completion:(id)a4
{
  id v4 = a4;
  v5 = +[RAPStorageHistoryContainer directionsRecordingStorage];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A81FE8;
  v7[3] = &unk_101315D98;
  id v8 = v4;
  id v6 = v4;
  [v5 loadAllRecordingsWithConcurrentBlock:v7];
}

- (HistoryRAPUserDirectionsWaypointSearch)initWithHistoryItem:(id)a3 recording:(id)a4 waypointIndex:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HistoryRAPUserDirectionsWaypointSearch;
  v11 = [(HistoryRAPUserDirectionsWaypointSearch *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_historyItem, a3);
    v12->_waypointIndex = a5;
    objc_storeStrong((id *)&v12->_recording, a4);
    v13 = [v10 auxiliaryControls];
    v14 = (NSArray *)[v13 copy];
    auxiliaryControls = v12->_auxiliaryControls;
    v12->_auxiliaryControls = v14;

    if ([v10 hasOriginatingAuxiliaryControlIndex])
    {
      v12->_hasOriginatingAuxiliaryControlIndex = 1;
      v12->_originatingAuxiliaryControlIndex = (unint64_t)[v10 originatingAuxiliaryControlIndex];
    }
  }

  return v12;
}

- (SearchResult)searchResult
{
  unint64_t v3 = [(HistoryRAPUserDirectionsWaypointSearch *)self waypointIndex];
  if (v3 == 1)
  {
    id v4 = [(HistoryRAPUserDirectionsWaypointSearch *)self historyItem];
    v5 = [v4 historyEntry];
    id v6 = (id *)&v11;
    id v8 = &v11;
    v7 = 0;
    goto LABEL_5;
  }
  if (!v3)
  {
    uint64_t v12 = 0;
    id v4 = [(HistoryRAPUserDirectionsWaypointSearch *)self historyItem];
    v5 = [v4 historyEntry];
    id v6 = (id *)&v12;
    v7 = &v12;
    id v8 = 0;
LABEL_5:
    +[SearchResult newStartWaypointSearchResult:v7 endWaypointSearchResult:v8 forRouteHistoryEntry:v5];
    id v9 = *v6;

    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return (SearchResult *)v9;
}

- (id)correctedSearchTemplate
{
  unint64_t v3 = [(HistoryRAPUserDirectionsWaypointSearch *)self waypointIndex];
  if (v3 == 1)
  {
    id v4 = [(RAPDirectionsRecording *)self->_recording endWaypointCorrectedSearchTemplate];
  }
  else if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(RAPDirectionsRecording *)self->_recording startWaypointCorrectedSearchTemplate];
  }

  return v4;
}

- (HistoryEntryRecentsItem)historyItem
{
  return self->_historyItem;
}

- (NSString)searchText
{
  unint64_t v3 = [(HistoryRAPUserDirectionsWaypointSearch *)self waypointIndex];
  if (v3 == 1)
  {
    id v4 = [(RAPDirectionsRecording *)self->_recording endWaypoint];
    goto LABEL_5;
  }
  if (!v3)
  {
    id v4 = [(RAPDirectionsRecording *)self->_recording startWaypoint];
LABEL_5:
    v5 = v4;
    id v6 = [v4 searchString];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (NSString)locationDisplayString
{
  v2 = [(HistoryRAPUserDirectionsWaypointSearch *)self searchResult];
  unint64_t v3 = [v2 locationTitle];

  return (NSString *)v3;
}

- (unint64_t)searchResultsCount
{
  v2 = [(HistoryRAPUserDirectionsWaypointSearch *)self searchResult];
  unint64_t v3 = v2 != 0;

  return v3;
}

- (void)applyToCorrectedSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(HistoryRAPUserDirectionsWaypointSearch *)self correctedSearchTemplate];
  [v5 copyTo:v4];
}

- (id)geoMapItemForSearchResultAtIndex:(unint64_t)a3
{
  id v4 = [(HistoryRAPUserDirectionsWaypointSearch *)self correctedSearchTemplate];
  id v5 = [v4 placeResponse];
  id v6 = [v5 resultsWithResultType:1];

  v7 = [v6 objectAtIndexedSubscript:a3];
  id v8 = [v7 geoMapItem];

  return v8;
}

- (unint64_t)waypointIndex
{
  return self->_waypointIndex;
}

- (NSArray)auxiliaryControls
{
  return self->_auxiliaryControls;
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return self->_hasOriginatingAuxiliaryControlIndex;
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
  objc_storeStrong((id *)&self->_historyItem, 0);

  objc_storeStrong((id *)&self->_recording, 0);
}

@end