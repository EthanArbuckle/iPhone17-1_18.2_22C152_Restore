@interface SUUILibraryItem
- (BOOL)isEqual:(id)a3;
- (NSNumber)storeItemIdentifier;
- (NSString)storeFlavorIdentifier;
- (SUUIStoreIdentifier)storeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setStoreFlavorIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation SUUILibraryItem

- (NSNumber)storeItemIdentifier
{
  v2 = [(SUUILibraryItem *)self storeIdentifier];
  v3 = [v2 itemIdentifier];

  return (NSNumber *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_storeFlavorIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SUUIStoreIdentifier *)self->_storeIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUILibraryItem;
  v4 = [(SUUILibraryItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: [%@, %@]", v4, self->_storeIdentifier, self->_storeFlavorIdentifier];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(SUUILibraryItem *)self storeItemIdentifier];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_storeFlavorIdentifier hash] ^ v4;
  unint64_t v6 = v5 ^ [(SUUIStoreIdentifier *)self->_storeIdentifier hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (storeIdentifier = self->_storeIdentifier) != 0
    && (storeIdentifier == (SUUIStoreIdentifier *)v4[1] || -[SUUIStoreIdentifier isEqual:](storeIdentifier, "isEqual:")))
  {
    storeFlavorIdentifier = self->_storeFlavorIdentifier;
    if (storeFlavorIdentifier == (NSString *)v4[2]) {
      char v6 = 1;
    }
    else {
      char v6 = -[NSString isEqualToString:](storeFlavorIdentifier, "isEqualToString:");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (SUUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)storeFlavorIdentifier
{
  return self->_storeFlavorIdentifier;
}

- (void)setStoreFlavorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFlavorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end