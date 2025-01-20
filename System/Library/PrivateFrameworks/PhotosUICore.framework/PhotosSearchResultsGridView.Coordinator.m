@interface PhotosSearchResultsGridView.Coordinator
- (_TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator)init;
- (id)photosViewController:(id)a3 animationForProposedAnimation:(id)a4;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)photosViewController:(id)a3 didPresentOneUp:(BOOL)a4 forAsset:(id)a5;
- (void)photosViewController:(id)a3 didReceiveUserInteraction:(BOOL)a4;
- (void)photosViewController:(id)a3 scrollViewControllerWillBeginScrolling:(id)a4;
- (void)viewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5;
@end

@implementation PhotosSearchResultsGridView.Coordinator

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1AA4BBF88(v8);
}

- (void)photosViewController:(id)a3 scrollViewControllerWillBeginScrolling:(id)a4
{
}

- (void)photosViewController:(id)a3 didReceiveUserInteraction:(BOOL)a4
{
}

- (void)photosViewController:(id)a3 didPresentOneUp:(BOOL)a4 forAsset:(id)a5
{
  swift_unknownObjectRetain();
  id v7 = a5;
  self;
  sub_1AA4BC3A4(v7);
}

- (id)photosViewController:(id)a3 animationForProposedAnimation:(id)a4
{
  sub_1A9B21070(0, (unint64_t *)&qword_1E981C660);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = self;
  id v9 = objc_msgSend(ObjCClassFromMetadata, sel_sharedInstance);
  unsigned __int8 v10 = objc_msgSend(v9, sel_enableSearchResultDiffAnimation);

  if ((v10 & 1) == 0)
  {

    id v7 = 0;
  }

  swift_unknownObjectRelease();
  return v7;
}

- (void)viewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5
{
  id v6 = a3;
  id v7 = self;
  sub_1AA4BCA88((uint64_t)v6);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  sub_1AB23AD0C();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = self;
  id v8 = a3;
  id v9 = self;
  sub_1A9B19E98((uint64_t)sub_1AA4BF798, (uint64_t)v10);
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1AA4BCC64();
}

- (_TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator)init
{
  result = (_TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AA4BF324((uint64_t)self + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_parent, type metadata accessor for PhotosSearchResultsGridView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_dataSourceManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_bodyLayoutProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_viewOptionsModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_collectionResultCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_topResultCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_allResultCollection));
  sub_1AA4BF324((uint64_t)self + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_container, (uint64_t (*)(void))sub_1AA4B64F0);
  sub_1A9E79008(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults), *(void *)&self->_anon_0[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void *)&self->dataSourceManager[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void *)&self->bodyLayoutProvider[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void *)&self->viewOptionsModel[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void **)&self->toolbarModel[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void *)&self->collectionResultCollection[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void *)&self->topResultCollection[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void **)&self->allResultCollection[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults]);
  swift_bridgeObjectRelease();
}

@end