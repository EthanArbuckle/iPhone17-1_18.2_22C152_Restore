@interface TTRSearchForNotebookItemsIntentHandler
- (_TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler)init;
- (void)handleSearchForNotebookItems:(id)a3 completion:(id)a4;
- (void)resolveItemTypeForSearchForNotebookItems:(id)a3 withCompletion:(id)a4;
- (void)resolveLocationForSearchForNotebookItems:(id)a3 withCompletion:(id)a4;
- (void)resolveLocationSearchTypeForSearchForNotebookItems:(id)a3 withCompletion:(id)a4;
@end

@implementation TTRSearchForNotebookItemsIntentHandler

- (void)resolveItemTypeForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveLocationForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  id v11 = a3;
  v7 = self;
  id v8 = [v11 location];
  if (v8)
  {
    v9 = v8;
    id v10 = [self successWithResolvedPlacemark:v8];
    v6[2](v6, v10);
  }
  else
  {
    sub_10000A498(0, &qword_100046338);
    id v10 = [(id)swift_getObjCClassFromMetadata() notRequired];
    v6[2](v6, v10);
  }

  _Block_release(v6);
}

- (void)resolveLocationSearchTypeForSearchForNotebookItems:(id)a3 withCompletion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = self;
  id v8 = a3;
  id v10 = self;
  id v9 = [v7 successWithResolvedLocationSearchType:[v8 locationSearchType]];
  v6[2](v6, v9);

  _Block_release(v6);
}

- (void)handleSearchForNotebookItems:(id)a3 completion:(id)a4
{
}

- (_TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler)init
{
  result = (_TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_queue));
  sub_10000A4D4((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource);
  v3 = (char *)self + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider;

  sub_10000A4D4((uint64_t)v3);
}

@end