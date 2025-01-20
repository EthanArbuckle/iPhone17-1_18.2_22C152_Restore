@interface ICASTranscriptActionType
- (ICASTranscriptActionType)initWithTranscriptActionType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)transcriptActionType;
@end

@implementation ICASTranscriptActionType

- (ICASTranscriptActionType)initWithTranscriptActionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASTranscriptActionType;
  result = [(ICASTranscriptActionType *)&v5 init];
  if (result) {
    result->_transcriptActionType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASTranscriptActionType *)self transcriptActionType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E64B8B38[v3 - 1];
  }
}

- (int64_t)transcriptActionType
{
  return self->_transcriptActionType;
}

@end