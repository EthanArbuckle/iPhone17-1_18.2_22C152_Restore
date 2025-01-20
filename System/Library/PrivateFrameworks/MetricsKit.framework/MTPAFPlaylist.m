@interface MTPAFPlaylist
- (MTPAFPlaylist)initWithSharedMetricsData:(id)a3;
- (NSArray)metricsData;
- (NSMutableArray)items;
- (id)currentItems;
- (void)addItemStartAtMilliseconds:(unint64_t)a3 durationMilliseconds:(unint64_t)a4 metricsData:(id)a5;
- (void)addItemStartAtMilliseconds:(unint64_t)a3 endAtMilliseconds:(unint64_t)a4 metricsData:(id)a5;
- (void)addItemStartAtSeconds:(double)a3 durationSeconds:(double)a4 metricsData:(id)a5;
- (void)setItems:(id)a3;
- (void)setMetricsData:(id)a3;
- (void)updateEventData:(id)a3;
@end

@implementation MTPAFPlaylist

- (MTPAFPlaylist)initWithSharedMetricsData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTPAFPlaylist;
  v5 = [(MTPAFPlaylist *)&v9 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "mt_deepCopy");
    [(MTPAFPlaylist *)v5 setMetricsData:v6];

    v7 = [MEMORY[0x263EFF980] array];
    [(MTPAFPlaylist *)v5 setItems:v7];
  }
  return v5;
}

- (id)currentItems
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MTPAFPlaylist *)v2 items];
  id v4 = (void *)[v3 copy];

  objc_sync_exit(v2);

  return v4;
}

- (void)addItemStartAtMilliseconds:(unint64_t)a3 endAtMilliseconds:(unint64_t)a4 metricsData:(id)a5
{
  id v11 = a5;
  v8 = [[MTPAFPlaylistItem alloc] initWithStart:a3 end:a4 metricsData:v11];
  objc_super v9 = self;
  objc_sync_enter(v9);
  v10 = [(MTPAFPlaylist *)v9 items];
  [v10 addObject:v8];

  objc_sync_exit(v9);
}

- (void)addItemStartAtMilliseconds:(unint64_t)a3 durationMilliseconds:(unint64_t)a4 metricsData:(id)a5
{
}

- (void)addItemStartAtSeconds:(double)a3 durationSeconds:(double)a4 metricsData:(id)a5
{
}

- (void)updateEventData:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(MTPAFPlaylist *)v4 metricsData];

  if (v5)
  {
    v6 = [(MTPAFPlaylist *)v4 metricsData];
    v7 = [v6 arrayByAddingObjectsFromArray:v8];
    [(MTPAFPlaylist *)v4 setMetricsData:v7];
  }
  else
  {
    [(MTPAFPlaylist *)v4 setMetricsData:v8];
  }
  objc_sync_exit(v4);
}

- (NSArray)metricsData
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMetricsData:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_metricsData, 0);
}

@end