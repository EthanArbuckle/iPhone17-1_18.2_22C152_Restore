@interface TTRITableViewCellWithConditionalAccessibilityActions
- (BOOL)ttriAccessibilityHidesPrivateActions;
- (BOOL)ttriAccessibilityIsTableViewEditing;
- (id)_privateAccessibilityCustomActions;
@end

@implementation TTRITableViewCellWithConditionalAccessibilityActions

- (BOOL)ttriAccessibilityHidesPrivateActions
{
  return 0;
}

- (BOOL)ttriAccessibilityIsTableViewEditing
{
  NSSelectorFromString(&cfstr_Tableview.isa);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v3 = 0;
    goto LABEL_5;
  }
  v3 = [(TTRITableViewCellWithConditionalAccessibilityActions *)self valueForKey:@"_tableView"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_5:
    char v4 = [v3 isEditing];
    goto LABEL_6;
  }
  char v4 = 0;
LABEL_6:

  return v4;
}

- (id)_privateAccessibilityCustomActions
{
  if ([(TTRITableViewCellWithConditionalAccessibilityActions *)self ttriAccessibilityHidesPrivateActions])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TTRITableViewCellWithConditionalAccessibilityActions;
    v3 = [(TTRITableViewCellWithConditionalAccessibilityActions *)&v5 _privateAccessibilityCustomActions];
  }

  return v3;
}

@end