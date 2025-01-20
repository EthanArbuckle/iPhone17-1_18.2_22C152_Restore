@interface SKUILibraryItem
- (BOOL)isEqual:(id)a3;
- (NSNumber)storeItemIdentifier;
- (NSString)storeFlavorIdentifier;
- (SKUIStoreIdentifier)storeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)description;
- (void)hash;
- (void)setStoreFlavorIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)storeItemIdentifier;
@end

@implementation SKUILibraryItem

- (NSNumber)storeItemIdentifier
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        [(SKUILibraryItem *)v3 storeItemIdentifier];
      }
    }
  }
  v11 = [(SKUILibraryItem *)self storeIdentifier];
  v12 = [v11 itemIdentifier];

  return (NSNumber *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILibraryItem copyWithZone:]();
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_storeFlavorIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SKUIStoreIdentifier *)self->_storeIdentifier copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILibraryItem description]();
  }
  BOOL v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUILibraryItem;
  uint64_t v4 = [(SKUILibraryItem *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: [%@, %@]", v4, self->_storeIdentifier, self->_storeFlavorIdentifier];

  return v5;
}

- (unint64_t)hash
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v3) {
        [(SKUILibraryItem *)v3 hash];
      }
    }
  }
  v11 = [(SKUILibraryItem *)self storeItemIdentifier];
  uint64_t v12 = [v11 hash];
  NSUInteger v13 = [(NSString *)self->_storeFlavorIdentifier hash] ^ v12;
  unint64_t v14 = v13 ^ [(SKUIStoreIdentifier *)self->_storeIdentifier hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUILibraryItem isEqual:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = objc_opt_class();
  if (v13 == objc_opt_class()
    && (storeIdentifier = self->_storeIdentifier) != 0
    && (storeIdentifier == (SKUIStoreIdentifier *)v4[1] || -[SKUIStoreIdentifier isEqual:](storeIdentifier, "isEqual:")))
  {
    storeFlavorIdentifier = self->_storeFlavorIdentifier;
    if (storeFlavorIdentifier == (NSString *)v4[2]) {
      char v14 = 1;
    }
    else {
      char v14 = -[NSString isEqualToString:](storeFlavorIdentifier, "isEqualToString:");
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (SKUIStoreIdentifier)storeIdentifier
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

- (void)storeItemIdentifier
{
}

- (void)copyWithZone:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILibraryItem copyWithZone:]";
}

- (void)description
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILibraryItem description]";
}

- (void)hash
{
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end