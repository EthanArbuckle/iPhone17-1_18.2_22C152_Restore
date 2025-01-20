@interface _UISearchTokenAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)usesTextAttachmentView;
- (UISearchToken)token;
- (_UISearchTokenAttachment)init;
- (_UISearchTokenAttachment)initWithCoder:(id)a3;
- (_UISearchTokenAttachment)initWithData:(id)a3 ofType:(id)a4;
- (_UISearchTokenAttachment)initWithToken:(id)a3;
- (_UISearchTokenAttachmentViewProvider)_viewProvider;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
- (void)detachView:(id)a3 fromParentView:(id)a4;
- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7;
@end

@implementation _UISearchTokenAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISearchTokenAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"must call -initWithToken:" userInfo:0];
  objc_exception_throw(v7);
}

- (_UISearchTokenAttachment)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"must call -initWithToken:" userInfo:0];
  objc_exception_throw(v2);
}

- (_UISearchTokenAttachment)initWithCoder:(id)a3
{
  v4 = +[UISearchToken tokenWithIcon:0 text:&stru_1ED0E84C0];
  id v5 = [(_UISearchTokenAttachment *)self initWithToken:v4];

  return v5;
}

- (_UISearchTokenAttachment)initWithToken:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISearchTokenAttachment;
  id v6 = [(_UISearchTokenAttachment *)&v10 initWithData:0 ofType:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, a3);
    v8 = v7;
  }

  return v7;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  viewProvider = self->_viewProvider;
  if (!viewProvider
    || ([(NSTextAttachmentViewProvider *)viewProvider location],
        v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isEqual:v9],
        v12,
        (v13 & 1) == 0))
  {
    v14 = [_UISearchTokenAttachmentViewProvider alloc];
    v15 = [v10 textLayoutManager];
    v16 = [(_UISearchTokenAttachmentViewProvider *)v14 initWithTextAttachment:self parentView:v8 textLayoutManager:v15 location:v9];
    v17 = self->_viewProvider;
    self->_viewProvider = v16;

    [(NSTextAttachmentViewProvider *)self->_viewProvider setTracksTextAttachmentViewBounds:1];
  }
  v18 = [v10 textLayoutManager];
  [v18 setViewProvider:self->_viewProvider forTextAttachment:self location:v9];
  v19 = self->_viewProvider;

  return v19;
}

- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5
{
  viewProvider = self->_viewProvider;
  if (!viewProvider)
  {
    id v9 = a5;
    id v10 = a3;
    v11 = [(NSTextAttachmentViewProvider *)[_UISearchTokenAttachmentViewProvider alloc] initWithTextAttachment:self parentView:v10 characterIndex:a4 layoutManager:v9];

    v12 = self->_viewProvider;
    self->_viewProvider = v11;

    [(NSTextAttachmentViewProvider *)self->_viewProvider setTracksTextAttachmentViewBounds:1];
    viewProvider = self->_viewProvider;
  }
  return viewProvider;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (has_internal_diagnostics)
  {
    if ((isKindOfClass & 1) == 0)
    {
      v14 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v16 = 138412290;
        id v17 = v9;
        _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Asked to place a token view somewhere we didn't expect (%@)!", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else if ((isKindOfClass & 1) == 0)
  {
    v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &placeView_withFrame_inParentView_characterIndex_layoutManager____s_category)+ 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Asked to place a token view somewhere we didn't expect (%@)!", (uint8_t *)&v16, 0xCu);
    }
  }
  v12 = [v9 textField];
  char v13 = v12;
  if (v12) {
    [v12 _willAddTokenLayoutView:v8];
  }
}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UISearchTokenAttachment;
  [(_UISearchTokenAttachment *)&v12 detachView:v6 fromParentView:v7];
  id v8 = v7;
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v11 = [v10 superview];

      id v10 = (void *)v11;
      if (!v11) {
        goto LABEL_7;
      }
    }
    [v10 _didRemoveTokenLayoutView:v6];
  }
LABEL_7:
}

- (_UISearchTokenAttachmentViewProvider)_viewProvider
{
  return self->_viewProvider;
}

- (UISearchToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
}

@end