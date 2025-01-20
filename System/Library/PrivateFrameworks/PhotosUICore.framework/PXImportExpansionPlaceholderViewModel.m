@interface PXImportExpansionPlaceholderViewModel
+ (id)sharedInstance;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImportPlaceholderViewModel:(id)a3;
- (NSDate)placeholderDate;
- (PXImportExpansionPlaceholderViewModel)initWithPlaceholderDate:(id)a3;
- (id)description;
- (id)fileName;
- (id)placeholderUUID;
- (int64_t)badgeType;
- (unint64_t)hash;
- (void)setPlaceholderUUID:(id)a3;
@end

@implementation PXImportExpansionPlaceholderViewModel

- (void).cxx_destruct
{
  objc_storeStrong(&self->_placeholderUUID, 0);
  objc_storeStrong((id *)&self->_placeholderDate, 0);
}

- (void)setPlaceholderUUID:(id)a3
{
}

- (id)placeholderUUID
{
  return self->_placeholderUUID;
}

- (NSDate)placeholderDate
{
  return self->_placeholderDate;
}

- (int64_t)badgeType
{
  return 0;
}

- (id)fileName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  v2 = [(PXImportExpansionPlaceholderViewModel *)self placeholderDate];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXImportExpansionPlaceholderViewModel *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PXImportExpansionPlaceholderViewModel *)self isEqualToImportPlaceholderViewModel:v4];
  }

  return v5;
}

- (BOOL)isEqualToImportPlaceholderViewModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXImportItemViewModel *)self kind];
  v6 = [v4 kind];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(PXImportExpansionPlaceholderViewModel *)self placeholderDate];
    v8 = [v4 placeholderDate];
    char v9 = [v7 isEqualToDate:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(PXImportExpansionPlaceholderViewModel *)self placeholderDate];
  v6 = [v3 stringWithFormat:@"<%@:%p expansion placeholder date: %@>", v4, self, v5];

  return v6;
}

- (PXImportExpansionPlaceholderViewModel)initWithPlaceholderDate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXImportExpansionPlaceholderViewModel;
  v6 = [(PXImportItemViewModel *)&v10 initWithKind:@"PXImportItemViewModelKindExpansionPlaceholder" selectable:0];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    id placeholderUUID = v6->_placeholderUUID;
    v6->_id placeholderUUID = (id)v7;

    objc_storeStrong((id *)&v6->_placeholderDate, a3);
  }

  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_75069 != -1) {
    dispatch_once(&sharedInstance_onceToken_75069, &__block_literal_global_75070);
  }
  v2 = (void *)sharedInstance_placeholderModel;
  return v2;
}

void __55__PXImportExpansionPlaceholderViewModel_sharedInstance__block_invoke()
{
  v0 = [PXImportExpansionPlaceholderViewModel alloc];
  id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v1 = [(PXImportExpansionPlaceholderViewModel *)v0 initWithPlaceholderDate:v3];
  v2 = (void *)sharedInstance_placeholderModel;
  sharedInstance_placeholderModel = v1;
}

@end