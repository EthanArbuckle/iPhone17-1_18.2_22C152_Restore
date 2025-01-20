@interface PXCNComposeRecipientView
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXCNComposeRecipientView)init;
- (id)addButton;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (id)label;
- (id)recipients;
- (id)text;
- (int64_t)maxRecipients;
- (void)addRecipient:(id)a3;
- (void)addRecipients:(id)a3;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)layoutSubviews;
- (void)removeRecipient:(id)a3;
- (void)removeRecipients:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaxRecipients:(int64_t)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation PXCNComposeRecipientView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalRecipients, 0);
  objc_storeStrong((id *)&self->_recipientTextView, 0);
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4 = a4;
  int64_t v5 = +[PXRecipientTransportUtilities px_recipientKindFromString:v4];
  if (v5) {
    uint64_t v6 = v5 == 2;
  }
  else {
    uint64_t v6 = 5;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F5A138]) initWithContact:0 address:v4 kind:v6];

  return v7;
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v5 = a4;
  v7 = [[PXCNComposeRecipient alloc] initWithRecipient:v5];

  [(NSMutableArray *)self->_internalRecipients removeObject:v7];
  if (self->super._delegateRespondsTo.didRemoveRecipient)
  {
    uint64_t v6 = [(PXComposeRecipientView *)self delegate];
    [v6 composeRecipientView:self didRemoveRecipient:v7];
  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5 = a4;
  v7 = [[PXCNComposeRecipient alloc] initWithRecipient:v5];

  if (v7)
  {
    [(NSMutableArray *)self->_internalRecipients addObject:v7];
    if (self->super._delegateRespondsTo.didAddRecipient)
    {
      uint64_t v6 = [(PXComposeRecipientView *)self delegate];
      [v6 composeRecipientView:self didAddRecipient:v7];
    }
  }
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  if (self->super._delegateRespondsTo.disambiguateRecipient)
  {
    objc_msgSend(a4, "recipient", a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [[PXCNComposeRecipient alloc] initWithRecipient:v7];
    uint64_t v6 = [(PXComposeRecipientView *)self delegate];
    [v6 composeRecipientView:self disambiguateRecipient:v5];
  }
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  if (self->super._delegateRespondsTo.didFinishPickingRecipient)
  {
    id v4 = [(PXComposeRecipientView *)self delegate];
    [v4 composeRecipientViewDidFinishPickingRecipient:self];
  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  if (self->super._delegateRespondsTo.requestAddRecipient)
  {
    id v4 = [(PXComposeRecipientView *)self delegate];
    [v4 composeRecipientViewRequestAddRecipient:self];
  }
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  self->_preferredSize = a4;
  [(PXCNComposeRecipientView *)self invalidateIntrinsicContentSize];
  if (self->super._delegateRespondsTo.didChangeSize)
  {
    id v7 = [(PXComposeRecipientView *)self delegate];
    objc_msgSend(v7, "composeRecipientView:didChangeSize:", self, width, height);
  }
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 length]
    && +[PXRecipientTransportUtilities px_recipientKindFromString:v6])
  {
    [v9 clearText];
    id v7 = [(PXCNComposeRecipientView *)self composeRecipientView:v9 composeRecipientForAddress:v6];
    [v9 addRecipient:v7];
    if (self->super._delegateRespondsTo.didFinishEnteringAddress)
    {
      v8 = [(PXComposeRecipientView *)self delegate];
      [v8 composeRecipientView:self didFinishEnteringAddress:v6];
    }
  }
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  if (self->super._delegateRespondsTo.textDidChange)
  {
    id v5 = a4;
    id v6 = [(PXComposeRecipientView *)self delegate];
    [v6 composeRecipientView:self textDidChange:v5];
  }
}

- (BOOL)resignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)PXCNComposeRecipientView;
  [(PXCNComposeRecipientView *)&v6 resignFirstResponder];
  v3 = [(PXCNComposeRecipientView *)self firstResponder];
  char v4 = [v3 resignFirstResponder];

  return v4;
}

- (BOOL)becomeFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)PXCNComposeRecipientView;
  [(PXCNComposeRecipientView *)&v4 becomeFirstResponder];
  return [(CNComposeRecipientTextView *)self->_recipientTextView becomeFirstResponder];
}

- (id)addButton
{
  return (id)[(CNComposeRecipientTextView *)self->_recipientTextView addButton];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(PXCNComposeRecipientView *)self layoutIfNeeded];
  double height = self->_preferredSize.height;
  double v6 = width;
  result.double height = height;
  result.CGFloat width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)removeRecipients:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)[a3 copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[PXCNComposeRecipientView removeRecipient:](self, "removeRecipient:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addRecipients:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)[a3 copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = PXCNComposeRecipientWithRecipient(*(void **)(*((void *)&v10 + 1) + 8 * v8));
        if (v9) {
          -[PXCNComposeRecipientView addRecipient:](self, "addRecipient:", v9, (void)v10);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)removeRecipient:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v10 = (objc_class *)objc_opt_class();
    long long v9 = NSStringFromClass(v10);
    long long v11 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"PXCNComposeRecipientView.m", 117, @"%@ should be an instance inheriting from %@, but it is %@", @"recipient", v9, v11 object file lineNumber description];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    long long v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"PXCNComposeRecipientView.m", 117, @"%@ should be an instance inheriting from %@, but it is nil", @"recipient", v9 object file lineNumber description];
  }

