@interface ICQJetAnalytics
+ (void)preloadWithAccount:(id)a3;
- (ICQJetAnalytics)init;
@end

@implementation ICQJetAnalytics

+ (void)preloadWithAccount:(id)a3
{
  swift_beginAccess();
  if (qword_2684E0B88)
  {
    id v4 = a3;
  }
  else
  {
    qword_2684E0B88 = sub_22C955C04(a3);
    swift_retain();
    swift_release();
  }
  swift_retain();

  swift_release();
}

- (ICQJetAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JetAnalytics();
  return [(ICQJetAnalytics *)&v3 init];
}

@end