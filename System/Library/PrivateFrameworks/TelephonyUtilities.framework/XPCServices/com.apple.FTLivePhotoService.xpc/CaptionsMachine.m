@interface CaptionsMachine
- (NSString)description;
- (_TtC18FTLivePhotoService15CaptionsMachine)init;
- (void)captionsClient:(id)a3 didDetectGibberish:(BOOL)a4;
- (void)captionsClient:(id)a3 didDisableCaptions:(BOOL)a4 error:(id)a5;
- (void)captionsClient:(id)a3 didEnableCaptions:(BOOL)a4 error:(id)a5;
- (void)captionsClient:(id)a3 didStartCaptioningWithReason:(unsigned __int8)a4;
- (void)captionsClient:(id)a3 didStopCaptioningWithReason:(unsigned __int8)a4;
- (void)captionsClient:(id)a3 didUpdateCaptions:(id)a4 source:(int)a5;
- (void)captionsServerDidDie:(id)a3;
@end

@implementation CaptionsMachine

- (_TtC18FTLivePhotoService15CaptionsMachine)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18FTLivePhotoService15CaptionsMachine_captionsWriter;

  sub_10000D5B8((uint64_t)v3);
}

- (void)captionsClient:(id)a3 didEnableCaptions:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  v8 = self;
  id v9 = a5;
  sub_1000123C0();
}

- (void)captionsClient:(id)a3 didDisableCaptions:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  v8 = self;
  id v9 = a5;
  sub_1000123C0();
}

- (void)captionsClient:(id)a3 didStartCaptioningWithReason:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  sub_100012A78();
}

- (void)captionsClient:(id)a3 didStopCaptioningWithReason:(unsigned __int8)a4
{
  id v5 = a3;
  v6 = self;
  sub_100012A78();
}

- (void)captionsClient:(id)a3 didDetectGibberish:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_100012FC8();
}

- (void)captionsClient:(id)a3 didUpdateCaptions:(id)a4 source:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1000133E8();
}

- (void)captionsServerDidDie:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100013E5C();
}

- (NSString)description
{
  v2 = self;
  sub_100014174();

  NSString v3 = sub_10003CFB0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end