@interface _UIORequestEditMenuTraitUpdateAction
- (BOOL)isPermitted;
- (NSString)identifier;
- (_UIORequestEditMenuTraitUpdateAction)initWithConfigurationIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4;
- (int64_t)userInterfaceStyle;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIORequestEditMenuTraitUpdateAction

- (_UIORequestEditMenuTraitUpdateAction)initWithConfigurationIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setObject:v7 forSetting:0];

  v9 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v9 forSetting:1];

  v12.receiver = self;
  v12.super_class = (Class)_UIORequestEditMenuTraitUpdateAction;
  v10 = [(_UIOServerAction *)&v12 initWithOriginContext:0 info:v8 responder:0];

  return v10;
}

- (NSString)identifier
{
  v2 = [(_UIORequestEditMenuTraitUpdateAction *)self info];
  v3 = [v2 objectForSetting:0];

  return (NSString *)v3;
}

- (int64_t)userInterfaceStyle
{
  v2 = [(_UIORequestEditMenuTraitUpdateAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isPermitted
{
  return +[UIEditMenuInteraction _isOutOfProcessEditMenusEnabled];
}

- (void)performActionFromConnection:(id)a3
{
  id v5 = +[_UIEditMenuPresentationServer sharedPresentationServer];
  int64_t v4 = [(_UIORequestEditMenuTraitUpdateAction *)self identifier];
  objc_msgSend(v5, "updateUserInterfaceStyleForMenuWithIdentifier:userInterfaceStyle:", v4, -[_UIORequestEditMenuTraitUpdateAction userInterfaceStyle](self, "userInterfaceStyle"));
}

@end