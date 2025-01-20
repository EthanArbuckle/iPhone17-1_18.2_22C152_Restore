@interface BKTouchDeliveryStatisticsLoggingObserver
- (BKTouchDeliveryStatisticsLoggingObserver)initWithLabel:(id)a3;
- (void)dealloc;
- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6;
- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4;
- (void)touchDidFinishProcessingTouchCollection;
- (void)touchDidHIDCancel:(unsigned int)a3;
- (void)touchDidSoftCancel:(unsigned int)a3;
- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4;
- (void)touchWillStartProcessingTouchCollection;
@end

@implementation BKTouchDeliveryStatisticsLoggingObserver

- (void)touch:(unsigned int)a3 didHitTestToDestination:(id)a4 hostingChainIndex:(int64_t)a5
{
  id v7 = a4;
  loggingController = self->_loggingController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000457C;
  v10[3] = &unk_1000F8EC8;
  unsigned int v12 = a3;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(BKEventStatisticsLoggingController *)loggingController updateStatistics:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logTransaction, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_touchProcessingTimeAverage, 0);
  objc_storeStrong((id *)&self->_pathsStillWithinRange, 0);
  objc_storeStrong((id *)&self->_pathsStillTouching, 0);
  objc_storeStrong((id *)&self->_pathsSeen, 0);
  objc_storeStrong((id *)&self->_fromEdgeCount, 0);
  objc_storeStrong((id *)&self->_transferredTouchCount, 0);
  objc_storeStrong((id *)&self->_detachedTouchCount, 0);
  objc_storeStrong((id *)&self->_stylusTouchCount, 0);
  objc_storeStrong((id *)&self->_tapToWakeCount, 0);
  objc_storeStrong((id *)&self->_softCancelCount, 0);
  objc_storeStrong((id *)&self->_hardCancelCount, 0);
  objc_storeStrong((id *)&self->_rangeOutCount, 0);
  objc_storeStrong((id *)&self->_rangeInCount, 0);
  objc_storeStrong((id *)&self->_touchDownCount, 0);
  objc_storeStrong((id *)&self->_touchUpCount, 0);

  objc_storeStrong((id *)&self->_loggingController, 0);
}

- (BKTouchDeliveryStatisticsLoggingObserver)initWithLabel:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BKTouchDeliveryStatisticsLoggingObserver;
  v5 = [(BKTouchDeliveryStatisticsLoggingObserver *)&v58 init];
  if (v5)
  {
    uint64_t v6 = +[BKEventStatistic statisticWithLabel:@"down"];
    touchDownCount = v5->_touchDownCount;
    v5->_touchDownCount = (BKIntegerEventStatistic *)v6;

    uint64_t v8 = +[BKEventStatistic statisticWithLabel:@"up"];
    touchUpCount = v5->_touchUpCount;
    v5->_touchUpCount = (BKIntegerEventStatistic *)v8;

    uint64_t v10 = +[BKEventStatistic statisticWithLabel:@"rangeIn"];
    rangeInCount = v5->_rangeInCount;
    v5->_rangeInCount = (BKIntegerEventStatistic *)v10;

    uint64_t v12 = +[BKEventStatistic statisticWithLabel:@"rangeOut"];
    rangeOutCount = v5->_rangeOutCount;
    v5->_rangeOutCount = (BKIntegerEventStatistic *)v12;

    uint64_t v14 = +[BKEventStatistic statisticWithLabel:@"HID cancel"];
    hardCancelCount = v5->_hardCancelCount;
    v5->_hardCancelCount = (BKIntegerEventStatistic *)v14;

    uint64_t v16 = +[BKEventStatistic statisticWithLabel:@"soft cancel"];
    softCancelCount = v5->_softCancelCount;
    v5->_softCancelCount = (BKIntegerEventStatistic *)v16;

    uint64_t v18 = +[BKEventStatistic statisticWithLabel:@"tapToWake"];
    tapToWakeCount = v5->_tapToWakeCount;
    v5->_tapToWakeCount = (BKIntegerEventStatistic *)v18;

    uint64_t v20 = +[BKEventStatistic statisticWithLabel:@"pencil"];
    stylusTouchCount = v5->_stylusTouchCount;
    v5->_stylusTouchCount = (BKIntegerEventStatistic *)v20;

    uint64_t v22 = +[BKEventStatistic statisticWithLabel:@"detached"];
    detachedTouchCount = v5->_detachedTouchCount;
    v5->_detachedTouchCount = (BKIntegerEventStatistic *)v22;

    uint64_t v24 = +[BKEventStatistic statisticWithLabel:@"transferred"];
    transferredTouchCount = v5->_transferredTouchCount;
    v5->_transferredTouchCount = (BKIntegerEventStatistic *)v24;

    uint64_t v26 = +[BKEventStatistic statisticWithLabel:@"fromEdge"];
    fromEdgeCount = v5->_fromEdgeCount;
    v5->_fromEdgeCount = (BKIntegerEventStatistic *)v26;

    uint64_t v28 = +[BKHexadecimalIntegerEventStatistic statisticWithLabel:@"pathsSeen" hexFormatModifier:1];
    pathsSeen = v5->_pathsSeen;
    v5->_pathsSeen = (BKHexadecimalIntegerEventStatistic *)v28;

    uint64_t v30 = +[BKHexadecimalIntegerEventStatistic statisticWithLabel:@"pathsStillTouching" hexFormatModifier:1];
    pathsStillTouching = v5->_pathsStillTouching;
    v5->_pathsStillTouching = (BKHexadecimalIntegerEventStatistic *)v30;

    [(BKEventStatistic *)v5->_pathsStillTouching setAutomaticResetDisabled:1];
    uint64_t v32 = +[BKHexadecimalIntegerEventStatistic statisticWithLabel:@"pathsStillWithinRange" hexFormatModifier:1];
    pathsStillWithinRange = v5->_pathsStillWithinRange;
    v5->_pathsStillWithinRange = (BKHexadecimalIntegerEventStatistic *)v32;

    [(BKEventStatistic *)v5->_pathsStillWithinRange setAutomaticResetDisabled:1];
    uint64_t v34 = +[BKAverageTimeIntervalEventStatistic statisticWithLabel:@"averageProcessingTime" scale:1000000];
    touchProcessingTimeAverage = v5->_touchProcessingTimeAverage;
    v5->_touchProcessingTimeAverage = (BKAverageTimeIntervalEventStatistic *)v34;

    v36 = objc_alloc_init(BKTouchDestinationStatistic);
    destinations = v5->_destinations;
    v5->_destinations = v36;

    v38 = [@"touchstats " stringByAppendingString:v4];
    v39 = [BKEventStatisticsLoggingController alloc];
    v40 = BKLogTouchEvents();
    v41 = [(BKEventStatisticsLoggingController *)v39 initWithLabel:v38 logCategory:v40];
    loggingController = v5->_loggingController;
    v5->_loggingController = v41;

    v44 = v5->_loggingController;
    v43 = v5->_touchUpCount;
    v45 = v5->_rangeInCount;
    v59[0] = v5->_touchDownCount;
    v59[1] = v43;
    v46 = v5->_rangeOutCount;
    v47 = v5->_hardCancelCount;
    v59[2] = v45;
    v59[3] = v46;
    v48 = v5->_softCancelCount;
    v49 = v5->_stylusTouchCount;
    v50 = v5->_detachedTouchCount;
    v59[4] = v5->_tapToWakeCount;
    v59[5] = v49;
    v59[6] = v47;
    v59[7] = v48;
    v51 = v5->_transferredTouchCount;
    v59[8] = v5->_fromEdgeCount;
    v59[9] = v50;
    v52 = v5->_pathsSeen;
    v53 = v5->_pathsStillTouching;
    v59[10] = v51;
    v59[11] = v52;
    v55 = v5->_touchProcessingTimeAverage;
    v54 = v5->_destinations;
    v59[12] = v53;
    v59[13] = v54;
    v59[14] = v55;
    v56 = +[NSArray arrayWithObjects:v59 count:15];
    [(BKEventStatisticsLoggingController *)v44 setStatistics:v56];
  }
  return v5;
}

