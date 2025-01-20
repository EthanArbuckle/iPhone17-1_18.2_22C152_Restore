@interface UIGlomojiAnalyticsDispatcher
- (BOOL)KBMenuAppeared;
- (NSString)originalInputMode;
- (NSString)updatedInputMode;
- (UIGlomojiAnalyticsDispatcher)init;
- (id)getInputMode;
- (unint64_t)KBMenuDismissSource;
- (unint64_t)KBMenuInteractionSource;
- (unint64_t)KBMenuSelectedAction;
- (unint64_t)getGlomojiButtonTypeEnumValue;
- (unint64_t)glomojiType;
- (void)didGlomojiTap;
- (void)didKBMenuAction;
- (void)didKBMenuAppear;
- (void)didKBMenuDismiss;
- (void)didKBMenuInteraction;
- (void)setGlomojiType:(unint64_t)a3;
- (void)setKBMenuAppeared:(BOOL)a3;
- (void)setKBMenuDismissSource:(unint64_t)a3;
- (void)setKBMenuInteractionSource:(unint64_t)a3;
- (void)setKBMenuSelectedAction:(unint64_t)a3;
- (void)setOriginalInputMode:(id)a3;
- (void)setUpdatedInputMode:(id)a3;
@end

@implementation UIGlomojiAnalyticsDispatcher

- (UIGlomojiAnalyticsDispatcher)init
{
  v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    v5 = UIGlomojiLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UIGlomojiAnalyticsDispatcher] Disabled", buf, 2u);
    }

    v6 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIGlomojiAnalyticsDispatcher;
    v7 = [(UIGlomojiAnalyticsDispatcher *)&v12 init];
    v8 = v7;
    if (v7)
    {
      v7->_KBMenuAppeared = 0;
      v7->_glomojiType = 0;
      v7->_KBMenuInteractionSource = 0;
      originalInputMode = v7->_originalInputMode;
      v7->_KBMenuDismissSource = 0;
      v7->_originalInputMode = 0;

      updatedInputMode = v8->_updatedInputMode;
      v8->_updatedInputMode = 0;

      v8->_KBMenuSelectedAction = 0;
    }
    self = v8;
    v6 = self;
  }

  return v6;
}

- (void)didKBMenuAction
{
  if ([(UIGlomojiAnalyticsDispatcher *)self KBMenuAppeared])
  {
    if ([(UIGlomojiAnalyticsDispatcher *)self KBMenuInteractionSource]
      && [(UIGlomojiAnalyticsDispatcher *)self KBMenuSelectedAction])
    {
      [(UIGlomojiAnalyticsDispatcher *)self didKBMenuInteraction];
    }
    if ([(UIGlomojiAnalyticsDispatcher *)self KBMenuDismissSource]) {
      [(UIGlomojiAnalyticsDispatcher *)self didKBMenuDismiss];
    }
  }
  [(UIGlomojiAnalyticsDispatcher *)self setKBMenuAppeared:0];
  [(UIGlomojiAnalyticsDispatcher *)self setKBMenuInteractionSource:0];
  [(UIGlomojiAnalyticsDispatcher *)self setKBMenuDismissSource:0];
}

- (void)didGlomojiTap
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(UIGlomojiAnalyticsDispatcher *)self setGlomojiType:[(UIGlomojiAnalyticsDispatcher *)self getGlomojiButtonTypeEnumValue]];
  v3 = +[UIKBAnalyticsDispatcher sharedInstance];
  uint64_t v4 = [v3 updatedInputMode];
  [(UIGlomojiAnalyticsDispatcher *)self setUpdatedInputMode:v4];

  v5 = UIGlomojiLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v11 = [(UIGlomojiAnalyticsDispatcher *)self originalInputMode];
    objc_super v12 = [(UIGlomojiAnalyticsDispatcher *)self updatedInputMode];
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "[UIGlomojiAnalyticsDispatcher] Glomoji Tap. old: %@, new: %@", (uint8_t *)&v13, 0x16u);
  }
  v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v7 = [v6 _textInputSessionAnalytics];
  unint64_t v8 = [(UIGlomojiAnalyticsDispatcher *)self glomojiType];
  v9 = [(UIGlomojiAnalyticsDispatcher *)self originalInputMode];
  v10 = [(UIGlomojiAnalyticsDispatcher *)self updatedInputMode];
  [v7 didGlomojiTap:v8 originalInputMode:v9 newInputMode:v10];
}

