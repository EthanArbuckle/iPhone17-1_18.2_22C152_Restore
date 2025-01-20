@interface DisplayPreferencesViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)dismissTapped;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)visibilitySwitchChanged:(id)a3;
@end

@implementation DisplayPreferencesViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_23A2BDA24();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DisplayPreferencesViewController();
  id v4 = v7.receiver;
  [(DisplayPreferencesViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_tableView, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_reloadData);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DisplayPreferencesViewController();
  id v4 = (char *)v7.receiver;
  [(DisplayPreferencesViewController *)&v7 viewWillDisappear:v3];
  id v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_onSettingsDismissed];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_239C25118((uint64_t)v5);
  }
}

- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_contentSizeObserver) = 0;
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_onSettingsDismissed);
  *id v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels) = (Class)MEMORY[0x263F8EE78];
  id v5 = a3;

  result = (_TtC9SeymourUI32DisplayPreferencesViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_23A2BE27C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_contentSizeObserver));
  swift_release();
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_onSettingsDismissed));

  swift_bridgeObjectRelease();
}

- (void)visibilitySwitchChanged:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23A2BE388(v4);
}

- (void)dismissTapped
{
}

- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC9SeymourUI32DisplayPreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI32DisplayPreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 72 * a4 + 32) + 16);
    }
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = self;
  v8 = (void *)sub_23A2BE560(v6, a4);

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = self;
  v8 = (void *)sub_23A2BE80C(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  double result = *MEMORY[0x263F839B8];
  if (!*(void *)(v4 + 72 * a4 + 56)) {
    return 2.22507386e-308;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  double result = *MEMORY[0x263F839B8];
  if (!*(void *)(v4 + 72 * a4 + 72)) {
    return 2.22507386e-308;
  }
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  double result = 44.0;
  if (!*(void *)(v4 + 72 * a4 + 56)) {
    return 2.22507386e-308;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_23A2BEB9C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  v11 = self;
  unint64_t v12 = sub_23A7F6AF8();
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v13 = *(uint64_t *)((char *)&v11->super.super.super.super.isa
                   + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
  if (v12 >= *(void *)(v13 + 16))
  {
LABEL_5:
    __break(1u);
    return v12;
  }
  char v14 = *(unsigned char *)(v13 + 72 * v12 + 41);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  LOBYTE(v12) = v14;
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  v11 = self;
  sub_23A2BF0E4(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end