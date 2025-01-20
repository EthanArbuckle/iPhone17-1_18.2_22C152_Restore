@interface PLPillContentItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isLikePillContentItem:(id)a3;
- (BOOL)isSolo;
- (NSAttributedString)attributedText;
- (NSString)_identifier;
- (NSString)text;
- (PLPillContentItem)initWithAccessoryView:(id)a3;
- (PLPillContentItem)initWithAttributedText:(id)a3;
- (PLPillContentItem)initWithAttributedText:(id)a3 style:(unint64_t)a4;
- (PLPillContentItem)initWithAttributedText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5;
- (PLPillContentItem)initWithText:(id)a3;
- (PLPillContentItem)initWithText:(id)a3 style:(unint64_t)a4;
- (PLPillContentItem)initWithText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5;
- (PLPillContentItem)itemWithAttributedText:(id)a3;
- (PLPillContentItem)itemWithAttributedText:(id)a3 style:(unint64_t)a4;
- (PLPillContentItem)itemWithAttributedText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5;
- (PLPillContentItem)itemWithStyle:(unint64_t)a3;
- (PLPillContentItem)itemWithText:(id)a3;
- (PLPillContentItem)itemWithText:(id)a3 style:(unint64_t)a4;
- (PLPillContentItem)itemWithText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5;
- (PLPillContentWrapperView)wrapperView;
- (UIView)accessoryView;
- (id)_initWithIdentifier:(id)a3 text:(id)a4 style:(unint64_t)a5 accessoryView:(id)a6 solo:(BOOL)a7;
- (id)debugDescription;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)soloItem;
- (unint64_t)hash;
- (unint64_t)style;
- (void)setWrapperView:(id)a3;
- (void)updateWithContentItem:(id)a3;
@end

@implementation PLPillContentItem

- (PLPillContentItem)initWithText:(id)a3
{
  return (PLPillContentItem *)[(PLPillContentItem *)self _initWithIdentifier:0 text:a3 style:1 accessoryView:0 solo:0];
}

- (PLPillContentItem)initWithAttributedText:(id)a3
{
  return (PLPillContentItem *)[(PLPillContentItem *)self _initWithIdentifier:0 text:a3 style:1 accessoryView:0 solo:0];
}

- (PLPillContentItem)initWithText:(id)a3 style:(unint64_t)a4
{
  return (PLPillContentItem *)[(PLPillContentItem *)self _initWithIdentifier:0 text:a3 style:a4 accessoryView:0 solo:0];
}

- (PLPillContentItem)initWithAttributedText:(id)a3 style:(unint64_t)a4
{
  return (PLPillContentItem *)[(PLPillContentItem *)self _initWithIdentifier:0 text:a3 style:a4 accessoryView:0 solo:0];
}

- (PLPillContentItem)initWithAccessoryView:(id)a3
{
  return (PLPillContentItem *)[(PLPillContentItem *)self _initWithIdentifier:0 text:&stru_1F334C238 style:1 accessoryView:a3 solo:0];
}

- (PLPillContentItem)initWithText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5
{
  return (PLPillContentItem *)[(PLPillContentItem *)self _initWithIdentifier:0 text:a3 style:a4 accessoryView:a5 solo:0];
}

- (PLPillContentItem)initWithAttributedText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5
{
  return (PLPillContentItem *)[(PLPillContentItem *)self _initWithIdentifier:0 text:a3 style:a4 accessoryView:a5 solo:0];
}

- (id)_initWithIdentifier:(id)a3 text:(id)a4 style:(unint64_t)a5 accessoryView:(id)a6 solo:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PLPillContentItem;
  v15 = [(PLPillContentItem *)&v23 init];
  if (v15)
  {
    if (v12)
    {
      uint64_t v16 = [v12 copy];
      identifier = v15->_identifier;
      v15->_identifier = (NSString *)v16;
    }
    else
    {
      identifier = objc_opt_new();
      uint64_t v18 = [identifier UUIDString];
      v19 = v15->_identifier;
      v15->_identifier = (NSString *)v18;
    }
    uint64_t v20 = [v13 copy];
    id text = v15->_text;
    v15->_id text = (id)v20;

    v15->_style = a5;
    objc_storeStrong((id *)&v15->_accessoryView, a6);
    v15->_solo = a7;
  }

  return v15;
}

