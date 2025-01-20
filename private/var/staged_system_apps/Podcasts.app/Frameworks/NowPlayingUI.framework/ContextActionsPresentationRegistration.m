@interface ContextActionsPresentationRegistration
- (_TtC12NowPlayingUI38ContextActionsPresentationRegistration)init;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(void *)a3 previewForHighlightingMenuWithConfiguration:(void *)a4;
- (void)appWillResignActive;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
@end

@implementation ContextActionsPresentationRegistration

- (void)appWillResignActive
{
  if ((*((unsigned char *)&self->super.isa
        + OBJC_IVAR____TtC12NowPlayingUI38ContextActionsPresentationRegistration_showingRealPreview) & 1) == 0)
  {
    v2 = *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI38ContextActionsPresentationRegistration_interaction);
    if (v2) {
      [v2 dismissMenu];
    }
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = _s12NowPlayingUI38ContextActionsPresentationRegistrationC22contextMenuInteraction_016configurationForI10AtLocationSo09UIContextI13ConfigurationCSgSo0oiJ0C_So7CGPointVtF_0();

  return v7;
}

- (id)contextMenuInteraction:(void *)a3 previewForHighlightingMenuWithConfiguration:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  id v9 = _s12NowPlayingUI38ContextActionsPresentationRegistrationC22contextMenuInteraction_020previewForDismissingI17WithConfigurationSo17UITargetedPreviewCSgSo09UIContextiJ0C_So0riO0CtF_0();

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_7D2FC(a5);

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_7D408(v8, a5);

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_7D620(v8, a5);

  swift_unknownObjectRelease();
}

- (_TtC12NowPlayingUI38ContextActionsPresentationRegistration)init
{
  result = (_TtC12NowPlayingUI38ContextActionsPresentationRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI38ContextActionsPresentationRegistration_interaction));
  swift_release();

  swift_unknownObjectWeakDestroy();
}

@end