@interface TUIVideoActionMetadata
- (TUIVideoActionMetadata)initWithActionCase:(unint64_t)a3 origin:(unint64_t)a4 mode:(unint64_t)a5 isMuted:(BOOL)a6 isPlaying:(BOOL)a7 mediaTimePlayed:(double)a8 mediaDuration:(double)a9 mediaId:(id)a10;
- (id)actionCaseAsString;
- (id)originAsString;
- (id)serialize;
- (id)triggerForAction:(unint64_t)a3;
- (unint64_t)actionCase;
- (unint64_t)origin;
@end

@implementation TUIVideoActionMetadata

- (TUIVideoActionMetadata)initWithActionCase:(unint64_t)a3 origin:(unint64_t)a4 mode:(unint64_t)a5 isMuted:(BOOL)a6 isPlaying:(BOOL)a7 mediaTimePlayed:(double)a8 mediaDuration:(double)a9 mediaId:(id)a10
{
  v13.receiver = self;
  v13.super_class = (Class)TUIVideoActionMetadata;
  result = [(TUIVideoMetadataBase *)&v13 initWithMode:a5 isMuted:a6 isPlaying:a7 mediaTimePlayed:a10 mediaDuration:a8 mediaId:a9];
  if (result)
  {
    result->_actionCase = a3;
    result->_origin = a4;
  }
  return result;
}

- (id)serialize
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  v10.receiver = self;
  v10.super_class = (Class)TUIVideoActionMetadata;
  v4 = [(TUIVideoMetadataBase *)&v10 serialize];
  id v5 = [v3 initWithDictionary:v4];

  v11[0] = @"actionCase";
  v6 = [(TUIVideoActionMetadata *)self actionCaseAsString];
  v11[1] = @"origin";
  v12[0] = v6;
  v7 = [(TUIVideoActionMetadata *)self originAsString];
  v12[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v5 addEntriesFromDictionary:v8];

  return v5;
}

- (id)actionCaseAsString
{
  if (qword_2DF678 != -1) {
    dispatch_once(&qword_2DF678, &stru_255308);
  }
  id v3 = (void *)qword_2DF670;
  unint64_t actionCase = self->_actionCase;

  return [v3 objectAtIndexedSubscript:actionCase];
}

- (id)originAsString
{
  if (qword_2DF688 != -1) {
    dispatch_once(&qword_2DF688, &stru_255328);
  }
  id v3 = (void *)qword_2DF680;
  unint64_t origin = self->_origin;

  return [v3 objectAtIndexedSubscript:origin];
}

- (id)triggerForAction:(unint64_t)a3
{
  if (qword_2DF698 != -1) {
    dispatch_once(&qword_2DF698, &stru_255348);
  }
  v4 = (void *)qword_2DF690;

  return [v4 objectAtIndexedSubscript:a3];
}

- (unint64_t)actionCase
{
  return self->_actionCase;
}

- (unint64_t)origin
{
  return self->_origin;
}

@end