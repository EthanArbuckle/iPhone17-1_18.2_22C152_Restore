@interface WBSMultiRoundAutoFillManager
- (BOOL)shouldAttemptFollowUpAutoFillInFormWithMetadata:(id)a3 requestType:(unint64_t)a4;
- (BOOL)shouldControlBeIgnoredByFollowUpAutoFill:(id)a3;
- (NSSet)addressBookPropertiesThatCanBeFilled;
- (NSString)addressSetLabelUsedDuringFirstAutoFillPass;
- (WBSMultiRoundAutoFillManager)init;
- (unint64_t)currentAutoFillAttemptTrigger;
- (void)addControlUniqueIDIgnoredByFollowUpAutoFill:(id)a3;
- (void)addControlUniqueIDsIgnoredByFollowUpAutoFill:(id)a3;
- (void)dealloc;
- (void)didEditFormText;
- (void)dispatchFollowUpAutoFillOfFormWithMetdata:(id)a3 autoFillBlock:(id)a4;
- (void)setAddressBookPropertiesThatCanBeFilled:(id)a3;
- (void)setAddressSetLabelUsedDuringFirstAutoFillPass:(id)a3;
@end

@implementation WBSMultiRoundAutoFillManager

- (void)dispatchFollowUpAutoFillOfFormWithMetdata:(id)a3 autoFillBlock:(id)a4
{
  v6 = (WBSFormMetadata *)a3;
  id v7 = a4;
  ++self->_numberOfFollowUpAutoFillAttempts;
  formMetadataFromPreviousAutoFillAttempt = self->_formMetadataFromPreviousAutoFillAttempt;
  self->_autoFillAttemptTrigger = 1;
  self->_formMetadataFromPreviousAutoFillAttempt = v6;
  v9 = v6;

  v10 = (void *)MEMORY[0x1E4F1CB00];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__WBSMultiRoundAutoFillManager_dispatchFollowUpAutoFillOfFormWithMetdata_autoFillBlock___block_invoke;
  v14[3] = &unk_1E5C9DD50;
  id v15 = v7;
  id v11 = v7;
  v12 = [v10 scheduledTimerWithTimeInterval:0 repeats:v14 block:0.25];
  timerForFollowUpAutoFill = self->_timerForFollowUpAutoFill;
  self->_timerForFollowUpAutoFill = v12;
}

uint64_t __88__WBSMultiRoundAutoFillManager_dispatchFollowUpAutoFillOfFormWithMetdata_autoFillBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didEditFormText
{
  self->_userDidInteractWithForm = 1;
}

- (void)dealloc
{
  [(NSTimer *)self->_timerForFollowUpAutoFill invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSMultiRoundAutoFillManager;
  [(WBSMultiRoundAutoFillManager *)&v3 dealloc];
}

- (WBSMultiRoundAutoFillManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSMultiRoundAutoFillManager;
  v2 = [(WBSMultiRoundAutoFillManager *)&v9 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_autoFillAttemptTrigger = 0;
    v2->_userDidInteractWithForm = 0;
    timerForFollowUpAutoFill = v2->_timerForFollowUpAutoFill;
    v2->_numberOfFollowUpAutoFillAttempts = 0;
    v2->_timerForFollowUpAutoFill = 0;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    controlUniqueIDToBeIgnoredByFollowUpAutoFill = v3->_controlUniqueIDToBeIgnoredByFollowUpAutoFill;
    v3->_controlUniqueIDToBeIgnoredByFollowUpAutoFill = v5;

    id v7 = v3;
  }

  return v3;
}

- (BOOL)shouldAttemptFollowUpAutoFillInFormWithMetadata:(id)a3 requestType:(unint64_t)a4
{
  id v6 = a3;
  LOBYTE(v7) = 0;
  if (!a4 && !self->_userDidInteractWithForm)
  {
    if (self->_numberOfFollowUpAutoFillAttempts <= 4) {
      BOOL v7 = ![(WBSFormMetadata *)self->_formMetadataFromPreviousAutoFillAttempt isEqual:v6];
    }
    else {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (unint64_t)currentAutoFillAttemptTrigger
{
  return self->_autoFillAttemptTrigger;
}

- (void)addControlUniqueIDIgnoredByFollowUpAutoFill:(id)a3
{
}

- (void)addControlUniqueIDsIgnoredByFollowUpAutoFill:(id)a3
{
}

- (BOOL)shouldControlBeIgnoredByFollowUpAutoFill:(id)a3
{
  return [(NSMutableSet *)self->_controlUniqueIDToBeIgnoredByFollowUpAutoFill containsObject:a3];
}

- (void)setAddressBookPropertiesThatCanBeFilled:(id)a3
{
  v4 = [MEMORY[0x1E4F1CAD0] setWithSet:a3];
  addressBookPropertiesThatCanBeFilled = self->_addressBookPropertiesThatCanBeFilled;
  self->_addressBookPropertiesThatCanBeFilled = v4;
}

- (NSString)addressSetLabelUsedDuringFirstAutoFillPass
{
  return self->_addressSetLabelUsedDuringFirstAutoFillPass;
}

- (void)setAddressSetLabelUsedDuringFirstAutoFillPass:(id)a3
{
}

- (NSSet)addressBookPropertiesThatCanBeFilled
{
  return self->_addressBookPropertiesThatCanBeFilled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressBookPropertiesThatCanBeFilled, 0);
  objc_storeStrong((id *)&self->_addressSetLabelUsedDuringFirstAutoFillPass, 0);
  objc_storeStrong((id *)&self->_controlUniqueIDToBeIgnoredByFollowUpAutoFill, 0);
  objc_storeStrong((id *)&self->_timerForFollowUpAutoFill, 0);
  objc_storeStrong((id *)&self->_formMetadataFromPreviousAutoFillAttempt, 0);
}

@end