- (NSString)text
{
  id text = self->_text;
  uint64_t v3 = objc_opt_class();
  id v4 = text;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (NSAttributedString)attributedText
{
  id text = self->_text;
  uint64_t v3 = objc_opt_class();
  id v4 = text;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return (NSAttributedString *)v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_identifier];
  id v5 = (id)[v3 appendUnsignedInteger:self->_style];
  id v6 = (id)[v3 appendObject:self->_accessoryView];
  id v7 = (id)[v3 appendBool:self->_solo];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(PLPillContentItem *)self isLikePillContentItem:v5])
    {
      id v6 = [v5 text];
      if (BSEqualStrings() && (unint64_t style = self->_style, style == [v5 style]))
      {
        accessoryView = self->_accessoryView;
        v9 = [v5 accessoryView];
        if (accessoryView == v9)
        {
          int solo = self->_solo;
          BOOL v10 = solo == [v5 isSolo];
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isLikePillContentItem:(id)a3
{
  identifier = self->_identifier;
  id v4 = [a3 _identifier];
  LOBYTE(identifier) = [(NSString *)identifier isEqualToString:v4];

  return (char)identifier;
}

- (PLPillContentItem)itemWithText:(id)a3
{
  id v4 = a3;
  id v5 = [[PLPillContentItem alloc] _initWithIdentifier:self->_identifier text:v4 style:self->_style accessoryView:self->_accessoryView solo:0];

  return (PLPillContentItem *)v5;
}

- (PLPillContentItem)itemWithAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [[PLPillContentItem alloc] _initWithIdentifier:self->_identifier text:v4 style:self->_style accessoryView:self->_accessoryView solo:0];

  return (PLPillContentItem *)v5;
}

- (PLPillContentItem)itemWithStyle:(unint64_t)a3
{
  id v3 = [[PLPillContentItem alloc] _initWithIdentifier:self->_identifier text:self->_text style:a3 accessoryView:self->_accessoryView solo:0];
  return (PLPillContentItem *)v3;
}

- (PLPillContentItem)itemWithText:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[PLPillContentItem alloc] _initWithIdentifier:self->_identifier text:v6 style:a4 accessoryView:self->_accessoryView solo:0];

  return (PLPillContentItem *)v7;
}

- (PLPillContentItem)itemWithAttributedText:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[PLPillContentItem alloc] _initWithIdentifier:self->_identifier text:v6 style:a4 accessoryView:self->_accessoryView solo:0];

  return (PLPillContentItem *)v7;
}

- (PLPillContentItem)itemWithText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PLPillContentItem alloc] _initWithIdentifier:self->_identifier text:v9 style:a4 accessoryView:v8 solo:0];

  return (PLPillContentItem *)v10;
}

- (PLPillContentItem)itemWithAttributedText:(id)a3 style:(unint64_t)a4 accessoryView:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PLPillContentItem alloc] _initWithIdentifier:self->_identifier text:v9 style:a4 accessoryView:v8 solo:0];

  return (PLPillContentItem *)v10;
}

- (id)debugDescription
{
  return [(PLPillContentItem *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(PLPillContentItem *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PLPillContentItem_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6B5FC08;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __59__PLPillContentItem_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 48) withName:@"identifier" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:@"text" skipIfEmpty:1];
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 32) withName:@"style"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"accessoryView" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"solo" ifEqualTo:1];
}

- (unint64_t)style
{
  return self->_style;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (NSString)_identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong(&self->_text, 0);
  objc_destroyWeak((id *)&self->_wrapperView);
}

- (PLPillContentWrapperView)wrapperView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperView);
  return (PLPillContentWrapperView *)WeakRetained;
}

- (void)setWrapperView:(id)a3
{
  id obj = a3;
  p_wrapperView = &self->_wrapperView;
  id WeakRetained = objc_loadWeakRetained((id *)p_wrapperView);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_wrapperView, obj);
    id v6 = obj;
  }
}

- (BOOL)isSolo
{
  return self->_solo;
}

- (id)soloItem
{
  id v2 = [[PLPillContentItem alloc] _initWithIdentifier:self->_identifier text:self->_text style:self->_style accessoryView:self->_accessoryView solo:1];
  return v2;
}

- (void)updateWithContentItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPillContentItem *)self wrapperView];
  [v5 updateWithContentItem:v4];
}

@end