@interface ICCROrderedSetElement
+ (id)temporaryElementWithValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICCRDataType)value;
- (ICCROrderedSetElement)initWithProtobufSetElement:(const void *)a3 decoder:(id)a4;
- (ICCRRegisterLatest)index;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeIntoProtobufSetElement:(void *)a3 coder:(id)a4;
- (void)mergeWith:(id)a3;
- (void)setDocument:(id)a3;
- (void)setIndex:(id)a3;
- (void)setValue:(id)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICCROrderedSetElement

+ (id)temporaryElementWithValue:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ICCROrderedSetElement);
  [(ICCROrderedSetElement *)v4 setValue:v3];

  return v4;
}

- (ICCROrderedSetElement)initWithProtobufSetElement:(const void *)a3 decoder:(id)a4
{
  id v6 = a4;
  v7 = [(ICCROrderedSetElement *)self init];
  v8 = v7;
  if (v7)
  {
    int v9 = *((_DWORD *)a3 + 8);
    if ((v9 & 2) != 0)
    {
      uint64_t v10 = *((void *)a3 + 6);
      if (!v10) {
        uint64_t v10 = *(void *)(CRDT::Dictionary_Element::default_instance((CRDT::Dictionary_Element *)v7) + 48);
      }
      uint64_t v11 = [v6 decodeObjectForProtobufObjectID:v10];
      value = v8->_value;
      v8->_value = (ICCRDataType *)v11;

      int v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 8) != 0)
    {
      v13 = [ICCRRegisterLatest alloc];
      v14 = v13;
      uint64_t v15 = *((void *)a3 + 8);
      if (!v15) {
        uint64_t v15 = *(void *)(CRDT::Dictionary_Element::default_instance((CRDT::Dictionary_Element *)v13) + 64);
      }
      uint64_t v16 = [(ICCRRegisterLatest *)v14 initWithProtobufRegisterLatest:v15 decoder:v6];
      index = v8->_index;
      v8->_index = (ICCRRegisterLatest *)v16;
    }
  }

  return v8;
}

- (void)encodeIntoProtobufSetElement:(void *)a3 coder:(id)a4
{
  id v11 = a4;
  id v6 = [(ICCROrderedSetElement *)self value];

  if (v6)
  {
    v7 = [(ICCROrderedSetElement *)self value];
    *((_DWORD *)a3 + 8) |= 2u;
    uint64_t v8 = *((void *)a3 + 6);
    if (!v8) {
      operator new();
    }
    [v11 encodeObject:v7 forObjectID:v8];
  }
  int v9 = [(ICCROrderedSetElement *)self index];
  *((_DWORD *)a3 + 8) |= 8u;
  uint64_t v10 = *((void *)a3 + 8);
  if (!v10) {
    operator new();
  }
  [v9 encodeIntoProtobufRegisterLatest:v10 coder:v11];
}

- (unint64_t)hash
{
  v2 = [(ICCROrderedSetElement *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(ICCROrderedSetElement *)self value];
    id v6 = [v4 value];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ICCROrderedSetElement allocWithZone:a3] init];
  v5 = [(ICCROrderedSetElement *)self value];
  [(ICCROrderedSetElement *)v4 setValue:v5];

  id v6 = [(ICCROrderedSetElement *)self index];
  [(ICCROrderedSetElement *)v4 setIndex:v6];

  return v4;
}

- (void)mergeWith:(id)a3
{
  id v8 = a3;
  id v4 = [(ICCROrderedSetElement *)self index];
  v5 = [v8 index];
  [v4 mergeWith:v5];

  id v6 = [(ICCROrderedSetElement *)self value];
  char v7 = [v8 value];
  [v6 mergeWith:v7];
}

- (void)walkGraph:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  id v4 = [(ICCROrderedSetElement *)self index];
  v6[2](v6, v4);

  v5 = [(ICCROrderedSetElement *)self value];
  v6[2](v6, v5);
}

- (void)setDocument:(id)a3
{
  id v7 = a3;
  id v4 = [(ICCROrderedSetElement *)self value];
  v5 = [v7 localObject:v4];
  value = self->_value;
  self->_value = v5;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ICCROrderedSetElement *)self index];
  id v7 = [(ICCROrderedSetElement *)self value];
  id v8 = [v3 stringWithFormat:@"<%@ %p %@ %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (ICCRDataType)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (ICCRRegisterLatest)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end