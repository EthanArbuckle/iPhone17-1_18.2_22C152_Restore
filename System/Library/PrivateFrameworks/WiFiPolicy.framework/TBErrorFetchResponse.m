@interface TBErrorFetchResponse
+ (id)remoteResponseWithError:(id)a3;
+ (id)responseWithError:(id)a3;
- (NSArray)results;
- (NSError)error;
- (NSSet)tiles;
- (TBErrorFetchResponse)initWithError:(id)a3;
- (void)setError:(id)a3;
@end

@implementation TBErrorFetchResponse

+ (id)responseWithError:(id)a3
{
  id v3 = a3;
  v4 = [[TBErrorFetchResponse alloc] initWithError:v3];

  return v4;
}

+ (id)remoteResponseWithError:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v6)
  {
    if ([v4 code] == -1009) {
      uint64_t v7 = 155;
    }
    else {
      uint64_t v7 = 150;
    }
    v8 = @"Unknown remote fetch error";
  }
  else
  {
    v9 = [v4 domain];
    v10 = GEOErrorDomain();
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = [v4 code];
      v8 = @"Unknown remote fetch error";
      uint64_t v7 = 150;
      switch(v12)
      {
        case -9:
        case -1:
          goto LABEL_11;
        case -8:
        case -6:
        case -5:
        case -3:
        case -2:
          break;
        case -7:
          v8 = @"Server error";
          uint64_t v7 = 153;
          break;
        case -4:
          v8 = @"No configured URL for remote fetch";
          uint64_t v7 = 151;
          break;
        default:
          if (v12 == -15)
          {
LABEL_11:
            v8 = @"Connection error";
            uint64_t v7 = 152;
          }
          break;
      }
    }
    else
    {
      v8 = @"Unknown remote fetch error";
      uint64_t v7 = 150;
    }
  }
  uint64_t v13 = *MEMORY[0x1E4F28A50];
  v19[0] = *MEMORY[0x1E4F28568];
  v19[1] = v13;
  v20[0] = v8;
  v20[1] = v4;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v15 = objc_alloc((Class)a1);
  v16 = [[TBError alloc] initWithType:v7 userInfo:v14];
  v17 = (void *)[v15 initWithError:v16];

  return v17;
}

- (TBErrorFetchResponse)initWithError:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TBErrorFetchResponse;
  id v3 = a3;
  id v4 = [(TBErrorFetchResponse *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  error = v4->_error;
  v4->_error = (NSError *)v5;

  return v4;
}

- (NSArray)results
{
  return self->results;
}

- (NSSet)tiles
{
  return self->tiles;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->tiles, 0);

  objc_storeStrong((id *)&self->results, 0);
}

@end