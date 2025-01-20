@interface TUIVideoEventMetadata
- (TUIVideoEventMetadata)initWithEventCase:(unint64_t)a3 mode:(unint64_t)a4 isMuted:(BOOL)a5 isPlaying:(BOOL)a6 mediaTimePlayed:(double)a7 mediaDuration:(double)a8 mediaId:(id)a9;
- (id)eventCaseAsString;
- (id)serialize;
- (id)triggerForEvent:(unint64_t)a3;
- (unint64_t)eventCase;
@end

@implementation TUIVideoEventMetadata

- (TUIVideoEventMetadata)initWithEventCase:(unint64_t)a3 mode:(unint64_t)a4 isMuted:(BOOL)a5 isPlaying:(BOOL)a6 mediaTimePlayed:(double)a7 mediaDuration:(double)a8 mediaId:(id)a9
{
  v11.receiver = self;
  v11.super_class = (Class)TUIVideoEventMetadata;
  result = [(TUIVideoMetadataBase *)&v11 initWithMode:a4 isMuted:a5 isPlaying:a6 mediaTimePlayed:a9 mediaDuration:a7 mediaId:a8];
  if (result) {
    result->_eventCase = a3;
  }
  return result;
}

- (id)serialize
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  v9.receiver = self;
  v9.super_class = (Class)TUIVideoEventMetadata;
  v4 = [(TUIVideoMetadataBase *)&v9 serialize];
  id v5 = [v3 initWithDictionary:v4];

  CFStringRef v10 = @"eventCase";
  v6 = [(TUIVideoEventMetadata *)self eventCaseAsString];
  objc_super v11 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

- (id)eventCaseAsString
{
  if (qword_2DF658 != -1) {
    dispatch_once(&qword_2DF658, &stru_2552C8);
  }
  id v3 = (void *)qword_2DF650;
  unint64_t eventCase = self->_eventCase;

  return [v3 objectAtIndexedSubscript:eventCase];
}

- (id)triggerForEvent:(unint64_t)a3
{
  if (qword_2DF668 != -1) {
    dispatch_once(&qword_2DF668, &stru_2552E8);
  }
  v4 = (void *)qword_2DF660;

  return [v4 objectAtIndexedSubscript:a3];
}

- (unint64_t)eventCase
{
  return self->_eventCase;
}

@end