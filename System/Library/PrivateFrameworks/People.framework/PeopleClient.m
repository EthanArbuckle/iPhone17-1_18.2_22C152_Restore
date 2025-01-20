@interface PeopleClient
- (PeopleClient)init;
- (void)canSendFamilyAskToBuyIMessageWithCompletion:(id)a3;
- (void)canSendFamilyScreenTimeRequestIMessageWithCompletion:(id)a3;
- (void)sendFamilyAskToBuyIMessageWithRequestID:(id)a3 completion:(id)a4;
@end

@implementation PeopleClient

- (void)canSendFamilyScreenTimeRequestIMessageWithCompletion:(id)a3
{
}

- (void)canSendFamilyAskToBuyIMessageWithCompletion:(id)a3
{
}

- (void)sendFamilyAskToBuyIMessageWithRequestID:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1C6DBBDE0();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  _sSo12PeopleClientC0A0E26sendFamilyAskToBuyIMessage13withRequestID10completionySS_ySb_s5Error_pSgtctF_0(v6, v8, (uint64_t)sub_1C6DAD34C, v9);

  swift_bridgeObjectRelease();
  sub_1C6DBB1D0();
}

- (PeopleClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)PeopleClient;
  return [(PeopleClient *)&v3 init];
}

@end