@interface ATRawAssortmentServiceHandler
- (_TtC12textcontextd29ATRawAssortmentServiceHandler)init;
- (void)spotlightEmailAttributes:(int64_t)a3 completionHandler:(id)a4;
- (void)spotlightItemTitles:(int64_t)a3 completionHandler:(id)a4;
- (void)textOnScreenAX:(id)a3;
@end

@implementation ATRawAssortmentServiceHandler

- (void)spotlightItemTitles:(int64_t)a3 completionHandler:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1000073A0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  _s12textcontextd29ATRawAssortmentServiceHandlerC19spotlightItemTitles_010completionE0ySi_ySSSgcSgtF_0(a3, (uint64_t)v6, v7);
  sub_100007150((uint64_t)v6);
}

- (void)spotlightEmailAttributes:(int64_t)a3 completionHandler:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1000073A0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  _s12textcontextd29ATRawAssortmentServiceHandlerC24spotlightEmailAttributes_010completionE0ySi_ySSSgcSgtF_0(a3, (uint64_t)v6, v7);
  sub_100007150((uint64_t)v6);
}

- (void)textOnScreenAX:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100007198;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  _s12textcontextd29ATRawAssortmentServiceHandlerC4text10onScreenAXyySSSgcSg_tF_0((uint64_t)v4, v5);
  sub_100007150((uint64_t)v4);
}

- (_TtC12textcontextd29ATRawAssortmentServiceHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ATRawAssortmentServiceHandler();
  return [(ATRawAssortmentServiceHandler *)&v3 init];
}

@end