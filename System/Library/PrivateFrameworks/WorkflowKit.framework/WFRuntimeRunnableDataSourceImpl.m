@interface WFRuntimeRunnableDataSourceImpl
- (WFRuntimeRunnableDataSourceImpl)init;
- (void)loadEntriesFor:(Class)a3 parameterKey:(NSString *)a4 collectionIdentifier:(NSString *)a5 limit:(int64_t)a6 completionHandler:(id)a7;
@end

@implementation WFRuntimeRunnableDataSourceImpl

- (void)loadEntriesFor:(Class)a3 parameterKey:(NSString *)a4 collectionIdentifier:(NSString *)a5 limit:(int64_t)a6 completionHandler:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA516190, (uint64_t)v13);
}

- (WFRuntimeRunnableDataSourceImpl)init
{
  return (WFRuntimeRunnableDataSourceImpl *)RuntimeRunnableDataSource.init()();
}

@end