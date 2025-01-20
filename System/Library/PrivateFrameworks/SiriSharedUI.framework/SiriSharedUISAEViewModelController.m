@interface SiriSharedUISAEViewModelController
- (AFConversation)previousConversation;
- (BOOL)alwaysShowRecognizedSpeech;
- (SiriSharedUISAEViewModelChangeObserving)viewModelChangeObserver;
- (SiriSharedUISAEViewModelController)init;
- (SiriSharedUISAEViewModelController)initWithConversation:(id)a3 delegate:(id)a4;
- (SiriSharedUISAEViewModelControllerDelegate)delegate;
- (id)serverUtterancesToDisplayForConversation:(id)a3;
- (id)userUtteranceForConversationItem:(id)a3;
- (int64_t)inputType;
- (unint64_t)_generateDiffFromViewModel:(id)a3 toViewModel:(id)a4;
- (void)_notifyObserverOfViewModelChangeWithDiff:(unint64_t)a3;
- (void)_processInitialConversationItemsForConversation:(id)a3;
- (void)_processInsertedConversationItemsForConversationItems:(id)a3 forConversation:(id)a4;
- (void)_processUpdatedConversationItemsAtIndexPaths:(id)a3;
- (void)clearLatencySummary;
- (void)clearLatencySummaryWithoutViewUpdate;
- (void)conversationDidChangeWithTransaction:(id)a3;
- (void)didReceiveLatencyInformation:(id)a3;
- (void)inputTypeDidChange;
- (void)resetViewsAndClearASR:(BOOL)a3;
- (void)revealLatencyView;
- (void)revealUserUtterance:(id)a3 backingAceObject:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPreviousConversation:(id)a3;
- (void)setViewModelChangeObserver:(id)a3;
- (void)updateCurrentRequestText:(id)a3;
@end

@implementation SiriSharedUISAEViewModelController

- (SiriSharedUISAEViewModelControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x210553300]((char *)self + OBJC_IVAR___SiriSharedUISAEViewModelController_delegate, a2);
  return (SiriSharedUISAEViewModelControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (SiriSharedUISAEViewModelController)initWithConversation:(id)a3 delegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  return (SiriSharedUISAEViewModelController *)sub_20CA401F4(v4);
}

- (AFConversation)previousConversation
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModelController_previousConversation);
  swift_beginAccess();
  return (AFConversation *)*v2;
}

- (void)setPreviousConversation:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_20CA48BA8(a3);
}

- (SiriSharedUISAEViewModelChangeObserving)viewModelChangeObserver
{
  v2 = (char *)self + OBJC_IVAR___SiriSharedUISAEViewModelController_viewModelChangeObserver;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x210553300](v2);
  return (SiriSharedUISAEViewModelChangeObserving *)v3;
}

- (void)setViewModelChangeObserver:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  id v4 = objc_allocWithZone((Class)SiriSharedUISAEViewModel);
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = objc_msgSend(v4, sel_init);
  [(SiriSharedUISAEViewModelController *)v5 _notifyObserverOfViewModelChangeWithDiff:[(SiriSharedUISAEViewModelController *)v5 _generateDiffFromViewModel:v6 toViewModel:*(Class *)((char *)&v5->super.isa + OBJC_IVAR___SiriSharedUISAEViewModelController_viewModel)]];

  swift_unknownObjectRelease();
}

- (void)_notifyObserverOfViewModelChangeWithDiff:(unint64_t)a3
{
  if (a3)
  {
    v5 = self;
    id v4 = [(SiriSharedUISAEViewModelController *)v5 viewModelChangeObserver];
    if (v4)
    {
      [(SiriSharedUISAEViewModelChangeObserving *)v4 saeViewModelDidChange:*(Class *)((char *)&v5->super.isa + OBJC_IVAR___SiriSharedUISAEViewModelController_viewModel) withDiff:a3];

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

- (unint64_t)_generateDiffFromViewModel:(id)a3 toViewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unint64_t v9 = sub_20CA48F84(v6, v7);

  return v9;
}

- (void)_processInitialConversationItemsForConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA4087C(v4);
}

- (void)conversationDidChangeWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA40CE4(v4);
}

