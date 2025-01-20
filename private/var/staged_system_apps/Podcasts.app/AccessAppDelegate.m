@interface AccessAppDelegate
+ (_TtC8Podcasts11AppDelegate)shared;
+ (void)setShared:(id)a3;
- (_TtC8Podcasts17AccessAppDelegate)init;
@end

@implementation AccessAppDelegate

+ (_TtC8Podcasts11AppDelegate)shared
{
  return (_TtC8Podcasts11AppDelegate *)(id)qword_10061ACE0;
}

+ (void)setShared:(id)a3
{
  id v4 = (id)qword_10061ACE0;
  qword_10061ACE0 = (uint64_t)a3;
  id v3 = a3;
}

- (_TtC8Podcasts17AccessAppDelegate)init
{
  return (_TtC8Podcasts17AccessAppDelegate *)sub_1003546C8(self, (uint64_t)a2, type metadata accessor for AccessAppDelegate);
}

@end