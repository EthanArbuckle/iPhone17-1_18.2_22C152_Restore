@interface HistoryRAPUserDirectionRequest
+ (void)loadAllRequestsFromStorage:(id)a3 completion:(id)a4;
- (HistoryEntryRecentsItem)historyItem;
- (HistoryRAPUserDirectionRequest)initWithHistoryItem:(id)a3 recording:(id)a4;
- (NSString)locationDisplayString;
- (NSString)searchText;
- (RAPDirectionsRecording)recording;
- (int)requestedTransportType;
- (unint64_t)searchResultsCount;
@end

@implementation HistoryRAPUserDirectionRequest

+ (void)loadAllRequestsFromStorage:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[RAPStorageHistoryContainer directionsRecordingStorage];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A81A10;
  v8[3] = &unk_101315D70;
  id v9 = v5;
  id v10 = a1;
  id v7 = v5;
  [v6 loadAllRecordingsWithConcurrentBlock:v8];
}

- (HistoryRAPUserDirectionRequest)initWithHistoryItem:(id)a3 recording:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HistoryRAPUserDirectionRequest;
  v8 = [(HistoryRAPUserDirectionRequest *)&v12 init];
  if (v8)
  {
    id v9 = [[HistoryEntryRecentsItem alloc] initWithHistoryEntry:v6];
    historyItem = v8->_historyItem;
    v8->_historyItem = v9;

    objc_storeStrong((id *)&v8->_recording, a4);
  }

  return v8;
}

- (int)requestedTransportType
{
  recording = self->_recording;
  if (recording)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v4 = [(RAPDirectionsRecording *)recording directionsRequests];
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v10 = [v9 routeAttributes];
          unsigned __int8 v11 = [v10 hasMainTransportType];

          if (v11)
          {
            v13 = [v9 routeAttributes];
            int v12 = [v13 mainTransportType];

            goto LABEL_19;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  v4 = [(HistoryEntryRecentsItem *)self->_historyItem historyEntry];
  switch((unint64_t)[v4 transportType])
  {
    case 1uLL:
      int v12 = 0;
      break;
    case 2uLL:
      int v12 = 2;
      break;
    case 3uLL:
      int v12 = 1;
      break;
    case 4uLL:
      int v12 = 6;
      break;
    case 5uLL:
      int v12 = 3;
      break;
    default:
      int v12 = 4;
      break;
  }
LABEL_19:

  return v12;
}

- (RAPDirectionsRecording)recording
{
  return self->_recording;
}

- (HistoryEntryRecentsItem)historyItem
{
  return self->_historyItem;
}

- (NSString)searchText
{
  return 0;
}

- (NSString)locationDisplayString
{
  return 0;
}

- (unint64_t)searchResultsCount
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyItem, 0);

  objc_storeStrong((id *)&self->_recording, 0);
}

@end