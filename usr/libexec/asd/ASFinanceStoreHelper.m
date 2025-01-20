@interface ASFinanceStoreHelper
- (NSString)errorDomain;
- (_TtC3asd20ASFinanceStoreHelper)init;
- (void)countTransactionsWithStartDateOffset:(unint64_t)a3 endDateOffset:(unint64_t)a4 transactionSources:(unint64_t)a5 locationType:(unint64_t)a6 locationFilterDistance:(int64_t)a7 lat:(NSString *)a8 lon:(NSString *)a9 maxCount:(unint64_t)a10 completionHandler:(id)aBlock;
- (void)queryTransactionsWithStartDateOffset:(unint64_t)a3 endDateOffset:(unint64_t)a4 transactionSources:(unint64_t)a5 locationType:(unint64_t)a6 locationFilterDistance:(int64_t)a7 lat:(NSString *)a8 lon:(NSString *)a9 maxCount:(unint64_t)a10 sortOrder:(unint64_t)a11 sortByAttributes:(unint64_t)a12 attributes:(unint64_t)a13 completionHandler:(id)aBlock;
@end

@implementation ASFinanceStoreHelper

- (NSString)errorDomain
{
  id v2 = ASFinanceStoreHelper.errorDomain.getter();

  return (NSString *)v2;
}

- (_TtC3asd20ASFinanceStoreHelper)init
{
  return (_TtC3asd20ASFinanceStoreHelper *)ASFinanceStoreHelper.init()();
}

- (void)queryTransactionsWithStartDateOffset:(unint64_t)a3 endDateOffset:(unint64_t)a4 transactionSources:(unint64_t)a5 locationType:(unint64_t)a6 locationFilterDistance:(int64_t)a7 lat:(NSString *)a8 lon:(NSString *)a9 maxCount:(unint64_t)a10 sortOrder:(unint64_t)a11 sortByAttributes:(unint64_t)a12 attributes:(unint64_t)a13 completionHandler:(id)aBlock
{
  v20 = _Block_copy(aBlock);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a3;
  *(void *)(v21 + 24) = a4;
  *(void *)(v21 + 32) = a5;
  *(void *)(v21 + 40) = a6;
  *(void *)(v21 + 48) = a7;
  *(void *)(v21 + 56) = a8;
  *(void *)(v21 + 64) = a9;
  *(_OWORD *)(v21 + 72) = *(_OWORD *)&a10;
  *(void *)(v21 + 88) = a12;
  *(void *)(v21 + 96) = a13;
  *(void *)(v21 + 104) = v20;
  *(void *)(v21 + 112) = self;
  v22 = a8;
  v23 = a9;
  v24 = self;

  sub_1000B14E8((uint64_t)&unk_100698088, v21);
}

- (void)countTransactionsWithStartDateOffset:(unint64_t)a3 endDateOffset:(unint64_t)a4 transactionSources:(unint64_t)a5 locationType:(unint64_t)a6 locationFilterDistance:(int64_t)a7 lat:(NSString *)a8 lon:(NSString *)a9 maxCount:(unint64_t)a10 completionHandler:(id)aBlock
{
  v17 = _Block_copy(aBlock);
  v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = a7;
  v18[7] = a8;
  v18[8] = a9;
  v18[9] = a10;
  v18[10] = v17;
  v18[11] = self;
  v19 = a8;
  v20 = a9;
  uint64_t v21 = self;

  sub_1000B14E8((uint64_t)&unk_100698078, (uint64_t)v18);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd20ASFinanceStoreHelper_errorDomain);
}

@end