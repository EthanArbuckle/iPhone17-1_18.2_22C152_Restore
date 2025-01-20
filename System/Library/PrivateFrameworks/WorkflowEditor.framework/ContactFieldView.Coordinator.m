@interface ContactFieldView.Coordinator
- (_TtCV14WorkflowEditor16ContactFieldView11Coordinator)init;
- (id)viewControllerContainingContactField:(id)a3;
@end

@implementation ContactFieldView.Coordinator

- (id)viewControllerContainingContactField:(id)a3
{
  v3 = sub_2349675A4();
  return v3;
}

- (_TtCV14WorkflowEditor16ContactFieldView11Coordinator)init
{
  return (_TtCV14WorkflowEditor16ContactFieldView11Coordinator *)sub_2349676C4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV14WorkflowEditor16ContactFieldView11Coordinator_autocompleteCoordinator));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV14WorkflowEditor16ContactFieldView11Coordinator_controller);
}

@end