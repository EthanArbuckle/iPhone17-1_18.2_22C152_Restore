@interface WLMigrationContext
- (NSArray)importErrors;
- (NSDate)lastProgressSentDate;
- (NSDate)throughputSegmentStartDate;
- (NSMutableArray)migrators;
- (NSMutableArray)throughputSamples;
- (WLDataMigrationDelegate)delegate;
- (WLMigrationContext)init;
- (WLMigrationDataCoordinator)dataCoordinator;
- (WLMigrationDataSource)dataSource;
- (WLPayload)payload;
- (WLSQLController)sqlController;
- (WLSourceDevice)sourceDevice;
- (WLSourceDeviceMigrationMetadata)metadata;
- (WLStatistics)aggregateStatistics;
- (WLTimeEstimateAccuracyTracker)timeEstimateAccuracyTracker;
- (WLURLSessionController)urlSessionController;
- (double)lastProgressSentToAndroidDevice;
- (double)progress;
- (unint64_t)completedDownloadSegmentCount;
- (unint64_t)expectedDownloadBytesRemainingForItemsWithConcreteSizes;
- (unint64_t)expectedDownloadSegmentsRemaining;
- (unint64_t)expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes;
- (unint64_t)throughputBytesInCurrentPeriod;
- (unint64_t)throughputSegmentsInCurrentPeriod;
- (void)powerAssertion;
- (void)setAggregateStatistics:(id)a3;
- (void)setCompletedDownloadSegmentCount:(unint64_t)a3;
- (void)setDataCoordinator:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpectedDownloadBytesRemainingForItemsWithConcreteSizes:(unint64_t)a3;
- (void)setExpectedDownloadSegmentsRemaining:(unint64_t)a3;
- (void)setExpectedDownloadSegmentsRemainingForItemsWithEstimatedSizes:(unint64_t)a3;
- (void)setImportErrors:(id)a3;
- (void)setLastProgressSentDate:(id)a3;
- (void)setLastProgressSentToAndroidDevice:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setMigrators:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPowerAssertion:(void *)a3;
- (void)setProgress:(double)a3;
- (void)setSourceDevice:(id)a3;
- (void)setSqlController:(id)a3;
- (void)setThroughputBytesInCurrentPeriod:(unint64_t)a3;
- (void)setThroughputSamples:(id)a3;
- (void)setThroughputSegmentStartDate:(id)a3;
- (void)setThroughputSegmentsInCurrentPeriod:(unint64_t)a3;
- (void)setTimeEstimateAccuracyTracker:(id)a3;
- (void)setUrlSessionController:(id)a3;
@end

@implementation WLMigrationContext

- (WLMigrationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)WLMigrationContext;
  v2 = [(WLMigrationContext *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F862B8]);
    [(WLMigrationContext *)v2 setPayload:v3];
  }
  return v2;
}

- (WLSourceDevice)sourceDevice
{
  return self->_sourceDevice;
}

- (void)setSourceDevice:(id)a3
{
}

- (WLDataMigrationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(void *)a3
{
  self->_powerAssertion = a3;
}

- (WLMigrationDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (WLMigrationDataCoordinator)dataCoordinator
{
  return self->_dataCoordinator;
}

- (void)setDataCoordinator:(id)a3
{
}

- (WLSQLController)sqlController
{
  return self->_sqlController;
}

- (void)setSqlController:(id)a3
{
}

- (NSMutableArray)migrators
{
  return self->_migrators;
}

- (void)setMigrators:(id)a3
{
}

- (unint64_t)expectedDownloadSegmentsRemaining
{
  return self->_expectedDownloadSegmentsRemaining;
}

- (void)setExpectedDownloadSegmentsRemaining:(unint64_t)a3
{
  self->_expectedDownloadSegmentsRemaining = a3;
}

- (unint64_t)completedDownloadSegmentCount
{
  return self->_completedDownloadSegmentCount;
}

- (void)setCompletedDownloadSegmentCount:(unint64_t)a3
{
  self->_completedDownloadSegmentCount = a3;
}

- (unint64_t)expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes
{
  return self->_expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes;
}

- (void)setExpectedDownloadSegmentsRemainingForItemsWithEstimatedSizes:(unint64_t)a3
{
  self->_expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes = a3;
}

- (unint64_t)expectedDownloadBytesRemainingForItemsWithConcreteSizes
{
  return self->_expectedDownloadBytesRemainingForItemsWithConcreteSizes;
}

- (void)setExpectedDownloadBytesRemainingForItemsWithConcreteSizes:(unint64_t)a3
{
  self->_expectedDownloadBytesRemainingForItemsWithConcreteSizes = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)lastProgressSentToAndroidDevice
{
  return self->_lastProgressSentToAndroidDevice;
}

- (void)setLastProgressSentToAndroidDevice:(double)a3
{
  self->_lastProgressSentToAndroidDevice = a3;
}

- (NSDate)lastProgressSentDate
{
  return self->_lastProgressSentDate;
}

- (void)setLastProgressSentDate:(id)a3
{
}

- (NSDate)throughputSegmentStartDate
{
  return self->_throughputSegmentStartDate;
}

- (void)setThroughputSegmentStartDate:(id)a3
{
}

- (NSMutableArray)throughputSamples
{
  return self->_throughputSamples;
}

- (void)setThroughputSamples:(id)a3
{
}

- (unint64_t)throughputBytesInCurrentPeriod
{
  return self->_throughputBytesInCurrentPeriod;
}

- (void)setThroughputBytesInCurrentPeriod:(unint64_t)a3
{
  self->_throughputBytesInCurrentPeriod = a3;
}

- (unint64_t)throughputSegmentsInCurrentPeriod
{
  return self->_throughputSegmentsInCurrentPeriod;
}

- (void)setThroughputSegmentsInCurrentPeriod:(unint64_t)a3
{
  self->_throughputSegmentsInCurrentPeriod = a3;
}

- (WLTimeEstimateAccuracyTracker)timeEstimateAccuracyTracker
{
  return self->_timeEstimateAccuracyTracker;
}

- (void)setTimeEstimateAccuracyTracker:(id)a3
{
}

- (WLURLSessionController)urlSessionController
{
  return self->_urlSessionController;
}

- (void)setUrlSessionController:(id)a3
{
}

- (WLStatistics)aggregateStatistics
{
  return self->_aggregateStatistics;
}

- (void)setAggregateStatistics:(id)a3
{
}

- (WLSourceDeviceMigrationMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSArray)importErrors
{
  return self->_importErrors;
}

- (void)setImportErrors:(id)a3
{
}

- (WLPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_importErrors, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_aggregateStatistics, 0);
  objc_storeStrong((id *)&self->_urlSessionController, 0);
  objc_storeStrong((id *)&self->_timeEstimateAccuracyTracker, 0);
  objc_storeStrong((id *)&self->_throughputSamples, 0);
  objc_storeStrong((id *)&self->_throughputSegmentStartDate, 0);
  objc_storeStrong((id *)&self->_lastProgressSentDate, 0);
  objc_storeStrong((id *)&self->_migrators, 0);
  objc_storeStrong((id *)&self->_sqlController, 0);
  objc_storeStrong((id *)&self->_dataCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sourceDevice, 0);
}

@end