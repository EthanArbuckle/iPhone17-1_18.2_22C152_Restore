@interface KCSharingOutgoingRow
+ (NSSet)requiredAttributeKeys;
+ (const)databaseItemClass;
- (KCSharingOutgoingRow)initWithAttributes:(id)a3 error:(id *)a4;
- (KCSharingOutgoingRow)initWithOutgoingDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
@end

@implementation KCSharingOutgoingRow

+ (NSSet)requiredAttributeKeys
{
  if (qword_10035D238 != -1) {
    dispatch_once(&qword_10035D238, &stru_100305AF0);
  }
  v2 = (void *)qword_10035D230;

  return (NSSet *)v2;
}

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_10000C75C(@"sharingOutgoingQueue", &qword_10035D070, (uint64_t)&unk_10035D068);
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:0 userInfo:0];
  objc_exception_throw(v5);
}

- (KCSharingOutgoingRow)initWithAttributes:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:0 userInfo:0];
  objc_exception_throw(v5);
}

- (KCSharingOutgoingRow)initWithOutgoingDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  CFSetRef v7 = [(id)objc_opt_class() requiredAttributeKeys];
  v8 = sub_100155CF8(a3, v7, a4);

  if (v8)
  {
    self = [(KCSharingOutgoingRow *)self initWithAttributes:v8 error:a4];
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