@interface PPEventMetadata
+ (PPEventMetadata)eventMetadataWithTitlesAndParticipants:(id)a3 earliestStartTime:(double)a4 eventCount:(unint64_t)a5 eventHasAlarmCount:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventMetadata:(id)a3;
- (NSDictionary)titlesAndParticipants;
- (PPEventMetadata)initWithTitlesAndParticipants:(id)a3 earliestStartTime:(double)a4 eventCount:(unint64_t)a5 eventHasAlarmCount:(unint64_t)a6;
- (double)earliestStartTime;
- (id)copyWithReplacementEarliestStartTime:(double)a3;
- (id)copyWithReplacementEventCount:(unint64_t)a3;
- (id)copyWithReplacementEventHasAlarmCount:(unint64_t)a3;
- (id)copyWithReplacementTitlesAndParticipants:(id)a3;
- (id)description;
- (unint64_t)_hash;
- (unint64_t)eventCount;
- (unint64_t)eventHasAlarmCount;
- (unint64_t)hash;
@end

@implementation PPEventMetadata

- (void).cxx_destruct
{
}

- (double)earliestStartTime
{
  return self->_earliestStartTime;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (NSDictionary)titlesAndParticipants
{
  return self->_titlesAndParticipants;
}

- (unint64_t)eventHasAlarmCount
{
  return self->_eventHasAlarmCount;
}

+ (PPEventMetadata)eventMetadataWithTitlesAndParticipants:(id)a3 earliestStartTime:(double)a4 eventCount:(unint64_t)a5 eventHasAlarmCount:(unint64_t)a6
{
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithTitlesAndParticipants:v10 earliestStartTime:a5 eventCount:a6 eventHasAlarmCount:a4];

  return (PPEventMetadata *)v11;
}

- (PPEventMetadata)initWithTitlesAndParticipants:(id)a3 earliestStartTime:(double)a4 eventCount:(unint64_t)a5 eventHasAlarmCount:(unint64_t)a6
{
  id v12 = a3;
  if (!v12)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PPEventTuples.m", 14, @"Invalid parameter not satisfying: %@", @"titlesAndParticipants != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PPEventMetadata;
  v13 = [(PPEventMetadata *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_titlesAndParticipants, a3);
    v14->_earliestStartTime = a4;
    v14->_eventCount = a5;
    v14->_eventHasAlarmCount = a6;
    v14->_ocnt_precomputedHash = [(PPEventMetadata *)v14 _hash];
  }

  return v14;
}

- (unint64_t)_hash
{
  uint64_t v3 = [(NSDictionary *)self->_titlesAndParticipants hash];
  double earliestStartTime = self->_earliestStartTime;
  double v5 = -earliestStartTime;
  if (earliestStartTime >= 0.0) {
    double v5 = self->_earliestStartTime;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  unint64_t v9 = self->_eventCount - (v8 - v3 + 32 * v3) + 32 * (v8 - v3 + 32 * v3);
  return self->_eventHasAlarmCount - v9 + 32 * v9;
}

- (id)description
{
  id v3 = [NSString alloc];
  titlesAndParticipants = self->_titlesAndParticipants;
  double v5 = [NSNumber numberWithDouble:self->_earliestStartTime];
  long double v6 = [NSNumber numberWithUnsignedInteger:self->_eventCount];
  double v7 = [NSNumber numberWithUnsignedInteger:self->_eventHasAlarmCount];
  unint64_t v8 = (void *)[v3 initWithFormat:@"<PPEventMetadata | titlesAndParticipants:%@ earliestStartTime:%@ eventCount:%@ eventHasAlarmCount:%@>", titlesAndParticipants, v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  return self->_ocnt_precomputedHash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPEventMetadata *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPEventMetadata *)self isEqualToEventMetadata:v5];

  return v6;
}

- (BOOL)isEqualToEventMetadata:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  int v6 = self->_titlesAndParticipants != 0;
  double v7 = [v4 titlesAndParticipants];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_9;
  }
  titlesAndParticipants = self->_titlesAndParticipants;
  if (titlesAndParticipants)
  {
    id v10 = [v5 titlesAndParticipants];
    int v11 = [(NSDictionary *)titlesAndParticipants isEqual:v10];

    if (!v11) {
      goto LABEL_9;
    }
  }
  objc_msgSend(v5, "earliestStartTime", self->_earliestStartTime);
  double earliestStartTime = self->_earliestStartTime;
  [v5 earliestStartTime];
  if (earliestStartTime == v13 && (unint64_t eventCount = self->_eventCount, eventCount == [v5 eventCount]))
  {
    unint64_t eventHasAlarmCount = self->_eventHasAlarmCount;
    BOOL v16 = eventHasAlarmCount == [v5 eventHasAlarmCount];
  }
  else
  {
LABEL_9:
    BOOL v16 = 0;
  }

  return v16;
}

- (id)copyWithReplacementEventHasAlarmCount:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  titlesAndParticipants = self->_titlesAndParticipants;
  double earliestStartTime = self->_earliestStartTime;
  unint64_t eventCount = self->_eventCount;
  return (id)[v5 initWithTitlesAndParticipants:titlesAndParticipants earliestStartTime:eventCount eventCount:a3 eventHasAlarmCount:earliestStartTime];
}

- (id)copyWithReplacementEventCount:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  titlesAndParticipants = self->_titlesAndParticipants;
  double earliestStartTime = self->_earliestStartTime;
  unint64_t eventHasAlarmCount = self->_eventHasAlarmCount;
  return (id)[v5 initWithTitlesAndParticipants:titlesAndParticipants earliestStartTime:a3 eventCount:eventHasAlarmCount eventHasAlarmCount:earliestStartTime];
}

- (id)copyWithReplacementEarliestStartTime:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  titlesAndParticipants = self->_titlesAndParticipants;
  unint64_t eventCount = self->_eventCount;
  unint64_t eventHasAlarmCount = self->_eventHasAlarmCount;
  return (id)[v5 initWithTitlesAndParticipants:titlesAndParticipants earliestStartTime:eventCount eventCount:eventHasAlarmCount eventHasAlarmCount:a3];
}

- (id)copyWithReplacementTitlesAndParticipants:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTitlesAndParticipants:v4 earliestStartTime:self->_eventCount eventCount:self->_eventHasAlarmCount eventHasAlarmCount:self->_earliestStartTime];

  return v5;
}

@end