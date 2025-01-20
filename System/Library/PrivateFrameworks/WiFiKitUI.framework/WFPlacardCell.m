@interface WFPlacardCell
- (UINavigationItem)navigationItem;
- (WFPlacardCell)initWithCoder:(id)a3;
- (WFPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setNavigationItem:(id)a3;
@end

@implementation WFPlacardCell

- (UINavigationItem)navigationItem
{
  v2 = (void *)MEMORY[0x22A637360]((char *)self + OBJC_IVAR___WFPlacardCell_navigationItem, a2);
  return (UINavigationItem *)v2;
}

- (void)setNavigationItem:(id)a3
{
}

- (WFPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_225882538();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (WFPlacardCell *)sub_22584E5D8(v4, v5);
}

- (WFPlacardCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (WFPlacardCell *)sub_2258827B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end