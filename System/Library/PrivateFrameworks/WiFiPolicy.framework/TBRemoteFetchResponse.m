@interface TBRemoteFetchResponse
+ (id)responseWithResults:(id)a3 tiles:(id)a4 error:(id)a5;
- (NSArray)results;
- (NSError)error;
- (NSSet)tiles;
- (TBRemoteFetchResponse)initWithResults:(id)a3 tiles:(id)a4 error:(id)a5;
- (void)setError:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation TBRemoteFetchResponse

+ (id)responseWithResults:(id)a3 tiles:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[TBRemoteFetchResponse alloc] initWithResults:v9 tiles:v8 error:v7];

  return v10;
}

- (TBRemoteFetchResponse)initWithResults:(id)a3 tiles:(id)a4 error:(id)a5
{
  id v8 = (NSArray *)a3;
  id v9 = (NSSet *)a4;
  v10 = (NSError *)a5;
  v18.receiver = self;
  v18.super_class = (Class)TBRemoteFetchResponse;
  v11 = [(TBRemoteFetchResponse *)&v18 init];
  results = v11->_results;
  v11->_results = v8;
  v13 = v8;

  tiles = v11->_tiles;
  v11->_tiles = v9;
  v15 = v9;

  error = v11->_error;
  v11->_error = v10;

  return v11;
}

- (NSSet)tiles
{
  return self->_tiles;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
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
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_tiles, 0);
}

@end