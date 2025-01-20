@interface PKCloudRecordPassCatalog
+ (BOOL)supportsSecureCoding;
- (PKCatalog)catalog;
- (PKCloudRecordPassCatalog)initWithCoder:(id)a3;
- (id)_descriptionWithIncludeItem:(BOOL)a3;
- (id)description;
- (id)descriptionWithItem:(BOOL)a3;
- (id)item;
- (int64_t)compare:(id)a3;
- (void)applyCloudRecordObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCatalog:(id)a3;
@end

@implementation PKCloudRecordPassCatalog

- (id)item
{
  return self->_catalog;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordPassCatalog)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordPassCatalog;
  v5 = [(PKCloudRecordObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"catalog"];
    catalog = v5->_catalog;
    v5->_catalog = (PKCatalog *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordPassCatalog;
  id v4 = a3;
  [(PKCloudRecordObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_catalog, @"catalog", v5.receiver, v5.super_class);
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v5 = [(PKCloudRecordPassCatalog *)self catalog];
    uint64_t v6 = [v5 description];
    v7 = [v4 catalog];
    v8 = [v7 description];
    int64_t v9 = [v6 compare:v8];
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (id)descriptionWithItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = -[PKCloudRecordPassCatalog _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordPassCatalog;
  uint64_t v6 = [(PKCloudRecordObject *)&v8 descriptionWithItem:v3];
  [v5 appendFormat:@"\n%@", v6];

  return v5;
}

- (id)description
{
  BOOL v3 = [(PKCloudRecordPassCatalog *)self _descriptionWithIncludeItem:0];
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordPassCatalog;
  id v4 = [(PKCloudRecordObject *)&v6 description];
  [v3 appendFormat:@"\n%@", v4];

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x1E4F28E78] string];
  objc_super v6 = v5;
  if (self->_catalog)
  {
    if (v3) {
      [v5 appendFormat:@"catalog: %@", self->_catalog];
    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", @"No associated pass catalog in database\n", v8);
  }
  return v6;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordPassCatalog;
    [(PKCloudRecordObject *)&v10 applyCloudRecordObject:v4];
    id v5 = v4;
    objc_super v6 = v5;
    if (!self->_catalog)
    {
      v7 = [v5 catalog];

      if (v7)
      {
        uint64_t v8 = [v6 catalog];
        catalog = self->_catalog;
        self->_catalog = v8;
      }
    }
  }
}

- (PKCatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end