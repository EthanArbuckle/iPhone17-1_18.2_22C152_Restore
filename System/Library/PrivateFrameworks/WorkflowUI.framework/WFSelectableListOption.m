@interface WFSelectableListOption
- (BOOL)isSelected;
- (NSString)displayTitle;
- (WFSelectableListOption)initWithDisplayTitle:(id)a3 value:(id)a4;
- (id)value;
- (void)setSelected:(BOOL)a3;
@end

@implementation WFSelectableListOption

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (id)value
{
  return self->_value;
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (WFSelectableListOption)initWithDisplayTitle:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFTriggerTableViewController.m", 36, @"Invalid parameter not satisfying: %@", @"displayTitle" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFTriggerTableViewController.m", 37, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFSelectableListOption;
  v10 = [(WFSelectableListOption *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    displayTitle = v10->_displayTitle;
    v10->_displayTitle = (NSString *)v11;

    objc_storeStrong(&v10->_value, a4);
    v13 = v10;
  }

  return v10;
}

@end