@interface LibraryPromptViewController
- (_TtC8VideosUI27LibraryPromptViewController)init;
- (_TtC8VideosUI27LibraryPromptViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI27LibraryPromptViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation LibraryPromptViewController

- (_TtC8VideosUI27LibraryPromptViewController)init
{
  return (_TtC8VideosUI27LibraryPromptViewController *)sub_1E318D0A4();
}

- (_TtC8VideosUI27LibraryPromptViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E318D134();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E318D1BC();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E318D5F4();
}

- (_TtC8VideosUI27LibraryPromptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E318D6F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27LibraryPromptViewController____lazy_storage___alertView));
}

@end