- (void)touchWillStartProcessingTouchCollection
{
  loggingController = self->_loggingController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E304;
  v3[3] = &unk_1000F8C30;
  v3[4] = self;
  v3[5] = a2;
  [(BKEventStatisticsLoggingController *)loggingController updateStatistics:v3];
}

- (void)touchDidFinishProcessingTouchCollection
{
  loggingController = self->_loggingController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E0F8;
  v3[3] = &unk_1000F8E78;
  v3[4] = self;
  [(BKEventStatisticsLoggingController *)loggingController updateStatistics:v3];
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  loggingController = self->_loggingController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A940;
  v7[3] = &unk_1000F8C30;
  v7[4] = self;
  v7[5] = a4;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v7, a4, a6);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeOutAtPoint:(CGPoint)a5
{
  loggingController = self->_loggingController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001A990;
  v6[3] = &unk_1000F8C30;
  v6[4] = self;
  v6[5] = a4;
  [(BKEventStatisticsLoggingController *)loggingController updateStatistics:v6];
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 rangeInAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 z:(double)a7 maxZ:(double)a8 transducerType:(unsigned int)a9
{
  loggingController = self->_loggingController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E0A8;
  v10[3] = &unk_1000F8C30;
  v10[4] = self;
  void v10[5] = a4;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v10, a4, *(void *)&a6, *(void *)&a9);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 downAtPoint:(CGPoint)a5 eventMask:(unsigned int)a6 transducerType:(unsigned int)a7
{
  loggingController = self->_loggingController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E584;
  v8[3] = &unk_1000F8C58;
  v8[4] = self;
  v8[5] = a4;
  unsigned int v9 = a7;
  unsigned int v10 = a6;
  [(BKEventStatisticsLoggingController *)loggingController updateStatistics:v8];
}

- (void)dealloc
{
  [(BKEventStatisticsLoggingController *)self->_loggingController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKTouchDeliveryStatisticsLoggingObserver;
  [(BKTouchDeliveryStatisticsLoggingObserver *)&v3 dealloc];
}

- (void)touchDidSoftCancel:(unsigned int)a3
{
  loggingController = self->_loggingController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100096BE8;
  v4[3] = &unk_1000F8E78;
  v4[4] = self;
  [(BKEventStatisticsLoggingController *)loggingController updateStatistics:v4];
}

- (void)touchDidHIDCancel:(unsigned int)a3
{
  loggingController = self->_loggingController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100096C68;
  v4[3] = &unk_1000F8E78;
  v4[4] = self;
  [(BKEventStatisticsLoggingController *)loggingController updateStatistics:v4];
}

- (void)touchDidTransfer:(unsigned int)a3 destination:(id)a4
{
  loggingController = self->_loggingController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100096CE8;
  v5[3] = &unk_1000F8E78;
  v5[4] = self;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v5, a4);
}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  loggingController = self->_loggingController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100096D68;
  v5[3] = &unk_1000F8E78;
  v5[4] = self;
  -[BKEventStatisticsLoggingController updateStatistics:](loggingController, "updateStatistics:", v5, a4);
}

@end