@interface ReadingActivityServiceFactory
- (void)deleteCloudDataWithCompletion:(id)a3;
@end

@implementation ReadingActivityServiceFactory

- (void)deleteCloudDataWithCompletion:(id)a3
{
  uint64_t v4 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v10 = sub_100647718;
  }
  else
  {
    v10 = 0;
    uint64_t v9 = 0;
  }
  sub_1007F4540();
  swift_retain();
  sub_1007F4520();
  sub_1007F45C0();
  sub_1007F4560();
  uint64_t v11 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v10;
  v12[5] = v9;
  sub_10003E148((uint64_t)v10);
  sub_10004BC14((uint64_t)v6, (uint64_t)&unk_100B424C0, (uint64_t)v12);
  swift_release();
  sub_10003E138((uint64_t)v10);
  swift_release();
}

@end