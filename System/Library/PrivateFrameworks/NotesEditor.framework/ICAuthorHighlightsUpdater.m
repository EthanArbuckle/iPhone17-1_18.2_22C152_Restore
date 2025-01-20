@interface ICAuthorHighlightsUpdater
- (BOOL)didScheduleUpdate;
- (BOOL)hasHighlights;
- (BOOL)showsCollaboratorStatuses;
- (BOOL)updatesVisibleRangesOnly;
- (ICAuthorHighlightsController)authorHighlightsController;
- (ICAuthorHighlightsUpdater)init;
- (ICAuthorHighlightsUpdater)initWithAuthorHighlightsController:(id)a3 textLayoutManager:(id)a4;
- (ICSearchResultRegexMatchFinder)searchHighlightRegexFinder;
- (ICTK2TextLayoutManager)textLayoutManager;
- (ICTTTextEditFilter)filter;
- (NSValue)focusedRangeValue;
- (NSValue)highlightedRangeValue;
- (double)highlightedValue;
- (void)dealloc;
- (void)flashHighlightsForFilter:(id)a3;
- (void)flashHighlightsForRanges:(id)a3 inTextStorage:(id)a4;
- (void)noteShowsCollaboratorCursorsDidChange:(id)a3;
- (void)scheduleUpdateAnimated:(BOOL)a3;
- (void)scheduleUpdateAnimated:(BOOL)a3 force:(BOOL)a4;
- (void)setFilter:(id)a3;
- (void)setFocusedRangeValue:(id)a3;
- (void)setHighlightedValue:(double)a3;
- (void)setSearchHighlightRegexFinder:(id)a3;
- (void)setUpdatesVisibleRangesOnly:(BOOL)a3;
- (void)updateAnimated:(BOOL)a3;
- (void)updateAnimated:(BOOL)a3 force:(BOOL)a4;
@end

@implementation ICAuthorHighlightsUpdater

- (ICAuthorHighlightsController)authorHighlightsController
{
  return (ICAuthorHighlightsController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR___ICAuthorHighlightsUpdater_authorHighlightsController));
}

- (ICTK2TextLayoutManager)textLayoutManager
{
  return (ICTK2TextLayoutManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICAuthorHighlightsUpdater_textLayoutManager));
}

- (ICAuthorHighlightsUpdater)initWithAuthorHighlightsController:(id)a3 textLayoutManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (ICAuthorHighlightsUpdater *)AuthorHighlightsUpdater.init(authorHighlightsController:textLayoutManager:)(v5, a4);
}

- (void)dealloc
{
  v2 = self;
  AuthorHighlightsUpdater.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_updateTimer);
}

- (double)highlightedValue
{
  v2 = (double *)((char *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_highlightedValue);
  swift_beginAccess();
  return *v2;
}

- (void)setHighlightedValue:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_highlightedValue);
  swift_beginAccess();
  double *v4 = a3;
}

- (ICTTTextEditFilter)filter
{
  return (ICTTTextEditFilter *)sub_20C02DB1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICAuthorHighlightsUpdater_filter);
}

- (void)setFilter:(id)a3
{
  id v5 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_filter);
  swift_beginAccess();
  id v6 = *v5;
  *id v5 = a3;
  id v7 = a3;
  v8 = self;

  id v9 = sub_20C13F124();
  id v10 = *v5;
  objc_msgSend(v9, sel_setFilter_, v10);
}

- (BOOL)showsCollaboratorStatuses
{
  v2 = self;
  char v3 = AuthorHighlightsUpdater.showsCollaboratorStatuses.getter();

  return v3 & 1;
}

- (ICSearchResultRegexMatchFinder)searchHighlightRegexFinder
{
  return (ICSearchResultRegexMatchFinder *)sub_20C02DB1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICAuthorHighlightsUpdater_searchHighlightRegexFinder);
}

