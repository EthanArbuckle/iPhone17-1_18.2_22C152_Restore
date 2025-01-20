@interface _UIORequestEditMenuDismissalAction
- (BOOL)isPermitted;
- (NSString)identifier;
- (_UIORequestEditMenuDismissalAction)initWithConfigurationIdentifier:(id)a3 reason:(int64_t)a4;
- (int64_t)reason;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIORequestEditMenuDismissalAction

- (_UIORequestEditMenuDismissalAction)initWithConfigurationIdentifier:(id)a3 reason:(int64_t)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setObject:v7 forSetting:0];

  v9 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v9 forSetting:1];

  v12.receiver = self;
  v12.super_class = (Class)_UIORequestEditMenuDismissalAction;
  v10 = [(_UIOServerAction *)&v12 initWithOriginContext:0 info:v8 responder:0];

  return v10;
}

- (NSString)identifier
{
  v2 = [(_UIORequestEditMenuDismissalAction *)self info];
  v3 = [v2 objectForSetting:0];

  return (NSString *)v3;
}

- (int64_t)reason
{
  v2 = [(_UIORequestEditMenuDismissalAction *)self info];
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
  int64_t v4 = [(_UIORequestEditMenuDismissalAction *)self identifier];
  objc_msgSend(v5, "dismissEditMenuForIdentifier:hideReason:", v4, -[_UIORequestEditMenuDismissalAction reason](self, "reason"));
}

@end