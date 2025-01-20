@interface PPSWStringDonationConsumer
- (PPSWStringDonationConsumer)init;
- (PPSWStringDonationConsumer)initWithTopicStore:(id)a3 entityStore:(id)a4 locationStore:(id)a5 entityDissector:(id)a6 topicDissector:(id)a7;
- (PPSWStringDonationConsumer)initWithTopicStore:(id)a3 entityStore:(id)a4 locationStore:(id)a5 writebackDissector:(id)a6 entityDissector:(id)a7 topicDissector:(id)a8;
- (void)consumeWithDonation:(PPSWStringDonation *)a3 completionHandler:(id)a4;
@end

@implementation PPSWStringDonationConsumer

- (PPSWStringDonationConsumer)initWithTopicStore:(id)a3 entityStore:(id)a4 locationStore:(id)a5 entityDissector:(id)a6 topicDissector:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  return (PPSWStringDonationConsumer *)StringDonationConsumer.init(topicStore:entityStore:locationStore:entityDissector:topicDissector:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7);
}

- (PPSWStringDonationConsumer)init
{
  return (PPSWStringDonationConsumer *)StringDonationConsumer.init()();
}

- (void)consumeWithDonation:(PPSWStringDonation *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1CA9D1108((uint64_t)&unk_1EA60F858, (uint64_t)v7);
}

- (PPSWStringDonationConsumer)initWithTopicStore:(id)a3 entityStore:(id)a4 locationStore:(id)a5 writebackDissector:(id)a6 entityDissector:(id)a7 topicDissector:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  sub_1CA9D120C();
}

@end