- (void)setSearchHighlightRegexFinder:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_searchHighlightRegexFinder);
  swift_beginAccess();
  id v5 = *v4;
  double *v4 = a3;
  id v6 = a3;
}

- (BOOL)hasHighlights
{
  v2 = self;
  char v3 = AuthorHighlightsUpdater.hasHighlights.getter();

  return v3 & 1;
}

- (BOOL)didScheduleUpdate
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_updateTimer) != 0;
}

- (void)scheduleUpdateAnimated:(BOOL)a3
{
  char v4 = *((unsigned char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_forceNextUpdate);
  id v5 = self;
  AuthorHighlightsUpdater.scheduleUpdate(animated:force:)(a3, v4);
}

- (void)scheduleUpdateAnimated:(BOOL)a3 force:(BOOL)a4
{
  id v6 = self;
  AuthorHighlightsUpdater.scheduleUpdate(animated:force:)(a3, a4);
}

- (BOOL)updatesVisibleRangesOnly
{
  v2 = (BOOL *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_updatesVisibleRangesOnly;
  swift_beginAccess();
  return *v2;
}

- (void)setUpdatesVisibleRangesOnly:(BOOL)a3
{
  id v5 = (char *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_updatesVisibleRangesOnly;
  swift_beginAccess();
  char v6 = *v5;
  *id v5 = a3;
  id v7 = self;
  sub_20C141578(v6);
}

- (void)updateAnimated:(BOOL)a3
{
  char v4 = *((unsigned char *)&self->super.isa + OBJC_IVAR___ICAuthorHighlightsUpdater_forceNextUpdate);
  id v5 = self;
  AuthorHighlightsUpdater.update(animated:force:)(a3, v4);
}

- (void)updateAnimated:(BOOL)a3 force:(BOOL)a4
{
  char v6 = self;
  AuthorHighlightsUpdater.update(animated:force:)(a3, a4);
}

- (void)flashHighlightsForRanges:(id)a3 inTextStorage:(id)a4
{
  type metadata accessor for _NSRange(0);
  uint64_t v6 = sub_20C162CF0();
  id v7 = a4;
  v8 = self;
  AuthorHighlightsUpdater.flashHighlights(for:in:)(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)flashHighlightsForFilter:(id)a3
{
  id v4 = a3;
  id v5 = self;
  AuthorHighlightsUpdater.flashHighlights(for:)((uint64_t)v4);
}

- (void)noteShowsCollaboratorCursorsDidChange:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  v8 = self;
  sub_20C144E00();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (ICAuthorHighlightsUpdater)init
{
  result = (ICAuthorHighlightsUpdater *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSValue)focusedRangeValue
{
  v2 = (char *)self + OBJC_IVAR___ICAuthorHighlightsUpdater_focusedRange;
  swift_beginAccess();
  id v3 = 0;
  if ((v2[16] & 1) == 0) {
    id v3 = objc_msgSend(self, sel_valueWithRange_, *(void *)v2, *((void *)v2 + 1));
  }

  return (NSValue *)v3;
}

- (void)setFocusedRangeValue:(id)a3
{
  uint64_t v4 = self;
  if (a3)
  {
    id v5 = objc_msgSend(a3, sel_rangeValue);
    uint64_t v7 = v6;
  }
  else
  {
    id v5 = 0;
    uint64_t v7 = 0;
  }
  BOOL v8 = a3 == 0;
  uint64_t v9 = (char *)v4 + OBJC_IVAR___ICAuthorHighlightsUpdater_focusedRange;
  swift_beginAccess();
  *(void *)uint64_t v9 = v5;
  *((void *)v9 + 1) = v7;
  v9[16] = v8;
}

- (NSValue)highlightedRangeValue
{
  v2 = self;
  uint64_t v3 = sub_20C144278();
  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = objc_msgSend(self, sel_valueWithRange_, v3, v4);
  }

  return (NSValue *)v6;
}

@end