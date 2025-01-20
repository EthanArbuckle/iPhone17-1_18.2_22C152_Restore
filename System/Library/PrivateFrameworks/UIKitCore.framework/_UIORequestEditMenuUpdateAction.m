@interface _UIORequestEditMenuUpdateAction
- (BOOL)isPermitted;
- (NSString)identifier;
- (UIMenu)updatedMenu;
- (_UIORequestEditMenuUpdateAction)initWithConfigurationIdentifier:(id)a3 updatedMenu:(id)a4 reason:(int64_t)a5;
- (int64_t)reason;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIORequestEditMenuUpdateAction

- (_UIORequestEditMenuUpdateAction)initWithConfigurationIdentifier:(id)a3 updatedMenu:(id)a4 reason:(int64_t)a5
{
  v8 = (void *)MEMORY[0x1E4F28DB0];
  id v9 = a3;
  v10 = [v8 archivedDataWithRootObject:a4 requiringSecureCoding:1 error:0];
  id v11 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v11 setObject:v9 forSetting:0];

  [v11 setObject:v10 forSetting:1];
  v12 = [NSNumber numberWithInteger:a5];
  [v11 setObject:v12 forSetting:2];

  v15.receiver = self;
  v15.super_class = (Class)_UIORequestEditMenuUpdateAction;
  v13 = [(_UIOServerAction *)&v15 initWithOriginContext:0 info:v11 responder:0];

  return v13;
}

- (NSString)identifier
{
  v2 = [(_UIORequestEditMenuUpdateAction *)self info];
  v3 = [v2 objectForSetting:0];

  return (NSString *)v3;
}

- (UIMenu)updatedMenu
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v4 = objc_opt_class();
  v5 = [(_UIORequestEditMenuUpdateAction *)self info];
  v6 = [v5 objectForSetting:1];
  v7 = [v3 unarchivedObjectOfClass:v4 fromData:v6 error:0];

  return (UIMenu *)v7;
}

- (int64_t)reason
{
  v2 = [(_UIORequestEditMenuUpdateAction *)self info];
  v3 = [v2 objectForSetting:2];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isPermitted
{
  return +[UIEditMenuInteraction _isOutOfProcessEditMenusEnabled];
}

- (void)performActionFromConnection:(id)a3
{
  id v6 = +[_UIEditMenuPresentationServer sharedPresentationServer];
  int64_t v4 = [(_UIORequestEditMenuUpdateAction *)self identifier];
  v5 = [(_UIORequestEditMenuUpdateAction *)self updatedMenu];
  objc_msgSend(v6, "replaceEditMenuForIdentifier:updatedMenu:reason:", v4, v5, -[_UIORequestEditMenuUpdateAction reason](self, "reason"));
}

@end