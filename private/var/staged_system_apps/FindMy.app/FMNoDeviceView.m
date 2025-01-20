@interface FMNoDeviceView
- (_TtC6FindMy14FMNoDeviceView)initWithCoder:(id)a3;
- (void)handleAction;
@end

@implementation FMNoDeviceView

- (void)handleAction
{
  v2 = self;
  sub_100271E54();
}

- (_TtC6FindMy14FMNoDeviceView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMNoDeviceView();
  return [(FMEmptyListView *)&v5 initWithCoder:a3];
}

@end