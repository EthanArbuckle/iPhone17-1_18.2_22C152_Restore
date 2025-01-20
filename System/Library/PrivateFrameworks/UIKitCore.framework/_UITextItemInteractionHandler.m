@interface _UITextItemInteractionHandler
- (BOOL)_canPresentMenuWithoutPrimaryAction;
- (_NSRange)range;
- (_UITextContent)textContentView;
- (_UITextInteractableItem)item;
- (_UITextItemInteractionHandler)initWithItem:(id)a3 textContentView:(id)a4;
- (id)_defaultContextMenuConfiguration;
- (id)_defaultMenuForInteractableItem;
- (id)_defaultPrimaryActionForInteractableItem;
- (id)_editMenuConfiguration;
- (id)_menuForInteractableItem;
- (id)_preparedMenuConfigurationWithDefaultMenu:(id)a3;
- (id)contextMenuConfiguration;
- (id)primaryAction;
@end

@implementation _UITextItemInteractionHandler

- (_UITextItemInteractionHandler)initWithItem:(id)a3 textContentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITextItemInteractionHandler;
  v8 = [(_UITextItemInteractionHandler *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v6);
    objc_storeWeak((id *)&v9->_textContentView, v7);
    v10 = [v6 range];
    v9->_range.location = [v10 asRange];
    v9->_range.length = v11;
  }
  return v9;
}

- (id)contextMenuConfiguration
{
  id v3 = [(_UITextItemInteractionHandler *)self _defaultContextMenuConfiguration];
  v4 = [(_UITextItemInteractionHandler *)self _defaultMenuForInteractableItem];
  v5 = [v3 actionProvider];

  if (v5)
  {
    id v6 = [v3 actionProvider];
    uint64_t v7 = v6[2](v6, MEMORY[0x1E4F1CBF0]);

    v4 = (void *)v7;
  }
  v8 = [(_UITextItemInteractionHandler *)self _preparedMenuConfigurationWithDefaultMenu:v4];
  v9 = v8;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57___UITextItemInteractionHandler_contextMenuConfiguration__block_invoke;
    aBlock[3] = &unk_1E52DAFE8;
    id v10 = v8;
    id v21 = v10;
    id v22 = v4;
    NSUInteger v11 = _Block_copy(aBlock);
    v12 = [v3 previewProvider];
    objc_super v13 = [v10 preview];
    v14 = [v13 _previewView];

    if (v14)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57___UITextItemInteractionHandler_contextMenuConfiguration__block_invoke_2;
      v18[3] = &unk_1E52DB010;
      id v19 = v14;
      v15 = _Block_copy(v18);

      v12 = v19;
    }
    else
    {
      v15 = [v10 preview];

      if (v15)
      {
LABEL_9:
        if (v3)
        {
          [v3 setPreviewProvider:v12];
          [v3 setActionProvider:v11];
        }
        else
        {
          id v3 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v12 actionProvider:v11];
        }
        id v3 = v3;

        v16 = v3;
        goto LABEL_13;
      }
    }

    v12 = v15;
    goto LABEL_9;
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (id)_editMenuConfiguration
{
  id v3 = [(_UITextItemInteractionHandler *)self item];
  [v3 location];
  double v5 = v4;
  double v7 = v6;

  v8 = +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v5, v7);
  v9 = [(_UITextItemInteractionHandler *)self item];
  objc_msgSend(v8, "set_preferredElementDisplayMode:", objc_msgSend(v9, "preferredElementDisplayMode"));

  return v8;
}

- (id)_defaultContextMenuConfiguration
{
  return 0;
}

- (id)primaryAction
{
  id v3 = [(_UITextItemInteractionHandler *)self _defaultPrimaryActionForInteractableItem];
  double v4 = [(_UITextItemInteractionHandler *)self item];
  double v5 = [v4 preparedPrimaryActionWithDefaultAction:v3];

  if (!v5)
  {
    if ([(_UITextItemInteractionHandler *)self _canPresentMenuWithoutPrimaryAction])
    {
      double v5 = [(_UITextItemInteractionHandler *)self _menuForInteractableItem];

      if (v5)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __46___UITextItemInteractionHandler_primaryAction__block_invoke;
        v7[3] = &unk_1E52DB038;
        v7[4] = self;
        double v5 = +[UIAction actionWithTitle:&stru_1ED0E84C0 image:0 identifier:@"_UITextItemInteractionHandler.presentMenu.action" handler:v7];
      }
    }
    else
    {
      double v5 = 0;
    }
  }

  return v5;
}

- (id)_preparedMenuConfigurationWithDefaultMenu:(id)a3
{
  id v4 = a3;
  double v5 = [(_UITextItemInteractionHandler *)self item];
  double v6 = [v5 preparedMenuConfiguration];

  if (!v6)
  {
    if (!v4)
    {
      id v4 = [(_UITextItemInteractionHandler *)self _defaultMenuForInteractableItem];
    }
    double v7 = [(_UITextItemInteractionHandler *)self item];
    [v7 prepareMenuConfigurationWithDefaultMenu:v4];
  }
  v8 = [(_UITextItemInteractionHandler *)self item];
  v9 = [v8 preparedMenuConfiguration];

  return v9;
}

- (id)_menuForInteractableItem
{
  id v3 = [(_UITextItemInteractionHandler *)self _preparedMenuConfigurationWithDefaultMenu:0];
  id v4 = [v3 menu];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(_UITextItemInteractionHandler *)self _defaultMenuForInteractableItem];
  }
  double v7 = v6;

  return v7;
}

- (BOOL)_canPresentMenuWithoutPrimaryAction
{
  return 1;
}

- (id)_defaultMenuForInteractableItem
{
  return 0;
}

- (id)_defaultPrimaryActionForInteractableItem
{
  return 0;
}

- (_UITextInteractableItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (_UITextInteractableItem *)WeakRetained;
}

- (_UITextContent)textContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContentView);
  return (_UITextContent *)WeakRetained;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textContentView);
  objc_destroyWeak((id *)&self->_item);
}

@end