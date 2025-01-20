@interface JSAStoreContentLookupRequest
- (JSAStoreContentLookupRequest)init;
- (JSValue)onResponse;
- (NSArray)itemIdentifiers;
- (NSDictionary)requestOptions;
- (float)priority;
- (void)cancel;
- (void)dealloc;
- (void)send;
- (void)setItemIdentifiers:(id)a3;
- (void)setOnResponse:(id)a3;
- (void)setPriority:(float)a3;
- (void)setRequestOptions:(id)a3;
@end

@implementation JSAStoreContentLookupRequest

- (float)priority
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__priority);
}

- (void)setPriority:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__priority) = a3;
}

- (NSDictionary)requestOptions
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__requestOptions))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = sub_867F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSDictionary *)v2.super.isa;
}

- (void)setRequestOptions:(id)a3
{
  if (a3) {
    v4 = (objc_class *)sub_86800();
  }
  else {
    v4 = 0;
  }
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest_frozen) & 1) == 0) {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__requestOptions) = v4;
  }

  swift_bridgeObjectRelease();
}

- (NSArray)itemIdentifiers
{
  swift_beginAccess();
  v3 = self;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_68C28(v4);

  swift_bridgeObjectRelease();
  v5.super.isa = sub_86A10().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (void)setItemIdentifiers:(id)a3
{
  if (a3) {
    unint64_t v4 = sub_86A30();
  }
  else {
    unint64_t v4 = 0;
  }
  NSArray v5 = self;
  sub_69278(v4);
}

- (JSValue)onResponse
{
  return (JSValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse));
}

- (void)setOnResponse:(id)a3
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest_frozen) & 1) == 0)
  {
    id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse);
    *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse) = (Class)a3;
    id v3 = a3;
  }
}

- (JSAStoreContentLookupRequest)init
{
  return (JSAStoreContentLookupRequest *)StoreContentLookupRequest.init()();
}

- (void)dealloc
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest_frozen) == 1)
  {
    id v3 = self;
  }
  else
  {
    id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse);
    *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse) = 0;
    NSArray v5 = self;
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StoreContentLookupRequest();
  [(JSAStoreContentLookupRequest *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest_lookupPromise);
}

- (void)send
{
  NSDictionary v2 = self;
  sub_69CE8();
}

- (void)cancel
{
  NSDictionary v2 = self;
  sub_6AAA8();
}

@end