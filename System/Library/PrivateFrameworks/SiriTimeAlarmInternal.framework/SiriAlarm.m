@interface SiriAlarm
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SiriAlarm)initWithCoder:(id)a3;
- (SiriAlarm)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation SiriAlarm

- (SiriAlarm)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
  {
    uint64_t v6 = sub_25DC95E90();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_25DC95E90();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_25DC95E90();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  return (SiriAlarm *)SiriAlarm.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_25DC96150();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = SiriAlarm.isEqual(_:)((uint64_t)v8);

  sub_25DC4D9F8((uint64_t)v8, &qword_26A6BBDC0);
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriAlarm)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriAlarm();
  return [(SiriAlarm *)&v5 initWithCoder:a3];
}

@end