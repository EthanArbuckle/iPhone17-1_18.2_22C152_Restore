@interface WFEntityPickerDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)userRequestedAllOptions;
- (BOOL)userRequestedOpenApp;
- (WFConcreteRunnableEntry)selectedEntry;
- (WFEntityPickerDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFEntityPickerDialogResponse)initWithCoder:(id)a3;
- (WFEntityPickerDialogResponse)initWithSelectedEntry:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFEntityPickerDialogResponse

- (void).cxx_destruct
{
}

- (WFConcreteRunnableEntry)selectedEntry
{
  return self->_selectedEntry;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFEntityPickerDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(WFEntityPickerDialogResponse *)self selectedEntry];
  [v4 encodeObject:v5 forKey:@"selectedEntry"];
}

- (WFEntityPickerDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFEntityPickerDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedEntry"];
    selectedEntry = v5->_selectedEntry;
    v5->_selectedEntry = (WFConcreteRunnableEntry *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFEntityPickerDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFEntityPickerDialogResponse *)self selectedEntry];
  [v4 encodeObject:v5 forKey:@"selectedEntry"];
}

- (WFEntityPickerDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFEntityPickerDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedEntry"];
    selectedEntry = v5->_selectedEntry;
    v5->_selectedEntry = (WFConcreteRunnableEntry *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)userRequestedOpenApp
{
  v2 = [(WFEntityPickerDialogResponse *)self selectedEntry];
  v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:@"WFEntityPickerDialogResponseOpenAppEntryIdentifier"];

  return v4;
}

- (BOOL)userRequestedAllOptions
{
  v2 = [(WFEntityPickerDialogResponse *)self selectedEntry];
  v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:@"WFEntityPickerDialogResponseChooseEntryIdentifier"];

  return v4;
}

- (WFEntityPickerDialogResponse)initWithSelectedEntry:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFEntityPickerDialogResponse;
  uint64_t v6 = [(WFDialogResponse *)&v10 initWithResponseCode:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_selectedEntry, a3);
    v8 = v7;
  }

  return v7;
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