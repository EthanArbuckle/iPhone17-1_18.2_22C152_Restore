@interface PLSearchIndexingEvent
- (NSDate)timestamp;
- (NSError)error;
- (NSString)sampleIdentifier;
- (PLSearchIndexingEvent)initWithDonationCount:(unint64_t)a3 deletionCount:(unint64_t)a4 timestamp:(id)a5 sampleIdentifier:(id)a6;
- (PLSearchIndexingEvent)initWithError:(id)a3;
- (id)autoBugCaptureEventDictionary;
- (id)description;
- (unint64_t)deletionCount;
- (unint64_t)donationCount;
@end

@implementation PLSearchIndexingEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sampleIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSString)sampleIdentifier
{
  return self->_sampleIdentifier;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)deletionCount
{
  return self->_deletionCount;
}

- (unint64_t)donationCount
{
  return self->_donationCount;
}

- (id)description
{
  error = self->_error;
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)v6;
  if (error) {
    [v4 stringWithFormat:@"<%@ %p> Donation failure, error: %@", v6, self, self->_error, v10, v11, v12];
  }
  else {
  v8 = [v4 stringWithFormat:@"<%@ %p> Donation success, donation count: %lu, deletion count: %lu, timestamp: %@ sample identifier: %@", v6, self, self->_donationCount, self->_deletionCount, self->_timestamp, self->_sampleIdentifier];
  }

  return v8;
}

- (PLSearchIndexingEvent)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchIndexingEvent;
  v5 = [(PLSearchIndexingEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (PLSearchIndexingEvent)initWithDonationCount:(unint64_t)a3 deletionCount:(unint64_t)a4 timestamp:(id)a5 sampleIdentifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PLSearchIndexingEvent;
  uint64_t v12 = [(PLSearchIndexingEvent *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_donationCount = a3;
    v12->_deletionCount = a4;
    uint64_t v14 = [v10 copy];
    timestamp = v13->_timestamp;
    v13->_timestamp = (NSDate *)v14;

    uint64_t v16 = [v11 copy];
    sampleIdentifier = v13->_sampleIdentifier;
    v13->_sampleIdentifier = (NSString *)v16;
  }
  return v13;
}

- (id)autoBugCaptureEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = getkSymptomDiagnosticKeyEventName();
  [v3 setObject:@"SearchIndexDonation" forKeyedSubscript:v4];

  v5 = [(PLSearchIndexingEvent *)self error];

  if (v5)
  {
    uint64_t v6 = NSString;
    v7 = [(PLSearchIndexingEvent *)self error];
    v8 = [v7 domain];
    objc_super v9 = [(PLSearchIndexingEvent *)self error];
    id v10 = [v6 stringWithFormat:@"Failure - %@ - %lu", v8, objc_msgSend(v9, "code")];
    id v11 = getkSymptomDiagnosticKeyEventResult();
    [v3 setObject:v10 forKeyedSubscript:v11];

    uint64_t v12 = NSNumber;
    v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceReferenceDate];
    uint64_t v14 = objc_msgSend(v12, "numberWithDouble:");
    v15 = getkSymptomDiagnosticKeyTimestamp();
    [v3 setObject:v14 forKeyedSubscript:v15];
  }
  else
  {
    uint64_t v16 = getkSymptomDiagnosticKeyEventResult();
    [v3 setObject:@"Success" forKeyedSubscript:v16];

    v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLSearchIndexingEvent donationCount](self, "donationCount"));
    v18 = getkSymptomDiagnosticKeyEventCount();
    [v3 setObject:v17 forKeyedSubscript:v18];

    objc_super v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLSearchIndexingEvent deletionCount](self, "deletionCount"));
    [v3 setObject:v19 forKeyedSubscript:@"DeletionCount"];

    v20 = NSNumber;
    v21 = [(PLSearchIndexingEvent *)self timestamp];
    [v21 timeIntervalSinceReferenceDate];
    v22 = objc_msgSend(v20, "numberWithDouble:");
    v23 = getkSymptomDiagnosticKeyTimestamp();
    [v3 setObject:v22 forKeyedSubscript:v23];

    v13 = [(PLSearchIndexingEvent *)self sampleIdentifier];
    [v3 setObject:v13 forKeyedSubscript:@"SampleIdentifier"];
  }

  v24 = (void *)[v3 copy];
  return v24;
}

@end