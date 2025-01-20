@interface ICQAnalytics
+ (void)logInAppBannerImpressionWithAppIdentifier:(id)a3;
+ (void)logInAppBannerInteractionWithAppIdentifier:(id)a3 icqActionName:(id)a4;
+ (void)logInAppBannerViewWithAppIdentifier:(id)a3;
- (ICQAnalytics)init;
- (void)allSetScreenImpressionWithAttributingAppIdentifier:(id)a3;
- (void)freshmintPageDisplayedFromInAppBannerWithAppIdentifier:(id)a3;
- (void)freshmintPageInteractionFromInAppBannerWithAppIdentifier:(id)a3 interactionIdentifier:(id)a4;
- (void)loadFailedWithLoadIdentifier:(id)a3 duration:(int64_t)a4 errorCode:(int64_t)a5;
- (void)loadSucceededWithLoadIdentifier:(id)a3 duration:(int64_t)a4;
- (void)logInAppBannerEventWithAppIdentifier:(id)a3 eventName:(id)a4;
@end

@implementation ICQAnalytics

- (ICQAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Analytics();
  return [(ICQAnalytics *)&v3 init];
}

- (void)freshmintPageDisplayedFromInAppBannerWithAppIdentifier:(id)a3
{
  uint64_t v4 = sub_22C9A36C8();
  uint64_t v6 = v5;
  v7 = *(void (**)(uint64_t, uint64_t, unint64_t, unint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa)
                                                                                   + 0x80);
  v8 = self;
  v7(v4, v6, 0xD000000000000011, 0x800000022C9C08A0);

  swift_bridgeObjectRelease();
}

- (void)freshmintPageInteractionFromInAppBannerWithAppIdentifier:(id)a3 interactionIdentifier:(id)a4
{
  uint64_t v5 = sub_22C9A36C8();
  uint64_t v7 = v6;
  sub_22C9A36C8();
  v8 = self;
  sub_22C9A3788();
  (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v8->super.isa)
                                                                      + 0x80))(v5, v7, 0x6E696D6873657266, 0xEA00000000005F74);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)allSetScreenImpressionWithAttributingAppIdentifier:(id)a3
{
  uint64_t v4 = sub_22C9A36C8();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_22C9A3E18();
  swift_bridgeObjectRelease();
  sub_22C9A3788();
  (*(void (**)(uint64_t, uint64_t, unint64_t, unint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v7->super.isa)
                                                                               + 0x80))(v4, v6, 0xD000000000000013, 0x800000022C9C08C0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)loadFailedWithLoadIdentifier:(id)a3 duration:(int64_t)a4 errorCode:(int64_t)a5
{
  uint64_t v6 = sub_22C9A36C8();
  uint64_t v8 = v7;
  v9 = self;
  sub_22C942D1C(v6, v8, 0x6C69614664616F6CLL, 0xEC0000005F657275);

  swift_bridgeObjectRelease();
}

- (void)loadSucceededWithLoadIdentifier:(id)a3 duration:(int64_t)a4
{
  uint64_t v5 = sub_22C9A36C8();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_22C942D1C(v5, v7, 0x6363755364616F6CLL, 0xEC0000005F737365);

  swift_bridgeObjectRelease();
}

- (void)logInAppBannerEventWithAppIdentifier:(id)a3 eventName:(id)a4
{
  uint64_t v5 = sub_22C9A36C8();
  uint64_t v7 = v6;
  v11[0] = sub_22C9A36C8();
  v11[1] = v8;
  v11[2] = v5;
  v11[3] = v7;
  v11[4] = 0;
  v9 = *(void (**)(void *))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x50);
  v10 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
}

+ (void)logInAppBannerInteractionWithAppIdentifier:(id)a3 icqActionName:(id)a4
{
  uint64_t v4 = sub_22C9A36C8();
  sub_22C942DC4(v4, v5);
  swift_bridgeObjectRelease();
}

+ (void)logInAppBannerImpressionWithAppIdentifier:(id)a3
{
}

+ (void)logInAppBannerViewWithAppIdentifier:(id)a3
{
}

@end