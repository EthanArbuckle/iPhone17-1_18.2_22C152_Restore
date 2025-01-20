@interface INSearchForMediaIntentHandler
- (_TtC17SiriAudioInternal29INSearchForMediaIntentHandler)init;
- (void)handleSearchForMedia:(id)a3 completion:(id)a4;
- (void)resolveMediaItemsForSearchForMedia:(id)a3 withCompletion:(id)a4;
@end

@implementation INSearchForMediaIntentHandler

- (void)resolveMediaItemsForSearchForMedia:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_23557F1A8(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleSearchForMedia:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  id v7 = objc_allocWithZone(MEMORY[0x263F0FE70]);
  id v8 = a3;
  v10 = self;
  id v9 = objc_msgSend(v7, sel_initWithCode_userActivity_, 4, 0);
  v6[2](v6, v9);

  _Block_release(v6);
}

- (_TtC17SiriAudioInternal29INSearchForMediaIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for INSearchForMediaIntentHandler();
  return [(INSearchForMediaIntentHandler *)&v3 init];
}

@end