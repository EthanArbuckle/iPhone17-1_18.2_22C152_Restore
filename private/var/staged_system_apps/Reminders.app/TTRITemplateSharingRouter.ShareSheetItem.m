@interface TTRITemplateSharingRouter.ShareSheetItem
- (_TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation TTRITemplateSharingRouter.ShareSheetItem

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  double v5 = __chkstk_darwin(v4);
  (*(void (**)(char *, char *, uint64_t, double))(v7 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self+ OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_url, v4, v5);
  v8 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v5 = type metadata accessor for URL();
  double v6 = __chkstk_darwin(v5);
  (*(void (**)(char *, char *, uint64_t, double))(v8 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self+ OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_url, v5, v6);
  v9 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v9;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_linkMetadata));
}

- (_TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem)init
{
  result = (_TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_url;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_linkMetadata);
}

@end