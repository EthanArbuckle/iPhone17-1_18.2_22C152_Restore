@interface Coordinator
- (_TtC12PhotosUICore11Coordinator)init;
- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6;
@end

@implementation Coordinator

- (_TtC12PhotosUICore11Coordinator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = objc_allocWithZone((Class)PXCMMWorkflowCoordinator);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC12PhotosUICore11Coordinator_workflowCoordinator) = v6;

  v9.receiver = v5;
  v9.super_class = ObjectType;
  v7 = [(Coordinator *)&v9 init];
  objc_msgSend(*(id *)((char *)&v7->super.isa + OBJC_IVAR____TtC12PhotosUICore11Coordinator_workflowCoordinator), sel_setDelegate_, v7);
  return v7;
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
}

- (void).cxx_destruct
{
}

@end