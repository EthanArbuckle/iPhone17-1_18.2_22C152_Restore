@interface _UITextAttachmentInteractionHandler
- (BOOL)_canPresentMenuWithoutPrimaryAction;
- (NSTextAttachment)textAttachment;
- (_UITextAttachmentInteractionHandler)initWithAttachmentItem:(id)a3 textContentView:(id)a4;
- (id)_defaultMenuForInteractableItem;
@end

@implementation _UITextAttachmentInteractionHandler

- (_UITextAttachmentInteractionHandler)initWithAttachmentItem:(id)a3 textContentView:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UITextAttachmentInteractionHandler;
  v7 = [(_UITextItemInteractionHandler *)&v11 initWithItem:v6 textContentView:a4];
  if (v7)
  {
    uint64_t v8 = [v6 attachment];
    textAttachment = v7->_textAttachment;
    v7->_textAttachment = (NSTextAttachment *)v8;
  }
  return v7;
}

- (id)_defaultMenuForInteractableItem
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v2 = [(NSTextAttachment *)self->_textAttachment image];
  if (v2)
  {
    v14 = _UIKitBundle();
    v13 = [v14 localizedStringForKey:@"Copy Image" value:@"Copy Image" table:@"Localizable"];
    v3 = +[UIImage systemImageNamed:@"doc.on.doc"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70___UITextAttachmentInteractionHandler__defaultMenuForInteractableItem__block_invoke;
    v17[3] = &unk_1E52DB038;
    id v4 = v2;
    id v18 = v4;
    v5 = +[UIAction actionWithTitle:v13 image:v3 identifier:0 handler:v17];
    v19[0] = v5;
    id v6 = _UIKitBundle();
    v7 = [v6 localizedStringForKey:@"Save to Camera Roll" value:@"Save to Camera Roll" table:@"Localizable"];
    uint64_t v8 = +[UIImage systemImageNamed:@"square.and.arrow.down"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70___UITextAttachmentInteractionHandler__defaultMenuForInteractableItem__block_invoke_2;
    v15[3] = &unk_1E52DB038;
    id v16 = v4;
    v9 = +[UIAction actionWithTitle:v7 image:v8 identifier:0 handler:v15];
    v19[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    objc_super v11 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"UITextItemDefaultMenuIdentifier" options:0 children:v10];
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (BOOL)_canPresentMenuWithoutPrimaryAction
{
  return 0;
}

- (NSTextAttachment)textAttachment
{
  return self->_textAttachment;
}

- (void).cxx_destruct
{
}

@end