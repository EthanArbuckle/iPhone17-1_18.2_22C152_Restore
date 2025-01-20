@interface _UIEventSessionAction
+ (id)stringValueForActionType:(int64_t)a3;
+ (id)stringValueForSource:(int64_t)a3;
+ (int64_t)getUIEventSourceForUITouchType:(int64_t)a3;
- (NSNumber)sessionID;
- (NSString)metadata;
- (NSString)typeEncoding;
- (_UIEventSessionContextualAction)asContextualPress;
- (_UIEventSessionHoverAction)asHover;
- (_UIEventSessionKeyCommandAction)asKeyCommand;
- (_UIEventSessionScrollAction)asScroll;
- (_UIEventSessionTapAction)asTap;
- (_UIEventSessionTextSelectionAction)asTextSelection;
- (_UIEventSessionTouchAction)asTouch;
- (_UIEventSessionTypingAction)asTyping;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)actionCount;
- (int64_t)actionCountFromMergedActions;
- (int64_t)actionType;
- (int64_t)hardwareKeyboardState;
- (int64_t)magicKeyboardState;
- (int64_t)mergeActionIfPossible:(id)a3;
- (int64_t)sequenceNumber;
- (int64_t)source;
- (int64_t)uiInterfaceOrientation;
- (void)setActionCountFromMergedActions:(int64_t)a3;
- (void)setActionType:(int64_t)a3;
- (void)setHardwareKeyboardState:(int64_t)a3;
- (void)setMagicKeyboardState:(int64_t)a3;
- (void)setSequenceNumber:(int64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setUiInterfaceOrientation:(int64_t)a3;
@end

@implementation _UIEventSessionAction

- (_UIEventSessionTouchAction)asTouch
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UIEventSessionTouchAction *)v3;
}

- (_UIEventSessionTapAction)asTap
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UIEventSessionTapAction *)v3;
}

- (_UIEventSessionScrollAction)asScroll
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UIEventSessionScrollAction *)v3;
}

- (_UIEventSessionContextualAction)asContextualPress
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UIEventSessionContextualAction *)v3;
}

- (_UIEventSessionTypingAction)asTyping
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UIEventSessionTypingAction *)v3;
}

- (_UIEventSessionTextSelectionAction)asTextSelection
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UIEventSessionTextSelectionAction *)v3;
}

- (_UIEventSessionKeyCommandAction)asKeyCommand
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UIEventSessionKeyCommandAction *)v3;
}

- (_UIEventSessionHoverAction)asHover
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (_UIEventSessionHoverAction *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = self->_source;
  objc_storeStrong((id *)(v4 + 24), self->_sessionID);
  *(void *)(v4 + 56) = self->_sequenceNumber;
  *(void *)(v4 + 64) = self->_actionCountFromMergedActions;
  *(void *)(v4 + 32) = self->_uiInterfaceOrientation;
  *(void *)(v4 + 48) = self->_hardwareKeyboardState;
  *(void *)(v4 + 40) = self->_magicKeyboardState;
  return (id)v4;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uiInterfaceOrientation];
  if (v5 == [(_UIEventSessionAction *)self uiInterfaceOrientation]
    && (uint64_t v6 = [v4 hardwareKeyboardState],
        v6 == [(_UIEventSessionAction *)self hardwareKeyboardState])
    && (uint64_t v7 = [v4 magicKeyboardState],
        v7 == [(_UIEventSessionAction *)self magicKeyboardState])
    && (uint64_t v8 = [v4 source], v8 == -[_UIEventSessionAction source](self, "source"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (os_variant_has_internal_diagnostics())
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIEventSessionActionAnalytics", &mergeActionIfPossible____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v12 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Successfully merged actions", v13, 2u);
        }
      }
    }
    -[_UIEventSessionAction setActionCountFromMergedActions:](self, "setActionCountFromMergedActions:", -[_UIEventSessionAction actionCountFromMergedActions](self, "actionCountFromMergedActions")+ [v4 actionCount]);
    int64_t v9 = 1;
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)_UIEventSessionAction;
  v3 = [(_UIEventSessionAction *)&v14 description];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = NSString;
  uint64_t v6 = +[_UIEventSessionAction stringValueForSource:[(_UIEventSessionAction *)self source]];
  uint64_t v7 = [v5 stringWithFormat:@" source = %@", v6];
  [v4 addObject:v7];

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"uiInterfaceOrientation = %lu", -[_UIEventSessionAction uiInterfaceOrientation](self, "uiInterfaceOrientation"));
  [v4 addObject:v8];

  int64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"hardwareKeyboardState = %lu", -[_UIEventSessionAction hardwareKeyboardState](self, "hardwareKeyboardState"));
  [v4 addObject:v9];

  v10 = objc_msgSend(NSString, "stringWithFormat:", @"magicKeyboardState = %lu", -[_UIEventSessionAction magicKeyboardState](self, "magicKeyboardState"));
  [v4 addObject:v10];

  if ([v4 count])
  {
    v11 = [v4 componentsJoinedByString:@", "];
    uint64_t v12 = [v3 stringByAppendingFormat:@" %@", v11];

    v3 = (void *)v12;
  }

  return v3;
}

- (NSString)typeEncoding
{
  return (NSString *)&stru_1ED0E84C0;
}

- (NSString)metadata
{
  int64_t v2 = [(_UIEventSessionAction *)self source];
  return (NSString *)+[_UIEventSessionAction stringValueForSource:v2];
}

- (int64_t)actionCount
{
  return [(_UIEventSessionAction *)self actionCountFromMergedActions] + 1;
}

- (int64_t)actionType
{
  return 0;
}

+ (int64_t)getUIEventSourceForUITouchType:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (id)stringValueForSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"unspecified";
  }
  else {
    return off_1E52FA1E0[a3 - 1];
  }
}

+ (id)stringValueForActionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x1B) {
    return @"Generic";
  }
  else {
    return off_1E52FA210[a3 - 1];
  }
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (int64_t)uiInterfaceOrientation
{
  return self->_uiInterfaceOrientation;
}

- (void)setUiInterfaceOrientation:(int64_t)a3
{
  self->_uiInterfaceOrientation = a3;
}

- (int64_t)magicKeyboardState
{
  return self->_magicKeyboardState;
}

- (void)setMagicKeyboardState:(int64_t)a3
{
  self->_magicKeyboardState = a3;
}

- (int64_t)hardwareKeyboardState
{
  return self->_hardwareKeyboardState;
}

- (void)setHardwareKeyboardState:(int64_t)a3
{
  self->_hardwareKeyboardState = a3;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (int64_t)actionCountFromMergedActions
{
  return self->_actionCountFromMergedActions;
}

- (void)setActionCountFromMergedActions:(int64_t)a3
{
  self->_actionCountFromMergedActions = a3;
}

- (void).cxx_destruct
{
}

@end