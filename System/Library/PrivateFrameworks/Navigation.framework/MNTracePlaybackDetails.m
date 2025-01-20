@interface MNTracePlaybackDetails
+ (BOOL)supportsSecureCoding;
- (MNTracePlaybackDetails)initWithCoder:(id)a3;
- (NSArray)bookmarks;
- (NSString)pedestrianTracePath;
- (NSString)tracePath;
- (double)currentPosition;
- (double)pedestrianTraceStartRelativeTimestamp;
- (double)traceDuration;
- (unint64_t)eventType;
- (unint64_t)recordedBookmarkID;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarks:(id)a3;
- (void)setCurrentPosition:(double)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setPedestrianTracePath:(id)a3;
- (void)setPedestrianTraceStartRelativeTimestamp:(double)a3;
- (void)setRecordedBookmarkID:(unint64_t)a3;
- (void)setTraceDuration:(double)a3;
- (void)setTracePath:(id)a3;
@end

@implementation MNTracePlaybackDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTracePlaybackDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MNTracePlaybackDetails *)self init];
  if (v5)
  {
    v5->_eventType = [v4 decodeIntegerForKey:@"_eventType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tracePath"];
    tracePath = v5->_tracePath;
    v5->_tracePath = (NSString *)v6;

    [v4 decodeDoubleForKey:@"_traceDuration"];
    v5->_traceDuration = v8;
    [v4 decodeDoubleForKey:@"_currentPosition"];
    v5->_currentPosition = v9;
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_bookmarks"];
    bookmarks = v5->_bookmarks;
    v5->_bookmarks = (NSArray *)v13;

    v5->_recordedBookmarkID = [v4 decodeIntegerForKey:@"_recordedBookmarkID"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pedestrianTracePath"];
    pedestrianTracePath = v5->_pedestrianTracePath;
    v5->_pedestrianTracePath = (NSString *)v15;

    [v4 decodeDoubleForKey:@"_pedestrianTraceStartRelativeTimestamp"];
    v5->_pedestrianTraceStartRelativeTimestamp = v17;
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t eventType = self->_eventType;
  id v5 = a3;
  [v5 encodeInteger:eventType forKey:@"_eventType"];
  [v5 encodeObject:self->_tracePath forKey:@"_tracePath"];
  [v5 encodeDouble:@"_traceDuration" forKey:self->_traceDuration];
  [v5 encodeDouble:@"_currentPosition" forKey:self->_currentPosition];
  [v5 encodeObject:self->_bookmarks forKey:@"_bookmarks"];
  [v5 encodeInteger:self->_recordedBookmarkID forKey:@"_recordedBookmarkID"];
  [v5 encodeObject:self->_pedestrianTracePath forKey:@"_pedestrianTracePath"];
  [v5 encodeDouble:@"_pedestrianTraceStartRelativeTimestamp" forKey:self->_pedestrianTraceStartRelativeTimestamp];
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_unint64_t eventType = a3;
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
}

- (double)traceDuration
{
  return self->_traceDuration;
}

- (void)setTraceDuration:(double)a3
{
  self->_traceDuration = a3;
}

- (double)currentPosition
{
  return self->_currentPosition;
}

- (void)setCurrentPosition:(double)a3
{
  self->_currentPosition = a3;
}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
}

- (unint64_t)recordedBookmarkID
{
  return self->_recordedBookmarkID;
}

- (void)setRecordedBookmarkID:(unint64_t)a3
{
  self->_recordedBookmarkID = a3;
}

- (NSString)pedestrianTracePath
{
  return self->_pedestrianTracePath;
}

- (void)setPedestrianTracePath:(id)a3
{
}

- (double)pedestrianTraceStartRelativeTimestamp
{
  return self->_pedestrianTraceStartRelativeTimestamp;
}

- (void)setPedestrianTraceStartRelativeTimestamp:(double)a3
{
  self->_pedestrianTraceStartRelativeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pedestrianTracePath, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
}

@end