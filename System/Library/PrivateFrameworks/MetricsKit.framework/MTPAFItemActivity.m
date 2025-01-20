@interface MTPAFItemActivity
- (MTMediaActivityEventHandler)startEventHandler;
- (MTMediaActivityEventHandler)stopEventHandler;
- (MTMetricsData)startMetricsData;
- (MTMetricsData)stopMetricsData;
- (MTPAFPlaylist)playlist;
- (MTPAFPlaylistItem)item;
- (void)populatePlaylistAndItemData:(id)a3;
- (void)setItem:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setStartEventHandler:(id)a3;
- (void)setStartMetricsData:(id)a3;
- (void)setStopEventHandler:(id)a3;
- (void)setStopMetricsData:(id)a3;
- (void)startAtOverallPosition:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6;
- (void)stopAtOverallPosition:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6;
@end

@implementation MTPAFItemActivity

- (void)startAtOverallPosition:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v21 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [(MTPAFItemActivity *)self item];
  unint64_t v13 = [v12 start];

  if (v13 > a3)
  {
    v14 = [(MTPAFItemActivity *)self item];
    a3 = [v14 start];
  }
  v15 = [(MTPAFItemActivity *)self item];
  uint64_t v16 = [v15 start];

  v17 = [MEMORY[0x263EFF980] array];
  [(MTPAFItemActivity *)self populatePlaylistAndItemData:v17];
  if (v21) {
    [v17 addObjectsFromArray:v21];
  }
  v18 = [(MTPAFItemActivity *)self startEventHandler];
  v19 = [v18 metricsDataForStartActionWithPosition:a3 - v16 overallPosition:a3 type:v11 reason:v10 eventData:v17];

  id v20 = (id)[v19 recordEvent];
  [(MTPAFItemActivity *)self setStartMetricsData:v19];
}

- (void)stopAtOverallPosition:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v22 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [(MTPAFItemActivity *)self item];
  unint64_t v13 = [v12 end];

  if (v13 < a3)
  {
    v14 = [(MTPAFItemActivity *)self item];
    a3 = [v14 end];
  }
  v15 = [(MTPAFItemActivity *)self item];
  uint64_t v16 = [v15 start];

  v17 = [MEMORY[0x263EFF980] array];
  [(MTPAFItemActivity *)self populatePlaylistAndItemData:v17];
  if (v22) {
    [v17 addObjectsFromArray:v22];
  }
  v18 = [(MTPAFItemActivity *)self stopEventHandler];
  v19 = [(MTPAFItemActivity *)self startMetricsData];
  id v20 = [v18 metricsDataForStopActionWithPosition:a3 - v16 overallPosition:a3 type:v11 reason:v10 startMetricsData:v19 eventData:v17];

  id v21 = (id)[v20 recordEvent];
  [(MTPAFItemActivity *)self setStopMetricsData:v20];
}

- (void)populatePlaylistAndItemData:(id)a3
{
  id v8 = a3;
  v4 = [(MTPAFItemActivity *)self playlist];
  v5 = [v4 metricsData];

  if (v5) {
    [v8 addObjectsFromArray:v5];
  }
  v6 = [(MTPAFItemActivity *)self item];
  v7 = [v6 metricsData];

  if (v7) {
    [v8 addObjectsFromArray:v7];
  }
}

- (MTPAFPlaylistItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (MTPAFPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (MTMediaActivityEventHandler)startEventHandler
{
  return self->_startEventHandler;
}

- (void)setStartEventHandler:(id)a3
{
}

- (MTMediaActivityEventHandler)stopEventHandler
{
  return self->_stopEventHandler;
}

- (void)setStopEventHandler:(id)a3
{
}

- (MTMetricsData)startMetricsData
{
  return self->_startMetricsData;
}

- (void)setStartMetricsData:(id)a3
{
}

- (MTMetricsData)stopMetricsData
{
  return self->_stopMetricsData;
}

- (void)setStopMetricsData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopMetricsData, 0);
  objc_storeStrong((id *)&self->_startMetricsData, 0);
  objc_storeStrong((id *)&self->_stopEventHandler, 0);
  objc_storeStrong((id *)&self->_startEventHandler, 0);
  objc_storeStrong((id *)&self->_playlist, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end