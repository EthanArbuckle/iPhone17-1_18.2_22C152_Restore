@interface PKPaymentRequest
+ (BOOL)supportsSecureCoding;
+ (NSArray)availableNetworks;
+ (NSError)paymentBillingAddressInvalidErrorWithKey:(NSString *)postalAddressKey localizedDescription:(NSString *)localizedDescription;
+ (NSError)paymentContactInvalidErrorWithContactField:(PKContactField)field localizedDescription:(NSString *)localizedDescription;
+ (NSError)paymentCouponCodeExpiredErrorWithLocalizedDescription:(NSString *)localizedDescription;
+ (NSError)paymentCouponCodeInvalidErrorWithLocalizedDescription:(NSString *)localizedDescription;
+ (NSError)paymentShippingAddressInvalidErrorWithKey:(NSString *)postalAddressKey localizedDescription:(NSString *)localizedDescription;
+ (NSError)paymentShippingAddressUnserviceableErrorWithLocalizedDescription:(NSString *)localizedDescription;
+ (PKPaymentRequest)requestWithProtobuf:(id)a3;
+ (id)errorFromDictionary:(id)a3;
+ (int64_t)version;
- (ABRecordRef)billingAddress;
- (ABRecordRef)shippingAddress;
- (AKAppleIDAuthenticationContext)appleIDAuthenticationContext;
- (BOOL)_isAMPApplePayClassicRequest;
- (BOOL)_isAMPPayment;
- (BOOL)_isPSD2StyleRequest;
- (BOOL)_isPVKRequest;
- (BOOL)_shouldUseAmpEnrollmentPinning;
- (BOOL)accountPaymentSupportsPeerPayment;
- (BOOL)accountPaymentUsePeerPaymentBalance;
- (BOOL)deviceSupportsPeerPaymentAccountPayment;
- (BOOL)disablePasscodeFallback;
- (BOOL)expectsMerchantSession;
- (BOOL)isAccountServiceTransferRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentRequest:(id)a3;
- (BOOL)isMultiTokenRequest;
- (BOOL)isPayLaterPaymentRequest;
- (BOOL)isPaymentSummaryPinned;
- (BOOL)isPeerPaymentRequest;
- (BOOL)isServiceProviderPaymentRequest;
- (BOOL)isShippingEditable;
- (BOOL)isVirtualCardEnrollmentRequest;
- (BOOL)isVirtualCardRefreshRequest;
- (BOOL)isVirtualCardRequest;
- (BOOL)requiresAddressPrecision;
- (BOOL)respectSupportedNetworksOrder;
- (BOOL)shouldUseMerchantSession;
- (BOOL)supportsCouponCode;
- (BOOL)supportsInstantFundsIn;
- (BOOL)suppressTotal;
- (BOOL)useLocationBasedAuthorization;
- (NSArray)bankAccounts;
- (NSArray)multiTokenContexts;
- (NSArray)paymentContentItems;
- (NSArray)paymentSummaryItems;
- (NSArray)shippingMethods;
- (NSArray)supportedNetworks;
- (NSArray)thumbnailURLs;
- (NSData)applicationData;
- (NSData)externalizedContext;
- (NSDate)paymentDate;
- (NSDictionary)clientAnalyticsParameters;
- (NSDictionary)clientViewSourceParameter;
- (NSSet)requiredBillingContactFields;
- (NSSet)requiredShippingContactFields;
- (NSSet)supportedCountries;
- (NSString)CTDataConnectionServiceType;
- (NSString)analyticsPageTag;
- (NSString)analyticsProductType;
- (NSString)analyticsSubject;
- (NSString)boundInterfaceIdentifier;
- (NSString)clientViewSourceIdentifier;
- (NSString)countryCode;
- (NSString)couponCode;
- (NSString)currencyCode;
- (NSString)hashedMerchantIdentifier;
- (NSString)localizedAuthorizingTitle;
- (NSString)localizedBiometricConfirmationTitle;
- (NSString)localizedBiometricRetryMessage;
- (NSString)localizedCallbackErrorMessage;
- (NSString)localizedCallbackErrorTitle;
- (NSString)localizedConfirmationTitle;
- (NSString)localizedErrorMessage;
- (NSString)localizedNavigationTitle;
- (NSString)localizedPasswordButtonTitle;
- (NSString)localizedSummaryItemsTitle;
- (NSString)localizedUnboundBiometricMessage;
- (NSString)merchantIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)remoteNetworkRequestPaymentTopicID;
- (NSString)shippingEditableMessage;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)sourceApplicationSecondaryIdentifier;
- (NSString)userAgent;
- (NSTimeZone)paymentTimeZone;
- (NSURL)originatingURL;
- (PKAddressField)requiredBillingAddressFields;
- (PKAddressField)requiredShippingAddressFields;
- (PKApplePayLaterAvailability)applePayLaterAvailability;
- (PKApplePayTrustSignatureRequest)applePayTrustSignatureRequest;
- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest;
- (PKContact)billingContact;
- (PKContact)shippingContact;
- (PKDeferredPaymentRequest)deferredPaymentRequest;
- (PKMerchantCapability)merchantCapabilities;
- (PKPaymentInstallmentConfiguration)installmentConfiguration;
- (PKPaymentMerchantSession)merchantSession;
- (PKPaymentRequest)init;
- (PKPaymentRequest)initWithCoder:(id)a3;
- (PKPaymentRequest)initWithDictionary:(id)a3 error:(id *)a4;
- (PKRecurringPaymentRequest)recurringPaymentRequest;
- (PKShippingContactEditingMode)shippingContactEditingMode;
- (PKShippingMethods)availableShippingMethods;
- (PKShippingType)shippingType;
- (__SecAccessControl)accesssControlRef;
- (double)clientCallbackTimeout;
- (id)_addressFieldsToContactFields:(unint64_t)a3;
- (id)_transactionAmount;
- (id)accountServiceTransferRequest;
- (id)description;
- (id)disbursementPaymentRequest;
- (id)payLaterPaymentRequest;
- (id)peerPaymentRequest;
- (id)protobuf;
- (id)serviceProviderPaymentRequest;
- (id)virtualCardEnrollmentRequest;
- (int64_t)APIType;
- (int64_t)paymentFrequency;
- (int64_t)requestorDeviceType;
- (signed)merchantCategoryCode;
- (unint64_t)_contactFieldsToAddressFields:(id)a3;
- (unint64_t)confirmationStyle;
- (unint64_t)requestType;
- (unint64_t)requestor;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAPIType:(int64_t)a3;
- (void)setAccesssControlRef:(__SecAccessControl *)a3;
- (void)setAccountPaymentSupportsPeerPayment:(BOOL)a3;
- (void)setAccountPaymentUsePeerPaymentBalance:(BOOL)a3;
- (void)setAppleIDAuthenticationContext:(id)a3;
- (void)setApplePayLaterAvailability:(PKApplePayLaterAvailability)applePayLaterAvailability;
- (void)setApplePayTrustSignatureRequest:(id)a3;
- (void)setApplicationData:(NSData *)applicationData;
- (void)setAutomaticReloadPaymentRequest:(PKAutomaticReloadPaymentRequest *)automaticReloadPaymentRequest;
- (void)setAvailableShippingMethods:(id)a3;
- (void)setBankAccounts:(id)a3;
- (void)setBillingAddress:(ABRecordRef)billingAddress;
- (void)setBillingContact:(PKContact *)billingContact;
- (void)setBoundInterfaceIdentifier:(id)a3;
- (void)setCTDataConnectionServiceType:(id)a3;
- (void)setClientAnalyticsParameters:(id)a3;
- (void)setClientCallbackTimeout:(double)a3;
- (void)setClientViewSourceIdentifier:(id)a3;
- (void)setClientViewSourceParameter:(id)a3;
- (void)setConfirmationStyle:(unint64_t)a3;
- (void)setCountryCode:(NSString *)countryCode;
- (void)setCouponCode:(NSString *)couponCode;
- (void)setCurrencyCode:(NSString *)currencyCode;
- (void)setDeferredPaymentRequest:(PKDeferredPaymentRequest *)deferredPaymentRequest;
- (void)setDeviceSupportsPeerPaymentAccountPayment:(BOOL)a3;
- (void)setDisablePasscodeFallback:(BOOL)a3;
- (void)setExpectsMerchantSession:(BOOL)a3;
- (void)setExternalizedContext:(id)a3;
- (void)setInstallmentConfiguration:(id)a3;
- (void)setLocalizedAuthorizingTitle:(id)a3;
- (void)setLocalizedBiometricConfirmationTitle:(id)a3;
- (void)setLocalizedBiometricRetryMessage:(id)a3;
- (void)setLocalizedCallbackErrorMessage:(id)a3;
- (void)setLocalizedCallbackErrorTitle:(id)a3;
- (void)setLocalizedConfirmationTitle:(id)a3;
- (void)setLocalizedErrorMessage:(id)a3;
- (void)setLocalizedNavigationTitle:(id)a3;
- (void)setLocalizedPasswordButtonTitle:(id)a3;
- (void)setLocalizedSummaryItemsTitle:(id)a3;
- (void)setLocalizedUnboundBiometricMessage:(id)a3;
- (void)setMerchantCapabilities:(PKMerchantCapability)merchantCapabilities;
- (void)setMerchantCategoryCode:(signed __int16)a3;
- (void)setMerchantIdentifier:(NSString *)merchantIdentifier;
- (void)setMerchantSession:(id)a3;
- (void)setMultiTokenContexts:(NSArray *)multiTokenContexts;
- (void)setOriginatingURL:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPaymentContentItems:(id)a3;
- (void)setPaymentDate:(id)a3;
- (void)setPaymentFrequency:(int64_t)a3;
- (void)setPaymentSummaryItems:(NSArray *)paymentSummaryItems;
- (void)setPaymentSummaryPinned:(BOOL)a3;
- (void)setPaymentTimeZone:(id)a3;
- (void)setRecurringPaymentRequest:(PKRecurringPaymentRequest *)recurringPaymentRequest;
- (void)setRemoteNetworkRequestPaymentTopicID:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setRequestor:(unint64_t)a3;
- (void)setRequestorDeviceType:(int64_t)a3;
- (void)setRequiredBillingAddressFields:(PKAddressField)requiredBillingAddressFields;
- (void)setRequiredBillingContactFields:(NSSet *)requiredBillingContactFields;
- (void)setRequiredShippingAddressFields:(PKAddressField)requiredShippingAddressFields;
- (void)setRequiredShippingContactFields:(NSSet *)requiredShippingContactFields;
- (void)setRequiresAddressPrecision:(BOOL)a3;
- (void)setRespectSupportedNetworksOrder:(BOOL)a3;
- (void)setShippingAddress:(ABRecordRef)shippingAddress;
- (void)setShippingContact:(PKContact *)shippingContact;
- (void)setShippingContactEditingMode:(PKShippingContactEditingMode)shippingContactEditingMode;
- (void)setShippingEditable:(BOOL)a3;
- (void)setShippingEditableMessage:(id)a3;
- (void)setShippingMethods:(NSArray *)shippingMethods;
- (void)setShippingType:(PKShippingType)shippingType;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setSourceApplicationSecondaryIdentifier:(id)a3;
- (void)setSupportedCountries:(NSSet *)supportedCountries;
- (void)setSupportedNetworks:(NSArray *)supportedNetworks;
- (void)setSupportsCouponCode:(BOOL)supportsCouponCode;
- (void)setSupportsInstantFundsIn:(BOOL)a3;
- (void)setSuppressTotal:(BOOL)a3;
- (void)setThumbnailURLs:(id)a3;
- (void)setUseLocationBasedAuthorization:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation PKPaymentRequest

