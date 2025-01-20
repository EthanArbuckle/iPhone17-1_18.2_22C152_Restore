@interface SearchPlaceDisplayHistoryRecorder
- (MSPMutableHistoryEntryPlaceDisplay)placeDisplayHistoryItem;
- (SearchPlaceDisplayHistoryRecorder)initWithGEOMapItem:(id)a3;
- (SearchPlaceDisplayHistoryRecorder)initWithGEOMapItem:(id)a3 placeDisplayHistoryItem:(id)a4;
- (void)recordItemInHistory;
- (void)setPlaceDisplayHistoryItem:(id)a3;
@end

@implementation SearchPlaceDisplayHistoryRecorder

- (SearchPlaceDisplayHistoryRecorder)initWithGEOMapItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MSPMutableHistoryEntryPlaceDisplay);
  v6 = [(SearchPlaceDisplayHistoryRecorder *)self initWithGEOMapItem:v4 placeDisplayHistoryItem:v5];

  return v6;
}

- (SearchPlaceDisplayHistoryRecorder)initWithGEOMapItem:(id)a3 placeDisplayHistoryItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SearchPlaceDisplayHistoryRecorder;
  v8 = [(SearchPlaceDisplayHistoryRecorder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_placeDisplayHistoryItem, a4);
    [(MSPMutableHistoryEntryPlaceDisplay *)v9->_placeDisplayHistoryItem setGeoMapItem:v6];
  }

  return v9;
}

- (void)recordItemInHistory
{
  id v2 = [(MSPMutableHistoryEntryPlaceDisplay *)self->_placeDisplayHistoryItem geoMapItem];
  +[HistoryEntryRecentsItem saveGeoMapItem:v2];
}

- (MSPMutableHistoryEntryPlaceDisplay)placeDisplayHistoryItem
{
  return self->_placeDisplayHistoryItem;
}

- (void)setPlaceDisplayHistoryItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end