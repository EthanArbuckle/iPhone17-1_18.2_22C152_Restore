@interface _TUILinkEntityReferencePath
- (TUIIdentifier)identifier;
- (_TUILinkEntityReferencePath)initWithIdentifier:(id)a3 parent:(id)a4;
- (_TUILinkEntityReferencePath)parent;
@end

@implementation _TUILinkEntityReferencePath

- (_TUILinkEntityReferencePath)initWithIdentifier:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUILinkEntityReferencePath;
  v9 = [(_TUILinkEntityReferencePath *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_parent, a4);
  }

  return v10;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (_TUILinkEntityReferencePath)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end