- (BOOL)isPayLaterPaymentRequest
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)payLaterPaymentRequest
{
  if ([(PKPaymentRequest *)self isPayLaterPaymentRequest]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (id)disbursementPaymentRequest
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

+ (PKPaymentRequest)requestWithProtobuf:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 requestType] == 10;
  v5 = [v3 summaryItems];
  v6 = [v5 lastObject];
  int v7 = [v6 hasDisbursementSummaryItem];

  v8 = off_1E56D4F20;
  if ((v4 & v7) == 0) {
    v8 = off_1E56D5F90;
  }
  id v9 = objc_alloc_init(*v8);
  objc_msgSend(v9, "setAPIType:", objc_msgSend(v3, "apiType"));
  v10 = [v3 merchantIdentifier];
  [v9 setMerchantIdentifier:v10];

  v11 = [v3 countryCode];
  [v9 setCountryCode:v11];

  v12 = [v3 currencyCode];
  [v9 setCurrencyCode:v12];

  v13 = [v3 supportedNetworks];
  [v9 setSupportedNetworks:v13];

  objc_msgSend(v9, "setMerchantCapabilities:", objc_msgSend(v3, "merchantCapabilities"));
  objc_msgSend(v9, "setRequiredBillingAddressFields:", objc_msgSend(v3, "requiredBillingAddressFields"));
  objc_msgSend(v9, "setRequiredShippingAddressFields:", objc_msgSend(v3, "requiredShippingAddressFields"));
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [v3 requiredShippingContactFields];
  v16 = [v14 setWithArray:v15];
  [v9 setRequiredShippingContactFields:v16];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = [v3 requiredBillingContactFields];
  v19 = [v17 setWithArray:v18];
  [v9 setRequiredBillingContactFields:v19];

  v20 = [v3 applicationData];
  [v9 setApplicationData:v20];

  v21 = (void *)MEMORY[0x1E4F1CB10];
  v22 = [v3 originatingURL];
  v23 = [v21 URLWithString:v22];
  [v9 setOriginatingURL:v23];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  v25 = [v3 supportedCountries];
  v26 = [v24 setWithArray:v25];
  [v9 setSupportedCountries:v26];

  v27 = [v3 userAgent];
  [v9 setUserAgent:v27];

  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v29 = [v3 thumbnailURLs];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v94 objects:v100 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v95 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v94 + 1) + 8 * i)];
        [v28 addObject:v34];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v94 objects:v100 count:16];
    }
    while (v31);
  }

  if ([v28 count])
  {
    v35 = (void *)[v28 copy];
    [v9 setThumbnailURLs:v35];
  }
  if ([v3 hasMerchantSession])
  {
    v36 = [v3 merchantSession];
    v37 = +[PKPaymentMerchantSession paymentMerchantSessionWithProtobuf:v36];
    [v9 setMerchantSession:v37];
  }
  v38 = [MEMORY[0x1E4F1CA48] array];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v39 = [v3 summaryItems];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v90 objects:v99 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v91;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v91 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = +[PKPaymentSummaryItem itemWithProtobuf:*(void *)(*((void *)&v90 + 1) + 8 * j)];
        [v38 addObject:v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v90 objects:v99 count:16];
    }
    while (v41);
  }

  [v9 setPaymentSummaryItems:v38];
  if ([v3 hasAvailableShippingMethods])
  {
    v45 = [v3 availableShippingMethods];
    v46 = +[PKShippingMethods shippingMethodsWithProtobuf:v45];
    [v9 setAvailableShippingMethods:v46];
  }
  else
  {
    v47 = [v3 shippingMethods];
    uint64_t v48 = [v47 count];

    if (!v48) {
      goto LABEL_33;
    }
    v85 = v9;
    v45 = [MEMORY[0x1E4F1CA48] array];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v49 = [v3 shippingMethods];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v86 objects:v98 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v87;
      do
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v87 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = +[PKShippingMethod shippingMethodWithProtobuf:*(void *)(*((void *)&v86 + 1) + 8 * k)];
          [v45 addObject:v54];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v86 objects:v98 count:16];
      }
      while (v51);
    }

    id v9 = v85;
    [v85 setShippingMethods:v45];
  }

LABEL_33:
  v55 = [v3 billingContact];

  if (v55)
  {
    v56 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v57 = objc_opt_class();
    v58 = [v3 billingContact];
    v59 = [v56 unarchivedObjectOfClass:v57 fromData:v58 error:0];
    [v9 setBillingContact:v59];
  }
  v60 = [v3 shippingContact];

  if (v60)
  {
    v61 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v62 = objc_opt_class();
    v63 = [v3 shippingContact];
    v64 = [v61 unarchivedObjectOfClass:v62 fromData:v63 error:0];
    [v9 setShippingContact:v64];
  }
  v65 = [v3 multiTokenContexts];
  uint64_t v66 = objc_msgSend(v65, "pk_arrayByApplyingBlock:", &__block_literal_global_138);
  v67 = (void *)v66;
  v68 = (void *)MEMORY[0x1E4F1CBF0];
  if (v66) {
    v68 = (void *)v66;
  }
  id v69 = v68;

  [v9 setMultiTokenContexts:v69];
  v70 = [v3 recurringPaymentRequest];

  if (v70)
  {
    v71 = [v3 recurringPaymentRequest];
    v72 = +[PKRecurringPaymentRequest recurringPaymentRequestWithProtobuf:v71];
    [v9 setRecurringPaymentRequest:v72];
  }
  v73 = [v3 automaticReloadPaymentRequest];

  if (v73)
  {
    v74 = [v3 automaticReloadPaymentRequest];
    v75 = +[PKAutomaticReloadPaymentRequest automaticReloadPaymentRequestWithProtobuf:v74];
    [v9 setAutomaticReloadPaymentRequest:v75];
  }
  v76 = [v3 deferredPaymentRequest];

  if (v76)
  {
    v77 = [v3 deferredPaymentRequest];
    v78 = +[PKDeferredPaymentRequest deferredPaymentRequestWithProtobuf:v77];
    [v9 setDeferredPaymentRequest:v78];
  }
  v79 = [v3 contentItems];
  v80 = objc_msgSend(v79, "pk_arrayByApplyingBlock:", &__block_literal_global_145);

  [v9 setPaymentContentItems:v80];
  v81 = [v3 localizedNavigationTitle];
  [v9 setLocalizedNavigationTitle:v81];

  v82 = [v3 localizedSummaryItemsTitle];
  [v9 setLocalizedSummaryItemsTitle:v82];

  objc_msgSend(v9, "setSuppressTotal:", objc_msgSend(v3, "suppressTotal"));
  objc_msgSend(v9, "setPaymentSummaryPinned:", objc_msgSend(v3, "summaryPinned"));
  objc_msgSend(v9, "setRequestor:", (int)objc_msgSend(v3, "requestor"));
  objc_msgSend(v9, "setConfirmationStyle:", (int)objc_msgSend(v3, "confirmationStyle"));
  objc_msgSend(v9, "setRequestType:", (int)objc_msgSend(v3, "requestType"));
  objc_msgSend(v9, "setRespectSupportedNetworksOrder:", objc_msgSend(v3, "respectSupportedNetworksOrder"));
  objc_msgSend(v9, "setRequestorDeviceType:", (int)objc_msgSend(v3, "requestorDeviceType"));
  v83 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "merchantCategoryCode"));
  objc_msgSend(v9, "setMerchantCategoryCode:", objc_msgSend(v83, "shortValue"));

  return (PKPaymentRequest *)v9;
}

PKPaymentTokenContext *__50__PKPaymentRequest_Protobuf__requestWithProtobuf___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PKPaymentTokenContext contextWithProtobuf:a2];
}

PKPaymentContentItem *__50__PKPaymentRequest_Protobuf__requestWithProtobuf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PKPaymentContentItem itemWithProtobuf:a2];
}

- (id)protobuf
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(PKProtobufPaymentRequest);
  [(PKProtobufPaymentRequest *)v3 setApiType:[(PKPaymentRequest *)self APIType]];
  BOOL v4 = [(PKPaymentRequest *)self merchantIdentifier];
  [(PKProtobufPaymentRequest *)v3 setMerchantIdentifier:v4];

  v5 = [(PKPaymentRequest *)self countryCode];
  [(PKProtobufPaymentRequest *)v3 setCountryCode:v5];

  v6 = [(PKPaymentRequest *)self currencyCode];
  [(PKProtobufPaymentRequest *)v3 setCurrencyCode:v6];

  int v7 = [(PKPaymentRequest *)self supportedNetworks];
  v8 = (void *)[v7 mutableCopy];
  [(PKProtobufPaymentRequest *)v3 setSupportedNetworks:v8];

  [(PKProtobufPaymentRequest *)v3 setMerchantCapabilities:[(PKPaymentRequest *)self merchantCapabilities]];
  [(PKProtobufPaymentRequest *)v3 setRequiredBillingAddressFields:[(PKPaymentRequest *)self requiredBillingAddressFields]];
  [(PKProtobufPaymentRequest *)v3 setRequiredShippingAddressFields:[(PKPaymentRequest *)self requiredShippingAddressFields]];
  id v9 = [(PKPaymentRequest *)self requiredBillingContactFields];
  v10 = [v9 allObjects];
  v11 = (void *)[v10 mutableCopy];
  [(PKProtobufPaymentRequest *)v3 setRequiredBillingContactFields:v11];

  v12 = [(PKPaymentRequest *)self requiredShippingContactFields];
  v13 = [v12 allObjects];
  v14 = (void *)[v13 mutableCopy];
  [(PKProtobufPaymentRequest *)v3 setRequiredShippingContactFields:v14];

  v15 = [(PKPaymentRequest *)self applicationData];
  [(PKProtobufPaymentRequest *)v3 setApplicationData:v15];

  v16 = [(PKPaymentRequest *)self originatingURL];
  v17 = [v16 absoluteString];
  [(PKProtobufPaymentRequest *)v3 setOriginatingURL:v17];

  [(PKProtobufPaymentRequest *)v3 setExpectsMerchantSession:[(PKPaymentRequest *)self shouldUseMerchantSession]];
  v18 = [(PKPaymentRequest *)self supportedCountries];
  v19 = [v18 allObjects];
  v20 = (void *)[v19 mutableCopy];
  [(PKProtobufPaymentRequest *)v3 setSupportedCountries:v20];

  v21 = [(PKPaymentRequest *)self userAgent];
  [(PKProtobufPaymentRequest *)v3 setUserAgent:v21];

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v22 = [(PKPaymentRequest *)self thumbnailURLs];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v92 objects:v100 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v93 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [*(id *)(*((void *)&v92 + 1) + 8 * i) absoluteString];
        [(PKProtobufPaymentRequest *)v3 addThumbnailURLs:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v92 objects:v100 count:16];
    }
    while (v24);
  }

  id v28 = [(PKPaymentRequest *)self merchantSession];

  if (v28)
  {
    v29 = [(PKPaymentRequest *)self merchantSession];
    uint64_t v30 = [v29 protobuf];
    [(PKProtobufPaymentRequest *)v3 setMerchantSession:v30];
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v31 = [(PKPaymentRequest *)self paymentSummaryItems];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v88 objects:v99 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v89 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = [*(id *)(*((void *)&v88 + 1) + 8 * j) summaryItemProtobuf];
        [(PKProtobufPaymentRequest *)v3 addSummaryItems:v36];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v88 objects:v99 count:16];
    }
    while (v33);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v37 = [(PKPaymentRequest *)self shippingMethods];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v84 objects:v98 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v85;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v85 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = [*(id *)(*((void *)&v84 + 1) + 8 * k) shippingMethodProtobuf];
        [(PKProtobufPaymentRequest *)v3 addShippingMethods:v42];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v84 objects:v98 count:16];
    }
    while (v39);
  }

  v43 = [(PKPaymentRequest *)self availableShippingMethods];
  v44 = [v43 protobuf];
  [(PKProtobufPaymentRequest *)v3 setAvailableShippingMethods:v44];

  v45 = [(PKPaymentRequest *)self billingContact];

  if (v45)
  {
    v46 = (void *)MEMORY[0x1E4F28DB0];
    v47 = [(PKPaymentRequest *)self billingContact];
    uint64_t v48 = [v46 archivedDataWithRootObject:v47 requiringSecureCoding:1 error:0];
    [(PKProtobufPaymentRequest *)v3 setBillingContact:v48];
  }
  v49 = [(PKPaymentRequest *)self shippingContact];

  if (v49)
  {
    uint64_t v50 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v51 = [(PKPaymentRequest *)self shippingContact];
    uint64_t v52 = [v50 archivedDataWithRootObject:v51 requiringSecureCoding:1 error:0];
    [(PKProtobufPaymentRequest *)v3 setShippingContact:v52];
  }
  v53 = [(PKPaymentRequest *)self multiTokenContexts];
  uint64_t v54 = [v53 count];

  if (v54)
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v55 = [(PKPaymentRequest *)self multiTokenContexts];
    uint64_t v56 = [v55 countByEnumeratingWithState:&v80 objects:v97 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v81;
      do
      {
        for (uint64_t m = 0; m != v57; ++m)
        {
          if (*(void *)v81 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = [*(id *)(*((void *)&v80 + 1) + 8 * m) protobuf];
          [(PKProtobufPaymentRequest *)v3 addMultiTokenContexts:v60];
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v80 objects:v97 count:16];
      }
      while (v57);
    }
  }
  v61 = [(PKPaymentRequest *)self recurringPaymentRequest];
  uint64_t v62 = [v61 protobuf];
  [(PKProtobufPaymentRequest *)v3 setRecurringPaymentRequest:v62];

  v63 = [(PKPaymentRequest *)self automaticReloadPaymentRequest];
  v64 = [v63 protobuf];
  [(PKProtobufPaymentRequest *)v3 setAutomaticReloadPaymentRequest:v64];

  v65 = [(PKPaymentRequest *)self deferredPaymentRequest];
  uint64_t v66 = [v65 protobuf];
  [(PKProtobufPaymentRequest *)v3 setDeferredPaymentRequest:v66];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v67 = [(PKPaymentRequest *)self paymentContentItems];
  uint64_t v68 = [v67 countByEnumeratingWithState:&v76 objects:v96 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v77;
    do
    {
      for (uint64_t n = 0; n != v69; ++n)
      {
        if (*(void *)v77 != v70) {
          objc_enumerationMutation(v67);
        }
        v72 = [*(id *)(*((void *)&v76 + 1) + 8 * n) protobuf];
        [(PKProtobufPaymentRequest *)v3 addContentItems:v72];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v76 objects:v96 count:16];
    }
    while (v69);
  }

  v73 = [(PKPaymentRequest *)self localizedNavigationTitle];
  [(PKProtobufPaymentRequest *)v3 setLocalizedNavigationTitle:v73];

  v74 = [(PKPaymentRequest *)self localizedSummaryItemsTitle];
  [(PKProtobufPaymentRequest *)v3 setLocalizedSummaryItemsTitle:v74];

  [(PKProtobufPaymentRequest *)v3 setSuppressTotal:[(PKPaymentRequest *)self suppressTotal]];
  [(PKProtobufPaymentRequest *)v3 setSummaryPinned:[(PKPaymentRequest *)self isPaymentSummaryPinned]];
  [(PKProtobufPaymentRequest *)v3 setRequestor:[(PKPaymentRequest *)self requestor]];
  [(PKProtobufPaymentRequest *)v3 setConfirmationStyle:[(PKPaymentRequest *)self confirmationStyle]];
  [(PKProtobufPaymentRequest *)v3 setRequestType:[(PKPaymentRequest *)self requestType]];
  [(PKProtobufPaymentRequest *)v3 setRespectSupportedNetworksOrder:[(PKPaymentRequest *)self respectSupportedNetworksOrder]];
  [(PKProtobufPaymentRequest *)v3 setRequestorDeviceType:[(PKPaymentRequest *)self requestorDeviceType]];
  [(PKProtobufPaymentRequest *)v3 setMerchantCategoryCode:[(PKPaymentRequest *)self merchantCategoryCode]];
  return v3;
}

