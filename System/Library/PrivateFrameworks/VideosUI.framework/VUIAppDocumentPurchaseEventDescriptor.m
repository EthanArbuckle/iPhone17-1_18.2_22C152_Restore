@interface VUIAppDocumentPurchaseEventDescriptor
- (BOOL)isEqual:(id)a3;
- (NSString)canonicalID;
- (VUIAppDocumentPurchaseEventDescriptor)initWithCanonicalID:(id)a3;
- (VUIAppDocumentPurchaseEventDescriptor)initWithEventType:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (void)setCanonicalID:(id)a3;
@end

@implementation VUIAppDocumentPurchaseEventDescriptor

- (VUIAppDocumentPurchaseEventDescriptor)initWithEventType:(unint64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VUIAppDocumentPurchaseEventDescriptor)initWithCanonicalID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentPurchaseEventDescriptor;
  uint64_t v5 = [(VUIAppDocumentUpdateEventDescriptor *)&v9 initWithEventType:4];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUIAppDocumentUpdateEventDescriptor *)self type];
  id v4 = [(VUIAppDocumentPurchaseEventDescriptor *)self canonicalID];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIAppDocumentPurchaseEventDescriptor *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    unint64_t v7 = [(VUIAppDocumentUpdateEventDescriptor *)self type];
    if (v7 == [(VUIAppDocumentUpdateEventDescriptor *)v6 type])
    {
      v8 = [(VUIAppDocumentPurchaseEventDescriptor *)self canonicalID];
      objc_super v9 = [(VUIAppDocumentPurchaseEventDescriptor *)v6 canonicalID];
      id v10 = v8;
      id v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        char v13 = 1;
      }
      else
      {
        char v13 = 0;
        if (v10 && v11) {
          char v13 = [v10 isEqual:v11];
        }
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentPurchaseEventDescriptor;
  id v4 = [(VUIAppDocumentUpdateEventDescriptor *)&v12 description];
  [v3 addObject:v4];

  unint64_t v5 = NSString;
  uint64_t v6 = [(VUIAppDocumentPurchaseEventDescriptor *)self canonicalID];
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"canonicalID", v6];
  [v3 addObject:v7];

  v8 = NSString;
  objc_super v9 = [v3 componentsJoinedByString:@", "];
  id v10 = [v8 stringWithFormat:@"<%@>", v9];

  return v10;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end