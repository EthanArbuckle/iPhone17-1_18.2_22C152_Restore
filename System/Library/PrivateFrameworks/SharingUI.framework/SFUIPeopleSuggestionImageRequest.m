@interface SFUIPeopleSuggestionImageRequest
- (SFPeopleSuggestion)peopleSuggestion;
- (SFUIPeopleSuggestionImageRequest)initWithRequestID:(int)a3 peopleSuggestion:(id)a4 type:(int64_t)a5 resultHandler:(id)a6;
- (int64_t)type;
@end

@implementation SFUIPeopleSuggestionImageRequest

- (SFUIPeopleSuggestionImageRequest)initWithRequestID:(int)a3 peopleSuggestion:(id)a4 type:(int64_t)a5 resultHandler:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a4;
  id v12 = a6;
  if (a5 == 1)
  {
    uint64_t v13 = [v11 transportBundleIdentifier];
    goto LABEL_5;
  }
  if (!a5)
  {
    uint64_t v13 = [v11 identifier];
LABEL_5:
    v14 = (void *)v13;
    goto LABEL_7;
  }
  v14 = 0;
LABEL_7:
  v18.receiver = self;
  v18.super_class = (Class)SFUIPeopleSuggestionImageRequest;
  v15 = [(SFUIImageRequest *)&v18 initWithRequestID:v9 identifier:v14 synchronous:0 resultHandler:v12];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_peopleSuggestion, a4);
    v16->_type = a5;
  }

  return v16;
}

- (SFPeopleSuggestion)peopleSuggestion
{
  return self->_peopleSuggestion;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end