@interface SFBrowsingAssistant
- (BOOL)stepperFocused;
- (SFBrowsingAssistant)initWithCoder:(id)a3;
- (SFBrowsingAssistant)initWithNibName:(id)a3 bundle:(id)a4;
- (SFBrowsingAssistant)initWithShowingOnStartPage:(BOOL)a3;
- (SFBrowsingAssistantDataSource)dataSource;
- (SFBrowsingAssistantDelegate)delegate;
- (double)detentHeight;
- (void)readerVisibilityDidChange;
- (void)reloadData;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStepperFocused:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFBrowsingAssistant

- (SFBrowsingAssistant)initWithShowingOnStartPage:(BOOL)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SFBrowsingAssistant_isShowingOnStartPage) = a3;
  objc_allocWithZone((Class)type metadata accessor for BrowsingAssistant());
  v5 = self;
  *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___SFBrowsingAssistant_assistant) = (Class)sub_18C5739F0(a3);

  v7.receiver = v5;
  v7.super_class = (Class)SFBrowsingAssistant;
  return [(SFBrowsingAssistant *)&v7 initWithNibName:0 bundle:0];
}

- (SFBrowsingAssistant)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (SFBrowsingAssistant *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (SFBrowsingAssistantDataSource)dataSource
{
  return (SFBrowsingAssistantDataSource *)sub_18C682330((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistant_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (SFBrowsingAssistantDelegate)delegate
{
  return (SFBrowsingAssistantDelegate *)sub_18C682330((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistant_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)detentHeight
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9177A90);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBrowsingAssistant_assistant);
  v8 = self;
  id v9 = objc_msgSend(v7, sel_view);
  if (v9)
  {
    v11 = v9;
    objc_msgSend(v9, sel_bounds);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    double Width = CGRectGetWidth(v24);
    id v21 = sub_18C371098();
    sub_18C6F8ED8();

    double v22 = sub_18C576C04((uint64_t)v6, Width);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

    return v22;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  SFBrowsingAssistant.viewDidLoad()();
}

- (BOOL)stepperFocused
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBrowsingAssistant_assistant)
                 + OBJC_IVAR___SFBrowsingAssistantCollection_globalHeaderFooter);
  if (v2 && (uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper)) != 0) {
    return objc_msgSend(v3, sel_isFocusedInPageMenu);
  }
  else {
    return 0;
  }
}

- (void)setStepperFocused:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C458FEC(a3);
}

- (void)readerVisibilityDidChange
{
  uint64_t v2 = self;
  SFBrowsingAssistant.readerVisibilityDidChange()();
}

- (void)reloadData
{
  uint64_t v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBrowsingAssistant_assistant);
  uint64_t v3 = self;
  if (objc_msgSend(v2, sel_isViewLoaded)) {
    sub_18C36F530(0, 255, (uint64_t)CGRectMake, 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (SFBrowsingAssistant)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (SFBrowsingAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18C57B508((uint64_t)self + OBJC_IVAR___SFBrowsingAssistant_dataSource);
  uint64_t v3 = (char *)self + OBJC_IVAR___SFBrowsingAssistant_delegate;

  sub_18C57B508((uint64_t)v3);
}

@end