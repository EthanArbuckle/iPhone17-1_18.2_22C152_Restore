@interface HVConsumerCoordinatorGuardedData
- (HVConsumerCoordinatorGuardedData)init;
@end

@implementation HVConsumerCoordinatorGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsConsumers, 0);
  objc_storeStrong((id *)&self->_userActivityConsumers, 0);
  objc_storeStrong((id *)&self->_interactionConsumers, 0);
  objc_storeStrong((id *)&self->_thirdPartyAppConsumers, 0);
  objc_storeStrong((id *)&self->_siriConsumers, 0);
  objc_storeStrong((id *)&self->_safariConsumers, 0);
  objc_storeStrong((id *)&self->_remindersConsumers, 0);
  objc_storeStrong((id *)&self->_photosConsumers, 0);
  objc_storeStrong((id *)&self->_parsecConsumers, 0);
  objc_storeStrong((id *)&self->_notesConsumers, 0);
  objc_storeStrong((id *)&self->_newsConsumers, 0);
  objc_storeStrong((id *)&self->_messagesConsumers, 0);
  objc_storeStrong((id *)&self->_mailConsumers, 0);

  objc_storeStrong((id *)&self->_budget, 0);
}

- (HVConsumerCoordinatorGuardedData)init
{
  v6.receiver = self;
  v6.super_class = (Class)HVConsumerCoordinatorGuardedData;
  v2 = [(HVConsumerCoordinatorGuardedData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    budget = v2->_budget;
    v2->_budget = (HVBudget *)v3;
  }
  return v2;
}

@end