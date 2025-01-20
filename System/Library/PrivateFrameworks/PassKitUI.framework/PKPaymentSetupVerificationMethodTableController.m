@interface PKPaymentSetupVerificationMethodTableController
- (NSArray)verificationChannels;
- (PKPaymentSetupVerificationMethodTableController)initWithVerificationController:(id)a3;
- (PKPaymentVerificationController)verificationController;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_detailTextLabelForChannel:(id)a3;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)newVerificationRequest;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)selectedIndex;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setVerificationChannels:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation PKPaymentSetupVerificationMethodTableController

- (PKPaymentSetupVerificationMethodTableController)initWithVerificationController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupVerificationMethodTableController;
  v6 = [(PKPaymentSetupVerificationMethodTableController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_verificationController, a3);
  }

  return v7;
}

- (id)defaultHeaderViewTitle
{
  v2 = [(PKPaymentVerificationController *)self->_verificationController pass];
  char v3 = [v2 supportsBarcodePayment];

  if (v3) {
    PKLocalizedAquamanString(&cfstr_AccountVerific.isa);
  }
  else {
  v4 = PKLocalizedPaymentString(&cfstr_CardVerificati.isa);
  }

  return v4;
}

- (id)defaultHeaderViewSubTitle
{
  v2 = [(PKPaymentVerificationController *)self->_verificationController pass];
  if ([v2 supportsBarcodePayment])
  {
    char v3 = [v2 organizationName];
    v4 = PKLocalizedAquamanString(&cfstr_ChooseAccountV.isa, &stru_1EF1B4C70.isa, v3);
  }
  else
  {
    v4 = PKLocalizedPaymentString(&cfstr_ChooseVerifica.isa);
  }

  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_verificationChannels count] != 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_verificationChannels count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    v7 = [[PKActivationMethodTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"PKActivationMethodTableViewCellIdentifier"];
    v8 = self->_sizingCell;
    self->_sizingCell = v7;

    sizingCell = self->_sizingCell;
  }
  [v5 bounds];
  -[PKActivationMethodTableViewCell sizeThatFits:](sizingCell, "sizeThatFits:", v9, 1.79769313e308);
  double v11 = v10;

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PKActivationMethodTableViewCellIdentifier"];
  if (!v7)
  {
    v7 = [[PKActivationMethodTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"PKActivationMethodTableViewCellIdentifier"];
    v8 = PKProvisioningSecondaryBackgroundColor();
    [(PKActivationMethodTableViewCell *)v7 setBackgroundColor:v8];
  }
  double v9 = -[NSArray objectAtIndex:](self->_verificationChannels, "objectAtIndex:", [v6 row]);
  double v10 = [(PKActivationMethodTableViewCell *)v7 textLabel];
  double v11 = [v9 typeDescription];
  [v10 setText:v11];

  v12 = [(PKActivationMethodTableViewCell *)v7 detailTextLabel];
  v13 = [(PKPaymentSetupVerificationMethodTableController *)self _detailTextLabelForChannel:v9];
  [v12 setText:v13];

  uint64_t v14 = [v6 row];
  if (v14 == self->_selectedIndex) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [(PKActivationMethodTableViewCell *)v7 setAccessoryType:v15];

  return v7;
}

- (id)_detailTextLabelForChannel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contactPoint];
  uint64_t v6 = [v4 type];

  if (v6 == 4 && ![v5 length])
  {
    v7 = [(PKPaymentVerificationController *)self->_verificationController pass];
    uint64_t v8 = [v7 localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];

    id v5 = (void *)v8;
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", self->_selectedIndex, objc_msgSend(v6, "section"));
  id v11 = [v7 cellForRowAtIndexPath:v8];

  [v11 setAccessoryType:0];
  double v9 = [v7 cellForRowAtIndexPath:v6];

  [v9 setAccessoryType:3];
  unint64_t v10 = [v6 row];

  self->_selectedIndex = v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  verificationController = self->_verificationController;
  id v6 = a4;
  PKPaymentSetupApplyContextAppearance([(PKPaymentVerificationController *)verificationController context], v6);
}

- (id)newVerificationRequest
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F84D48]);
  id v4 = [(PKPaymentVerificationController *)self->_verificationController pass];
  [v3 setPass:v4];

  id v5 = [(NSArray *)self->_verificationChannels objectAtIndex:self->_selectedIndex];
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 description];
      int v11 = 138412290;
      unint64_t v12 = (unint64_t)v7;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Requesting channel :%@", (uint8_t *)&v11, 0xCu);
    }
    [v3 setChannel:v5];
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t selectedIndex = self->_selectedIndex;
      int v11 = 134217984;
      unint64_t v12 = selectedIndex;
      _os_log_error_impl(&dword_19F450000, v8, OS_LOG_TYPE_ERROR, "Could not find channel at index :%lu@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v3;
}

- (PKPaymentVerificationController)verificationController
{
  return self->_verificationController;
}

- (NSArray)verificationChannels
{
  return self->_verificationChannels;
}

- (void)setVerificationChannels:(id)a3
{
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_unint64_t selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationChannels, 0);
  objc_storeStrong((id *)&self->_verificationController, 0);

  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end