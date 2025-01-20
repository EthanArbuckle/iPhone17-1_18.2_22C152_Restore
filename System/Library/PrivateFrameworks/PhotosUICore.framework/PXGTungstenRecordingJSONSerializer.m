@interface PXGTungstenRecordingJSONSerializer
- (BOOL)prettyPrint;
- (BOOL)sortKeys;
- (unint64_t)options;
- (void)recordingSessionWillEndToStream:(id)a3;
- (void)recordingSessionWillStartToStream:(id)a3;
- (void)serializeEvent:(id)a3 toStream:(id)a4;
- (void)setPrettyPrint:(BOOL)a3;
- (void)setSortKeys:(BOOL)a3;
@end

@implementation PXGTungstenRecordingJSONSerializer

- (void)setSortKeys:(BOOL)a3
{
  self->_sortKeys = a3;
}

- (BOOL)sortKeys
{
  return self->_sortKeys;
}

- (void)setPrettyPrint:(BOOL)a3
{
  self->_prettyPrint = a3;
}

- (BOOL)prettyPrint
{
  return self->_prettyPrint;
}

- (unint64_t)options
{
  unint64_t v3 = [(PXGTungstenRecordingJSONSerializer *)self prettyPrint];
  if ([(PXGTungstenRecordingJSONSerializer *)self sortKeys]) {
    return v3 | 2;
  }
  else {
    return v3;
  }
}

- (void)serializeEvent:(id)a3 toStream:(id)a4
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_eventCount)
  {
    id v8 = [@"," dataUsingEncoding:4];
    objc_msgSend(v7, "write:maxLength:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

    unint64_t v9 = self->_eventCount + 1;
  }
  else
  {
    unint64_t v9 = 1;
  }
  self->_eventCount = v9;
  v10 = [v6 serializable];
  v11 = [NSString stringWithUTF8String:object_getClassName(v10)];
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "component"));
  v22[0] = v12;
  v13 = [v6 eventName];
  v22[1] = v13;
  v22[2] = v11;
  v14 = NSNumber;
  [v6 timestamp];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v22[3] = v15;
  v16 = [v6 threadDescription];
  v22[4] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];

  v18 = [v10 createSerializableObject];
  v20[0] = @"info";
  v20[1] = @"event";
  v21[0] = v17;
  v21[1] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  objc_msgSend(MEMORY[0x1E4F28D90], "writeJSONObject:toStream:options:error:", v19, v7, -[PXGTungstenRecordingJSONSerializer options](self, "options"), 0);
}

- (void)recordingSessionWillEndToStream:(id)a3
{
  id v3 = a3;
  id v4 = [@"]}" dataUsingEncoding:4];
  objc_msgSend(v3, "write:maxLength:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
}

- (void)recordingSessionWillStartToStream:(id)a3
{
  id v3 = a3;
  id v4 = [@"{\"events\" : [" dataUsingEncoding:4];
  objc_msgSend(v3, "write:maxLength:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
}

@end