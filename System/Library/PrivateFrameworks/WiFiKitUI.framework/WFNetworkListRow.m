@interface WFNetworkListRow
- (WFNetworkListRow)initWithCoder:(id)a3;
- (WFNetworkListRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFNetworkRowConfig)config;
- (void)configure:(id)a3;
- (void)prepareForReuse;
- (void)setConfig:(id)a3;
@end

@implementation WFNetworkListRow

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NetworkListRow();
  id v2 = v5.receiver;
  [(WFNetworkListRow *)&v5 prepareForReuse];
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  MEMORY[0x22A636570](v3);
}

- (WFNetworkRowConfig)config
{
  id v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  return (WFNetworkRowConfig *)*v2;
}

- (void)setConfig:(id)a3
{
  objc_super v5 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  id v6 = *v5;
  *objc_super v5 = a3;
  v7 = (WFNetworkListRow *)a3;
  v8 = self;

  if (*v5)
  {
    v9 = (WFNetworkListRow *)*v5;
    sub_2258553D8(v9);

    v8 = v7;
    v7 = v9;
  }
}

- (WFNetworkListRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_225882538();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config) = 0;
    objc_super v5 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config) = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NetworkListRow();
  id v6 = [(WFNetworkListRow *)&v8 initWithStyle:0 reuseIdentifier:v5];

  return v6;
}

- (WFNetworkListRow)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config) = 0;
  id v4 = a3;

  result = (WFNetworkListRow *)sub_2258827B8();
  __break(1u);
  return result;
}

- (void)configure:(id)a3
{
  id v4 = (WFNetworkRowConfig *)a3;
  objc_super v5 = self;
  NetworkListRow.configure(_:)(v4);
}

- (void).cxx_destruct
{
}

@end