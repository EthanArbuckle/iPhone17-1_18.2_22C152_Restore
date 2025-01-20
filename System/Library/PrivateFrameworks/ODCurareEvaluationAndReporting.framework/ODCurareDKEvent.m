@interface ODCurareDKEvent
- (NSArray)metadata;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)identifier;
- (ODCurareDKEvent)initWithDKEvent:(id)a3;
@end

@implementation ODCurareDKEvent

- (ODCurareDKEvent)initWithDKEvent:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODCurareDKEvent;
  v5 = [(ODCurareDKEvent *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 startDate];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 endDate];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v10 = [v4 value];
    uint64_t v11 = [v10 stringValue];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    v13 = [v4 metadata];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"ODCurareEvaluationAndReporting-MetadataDataKey"];
    metadata = v5->_metadata;
    v5->_metadata = (NSArray *)v14;
  }
  return v5;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)metadata
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end