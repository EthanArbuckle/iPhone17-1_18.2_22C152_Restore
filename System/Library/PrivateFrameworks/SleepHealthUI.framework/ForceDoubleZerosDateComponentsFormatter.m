@interface ForceDoubleZerosDateComponentsFormatter
- (_TtC13SleepHealthUI39ForceDoubleZerosDateComponentsFormatter)init;
- (_TtC13SleepHealthUI39ForceDoubleZerosDateComponentsFormatter)initWithCoder:(id)a3;
- (id)stringFromDateComponents:(id)a3;
- (id)stringFromTimeInterval:(double)a3;
@end

@implementation ForceDoubleZerosDateComponentsFormatter

- (id)stringFromTimeInterval:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ForceDoubleZerosDateComponentsFormatter();
  id v4 = v10.receiver;
  id v5 = [(NSDateComponentsFormatter *)&v10 stringFromTimeInterval:a3];
  if (v5)
  {
    uint64_t v6 = sub_1AD9DF710();
    uint64_t v8 = v7;

    sub_1AD8D6E0C(v6, v8);
    swift_bridgeObjectRelease();
    id v5 = (id)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  return v5;
}

- (id)stringFromDateComponents:(id)a3
{
  uint64_t v4 = sub_1AD9DC990();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DC8C0();
  v9 = self;
  objc_super v10 = (void *)sub_1AD9DC8B0();
  v11 = (objc_class *)type metadata accessor for ForceDoubleZerosDateComponentsFormatter();
  v18.receiver = v9;
  v18.super_class = v11;
  id v12 = [(NSDateComponentsFormatter *)&v18 stringFromDateComponents:v10];

  if (v12)
  {
    uint64_t v13 = sub_1AD9DF710();
    uint64_t v15 = v14;

    sub_1AD8D6E0C(v13, v15);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v16 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v16 = 0;
  }
  return v16;
}

- (_TtC13SleepHealthUI39ForceDoubleZerosDateComponentsFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ForceDoubleZerosDateComponentsFormatter();
  return [(NSDateComponentsFormatter *)&v3 init];
}

- (_TtC13SleepHealthUI39ForceDoubleZerosDateComponentsFormatter)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ForceDoubleZerosDateComponentsFormatter();
  return [(NSDateComponentsFormatter *)&v5 initWithCoder:a3];
}

@end