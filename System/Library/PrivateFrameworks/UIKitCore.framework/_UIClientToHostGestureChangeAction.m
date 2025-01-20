@interface _UIClientToHostGestureChangeAction
- (NSString)hostGestureIdentifier;
- (_UIClientToHostGestureChangeAction)initWithHostGestureIdentifier:(id)a3 changeToState:(int64_t)a4;
- (int64_t)UIActionType;
- (int64_t)state;
- (void)dispatchToHostGestureRecognizer;
@end

@implementation _UIClientToHostGestureChangeAction

- (_UIClientToHostGestureChangeAction)initWithHostGestureIdentifier:(id)a3 changeToState:(int64_t)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setObject:v7 forSetting:0];

  v9 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v9 forSetting:1];

  v10 = [(_UIClientToHostGestureChangeAction *)self initWithInfo:v8 responder:0];
  return v10;
}

- (NSString)hostGestureIdentifier
{
  v2 = [(_UIClientToHostGestureChangeAction *)self info];
  v3 = [v2 objectForSetting:0];

  return (NSString *)v3;
}

- (int64_t)state
{
  v2 = [(_UIClientToHostGestureChangeAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)UIActionType
{
  return 55;
}

- (void)dispatchToHostGestureRecognizer
{
  int64_t v3 = [(_UIClientToHostGestureChangeAction *)self state];
  id v4 = [(_UIClientToHostGestureChangeAction *)self hostGestureIdentifier];
  +[_UIClientToHostRelationshipGestureInteraction dispatchGestureRecognizerStateChange:v3 toHostGestureWithIdentifier:v4];
}

@end