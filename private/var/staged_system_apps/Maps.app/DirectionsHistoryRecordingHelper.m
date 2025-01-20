@interface DirectionsHistoryRecordingHelper
+ (id)destinationGEOMapItemToRecordWithDirectionIntent:(id)a3 searchResults:(id)a4;
+ (id)destinationGEOMapItemToRecordWithDirectionItem:(id)a3;
@end

@implementation DirectionsHistoryRecordingHelper

+ (id)destinationGEOMapItemToRecordWithDirectionIntent:(id)a3 searchResults:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 origin];
  unsigned int v8 = [v7 itemType];

  if (v8 != 4) {
    goto LABEL_6;
  }
  v9 = [v5 destination];
  unsigned int v10 = [v9 itemType];

  if (v10 != 5) {
    goto LABEL_6;
  }
  v11 = [v5 destination];
  if (![v11 hasResultIndex])
  {
    v17 = 0;
    goto LABEL_11;
  }
  v12 = [v5 destination];
  id v13 = [v12 resultIndex];
  id v14 = [v6 count];

  if (v13 >= v14)
  {
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  v15 = [v5 destination];
  v11 = [v6 objectAtIndexedSubscript:[v15 resultIndex]];

  v16 = [v11 mapItem];
  v17 = [v16 _geoMapItem];

LABEL_11:
LABEL_7:

  return v17;
}

+ (id)destinationGEOMapItemToRecordWithDirectionItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 startMapItem];
  unsigned int v5 = [v4 isCurrentLocation];

  if (v5)
  {
    id v6 = [v3 items];
    v7 = [v6 lastObject];
    unsigned int v8 = [v7 mapItemIfGeocoded];
    v9 = [v8 _geoMapItem];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end