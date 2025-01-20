@interface UIFocusRingClientState
- (NSMapTable)activeFocusLayersToItems;
- (NSMutableArray)activeFocusLayers;
- (NSString)clientID;
- (UIFocusItem)currentFocusItem;
- (UIFocusRingClientState)initWithClientID:(id)a3;
- (id)description;
- (void)setActiveFocusLayers:(id)a3;
- (void)setActiveFocusLayersToItems:(id)a3;
- (void)setClientID:(id)a3;
- (void)setCurrentFocusItem:(id)a3;
@end

@implementation UIFocusRingClientState

- (UIFocusRingClientState)initWithClientID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIFocusRingClientState;
  id v3 = a3;
  v4 = [(UIFocusRingClientState *)&v6 init];
  -[UIFocusRingClientState setClientID:](v4, "setClientID:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [(UIFocusRingClientState *)self clientID];
  v7 = [(UIFocusRingClientState *)self activeFocusLayersToItems];
  v8 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, active focus layers: %@>", v5, self, v6, v7];

  return v8;
}

- (UIFocusItem)currentFocusItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentFocusItem);
  return (UIFocusItem *)WeakRetained;
}

- (void)setCurrentFocusItem:(id)a3
{
}

- (NSMutableArray)activeFocusLayers
{
  return self->_activeFocusLayers;
}

- (void)setActiveFocusLayers:(id)a3
{
}

- (NSMapTable)activeFocusLayersToItems
{
  return self->_activeFocusLayersToItems;
}

- (void)setActiveFocusLayersToItems:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_activeFocusLayersToItems, 0);
  objc_storeStrong((id *)&self->_activeFocusLayers, 0);
  objc_destroyWeak((id *)&self->_currentFocusItem);
}

@end