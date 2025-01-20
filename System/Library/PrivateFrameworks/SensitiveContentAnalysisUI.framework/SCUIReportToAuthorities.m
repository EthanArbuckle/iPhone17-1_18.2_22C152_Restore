@interface SCUIReportToAuthorities
+ (void)presentFlowFromController:(id)a3 authority:(id)a4 interventionType:(int64_t)a5 delegate:(id)a6 contextDictionary:(id)a7;
- (SCUIReportToAuthorities)init;
@end

@implementation SCUIReportToAuthorities

+ (void)presentFlowFromController:(id)a3 authority:(id)a4 interventionType:(int64_t)a5 delegate:(id)a6 contextDictionary:(id)a7
{
  if (!a6)
  {
    memset(v18, 0, sizeof(v18));
    id v15 = a3;
    id v16 = a4;
    id v17 = a7;
    if (a7) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  swift_unknownObjectRetain();
  sub_25C0EBE88();
  swift_unknownObjectRelease();
  if (!a7) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = sub_25C0EB758();

LABEL_6:
  sub_25C0955E8(a3, a4, a5, (uint64_t)v18, v14);

  swift_bridgeObjectRelease();
  sub_25C02FBF0((uint64_t)v18, &qword_26A589818);
}

- (SCUIReportToAuthorities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Report();
  return [(SCUIReportToAuthorities *)&v3 init];
}

@end