- (BOOL)isServiceProviderPaymentRequest
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)serviceProviderPaymentRequest
{
  if ([(PKPaymentRequest *)self isServiceProviderPaymentRequest]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isAccountServiceTransferRequest
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)accountServiceTransferRequest
{
  if ([(PKPaymentRequest *)self isAccountServiceTransferRequest]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isPeerPaymentRequest
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)peerPaymentRequest
{
  if ([(PKPaymentRequest *)self isPeerPaymentRequest]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isVirtualCardRequest
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isVirtualCardEnrollmentRequest
{
  BOOL v3 = [(PKPaymentRequest *)self isVirtualCardRequest];
  if (v3) {
    LOBYTE(v3) = [(PKPaymentRequest *)self requestType] == 12;
  }
  return v3;
}

- (BOOL)isVirtualCardRefreshRequest
{
  BOOL v3 = [(PKPaymentRequest *)self isVirtualCardRequest];
  if (v3) {
    LOBYTE(v3) = [(PKPaymentRequest *)self requestType] == 14;
  }
  return v3;
}

- (id)virtualCardEnrollmentRequest
{
  if ([(PKPaymentRequest *)self isVirtualCardEnrollmentRequest]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }
  return v3;
}

+ (NSArray)availableNetworks
{
  v4[29] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AmEx";
  v4[1] = @"Bancomat";
  v4[2] = @"PagoBancomat";
  v4[3] = @"Bancontact";
  v4[4] = @"CarteBancaire";
  v4[5] = @"CarteBancaires";
  v4[6] = @"CartesBancaires";
  v4[7] = @"ChinaUnionPay";
  v4[8] = @"Dankort";
  v4[9] = @"Discover";
  v4[10] = @"Eftpos";
  v4[11] = @"Electron";
  v4[12] = @"Elo";
  v4[13] = @"girocard";
  v4[14] = @"Interac";
  v4[15] = @"iD";
  v4[16] = @"JCB";
  v4[17] = @"mada";
  v4[18] = @"Maestro";
  v4[19] = @"MasterCard";
  v4[20] = @"Meeza";
  v4[21] = @"Mir";
  v4[22] = @"NAPAS";
  v4[23] = @"BankAxept";
  v4[24] = @"PostFinanceAG";
  v4[25] = @"PrivateLabel";
  v4[26] = @"QUICPay";
  v4[27] = @"Visa";
  v4[28] = @"VPay";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:29];
  return (NSArray *)v2;
}

+ (int64_t)version
{
  return 4;
}

- (PKPaymentRequest)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentRequest;
  v2 = [(PKPaymentRequest *)&v10 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_shippingContactEditingMode = 1;
    v2->_applePayLaterAvailability = 0;
    BOOL v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    requiredBillingContactFields = v3->_requiredBillingContactFields;
    v3->_requiredBillingContactFields = v4;

    v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    requiredShippingContactFields = v3->_requiredShippingContactFields;
    v3->_requiredShippingContactFields = v6;

    v3->_respectSupportedNetworksOrder = 1;
    multiTokenContexts = v3->_multiTokenContexts;
    v3->_multiTokenContexts = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (PKPaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v162.receiver = self;
  v162.super_class = (Class)PKPaymentRequest;
  v5 = [(PKPaymentRequest *)&v162 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v8;

    objc_super v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"supportedNetworks"];
    supportedNetworks = v5->_supportedNetworks;
    v5->_supportedNetworks = (NSArray *)v13;

    v5->_respectSupportedNetworksOrder = [v4 decodeBoolForKey:@"respectSupportedNetworksOrder"];
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCapabilities"];
    v5->_merchantCapabilities = [v15 unsignedIntegerValue];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automaticReloadPaymentRequest"];
    automaticReloadPaymentRequest = v5->_automaticReloadPaymentRequest;
    v5->_automaticReloadPaymentRequest = (PKAutomaticReloadPaymentRequest *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recurringPaymentRequest"];
    recurringPaymentRequest = v5->_recurringPaymentRequest;
    v5->_recurringPaymentRequest = (PKRecurringPaymentRequest *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"multiTokenContexts"];
    uint64_t v24 = (void *)v23;
    if (v23) {
      uint64_t v25 = (void *)v23;
    }
    else {
      uint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_multiTokenContexts, v25);

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deferredPaymentRequest"];
    deferredPaymentRequest = v5->_deferredPaymentRequest;
    v5->_deferredPaymentRequest = (PKDeferredPaymentRequest *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationData"];
    applicationData = v5->_applicationData;
    v5->_applicationData = (NSData *)v30;

    v5->_supportsCouponCode = [v4 decodeBoolForKey:@"supportsCouponCode"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"couponCode"];
    couponCode = v5->_couponCode;
    v5->_couponCode = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCategoryCode"];

    v5->_merchantCategoryCode = [v34 shortValue];
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"paymentSummaryItems"];
    paymentSummaryItems = v5->_paymentSummaryItems;
    v5->_paymentSummaryItems = (NSArray *)v38;

    uint64_t v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"requiredBillingContactFields"];
    requiredBillingContactFields = v5->_requiredBillingContactFields;
    v5->_requiredBillingContactFields = (NSSet *)v43;

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"requiredShippingContactFields"];
    requiredShippingContactFields = v5->_requiredShippingContactFields;
    v5->_requiredShippingContactFields = (NSSet *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingType"];

    v5->_shippingType = [v50 integerValue];
    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingEditableMessage"];
    shippingEditableMessage = v5->_shippingEditableMessage;
    v5->_shippingEditableMessage = (NSString *)v51;

    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingContactEditingMode"];

    v5->_shippingContactEditingMode = [v53 integerValue];
    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingContact"];
    shippingContact = v5->_shippingContact;
    v5->_shippingContact = (PKContact *)v54;

    [(PKContact *)v5->_shippingContact sanitizePostalAddressCountry];
    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingContact"];
    billingContact = v5->_billingContact;
    v5->_billingContact = (PKContact *)v56;

    [(PKContact *)v5->_billingContact sanitizePostalAddressCountry];
    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applePayLaterAvailability"];

    v5->_applePayLaterAvailability = [v58 integerValue];
    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteNetworkRequestPaymentTopicID"];
    remoteNetworkRequestPaymentTopicID = v5->_remoteNetworkRequestPaymentTopicID;
    v5->_remoteNetworkRequestPaymentTopicID = (NSString *)v59;

    v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresAddressPrecision"];
    v5->_requiresAddressPrecisiouint64_t n = [v61 BOOLValue];

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingURL"];
    originatingURL = v5->_originatingURL;
    v5->_originatingURL = (NSURL *)v66;

    uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantSession"];
    merchantSessiouint64_t n = v5->_merchantSession;
    v5->_merchantSessiouint64_t n = (PKPaymentMerchantSession *)v68;

    uint64_t v70 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v71 = objc_opt_class();
    v72 = objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
    uint64_t v73 = [v4 decodeObjectOfClasses:v72 forKey:@"thumbnailURLs"];
    thumbnailURLs = v5->_thumbnailURLs;
    v5->_thumbnailURLs = (NSArray *)v73;

    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userAgent"];
    userAgent = v5->_userAgent;
    v5->_userAgent = (NSString *)v75;

    [v4 decodeDoubleForKey:@"clientCallbackTimeout"];
    v5->_clientCallbackTimeout = v77;
    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applePayTrustSignatureRequest"];
    applePayTrustSignatureRequest = v5->_applePayTrustSignatureRequest;
    v5->_applePayTrustSignatureRequest = (PKApplePayTrustSignatureRequest *)v78;

    long long v80 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v81 = objc_opt_class();
    long long v82 = objc_msgSend(v80, "setWithObjects:", v81, objc_opt_class(), 0);
    uint64_t v83 = [v4 decodeObjectOfClasses:v82 forKey:@"bankAccounts"];
    bankAccounts = v5->_bankAccounts;
    v5->_bankAccounts = (NSArray *)v83;

    v5->_accountPaymentSupportsPeerPayment = [v4 decodeBoolForKey:@"accountPaymentSupportsPeerPayment"];
    v5->_deviceSupportsPeerPaymentAccountPayment = [v4 decodeBoolForKey:@"deviceSupportsPeerPaymentAccountPayment"];
    v5->_accountPaymentUsePeerPaymentBalance = [v4 decodeBoolForKey:@"accountPaymentUsePeerPaymentBalance"];
    v5->_paymentFrequency = [v4 decodeIntegerForKey:@"paymentFrequency"];
    uint64_t v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentDate"];
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v85;

    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTimeZone"];
    paymentTimeZone = v5->_paymentTimeZone;
    v5->_paymentTimeZone = (NSTimeZone *)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceApplicationBundleIdentifier"];
    sourceApplicationBundleIdentifier = v5->_sourceApplicationBundleIdentifier;
    v5->_sourceApplicationBundleIdentifier = (NSString *)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceApplicationSecondaryIdentifier"];
    sourceApplicationSecondaryIdentifier = v5->_sourceApplicationSecondaryIdentifier;
    v5->_sourceApplicationSecondaryIdentifier = (NSString *)v91;

    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CTDataConnectionServiceType"];
    CTDataConnectionServiceType = v5->_CTDataConnectionServiceType;
    v5->_CTDataConnectionServiceType = (NSString *)v93;

    uint64_t v95 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boundInterfaceIdentifier"];
    boundInterfaceIdentifier = v5->_boundInterfaceIdentifier;
    v5->_boundInterfaceIdentifier = (NSString *)v95;

    long long v97 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v98 = objc_opt_class();
    v99 = objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
    uint64_t v100 = [v4 decodeObjectOfClasses:v99 forKey:@"supportedCountries"];
    supportedCountries = v5->_supportedCountries;
    v5->_supportedCountries = (NSSet *)v100;

    v102 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v103 = objc_opt_class();
    v104 = objc_msgSend(v102, "setWithObjects:", v103, objc_opt_class(), 0);
    uint64_t v105 = [v4 decodeObjectOfClasses:v104 forKey:@"paymentContentItems"];
    paymentContentItems = v5->_paymentContentItems;
    v5->_paymentContentItems = (NSArray *)v105;

    uint64_t v107 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalizedContext"];
    externalizedContext = v5->_externalizedContext;
    v5->_externalizedContext = (NSData *)v107;

    uint64_t v109 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleIDAuthenticationContext"];
    appleIDAuthenticationContext = v5->_appleIDAuthenticationContext;
    v5->_appleIDAuthenticationContext = (AKAppleIDAuthenticationContext *)v109;

    uint64_t v111 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientViewSourceIdentifier"];
    clientViewSourceIdentifier = v5->_clientViewSourceIdentifier;
    v5->_clientViewSourceIdentifier = (NSString *)v111;

    uint64_t v113 = [v4 decodePropertyListForKey:@"clientViewSourceParameter"];
    clientViewSourceParameter = v5->_clientViewSourceParameter;
    v5->_clientViewSourceParameter = (NSDictionary *)v113;

    uint64_t v115 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedNavigationTitle"];
    localizedNavigationTitle = v5->_localizedNavigationTitle;
    v5->_localizedNavigationTitle = (NSString *)v115;

    uint64_t v117 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedConfirmationTitle"];
    localizedConfirmationTitle = v5->_localizedConfirmationTitle;
    v5->_localizedConfirmationTitle = (NSString *)v117;

    uint64_t v119 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedBiometricConfirmationTitle"];
    localizedBiometricConfirmationTitle = v5->_localizedBiometricConfirmationTitle;
    v5->_localizedBiometricConfirmationTitle = (NSString *)v119;

    uint64_t v121 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedPasswordButtonTitle"];
    localizedPasswordButtonTitle = v5->_localizedPasswordButtonTitle;
    v5->_localizedPasswordButtonTitle = (NSString *)v121;

    v5->_suppressTotal = [v4 decodeBoolForKey:@"suppressTotal"];
    v5->_paymentSummaryPinned = [v4 decodeBoolForKey:@"paymentSummaryPinned"];
    uint64_t v123 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentSummaryItemsTitle"];
    localizedSummaryItemsTitle = v5->_localizedSummaryItemsTitle;
    v5->_localizedSummaryItemsTitle = (NSString *)v123;

    v5->_confirmationStyle = [v4 decodeIntegerForKey:@"confirmationStyle"];
    v5->_APIType = [v4 decodeIntegerForKey:@"APIType"];
    v5->_supportsInstantFundsIuint64_t n = [v4 decodeBoolForKey:@"supportsInstantFundsIn"];
    uint64_t v125 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentConfiguration"];
    installmentConfiguratiouint64_t n = v5->_installmentConfiguration;
    v5->_installmentConfiguratiouint64_t n = (PKPaymentInstallmentConfiguration *)v125;

    uint64_t v127 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedErrorMessage"];
    localizedErrorMessage = v5->_localizedErrorMessage;
    v5->_localizedErrorMessage = (NSString *)v127;

    uint64_t v129 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAutorizingTitle"];
    localizedAuthorizingTitle = v5->_localizedAuthorizingTitle;
    v5->_localizedAuthorizingTitle = (NSString *)v129;

    uint64_t v131 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedCallbackErrorTitle"];
    localizedCallbackErrorTitle = v5->_localizedCallbackErrorTitle;
    v5->_localizedCallbackErrorTitle = (NSString *)v131;

    uint64_t v133 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedCallbackErrorMessage"];
    localizedCallbackErrorMessage = v5->_localizedCallbackErrorMessage;
    v5->_localizedCallbackErrorMessage = (NSString *)v133;

    uint64_t v135 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedBiometricRetryMessage"];
    localizedBiometricRetryMessage = v5->_localizedBiometricRetryMessage;
    v5->_localizedBiometricRetryMessage = (NSString *)v135;

    uint64_t v137 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedUnboundBiometricMessage"];
    localizedUnboundBiometricMessage = v5->_localizedUnboundBiometricMessage;
    v5->_localizedUnboundBiometricMessage = (NSString *)v137;

    v5->_disablePasscodeFallbacuint64_t k = [v4 decodeBoolForKey:@"disablePasscodeFallback"];
    v5->_useLocationBasedAuthorizatiouint64_t n = [v4 decodeBoolForKey:@"useLocationBasedAuthorization"];
    uint64_t v139 = [v4 decodePropertyListForKey:@"clientAnalyticsParameters"];
    clientAnalyticsParameters = v5->_clientAnalyticsParameters;
    v5->_clientAnalyticsParameters = (NSDictionary *)v139;

    v141 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestor"];

    v5->_requestor = [v141 integerValue];
    v142 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestType"];

    v5->_requestType = [v142 integerValue];
    v143 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestorDeviceType"];

    v5->_requestorDeviceType = [v143 integerValue];
    uint64_t v144 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableShippingMethods"];
    availableShippingMethods = v5->_availableShippingMethods;
    v5->_availableShippingMethods = (PKShippingMethods *)v144;

    v146 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v147 = objc_opt_class();
    v148 = objc_msgSend(v146, "setWithObjects:", v147, objc_opt_class(), 0);
    v149 = [v4 decodeObjectOfClasses:v148 forKey:@"shippingMethods"];

    if (!v5->_availableShippingMethods && v149)
    {
      v150 = [[PKShippingMethods alloc] initWithLegacyShippingMethods:v149];
      v151 = v5->_availableShippingMethods;
      v5->_availableShippingMethods = v150;
    }
    v152 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessControlRef"];
    if (v152)
    {
      uint64_t v161 = 0;
      uint64_t v153 = SecAccessControlCreateFromData();
      if (v153)
      {
        v5->_accesssControlRef = (__SecAccessControl *)v153;
      }
      else
      {
        v154 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v154, OS_LOG_TYPE_DEFAULT, "Error decoding access control ref", buf, 2u);
        }
      }
    }
    v155 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingAddress"];
    v156 = v155;
    if (v155) {
      v5->_shippingAddress = (void *)[v155 ABPerson];
    }
    v157 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingAddress"];
    v158 = v157;
    if (v157) {
      v5->_billingAddress = (void *)[v157 ABPerson];
    }
  }
  return v5;
}

- (void)dealloc
{
  accesssControlRef = self->_accesssControlRef;
  if (accesssControlRef) {
    CFRelease(accesssControlRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentRequest;
  [(PKPaymentRequest *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  [v18 encodeObject:self->_merchantIdentifier forKey:@"merchantIdentifier"];
  [v18 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v18 encodeObject:self->_supportedNetworks forKey:@"supportedNetworks"];
  [v18 encodeBool:self->_respectSupportedNetworksOrder forKey:@"respectSupportedNetworksOrder"];
  objc_super v4 = [NSNumber numberWithUnsignedInteger:self->_merchantCapabilities];
  [v18 encodeObject:v4 forKey:@"merchantCapabilities"];

  [v18 encodeObject:self->_automaticReloadPaymentRequest forKey:@"automaticReloadPaymentRequest"];
  [v18 encodeObject:self->_recurringPaymentRequest forKey:@"recurringPaymentRequest"];
  [v18 encodeObject:self->_deferredPaymentRequest forKey:@"deferredPaymentRequest"];
  [v18 encodeObject:self->_multiTokenContexts forKey:@"multiTokenContexts"];
  [v18 encodeBool:self->_supportsCouponCode forKey:@"supportsCouponCode"];
  [v18 encodeObject:self->_couponCode forKey:@"couponCode"];
  [v18 encodeObject:self->_paymentSummaryItems forKey:@"paymentSummaryItems"];
  [v18 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  v5 = [NSNumber numberWithShort:self->_merchantCategoryCode];
  [v18 encodeObject:v5 forKey:@"merchantCategoryCode"];

  [v18 encodeObject:self->_applicationData forKey:@"applicationData"];
  [v18 encodeObject:self->_requiredShippingContactFields forKey:@"requiredShippingContactFields"];
  [v18 encodeObject:self->_requiredBillingContactFields forKey:@"requiredBillingContactFields"];
  uint64_t v6 = [(PKShippingMethods *)self->_availableShippingMethods legacyShippingMethods];
  [v18 encodeObject:v6 forKey:@"shippingMethods"];

  [v18 encodeObject:self->_availableShippingMethods forKey:@"availableShippingMethods"];
  int v7 = [NSNumber numberWithUnsignedInteger:self->_shippingType];
  [v18 encodeObject:v7 forKey:@"shippingType"];

  [v18 encodeObject:self->_shippingEditableMessage forKey:@"shippingEditableMessage"];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_shippingContactEditingMode];
  [v18 encodeObject:v8 forKey:@"shippingContactEditingMode"];

  [v18 encodeObject:self->_shippingContact forKey:@"shippingContact"];
  [v18 encodeObject:self->_billingContact forKey:@"billingContact"];
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPaymentRequest requiresAddressPrecision](self, "requiresAddressPrecision"));
  [v18 encodeObject:v9 forKey:@"requiresAddressPrecision"];

  objc_super v10 = [NSNumber numberWithUnsignedInteger:self->_applePayLaterAvailability];
  [v18 encodeObject:v10 forKey:@"applePayLaterAvailability"];

  [v18 encodeObject:self->_passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v18 encodeObject:self->_passSerialNumber forKey:@"passSerialNumber"];
  [v18 encodeObject:self->_originatingURL forKey:@"originatingURL"];
  [v18 encodeObject:self->_merchantSession forKey:@"merchantSession"];
  [v18 encodeObject:self->_thumbnailURLs forKey:@"thumbnailURLs"];
  [v18 encodeObject:self->_userAgent forKey:@"userAgent"];
  [v18 encodeObject:self->_remoteNetworkRequestPaymentTopicID forKey:@"remoteNetworkRequestPaymentTopicID"];
  [v18 encodeDouble:@"clientCallbackTimeout" forKey:self->_clientCallbackTimeout];
  [v18 encodeObject:self->_applePayTrustSignatureRequest forKey:@"applePayTrustSignatureRequest"];
  [v18 encodeObject:self->_bankAccounts forKey:@"bankAccounts"];
  [v18 encodeBool:self->_accountPaymentSupportsPeerPayment forKey:@"accountPaymentSupportsPeerPayment"];
  [v18 encodeBool:self->_deviceSupportsPeerPaymentAccountPayment forKey:@"deviceSupportsPeerPaymentAccountPayment"];
  [v18 encodeBool:self->_accountPaymentUsePeerPaymentBalance forKey:@"accountPaymentUsePeerPaymentBalance"];
  [v18 encodeInteger:self->_paymentFrequency forKey:@"paymentFrequency"];
  [v18 encodeObject:self->_paymentDate forKey:@"paymentDate"];
  [v18 encodeObject:self->_paymentTimeZone forKey:@"paymentTimeZone"];
  [v18 encodeObject:self->_sourceApplicationBundleIdentifier forKey:@"sourceApplicationBundleIdentifier"];
  [v18 encodeObject:self->_sourceApplicationSecondaryIdentifier forKey:@"sourceApplicationSecondaryIdentifier"];
  [v18 encodeObject:self->_CTDataConnectionServiceType forKey:@"CTDataConnectionServiceType"];
  [v18 encodeObject:self->_supportedCountries forKey:@"supportedCountries"];
  [v18 encodeObject:self->_boundInterfaceIdentifier forKey:@"boundInterfaceIdentifier"];
  [v18 encodeObject:self->_externalizedContext forKey:@"externalizedContext"];
  [v18 encodeObject:self->_appleIDAuthenticationContext forKey:@"appleIDAuthenticationContext"];
  [v18 encodeObject:self->_clientViewSourceIdentifier forKey:@"clientViewSourceIdentifier"];
  [v18 encodeObject:self->_clientViewSourceParameter forKey:@"clientViewSourceParameter"];
  [v18 encodeObject:self->_paymentContentItems forKey:@"paymentContentItems"];
  [v18 encodeObject:self->_localizedNavigationTitle forKey:@"localizedNavigationTitle"];
  [v18 encodeObject:self->_localizedConfirmationTitle forKey:@"localizedConfirmationTitle"];
  [v18 encodeObject:self->_localizedBiometricConfirmationTitle forKey:@"localizedBiometricConfirmationTitle"];
  [v18 encodeObject:self->_localizedPasswordButtonTitle forKey:@"localizedPasswordButtonTitle"];
  [v18 encodeObject:self->_localizedSummaryItemsTitle forKey:@"paymentSummaryItemsTitle"];
  [v18 encodeBool:self->_suppressTotal forKey:@"suppressTotal"];
  [v18 encodeBool:self->_paymentSummaryPinned forKey:@"paymentSummaryPinned"];
  uint64_t v11 = [NSNumber numberWithInteger:self->_requestType];
  [v18 encodeObject:v11 forKey:@"requestType"];

  v12 = [NSNumber numberWithInteger:self->_requestor];
  [v18 encodeObject:v12 forKey:@"requestor"];

  uint64_t v13 = [NSNumber numberWithInteger:self->_requestorDeviceType];
  [v18 encodeObject:v13 forKey:@"requestorDeviceType"];

  [v18 encodeInteger:self->_confirmationStyle forKey:@"confirmationStyle"];
  [v18 encodeInteger:self->_APIType forKey:@"APIType"];
  [v18 encodeBool:self->_supportsInstantFundsIn forKey:@"supportsInstantFundsIn"];
  [v18 encodeObject:self->_installmentConfiguration forKey:@"installmentConfiguration"];
  [v18 encodeObject:self->_localizedErrorMessage forKey:@"localizedErrorMessage"];
  [v18 encodeObject:self->_localizedAuthorizingTitle forKey:@"localizedAutorizingTitle"];
  [v18 encodeObject:self->_localizedCallbackErrorTitle forKey:@"localizedCallbackErrorTitle"];
  [v18 encodeObject:self->_localizedCallbackErrorMessage forKey:@"localizedCallbackErrorMessage"];
  [v18 encodeObject:self->_localizedBiometricRetryMessage forKey:@"localizedBiometricRetryMessage"];
  [v18 encodeObject:self->_localizedUnboundBiometricMessage forKey:@"localizedUnboundBiometricMessage"];
  [v18 encodeBool:self->_disablePasscodeFallback forKey:@"disablePasscodeFallback"];
  [v18 encodeBool:self->_useLocationBasedAuthorization forKey:@"useLocationBasedAuthorization"];
  [v18 encodeObject:self->_clientAnalyticsParameters forKey:@"clientAnalyticsParameters"];
  if (self->_accesssControlRef)
  {
    v14 = (void *)SecAccessControlCopyData();
    if (v14) {
      [v18 encodeObject:v14 forKey:@"accessControlRef"];
    }
  }
  if (self->_shippingAddress)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F1B8F8], "contactWithABRecordRef:");
    [v18 encodeObject:v15 forKey:@"shippingAddress"];
  }
  uint64_t v16 = v18;
  if (self->_billingAddress)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F1B8F8], "contactWithABRecordRef:");
    [v18 encodeObject:v17 forKey:@"billingAddress"];

    uint64_t v16 = v18;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (PKPaymentRequest *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentRequest *)self isEqualToPaymentRequest:v5];

  return v6;
}

