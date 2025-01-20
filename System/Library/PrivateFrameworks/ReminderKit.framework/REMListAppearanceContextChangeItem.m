@interface REMListAppearanceContextChangeItem
- (BOOL)showingLargeAttachments;
- (NSString)badgeEmblem;
- (REMListAppearanceContextChangeItem)initWithListChangeItem:(id)a3;
- (REMListBadge)badge;
- (REMListChangeItem)listChangeItem;
- (void)setBadge:(id)a3;
- (void)setBadgeEmblem:(id)a3;
- (void)setListChangeItem:(id)a3;
- (void)setShowingLargeAttachments:(BOOL)a3;
@end

@implementation REMListAppearanceContextChangeItem

- (REMListAppearanceContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListAppearanceContextChangeItem;
  v6 = [(REMListAppearanceContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listChangeItem, a3);
  }

  return v7;
}

- (void)setBadge:(id)a3
{
  id v5 = [a3 rawValue];
  v4 = [(REMListAppearanceContextChangeItem *)self listChangeItem];
  [v4 setBadgeEmblem:v5];
}

- (REMListBadge)badge
{
  v2 = [(REMListAppearanceContextChangeItem *)self listChangeItem];
  v3 = [v2 badgeEmblem];

  if (v3) {
    v4 = [[REMListBadge alloc] initWithRawValue:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)setBadgeEmblem:(id)a3
{
  id v4 = a3;
  id v5 = [[REMListBadge alloc] initWithEmblem:v4];

  [(REMListAppearanceContextChangeItem *)self setBadge:v5];
}

- (NSString)badgeEmblem
{
  v2 = [(REMListAppearanceContextChangeItem *)self badge];
  v3 = [v2 emblem];

  return (NSString *)v3;
}

- (void)setShowingLargeAttachments:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMListAppearanceContextChangeItem *)self listChangeItem];
  [v4 setShowingLargeAttachments:v3];
}

- (BOOL)showingLargeAttachments
{
  v2 = [(REMListAppearanceContextChangeItem *)self listChangeItem];
  char v3 = [v2 showingLargeAttachments];

  return v3;
}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end