LABEL_3:
  recipientTextView = self->_recipientTextView;
  uint64_t v6 = [v12 recipient];
  [(CNComposeRecipientTextView *)recipientTextView removeRecipient:v6];

  [(CNComposeRecipientTextView *)self->_recipientTextView clearText];
  [(CNComposeRecipientTextView *)self->_recipientTextView reflow];
}

- (void)addRecipient:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXCNComposeRecipientView.m", 101, @"%@ should be an instance inheriting from %@, but it is %@", @"recipient", v16, v18 object file lineNumber description];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXCNComposeRecipientView.m", 101, @"%@ should be an instance inheriting from %@, but it is nil", @"recipient", v16 object file lineNumber description];
  }

LABEL_3:
  uint64_t v6 = [v5 recipient];
  uint64_t v7 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  int v8 = PXComposeRecipientsContainsComposeRecipient(v7, v6);

  if (v8)
  {
    long long v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      long long v10 = "Ignored attempt to add a recipient again: %@";
LABEL_9:
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else
  {
    long long v11 = [(PXComposeRecipientView *)self usedAddresses];
    id v12 = [v6 address];
    int v13 = [v11 containsObject:v12];

    if (!v13)
    {
      [(CNComposeRecipientTextView *)self->_recipientTextView addRecipient:v6];
      [(CNComposeRecipientTextView *)self->_recipientTextView clearText];
      [(CNComposeRecipientTextView *)self->_recipientTextView reflow];
      goto LABEL_12;
    }
    long long v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      long long v10 = "Ignored attempt to add a used recipient: %@";
      goto LABEL_9;
    }
  }

LABEL_12:
}

- (id)recipients
{
  return self->_internalRecipients;
}

- (void)setSeparatorHidden:(BOOL)a3
{
}

- (int64_t)maxRecipients
{
  return [(CNComposeRecipientTextView *)self->_recipientTextView maxRecipients];
}

- (void)setMaxRecipients:(int64_t)a3
{
}

- (id)label
{
  return (id)[(CNComposeRecipientTextView *)self->_recipientTextView label];
}

- (void)setLabel:(id)a3
{
}

- (id)text
{
  v2 = [(CNComposeRecipientTextView *)self->_recipientTextView textView];
  v3 = [v2 text];

  return v3;
}

- (void)setText:(id)a3
{
  id v12 = a3;
  id v4 = [(CNComposeRecipientTextView *)self->_recipientTextView textView];
  id v5 = [v4 text];

  id v6 = v5;
  uint64_t v7 = v12;
  if (v6 == v12) {
    goto LABEL_5;
  }
  char v8 = [v12 isEqualToString:v6];

  if ((v8 & 1) == 0)
  {
    long long v9 = [(CNComposeRecipientTextView *)self->_recipientTextView textView];
    [v9 setText:v12];

    if (self->super._delegateRespondsTo.textDidChange)
    {
      uint64_t v7 = [(PXComposeRecipientView *)self delegate];
      long long v10 = [(CNComposeRecipientTextView *)self->_recipientTextView textView];
      long long v11 = [v10 text];
      [v7 composeRecipientView:self textDidChange:v11];

LABEL_5:
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXCNComposeRecipientView;
  [(PXCNComposeRecipientView *)&v3 layoutSubviews];
  [(PXCNComposeRecipientView *)self bounds];
  -[CNComposeRecipientTextView setFrame:](self->_recipientTextView, "setFrame:");
}

- (PXCNComposeRecipientView)init
{
  v11.receiver = self;
  v11.super_class = (Class)PXCNComposeRecipientView;
  v2 = [(PXComposeRecipientView *)&v11 init];
  if (v2)
  {
    objc_super v3 = (CNComposeRecipientTextView *)objc_alloc_init(MEMORY[0x1E4F5A160]);
    recipientTextView = v2->_recipientTextView;
    v2->_recipientTextView = v3;

    [(CNComposeRecipientTextView *)v2->_recipientTextView setDelegate:v2];
    [(PXCNComposeRecipientView *)v2 addSubview:v2->_recipientTextView];
    [(CNComposeRecipientTextView *)v2->_recipientTextView intrinsicContentSize];
    CGFloat v6 = v5;
    [MEMORY[0x1E4F5A160] preferredHeight];
    v2->_preferredSize.double width = v6;
    v2->_preferredSize.double height = v7;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    internalRecipients = v2->_internalRecipients;
    v2->_internalRecipients = (NSMutableArray *)v8;
  }
  return v2;
}

@end