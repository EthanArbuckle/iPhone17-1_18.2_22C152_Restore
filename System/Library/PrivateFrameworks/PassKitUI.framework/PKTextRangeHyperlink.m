@interface PKTextRangeHyperlink
+ (id)hyperlinkSourcesFromApplyFooter:(id)a3 linkTapped:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)linkText;
- (PKTextRangeHyperlink)initWithLinkRange:(_NSRange)a3 action:(id)a4;
- (PKTextRangeHyperlink)initWithLinkText:(id)a3 action:(id)a4;
- (PKTextRangeHyperlink)initWithLinkText:(id)a3 linkRange:(_NSRange)a4 action:(id)a5;
- (_NSRange)linkRange;
- (id)action;
- (unint64_t)hash;
@end

@implementation PKTextRangeHyperlink

- (PKTextRangeHyperlink)initWithLinkText:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    v14.receiver = self;
    v14.super_class = (Class)PKTextRangeHyperlink;
    v9 = [(PKTextRangeHyperlink *)&v14 init];
    if (v9)
    {
      uint64_t v10 = [v8 copy];
      id action = v9->_action;
      v9->_id action = (id)v10;

      objc_storeStrong((id *)&v9->_linkText, a3);
    }
    self = v9;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PKTextRangeHyperlink)initWithLinkRange:(_NSRange)a3 action:(id)a4
{
  length = (PKTextRangeHyperlink *)a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (length)
  {
    v12.receiver = self;
    v12.super_class = (Class)PKTextRangeHyperlink;
    id v8 = [(PKTextRangeHyperlink *)&v12 init];
    if (v8)
    {
      uint64_t v9 = [v7 copy];
      id action = v8->_action;
      v8->_id action = (id)v9;

      v8->_linkRange.NSUInteger location = location;
      v8->_linkRange.length = (NSUInteger)length;
    }
    self = v8;
    length = self;
  }

  return length;
}

- (PKTextRangeHyperlink)initWithLinkText:(id)a3 linkRange:(_NSRange)a4 action:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if ([v9 length]) {
    v11 = [(PKTextRangeHyperlink *)self initWithLinkText:v9 action:v10];
  }
  else {
    v11 = -[PKTextRangeHyperlink initWithLinkRange:action:](self, "initWithLinkRange:action:", location, length, v10);
  }
  objc_super v12 = v11;

  v13 = v12;
  return v13;
}

+ (id)hyperlinkSourcesFromApplyFooter:(id)a3 linkTapped:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v5;
    id obj = [v5 links];
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_super v12 = [v11 linkText];
          [v11 linkRange];
          if ([v12 length] | v13)
          {
            objc_super v14 = [PKTextRangeHyperlink alloc];
            v15 = [v11 linkText];
            uint64_t v16 = [v11 linkRange];
            uint64_t v18 = v17;
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __67__PKTextRangeHyperlink_hyperlinkSourcesFromApplyFooter_linkTapped___block_invoke;
            v26[3] = &unk_1E59CAD68;
            id v19 = v24;
            v26[4] = v11;
            id v27 = v19;
            v20 = -[PKTextRangeHyperlink initWithLinkText:linkRange:action:](v14, "initWithLinkText:linkRange:action:", v15, v16, v18, v26);

            [v6 safelyAddObject:v20];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }

    if ([v6 count]) {
      v21 = (void *)[v6 copy];
    }
    else {
      v21 = 0;
    }

    id v5 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __67__PKTextRangeHyperlink_hyperlinkSourcesFromApplyFooter_linkTapped___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = _Block_copy(self->_action);
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_linkText];
  PKCombinedHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKTextRangeHyperlink *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        uint64_t v7 = _Block_copy(self->_action);
        uint64_t v8 = _Block_copy(v6[2]);
        if (PKEqualObjects())
        {
          uint64_t v9 = (void *)v6[1];
          id v10 = self->_linkText;
          v11 = v9;
          if (v10 == v11)
          {

            goto LABEL_13;
          }
          objc_super v12 = v11;
          if (v10 && v11)
          {
            BOOL v13 = [(NSString *)v10 isEqualToString:v11];

            if (!v13) {
              goto LABEL_20;
            }
LABEL_13:
            BOOL v14 = (const void *)self->_linkRange.location == v6[3] && self->_linkRange.length == (void)v6[4];
            goto LABEL_21;
          }
        }
LABEL_20:
        BOOL v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    BOOL v14 = 0;
  }
LABEL_22:

  return v14;
}

- (NSString)linkText
{
  return self->_linkText;
}

- (_NSRange)linkRange
{
  NSUInteger length = self->_linkRange.length;
  NSUInteger location = self->_linkRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);

  objc_storeStrong((id *)&self->_linkText, 0);
}

@end