@interface MFBackFillMessageBodyScheduler.Request
- (BOOL)shouldDefer;
- (NSString)description;
- (_TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request)init;
- (unsigned)backFillID;
- (void)completeWithStatus:(int)a3;
- (void)dealloc;
@end

@implementation MFBackFillMessageBodyScheduler.Request

- (unsigned)backFillID
{
  v2 = self;
  unsigned __int16 v5 = sub_1A80DBAEC();

  return v5;
}

- (BOOL)shouldDefer
{
  v2 = self;
  sub_1A80DBB68();

  return sub_1A8A74E98() & 1;
}

- (void)dealloc
{
  v2 = self;
  sub_1A80DBC9C();
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = self;
  sub_1A80DE03C();

  id v5 = (id)sub_1A8A76538();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)completeWithStatus:(int)a3
{
  v3 = self;
  sub_1A80DE224(a3);
}

- (_TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request)init
{
  return (_TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request *)sub_1A80DE6BC();
}

@end