- (void)_processUpdatedConversationItemsAtIndexPaths:(id)a3
{
  sub_20CA81DE8();
  uint64_t v4 = sub_20CA82FB8();
  v5 = self;
  sub_20CA4222C(v4);

  swift_bridgeObjectRelease();
}

- (void)_processInsertedConversationItemsForConversationItems:(id)a3 forConversation:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676ECBF0);
  unint64_t v6 = sub_20CA82FB8();
  id v7 = a4;
  v8 = self;
  sub_20CA43888(v6, v7);

  swift_bridgeObjectRelease();
}

- (id)userUtteranceForConversationItem:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = sub_20CA49968(a3);
  swift_unknownObjectRelease();

  return v6;
}

- (id)serverUtterancesToDisplayForConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA456BC(v4);

  sub_20CA20160(0, (unint64_t *)&unk_2676ECB70);
  id v6 = (void *)sub_20CA82FA8();
  swift_bridgeObjectRelease();
  return v6;
}

- (int64_t)inputType
{
  v2 = self;
  v3 = [(SiriSharedUISAEViewModelController *)v2 delegate];
  if (v3)
  {
    id v4 = [(SiriSharedUISAEViewModelControllerDelegate *)v3 inputTypeForSAEViewModelController:v2];

    swift_unknownObjectRelease();
    return (int64_t)v4;
  }
  else
  {

    return 0;
  }
}

- (void)inputTypeDidChange
{
  v2 = self;
  sub_20CA46684();
}

- (void)revealUserUtterance:(id)a3 backingAceObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_20CA46790((uint64_t)v6, (uint64_t)a4);
}

- (void)resetViewsAndClearASR:(BOOL)a3
{
  id v4 = self;
  sub_20CA468E0(a3);
}

- (void)revealLatencyView
{
  v2 = self;
  sub_20CA46AE4();
}

- (void)clearLatencySummary
{
  v2 = self;
  sub_20CA46CFC();
}

- (void)clearLatencySummaryWithoutViewUpdate
{
  uint64_t v3 = OBJC_IVAR___SiriSharedUISAEViewModelController_viewModel;
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModelController_viewModel);
  v5 = self;
  id v6 = objc_msgSend(v4, sel_userUtterance);
  objc_msgSend(v6, sel_setLatencySummary_, 0);

  id v7 = objc_msgSend(*(id *)((char *)&self->super.isa + v3), sel_userUtterance);
  objc_msgSend(v7, sel_setShouldShow_, 0);
}

- (void)didReceiveLatencyInformation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA46F7C(v4);
}

- (void)updateCurrentRequestText:(id)a3
{
  sub_20CA82F08();
  id v4 = self;
  sub_20CA471F0();

  swift_bridgeObjectRelease();
}

- (BOOL)alwaysShowRecognizedSpeech
{
  v2 = self;
  uint64_t v3 = [(SiriSharedUISAEViewModelController *)v2 delegate];
  if (v3)
  {
    unsigned __int8 v4 = [(SiriSharedUISAEViewModelControllerDelegate *)v3 saeViewModelControllerShouldAlwaysShowRecognizedSpeech:v2];

    swift_unknownObjectRelease();
    return v4;
  }
  else
  {

    return 1;
  }
}

- (SiriSharedUISAEViewModelController)init
{
  result = (SiriSharedUISAEViewModelController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20CA202D4((uint64_t)self + OBJC_IVAR___SiriSharedUISAEViewModelController_delegate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_20CA202D4((uint64_t)self + OBJC_IVAR___SiriSharedUISAEViewModelController_viewModelChangeObserver);
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriSharedUISAEViewModelController_viewModel);
}

@end