- (BOOL)isEqualToPaymentRequest:(id)a3
{
  v42[26] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (unsigned __int8 *)a3;
  v5 = v4;
  BOOL v6 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  BOOL v41 = 0;
  if (self->_merchantCapabilities != *((void *)v4 + 6)) {
    goto LABEL_50;
  }
  if (self->_shippingType != *((void *)v4 + 14)
    || self->_shippingContactEditingMode != *((void *)v4 + 15)
    || self->_requiresAddressPrecision != v4[16]
    || self->_requestor != *((void *)v4 + 40)
    || self->_requestorDeviceType != *((void *)v4 + 62)
    || self->_requestType != *((void *)v4 + 39))
  {
    goto LABEL_49;
  }
  applePayTrustSignatureRequest = self->_applePayTrustSignatureRequest;
  uint64_t v8 = (PKApplePayTrustSignatureRequest *)*((void *)v5 + 32);
  if (applePayTrustSignatureRequest && v8)
  {
    if ((-[PKApplePayTrustSignatureRequest isEqual:](applePayTrustSignatureRequest, "isEqual:") & 1) == 0) {
      goto LABEL_49;
    }
  }
  else if (applePayTrustSignatureRequest != v8)
  {
    goto LABEL_49;
  }
  bankAccounts = self->_bankAccounts;
  objc_super v10 = (NSArray *)*((void *)v5 + 33);
  if (bankAccounts && v10)
  {
    if ((-[NSArray isEqual:](bankAccounts, "isEqual:") & 1) == 0) {
      goto LABEL_49;
    }
  }
  else if (bankAccounts != v10)
  {
    goto LABEL_49;
  }
  if (self->_accountPaymentSupportsPeerPayment != v5[10] || self->_accountPaymentUsePeerPaymentBalance != v5[11]) {
    goto LABEL_49;
  }
  paymentDate = self->_paymentDate;
  v12 = (NSDate *)*((void *)v5 + 35);
  if (paymentDate && v12)
  {
    if ((-[NSDate isEqual:](paymentDate, "isEqual:") & 1) == 0) {
      goto LABEL_49;
    }
  }
  else if (paymentDate != v12)
  {
    goto LABEL_49;
  }
  if (self->_paymentFrequency == *((void *)v5 + 34))
  {
    paymentTimeZone = self->_paymentTimeZone;
    v14 = (NSTimeZone *)*((void *)v5 + 36);
    if (paymentTimeZone && v14)
    {
      if ((-[NSTimeZone isEqual:](paymentTimeZone, "isEqual:") & 1) == 0) {
        goto LABEL_49;
      }
    }
    else if (paymentTimeZone != v14)
    {
      goto LABEL_49;
    }
    if (self->_clientCallbackTimeout != *((double *)v5 + 60) || self->_supportsInstantFundsIn != v5[17]) {
      goto LABEL_49;
    }
    installmentConfiguratiouint64_t n = self->_installmentConfiguration;
    uint64_t v16 = (PKPaymentInstallmentConfiguration *)*((void *)v5 + 61);
    if (installmentConfiguration && v16)
    {
      if (!-[PKPaymentInstallmentConfiguration isEqual:](installmentConfiguration, "isEqual:")) {
        goto LABEL_49;
      }
    }
    else if (installmentConfiguration != v16)
    {
      goto LABEL_49;
    }
    if (self->_supportsCouponCode != v5[8]
      || (unsigned __int16)self->_merchantCategoryCode != *((unsigned __int16 *)v5 + 10))
    {
      goto LABEL_49;
    }
    couponCode = self->_couponCode;
    id v18 = (NSString *)*((void *)v5 + 7);
    if (couponCode && v18)
    {
      if ((-[NSString isEqual:](couponCode, "isEqual:") & 1) == 0) {
        goto LABEL_49;
      }
    }
    else if (couponCode != v18)
    {
      goto LABEL_49;
    }
    if (self->_respectSupportedNetworksOrder == v5[13]
      && self->_disablePasscodeFallback == v5[18]
      && self->_useLocationBasedAuthorization == v5[19])
    {
      BOOL v6 = self->_applePayLaterAvailability == *((void *)v5 + 24);
      goto LABEL_50;
    }
  }
LABEL_49:
  BOOL v6 = 0;
LABEL_50:
  BOOL v41 = v6;
  if (!*((unsigned char *)v39 + 24)) {
    goto LABEL_64;
  }
  v42[0] = @"merchantIdentifier";
  v42[1] = @"multiTokenContexts";
  v42[2] = @"automaticReloadPaymentRequest";
  v42[3] = @"recurringPaymentRequest";
  v42[4] = @"deferredPaymentRequest";
  v42[5] = @"remoteNetworkRequestPaymentTopicID";
  v42[6] = @"countryCode";
  v42[7] = @"supportedNetworks";
  v42[8] = @"paymentSummaryItems";
  v42[9] = @"currencyCode";
  v42[10] = @"billingContact";
  v42[11] = @"shippingContact";
  v42[12] = @"availableShippingMethods";
  v42[13] = @"applicationData";
  v42[14] = @"shippingEditableMessage";
  v42[15] = @"shippingContactEditingMode";
  v42[16] = @"thumbnailURLs";
  v42[17] = @"requiredBillingContactFields";
  v42[18] = @"requiredShippingContactFields";
  v42[19] = @"supportedCountries";
  v42[20] = @"paymentContentItems";
  v42[21] = @"externalizedContext";
  v42[22] = @"passTypeIdentifier";
  v42[23] = @"clientViewSourceIdentifier";
  v42[24] = @"clientViewSourceParameter";
  v42[25] = @"passSerialNumber";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:26];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  uint64_t v33 = __44__PKPaymentRequest_isEqualToPaymentRequest___block_invoke;
  uint64_t v34 = &unk_1E56F5A70;
  v37 = &v38;
  v35 = self;
  v20 = v5;
  uint64_t v36 = v20;
  [v19 enumerateObjectsUsingBlock:&v31];

  if (!*((unsigned char *)v39 + 24)) {
    goto LABEL_64;
  }
  if (!self->_billingAddress && !*((void *)v20 + 19)) {
    goto LABEL_71;
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1B8F8], "contactWithABRecordRef:", v31, v32, v33, v34, v35);
  uint64_t v22 = [MEMORY[0x1E4F1B8F8] contactWithABRecordRef:*((void *)v20 + 19)];
  uint64_t v23 = (void *)v22;
  if (v21 && v22) {
    char v24 = [v21 isEqual:v22];
  }
  else {
    char v24 = v21 == (void *)v22;
  }
  *((unsigned char *)v39 + 24) = v24;

  if (*((unsigned char *)v39 + 24))
  {
LABEL_71:
    if (self->_shippingAddress || *((void *)v20 + 18))
    {
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1B8F8], "contactWithABRecordRef:", v31, v32, v33, v34, v35);
      uint64_t v26 = [MEMORY[0x1E4F1B8F8] contactWithABRecordRef:*((void *)v20 + 18)];
      v27 = (void *)v26;
      if (v25 && v26) {
        char v28 = [v25 isEqual:v26];
      }
      else {
        char v28 = v25 == (void *)v26;
      }
      *((unsigned char *)v39 + 24) = v28;

      BOOL v29 = *((unsigned char *)v39 + 24) != 0;
    }
    else
    {
      BOOL v29 = 1;
    }
  }
  else
  {
LABEL_64:
    BOOL v29 = 0;
  }
  _Block_object_dispose(&v38, 8);

  return v29;
}

