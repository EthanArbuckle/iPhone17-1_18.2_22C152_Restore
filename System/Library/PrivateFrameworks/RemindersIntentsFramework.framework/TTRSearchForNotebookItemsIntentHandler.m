@interface TTRSearchForNotebookItemsIntentHandler
- (_TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler)init;
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
  id v8 = objc_msgSend(v11, sel_location);
  if (v8)
  {
    v9 = v8;
    id v10 = objc_msgSend(self, sel_successWithResolvedPlacemark_, v8);
    v6[2](v6, v10);
  }
  else
  {
    sub_25AF48D94(0, &qword_26A4D6068);
    id v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
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
  id v9 = objc_msgSend(v7, sel_successWithResolvedLocationSearchType_, objc_msgSend(v8, sel_locationSearchType));
  v6[2](v6, v9);

  _Block_release(v6);
}

- (void)handleSearchForNotebookItems:(id)a3 completion:(id)a4
{
}

- (_TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler)init
{
  result = (_TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_queue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource);
  v3 = (char *)self + OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end