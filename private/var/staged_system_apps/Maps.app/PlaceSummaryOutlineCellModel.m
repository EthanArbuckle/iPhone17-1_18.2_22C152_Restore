@interface PlaceSummaryOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (ReportASearchAutocompleteResult)rapObject;
- (SearchResult)searchResult;
- (UICollectionViewCellRegistration)cellRegistration;
- (_TtC4Maps28PlaceSummaryAsyncDataManager)asyncDataManager;
- (_TtC4Maps28PlaceSummaryOutlineCellModel)init;
- (_TtC4Maps28PlaceSummaryOutlineCellModel)initWithRapObject:(id)a3 placeSummaryViewModelTemplate:(id)a4 delegate:(id)a5 asyncDataManager:(id)a6 curatedCollectionImageDownloader:(id)a7;
- (_TtC4Maps28PlaceSummaryOutlineCellModel)initWithSearchResult:(id)a3 placeSummaryViewModelTemplate:(id)a4 delegate:(id)a5 asyncDataManager:(id)a6 curatedCollectionImageDownloader:(id)a7;
- (_TtC4Maps29PlaceSummaryViewModelTemplate)placeSummaryViewModelTemplate;
- (_TtC4Maps35CuratedGuideViewModelDataDownloader)curatedCollectionImageDownloader;
- (_TtP4Maps36PlaceSummaryOutlineCellModelDelegate_)delegate;
- (id)homeActionObject;
- (id)homeDragAndDropObject;
- (int64_t)hash;
- (void)setDelegate:(id)a3;
- (void)setPlaceSummaryViewModelTemplate:(id)a3;
- (void)setRapObject:(id)a3;
- (void)setSearchResult:(id)a3;
@end

@implementation PlaceSummaryOutlineCellModel

- (_TtC4Maps29PlaceSummaryViewModelTemplate)placeSummaryViewModelTemplate
{
  return (_TtC4Maps29PlaceSummaryViewModelTemplate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_placeSummaryViewModelTemplate));
}

- (void)setPlaceSummaryViewModelTemplate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_placeSummaryViewModelTemplate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_placeSummaryViewModelTemplate) = (Class)a3;
  id v3 = a3;
}

- (SearchResult)searchResult
{
  return (SearchResult *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult));
}

- (void)setSearchResult:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult) = (Class)a3;
  id v3 = a3;
}

- (ReportASearchAutocompleteResult)rapObject
{
  return (ReportASearchAutocompleteResult *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_rapObject));
}

- (void)setRapObject:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_rapObject);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_rapObject) = (Class)a3;
  id v3 = a3;
}

- (_TtP4Maps36PlaceSummaryOutlineCellModelDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps36PlaceSummaryOutlineCellModelDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps28PlaceSummaryAsyncDataManager)asyncDataManager
{
  return (_TtC4Maps28PlaceSummaryAsyncDataManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_asyncDataManager));
}

- (_TtC4Maps35CuratedGuideViewModelDataDownloader)curatedCollectionImageDownloader
{
  return (_TtC4Maps35CuratedGuideViewModelDataDownloader *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_curatedCollectionImageDownloader);
}

- (_TtC4Maps28PlaceSummaryOutlineCellModel)initWithRapObject:(id)a3 placeSummaryViewModelTemplate:(id)a4 delegate:(id)a5 asyncDataManager:(id)a6 curatedCollectionImageDownloader:(id)a7
{
  return (_TtC4Maps28PlaceSummaryOutlineCellModel *)sub_1001FBA88((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)a5, a6, a7, (uint64_t (*)(id, id, uint64_t, id, id))sub_1001FE3FC);
}

- (_TtC4Maps28PlaceSummaryOutlineCellModel)initWithSearchResult:(id)a3 placeSummaryViewModelTemplate:(id)a4 delegate:(id)a5 asyncDataManager:(id)a6 curatedCollectionImageDownloader:(id)a7
{
  return (_TtC4Maps28PlaceSummaryOutlineCellModel *)sub_1001FBA88((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)a5, a6, a7, (uint64_t (*)(id, id, uint64_t, id, id))sub_1001FE4F4);
}

- (UICollectionViewCellRegistration)cellRegistration
{
  uint64_t v2 = qword_1015CBC70;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = (UICollectionViewCellRegistration *)(id)qword_1016115D8;

  return v4;
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(PlaceSummaryOutlineCellModel *)self isEqual:a3];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1001FBBCC((uint64_t)v8);

  sub_1001189D4((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  int64_t result = *(int64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult);
  if (result) {
    return (int64_t)[(id)result hash];
  }
  return result;
}

- (id)homeActionObject
{
  uint64_t v2 = self;
  sub_1001FBF20((uint64_t)v11);

  uint64_t v3 = v12;
  if (v12)
  {
    id v4 = sub_1000FF380(v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = __chkstk_darwin(v4);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
    v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    sub_1000FF22C((uint64_t)v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)homeDragAndDropObject
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult);
  if (v2)
  {
    __n128 v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_searchResult);
    sub_100100830(0, &qword_1015CF700);
    id v3 = v2;
    id v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (_TtC4Maps28PlaceSummaryOutlineCellModel)init
{
  int64_t result = (_TtC4Maps28PlaceSummaryOutlineCellModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_placeSummaryViewModelTemplate));

  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_delegate);
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps28PlaceSummaryOutlineCellModel_curatedCollectionImageDownloader);
}

@end