void __44__PKPaymentRequest_isEqualToPaymentRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 valueForKey:v7];
  id v9 = [*(id *)(a1 + 40) valueForKey:v7];

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    char v11 = v8 == v9;
  }
  else {
    char v11 = [v8 isEqual:v9];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
}

- (void)setSupportedNetworks:(NSArray *)supportedNetworks
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  v5 = supportedNetworks;
  id v6 = [v4 alloc];
  id v7 = PKInAppSupportedPaymentNetworks();
  uint64_t v8 = (void *)[v6 initWithArray:v7];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__PKPaymentRequest_setSupportedNetworks___block_invoke;
  v12[3] = &unk_1E56D82D0;
  id v13 = v8;
  id v9 = v8;
  BOOL v10 = [(NSArray *)v5 pk_objectsPassingTest:v12];

  char v11 = self->_supportedNetworks;
  self->_supportedNetworks = v10;
}

uint64_t __41__PKPaymentRequest_setSupportedNetworks___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)setMultiTokenContexts:(NSArray *)multiTokenContexts
{
  if (multiTokenContexts)
  {
    objc_super v4 = (NSArray *)[(NSArray *)multiTokenContexts copy];
    v5 = self->_multiTokenContexts;
    self->_multiTokenContexts = v4;
  }
  else
  {
    v5 = self->_multiTokenContexts;
    self->_multiTokenContexts = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)setAccesssControlRef:(__SecAccessControl *)a3
{
  accesssControlRef = self->_accesssControlRef;
  if (accesssControlRef != a3)
  {
    if (accesssControlRef)
    {
      CFRelease(accesssControlRef);
      self->_accesssControlRef = 0;
    }
    if (a3) {
      self->_accesssControlRef = (__SecAccessControl *)CFRetain(a3);
    }
  }
}

- (BOOL)isShippingEditable
{
  return self->_shippingContactEditingMode == 1;
}

- (void)setShippingEditable:(BOOL)a3
{
  self->_shippingContactEditingMode = a3;
}

- (NSArray)shippingMethods
{
  return [(PKShippingMethods *)self->_availableShippingMethods legacyShippingMethods];
}

- (void)setShippingMethods:(NSArray *)shippingMethods
{
  id v6 = shippingMethods;
  if (v6)
  {
    objc_super v4 = [[PKShippingMethods alloc] initWithLegacyShippingMethods:v6];
    availableShippingMethods = self->_availableShippingMethods;
    self->_availableShippingMethods = v4;
  }
  else
  {
    availableShippingMethods = self->_availableShippingMethods;
    self->_availableShippingMethods = 0;
  }
}

- (void)setShippingContactEditingMode:(PKShippingContactEditingMode)shippingContactEditingMode
{
  self->_shippingContactEditingMode = shippingContactEditingMode;
  if (shippingContactEditingMode == PKShippingContactEditingModeAvailable)
  {
    [(PKPaymentRequest *)self setShippingEditableMessage:0];
  }
  else if (shippingContactEditingMode == PKShippingContactEditingModeStorePickup)
  {
    PKLocalizedPaymentString(&cfstr_InAppPaymentSh_11.isa, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(PKPaymentRequest *)self setShippingEditableMessage:v4];
  }
}

- (void)setShippingContact:(PKContact *)shippingContact
{
  v5 = shippingContact;
  id v7 = self->_shippingContact;
  p_shippingContact = &self->_shippingContact;
  uint64_t v8 = v5;
  if (!-[PKContact isEqual:](v7, "isEqual:"))
  {
    objc_storeStrong((id *)p_shippingContact, shippingContact);
    [(PKContact *)*p_shippingContact sanitizePostalAddressCountry];
  }
}

- (void)setBillingContact:(PKContact *)billingContact
{
  v5 = billingContact;
  id v7 = self->_billingContact;
  p_billingContact = &self->_billingContact;
  uint64_t v8 = v5;
  if (!-[PKContact isEqual:](v7, "isEqual:"))
  {
    objc_storeStrong((id *)p_billingContact, billingContact);
    [(PKContact *)*p_billingContact sanitizePostalAddressCountry];
  }
}

- (void)setShippingAddress:(ABRecordRef)shippingAddress
{
  v5 = self->_shippingAddress;
  if (v5)
  {
    CFRelease(v5);
    self->_shippingAddress = 0;
  }
  if (shippingAddress) {
    self->_shippingAddress = (void *)CFRetain(shippingAddress);
  }
}

- (void)setBillingAddress:(ABRecordRef)billingAddress
{
  v5 = self->_billingAddress;
  if (v5)
  {
    CFRelease(v5);
    self->_billingAddress = 0;
  }
  if (billingAddress) {
    self->_billingAddress = (void *)CFRetain(billingAddress);
  }
}

- (void)setRequiredBillingAddressFields:(PKAddressField)requiredBillingAddressFields
{
  id v4 = [(PKPaymentRequest *)self _addressFieldsToContactFields:requiredBillingAddressFields];
  requiredBillingContactFields = self->_requiredBillingContactFields;
  self->_requiredBillingContactFields = v4;
}

- (void)setRequiredShippingAddressFields:(PKAddressField)requiredShippingAddressFields
{
  id v4 = [(PKPaymentRequest *)self _addressFieldsToContactFields:requiredShippingAddressFields];
  requiredShippingContactFields = self->_requiredShippingContactFields;
  self->_requiredShippingContactFields = v4;
}

- (PKAddressField)requiredBillingAddressFields
{
  return [(PKPaymentRequest *)self _contactFieldsToAddressFields:self->_requiredBillingContactFields];
}

- (PKAddressField)requiredShippingAddressFields
{
  return [(PKPaymentRequest *)self _contactFieldsToAddressFields:self->_requiredShippingContactFields];
}

- (id)_addressFieldsToContactFields:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v5 = v4;
  if (v3)
  {
    [v4 addObject:@"post"];
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"name"];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v5 addObject:@"email"];
  if ((v3 & 2) != 0) {
LABEL_5:
  }
    [v5 addObject:@"phone"];
LABEL_6:
  id v6 = (void *)[v5 copy];

  return v6;
}

- (unint64_t)_contactFieldsToAddressFields:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 containsObject:@"post"];
  if ([v3 containsObject:@"name"]) {
    v4 |= 8uLL;
  }
  if ([v3 containsObject:@"email"]) {
    unint64_t v5 = v4 | 4;
  }
  else {
    unint64_t v5 = v4;
  }
  int v6 = [v3 containsObject:@"phone"];

  if (v6) {
    return v5 | 2;
  }
  else {
    return v5;
  }
}

- (BOOL)expectsMerchantSession
{
  return 0;
}

- (id)_transactionAmount
{
  v2 = [(NSArray *)self->_paymentSummaryItems lastObject];
  id v3 = [v2 amount];

  return v3;
}

- (NSData)applicationData
{
  if ([(PKPaymentRequest *)self _shouldUseAmpEnrollmentPinning])
  {
    id v3 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "AMP initiative, ignoring applicationData on PKPaymentRequest", v8, 2u);
    }

    unint64_t v4 = (NSData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:self->_applicationData];
    unint64_t v5 = [(PKPaymentMerchantSession *)self->_merchantSession ampEnrollmentPinning];
    int v6 = (void *)[v5 copy];
    [(NSData *)v4 appendData:v6];
  }
  else
  {
    unint64_t v4 = self->_applicationData;
  }
  return v4;
}

- (BOOL)_shouldUseAmpEnrollmentPinning
{
  v2 = [(PKPaymentMerchantSession *)self->_merchantSession initiative];
  if (([v2 isEqualToString:@"amp_enrollment"] & 1) != 0
    || ([v2 isEqualToString:@"amp_payment_token"] & 1) != 0
    || ([v2 isEqualToString:@"amp_psd2"] & 1) != 0
    || ([v2 isEqualToString:@"amp_applepay_classic"] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isEqualToString:@"amp_verification"];
  }

  return v3;
}