- (void)didKBMenuAppear
{
  [(UIGlomojiAnalyticsDispatcher *)self setGlomojiType:[(UIGlomojiAnalyticsDispatcher *)self getGlomojiButtonTypeEnumValue]];
  id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v3 = [v6 _textInputSessionAnalytics];
  unint64_t v4 = [(UIGlomojiAnalyticsDispatcher *)self glomojiType];
  v5 = [(UIGlomojiAnalyticsDispatcher *)self originalInputMode];
  [v3 didKBMenuAppear:v4 originalInputMode:v5];
}

- (void)didKBMenuInteraction
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = UIGlomojiLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v11 = [(UIGlomojiAnalyticsDispatcher *)self KBMenuInteractionSource];
    unint64_t v12 = [(UIGlomojiAnalyticsDispatcher *)self KBMenuSelectedAction];
    int v13 = [(UIGlomojiAnalyticsDispatcher *)self originalInputMode];
    v14 = [(UIGlomojiAnalyticsDispatcher *)self updatedInputMode];
    int v15 = 134218754;
    unint64_t v16 = v11;
    __int16 v17 = 2048;
    unint64_t v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2112;
    v22 = v14;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UIGlomojiAnalyticsDispatcher] Menu Interaction. source: %lu. action: %lu. old: %@, new: %@", (uint8_t *)&v15, 0x2Au);
  }
  unint64_t v4 = +[UIKBAnalyticsDispatcher sharedInstance];
  v5 = [v4 updatedInputMode];
  [(UIGlomojiAnalyticsDispatcher *)self setUpdatedInputMode:v5];

  id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v7 = [v6 _textInputSessionAnalytics];
  unint64_t v8 = [(UIGlomojiAnalyticsDispatcher *)self KBMenuInteractionSource];
  unint64_t v9 = [(UIGlomojiAnalyticsDispatcher *)self KBMenuSelectedAction];
  v10 = [(UIGlomojiAnalyticsDispatcher *)self updatedInputMode];
  [v7 didKBMenuInteraction:v8 selectedAction:v9 newInputMode:v10];
}

- (void)didKBMenuDismiss
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = UIGlomojiLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v6 = [(UIGlomojiAnalyticsDispatcher *)self KBMenuDismissSource];
    v7 = [(UIGlomojiAnalyticsDispatcher *)self originalInputMode];
    int v8 = 134218242;
    unint64_t v9 = v6;
    __int16 v10 = 2112;
    unint64_t v11 = v7;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UIGlomojiAnalyticsDispatcher] Menu Dismiss. source: %lu. old: %@", (uint8_t *)&v8, 0x16u);
  }
  unint64_t v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v5 = [v4 _textInputSessionAnalytics];
  objc_msgSend(v5, "didKBMenuDismiss:", -[UIGlomojiAnalyticsDispatcher KBMenuDismissSource](self, "KBMenuDismissSource"));
}

- (unint64_t)getGlomojiButtonTypeEnumValue
{
  v2 = +[UIKBAnalyticsDispatcher sharedInstance];
  v3 = [v2 glomojiTitle];

  if (([v3 isEqualToString:@"globe"] & 1) != 0
    || ([v3 isEqualToString:@"globe.badge.chevron.backward"] & 1) != 0)
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"emoji.face.grinning"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)getInputMode
{
  v2 = +[UIKeyboardInputModeController sharedInputModeController];
  v3 = [v2 currentInputMode];
  unint64_t v4 = [v3 identifierWithLayouts];

  return v4;
}

- (unint64_t)glomojiType
{
  return self->_glomojiType;
}

- (void)setGlomojiType:(unint64_t)a3
{
  self->_glomojiType = a3;
}

- (BOOL)KBMenuAppeared
{
  return self->_KBMenuAppeared;
}

- (void)setKBMenuAppeared:(BOOL)a3
{
  self->_KBMenuAppeared = a3;
}

- (unint64_t)KBMenuInteractionSource
{
  return self->_KBMenuInteractionSource;
}

- (void)setKBMenuInteractionSource:(unint64_t)a3
{
  self->_KBMenuInteractionSource = a3;
}

- (unint64_t)KBMenuDismissSource
{
  return self->_KBMenuDismissSource;
}

- (void)setKBMenuDismissSource:(unint64_t)a3
{
  self->_KBMenuDismissSource = a3;
}

- (NSString)originalInputMode
{
  return self->_originalInputMode;
}

- (void)setOriginalInputMode:(id)a3
{
}

- (NSString)updatedInputMode
{
  return self->_updatedInputMode;
}

- (void)setUpdatedInputMode:(id)a3
{
}

- (unint64_t)KBMenuSelectedAction
{
  return self->_KBMenuSelectedAction;
}

- (void)setKBMenuSelectedAction:(unint64_t)a3
{
  self->_KBMenuSelectedAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedInputMode, 0);
  objc_storeStrong((id *)&self->_originalInputMode, 0);
}

@end