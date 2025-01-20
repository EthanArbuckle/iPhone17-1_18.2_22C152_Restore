@interface SXSmartField
- (SXSmartField)initWithContext:(id)a3 URL:(id)a4 action:(id)a5;
- (id)action;
- (id)copyWithContext:(id)a3;
@end

@implementation SXSmartField

- (SXSmartField)initWithContext:(id)a3 URL:(id)a4 action:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SXSmartField;
  v10 = [(TSWPHyperlinkField *)&v13 initWithContext:a3 url:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong(&v10->_action, a5);
  }

  return v11;
}

- (id)copyWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXSmartField;
  v4 = [(TSWPHyperlinkField *)&v6 copyWithContext:a3];
  objc_storeStrong(v4 + 9, self->_action);
  return v4;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
}

@end