- (id)description
{
  char v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v9 = _PKEnumValueToString(self->_APIType, @"PKPaymentRequestAPIType", @"PKPaymentRequestAPITypeInApp, PKPaymentRequestAPITypeWebJS, PKPaymentRequestAPITypeWebPaymentRequest, PKPaymentRequestAPITypeWinterpeg, PKPaymentRequestAPITypeAMPEnrollment", v4, v5, v6, v7, v8, 0);
  [v3 appendFormat:@"APIType: %@, ", v9, 1, 2, 3, 4];

  BOOL v10 = PKPaymentRequestTypeToString(self->_requestType);
  [v3 appendFormat:@"requestType: %@, ", v10];

  char v11 = 0;
  unint64_t requestor = self->_requestor;
  if (requestor <= 5) {
    char v11 = off_1E56F5B10[requestor];
  }
  [v3 appendFormat:@"requestor: %@, ", v11];
  [v3 appendFormat:@"countryCode: %@, ", self->_countryCode];
  [v3 appendFormat:@"merchantCapabilities: %x, ", self->_merchantCapabilities];
  [v3 appendFormat:@"merchantCategoryCode: %d, ", self->_merchantCategoryCode];
  [v3 appendFormat:@"currencyCode: %@, ", self->_currencyCode];
  unint64_t shippingType = self->_shippingType;
  if (shippingType > 3) {
    v14 = 0;
  }
  else {
    v14 = off_1E56F5B40[shippingType];
  }
  [v3 appendFormat:@"shippingType: %@, ", v14];
  unint64_t applePayLaterAvailability = self->_applePayLaterAvailability;
  if (applePayLaterAvailability > 2) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = off_1E56F5B60[applePayLaterAvailability];
  }
  [v3 appendFormat:@"applePayLaterAvailability: %@, ", v16];
  [v3 appendFormat:@"shouldUseMerchantSession: %d, ", -[PKPaymentRequest shouldUseMerchantSession](self, "shouldUseMerchantSession")];
  [v3 appendFormat:@"suppressTotal: %d, ", self->_suppressTotal];
  [v3 appendFormat:@"paymentSummaryPinned: %d, ", self->_paymentSummaryPinned];
  if (self->_supportedNetworks) {
    [v3 appendFormat:@"supportedNetworks: %@, ", self->_supportedNetworks];
  }
  if (self->_automaticReloadPaymentRequest) {
    [v3 appendFormat:@"automaticPaymentRequest: %@", self->_automaticReloadPaymentRequest];
  }
  if (self->_recurringPaymentRequest) {
    [v3 appendFormat:@"recurringPaymentRequest: %@, ", self->_recurringPaymentRequest];
  }
  if (self->_deferredPaymentRequest) {
    [v3 appendFormat:@"deferredPaymentRequest: %@, ", self->_deferredPaymentRequest];
  }
  if ([(NSArray *)self->_multiTokenContexts count]) {
    [v3 appendFormat:@"multiTokenContexts: %@, ", self->_multiTokenContexts];
  }
  [v3 appendFormat:@"supportsCouponCode: %d, ", self->_supportsCouponCode];
  if (self->_couponCode) {
    [v3 appendFormat:@"couponCode: %@, ", self->_couponCode];
  }
  paymentSummaryItems = self->_paymentSummaryItems;
  if (paymentSummaryItems) {
    [v3 appendFormat:@"paymentSummaryItems: %d, ", -[NSArray count](paymentSummaryItems, "count")];
  }
  paymentContentItems = self->_paymentContentItems;
  if (paymentContentItems) {
    [v3 appendFormat:@"paymentContentItems: %d, ", -[NSArray count](paymentContentItems, "count")];
  }
  if (self->_merchantSession) {
    [v3 appendFormat:@"merchantSession: %@, ", self->_merchantSession];
  }
  if ([(NSSet *)self->_requiredBillingContactFields count]) {
    [v3 appendFormat:@"requiredBillingContactFields: %@, ", self->_requiredBillingContactFields];
  }
  if ([(NSSet *)self->_requiredShippingContactFields count]) {
    [v3 appendFormat:@"requiredShippingContactFields: %@, ", self->_requiredShippingContactFields];
  }
  availableShippingMethods = self->_availableShippingMethods;
  if (availableShippingMethods)
  {
    v20 = [(PKShippingMethods *)availableShippingMethods methods];
    [v3 appendFormat:@"shippingMethods: %d, ", objc_msgSend(v20, "count")];
  }
  applicationData = self->_applicationData;
  if (applicationData) {
    [v3 appendFormat:@"applicationData: %d bytes, ", -[NSData length](applicationData, "length")];
  }
  if (self->_supportedCountries) {
    [v3 appendFormat:@"supportedCountries: %@, ", self->_supportedCountries];
  }
  if (self->_passTypeIdentifier) {
    [v3 appendFormat:@"passTypeIdentifier: %@, ", self->_passTypeIdentifier];
  }
  if (self->_passSerialNumber) {
    [v3 appendFormat:@"passSerialNumber: %@, ", self->_passSerialNumber];
  }
  if (self->_boundInterfaceIdentifier) {
    [v3 appendFormat:@"boundInterfaceIdentifier: %@, ", self->_boundInterfaceIdentifier];
  }
  if (self->_externalizedContext) {
    [v3 appendFormat:@"externalizedContext: %p, ", self->_externalizedContext];
  }
  if (self->_accesssControlRef) {
    [v3 appendFormat:@"accesssControlRef: %p, ", self->_accesssControlRef];
  }
  if (self->_clientViewSourceIdentifier) {
    [v3 appendFormat:@"clientViewSourceIdentifier: %@, ", self->_clientViewSourceIdentifier];
  }
  if (self->_clientViewSourceParameter) {
    [v3 appendFormat:@"clientViewSourceParameter: %@, ", self->_clientViewSourceParameter];
  }
  if (self->_appleIDAuthenticationContext) {
    [v3 appendFormat:@"appleIDAuthenticationContext: %p, ", self->_appleIDAuthenticationContext];
  }
  [v3 appendFormat:@">"];
  uint64_t v22 = (void *)[v3 copy];

  return v22;
}

- (BOOL)_isPSD2StyleRequest
{
  if (self->_requestType) {
    return 0;
  }
  char v3 = [(PKPaymentMerchantSession *)self->_merchantSession initiative];
  char v4 = [v3 isEqualToString:@"amp_psd2"];

  return v4;
}

- (BOOL)_isAMPApplePayClassicRequest
{
  if (self->_requestType) {
    return 0;
  }
  char v3 = [(PKPaymentMerchantSession *)self->_merchantSession initiative];
  char v4 = [v3 isEqualToString:@"amp_applepay_classic"];

  return v4;
}

- (BOOL)_isAMPPayment
{
  if (self->_requestType == 1
    || [(PKPaymentRequest *)self _isPSD2StyleRequest]
    || [(PKPaymentRequest *)self _isAMPApplePayClassicRequest])
  {
    return 1;
  }
  return [(PKPaymentRequest *)self _isPVKRequest];
}

- (BOOL)_isPVKRequest
{
  if (self->_requestType) {
    return 0;
  }
  char v3 = [(PKPaymentMerchantSession *)self->_merchantSession initiative];
  char v4 = [v3 isEqualToString:@"amp_verification"];

  return v4;
}

- (BOOL)isMultiTokenRequest
{
  return !self->_requestType && [(NSArray *)self->_multiTokenContexts count] != 0;
}

- (BOOL)shouldUseMerchantSession
{
  int64_t v3 = [(PKPaymentRequest *)self APIType];
  if ((unint64_t)(v3 - 1) < 4) {
    return 1;
  }
  if (v3) {
    return 0;
  }
  unint64_t v5 = [(PKPaymentRequest *)self requestType];
  if (v5 > 0xE) {
    return 0;
  }
  if (((1 << v5) & 0x5401) != 0) {
    return [(NSString *)self->_merchantIdentifier length] == 0;
  }
  return v5 == 3;
}

- (NSString)hashedMerchantIdentifier
{
  if ([(PKPaymentRequest *)self shouldUseMerchantSession])
  {
    int64_t v3 = [(PKPaymentMerchantSession *)self->_merchantSession merchantIdentifier];
  }
  else
  {
    merchantIdentifier = self->_merchantIdentifier;
    if (merchantIdentifier)
    {
      unint64_t v5 = [(NSString *)merchantIdentifier dataUsingEncoding:4];
      uint64_t v6 = [v5 SHA256Hash];
      int64_t v3 = [v6 hexEncoding];
    }
    else
    {
      int64_t v3 = 0;
    }
  }
  uint64_t v7 = [v3 lowercaseString];
  uint64_t v8 = objc_msgSend(v7, "pk_stringIfNotEmpty");

  return (NSString *)v8;
}

- (NSString)analyticsSubject
{
  return (NSString *)[(NSDictionary *)self->_clientAnalyticsParameters PKStringForKey:@"subject"];
}

- (NSString)analyticsPageTag
{
  return (NSString *)[(NSDictionary *)self->_clientAnalyticsParameters PKStringForKey:@"pageTag"];
}

- (NSString)analyticsProductType
{
  return (NSString *)[(NSDictionary *)self->_clientAnalyticsParameters PKStringForKey:@"productType"];
}

- (PKPaymentRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PKPaymentRequest *)self init];

  if (!v7) {
    goto LABEL_110;
  }
  uint64_t v129 = a4;
  uint64_t v135 = v6;
  uint64_t v8 = [v6 PKDictionaryForKey:@"applePay"];
  v130 = [v8 PKStringForKey:@"merchantIdentifier"];
  objc_storeStrong((id *)&v7->_merchantIdentifier, v130);
  v134 = v8;
  [v8 PKArrayForKey:@"merchantCapabilities"];
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v170 objects:v181 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v171;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v171 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v170 + 1) + 8 * i);
        if ([v13 isEqualToString:@"supports3DS"]) {
          v7->_merchantCapabilities |= 1uLL;
        }
        if ([v13 isEqualToString:@"supportsEMV"]) {
          v7->_merchantCapabilities |= 2uLL;
        }
        if ([v13 isEqualToString:@"supportsCredit"]) {
          v7->_merchantCapabilities |= 4uLL;
        }
        if ([v13 isEqualToString:@"supportsDebit"]) {
          v7->_merchantCapabilities |= 8uLL;
        }
        if ([v13 isEqualToString:@"supportsEWallet"]) {
          v7->_merchantCapabilities |= 0x10uLL;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v170 objects:v181 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [v8 PKDictionaryForKey:@"automaticReloadPaymentRequest"];
  if (v14)
  {
    v15 = [[PKAutomaticReloadPaymentRequest alloc] initWithDictionary:v14 error:0];
    automaticReloadPaymentRequest = v7->_automaticReloadPaymentRequest;
    v7->_automaticReloadPaymentRequest = v15;
  }
  v128 = (void *)v14;
  uint64_t v17 = [v134 PKDictionaryForKey:@"recurringPaymentRequest"];
  if (v17)
  {
    id v18 = [[PKRecurringPaymentRequest alloc] initWithDictionary:v17 error:0];
    recurringPaymentRequest = v7->_recurringPaymentRequest;
    v7->_recurringPaymentRequest = v18;
  }
  uint64_t v127 = (void *)v17;
  v20 = [v134 PKArrayForKey:@"multiTokenContexts"];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v166 objects:v180 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v167;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v167 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [[PKPaymentTokenContext alloc] initWithDictionary:*(void *)(*((void *)&v166 + 1) + 8 * j) error:0];
        [v21 addObject:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v166 objects:v180 count:16];
    }
    while (v24);
  }
  uint64_t v125 = v22;

  v126 = v21;
  uint64_t v28 = [v21 copy];
  multiTokenContexts = v7->_multiTokenContexts;
  v7->_multiTokenContexts = (NSArray *)v28;

  uint64_t v30 = PKInAppSupportedPaymentNetworks();
  uint64_t v31 = [v134 PKArrayForKey:@"supportedNetworks"];
  id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v138 = v31;
  uint64_t v32 = [v138 countByEnumeratingWithState:&v162 objects:v179 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v163;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v163 != v34) {
          objc_enumerationMutation(v138);
        }
        uint64_t v36 = *(void *)(*((void *)&v162 + 1) + 8 * k);
        v161[0] = MEMORY[0x1E4F143A8];
        v161[1] = 3221225472;
        v161[2] = __45__PKPaymentRequest_initWithDictionary_error___block_invoke;
        v161[3] = &unk_1E56D82D0;
        v161[4] = v36;
        uint64_t v37 = [v30 indexOfObjectPassingTest:v161];
        if (v37 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v38 = [v30 objectAtIndexedSubscript:v37];
          [v137 addObject:v38];
        }
      }
      uint64_t v33 = [v138 countByEnumeratingWithState:&v162 objects:v179 count:16];
    }
    while (v33);
  }

  if ([v137 count])
  {
    uint64_t v39 = [v137 copy];
    supportedNetworks = v7->_supportedNetworks;
    v7->_supportedNetworks = (NSArray *)v39;
  }
  BOOL v41 = v135;
  v124 = [v135 PKStringForKey:@"countryCode"];
  objc_storeStrong((id *)&v7->_countryCode, v124);
  uint64_t v123 = [v135 PKStringForKey:@"currencyCode"];
  objc_storeStrong((id *)&v7->_currencyCode, v123);
  v7->_supportsCouponCode = [v135 PKBoolForKey:@"supportsCouponCode"];
  uint64_t v42 = [v135 PKStringForKey:@"couponCode"];
  couponCode = v7->_couponCode;
  v7->_couponCode = (NSString *)v42;

  v122 = [v135 PKNumberForKey:@"merchantCategoryCode"];
  v7->_merchantCategoryCode = [v122 shortValue];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v135 PKArrayForKey:@"lineItems"];
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = [v45 countByEnumeratingWithState:&v157 objects:v178 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v158;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v158 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = [[PKPaymentSummaryItem alloc] initWithDictionary:*(void *)(*((void *)&v157 + 1) + 8 * m) error:0];
        [v44 addObject:v50];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v157 objects:v178 count:16];
    }
    while (v47);
  }

  v120 = [v135 PKDictionaryForKey:@"total"];
  uint64_t v119 = [[PKPaymentSummaryItem alloc] initWithDictionary:v120 error:0];
  objc_msgSend(v44, "addObject:");
  uint64_t v51 = [v44 copy];
  paymentSummaryItems = v7->_paymentSummaryItems;
  v7->_paymentSummaryItems = (NSArray *)v51;

  id v140 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v132 = [v135 PKArrayForKey:@"shippingMethods"];
  id v133 = v45;
  if (v132)
  {
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v53 = v132;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v153 objects:v177 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v154;
      do
      {
        for (uint64_t n = 0; n != v55; ++n)
        {
          if (*(void *)v154 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = [[PKShippingMethod alloc] initWithDictionary:*(void *)(*((void *)&v153 + 1) + 8 * n) error:0];
          [v140 addObject:v58];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v153 objects:v177 count:16];
      }
      while (v55);
    }

    uint64_t v59 = [[PKShippingMethods alloc] initWithLegacyShippingMethods:v140];
    availableShippingMethods = v7->_availableShippingMethods;
    v7->_availableShippingMethods = v59;
  }
  v61 = [v135 PKStringForKey:@"shippingType"];
  v7->_unint64_t shippingType = 0;
  if ([v61 isEqualToString:@"delivery"])
  {
    uint64_t v62 = 1;
LABEL_63:
    v7->_unint64_t shippingType = v62;
    goto LABEL_64;
  }
  if ([v61 isEqualToString:@"storePickup"])
  {
    uint64_t v62 = 2;
    goto LABEL_63;
  }
  if ([v61 isEqualToString:@"servicePickup"])
  {
    uint64_t v62 = 3;
    goto LABEL_63;
  }
