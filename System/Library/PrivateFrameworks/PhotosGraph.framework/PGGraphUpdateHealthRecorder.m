@interface PGGraphUpdateHealthRecorder
- (BOOL)isChangeConsumer;
- (id)initForChangeConsumer:(BOOL)a3 analytics:(id)a4;
- (unint64_t)maximumTransactionSize;
- (unint64_t)numberOfDatabaseChangesConvertedToGraphChangesInBackground;
- (unint64_t)numberOfDatabaseChangesConvertedToGraphChangesInForeground;
- (unint64_t)numberOfDatabaseChangesReceivedInBackground;
- (unint64_t)numberOfDatabaseChangesReceivedInForeground;
- (unint64_t)numberOfTimesGraphUpdatePaused;
- (void)beginRecording;
- (void)endRecordingInBackground:(BOOL)a3;
- (void)recordNumberOfDatabaseChangesConvertedToGraphChanges:(unint64_t)a3 inBackground:(BOOL)a4;
- (void)recordNumberOfDatabaseChangesReceived:(unint64_t)a3 inBackground:(BOOL)a4;
- (void)recordNumberOfDaysSinceMajorOSUpgrade:(unint64_t)a3;
- (void)recordNumberOfTimesGraphUpdatePaused:(unint64_t)a3;
- (void)recordTransactionSize:(unint64_t)a3;
@end

@implementation PGGraphUpdateHealthRecorder

- (void).cxx_destruct
{
}

- (BOOL)isChangeConsumer
{
  return self->_changeConsumer;
}

- (unint64_t)maximumTransactionSize
{
  return self->_maximumTransactionSize;
}

- (unint64_t)numberOfTimesGraphUpdatePaused
{
  return self->_numberOfTimesGraphUpdatePaused;
}

- (unint64_t)numberOfDatabaseChangesConvertedToGraphChangesInBackground
{
  return self->_numberOfDatabaseChangesConvertedToGraphChangesInBackground;
}

- (unint64_t)numberOfDatabaseChangesConvertedToGraphChangesInForeground
{
  return self->_numberOfDatabaseChangesConvertedToGraphChangesInForeground;
}

- (unint64_t)numberOfDatabaseChangesReceivedInBackground
{
  return self->_numberOfDatabaseChangesReceivedInBackground;
}

- (unint64_t)numberOfDatabaseChangesReceivedInForeground
{
  return self->_numberOfDatabaseChangesReceivedInForeground;
}

