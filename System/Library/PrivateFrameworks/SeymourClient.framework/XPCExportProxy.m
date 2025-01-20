@interface XPCExportProxy
- (void)receiveEvent:(int64_t)a3 data:(id)a4;
- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5;
@end

@implementation XPCExportProxy

- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  swift_retain();
  if (a4)
  {
    id v8 = a4;
    a4 = (id)sub_1D5AB1C20();
    unint64_t v10 = v9;
  }
  else
  {
    unint64_t v10 = 0xF000000000000000;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  sub_1D59569E0(a3, (uint64_t)a4, v10, (uint64_t)sub_1D5956E88, v11);
  swift_release();
  sub_1D5956DE4((uint64_t)a4, v10);
  swift_release();
}

- (void)receiveEvent:(int64_t)a3 data:(id)a4
{
  swift_retain();
  if (a4)
  {
    id v6 = a4;
    uint64_t v7 = sub_1D5AB1C20();
    unint64_t v9 = v8;

    uint64_t Strong = swift_weakLoadStrong();
    if (!Strong) {
      goto LABEL_9;
    }
    uint64_t v11 = (void *)Strong;
    if (v9 >> 60 == 15) {
      v12 = 0;
    }
    else {
      v12 = (void *)sub_1D5AB1C10();
    }
    goto LABEL_8;
  }
  uint64_t v13 = swift_weakLoadStrong();
  unint64_t v9 = 0xF000000000000000;
  if (v13)
  {
    uint64_t v11 = (void *)v13;
    uint64_t v7 = 0;
    v12 = 0;
LABEL_8:
    objc_msgSend(v11, sel_receiveEvent_data_, a3, v12);
    swift_release();

    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_9:
  sub_1D5956DE4(v7, v9);
  swift_release();
}

@end