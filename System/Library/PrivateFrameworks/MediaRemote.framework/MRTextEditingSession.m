@interface MRTextEditingSession
- (BOOL)isEditing;
- (MRTextEditingAttributes)attributes;
- (MRTextEditingSession)init;
- (MRTextEditingSession)initWithText:(id)a3 attributes:(id)a4;
- (NSString)text;
- (id)_copyWithZone:(objc_class *)a3 usingConcreteClass:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)uniqueIdentifier;
@end

@implementation MRTextEditingSession

- (MRTextEditingSession)initWithText:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRTextEditingSession;
  v8 = [(MRTextEditingSession *)&v14 init];
  if (v8)
  {
    v8->_uniqueIdentifier = arc4random();
    uint64_t v9 = [v6 copy];
    text = v8->_text;
    v8->_text = (NSString *)v9;

    v8->_editing = 0;
    uint64_t v11 = [v7 copy];
    attributes = v8->_attributes;
    v8->_attributes = (MRTextEditingAttributes *)v11;
  }
  return v8;
}

- (MRTextEditingSession)init
{
  return [(MRTextEditingSession *)self initWithText:0 attributes:0];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p text=\"%@\", attribs=%@>", v5, self, self->_text, self->_attributes];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (objc_class *)objc_opt_class();

  return -[MRTextEditingSession _copyWithZone:usingConcreteClass:]((uint64_t)self, v4, v5);
}

- (id)_copyWithZone:(objc_class *)a3 usingConcreteClass:
{
  if (!a1) {
    return 0;
  }
  id v4 = objc_alloc_init(a3);
  *((void *)v4 + 4) = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 8) copy];
  id v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  *((unsigned char *)v4 + 16) = *(unsigned char *)(a1 + 16);
  objc_storeStrong((id *)v4 + 3, *(id *)(a1 + 24));
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();

  return -[MRTextEditingSession _copyWithZone:usingConcreteClass:]((uint64_t)self, v4, v5);
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (MRTextEditingAttributes)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end