@interface NPKTileActionItem
- (NPKTileActionItem)initWithTile:(id)a3 action:(id)a4;
- (PKPassTile)tile;
- (PKPaymentPassAction)action;
- (id)description;
@end

@implementation NPKTileActionItem

- (NPKTileActionItem)initWithTile:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NPKTileActionItem;
  v9 = [(NPKTileActionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tile, a3);
    objc_storeStrong((id *)&v10->_action, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NPKTileActionItem *)self tile];
  v6 = [(NPKTileActionItem *)self action];
  id v7 = [v3 stringWithFormat:@"<%@: %p\n\tTile: %@\n\tAction: %@\n>", v4, self, v5, v6];

  return v7;
}

- (PKPassTile)tile
{
  return self->_tile;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_tile, 0);
}

@end