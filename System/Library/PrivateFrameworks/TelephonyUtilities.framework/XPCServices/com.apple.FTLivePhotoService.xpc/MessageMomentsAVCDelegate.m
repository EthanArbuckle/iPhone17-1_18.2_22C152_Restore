@interface MessageMomentsAVCDelegate
- (_TtC18FTLivePhotoService25MessageMomentsAVCDelegate)init;
- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4;
- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5;
- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5;
- (void)momentsServerDidDisconnect:(id)a3;
@end

@implementation MessageMomentsAVCDelegate

- (void)moments:(id)a3 didFinishRequest:(id)a4 error:(id)a5
{
}

- (void)moments:(id)a3 didStartProcessingRequest:(id)a4 error:(id)a5
{
}

- (void)moments:(id)a3 capabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = self;
  sub_1000109C8((uint64_t)v6, v4);
}

- (void)momentsServerDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100010D44((uint64_t)v4);
}

- (_TtC18FTLivePhotoService25MessageMomentsAVCDelegate)init
{
  return (_TtC18FTLivePhotoService25MessageMomentsAVCDelegate *)sub_100010E3C();
}

- (void).cxx_destruct
{
}

@end