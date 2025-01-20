@interface APTapAction
+ (id)makeTapActionWithLegacyAction:(id)a3 iTunesMetadata:(id)a4 error:(id *)a5;
@end

@implementation APTapAction

+ (id)makeTapActionWithLegacyAction:(id)a3 iTunesMetadata:(id)a4 error:(id *)a5
{
  if (a4)
  {
    sub_10010C99C();
    uint64_t v6 = sub_10019B2B0();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  id v8 = sub_10010C564(v7, v6);

  swift_bridgeObjectRelease();

  return v8;
}

@end