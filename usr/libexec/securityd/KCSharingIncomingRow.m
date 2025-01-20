@interface KCSharingIncomingRow
+ (NSSet)requiredAttributeKeys;
+ (const)databaseItemClass;
- (KCSharingIncomingRow)initWithAttributes:(id)a3 error:(id *)a4;
- (KCSharingIncomingRow)initWithIncomingDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
@end

@implementation KCSharingIncomingRow

+ (NSSet)requiredAttributeKeys
{
  if (qword_10035D080 != -1) {
    dispatch_once(&qword_10035D080, &stru_100303A78);
  }
  v2 = (void *)qword_10035D078;

  return (NSSet *)v2;
}

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_10000C75C(@"sharingIncomingQueue", &qword_10035D050, (uint64_t)&unk_10035D048);
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:0 userInfo:0];
  objc_exception_throw(v5);
}

- (KCSharingIncomingRow)initWithAttributes:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:0 userInfo:0];
  objc_exception_throw(v5);
}

- (KCSharingIncomingRow)initWithIncomingDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  CFSetRef v7 = [(id)objc_opt_class() requiredAttributeKeys];
  v8 = sub_100155CF8(a3, v7, a4);

  if (v8)
  {
    self = [(KCSharingIncomingRow *)self initWithAttributes:v8 error:a4];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

@end