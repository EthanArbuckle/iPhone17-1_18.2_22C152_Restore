@interface OfflineMapsManagementCellModel
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (MapsDebugTableRow)tableRow;
- (OfflineMapsManagementCellModel)init;
- (id)identifier;
- (unint64_t)cellType;
- (unint64_t)hash;
- (void)setCellType:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTableRow:(id)a3;
@end

@implementation OfflineMapsManagementCellModel

- (OfflineMapsManagementCellModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)OfflineMapsManagementCellModel;
  v2 = [(OfflineMapsManagementCellModel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v4 = v2;
  }

  return v3;
}

- (id)identifier
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSNumber numberWithUnsignedInteger:[(OfflineMapsManagementCellModel *)self cellType]];
  objc_super v6 = +[NSString stringWithFormat:@"%@.%@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(OfflineMapsManagementCellModel *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OfflineMapsManagementCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    v7 = [(OfflineMapsManagementCellModel *)v6 identifier];
    v8 = [(OfflineMapsManagementCellModel *)self identifier];
    if (v7 == v8 || [v7 isEqual:v8])
    {
      unsigned int v9 = [(OfflineMapsManagementCellModel *)v6 isEnabled];
      unsigned int v10 = v9 ^ [(OfflineMapsManagementCellModel *)self isEnabled] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)cellType
{
  return self->_cellType;
}

- (void)setCellType:(unint64_t)a3
{
  self->_cellType = a3;
}

- (MapsDebugTableRow)tableRow
{
  return self->_tableRow;
}

- (void)setTableRow:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

@end