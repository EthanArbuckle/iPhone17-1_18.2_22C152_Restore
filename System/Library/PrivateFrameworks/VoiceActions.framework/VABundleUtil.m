@interface VABundleUtil
+ (id)bundePathFallbackWithResource:(id)a3 type:(id)a4;
+ (id)bundlePathFallbackWithPath:(id)a3 error:(id *)a4;
- (VABundleUtil)init;
@end

@implementation VABundleUtil

+ (id)bundePathFallbackWithResource:(id)a3 type:(id)a4
{
  sub_2614D53A8();
  sub_2614D53A8();
  sub_261419C4C();
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_4:
    v7 = (void *)sub_2614D5378();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  sub_261419D40();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6) {
    goto LABEL_4;
  }
  v7 = 0;
LABEL_5:
  return v7;
}

+ (id)bundlePathFallbackWithPath:(id)a3 error:(id *)a4
{
  sub_2614D53A8();
  sub_26141B580();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_2614D5378();
  swift_bridgeObjectRelease();
  return v4;
}

- (VABundleUtil)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VABundleUtil();
  return [(VABundleUtil *)&v3 init];
}

@end