LABEL_64:
  v118 = v61;
  uint64_t v121 = v44;
  uint64_t v63 = [v135 PKStringForKey:@"applicationData"];
  if (v63)
  {
    uint64_t v64 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v63 options:0];
    applicationData = v7->_applicationData;
    v7->_applicationData = (NSData *)v64;
  }
  uint64_t v117 = (void *)v63;
  uint64_t v131 = [v135 PKArrayForKey:@"supportedCountries"];
  if (v131)
  {
    uint64_t v66 = [MEMORY[0x1E4F1CA80] set];
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id v67 = v131;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v149 objects:v176 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v150;
      do
      {
        for (iuint64_t i = 0; ii != v69; ++ii)
        {
          if (*(void *)v150 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void *)(*((void *)&v149 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v66 addObject:v72];
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v149 objects:v176 count:16];
      }
      while (v69);
    }

    if ([v66 count])
    {
      uint64_t v73 = [v66 copy];
      supportedCountries = v7->_supportedCountries;
      v7->_supportedCountries = (NSSet *)v73;
    }
    BOOL v41 = v135;
  }
  uint64_t v75 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"email", @"name", @"phone", @"postalAddress", @"phoneticName", 0);
  long long v76 = [v41 PKArrayForKey:@"requiredShippingContactFields"];
  id v136 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v77 = v76;
  uint64_t v78 = [v77 countByEnumeratingWithState:&v145 objects:v175 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v146;
    do
    {
      for (juint64_t j = 0; jj != v79; ++jj)
      {
        if (*(void *)v146 != v80) {
          objc_enumerationMutation(v77);
        }
        uint64_t v82 = *(void *)(*((void *)&v145 + 1) + 8 * jj);
        if ([v75 containsObject:v82]) {
          [v136 addObject:v82];
        }
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v145 objects:v175 count:16];
    }
    while (v79);
  }

  if ([v136 count])
  {
    uint64_t v83 = [v136 copy];
    requiredShippingContactFields = v7->_requiredShippingContactFields;
    v7->_requiredShippingContactFields = (NSSet *)v83;
  }
  uint64_t v85 = [v41 PKArrayForKey:@"requiredBillingContactFields"];
  id v86 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v87 = v85;
  uint64_t v88 = [v87 countByEnumeratingWithState:&v141 objects:v174 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v142;
    do
    {
      for (kuint64_t k = 0; kk != v89; ++kk)
      {
        if (*(void *)v142 != v90) {
          objc_enumerationMutation(v87);
        }
        uint64_t v92 = *(void *)(*((void *)&v141 + 1) + 8 * kk);
        if ([v75 containsObject:v92]) {
          [v86 addObject:v92];
        }
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v141 objects:v174 count:16];
    }
    while (v89);
  }

  if ([v86 count])
  {
    uint64_t v93 = [v86 copy];
    requiredBillingContactFields = v7->_requiredBillingContactFields;
    v7->_requiredBillingContactFields = (NSSet *)v93;
  }
  uint64_t v95 = [v135 PKDictionaryForKey:@"shippingContact"];
  if (v95)
  {
    long long v96 = [[PKContact alloc] initWithDictionary:v95 error:0];
    shippingContact = v7->_shippingContact;
    v7->_shippingContact = v96;

    [(PKContact *)v7->_shippingContact sanitizePostalAddressCountry];
  }
  uint64_t v98 = [v135 PKDictionaryForKey:@"billingContact"];
  if (v98)
  {
    v99 = [[PKContact alloc] initWithDictionary:v98 error:0];
    billingContact = v7->_billingContact;
    v7->_billingContact = v99;

    [(PKContact *)v7->_billingContact sanitizePostalAddressCountry];
  }
  uint64_t v115 = (void *)v98;
  v116 = (void *)v95;
  uint64_t v101 = [v135 PKStringForKey:@"APIType"];
  v102 = v101;
  uint64_t v103 = v133;
  if (v101)
  {
    id v104 = v101;
    uint64_t v105 = [NSNumber numberWithInt:0];
    int64_t v110 = (int)_PKEnumValueFromString(v104, v105, @"PKPaymentRequestAPIType", @"PKPaymentRequestAPITypeInApp, PKPaymentRequestAPITypeWebJS, PKPaymentRequestAPITypeWebPaymentRequest, PKPaymentRequestAPITypeWinterpeg, PKPaymentRequestAPITypeAMPEnrollment", v106, v107, v108, v109, 0);

    v7->_APIType = v110;
    uint64_t v103 = v133;
  }
  uint64_t v111 = +[PKPaymentRequestValidator validatorWithObject:v7];
  char v112 = [v111 isValidWithAPIType:v7->_APIType withError:v129];

  if ((v112 & 1) == 0)
  {

    uint64_t v7 = 0;
  }

  id v6 = v135;
LABEL_110:
  uint64_t v113 = v7;

  return v113;
}

BOOL __45__PKPaymentRequest_initWithDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 compare:*(void *)(a1 + 32) options:1] == 0;
}

+ (id)errorFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v5 = [v3 objectForKeyedSubscript:@"message"];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  id v6 = [v3 objectForKey:@"code"];
  if ([v6 isEqualToString:@"shippingContactInvalid"])
  {
    uint64_t v7 = 1;
  }
  else if ([v6 isEqualToString:@"billingContactInvalid"])
  {
    uint64_t v7 = 2;
  }
  else if ([v6 isEqualToString:@"shippingAddressUnserviceable"])
  {
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = -1;
  }
  uint64_t v8 = [v3 objectForKey:@"contactField"];
  if ([v8 isEqualToString:@"phoneNumber"])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &PKContactFieldPhoneNumber;
LABEL_18:
    uint64_t v11 = (__CFString *)*v10;
    v12 = v11;
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"emailAddress"])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &PKContactFieldEmailAddress;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"name"])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &PKContactFieldName;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"phoneticName"])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &PKContactFieldPhoneticName;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"postalAddress"])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &PKContactFieldPostalAddress;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"addressLines"])
  {
    v12 = @"post";
    uint64_t v16 = (void **)MEMORY[0x1E4F1B7C8];
  }
  else if ([v8 isEqualToString:@"locality"])
  {
    v12 = @"post";
    uint64_t v16 = (void **)MEMORY[0x1E4F1B798];
  }
  else if ([v8 isEqualToString:@"subLocality"])
  {
    v12 = @"post";
    uint64_t v16 = (void **)MEMORY[0x1E4F1B7D8];
  }
  else if ([v8 isEqualToString:@"postalCode"])
  {
    v12 = @"post";
    uint64_t v16 = (void **)MEMORY[0x1E4F1B7B0];
  }
  else if ([v8 isEqualToString:@"administrativeArea"])
  {
    v12 = @"post";
    uint64_t v16 = (void **)MEMORY[0x1E4F1B7C0];
  }
  else if ([v8 isEqualToString:@"subAdministrativeArea"])
  {
    v12 = @"post";
    uint64_t v16 = (void **)MEMORY[0x1E4F1B7D0];
  }
  else if ([v8 isEqualToString:@"country"])
  {
    v12 = @"post";
    uint64_t v16 = (void **)MEMORY[0x1E4F1B7A0];
  }
  else
  {
    if (![v8 isEqualToString:@"countryCode"])
    {
      uint64_t v9 = 0;
      v12 = 0;
      goto LABEL_22;
    }
    v12 = @"post";
    uint64_t v16 = (void **)MEMORY[0x1E4F1B7A8];
  }
  uint64_t v11 = (__CFString *)*v16;
  uint64_t v9 = v11;
LABEL_19:
  id v13 = v11;
  if (v12)
  {
    [v4 setObject:v12 forKey:@"PKPaymentErrorContactField"];
    if (v9) {
      [v4 setObject:v9 forKey:@"PKPaymentErrorPostalAddress"];
    }
  }
LABEL_22:
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKPaymentErrorDomain" code:v7 userInfo:v4];

  return v14;
}

+ (NSError)paymentContactInvalidErrorWithContactField:(PKContactField)field localizedDescription:(NSString *)localizedDescription
{
  v14[2] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (objc_class *)MEMORY[0x1E4F28C58];
  id v6 = localizedDescription;
  uint64_t v7 = field;
  id v8 = [v5 alloc];
  v13[0] = *MEMORY[0x1E4F28568];
  v13[1] = @"PKPaymentErrorContactField";
  uint64_t v9 = &stru_1EE0F5368;
  if (v6) {
    uint64_t v9 = (__CFString *)v6;
  }
  v14[0] = v9;
  v14[1] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  uint64_t v11 = (void *)[v8 initWithDomain:@"PKPaymentErrorDomain" code:1 userInfo:v10];
  return (NSError *)v11;
}

+ (NSError)paymentShippingAddressInvalidErrorWithKey:(NSString *)postalAddressKey localizedDescription:(NSString *)localizedDescription
{
  void v14[3] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (objc_class *)MEMORY[0x1E4F28C58];
  id v6 = localizedDescription;
  uint64_t v7 = postalAddressKey;
  id v8 = [v5 alloc];
  uint64_t v9 = &stru_1EE0F5368;
  v13[0] = *MEMORY[0x1E4F28568];
  v13[1] = @"PKPaymentErrorContactField";
  if (v6) {
    uint64_t v9 = (__CFString *)v6;
  }
  v14[0] = v9;
  v14[1] = @"post";
  void v13[2] = @"PKPaymentErrorPostalAddress";
  v14[2] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  uint64_t v11 = (void *)[v8 initWithDomain:@"PKPaymentErrorDomain" code:1 userInfo:v10];
  return (NSError *)v11;
}

+ (NSError)paymentBillingAddressInvalidErrorWithKey:(NSString *)postalAddressKey localizedDescription:(NSString *)localizedDescription
{
  void v14[3] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (objc_class *)MEMORY[0x1E4F28C58];
  id v6 = localizedDescription;
  uint64_t v7 = postalAddressKey;
  id v8 = [v5 alloc];
  uint64_t v9 = &stru_1EE0F5368;
  v13[0] = *MEMORY[0x1E4F28568];
  v13[1] = @"PKPaymentErrorContactField";
  if (v6) {
    uint64_t v9 = (__CFString *)v6;
  }
  v14[0] = v9;
  v14[1] = @"post";
  void v13[2] = @"PKPaymentErrorPostalAddress";
  v14[2] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  uint64_t v11 = (void *)[v8 initWithDomain:@"PKPaymentErrorDomain" code:2 userInfo:v10];
  return (NSError *)v11;
}

+ (NSError)paymentShippingAddressUnserviceableErrorWithLocalizedDescription:(NSString *)localizedDescription
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F28C58];
  id v4 = localizedDescription;
  id v5 = [v3 alloc];
  id v6 = &stru_1EE0F5368;
  v10[0] = *MEMORY[0x1E4F28568];
  v10[1] = @"PKPaymentErrorContactField";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  v11[0] = v6;
  v11[1] = @"post";
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v8 = (void *)[v5 initWithDomain:@"PKPaymentErrorDomain" code:3 userInfo:v7];
  return (NSError *)v8;
}

