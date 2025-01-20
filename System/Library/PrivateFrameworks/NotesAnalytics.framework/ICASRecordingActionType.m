@interface ICASRecordingActionType
- (ICASRecordingActionType)initWithRecordingActionType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)recordingActionType;
@end

@implementation ICASRecordingActionType

- (ICASRecordingActionType)initWithRecordingActionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASRecordingActionType;
  result = [(ICASRecordingActionType *)&v5 init];
  if (result) {
    result->_recordingActionType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASRecordingActionType *)self recordingActionType];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"createNew";
  }
  if (v3 == 2) {
    return @"append";
  }
  else {
    return v4;
  }
}

- (int64_t)recordingActionType
{
  return self->_recordingActionType;
}

@end