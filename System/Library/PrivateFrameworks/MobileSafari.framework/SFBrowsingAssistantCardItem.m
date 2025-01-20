@interface SFBrowsingAssistantCardItem
+ (id)consentCardWithNotNowHandler:(id)a3 continueHandler:(id)a4;
+ (id)entityCardWithSearchResult:(id)a3 webpageIdentifier:(id)a4 componentIdentifier:(id)a5 actionHandler:(id)a6;
+ (id)listenToPageCard;
+ (id)readerCardWithReaderContext:(id)a3 title:(id)a4 summary:(id)a5 disclaimer:(id)a6 contextMenuInteraction:(id)a7 showReaderHandler:(id)a8 listenToPageHandler:(id)a9 listenToPageActionState:(unint64_t)a10;
+ (id)readerOptionsCardWithReaderContext:(id)a3 dismissReaderHandler:(id)a4 listenToPageHandler:(id)a5 listenToPageActionState:(unint64_t)a6;
- (NSString)bodyText;
- (NSString)disclaimerText;
- (NSString)title;
- (SFBrowsingAssistantCardItem)init;
- (SFBrowsingAssistantCardItemObserving)observer;
- (SFReaderContext)readerContext;
- (UIAction)primaryAction;
- (UIAction)secondaryAction;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIView)customBodyView;
- (id)selectionHandler;
- (unint64_t)type;
- (void)notifyObserverCardDidUpdate;
- (void)setBodyText:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setCustomBodyView:(id)a3;
- (void)setDisclaimerText:(id)a3;
- (void)setObserver:(id)a3;
- (void)setPrimaryAction:(id)a3;
- (void)setReaderContext:(id)a3;
- (void)setSecondaryAction:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SFBrowsingAssistantCardItem

+ (id)consentCardWithNotNowHandler:(id)a3 continueHandler:(id)a4
{
  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  id v9 = _sSo27SFBrowsingAssistantCardItemC12MobileSafariE07consentC013notNowHandler08continueJ0AByyc_yyctFZ_0((uint64_t)sub_18C58C138, v7, (uint64_t)sub_18C58C138, v8);
  swift_release();
  swift_release();

  return v9;
}

+ (id)entityCardWithSearchResult:(id)a3 webpageIdentifier:(id)a4 componentIdentifier:(id)a5 actionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  if (a4)
  {
    uint64_t v10 = sub_18C6F9848();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  id v13 = objc_allocWithZone((Class)SFBrowsingAssistantCardItem);
  id v14 = a3;
  id v15 = a5;
  id v16 = objc_msgSend(v13, sel_init);
  objc_msgSend(v16, sel_setType_, 1);
  id v17 = sub_18C5A243C((uint64_t)v14, (uint64_t)sub_18C3789C4, v12, v10, a4, (uint64_t)v15);
  objc_msgSend(v16, sel_setCustomBodyView_, v17);

  swift_release();
  swift_bridgeObjectRelease();

  return v16;
}

+ (id)listenToPageCard
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)SFBrowsingAssistantCardItem), sel_init);
  objc_msgSend(v2, sel_setType_, 2);

  return v2;
}

