@interface SimulatorNetwork
- (_TtC15SeymourServices16SimulatorNetwork)init;
- (id)fetch:(id)a3;
@end

@implementation SimulatorNetwork

- (id)fetch:(id)a3
{
  sub_1D67D9774(0, &qword_1EA7FFD38);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D6FAA440();
  v8 = (void *)sub_1D6FAA450();

  return v8;
}

- (_TtC15SeymourServices16SimulatorNetwork)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SimulatorNetwork();
  return [(SimulatorNetwork *)&v3 init];
}

@end