@interface SBIconViewContextMenuContext
- (BOOL)isEqual:(id)a3;
- (CGPoint)location;
- (NSUUID)identifier;
- (SBIconView)iconView;
- (SBIconViewContextMenuContext)initWithIconView:(id)a3 location:(CGPoint)a4;
- (UIContextMenuInteraction)contextMenuInteraction;
- (id)contextMenuNotificationUserInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setContextMenuInteraction:(id)a3;
@end

@implementation SBIconViewContextMenuContext

- (SBIconViewContextMenuContext)initWithIconView:(id)a3 location:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBIconViewContextMenuContext;
  v8 = [(SBIconViewContextMenuContext *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_iconView, v7);
    v10 = [v7 icon];
    uint64_t v11 = [v10 nodeIdentifier];
    nodeIdentifier = v9->_nodeIdentifier;
    v9->_nodeIdentifier = (NSString *)v11;

    v9->_location.CGFloat x = x;
    v9->_location.CGFloat y = y;
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v13;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    v6 = [v4 identifier];
    char v7 = [(NSUUID *)identifier isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  v6 = objc_msgSend(v4, "initWithIconView:location:", WeakRetained, self->_location.x, self->_location.y);

  uint64_t v7 = [(NSUUID *)self->_identifier copy];
  v8 = (void *)v6[4];
  v6[4] = v7;

  uint64_t v9 = [(NSString *)self->_nodeIdentifier copy];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  id v5 = (id)[v3 appendObject:WeakRetained withName:@"_iconView"];

  id v6 = (id)[v3 appendObject:self->_identifier withName:@"_identifier"];
  id v7 = (id)objc_msgSend(v3, "appendPoint:withName:", @"_location", self->_location.x, self->_location.y);
  v8 = [v3 build];

  return v8;
}

- (id)contextMenuNotificationUserInfo
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", self->_nodeIdentifier, @"iconViewNodeIdentifier");
  objc_msgSend(v3, "bs_setSafeObject:forKey:", self->_identifier, @"contextMenuIdentifier");
  id v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", self->_location.x, self->_location.y);
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, @"contextMenuPresentationLocation");

  return v3;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextMenuInteraction);
  return (UIContextMenuInteraction *)WeakRetained;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (SBIconView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  return (SBIconView *)WeakRetained;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_contextMenuInteraction);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
}

@end