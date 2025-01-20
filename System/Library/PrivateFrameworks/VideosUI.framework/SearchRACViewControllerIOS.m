@interface SearchRACViewControllerIOS
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC8VideosUI26SearchRACViewControllerIOS)initWithCoder:(id)a3;
- (_TtC8VideosUI26SearchRACViewControllerIOS)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelButtonTapped;
- (void)dealloc;
- (void)keyboardStateWillChange:(id)a3;
- (void)submitButtonTapped;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SearchRACViewControllerIOS

- (_TtC8VideosUI26SearchRACViewControllerIOS)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E30E1818();
}

- (void)viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E30E1D78();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1E30E2068(a3);
}

- (void)keyboardStateWillChange:(id)a3
{
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v4);
  sub_1E3875BE8();
  v5 = self;
  sub_1E30E2188();

  uint64_t v6 = OUTLINED_FUNCTION_55_0();
  v7(v6);
}

- (void)dealloc
{
  v2 = self;
  sub_1E30E23E4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1E2BEA314((uint64_t)self + OBJC_IVAR____TtC8VideosUI26SearchRACViewControllerIOS_selectedOption, (uint64_t *)&unk_1EADEA268);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26SearchRACViewControllerIOS____lazy_storage___menuTableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26SearchRACViewControllerIOS____lazy_storage___submitButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI26SearchRACViewControllerIOS____lazy_storage___cancelButton);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E30E2B50();
}

- (void)submitButtonTapped
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E30E2CC0();
}

- (void)cancelButtonTapped
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E30E3310();
}

- (_TtC8VideosUI26SearchRACViewControllerIOS)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E30E357C();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1E30E35D4((uint64_t)self, a4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_1E387C928();
  id v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_1E30E3620(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1E30E3790((uint64_t)v7, a4);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_1E387C8E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  uint64_t v9 = (void *)OUTLINED_FUNCTION_20_40();
  sub_1E30E3894(v9);
  double v11 = v10;

  uint64_t v12 = OUTLINED_FUNCTION_7_2();
  v13(v12);
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  OUTLINED_FUNCTION_20_40();
  sub_1E30E39BC();
  double v10 = v9;

  uint64_t v11 = OUTLINED_FUNCTION_7_2();
  v12(v11);
  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return sub_1E30E4288();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3_19();
  id v7 = v4;
  id v8 = v5;
  OUTLINED_FUNCTION_20_40();
  sub_1E30E42C8();

  uint64_t v9 = OUTLINED_FUNCTION_7_2();
  v10(v9);
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E30E47C0();
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E30E483C(v4);
}

@end