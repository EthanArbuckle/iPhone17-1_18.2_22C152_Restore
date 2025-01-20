@interface SDShareSheetProxyLoaderResult
- (NSIndexSet)failedIndexes;
- (NSIndexSet)loadedIndexes;
- (id)description;
- (int64_t)state;
- (void)setFailedIndexes:(id)a3;
- (void)setLoadedIndexes:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SDShareSheetProxyLoaderResult

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)SDShareSheetProxyLoaderResult;
  v3 = [(SDShareSheetProxyLoaderResult *)&v10 description];
  unint64_t v4 = [(SDShareSheetProxyLoaderResult *)self state];
  if (v4 > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *((void *)&off_1008CA988 + v4);
  }
  v6 = [(SDShareSheetProxyLoaderResult *)self loadedIndexes];
  v7 = [(SDShareSheetProxyLoaderResult *)self failedIndexes];
  v8 = +[NSString stringWithFormat:@"%@: state:%@ loadedIndex:%@ failedIndexes:%@", v3, v5, v6, v7];

  return v8;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSIndexSet)loadedIndexes
{
  return self->_loadedIndexes;
}

- (void)setLoadedIndexes:(id)a3
{
}

- (NSIndexSet)failedIndexes
{
  return self->_failedIndexes;
}

- (void)setFailedIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedIndexes, 0);

  objc_storeStrong((id *)&self->_loadedIndexes, 0);
}

@end