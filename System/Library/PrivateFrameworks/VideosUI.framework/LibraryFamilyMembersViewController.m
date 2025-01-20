@interface LibraryFamilyMembersViewController
- (UINavigationItem)navigationItem;
- (_TtC8VideosUI34LibraryFamilyMembersViewController)init;
- (_TtC8VideosUI34LibraryFamilyMembersViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI34LibraryFamilyMembersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)familyMemberViewController:(id)a3 didSelectFamilyMember:(id)a4;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation LibraryFamilyMembersViewController

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1E31BF120();

  return (UINavigationItem *)v3;
}

- (_TtC8VideosUI34LibraryFamilyMembersViewController)init
{
  return (_TtC8VideosUI34LibraryFamilyMembersViewController *)sub_1E31BF160();
}

- (_TtC8VideosUI34LibraryFamilyMembersViewController)initWithCoder:(id)a3
{
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E31BF2E0();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E31BF3FC();
}

- (_TtC8VideosUI34LibraryFamilyMembersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E31BF528();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LibraryFamilyMembersViewController_familyController));
}

- (void)familyMemberViewController:(id)a3 didSelectFamilyMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E31BF5C4((uint64_t)v6, v7);
}

@end