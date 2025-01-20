@interface PPTopicWithRecord
- (PPTopicWithRecord)initWithTopicIdentifier:(id)a3 mostRelevantRecord:(id)a4;
- (double)sentimentScore;
- (id)mostRelevantRecord;
@end

@implementation PPTopicWithRecord

- (void).cxx_destruct
{
}

- (double)sentimentScore
{
  mostRelevantRecord = self->_mostRelevantRecord;
  if (!mostRelevantRecord) {
    return 0.0;
  }
  [(PPTopicRecord *)mostRelevantRecord sentimentScore];
  return result;
}

- (id)mostRelevantRecord
{
  return self->_mostRelevantRecord;
}

- (PPTopicWithRecord)initWithTopicIdentifier:(id)a3 mostRelevantRecord:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PPTopicWithRecord;
  v8 = [(PPTopic *)&v11 initWithTopicIdentifier:a3 mostRelevantRecord:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_mostRelevantRecord, a4);
  }

  return v9;
}

@end