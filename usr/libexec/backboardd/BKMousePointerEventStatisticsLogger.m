@interface BKMousePointerEventStatisticsLogger
- (BKMousePointerEventStatisticsLogger)init;
- (void)dealloc;
@end

@implementation BKMousePointerEventStatisticsLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGlobalRoutePID, 0);
  objc_storeStrong((id *)&self->_lastGlobalRouteContextID, 0);
  objc_storeStrong((id *)&self->_globalRoutes, 0);
  objc_storeStrong((id *)&self->_lastPID, 0);
  objc_storeStrong((id *)&self->_lastContextID, 0);
  objc_storeStrong((id *)&self->_digitizerSequenceCount, 0);
  objc_storeStrong((id *)&self->_rotationSequenceCount, 0);
  objc_storeStrong((id *)&self->_translationSequenceCount, 0);
  objc_storeStrong((id *)&self->_scaleSequenceCount, 0);
  objc_storeStrong((id *)&self->_scrollSequenceCount, 0);
  objc_storeStrong((id *)&self->_pointerEventCount, 0);

  objc_storeStrong((id *)&self->_loggingController, 0);
}

- (void)dealloc
{
  [(BKEventStatisticsLoggingController *)self->_loggingController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKMousePointerEventStatisticsLogger;
  [(BKMousePointerEventStatisticsLogger *)&v3 dealloc];
}

- (BKMousePointerEventStatisticsLogger)init
{
  v40.receiver = self;
  v40.super_class = (Class)BKMousePointerEventStatisticsLogger;
  v2 = [(BKMousePointerEventStatisticsLogger *)&v40 init];
  if (v2)
  {
    uint64_t v3 = +[BKEventStatistic statisticWithLabel:@"move"];
    pointerEventCount = v2->_pointerEventCount;
    v2->_pointerEventCount = (BKIntegerEventStatistic *)v3;

    uint64_t v5 = +[BKEventStatistic statisticWithLabel:@"scroll"];
    scrollSequenceCount = v2->_scrollSequenceCount;
    v2->_scrollSequenceCount = (BKIntegerEventStatistic *)v5;

    uint64_t v7 = +[BKEventStatistic statisticWithLabel:@"scale"];
    scaleSequenceCount = v2->_scaleSequenceCount;
    v2->_scaleSequenceCount = (BKIntegerEventStatistic *)v7;

    uint64_t v9 = +[BKEventStatistic statisticWithLabel:@"translation"];
    translationSequenceCount = v2->_translationSequenceCount;
    v2->_translationSequenceCount = (BKIntegerEventStatistic *)v9;

    uint64_t v11 = +[BKEventStatistic statisticWithLabel:@"rotation"];
    rotationSequenceCount = v2->_rotationSequenceCount;
    v2->_rotationSequenceCount = (BKIntegerEventStatistic *)v11;

    uint64_t v13 = +[BKEventStatistic statisticWithLabel:@"touchUp"];
    digitizerSequenceCount = v2->_digitizerSequenceCount;
    v2->_digitizerSequenceCount = (BKIntegerEventStatistic *)v13;

    uint64_t v15 = +[BKEventStatistic statisticWithLabel:@"lastContextID"];
    lastContextID = v2->_lastContextID;
    v2->_lastContextID = (BKHexadecimalIntegerEventStatistic *)v15;

    uint64_t v17 = +[BKEventStatistic statisticWithLabel:@"lastPID"];
    lastPID = v2->_lastPID;
    v2->_lastPID = (BKIntegerEventStatistic *)v17;

    uint64_t v19 = +[BKMRUEventStatistics statisticsWithLabel:@"recentGlobalRoutes" capacity:100];
    globalRoutes = v2->_globalRoutes;
    v2->_globalRoutes = (BKMRUEventStatistics *)v19;

    uint64_t v21 = +[BKEventStatistic statisticWithLabel:@"contextID"];
    lastGlobalRouteContextID = v2->_lastGlobalRouteContextID;
    v2->_lastGlobalRouteContextID = (BKHexadecimalIntegerEventStatistic *)v21;

    uint64_t v23 = +[BKEventStatistic statisticWithLabel:@"pid"];
    lastGlobalRoutePID = v2->_lastGlobalRoutePID;
    v2->_lastGlobalRoutePID = (BKIntegerEventStatistic *)v23;

    v25 = [BKEventStatisticsLoggingController alloc];
    v26 = BKLogMousePointer();
    v27 = [(BKEventStatisticsLoggingController *)v25 initWithLabel:@"mouse" logCategory:v26];
    loggingController = v2->_loggingController;
    v2->_loggingController = v27;

    v29 = v2->_loggingController;
    v30 = v2->_scrollSequenceCount;
    v31 = v2->_scaleSequenceCount;
    v41[0] = v2->_pointerEventCount;
    v41[1] = v30;
    v32 = v2->_translationSequenceCount;
    v33 = v2->_rotationSequenceCount;
    v41[2] = v31;
    v41[3] = v32;
    v34 = v2->_digitizerSequenceCount;
    v35 = v2->_lastContextID;
    v41[4] = v33;
    v41[5] = v34;
    v36 = v2->_lastPID;
    v37 = v2->_globalRoutes;
    v41[6] = v35;
    v41[7] = v36;
    v41[8] = v37;
    v38 = +[NSArray arrayWithObjects:v41 count:9];
    [(BKEventStatisticsLoggingController *)v29 setStatistics:v38];
  }
  return v2;
}

@end