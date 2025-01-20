@interface SynapseLinkView
- (BOOL)_wantsContextMenuPreviewForLinkView:(id)a3;
- (_TtC8PaperKit15SynapseLinkView)init;
- (_TtC8PaperKit15SynapseLinkView)initWithCoder:(id)a3;
- (id)_contextMenuActionsForLinkView:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)linkViewNeedsResize:(id)a3;
@end

@implementation SynapseLinkView

- (_TtC8PaperKit15SynapseLinkView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SynapseLinkView.init(coder:)();
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SynapseLinkView();
  v2 = (char *)v4.receiver;
  [(SynapseLinkView *)&v4 didMoveToWindow];
  id v3 = objc_msgSend(v2, sel_window, v4.receiver, v4.super_class);

  if (v3) {
    objc_msgSend(*(id *)(*(void *)&v2[OBJC_IVAR____TtC8PaperKit15SynapseLinkView_synapseLink]+ OBJC_IVAR____TtC8PaperKit15SynapseLinkItem_synapseItem), sel_loadFullPreviewIfNeeded);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  SynapseLinkView.layoutSubviews()();
}

- (id)_contextMenuActionsForLinkView:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit8LinkView_delegate;
  if (MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit8LinkView_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(uint64_t (**)(void))(v6 + 8);
    id v8 = a3;
    v9 = self;
    uint64_t v10 = v7();
    swift_unknownObjectRelease();
    if (v10)
    {

      goto LABEL_6;
    }
  }
  else
  {
    id v11 = a3;
    v12 = self;
  }

  swift_bridgeObjectRelease();
LABEL_6:
  type metadata accessor for UIAction();
  v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v13.super.isa;
}

- (BOOL)_wantsContextMenuPreviewForLinkView:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = specialized SynapseLinkView._wantsContextMenuPreview(for:)();

  return self & 1;
}

- (void)linkViewNeedsResize:(id)a3
{
  id v4 = (LPLinkView *)a3;
  v5 = self;
  SynapseLinkView.linkViewNeedsResize(_:)(v4);
}

- (_TtC8PaperKit15SynapseLinkView)init
{
  result = (_TtC8PaperKit15SynapseLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit15SynapseLinkView____lazy_storage___linkPresentationView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit15SynapseLinkView_synapseLink));
  swift_unknownObjectWeakDestroy();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = self;
  id v9 = SynapseLinkView.linkPresentationView.getter();
  id v10 = objc_msgSend(v9, sel__contextMenuInteractionDelegate);

  if (v10)
  {
    id v11 = objc_msgSend(v10, sel_contextMenuInteraction_configurationForMenuAtLocation_, v7, x, y);

    swift_unknownObjectRelease();
  }
  else
  {

    id v11 = 0;
  }
  return v11;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v12 = a4;
  id v9 = self;
  swift_unknownObjectRetain();
  id v10 = SynapseLinkView.linkPresentationView.getter();
  id v11 = objc_msgSend(v10, sel__contextMenuInteractionDelegate);

  if (v11)
  {
    if (objc_msgSend(v11, sel_respondsToSelector_, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_))objc_msgSend(v11, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v8, v12, a5); {
    swift_unknownObjectRelease();
    }

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

@end