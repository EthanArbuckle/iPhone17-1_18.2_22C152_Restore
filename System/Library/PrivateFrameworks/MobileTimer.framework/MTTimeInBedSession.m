@interface MTTimeInBedSession
+ (BOOL)supportsSecureCoding;
+ (id)timeInBedSessionWithStartDate:(id)a3 endDate:(id)a4 intervals:(id)a5 endReason:(unint64_t)a6 metadata:(id)a7;
- (BOOL)needsAdditionalProcessing;
- (MTTimeInBedSession)initWithCoder:(id)a3;
- (MTTimeInBedSession)initWithStartDate:(id)a3 endDate:(id)a4 intervals:(id)a5 endReason:(unint64_t)a6 metadata:(id)a7;
- (NSArray)intervals;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)metadata;
- (NSString)description;
- (int64_t)sampleType;
- (unint64_t)endReason;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEndReason:(unint64_t)a3;
- (void)setIntervals:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNeedsAdditionalProcessing:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MTTimeInBedSession

+ (id)timeInBedSessionWithStartDate:(id)a3 endDate:(id)a4 intervals:(id)a5 endReason:(unint64_t)a6 metadata:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithStartDate:v15 endDate:v14 intervals:v13 endReason:a6 metadata:v12];

  return v16;
}

- (MTTimeInBedSession)initWithStartDate:(id)a3 endDate:(id)a4 intervals:(id)a5 endReason:(unint64_t)a6 metadata:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MTTimeInBedSession;
  v17 = [(MTTimeInBedSession *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_startDate, a3);
    objc_storeStrong((id *)&v18->_endDate, a4);
    objc_storeStrong((id *)&v18->_intervals, a5);
    v18->_endReason = a6;
    objc_storeStrong((id *)&v18->_metadata, a7);
  }

  return v18;
}

- (int64_t)sampleType
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(MTTimeInBedSession *)self startDate];
  [v8 encodeObject:v4 forKey:@"StartDate"];

  v5 = [(MTTimeInBedSession *)self endDate];
  [v8 encodeObject:v5 forKey:@"EndDate"];

  v6 = [(MTTimeInBedSession *)self intervals];
  [v8 encodeObject:v6 forKey:@"Intervals"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[MTTimeInBedSession endReason](self, "endReason"), @"EndReason");
  v7 = [(MTTimeInBedSession *)self metadata];
  [v8 encodeObject:v7 forKey:@"MetaData"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MTTimeInBedSession needsAdditionalProcessing](self, "needsAdditionalProcessing"), @"NeedsAdditionalProcessing");
}

- (MTTimeInBedSession)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MTTimeInBedSession;
  v5 = [(MTTimeInBedSession *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EndDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Intervals"];
    intervals = v5->_intervals;
    v5->_intervals = (NSArray *)v13;

    v5->_endReason = [v4 decodeIntegerForKey:@"EndReason"];
    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"MetaData"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v18;

    v5->_needsAdditionalProcessing = [v4 decodeBoolForKey:@"NeedsAdditionalProcessing"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  if (self->_needsAdditionalProcessing) {
    objc_msgSend(NSString, "stringWithFormat:", @"needsAdditionalProcessing: %d", 1);
  }
  else {
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"intervals: %lu", -[NSArray count](self->_intervals, "count"));
  }
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  startDate = self->_startDate;
  endDate = self->_endDate;
  uint64_t v8 = MTSleepSessionEndReasonDescription(self->_endReason);
  v9 = [v4 stringWithFormat:@"<%@ %p start: %@ end: %@ %@ reason: %@ metadata: %@>", v5, self, startDate, endDate, v3, v8, self->_metadata];

  return (NSString *)v9;
}

- (BOOL)needsAdditionalProcessing
{
  return self->_needsAdditionalProcessing;
}

- (void)setNeedsAdditionalProcessing:(BOOL)a3
{
  self->_needsAdditionalProcessing = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSArray)intervals
{
  return self->_intervals;
}

- (void)setIntervals:(id)a3
{
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (void)setEndReason:(unint64_t)a3
{
  self->_endReason = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end