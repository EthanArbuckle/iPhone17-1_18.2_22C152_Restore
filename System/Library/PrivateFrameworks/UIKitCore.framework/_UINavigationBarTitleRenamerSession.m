@interface _UINavigationBarTitleRenamerSession
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)_textFieldShouldEndEditingWithText:(id)a3;
- (LPLinkMetadata)iconMetadata;
- (NSString)title;
- (NSUUID)sessionIdentifier;
- (_UINavigationBarTitleRenamer)attachedRenamer;
- (_UINavigationBarTitleRenamerContentView)renamerContentView;
- (_UINavigationBarTitleRenamerSession)initWithBSXPCCoder:(id)a3;
- (_UINavigationBarTitleRenamerSession)initWithSuggestedTitle:(id)a3;
- (_UINavigationBarTitleRenamerSession)initWithSuggestedTitle:(id)a3 iconMetadata:(id)a4;
- (id)_sanitizedTitleForText:(id)a3;
- (id)_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4;
- (id)context;
- (id)createRenamerContentView;
- (id)existingRenamerContentView;
- (void)_textFieldDidEndEditingWithText:(id)a3;
- (void)cancelSession;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)sessionDidEnd;
- (void)sessionDidStartInRenamer:(id)a3;
- (void)setContext:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UINavigationBarTitleRenamerSession

- (_UINavigationBarTitleRenamerSession)initWithSuggestedTitle:(id)a3 iconMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationBarTitleRenamerSession;
  v9 = [(_UINavigationBarTitleRenamerSession *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v9->_iconMetadata, a4);
  }

  return v9;
}

- (_UINavigationBarTitleRenamerSession)initWithSuggestedTitle:(id)a3
{
  return [(_UINavigationBarTitleRenamerSession *)self initWithSuggestedTitle:a3 iconMetadata:0];
}

- (id)_sanitizedTitleForText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(_UINavigationBarTitleRenamerSession *)self title];
  }
  v6 = v5;

  return v6;
}

- (id)existingRenamerContentView
{
  return self->_renamerContentView;
}

- (id)createRenamerContentView
{
  v2 = [[_UINavigationBarTitleRenameTextField alloc] initWithSession:self];
  return v2;
}

- (_UINavigationBarTitleRenamerContentView)renamerContentView
{
  renamerContentView = self->_renamerContentView;
  if (!renamerContentView)
  {
    id v4 = [(_UINavigationBarTitleRenamerSession *)self createRenamerContentView];
    id v5 = self->_renamerContentView;
    self->_renamerContentView = v4;

    renamerContentView = self->_renamerContentView;
  }
  return renamerContentView;
}

- (void)sessionDidStartInRenamer:(id)a3
{
}

- (void)sessionDidEnd
{
}

- (void)cancelSession
{
  p_attachedRenamer = &self->_attachedRenamer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachedRenamer);
  objc_storeWeak((id *)p_attachedRenamer, 0);
  [WeakRetained _sessionDidCancel:self];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_sessionIdentifier forKey:@"_UINavigationBarTitleRenamerSessionIdentifier"];
  [v5 encodeObject:self->_title forKey:@"_UINavigationBarTitleRenamerSessionTitle"];
  iconMetadata = self->_iconMetadata;
  if (iconMetadata) {
    [v5 encodeObject:iconMetadata forKey:@"_UINavigationBarTitleRenamerIconMetadata"];
  }
}

- (_UINavigationBarTitleRenamerSession)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UINavigationBarTitleRenamerSession;
  id v5 = [(_UINavigationBarTitleRenamerSession *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UINavigationBarTitleRenamerSessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UINavigationBarTitleRenamerSessionTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    uint64_t v10 = (void *)_MergedGlobals_1148;
    uint64_t v20 = _MergedGlobals_1148;
    if (!_MergedGlobals_1148)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getLPLinkMetadataClass_block_invoke;
      v16[3] = &unk_1E52D9900;
      v16[4] = &v17;
      __getLPLinkMetadataClass_block_invoke((uint64_t)v16);
      uint64_t v10 = (void *)v18[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v17, 8);
    uint64_t v12 = [v4 decodeObjectOfClass:v11 forKey:@"_UINavigationBarTitleRenamerIconMetadata"];
    iconMetadata = v5->_iconMetadata;
    v5->_iconMetadata = (LPLinkMetadata *)v12;
  }
  return v5;
}

- (_UINavigationBarTitleRenamer)attachedRenamer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachedRenamer);
  return (_UINavigationBarTitleRenamer *)WeakRetained;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (LPLinkMetadata)iconMetadata
{
  return self->_iconMetadata;
}

- (id)context
{
  id WeakRetained = objc_loadWeakRetained(&self->_context);
  return WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak(&self->_context);
  objc_storeStrong((id *)&self->_iconMetadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_attachedRenamer);
  objc_storeStrong((id *)&self->_renamerContentView, 0);
}

- (id)_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4
{
  id v6 = a3;
  id v7 = [(_UINavigationBarTitleRenamerSession *)self attachedRenamer];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 _session:self textFieldWillBeginRenamingWithTitle:v6 selectedRange:a4];
    [(_UINavigationBarTitleRenamerSession *)self setTitle:v9];
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (BOOL)_textFieldShouldEndEditingWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(_UINavigationBarTitleRenamerSession *)self attachedRenamer];
  if (v5)
  {
    id v6 = [(_UINavigationBarTitleRenamerSession *)self _sanitizedTitleForText:v4];
    char v7 = [v5 _session:self textFieldShouldEndRenamingWithTitle:v6];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)_textFieldDidEndEditingWithText:(id)a3
{
  id v6 = a3;
  id v4 = [(_UINavigationBarTitleRenamerSession *)self attachedRenamer];
  if (v4)
  {
    id v5 = [(_UINavigationBarTitleRenamerSession *)self _sanitizedTitleForText:v6];
    [(_UINavigationBarTitleRenamerSession *)self setTitle:v5];
    [v4 _sessionTextFieldDidEndEditing:self];
  }
}

@end