@interface PKPaymentAuthorizationLayout
- (BOOL)isAMPPayment;
- (BOOL)isInstallment;
- (BOOL)isPaymentSummaryPinned;
- (BOOL)shouldSuppressTotal;
- (NSString)localizedNavigationTitle;
- (PKPaymentAuthorizationLayout)initWithStyle:(int64_t)a3 paymentRequest:(id)a4;
- (double)contentHorizontalMargin;
- (double)glyphDimension;
- (double)valueLeftMargin;
- (int64_t)style;
- (unint64_t)requestType;
- (unint64_t)requestor;
@end

@implementation PKPaymentAuthorizationLayout

- (PKPaymentAuthorizationLayout)initWithStyle:(int64_t)a3 paymentRequest:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentAuthorizationLayout;
  v7 = [(PKPaymentAuthorizationLayout *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    v7->_contentHorizontalMargin = 16.0;
    if (PKUserInterfaceIdiomSupportsLargeLayouts()) {
      uint64_t v9 = 0x405E000000000000;
    }
    else {
      uint64_t v9 = PKUIGetMinScreenWidthType() ? 0x405BC00000000000 : 0x4058000000000000;
    }
    *(void *)&v8->_valueLeftMargin = v9;
    double v10 = 62.0;
    if (a3 == 1) {
      double v10 = 43.0;
    }
    v8->_glyphDimension = v10;
    v8->_unint64_t requestType = [v6 requestType];
    v8->_requestor = [v6 requestor];
    uint64_t v11 = [v6 localizedNavigationTitle];
    localizedNavigationTitle = v8->_localizedNavigationTitle;
    v8->_localizedNavigationTitle = (NSString *)v11;

    v8->_isAMPPayment = [v6 _isAMPPayment];
    v8->_isInstallment = [v6 requestType] == 5;
    if (v8->_requestType || v8->_isAMPPayment)
    {
      v8->_isPaymentSummaryPinned = [v6 isPaymentSummaryPinned];
      unint64_t requestType = v8->_requestType;
      if (requestType <= 0xD)
      {
        if (((1 << requestType) & 0x2094) != 0) {
          goto LABEL_13;
        }
        if (requestType == 6)
        {
LABEL_16:
          v8->_shouldSuppressTotal = 1;
          goto LABEL_17;
        }
      }
      if (!v8->_isAMPPayment) {
        goto LABEL_17;
      }
LABEL_13:
      if (![v6 suppressTotal]) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
LABEL_17:

  return v8;
}

- (int64_t)style
{
  return self->_style;
}

- (double)contentHorizontalMargin
{
  return self->_contentHorizontalMargin;
}

- (double)valueLeftMargin
{
  return self->_valueLeftMargin;
}

- (double)glyphDimension
{
  return self->_glyphDimension;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (unint64_t)requestor
{
  return self->_requestor;
}

- (BOOL)isAMPPayment
{
  return self->_isAMPPayment;
}

- (BOOL)isInstallment
{
  return self->_isInstallment;
}

- (BOOL)isPaymentSummaryPinned
{
  return self->_isPaymentSummaryPinned;
}

- (NSString)localizedNavigationTitle
{
  return self->_localizedNavigationTitle;
}

- (BOOL)shouldSuppressTotal
{
  return self->_shouldSuppressTotal;
}

- (void).cxx_destruct
{
}

@end