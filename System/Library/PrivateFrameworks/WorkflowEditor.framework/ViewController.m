@interface ViewController
- (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController)initWithCoder:(id)a3;
- (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)overrideUserInterfaceStyle;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
@end

@implementation ViewController

- (int64_t)overrideUserInterfaceStyle
{
  v2 = self;
  id v3 = sub_234A6D058();

  return (int64_t)v3;
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v4 = self;
  sub_234A6D0E4(a3);
}

- (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_234B3B588();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController *)sub_234A6D1B0(v5, v7, a4);
}

- (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController)initWithCoder:(id)a3
{
  return (_TtC14WorkflowEditorP33_4F6B3E8D8EDFB1AA2880F20B202F8EFE14ViewController *)sub_234A6D294(a3);
}

@end