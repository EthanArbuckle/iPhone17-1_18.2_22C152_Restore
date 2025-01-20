@interface TTRIReminderListPickerViewController
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelButtonAction:(id)a3;
- (void)moveButtonAction:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TTRIReminderListPickerViewController

- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_palette);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_contentSizeObserver) = 0;
  id v5 = a3;

  result = (_TtC15RemindersUICore36TTRIReminderListPickerViewController *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B910E018();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TTRIReminderListPickerViewController *)&v5 viewWillAppear:v3];
  sub_1B910E400();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRIReminderListPickerViewController *)&v3 viewWillLayoutSubviews];
  sub_1B910E8F0();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return *(void *)((*(void **)((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_presenter))[4]
                   + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(self + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_presenter)
                   + 32);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 48 * a4 + 72) + 16);
    }
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  v8 = (void *)sub_1B910EBF4((uint64_t)v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 0.0;
  if (*(void *)((*(void **)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_presenter))[4]
                 + 16) > a4)
  {
    if (a4 < 0) {
      __break(1u);
    }
    else {
      return *MEMORY[0x1E4FB2F28];
    }
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  v11 = self;
  v12 = sub_1B910ED54();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B996ACB0();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_presenter);
  uint64_t v11 = *(void *)(v10 + 32);
  v12 = *(void **)(v10 + 40);
  id v13 = v12;
  id v14 = a3;
  v15 = self;
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  unint64_t v16 = sub_1B996ACD0();
  unint64_t v17 = sub_1B996AD10();
  TTRReminderListPickerViewModel.list(at:inSectionAt:)(v16, v17, v11, v12, (uint64_t)v19);

  swift_bridgeObjectRelease();
  sub_1B9110AC4((uint64_t)v19);

  LOBYTE(v11) = (v19[219] & 1) == 0;
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1B910FA3C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)cancelButtonAction:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    objc_super v5 = self;
  }
  -[TTRIReminderListPickerViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_1B90CCA68((uint64_t)&v6, &qword_1EB9B4D10);
}

- (void)moveButtonAction:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    objc_super v5 = self;
  }
  sub_1B9113540((uint64_t)self);

  sub_1B90CCA68((uint64_t)v6, &qword_1EB9B4D10);
}

- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithStyle:(int64_t)a3
{
  double result = (_TtC15RemindersUICore36TTRIReminderListPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC15RemindersUICore36TTRIReminderListPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1B91109DC(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_palette), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_palette));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_contentSizeObserver);
}

@end