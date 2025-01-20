@interface ICHTMLSearchIndexerDataSource(App)
- (id)mainThreadContext;
@end

@implementation ICHTMLSearchIndexerDataSource(App)

- (id)mainThreadContext
{
  uint64_t v2 = 0;
  v3 = &v2;
  uint64_t v4 = 0x3032000000;
  v5 = __Block_byref_object_copy__8;
  v6 = __Block_byref_object_dispose__8;
  id v7 = 0;
  performBlockOnMainThreadAndWait();
  id v0 = (id)v3[5];
  _Block_object_dispose(&v2, 8);

  return v0;
}

@end