+ (NSError)paymentCouponCodeInvalidErrorWithLocalizedDescription:(NSString *)localizedDescription
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (localizedDescription) {
    id v3 = (__CFString *)localizedDescription;
  }
  else {
    id v3 = &stru_1EE0F5368;
  }
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = v3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = localizedDescription;
  id v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);

  id v8 = (void *)[v7 initWithDomain:@"PKPaymentErrorDomain" code:4 userInfo:v6];
  return (NSError *)v8;
}

+ (NSError)paymentCouponCodeExpiredErrorWithLocalizedDescription:(NSString *)localizedDescription
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (localizedDescription) {
    id v3 = (__CFString *)localizedDescription;
  }
  else {
    id v3 = &stru_1EE0F5368;
  }
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = v3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = localizedDescription;
  id v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);

  id v8 = (void *)[v7 initWithDomain:@"PKPaymentErrorDomain" code:5 userInfo:v6];
  return (NSError *)v8;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(NSString *)merchantIdentifier
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(NSString *)countryCode
{
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (PKMerchantCapability)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(PKMerchantCapability)merchantCapabilities
{
  self->_merchantCapabilities = merchantCapabilities;
}

- (BOOL)supportsCouponCode
{
  return self->_supportsCouponCode;
}

- (void)setSupportsCouponCode:(BOOL)supportsCouponCode
{
  self->_supportsCouponCode = supportsCouponCode;
}

- (NSString)couponCode
{
  return self->_couponCode;
}

- (void)setCouponCode:(NSString *)couponCode
{
}

- (signed)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void)setMerchantCategoryCode:(signed __int16)a3
{
  self->_merchantCategoryCode = a3;
}

- (NSArray)paymentSummaryItems
{
  return self->_paymentSummaryItems;
}

- (void)setPaymentSummaryItems:(NSArray *)paymentSummaryItems
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(NSString *)currencyCode
{
}

- (NSSet)requiredBillingContactFields
{
  return self->_requiredBillingContactFields;
}

- (void)setRequiredBillingContactFields:(NSSet *)requiredBillingContactFields
{
}

- (PKContact)billingContact
{
  return self->_billingContact;
}

- (NSSet)requiredShippingContactFields
{
  return self->_requiredShippingContactFields;
}

- (void)setRequiredShippingContactFields:(NSSet *)requiredShippingContactFields
{
}

- (PKContact)shippingContact
{
  return self->_shippingContact;
}

- (PKShippingType)shippingType
{
  return self->_shippingType;
}

- (void)setShippingType:(PKShippingType)shippingType
{
  self->_unint64_t shippingType = shippingType;
}

- (PKShippingContactEditingMode)shippingContactEditingMode
{
  return self->_shippingContactEditingMode;
}

- (void)setApplicationData:(NSData *)applicationData
{
}

- (NSSet)supportedCountries
{
  return self->_supportedCountries;
}

- (void)setSupportedCountries:(NSSet *)supportedCountries
{
}

- (ABRecordRef)shippingAddress
{
  return self->_shippingAddress;
}

- (ABRecordRef)billingAddress
{
  return self->_billingAddress;
}

- (NSArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (PKRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void)setRecurringPaymentRequest:(PKRecurringPaymentRequest *)recurringPaymentRequest
{
}

- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void)setAutomaticReloadPaymentRequest:(PKAutomaticReloadPaymentRequest *)automaticReloadPaymentRequest
{
}

- (PKDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void)setDeferredPaymentRequest:(PKDeferredPaymentRequest *)deferredPaymentRequest
{
}

- (PKApplePayLaterAvailability)applePayLaterAvailability
{
  return self->_applePayLaterAvailability;
}

- (void)setApplePayLaterAvailability:(PKApplePayLaterAvailability)applePayLaterAvailability
{
  self->_unint64_t applePayLaterAvailability = applePayLaterAvailability;
}

- (NSArray)thumbnailURLs
{
  return self->_thumbnailURLs;
}

- (void)setThumbnailURLs:(id)a3
{
}

- (NSURL)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
}

- (void)setExpectsMerchantSession:(BOOL)a3
{
  self->_expectsMerchantSessiouint64_t n = a3;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  return self->_sourceApplicationSecondaryIdentifier;
}

- (void)setSourceApplicationSecondaryIdentifier:(id)a3
{
}

- (NSString)CTDataConnectionServiceType
{
  return self->_CTDataConnectionServiceType;
}

- (void)setCTDataConnectionServiceType:(id)a3
{
}

- (NSString)boundInterfaceIdentifier
{
  return self->_boundInterfaceIdentifier;
}

- (void)setBoundInterfaceIdentifier:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (PKApplePayTrustSignatureRequest)applePayTrustSignatureRequest
{
  return self->_applePayTrustSignatureRequest;
}

- (void)setApplePayTrustSignatureRequest:(id)a3
{
}

- (NSArray)bankAccounts
{
  return self->_bankAccounts;
}

- (void)setBankAccounts:(id)a3
{
}

- (BOOL)accountPaymentSupportsPeerPayment
{
  return self->_accountPaymentSupportsPeerPayment;
}

- (void)setAccountPaymentSupportsPeerPayment:(BOOL)a3
{
  self->_accountPaymentSupportsPeerPayment = a3;
}

- (BOOL)accountPaymentUsePeerPaymentBalance
{
  return self->_accountPaymentUsePeerPaymentBalance;
}

- (void)setAccountPaymentUsePeerPaymentBalance:(BOOL)a3
{
  self->_accountPaymentUsePeerPaymentBalance = a3;
}

- (BOOL)deviceSupportsPeerPaymentAccountPayment
{
  return self->_deviceSupportsPeerPaymentAccountPayment;
}

- (void)setDeviceSupportsPeerPaymentAccountPayment:(BOOL)a3
{
  self->_deviceSupportsPeerPaymentAccountPayment = a3;
}

- (int64_t)paymentFrequency
{
  return self->_paymentFrequency;
}

- (void)setPaymentFrequency:(int64_t)a3
{
  self->_paymentFrequency = a3;
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(id)a3
{
}

- (NSTimeZone)paymentTimeZone
{
  return self->_paymentTimeZone;
}

- (void)setPaymentTimeZone:(id)a3
{
}

- (NSString)remoteNetworkRequestPaymentTopicID
{
  return self->_remoteNetworkRequestPaymentTopicID;
}

- (void)setRemoteNetworkRequestPaymentTopicID:(id)a3
{
}

- (int64_t)APIType
{
  return self->_APIType;
}

- (void)setAPIType:(int64_t)a3
{
  self->_APIType = a3;
}

- (BOOL)respectSupportedNetworksOrder
{
  return self->_respectSupportedNetworksOrder;
}

- (void)setRespectSupportedNetworksOrder:(BOOL)a3
{
  self->_respectSupportedNetworksOrder = a3;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)requestor
{
  return self->_requestor;
}

- (void)setRequestor:(unint64_t)a3
{
  self->_unint64_t requestor = a3;
}

- (NSArray)paymentContentItems
{
  return self->_paymentContentItems;
}

- (void)setPaymentContentItems:(id)a3
{
}

- (BOOL)suppressTotal
{
  return self->_suppressTotal;
}

- (void)setSuppressTotal:(BOOL)a3
{
  self->_suppressTotal = a3;
}

- (BOOL)isPaymentSummaryPinned
{
  return self->_paymentSummaryPinned;
}

- (void)setPaymentSummaryPinned:(BOOL)a3
{
  self->_paymentSummaryPinned = a3;
}

- (NSString)localizedSummaryItemsTitle
{
  return self->_localizedSummaryItemsTitle;
}

- (void)setLocalizedSummaryItemsTitle:(id)a3
{
}

- (AKAppleIDAuthenticationContext)appleIDAuthenticationContext
{
  return self->_appleIDAuthenticationContext;
}

- (void)setAppleIDAuthenticationContext:(id)a3
{
}

- (NSString)localizedNavigationTitle
{
  return self->_localizedNavigationTitle;
}

- (void)setLocalizedNavigationTitle:(id)a3
{
}

- (unint64_t)confirmationStyle
{
  return self->_confirmationStyle;
}

- (void)setConfirmationStyle:(unint64_t)a3
{
  self->_confirmationStyle = a3;
}

- (NSString)localizedConfirmationTitle
{
  return self->_localizedConfirmationTitle;
}

- (void)setLocalizedConfirmationTitle:(id)a3
{
}

- (NSString)localizedBiometricConfirmationTitle
{
  return self->_localizedBiometricConfirmationTitle;
}

- (void)setLocalizedBiometricConfirmationTitle:(id)a3
{
}

- (NSString)localizedPasswordButtonTitle
{
  return self->_localizedPasswordButtonTitle;
}

- (void)setLocalizedPasswordButtonTitle:(id)a3
{
}

- (NSString)localizedAuthorizingTitle
{
  return self->_localizedAuthorizingTitle;
}

- (void)setLocalizedAuthorizingTitle:(id)a3
{
}

- (NSString)localizedErrorMessage
{
  return self->_localizedErrorMessage;
}

- (void)setLocalizedErrorMessage:(id)a3
{
}

- (NSString)localizedCallbackErrorTitle
{
  return self->_localizedCallbackErrorTitle;
}

- (void)setLocalizedCallbackErrorTitle:(id)a3
{
}

- (NSString)localizedCallbackErrorMessage
{
  return self->_localizedCallbackErrorMessage;
}

- (void)setLocalizedCallbackErrorMessage:(id)a3
{
}

- (NSString)localizedBiometricRetryMessage
{
  return self->_localizedBiometricRetryMessage;
}

- (void)setLocalizedBiometricRetryMessage:(id)a3
{
}

- (NSString)localizedUnboundBiometricMessage
{
  return self->_localizedUnboundBiometricMessage;
}

- (void)setLocalizedUnboundBiometricMessage:(id)a3
{
}

- (NSString)shippingEditableMessage
{
  return self->_shippingEditableMessage;
}

- (void)setShippingEditableMessage:(id)a3
{
}

- (BOOL)requiresAddressPrecision
{
  return self->_requiresAddressPrecision;
}

- (void)setRequiresAddressPrecision:(BOOL)a3
{
  self->_requiresAddressPrecisiouint64_t n = a3;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
}

- (PKShippingMethods)availableShippingMethods
{
  return self->_availableShippingMethods;
}

- (void)setAvailableShippingMethods:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (double)clientCallbackTimeout
{
  return self->_clientCallbackTimeout;
}

- (void)setClientCallbackTimeout:(double)a3
{
  self->_clientCallbackTimeout = a3;
}

- (BOOL)supportsInstantFundsIn
{
  return self->_supportsInstantFundsIn;
}

- (void)setSupportsInstantFundsIn:(BOOL)a3
{
  self->_supportsInstantFundsIuint64_t n = a3;
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
}

- (int64_t)requestorDeviceType
{
  return self->_requestorDeviceType;
}

- (void)setRequestorDeviceType:(int64_t)a3
{
  self->_requestorDeviceType = a3;
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
}

- (__SecAccessControl)accesssControlRef
{
  return self->_accesssControlRef;
}

- (BOOL)disablePasscodeFallback
{
  return self->_disablePasscodeFallback;
}

- (void)setDisablePasscodeFallback:(BOOL)a3
{
  self->_disablePasscodeFallbacuint64_t k = a3;
}

- (BOOL)useLocationBasedAuthorization
{
  return self->_useLocationBasedAuthorization;
}

- (void)setUseLocationBasedAuthorization:(BOOL)a3
{
  self->_useLocationBasedAuthorizatiouint64_t n = a3;
}

- (NSString)clientViewSourceIdentifier
{
  return self->_clientViewSourceIdentifier;
}

- (void)setClientViewSourceIdentifier:(id)a3
{
}

- (NSDictionary)clientViewSourceParameter
{
  return self->_clientViewSourceParameter;
}

- (void)setClientViewSourceParameter:(id)a3
{
}

- (NSDictionary)clientAnalyticsParameters
{
  return self->_clientAnalyticsParameters;
}

- (void)setClientAnalyticsParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAnalyticsParameters, 0);
  objc_storeStrong((id *)&self->_clientViewSourceParameter, 0);
  objc_storeStrong((id *)&self->_clientViewSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_availableShippingMethods, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_shippingEditableMessage, 0);
  objc_storeStrong((id *)&self->_localizedUnboundBiometricMessage, 0);
  objc_storeStrong((id *)&self->_localizedBiometricRetryMessage, 0);
  objc_storeStrong((id *)&self->_localizedCallbackErrorMessage, 0);
  objc_storeStrong((id *)&self->_localizedCallbackErrorTitle, 0);
  objc_storeStrong((id *)&self->_localizedErrorMessage, 0);
  objc_storeStrong((id *)&self->_localizedAuthorizingTitle, 0);
  objc_storeStrong((id *)&self->_localizedPasswordButtonTitle, 0);
  objc_storeStrong((id *)&self->_localizedBiometricConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_localizedConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_localizedNavigationTitle, 0);
  objc_storeStrong((id *)&self->_appleIDAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_localizedSummaryItemsTitle, 0);
  objc_storeStrong((id *)&self->_paymentContentItems, 0);
  objc_storeStrong((id *)&self->_remoteNetworkRequestPaymentTopicID, 0);
  objc_storeStrong((id *)&self->_paymentTimeZone, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_bankAccounts, 0);
  objc_storeStrong((id *)&self->_applePayTrustSignatureRequest, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_boundInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_CTDataConnectionServiceType, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_thumbnailURLs, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_supportedCountries, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_requiredShippingContactFields, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
  objc_storeStrong((id *)&self->_requiredBillingContactFields, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_paymentSummaryItems, 0);
  objc_storeStrong((id *)&self->_couponCode, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end