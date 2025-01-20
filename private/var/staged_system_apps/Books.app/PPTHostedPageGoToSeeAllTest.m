@interface PPTHostedPageGoToSeeAllTest
- (PPTHostedPageGoToSeeAllTest)init;
- (PPTHostedPageGoToSeeAllTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (void)startTest;
@end

@implementation PPTHostedPageGoToSeeAllTest

- (PPTHostedPageGoToSeeAllTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  v8 = (void *)sub_1007FDC70();
  v10 = v9;
  if (a4) {
    a4 = (id)sub_1007FDA70();
  }
  uint64_t v11 = sub_1007FDA70();
  return (PPTHostedPageGoToSeeAllTest *)sub_100288480(v8, v10, (uint64_t)a4, v11, a6);
}

- (void)startTest
{
  uint64_t v3 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  [(PPTBasicTest *)v6 setTestTimeout:30];
  [(PPTBasicTest *)v6 setRunning:1];
  [(PPTBasicTest *)v6 startPPTTest];
  uint64_t v7 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_1007FE100();
  v8 = v6;
  uint64_t v9 = sub_1007FE0F0();
  v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v8;
  sub_100017C2C((uint64_t)v5, (uint64_t)&unk_100B28A98, (uint64_t)v10);

  swift_release();
}

- (PPTHostedPageGoToSeeAllTest)init
{
  result = (PPTHostedPageGoToSeeAllTest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end