@interface FMNoPersonView
- (_TtC6FindMy14FMNoPersonView)initWithCoder:(id)a3;
- (void)handleAction;
@end

@implementation FMNoPersonView

- (void)handleAction
{
  v2 = self;
  sub_10044DAE0();
}

- (_TtC6FindMy14FMNoPersonView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMNoPersonView();
  return [(FMEmptyListView *)&v5 initWithCoder:a3];
}

@end