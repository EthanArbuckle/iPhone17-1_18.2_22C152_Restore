@interface WFChooseFromListDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSArray)selectedItems;
- (NSString)description;
- (WFChooseFromListDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFChooseFromListDialogResponse)initWithCoder:(id)a3;
- (WFChooseFromListDialogResponse)initWithItems:(id)a3 cancelled:(BOOL)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFChooseFromListDialogResponse

- (void).cxx_destruct
{
}

- (NSArray)selectedItems
{
  return self->_selectedItems;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFChooseFromListDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(WFChooseFromListDialogResponse *)self selectedItems];
  [v4 encodeCollection:v5 forKey:@"selectedItems"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogResponse isCancelled](self, "isCancelled"), @"cancelled");
}

- (WFChooseFromListDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFChooseFromListDialogResponse;
  v5 = [(WFDialogResponse *)&v11 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"selectedItems"];
    selectedItems = v5->_selectedItems;
    v5->_selectedItems = (NSArray *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFChooseFromListDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFChooseFromListDialogResponse *)self selectedItems];
  [v4 encodeObject:v5 forKey:@"selectedItems"];
}

- (WFChooseFromListDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFChooseFromListDialogResponse;
  v5 = [(WFDialogResponse *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"selectedItems"];
    selectedItems = v5->_selectedItems;
    v5->_selectedItems = (NSArray *)v9;

    objc_super v11 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [(WFChooseFromListDialogResponse *)self selectedItems];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  v8 = [v3 stringWithFormat:@"<%@: %p, selectedItems: %@, cancelled: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (WFChooseFromListDialogResponse)initWithItems:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFChooseFromListDialogResponse;
  v8 = [(WFDialogResponse *)&v12 initWithCancelled:v4];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_selectedItems, a3);
    v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end