- (void)endRecordingInBackground:(BOOL)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  if (self->_changeConsumer)
  {
    if (a3)
    {
      unint64_t numberOfDatabaseChangesReceivedInBackground = self->_numberOfDatabaseChangesReceivedInBackground;
      if (numberOfDatabaseChangesReceivedInBackground)
      {
        double v5 = (double)self->_numberOfDatabaseChangesConvertedToGraphChangesInBackground
           / (double)numberOfDatabaseChangesReceivedInBackground;
        analytics = self->_analytics;
        v29[0] = @"numberOfDatabaseChangesReceivedInBackground";
        v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        v30[0] = v7;
        v29[1] = @"changeUsageRatio";
        v8 = [NSNumber numberWithDouble:v5];
        v30[1] = v8;
        v29[2] = @"numberOfDatabaseChangesConvertedToGraphChangesInBackground";
        v9 = [NSNumber numberWithUnsignedInteger:self->_numberOfDatabaseChangesConvertedToGraphChangesInBackground];
        v30[2] = v9;
        v10 = (void *)MEMORY[0x1E4F1C9E8];
        v11 = v30;
        v12 = v29;
LABEL_8:
        v16 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:3];
        [(CPAnalytics *)analytics sendEvent:@"com.apple.Photos.GraphUpdateHealth" withPayload:v16];

        goto LABEL_9;
      }
      v17 = self->_analytics;
      v27 = @"numberOfDatabaseChangesReceivedInBackground";
      v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      v28 = v7;
      v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = &v28;
      v20 = &v27;
    }
    else
    {
      unint64_t numberOfDatabaseChangesReceivedInForeground = self->_numberOfDatabaseChangesReceivedInForeground;
      if (numberOfDatabaseChangesReceivedInForeground)
      {
        double v15 = (double)self->_numberOfDatabaseChangesConvertedToGraphChangesInForeground
            / (double)numberOfDatabaseChangesReceivedInForeground;
        analytics = self->_analytics;
        v25[0] = @"numberOfDatabaseChangesReceivedInForeground";
        v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        v26[0] = v7;
        v25[1] = @"changeUsageRatio";
        v8 = [NSNumber numberWithDouble:v15];
        v26[1] = v8;
        v25[2] = @"numberOfDatabaseChangesConvertedToGraphChangesInForeground";
        v9 = [NSNumber numberWithUnsignedInteger:self->_numberOfDatabaseChangesConvertedToGraphChangesInForeground];
        v26[2] = v9;
        v10 = (void *)MEMORY[0x1E4F1C9E8];
        v11 = v26;
        v12 = v25;
        goto LABEL_8;
      }
      v17 = self->_analytics;
      v23 = @"numberOfDatabaseChangesReceivedInForeground";
      v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      v24 = v7;
      v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = &v24;
      v20 = &v23;
    }
    v8 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    [(CPAnalytics *)v17 sendEvent:@"com.apple.Photos.GraphUpdateHealth" withPayload:v8];
    goto LABEL_13;
  }
  v13 = self->_analytics;
  v21[0] = @"numberOfTimesGraphUpdatePaused";
  v7 = [NSNumber numberWithUnsignedInteger:self->_numberOfTimesGraphUpdatePaused];
  v21[1] = @"maximumTransactionSize";
  v22[0] = v7;
  v8 = [NSNumber numberWithUnsignedInteger:self->_maximumTransactionSize];
  v22[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [(CPAnalytics *)v13 sendEvent:@"com.apple.Photos.GraphUpdateHealth" withPayload:v9];
LABEL_9:

LABEL_13:
}

- (void)beginRecording
{
  *(_OWORD *)&self->_numberOfTimesGraphUpdatePaused = 0u;
  *(_OWORD *)&self->_numberOfDatabaseChangesConvertedToGraphChangesInForeground = 0u;
  *(_OWORD *)&self->_unint64_t numberOfDatabaseChangesReceivedInForeground = 0u;
}

- (void)recordNumberOfDaysSinceMajorOSUpgrade:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  analytics = self->_analytics;
  v6 = @"numberOfDaysSinceMajorOSUpgrade";
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v7[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(CPAnalytics *)analytics sendEvent:@"com.apple.Photos.Intelligence.graphMajorUpdate" withPayload:v5];
}

- (void)recordTransactionSize:(unint64_t)a3
{
  self->_maximumTransactionSize += a3;
}

- (void)recordNumberOfTimesGraphUpdatePaused:(unint64_t)a3
{
  self->_numberOfTimesGraphUpdatePaused += a3;
}

- (void)recordNumberOfDatabaseChangesConvertedToGraphChanges:(unint64_t)a3 inBackground:(BOOL)a4
{
  if (self->_changeConsumer)
  {
    uint64_t v4 = 40;
    if (a4) {
      uint64_t v4 = 48;
    }
    *(Class *)((char *)&self->super.isa + v4) = (Class)(*(char **)((char *)&self->super.isa + v4) + a3);
  }
}

- (void)recordNumberOfDatabaseChangesReceived:(unint64_t)a3 inBackground:(BOOL)a4
{
  if (self->_changeConsumer)
  {
    uint64_t v4 = 24;
    if (a4) {
      uint64_t v4 = 32;
    }
    *(Class *)((char *)&self->super.isa + v4) = (Class)(*(char **)((char *)&self->super.isa + v4) + a3);
  }
}

- (id)initForChangeConsumer:(BOOL)a3 analytics:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphUpdateHealthRecorder;
  v8 = [(PGGraphUpdateHealthRecorder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_changeConsumer = a3;
    objc_storeStrong((id *)&v8->_analytics, a4);
  }

  return v9;
}

@end