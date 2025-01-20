@interface TUIRenderModelInteractiveText
- (BOOL)showCancel;
- (NSAttributedString)placeholderText;
- (NSString)cancelText;
- (NSString)text;
- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKey:(unint64_t)a14 keyboardAppearance:(unint64_t)a15;
- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKey:(unint64_t)a14 keyboardAppearance:(unint64_t)a15 cancelText:(id)a16 showCancel:(BOOL)a17;
- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKeyType:(id)a14 keyboardAppearance:(unint64_t)a15;
- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKeyType:(id)a14 keyboardAppearance:(unint64_t)a15 cancelText:(id)a16 showCancel:(BOOL)a17;
- (UIEdgeInsets)editingInsets;
- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3;
- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3;
- (unint64_t)_returnKeyTypeForString:(id)a3;
- (unint64_t)keyboardAppearance;
- (unint64_t)returnKeyType;
@end

@implementation TUIRenderModelInteractiveText

- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKey:(unint64_t)a14 keyboardAppearance:(unint64_t)a15
{
  CGFloat right = a10.right;
  CGFloat bottom = a10.bottom;
  CGFloat left = a10.left;
  CGFloat top = a10.top;
  id v26 = a12;
  id v27 = a13;
  LOBYTE(v35) = a8;
  v28 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:actionHandler:viewState:enabled:pressScale:touchInsets:](self, "initWithReuseIdentifier:identifier:style:elementStates:actionHandler:viewState:enabled:pressScale:touchInsets:", a3, a4, a11, a5, a6, a7, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v35);
  v29 = v28;
  if (v28)
  {
    v28->_editingInsets.CGFloat top = top;
    v28->_editingInsets.CGFloat left = left;
    v28->_editingInsets.CGFloat bottom = bottom;
    v28->_editingInsets.CGFloat right = right;
    v30 = (NSAttributedString *)[v26 copy];
    placeholderText = v29->_placeholderText;
    v29->_placeholderText = v30;

    v32 = (NSString *)[v27 copy];
    text = v29->_text;
    v29->_text = v32;

    v29->_returnKeyType = a14;
    v29->_keyboardAppearance = a15;
  }

  return v29;
}

- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKeyType:(id)a14 keyboardAppearance:(unint64_t)a15
{
  CGFloat right = a10.right;
  CGFloat bottom = a10.bottom;
  CGFloat left = a10.left;
  CGFloat top = a10.top;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = v25;
  LOBYTE(v35) = a8;
  v28 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](self, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, a11, a5, 0, a6, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, a7, v35, 0, 0, 0,
          a9);
  v29 = v28;
  if (v28)
  {
    v28->_editingInsets.CGFloat top = top;
    v28->_editingInsets.CGFloat left = left;
    v28->_editingInsets.CGFloat bottom = bottom;
    v28->_editingInsets.CGFloat right = right;
    v30 = (NSAttributedString *)[v24 copy];
    placeholderText = v29->_placeholderText;
    v29->_placeholderText = v30;

    v32 = (NSString *)[v27 copy];
    text = v29->_text;
    v29->_text = v32;

    v29->_returnKeyType = [(TUIRenderModelInteractiveText *)v29 _returnKeyTypeForString:v26];
    v29->_keyboardAppearance = a15;
  }

  return v29;
}

- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKeyType:(id)a14 keyboardAppearance:(unint64_t)a15 cancelText:(id)a16 showCancel:(BOOL)a17
{
  BOOL v17 = a8;
  double right = a10.right;
  double bottom = a10.bottom;
  double left = a10.left;
  double top = a10.top;
  id v28 = a16;
  v29 = -[TUIRenderModelInteractiveText initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:](self, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKeyType:keyboardAppearance:", a3, a4, a5, a6, a7, v17, top, left, bottom, right, a9, a11, a12, a13, a14, a15);
  if (v29)
  {
    v30 = (NSString *)[v28 copy];
    cancelText = v29->_cancelText;
    v29->_cancelText = v30;

    v29->_showCancel = a17;
  }

  return v29;
}

- (TUIRenderModelInteractiveText)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 editingInsets:(UIEdgeInsets)a10 style:(id)a11 placeholderText:(id)a12 text:(id)a13 returnKey:(unint64_t)a14 keyboardAppearance:(unint64_t)a15 cancelText:(id)a16 showCancel:(BOOL)a17
{
  BOOL v17 = a8;
  double right = a10.right;
  double bottom = a10.bottom;
  double left = a10.left;
  double top = a10.top;
  id v28 = a16;
  v29 = -[TUIRenderModelInteractiveText initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:](self, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:", a3, a4, a5, a6, a7, v17, top, left, bottom, right, a9, a11, a12, a13, a14, a15);
  if (v29)
  {
    v30 = (NSString *)[v28 copy];
    cancelText = v29->_cancelText;
    v29->_cancelText = v30;

    v29->_showCancel = a17;
  }

  return v29;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  id v17 = objc_alloc((Class)objc_opt_class());
  v16 = [(TUIRenderModelInteractive *)self reuseIdentifier];
  v5 = [(TUIRenderModelInteractive *)self identifier];
  v6 = [(TUIRenderModelInteractive *)self stateToModel];
  v7 = TUIElementStateRenderModelMapCopyForInitialAppearanceWithFlags(v6, a3);
  v8 = [(TUIRenderModelInteractive *)self actionHandler];
  v9 = [(TUIRenderModelInteractive *)self viewState];
  BOOL v10 = [(TUIRenderModelInteractive *)self enabled];
  v11 = [(TUIRenderModelInteractive *)self name];
  v12 = [(TUIRenderModelInteractive *)self style];
  LOBYTE(v15) = self->_showCancel;
  id v13 = objc_msgSend(v17, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:cancelText:showCancel:", v16, v5, v7, v8, v9, v10, self->_editingInsets.top, self->_editingInsets.left, self->_editingInsets.bottom, self->_editingInsets.right, v11, v12, self->_placeholderText, self->_text, self->_returnKeyType, self->_keyboardAppearance,
          self->_cancelText,
          v15);

  TUIRenderModelCopyProperties(v13, self);
  return v13;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  id v17 = objc_alloc((Class)objc_opt_class());
  v16 = [(TUIRenderModelInteractive *)self reuseIdentifier];
  v5 = [(TUIRenderModelInteractive *)self identifier];
  v6 = [(TUIRenderModelInteractive *)self stateToModel];
  v7 = TUIElementStateRenderModelMapCopyForFinalAppearanceWithFlags(v6, a3);
  v8 = [(TUIRenderModelInteractive *)self actionHandler];
  v9 = [(TUIRenderModelInteractive *)self viewState];
  BOOL v10 = [(TUIRenderModelInteractive *)self enabled];
  v11 = [(TUIRenderModelInteractive *)self name];
  v12 = [(TUIRenderModelInteractive *)self style];
  LOBYTE(v15) = self->_showCancel;
  id v13 = objc_msgSend(v17, "initWithReuseIdentifier:identifier:elementStates:actionHandler:viewState:enabled:name:editingInsets:style:placeholderText:text:returnKey:keyboardAppearance:cancelText:showCancel:", v16, v5, v7, v8, v9, v10, self->_editingInsets.top, self->_editingInsets.left, self->_editingInsets.bottom, self->_editingInsets.right, v11, v12, self->_placeholderText, self->_text, self->_returnKeyType, self->_keyboardAppearance,
          self->_cancelText,
          v15);

  TUIRenderModelCopyProperties(v13, self);
  return v13;
}

- (unint64_t)_returnKeyTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Go"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Google"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Join"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Next"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"Route"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"Search"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"Send"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"Yahoo"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"Done"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"EmergencyCall"])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"Continue"])
  {
    unint64_t v4 = 11;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (UIEdgeInsets)editingInsets
{
  double top = self->_editingInsets.top;
  double left = self->_editingInsets.left;
  double bottom = self->_editingInsets.bottom;
  double right = self->_editingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)cancelText
{
  return self->_cancelText;
}

- (BOOL)showCancel
{
  return self->_showCancel;
}

- (unint64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelText, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_placeholderText, 0);
}

@end