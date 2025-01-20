@interface ICNoteFormattingViewController
- (ICNoteFormattingViewController)init;
- (ICNoteFormattingViewController)initWithCoder:(id)a3;
- (ICNoteFormattingViewController)initWithConfiguration:(id)a3;
- (ICNoteFormattingViewControllerDelegate)formattingDelegate;
- (void)setFormattingDelegate:(id)a3;
- (void)updateWithDataSource:(id)a3 ignoreTypingAttributes:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICNoteFormattingViewController

- (ICNoteFormattingViewControllerDelegate)formattingDelegate
{
  v2 = (char *)self + OBJC_IVAR___ICNoteFormattingViewController_formattingDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x210546B30](v2);

  return (ICNoteFormattingViewControllerDelegate *)v3;
}

- (void)setFormattingDelegate:(id)a3
{
}

- (ICNoteFormattingViewController)init
{
  return (ICNoteFormattingViewController *)NoteFormattingViewController.init()();
}

- (ICNoteFormattingViewController)initWithCoder:(id)a3
{
  return (ICNoteFormattingViewController *)sub_20C0580D8(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_20C058198(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_20C0582DC(a3);
}

- (void)updateWithDataSource:(id)a3 ignoreTypingAttributes:(BOOL)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_20C0583DC(a3, a4);
  swift_unknownObjectRelease();
}

- (ICNoteFormattingViewController)initWithConfiguration:(id)a3
{
  id v3 = a3;
  result = (ICNoteFormattingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20BFCEB78((uint64_t)self + OBJC_IVAR___ICNoteFormattingViewController_formattingDelegate);

  swift_bridgeObjectRelease();
}

@end