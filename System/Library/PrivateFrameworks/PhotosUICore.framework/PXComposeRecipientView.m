@interface PXComposeRecipientView
- (BOOL)isSeparatorHidden;
- (NSArray)recipients;
- (NSSet)usedAddresses;
- (NSString)label;
- (NSString)text;
- (PXComposeRecipientView)init;
- (PXComposeRecipientViewDelegate)delegate;
- (UIButton)addButton;
- (UIFont)baseFont;
- (int64_t)maxRecipients;
- (void)addRecipient:(id)a3;
- (void)addRecipients:(id)a3;
- (void)removeRecipient:(id)a3;
- (void)removeRecipients:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaxRecipients:(int64_t)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setUsedAddresses:(id)a3;
@end

@implementation PXComposeRecipientView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_usedAddresses, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  self->_separatorHidden = a3;
}

- (BOOL)isSeparatorHidden
{
  return self->_separatorHidden;
}

- (void)setMaxRecipients:(int64_t)a3
{
  self->_maxRecipients = a3;
}

- (int64_t)maxRecipients
{
  return self->_maxRecipients;
}

- (void)setUsedAddresses:(id)a3
{
}

- (NSSet)usedAddresses
{
  return self->_usedAddresses;
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (PXComposeRecipientViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXComposeRecipientViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->textDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didFinishEnteringAddress = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->requestAddRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didFinishPickingRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->disambiguateRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didAddRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didRemoveRecipient = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didChangeSize = objc_opt_respondsToSelector() & 1;
  }
}

- (void)removeRecipients:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXComposeRecipientView.m", 38, @"Method %s is a responsibility of subclass %@", "-[PXComposeRecipientView removeRecipients:]", v8 object file lineNumber description];

  abort();
}

- (void)addRecipients:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXComposeRecipientView.m", 34, @"Method %s is a responsibility of subclass %@", "-[PXComposeRecipientView addRecipients:]", v8 object file lineNumber description];

  abort();
}

- (void)removeRecipient:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXComposeRecipientView.m", 30, @"Method %s is a responsibility of subclass %@", "-[PXComposeRecipientView removeRecipient:]", v8 object file lineNumber description];

  abort();
}

- (void)addRecipient:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXComposeRecipientView.m", 26, @"Method %s is a responsibility of subclass %@", "-[PXComposeRecipientView addRecipient:]", v8 object file lineNumber description];

  abort();
}

- (PXComposeRecipientView)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientView;
  return [(PXComposeRecipientView *)&v3 init];
}

@end