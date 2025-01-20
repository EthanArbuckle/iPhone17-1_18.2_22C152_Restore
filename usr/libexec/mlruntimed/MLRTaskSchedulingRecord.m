@interface MLRTaskSchedulingRecord
- (BOOL)commitWithError:(id *)a3;
- (MLRTaskSchedulingRecord)initWithTaskID:(id)a3;
- (NSDate)lastCompletionDate;
- (NSString)recordID;
- (id)description;
- (int64_t)performCount;
- (void)setLastCompletionDate:(id)a3;
- (void)setPerformCount:(int64_t)a3;
@end

@implementation MLRTaskSchedulingRecord

- (MLRTaskSchedulingRecord)initWithTaskID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)MLRTaskSchedulingRecord;
    v6 = [(MLRTaskSchedulingRecord *)&v13 init];
    if (v6)
    {
      v7 = (DESUserDefaultsStoreRecord *)[objc_alloc((Class)DESUserDefaultsStoreRecord) initWithRecordID:v5];
      storeRecord = v6->_storeRecord;
      v6->_storeRecord = v7;

      objc_storeStrong((id *)&v6->_recordID, a3);
      uint64_t v9 = [(DESUserDefaultsStoreRecord *)v6->_storeRecord lastCompletionDate];
      lastCompletionDate = v6->_lastCompletionDate;
      v6->_lastCompletionDate = (NSDate *)v9;

      v6->_performCount = (int64_t)[(DESUserDefaultsStoreRecord *)v6->_storeRecord performCount];
    }
    self = v6;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"%@(%@, %@, %ld)", v4, self->_recordID, self->_lastCompletionDate, self->_performCount];

  return v5;
}

- (BOOL)commitWithError:(id *)a3
{
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

- (int64_t)performCount
{
  return self->_performCount;
}

- (void)setPerformCount:(int64_t)a3
{
  self->_performCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_lastCompletionDate, 0);

  objc_storeStrong((id *)&self->_storeRecord, 0);
}

@end