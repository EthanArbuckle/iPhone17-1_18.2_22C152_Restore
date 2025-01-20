@interface PKPayLaterSwitchRow
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOn;
- (BOOL)showSpinner;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKPayLaterSwitchRow)initWithTitle:(id)a3 on:(BOOL)a4 changeHandler:(id)a5;
- (unint64_t)hash;
- (void)_switchValueChanged:(id)a3;
- (void)configureCell:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setOn:(BOOL)a3;
- (void)setShowSpinner:(BOOL)a3;
@end

@implementation PKPayLaterSwitchRow

- (PKPayLaterSwitchRow)initWithTitle:(id)a3 on:(BOOL)a4 changeHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterSwitchRow;
  v10 = [(PKPayLaterSwitchRow *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v10->_on = a4;
    uint64_t v13 = [v9 copy];
    id changeHandler = v10->_changeHandler;
    v10->_id changeHandler = (id)v13;
  }
  return v10;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  [v3 appendString:self->_title];
  if (self->_on) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [NSString stringWithFormat:@"on-%@", v6];
  [v3 appendString:v7];

  if (self->_disabled) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  id v9 = [NSString stringWithFormat:@"disabled-%@", v8];
  [v3 appendString:v9];

  v10 = (void *)[v3 copy];

  return (NSCopying *)v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPayLaterSwitchRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    [v5 addTarget:self action:sel__switchValueChanged_ forControlEvents:4096];
    [v5 setOn:self->_on];
    BOOL v6 = !self->_disabled && !self->_showSpinner;
    [v4 setUserInteractionEnabled:v6];
    BOOL v7 = !self->_disabled && !self->_showSpinner;
    [v5 setEnabled:v7];
    if (self->_showSpinner)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4FB1400]);
      [v8 startAnimating];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v8 placement:1];
      v13[0] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
    else
    {
      id v8 = (id)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v5 placement:1];
      id v12 = v8;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    }

    [v4 setAccessories:v10];
    uint64_t v11 = [v4 defaultContentConfiguration];
    [v11 setText:self->_title];
    [v4 setContentConfiguration:v11];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_title];
  id v4 = _Block_copy(self->_changeHandler);
  [v3 safelyAddObject:v4];

  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterSwitchRow *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = v5;
        title = v6->_title;
        id v8 = self->_title;
        id v9 = title;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
          {
LABEL_17:

LABEL_18:
            goto LABEL_19;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_18;
          }
        }
        id v8 = (NSString *)_Block_copy(self->_changeHandler);
        v10 = _Block_copy(v6->_changeHandler);
        LOBYTE(v11) = PKEqualObjects()
                   && self->_on == v6->_on
                   && self->_disabled == v6->_disabled
                   && self->_showSpinner == v6->_showSpinner;
        goto LABEL_17;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_19:

  return v11;
}

- (void)_switchValueChanged:(id)a3
{
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isOn"));
  id changeHandler = (void (**)(void))self->_changeHandler;
  if (changeHandler)
  {
    BOOL v6 = v4;
    changeHandler[2]();
    id v4 = v6;
  }
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (void)setOn:(BOOL)a3
{
  self->_on = a3;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_changeHandler, 0);
}

@end