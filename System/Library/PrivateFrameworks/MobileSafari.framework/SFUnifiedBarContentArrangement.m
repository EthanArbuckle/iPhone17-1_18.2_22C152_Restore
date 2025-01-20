@interface SFUnifiedBarContentArrangement
- (BOOL)isEqual:(id)a3;
- (NSArray)allContentViews;
- (NSArray)standaloneContentViews;
- (SFUnifiedBarContentArrangement)init;
- (SFUnifiedBarContentArrangement)initWithInlineContentView:(id)a3 standaloneContentViews:(id)a4;
- (SFUnifiedBarContentView)inlineContentView;
@end

@implementation SFUnifiedBarContentArrangement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standaloneContentViews, 0);

  objc_storeStrong((id *)&self->_inlineContentView, 0);
}

- (SFUnifiedBarContentArrangement)initWithInlineContentView:(id)a3 standaloneContentViews:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFUnifiedBarContentArrangement;
  v9 = [(SFUnifiedBarContentArrangement *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inlineContentView, a3);
    uint64_t v11 = [v8 copy];
    standaloneContentViews = v10->_standaloneContentViews;
    v10->_standaloneContentViews = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (SFUnifiedBarContentArrangement)init
{
  return [(SFUnifiedBarContentArrangement *)self initWithInlineContentView:0 standaloneContentViews:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFUnifiedBarContentArrangement *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_inlineContentView == v4->_inlineContentView
      && [(NSArray *)self->_standaloneContentViews isEqualToArray:v4->_standaloneContentViews];
  }

  return v5;
}

- (NSArray)allContentViews
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_inlineContentView);
  [v3 addObjectsFromArray:self->_standaloneContentViews];
  v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (SFUnifiedBarContentView)inlineContentView
{
  return self->_inlineContentView;
}

- (NSArray)standaloneContentViews
{
  return self->_standaloneContentViews;
}

@end