@interface MLRPluginSchedulingRecord
- (BOOL)commitWithError:(id *)a3;
- (MLRPluginSchedulingRecord)initWithPluginID:(id)a3;
- (NSDate)lastCompletionDate;
- (NSString)recordID;
- (id)description;
- (unint64_t)periodInSeconds;
- (void)setLastCompletionDate:(id)a3;
- (void)setPeriodInSeconds:(unint64_t)a3;
@end

@implementation MLRPluginSchedulingRecord

- (MLRPluginSchedulingRecord)initWithPluginID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)MLRPluginSchedulingRecord;
    v6 = [(MLRPluginSchedulingRecord *)&v15 init];
    if (v6)
    {
      v7 = (DESUserDefaultsStoreRecord *)[objc_alloc((Class)DESUserDefaultsStoreRecord) initWithRecordID:v5];
      storeRecord = v6->_storeRecord;
      v6->_storeRecord = v7;

      objc_storeStrong((id *)&v6->_recordID, a3);
      uint64_t v9 = [(DESUserDefaultsStoreRecord *)v6->_storeRecord lastCompletionDate];
      lastCompletionDate = v6->_lastCompletionDate;
      v6->_lastCompletionDate = (NSDate *)v9;

      v6->_periodInSeconds = kDESDodMLPolicy_DefaultPeriod;
      if (allowCustomWakeUpPeriod())
      {
        v11 = [(DESUserDefaultsStoreRecord *)v6->_storeRecord periodInSeconds];

        if (v11)
        {
          v12 = [(DESUserDefaultsStoreRecord *)v6->_storeRecord periodInSeconds];
          v6->_periodInSeconds = (unint64_t)[v12 unsignedIntegerValue];
        }
      }
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"%@(%@, %@, %lu)", v4, self->_recordID, self->_lastCompletionDate, self->_periodInSeconds];

  return v5;
}

- (BOOL)commitWithError:(id *)a3
{
  [(DESUserDefaultsStoreRecord *)self->_storeRecord setLastCompletionDate:self->_lastCompletionDate];
  if (allowCustomWakeUpPeriod())
  {
    v4 = [(DESUserDefaultsStoreRecord *)self->_storeRecord periodInSeconds];
    if (v4) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = self->_periodInSeconds != kDESDodMLPolicy_DefaultPeriod;
    }

    v6 = [(DESUserDefaultsStoreRecord *)self->_storeRecord periodInSeconds];
    if (v6)
    {
      v7 = [(DESUserDefaultsStoreRecord *)self->_storeRecord periodInSeconds];
      BOOL v8 = [v7 unsignedIntegerValue] != self->_periodInSeconds;
    }
    else
    {
      BOOL v8 = 0;
    }

    if (v5 || v8)
    {
      uint64_t v9 = +[NSNumber numberWithUnsignedInteger:self->_periodInSeconds];
      [(DESUserDefaultsStoreRecord *)self->_storeRecord setPeriodInSeconds:v9];
    }
  }
  return 1;
}

- (NSDate)lastCompletionDate
{
  return self->_lastCompletionDate;
}

- (void)setLastCompletionDate:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (unint64_t)periodInSeconds
{
  return self->_periodInSeconds;
}

- (void)setPeriodInSeconds:(unint64_t)a3
{
  self->_periodInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_lastCompletionDate, 0);

  objc_storeStrong((id *)&self->_storeRecord, 0);
}

@end