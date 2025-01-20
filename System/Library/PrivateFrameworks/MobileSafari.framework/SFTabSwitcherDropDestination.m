@interface SFTabSwitcherDropDestination
- (SFTabSwitcherDropDestination)init;
- (SFTabSwitcherDropDestination)initWithPage:(id)a3 section:(id)a4 droppingBefore:(id)a5;
- (SFTabSwitcherItem)item;
- (SFTabSwitcherPage)page;
- (SFTabSwitcherSection)section;
@end

@implementation SFTabSwitcherDropDestination

- (SFTabSwitcherDropDestination)initWithPage:(id)a3 section:(id)a4 droppingBefore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (SFTabSwitcherDropDestination *)sub_18C5DE370((uint64_t)v7, (uint64_t)v8, (uint64_t)a5);

  return v10;
}

- (SFTabSwitcherPage)page
{
  v2 = self;
  id v3 = sub_18C5D49BC();

  return (SFTabSwitcherPage *)v3;
}

- (SFTabSwitcherSection)section
{
  v2 = self;
  id v3 = sub_18C5D4BA0();

  return (SFTabSwitcherSection *)v3;
}

- (SFTabSwitcherItem)item
{
  v2 = self;
  id v3 = sub_18C5D4D94();

  return (SFTabSwitcherItem *)v3;
}

- (SFTabSwitcherDropDestination)init
{
  result = (SFTabSwitcherDropDestination *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end