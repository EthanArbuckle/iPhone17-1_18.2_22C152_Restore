@interface ICQueryResultsControllerObjC
- (ICQueryObjC)query;
- (ICQueryResultsControllerObjC)init;
- (ICQueryResultsControllerObjC)initWithManagedObjectContext:(id)a3 query:(id)a4;
- (NSManagedObjectContext)managedObjectContext;
- (id)fetchRequest;
- (id)performFetch;
- (void)setQuery:(id)a3;
@end

@implementation ICQueryResultsControllerObjC

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICQueryResultsControllerObjC_managedObjectContext));
}

- (ICQueryObjC)query
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_query);
  swift_beginAccess();
  return (ICQueryObjC *)*v2;
}

- (void)setQuery:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_query);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (id)fetchRequest
{
  v2 = self;
  id v3 = ICQueryResultsController.fetchRequest.getter();

  return v3;
}

- (ICQueryResultsControllerObjC)initWithManagedObjectContext:(id)a3 query:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_managedObjectContext) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_query) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v8 = a3;
  id v9 = a4;
  return [(ICQueryResultsControllerObjC *)&v11 init];
}

- (id)performFetch
{
  v2 = self;
  ICQueryResultsController.performFetch()();

  sub_1C3C4C8B4(0, (unint64_t *)&qword_1EA388CF0);
  sub_1C3CDE5C0();
  id v3 = (void *)sub_1C3DBA428();
  swift_bridgeObjectRelease();
  return v3;
}

- (ICQueryResultsControllerObjC)init
{
  result = (ICQueryResultsControllerObjC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_query);
}

@end