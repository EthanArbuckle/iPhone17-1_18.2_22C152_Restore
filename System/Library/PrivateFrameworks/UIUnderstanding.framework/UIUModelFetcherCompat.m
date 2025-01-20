@interface UIUModelFetcherCompat
+ (id)sharedFetcher;
- (BOOL)areAssetsPresent;
- (BOOL)startAssetDownloadWithModelSet:(int64_t)a3 timeout:(double)a4;
- (UIUModelFetcherCompat)init;
@end

@implementation UIUModelFetcherCompat

- (BOOL)areAssetsPresent
{
  v2 = self;
  unsigned __int8 v3 = sub_260628AF8();

  return v3 & 1;
}

- (BOOL)startAssetDownloadWithModelSet:(int64_t)a3 timeout:(double)a4
{
  v6 = self;
  LOBYTE(a3) = sub_260628F18(a3, a4);

  return a3 & 1;
}

+ (id)sharedFetcher
{
  if (qword_26A88E078 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26A893068;
  if (qword_26A893068)
  {
    id v3 = (id)qword_26A893068;
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UIUModelFetcher()), sel_init);
    v5 = (void *)qword_26A893068;
    qword_26A893068 = (uint64_t)v4;
    id v3 = v4;

    v2 = 0;
  }
  id v6 = v2;

  return v3;
}

- (UIUModelFetcherCompat)init
{
  return (UIUModelFetcherCompat *)UIUModelFetcher.init()();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___UIUModelFetcherCompat_log;
  uint64_t v4 = sub_260655518();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end