@interface REMSmartListCustomContextChangeItem
- (NSString)name;
- (REMColor)color;
- (REMListBadge)badge;
- (REMSmartListChangeItem)smartListChangeItem;
- (REMSmartListCustomContextChangeItem)initWithSmartListChangeItem:(id)a3;
- (void)setBadge:(id)a3;
- (void)setColor:(id)a3;
- (void)setName:(id)a3;
- (void)setSmartListChangeItem:(id)a3;
@end

@implementation REMSmartListCustomContextChangeItem

- (REMSmartListCustomContextChangeItem)initWithSmartListChangeItem:(id)a3
{
  id v5 = a3;
  if (!v5) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "smartListChangeItem");
  }
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListCustomContextChangeItem;
  v6 = [(REMSmartListCustomContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_smartListChangeItem, a3);
  }

  return v7;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListCustomContextChangeItem *)self smartListChangeItem];
  [v5 setName:v4];
}

- (NSString)name
{
  v3 = [(REMSmartListCustomContextChangeItem *)self smartListChangeItem];
  id v4 = [v3 name];
  if (v4)
  {
    id v5 = [(REMSmartListCustomContextChangeItem *)self smartListChangeItem];
    v6 = [v5 name];
  }
  else
  {
    v6 = &stru_1F1339A18;
  }

  return (NSString *)v6;
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListCustomContextChangeItem *)self smartListChangeItem];
  [v5 setColor:v4];
}

- (REMColor)color
{
  v2 = [(REMSmartListCustomContextChangeItem *)self smartListChangeItem];
  v3 = [v2 color];

  return (REMColor *)v3;
}

- (void)setBadge:(id)a3
{
  id v5 = [a3 rawValue];
  id v4 = [(REMSmartListCustomContextChangeItem *)self smartListChangeItem];
  [v4 setBadgeEmblem:v5];
}

- (REMListBadge)badge
{
  v2 = [(REMSmartListCustomContextChangeItem *)self smartListChangeItem];
  v3 = [v2 badgeEmblem];

  if (v3) {
    id v4 = [[REMListBadge alloc] initWithRawValue:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (REMSmartListChangeItem)smartListChangeItem
{
  return self->_smartListChangeItem;
}

- (void)setSmartListChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end