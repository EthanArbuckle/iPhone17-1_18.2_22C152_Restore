@interface ICNoteBrowseActionMenu
- (ICNoteBrowseActionMenu)initWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7;
- (ICNoteBrowseActionMenu)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7;
- (id)mainSectionMenu;
- (id)menuSections;
- (void)willShowMenu;
@end

@implementation ICNoteBrowseActionMenu

- (void)willShowMenu
{
  v2 = self;
  sub_1003DFAB0();
}

- (id)menuSections
{
  v2 = self;
  sub_1003DFC3C();

  sub_1003E03EC();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)mainSectionMenu
{
  v2 = self;
  id v3 = sub_1003DFEBC();

  return v3;
}

- (ICNoteBrowseActionMenu)initWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  v11 = (uint64_t (*)())_Block_copy(a7);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_1002A5318;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (ICNoteBrowseActionMenu *)sub_10036F86C(v13, (uint64_t)v14, a5, (uint64_t)v16, (uint64_t)v11, v12);
  sub_10002E70C((uint64_t)v11);

  return v17;
}

- (ICNoteBrowseActionMenu)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  v11 = _Block_copy(a7);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_100262970;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (ICNoteBrowseActionMenu *)sub_10036FA14(v13, (uint64_t)v14, a5, (uint64_t)v16, (uint64_t)v11, v12);
  sub_10002E70C((uint64_t)v11);

  return v17;
}

@end