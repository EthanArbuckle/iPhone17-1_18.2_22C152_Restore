@interface PKPaymentPreferenceCardEntry
- (BOOL)insetsSeparatorByTextOffset;
- (BOOL)isSelectable;
- (BOOL)shouldShowCardUI;
- (NSString)availabilityString;
- (NSString)displayName;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentPass)pass;
- (PKRemotePaymentInstrument)remotePaymentInstrument;
- (id)actionBlock;
- (void)setActionBlock:(id)a3;
- (void)setAvailabilityString:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setInsetsSeparatorByTextOffset:(BOOL)a3;
- (void)setIsSelectable:(BOOL)a3;
- (void)setPass:(id)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setRemotePaymentInstrument:(id)a3;
- (void)setShouldShowCardUI:(BOOL)a3;
@end

@implementation PKPaymentPreferenceCardEntry

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKRemotePaymentInstrument)remotePaymentInstrument
{
  return self->_remotePaymentInstrument;
}

- (void)setRemotePaymentInstrument:(id)a3
{
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)availabilityString
{
  return self->_availabilityString;
}

- (void)setAvailabilityString:(id)a3
{
}

- (BOOL)shouldShowCardUI
{
  return self->_shouldShowCardUI;
}

- (void)setShouldShowCardUI:(BOOL)a3
{
  self->_shouldShowCardUI = a3;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (void)setIsSelectable:(BOOL)a3
{
  self->_isSelectable = a3;
}

- (BOOL)insetsSeparatorByTextOffset
{
  return self->_insetsSeparatorByTextOffset;
}

- (void)setInsetsSeparatorByTextOffset:(BOOL)a3
{
  self->_insetsSeparatorByTextOffset = a3;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_availabilityString, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_remotePaymentInstrument, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end