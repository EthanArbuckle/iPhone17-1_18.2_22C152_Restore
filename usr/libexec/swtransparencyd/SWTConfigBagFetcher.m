@interface SWTConfigBagFetcher
- (void)fetchConfigBag:(NSURLRequest *)a3 completionHandler:(id)a4;
- (void)triggerConfigBagFetch:(double)a3;
@end

@implementation SWTConfigBagFetcher

- (void)fetchConfigBag:(NSURLRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100020378(&qword_100157030);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100157A30;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100157A40;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_10003E698((uint64_t)v9, (uint64_t)&unk_100157A50, (uint64_t)v14);
  swift_release();
}

- (void)triggerConfigBagFetch:(double)a3
{
  swift_retain();
  sub_10003DF54(a3);

  swift_release();
}

@end