@interface _UIStatusBarSpacerItem
+ (_UIStatusBarIdentifier)randomDisplayIdentifier;
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
@end

@implementation _UIStatusBarSpacerItem

+ (_UIStatusBarIdentifier)randomDisplayIdentifier
{
  v2 = [a1 identifier];
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  v5 = +[_UIStatusBarIdentifier uninternedIdentifierForObject:v2 string:v4];

  return (_UIStatusBarIdentifier *)v5;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  return 1;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[_UIStatusBarSpacerDisplayItem alloc] initWithIdentifier:v4 item:self];

  v6 = objc_alloc_init(UILayoutGuide);
  [(UILayoutGuide *)v6 _setAllowsNegativeDimensions:1];
  [(_UIStatusBarSpacerDisplayItem *)v5 setLayoutGuide:v6];
  [(_UIStatusBarDisplayItem *)v5 setLayoutItem:v6];

  return v5;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarSpacerItem;
  id v7 = a3;
  v8 = [(_UIStatusBarItem *)&v10 applyUpdate:v7 toDisplayItem:v6];
  objc_msgSend(v6, "applyUpdate:", v7, v10.receiver, v10.super_class);

  return v8;
}

@end