@interface TITraceLogRecordContextEntry
- (NSString)token;
- (NSString)wordID;
- (TITraceLogRecordContextEntry)initWithToken:(id)a3 wordID:(id)a4;
- (void)setToken:(id)a3;
- (void)setWordID:(id)a3;
@end

@implementation TITraceLogRecordContextEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordID, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

- (void)setWordID:(id)a3
{
}

- (NSString)wordID
{
  return self->_wordID;
}

- (void)setToken:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (TITraceLogRecordContextEntry)initWithToken:(id)a3 wordID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TITraceLogRecordContextEntry;
  v9 = [(TITraceLogRecordContextEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    objc_storeStrong((id *)&v10->_wordID, a4);
  }

  return v10;
}

@end