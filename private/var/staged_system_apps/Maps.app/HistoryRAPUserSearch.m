@interface HistoryRAPUserSearch
+ (void)loadAllSearchesFromStorage:(id)a3 completion:(id)a4;
- (BOOL)hasOriginatingAuxiliaryControlIndex;
- (HistoryEntryRecentsItem)historyItem;
- (HistoryRAPUserSearch)initWithHistoryItem:(id)a3 correctedSearchTemplate:(id)a4 auxiliaryControls:(id)a5 originatingIndex:(unint64_t)a6;
- (NSArray)auxiliaryControls;
- (NSString)locationDisplayString;
- (NSString)searchText;
- (id)geoMapItemForSearchResultAtIndex:(unint64_t)a3;
- (unint64_t)originatingAuxiliaryControlIndex;
- (unint64_t)searchResultsCount;
- (void)applyToCorrectedSearch:(id)a3;
@end

@implementation HistoryRAPUserSearch

+ (void)loadAllSearchesFromStorage:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A82784;
  v6[3] = &unk_101315D98;
  id v7 = a4;
  id v5 = v7;
  [a3 loadAllRecordingsWithConcurrentBlock:v6];
}

- (HistoryRAPUserSearch)initWithHistoryItem:(id)a3 correctedSearchTemplate:(id)a4 auxiliaryControls:(id)a5 originatingIndex:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HistoryRAPUserSearch;
  v14 = [(HistoryRAPUserSearch *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_historyItem, a3);
    objc_storeStrong((id *)&v15->_template, a4);
    v16 = (NSArray *)[v13 copy];
    auxiliaryControls = v15->_auxiliaryControls;
    v15->_auxiliaryControls = v16;

    if (a6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15->_hasOriginatingAuxiliaryControlIndex = 1;
      v15->_originatingAuxiliaryControlIndex = a6;
    }
    v18 = [(HistoryRAPUserSearch *)v15 historyItem];
    v19 = [v18 historyEntry];

    if ([v19 conformsToProtocol:&OBJC_PROTOCOL___MSPHistoryEntrySearch]) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    uint64_t v22 = [v21 query];
    searchText = v15->_searchText;
    v15->_searchText = (NSString *)v22;

    uint64_t v24 = [v21 locationDisplayString];

    locationDisplayString = v15->_locationDisplayString;
    v15->_locationDisplayString = (NSString *)v24;
  }
  return v15;
}

- (void)applyToCorrectedSearch:(id)a3
{
}

- (unint64_t)searchResultsCount
{
  v2 = [(GEORPCorrectedSearch *)self->_template placeResponse];
  id v3 = [v2 resultsCountWithResultType:1];

  return (unint64_t)v3;
}

- (id)geoMapItemForSearchResultAtIndex:(unint64_t)a3
{
  v4 = [(GEORPCorrectedSearch *)self->_template placeResponse];
  id v5 = [v4 resultsWithResultType:1];

  v6 = [v5 objectAtIndexedSubscript:a3];
  id v7 = [v6 geoMapItem];

  return v7;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (NSString)locationDisplayString
{
  return self->_locationDisplayString;
}

- (HistoryEntryRecentsItem)historyItem
{
  return self->_historyItem;
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
  objc_storeStrong((id *)&self->_locationDisplayString, 0);
  objc_storeStrong((id *)&self->_searchText, 0);

  objc_storeStrong((id *)&self->_template, 0);
}

@end