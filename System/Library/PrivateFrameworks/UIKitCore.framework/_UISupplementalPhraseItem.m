@interface _UISupplementalPhraseItem
- (NSString)title;
- (_UISupplementalPhraseItem)initWithCoder:(id)a3;
- (_UISupplementalPhraseItem)initWithTISupplementalPhraseItem:(id)a3;
- (_UISupplementalPhraseItem)initWithTISupplementalPhraseItem:(id)a3 icon:(id)a4;
- (_UISupplementalPhraseItem)initWithTitle:(id)a3;
- (_UISupplementalPhraseItem)initWithTitle:(id)a3 icon:(id)a4;
- (id)description;
- (unint64_t)_identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISupplementalPhraseItem

- (_UISupplementalPhraseItem)initWithTISupplementalPhraseItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISupplementalPhraseItem;
  v6 = [(_UISupplementalItem *)&v10 _init];
  v7 = (_UISupplementalPhraseItem *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    v8 = v7;
  }

  return v7;
}

- (_UISupplementalPhraseItem)initWithTISupplementalPhraseItem:(id)a3 icon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISupplementalPhraseItem;
  v9 = [(_UISupplementalItem *)&v14 _init];
  objc_super v10 = (_UISupplementalPhraseItem *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    v11 = (void *)[v8 copy];
    [(_UISupplementalItem *)v10 setIcon:v11];

    v12 = v10;
  }

  return v10;
}

- (_UISupplementalPhraseItem)initWithTitle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISupplementalPhraseItem;
  id v5 = [(_UISupplementalItem *)&v8 _init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FAE440]) initWithTitle:v4];
    id v5 = [(_UISupplementalPhraseItem *)v5 initWithTISupplementalPhraseItem:v6 icon:0];
  }
  return v5;
}

- (_UISupplementalPhraseItem)initWithTitle:(id)a3 icon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UISupplementalPhraseItem;
  objc_super v8 = [(_UISupplementalItem *)&v11 _init];
  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FAE440]) initWithTitle:v6];
    objc_super v8 = [(_UISupplementalPhraseItem *)v8 initWithTISupplementalPhraseItem:v9 icon:v7];
  }
  return v8;
}

- (unint64_t)_identifier
{
  return [self->super._internal identifier];
}

- (NSString)title
{
  return (NSString *)[self->super._internal title];
}

- (_UISupplementalPhraseItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISupplementalPhraseItem;
  id v5 = [(_UISupplementalItem *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unwrappedObject"];
    id internal = v5->super._internal;
    v5->super._id internal = (id)v6;

    objc_super v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UISupplementalPhraseItem;
  id v4 = a3;
  [(_UISupplementalItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->super._internal, @"unwrappedObject", v5.receiver, v5.super_class);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(_UISupplementalPhraseItem *)self title];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; title=\"%@\", identifier=%llu>",
    v4,
    self,
    v5,
  uint64_t v6 = [self->super._internal identifier]);

  return v6;
}

@end