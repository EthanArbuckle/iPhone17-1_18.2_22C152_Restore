@interface SUUIBuyButtonDescriptor
- (BOOL)canPerformLocalActionWithItemState:(id)a3;
- (BOOL)canPersonalizeUsingItemState:(id)a3;
- (BOOL)highlighted;
- (BOOL)shouldSuppressCloudRestore;
- (BOOL)shouldSuppressEnabled;
- (BOOL)showingConfirmation;
- (BOOL)showsUniversal;
- (NSString)buttonText;
- (NSString)confirmationText;
- (NSString)variantIdentifier;
- (SUUIStoreIdentifier)storeIdentifier;
- (int64_t)buttonType;
- (int64_t)itemIdentifier;
- (int64_t)progressType;
- (unint64_t)elementType;
- (void)setButtonText:(id)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setConfirmationText:(id)a3;
- (void)setElementType:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItemIdentifier:(int64_t)a3;
- (void)setProgressType:(int64_t)a3;
- (void)setShouldSuppressCloudRestore:(BOOL)a3;
- (void)setShouldSuppressEnabled:(BOOL)a3;
- (void)setShowingConfirmation:(BOOL)a3;
- (void)setShowsUniversal:(BOOL)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setVariantIdentifier:(id)a3;
@end

@implementation SUUIBuyButtonDescriptor

- (void)setButtonText:(id)a3
{
  if (self->_buttonText != a3)
  {
    v4 = (NSString *)[a3 copy];
    buttonText = self->_buttonText;
    self->_buttonText = v4;
    MEMORY[0x270F9A758](v4, buttonText);
  }
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (void)setConfirmationText:(id)a3
{
  if (self->_confirmationText != a3)
  {
    v4 = (NSString *)[a3 copy];
    confirmationText = self->_confirmationText;
    self->_confirmationText = v4;
    MEMORY[0x270F9A758](v4, confirmationText);
  }
}

- (void)setElementType:(unint64_t)a3
{
  self->_elementType = a3;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (void)setStoreIdentifier:(id)a3
{
  if (self->_storeIdentifier != a3)
  {
    v4 = (SUUIStoreIdentifier *)[a3 copy];
    storeIdentifier = self->_storeIdentifier;
    self->_storeIdentifier = v4;
    MEMORY[0x270F9A758](v4, storeIdentifier);
  }
}

- (void)setVariantIdentifier:(id)a3
{
  if (self->_variantIdentifier != a3)
  {
    v4 = (NSString *)[a3 copy];
    variantIdentifier = self->_variantIdentifier;
    self->_variantIdentifier = v4;
    MEMORY[0x270F9A758](v4, variantIdentifier);
  }
}

- (BOOL)canPersonalizeUsingItemState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_buttonType > 3uLL) {
    goto LABEL_9;
  }
  int64_t itemIdentifier = self->_itemIdentifier;
  v7 = [v4 itemIdentifier];
  uint64_t v8 = [v7 longLongValue];

  if (itemIdentifier != v8) {
    goto LABEL_9;
  }
  storeIdentifier = self->_storeIdentifier;
  if (!storeIdentifier
    || ([v5 storeIdentifier],
        v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = [(SUUIStoreIdentifier *)storeIdentifier isEqual:v10],
        v10,
        v11))
  {
    v12 = [v5 variantIdentifier];
    uint64_t v13 = [(SUUIBuyButtonDescriptor *)self variantIdentifier];
    v14 = (void *)v13;
    char v15 = 1;
    if (v12 && v13) {
      char v15 = [v12 isEqualToString:v13];
    }
  }
  else
  {
LABEL_9:
    char v15 = 0;
  }

  return v15;
}

- (BOOL)canPerformLocalActionWithItemState:(id)a3
{
  id v4 = a3;
  if ([(SUUIBuyButtonDescriptor *)self canPersonalizeUsingItemState:v4])
  {
    BOOL v5 = self->_buttonType != 2;
    int v6 = v5 ^ [v4 activeStateIsPreview];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (SUUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)showingConfirmation
{
  return self->_showingConfirmation;
}

- (void)setShowingConfirmation:(BOOL)a3
{
  self->_showingConfirmation = a3;
}

- (int64_t)progressType
{
  return self->_progressType;
}

- (void)setProgressType:(int64_t)a3
{
  self->_progressType = a3;
}

- (BOOL)showsUniversal
{
  return self->_showsUniversal;
}

- (void)setShowsUniversal:(BOOL)a3
{
  self->_showsUniversal = a3;
}

- (BOOL)shouldSuppressEnabled
{
  return self->_shouldSuppressEnabled;
}

- (void)setShouldSuppressEnabled:(BOOL)a3
{
  self->_shouldSuppressEnabled = a3;
}

- (BOOL)shouldSuppressCloudRestore
{
  return self->_shouldSuppressCloudRestore;
}

- (void)setShouldSuppressCloudRestore:(BOOL)a3
{
  self->_shouldSuppressCloudRestore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
}

@end