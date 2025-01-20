@interface RootHostingControllerNavigationItem
- (BOOL)leftItemsSupplementBackButton;
- (_TtC11BookStoreUIP33_33EEA6210FEC2640A5148301F86EE4A335RootHostingControllerNavigationItem)initWithCoder:(id)a3;
- (_TtC11BookStoreUIP33_33EEA6210FEC2640A5148301F86EE4A335RootHostingControllerNavigationItem)initWithTitle:(id)a3;
@end

@implementation RootHostingControllerNavigationItem

- (BOOL)leftItemsSupplementBackButton
{
  return 0;
}

- (_TtC11BookStoreUIP33_33EEA6210FEC2640A5148301F86EE4A335RootHostingControllerNavigationItem)initWithTitle:(id)a3
{
  sub_2E4420();
  NSString v4 = sub_2E43E0();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RootHostingControllerNavigationItem();
  v5 = [(RootHostingControllerNavigationItem *)&v7 initWithTitle:v4];

  return v5;
}

- (_TtC11BookStoreUIP33_33EEA6210FEC2640A5148301F86EE4A335RootHostingControllerNavigationItem)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootHostingControllerNavigationItem();
  return [(RootHostingControllerNavigationItem *)&v5 initWithCoder:a3];
}

@end