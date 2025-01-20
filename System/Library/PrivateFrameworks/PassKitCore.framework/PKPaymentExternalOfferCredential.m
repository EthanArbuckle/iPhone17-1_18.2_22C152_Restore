@interface PKPaymentExternalOfferCredential
- (NSString)criteriaIdentifier;
- (NSURL)passThumbnailImageURL;
- (PKPaymentExternalOfferCredential)initWithSharingInstanceIdentifier:(id)a3 passThumbnailImageURL:(id)a4 criteriaIdentifier:(id)a5;
@end

@implementation PKPaymentExternalOfferCredential

- (PKPaymentExternalOfferCredential)initWithSharingInstanceIdentifier:(id)a3 passThumbnailImageURL:(id)a4 criteriaIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentExternalOfferCredential;
  v11 = [(PKPaymentShareableCredential *)&v14 initWithProvisioningSharingIdentifier:a3 isBackgroundProvisioning:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_passThumbnailImageURL, a4);
    objc_storeStrong((id *)&v12->_criteriaIdentifier, a5);
    [(PKPaymentCredential *)v12 setCardType:1];
    [(PKPaymentShareableCredential *)v12 setSource:11];
  }

  return v12;
}

- (NSURL)passThumbnailImageURL
{
  return self->_passThumbnailImageURL;
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_passThumbnailImageURL, 0);
}

@end