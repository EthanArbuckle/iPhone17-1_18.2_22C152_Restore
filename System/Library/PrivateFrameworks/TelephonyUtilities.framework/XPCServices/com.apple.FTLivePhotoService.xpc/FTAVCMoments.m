@interface FTAVCMoments
- (FTAVCMomentsDelegate)delegate;
- (_TtC18FTLivePhotoService12FTAVCMoments)init;
- (_TtC18FTLivePhotoService12FTAVCMoments)initWithStreamToken:(int64_t)a3 requesterID:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6;
- (id)newRequestWithMediaType:(unsigned __int8)a3 mode:(unsigned __int8)a4 requesteeID:(id)a5;
- (int)activeRequestCount;
- (int)pendingRequestCount;
- (int64_t)streamToken;
- (unsigned)capabilities;
- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4;
- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7;
- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 url:(id)a5 error:(id)a6;
- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5;
- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5;
- (void)momentsServerDidDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FTAVCMoments

- (FTAVCMomentsDelegate)delegate
{
  v2 = (void *)sub_10003718C();

  return (FTAVCMomentsDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000371F8(a3);
}

- (_TtC18FTLivePhotoService12FTAVCMoments)initWithStreamToken:(int64_t)a3 requesterID:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6
{
  if (a4)
  {
    uint64_t v9 = sub_10003CFC0();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  id v12 = a5;
  id v13 = a6;
  return (_TtC18FTLivePhotoService12FTAVCMoments *)sub_100037240(a3, v9, v11, v12, a6);
}

- (int64_t)streamToken
{
  v2 = self;
  id v3 = sub_100037410();

  return (int64_t)v3;
}

- (unsigned)capabilities
{
  v2 = self;
  unsigned int v3 = sub_1000374E4((SEL *)&selRef_capabilities);

  return v3;
}

- (int)activeRequestCount
{
  v2 = self;
  int v3 = sub_1000374E4((SEL *)&selRef_activeRequestCount);

  return v3;
}

- (int)pendingRequestCount
{
  v2 = self;
  int v3 = sub_1000374E4((SEL *)&selRef_pendingRequestCount);

  return v3;
}

- (id)newRequestWithMediaType:(unsigned __int8)a3 mode:(unsigned __int8)a4 requesteeID:(id)a5
{
  v6 = (void *)a3;
  if (a5)
  {
    uint64_t v8 = sub_10003CFC0();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v11 = self;
  id v12 = sub_100037504(v6, a4, v8, v10);

  swift_bridgeObjectRelease();
  return v12;
}

- (_TtC18FTLivePhotoService12FTAVCMoments)init
{
}

- (void).cxx_destruct
{
  int v3 = (char *)self + OBJC_IVAR____TtC18FTLivePhotoService12FTAVCMoments_delegate;

  sub_100010FB0((uint64_t)v3);
}

- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = self;
  sub_1000376DC((uint64_t)v7, v4);
}

- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5
{
}

- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5
{
}

- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 url:(id)a5 error:(id)a6
{
  uint64_t v7 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_10003CD00();
    uint64_t v10 = sub_10003CD40();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_10003CD40();
    uint64_t v11 = 1;
  }
  sub_10000FA0C((uint64_t)v9, v11, 1, v10);
  sub_10000E444((uint64_t)v9);
}

- (void)moments:(id)a3 didEndProcessingRequest:(id)a4 stillImageURL:(id)a5 movieURL:(id)a6 error:(id)a7
{
  uint64_t v13 = sub_10000CCE8((uint64_t *)&unk_100059C70);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v27 - v17;
  if (a5)
  {
    sub_10003CD00();
    uint64_t v19 = sub_10003CD40();
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v19 = sub_10003CD40();
    uint64_t v20 = 1;
  }
  uint64_t v21 = 1;
  sub_10000FA0C((uint64_t)v18, v20, 1, v19);
  if (a6)
  {
    sub_10003CD00();
    uint64_t v21 = 0;
  }
  uint64_t v22 = sub_10003CD40();
  sub_10000FA0C((uint64_t)v16, v21, 1, v22);
  id v23 = a3;
  id v24 = a4;
  id v25 = a7;
  v26 = self;
  sub_1000379C4((uint64_t)v26, (uint64_t)v24, (uint64_t)v18, (uint64_t)v16, a7);

  sub_10000E444((uint64_t)v16);
  sub_10000E444((uint64_t)v18);
}

- (void)momentsServerDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100037D34();
}

@end