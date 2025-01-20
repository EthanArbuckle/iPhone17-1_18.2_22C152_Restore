@interface VUIPlaybackReporterVPAFPlaylistItem
- (NSArray)eventData;
- (NSString)description;
- (VUIPlaybackReporterVPAFPlaylistItem)initWithPosition:(unint64_t)a3 duration:(unint64_t)a4 eventData:(id)a5;
- (_NSRange)timeRange;
- (unint64_t)duration;
- (unint64_t)startOverallPosition;
- (void)setDuration:(unint64_t)a3;
- (void)setEventData:(id)a3;
- (void)setStartOverallPosition:(unint64_t)a3;
- (void)setTimeRange:(_NSRange)a3;
@end

@implementation VUIPlaybackReporterVPAFPlaylistItem

- (VUIPlaybackReporterVPAFPlaylistItem)initWithPosition:(unint64_t)a3 duration:(unint64_t)a4 eventData:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VUIPlaybackReporterVPAFPlaylistItem;
  v9 = [(VUIPlaybackReporterVPAFPlaylistItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_startOverallPosition = a3;
    v9->_duration = a4;
    if (a4)
    {
      v9->_timeRange.location = a3;
      v9->_timeRange.length = a4;
    }
    if (v8)
    {
      v15[0] = v8;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      eventData = v10->_eventData;
      v10->_eventData = (NSArray *)v11;
    }
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)VUIPlaybackReporterVPAFPlaylistItem;
  v4 = [(VUIPlaybackReporterVPAFPlaylistItem *)&v9 description];
  v5 = NSStringFromRange(self->_timeRange);
  v6 = [(NSArray *)self->_eventData firstObject];
  v7 = [v3 stringWithFormat:@"%@ range:%@ data:%@", v4, v5, v6];

  return (NSString *)v7;
}

- (unint64_t)startOverallPosition
{
  return self->_startOverallPosition;
}

- (void)setStartOverallPosition:(unint64_t)a3
{
  self->_startOverallPosition = a3;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (_NSRange)timeRange
{
  NSUInteger length = self->_timeRange.length;
  NSUInteger location = self->_timeRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTimeRange:(_NSRange)a3
{
  self->_timeRange = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
}

@end