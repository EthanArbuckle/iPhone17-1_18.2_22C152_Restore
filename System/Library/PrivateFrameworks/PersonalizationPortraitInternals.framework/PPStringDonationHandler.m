@interface PPStringDonationHandler
- (PPStringDonationHandler)init;
- (PPStringDonationHandler)initWithTopicStore:(id)a3 entityStore:(id)a4 topicDissector:(id)a5 entityDissector:(id)a6;
- (void)donateLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6 completion:(id)a7;
@end

@implementation PPStringDonationHandler

- (void).cxx_destruct
{
}

- (void)donateLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[PPSWStringDonation alloc] initWithLabeledStrings:v16 bundleId:v15 groupId:v14 documentId:v13];

  consumer = self->_consumer;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__PPStringDonationHandler_donateLabeledStrings_bundleId_groupId_documentId_completion___block_invoke;
  v20[3] = &unk_1E65D8B20;
  id v21 = v12;
  id v19 = v12;
  [(PPSWStringDonationConsumer *)consumer consumeWithDonation:v17 completionHandler:v20];
}

uint64_t __87__PPStringDonationHandler_donateLabeledStrings_bundleId_groupId_documentId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PPStringDonationHandler)initWithTopicStore:(id)a3 entityStore:(id)a4 topicDissector:(id)a5 entityDissector:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PPStringDonationHandler;
  id v14 = [(PPStringDonationHandler *)&v18 init];
  if (v14)
  {
    id v15 = [[PPSWStringDonationConsumer alloc] initWithTopicStore:v10 entityStore:v11 locationStore:0 entityDissector:v13 topicDissector:v12];
    consumer = v14->_consumer;
    v14->_consumer = v15;
  }
  return v14;
}

- (PPStringDonationHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPStringDonationHandler;
  v2 = [(PPStringDonationHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    consumer = v2->_consumer;
    v2->_consumer = (PPSWStringDonationConsumer *)v3;
  }
  return v2;
}

@end