+ (id)readerCardWithReaderContext:(id)a3 title:(id)a4 summary:(id)a5 disclaimer:(id)a6 contextMenuInteraction:(id)a7 showReaderHandler:(id)a8 listenToPageHandler:(id)a9 listenToPageActionState:(unint64_t)a10
{
  id v15 = _Block_copy(a8);
  id v16 = (uint64_t (*)())_Block_copy(a9);
  if (a4)
  {
    uint64_t v28 = sub_18C6F9848();
    a4 = v17;
    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v27 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v28 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v27 = sub_18C6F9848();
  a5 = v18;
  if (a6)
  {
LABEL_4:
    uint64_t v19 = sub_18C6F9848();
    v21 = v20;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v19 = 0;
  v21 = 0;
LABEL_8:
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v15;
  if (v16)
  {
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v16;
    id v16 = sub_18C58C138;
  }
  else
  {
    uint64_t v23 = 0;
  }
  swift_unknownObjectRetain();
  id v24 = a7;
  id v25 = sub_18C5A3F84((uint64_t)a3, v28, (uint64_t)a4, v27, (uint64_t)a5, v19, v21, (uint64_t)a7, (uint64_t)sub_18C58C138, v22, (uint64_t)v16, v23, a10);
  sub_18C3F33C8((uint64_t)v16);
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v25;
}

+ (id)readerOptionsCardWithReaderContext:(id)a3 dismissReaderHandler:(id)a4 listenToPageHandler:(id)a5 listenToPageActionState:(unint64_t)a6
{
  uint64_t v8 = _Block_copy(a4);
  id v9 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  if (v9)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    id v9 = sub_18C58C138;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = swift_unknownObjectRetain();
  id v13 = _sSo27SFBrowsingAssistantCardItemC12MobileSafariE013readerOptionsC00G7Context20dismissReaderHandler012listenToPageL00mnO11ActionStateABSo08SFReaderI0_p_yycyycSgSo0rc6ListennopQ0VtFZ_0(v12, (uint64_t)sub_18C448038, v10, (uint64_t)v9, v11, a6);
  sub_18C3F33C8((uint64_t)v9);
  swift_unknownObjectRelease();
  swift_release();

  return v13;
}

- (NSString)bodyText
{
  return (NSString *)sub_18C5A32B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_bodyText);
}

- (void)setBodyText:(id)a3
{
}

- (NSString)disclaimerText
{
  return (NSString *)sub_18C5A32B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_disclaimerText);
}

- (void)setDisclaimerText:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)sub_18C5A2D78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_contextMenuInteraction);
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (UIView)customBodyView
{
  return (UIView *)sub_18C5A2D78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_customBodyView);
}

- (void)setCustomBodyView:(id)a3
{
}

- (UIAction)primaryAction
{
  return (UIAction *)sub_18C5A2D78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_primaryAction);
}

- (void)setPrimaryAction:(id)a3
{
}

- (SFReaderContext)readerContext
{
  swift_beginAccess();
  id v2 = (void *)swift_unknownObjectRetain();

  return (SFReaderContext *)v2;
}

- (void)setReaderContext:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantCardItem_readerContext);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (UIAction)secondaryAction
{
  return (UIAction *)sub_18C5A2D78((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_secondaryAction);
}

- (void)setSecondaryAction:(id)a3
{
}

- (id)selectionHandler
{
  id v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantCardItem_selectionHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18C3789DC;
    aBlock[3] = &block_descriptor_20;
    v4 = _Block_copy(aBlock);
    sub_18C6F7B98();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSelectionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_18C3789D8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_selectionHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18C3F33C8(v7);
}

- (NSString)title
{
  return (NSString *)sub_18C5A32B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistantCardItem_title);
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)type
{
  id v2 = (unint64_t *)((char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_type);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (SFBrowsingAssistantCardItemObserving)observer
{
  id v2 = (char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_observer;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x192F967B0](v2);

  return (SFBrowsingAssistantCardItemObserving *)v3;
}

- (void)setObserver:(id)a3
{
}

- (void)notifyObserverCardDidUpdate
{
  uint64_t v3 = self;
  id v2 = [(SFBrowsingAssistantCardItem *)v3 observer];
  if (v2)
  {
    [(SFBrowsingAssistantCardItemObserving *)v2 cardItemDidUpdate:v3];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (SFBrowsingAssistantCardItem)init
{
  return (SFBrowsingAssistantCardItem *)SFBrowsingAssistantCardItem.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  sub_18C3F33C8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantCardItem_selectionHandler));
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___SFBrowsingAssistantCardItem_observer;

  sub_18C57B508((uint64_t)v3);
}

@end