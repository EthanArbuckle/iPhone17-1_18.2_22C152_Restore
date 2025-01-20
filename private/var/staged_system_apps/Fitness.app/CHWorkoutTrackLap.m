@interface CHWorkoutTrackLap
- (CHWorkoutTrackLap)initWithWorkoutEvent:(id)a3;
- (id)description;
- (int64_t)laneNumber;
- (int64_t)lapIndex;
- (void)setLaneNumber:(int64_t)a3;
- (void)setLapIndex:(int64_t)a3;
@end

@implementation CHWorkoutTrackLap

- (CHWorkoutTrackLap)initWithWorkoutEvent:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CHWorkoutTrackLap;
  v5 = [(CHWorkoutTrackLap *)&v20 init];
  if (v5)
  {
    v6 = [v4 dateInterval];
    v7 = [v6 startDate];
    [(CHWorkoutSegment *)v5 setStartDate:v7];

    v8 = [v4 dateInterval];
    v9 = [v8 endDate];
    [(CHWorkoutSegment *)v5 setEndDate:v9];

    v10 = [v4 metadata];
    v11 = [v10 objectForKeyedSubscript:FIPrivateMetadataKeyLapIndex];

    -[CHWorkoutTrackLap setLapIndex:](v5, "setLapIndex:", [v11 integerValue]);
    v12 = [v4 metadata];
    v13 = [v12 objectForKeyedSubscript:FIPrivateMetadataKeyLaneNumber];

    -[CHWorkoutTrackLap setLaneNumber:](v5, "setLaneNumber:", [v13 integerValue]);
    v14 = [v4 metadata];
    v15 = [v14 objectForKeyedSubscript:FIPrivateMetadataKeyLapDistance];

    [(CHWorkoutSegment *)v5 setDistance:v15];
    v16 = [v4 metadata];
    v17 = [v16 objectForKeyedSubscript:FIPrivateMetadataKeyLapDuration];

    if (v17)
    {
      v18 = +[HKUnit secondUnit];
      [v17 doubleValueForUnit:v18];
    }
    else
    {
      v18 = [v4 dateInterval];
      [v18 duration];
    }
    -[CHWorkoutSegment setElapsedTime:](v5, "setElapsedTime:");
  }
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutTrackLap;
  v3 = [(CHWorkoutSegment *)&v6 description];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(TRACK LAP) %@: Index: %li; Lane: %li",
    v3,
    [(CHWorkoutTrackLap *)self lapIndex],
  id v4 = [(CHWorkoutTrackLap *)self laneNumber]);

  return v4;
}

- (int64_t)lapIndex
{
  return self->_lapIndex;
}

- (void)setLapIndex:(int64_t)a3
{
  self->_lapIndex = a3;
}

- (int64_t)laneNumber
{
  return self->_laneNumber;
}

- (void)setLaneNumber:(int64_t)a3
{
  self->_laneNumber = a3;
}

@end