@interface VUIDocumentContextDataConfirmationDialog
- (NSString)confirmationDialogType;
- (NSString)name;
- (id)jsonData;
- (void)setConfirmationDialogType:(id)a3;
- (void)setName:(id)a3;
@end

@implementation VUIDocumentContextDataConfirmationDialog

- (id)jsonData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", self->_confirmationDialogType, @"type");
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", self->_name, @"nameKey");
  v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)confirmationDialogType
{
  return self->_confirmationDialogType;
}

- (void)setConfirmationDialogType:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_confirmationDialogType, 0);
}

@end