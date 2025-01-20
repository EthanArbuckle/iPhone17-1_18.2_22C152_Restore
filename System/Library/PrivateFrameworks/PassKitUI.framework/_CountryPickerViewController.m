@interface _CountryPickerViewController
- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithStyle:(int64_t)a3;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)cancel;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _CountryPickerViewController

- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithCoder:(id)a3
{
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FD5851C(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_19FD586F0();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_19FD58D7C(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _CountryPickerViewController();
  id v4 = v5.receiver;
  [(_CountryPickerViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_isFreshPresentation] = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _CountryPickerViewController();
  id v4 = v5.receiver;
  [(_CountryPickerViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_isFreshPresentation] = 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_filteredSections))
    return 1;
  else {
    return (*(void **)((char *)&self->super.super.super.super.isa
  }
                       + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_19FD5A954(a4);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_19FD59358((uint64_t)v6, a4);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_1A03B4958();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_filteredSections))
  {
    BOOL v3 = 0;
  }
  else
  {
    id v6 = self;
    id v7 = a3;
    uint64_t v8 = self;
    id v9 = objc_msgSend(v6, sel_currentCollation);
    id v10 = objc_msgSend(v9, sel_sectionIndexTitles);
    sub_1A03B4C58();

    BOOL v3 = (void *)sub_1A03B4C38();
    swift_bridgeObjectRelease();
  }

  return v3;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = self;
  id v11 = objc_msgSend(v8, sel_currentCollation);
  id v12 = objc_msgSend(v11, sel_sectionForSectionIndexTitleAtIndex_, a5);

  return (int64_t)v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1A03AF498();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  id v11 = a3;
  id v12 = self;
  v13 = (void *)sub_19FD5965C(v11, (unint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1A03AF498();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  id v11 = a3;
  id v12 = self;
  sub_19FD59AD4(v11, (unint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)a3;
  uint64_t v7 = self;
  objc_super v5 = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)[(_CountryPickerViewController *)v7 presentingViewController];
  if (v5)
  {
    uint64_t v6 = v5;
    [(_CountryPickerViewController *)v5 dismissViewControllerAnimated:1 completion:0];

    id v4 = v7;
    uint64_t v7 = v6;
  }
}

- (void)cancel
{
  objc_super v5 = self;
  v2 = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)[(_CountryPickerViewController *)v5 presentingViewController];
  if (v2)
  {
    BOOL v3 = v2;
    [(_CountryPickerViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super._nibBundle
                  + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_configuration);
  char v4 = *((unsigned char *)&self->super.super._parentViewController
       + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_configuration);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_19F49FB40(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_super v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_8AF49C9430B60B059CB9BE426A22509528_CountryPickerViewController_resultsSearchController);
}

@end