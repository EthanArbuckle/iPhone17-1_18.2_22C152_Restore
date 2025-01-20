@interface SFTabSwitcherContent
- (NSArray)pages;
- (SFTabSwitcherContent)init;
- (SFTabSwitcherItem)selectedItem;
- (SFTabSwitcherProfile)profileForInsertedPages;
- (void)setPages:(id)a3;
- (void)setProfileForInsertedPages:(id)a3;
- (void)setSelectedItem:(id)a3;
@end

@implementation SFTabSwitcherContent

- (void).cxx_destruct
{
}

- (void)setPages:(id)a3
{
}

- (void)setProfileForInsertedPages:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18C37DD08((uint64_t)a3);
}

- (SFTabSwitcherContent)init
{
  return (SFTabSwitcherContent *)sub_18C37ECE4();
}

- (void)setSelectedItem:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18C381C60((uint64_t)a3);
}

- (NSArray)pages
{
  return (NSArray *)sub_18C5D612C(self, (uint64_t)a2, (void (*)(void))sub_18C5D41B8, (void (*)(void))type metadata accessor for SFTabSwitcherPage);
}

- (SFTabSwitcherProfile)profileForInsertedPages
{
  v2 = self;
  id v3 = sub_18C5D44AC();

  return (SFTabSwitcherProfile *)v3;
}

- (SFTabSwitcherItem)selectedItem
{
  v2 = self;
  id v3 = sub_18C5D45B4();

  return (SFTabSwitcherItem *)v3;
}

@end