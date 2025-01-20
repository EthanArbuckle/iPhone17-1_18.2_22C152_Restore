@interface WorkflowEditorOptions
- (_TtC14WorkflowEditor21WorkflowEditorOptions)init;
- (double)actionCanvasWidth;
- (void)appendAction:(id)a3;
- (void)presentDrawerViewController:(id)a3 inPopover:(BOOL)a4 withSourceRect:(CGRect)a5;
@end

@implementation WorkflowEditorOptions

- (_TtC14WorkflowEditor21WorkflowEditorOptions)init
{
  return (_TtC14WorkflowEditor21WorkflowEditorOptions *)sub_234945164();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions__canShowEmptyState;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFEC8);
  OUTLINED_FUNCTION_4();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
  uint64_t v7 = OUTLINED_FUNCTION_21_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions__canShowInputAction);
  ((void (*)(uint64_t))v6)(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFEE8);
  OUTLINED_FUNCTION_4();
  uint64_t v8 = OUTLINED_FUNCTION_8_3();
  v9(v8);
  uint64_t v10 = OUTLINED_FUNCTION_21_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions__isExplicitlyReadOnly);
  ((void (*)(uint64_t))v6)(v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFF10);
  OUTLINED_FUNCTION_4();
  uint64_t v11 = OUTLINED_FUNCTION_8_3();
  v12(v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFF28);
  OUTLINED_FUNCTION_4();
  uint64_t v13 = OUTLINED_FUNCTION_8_3();
  v14(v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFF40);
  OUTLINED_FUNCTION_4();
  uint64_t v15 = OUTLINED_FUNCTION_8_3();
  v16(v15);
  sub_23494A5D4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions_editorDelegate);
  sub_23494A5D4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions_auxiliaryViewPresenter);
  sub_23494A5D4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions_coordinateSpaceDelegate);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFF58);
  OUTLINED_FUNCTION_4();
  uint64_t v17 = OUTLINED_FUNCTION_8_3();
  v18(v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFF68);
  OUTLINED_FUNCTION_4();
  uint64_t v19 = OUTLINED_FUNCTION_8_3();
  v20(v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFF80);
  OUTLINED_FUNCTION_4();
  uint64_t v21 = OUTLINED_FUNCTION_8_3();
  v22(v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFF98);
  OUTLINED_FUNCTION_4();
  uint64_t v23 = OUTLINED_FUNCTION_8_3();
  v24(v23);
  uint64_t v25 = OUTLINED_FUNCTION_21_1(OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions__isEditingVariable);
  ((void (*)(uint64_t))v6)(v25);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorOptions_pendingScrollParameters));
  swift_release();
  swift_release();
}

- (void)appendAction:(id)a3
{
  uint64_t v4 = (WFAction *)a3;
  uint64_t v5 = self;
  WorkflowEditorOptions.appendAction(_:)(v4);
}

- (double)actionCanvasWidth
{
  return WorkflowEditorOptions.actionCanvasWidth()();
}

- (void)presentDrawerViewController:(id)a3 inPopover:(BOOL)a4 withSourceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v11 = (UIViewController *)a3;
  v12 = self;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  WorkflowEditorOptions.presentDrawerViewController(_:inPopover:withSourceRect:)(v11, a4, v14);
}

@end