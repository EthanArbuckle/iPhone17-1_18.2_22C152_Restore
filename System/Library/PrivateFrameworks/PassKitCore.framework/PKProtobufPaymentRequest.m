@interface PKProtobufPaymentRequest
+ (Class)contentItemsType;
+ (Class)multiTokenContextsType;
+ (Class)requiredBillingContactFieldsType;
+ (Class)requiredShippingContactFieldsType;
+ (Class)shippingMethodsType;
+ (Class)summaryItemsType;
+ (Class)supportedCountriesType;
+ (Class)supportedNetworksType;
+ (Class)thumbnailURLsType;
- (BOOL)expectsMerchantSession;
- (BOOL)hasApiType;
- (BOOL)hasApplicationData;
- (BOOL)hasAutomaticReloadPaymentRequest;
- (BOOL)hasAvailableShippingMethods;
- (BOOL)hasBillingContact;
- (BOOL)hasConfirmationStyle;
- (BOOL)hasCountryCode;
- (BOOL)hasCurrencyCode;
- (BOOL)hasDeferredPaymentRequest;
- (BOOL)hasExpectsMerchantSession;
- (BOOL)hasLocalizedNavigationTitle;
- (BOOL)hasLocalizedSummaryItemsTitle;
- (BOOL)hasMerchantCapabilities;
- (BOOL)hasMerchantCategoryCode;
- (BOOL)hasMerchantIdentifier;
- (BOOL)hasMerchantSession;
- (BOOL)hasOriginatingURL;
- (BOOL)hasRecurringPaymentRequest;
- (BOOL)hasRequestType;
- (BOOL)hasRequestor;
- (BOOL)hasRequestorDeviceType;
- (BOOL)hasRequiredBillingAddressFields;
- (BOOL)hasRequiredShippingAddressFields;
- (BOOL)hasRespectSupportedNetworksOrder;
- (BOOL)hasShippingContact;
- (BOOL)hasSummaryPinned;
- (BOOL)hasSuppressTotal;
- (BOOL)hasUserAgent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)respectSupportedNetworksOrder;
- (BOOL)summaryPinned;
- (BOOL)suppressTotal;
- (NSData)applicationData;
- (NSData)billingContact;
- (NSData)shippingContact;
- (NSMutableArray)contentItems;
- (NSMutableArray)multiTokenContexts;
- (NSMutableArray)requiredBillingContactFields;
- (NSMutableArray)requiredShippingContactFields;
- (NSMutableArray)shippingMethods;
- (NSMutableArray)summaryItems;
- (NSMutableArray)supportedCountries;
- (NSMutableArray)supportedNetworks;
- (NSMutableArray)thumbnailURLs;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)localizedNavigationTitle;
- (NSString)localizedSummaryItemsTitle;
- (NSString)merchantIdentifier;
- (NSString)originatingURL;
- (NSString)userAgent;
- (PKProtobufAutomaticReloadPaymentRequest)automaticReloadPaymentRequest;
- (PKProtobufDeferredPaymentRequest)deferredPaymentRequest;
- (PKProtobufPaymentMerchantSession)merchantSession;
- (PKProtobufRecurringPaymentRequest)recurringPaymentRequest;
- (PKProtobufShippingMethods)availableShippingMethods;
- (id)confirmationStyleAsString:(int)a3;
- (id)contentItemsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)multiTokenContextsAtIndex:(unint64_t)a3;
- (id)requestTypeAsString:(int)a3;
- (id)requestorAsString:(int)a3;
- (id)requestorDeviceTypeAsString:(int)a3;
- (id)requiredBillingContactFieldsAtIndex:(unint64_t)a3;
- (id)requiredShippingContactFieldsAtIndex:(unint64_t)a3;
- (id)shippingMethodsAtIndex:(unint64_t)a3;
- (id)summaryItemsAtIndex:(unint64_t)a3;
- (id)supportedCountriesAtIndex:(unint64_t)a3;
- (id)supportedNetworksAtIndex:(unint64_t)a3;
- (id)thumbnailURLsAtIndex:(unint64_t)a3;
- (int)StringAsConfirmationStyle:(id)a3;
- (int)StringAsRequestType:(id)a3;
- (int)StringAsRequestor:(id)a3;
- (int)StringAsRequestorDeviceType:(id)a3;
- (int)confirmationStyle;
- (int)merchantCategoryCode;
- (int)requestType;
- (int)requestor;
- (int)requestorDeviceType;
- (unint64_t)contentItemsCount;
- (unint64_t)hash;
- (unint64_t)multiTokenContextsCount;
- (unint64_t)requiredBillingContactFieldsCount;
- (unint64_t)requiredShippingContactFieldsCount;
- (unint64_t)shippingMethodsCount;
- (unint64_t)summaryItemsCount;
- (unint64_t)supportedCountriesCount;
- (unint64_t)supportedNetworksCount;
- (unint64_t)thumbnailURLsCount;
- (unsigned)apiType;
- (unsigned)merchantCapabilities;
- (unsigned)requiredBillingAddressFields;
- (unsigned)requiredShippingAddressFields;
- (void)addContentItems:(id)a3;
- (void)addMultiTokenContexts:(id)a3;
- (void)addRequiredBillingContactFields:(id)a3;
- (void)addRequiredShippingContactFields:(id)a3;
- (void)addShippingMethods:(id)a3;
- (void)addSummaryItems:(id)a3;
- (void)addSupportedCountries:(id)a3;
- (void)addSupportedNetworks:(id)a3;
- (void)addThumbnailURLs:(id)a3;
- (void)clearContentItems;
- (void)clearMultiTokenContexts;
- (void)clearRequiredBillingContactFields;
- (void)clearRequiredShippingContactFields;
- (void)clearShippingMethods;
- (void)clearSummaryItems;
- (void)clearSupportedCountries;
- (void)clearSupportedNetworks;
- (void)clearThumbnailURLs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApiType:(unsigned int)a3;
- (void)setApplicationData:(id)a3;
- (void)setAutomaticReloadPaymentRequest:(id)a3;
- (void)setAvailableShippingMethods:(id)a3;
- (void)setBillingContact:(id)a3;
- (void)setConfirmationStyle:(int)a3;
- (void)setContentItems:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDeferredPaymentRequest:(id)a3;
- (void)setExpectsMerchantSession:(BOOL)a3;
- (void)setHasApiType:(BOOL)a3;
- (void)setHasConfirmationStyle:(BOOL)a3;
- (void)setHasExpectsMerchantSession:(BOOL)a3;
- (void)setHasMerchantCapabilities:(BOOL)a3;
- (void)setHasMerchantCategoryCode:(BOOL)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setHasRequestor:(BOOL)a3;
- (void)setHasRequestorDeviceType:(BOOL)a3;
- (void)setHasRequiredBillingAddressFields:(BOOL)a3;
- (void)setHasRequiredShippingAddressFields:(BOOL)a3;
- (void)setHasRespectSupportedNetworksOrder:(BOOL)a3;
- (void)setHasSummaryPinned:(BOOL)a3;
- (void)setHasSuppressTotal:(BOOL)a3;
- (void)setLocalizedNavigationTitle:(id)a3;
- (void)setLocalizedSummaryItemsTitle:(id)a3;
- (void)setMerchantCapabilities:(unsigned int)a3;
- (void)setMerchantCategoryCode:(int)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMerchantSession:(id)a3;
- (void)setMultiTokenContexts:(id)a3;
- (void)setOriginatingURL:(id)a3;
- (void)setRecurringPaymentRequest:(id)a3;
- (void)setRequestType:(int)a3;
- (void)setRequestor:(int)a3;
- (void)setRequestorDeviceType:(int)a3;
- (void)setRequiredBillingAddressFields:(unsigned int)a3;
- (void)setRequiredBillingContactFields:(id)a3;
- (void)setRequiredShippingAddressFields:(unsigned int)a3;
- (void)setRequiredShippingContactFields:(id)a3;
- (void)setRespectSupportedNetworksOrder:(BOOL)a3;
- (void)setShippingContact:(id)a3;
- (void)setShippingMethods:(id)a3;
- (void)setSummaryItems:(id)a3;
- (void)setSummaryPinned:(BOOL)a3;
- (void)setSupportedCountries:(id)a3;
- (void)setSupportedNetworks:(id)a3;
- (void)setSuppressTotal:(BOOL)a3;
- (void)setThumbnailURLs:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentRequest

- (BOOL)hasMerchantIdentifier
{
  return self->_merchantIdentifier != 0;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (void)clearSupportedNetworks
{
}

- (void)addSupportedNetworks:(id)a3
{
  id v4 = a3;
  supportedNetworks = self->_supportedNetworks;
  id v8 = v4;
  if (!supportedNetworks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_supportedNetworks;
    self->_supportedNetworks = v6;

    id v4 = v8;
    supportedNetworks = self->_supportedNetworks;
  }
  [(NSMutableArray *)supportedNetworks addObject:v4];
}

- (unint64_t)supportedNetworksCount
{
  return [(NSMutableArray *)self->_supportedNetworks count];
}

- (id)supportedNetworksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedNetworks objectAtIndex:a3];
}

+ (Class)supportedNetworksType
{
  return (Class)objc_opt_class();
}

- (void)setMerchantCapabilities:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_merchantCapabilities = a3;
}

- (void)setHasMerchantCapabilities:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMerchantCapabilities
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRequiredBillingAddressFields:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_requiredBillingAddressFields = a3;
}

- (void)setHasRequiredBillingAddressFields:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRequiredBillingAddressFields
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRequiredShippingAddressFields:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_requiredShippingAddressFields = a3;
}

- (void)setHasRequiredShippingAddressFields:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRequiredShippingAddressFields
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasBillingContact
{
  return self->_billingContact != 0;
}

- (BOOL)hasShippingContact
{
  return self->_shippingContact != 0;
}

- (void)clearSummaryItems
{
}

- (void)addSummaryItems:(id)a3
{
  id v4 = a3;
  summaryItems = self->_summaryItems;
  id v8 = v4;
  if (!summaryItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_summaryItems;
    self->_summaryItems = v6;

    id v4 = v8;
    summaryItems = self->_summaryItems;
  }
  [(NSMutableArray *)summaryItems addObject:v4];
}

- (unint64_t)summaryItemsCount
{
  return [(NSMutableArray *)self->_summaryItems count];
}

- (id)summaryItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_summaryItems objectAtIndex:a3];
}

+ (Class)summaryItemsType
{
  return (Class)objc_opt_class();
}

- (void)clearShippingMethods
{
}

- (void)addShippingMethods:(id)a3
{
  id v4 = a3;
  shippingMethods = self->_shippingMethods;
  id v8 = v4;
  if (!shippingMethods)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_shippingMethods;
    self->_shippingMethods = v6;

    id v4 = v8;
    shippingMethods = self->_shippingMethods;
  }
  [(NSMutableArray *)shippingMethods addObject:v4];
}

- (unint64_t)shippingMethodsCount
{
  return [(NSMutableArray *)self->_shippingMethods count];
}

- (id)shippingMethodsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_shippingMethods objectAtIndex:a3];
}

+ (Class)shippingMethodsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasApplicationData
{
  return self->_applicationData != 0;
}

- (BOOL)hasOriginatingURL
{
  return self->_originatingURL != 0;
}

- (BOOL)hasMerchantSession
{
  return self->_merchantSession != 0;
}

- (void)clearThumbnailURLs
{
}

- (void)addThumbnailURLs:(id)a3
{
  id v4 = a3;
  thumbnailURLs = self->_thumbnailURLs;
  id v8 = v4;
  if (!thumbnailURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_thumbnailURLs;
    self->_thumbnailURLs = v6;

    id v4 = v8;
    thumbnailURLs = self->_thumbnailURLs;
  }
  [(NSMutableArray *)thumbnailURLs addObject:v4];
}

- (unint64_t)thumbnailURLsCount
{
  return [(NSMutableArray *)self->_thumbnailURLs count];
}

- (id)thumbnailURLsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_thumbnailURLs objectAtIndex:a3];
}

+ (Class)thumbnailURLsType
{
  return (Class)objc_opt_class();
}

- (void)setExpectsMerchantSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_expectsMerchantSession = a3;
}

- (void)setHasExpectsMerchantSession:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasExpectsMerchantSession
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearRequiredShippingContactFields
{
}

- (void)addRequiredShippingContactFields:(id)a3
{
  id v4 = a3;
  requiredShippingContactFields = self->_requiredShippingContactFields;
  id v8 = v4;
  if (!requiredShippingContactFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_requiredShippingContactFields;
    self->_requiredShippingContactFields = v6;

    id v4 = v8;
    requiredShippingContactFields = self->_requiredShippingContactFields;
  }
  [(NSMutableArray *)requiredShippingContactFields addObject:v4];
}

- (unint64_t)requiredShippingContactFieldsCount
{
  return [(NSMutableArray *)self->_requiredShippingContactFields count];
}

- (id)requiredShippingContactFieldsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requiredShippingContactFields objectAtIndex:a3];
}

+ (Class)requiredShippingContactFieldsType
{
  return (Class)objc_opt_class();
}

- (void)clearRequiredBillingContactFields
{
}

- (void)addRequiredBillingContactFields:(id)a3
{
  id v4 = a3;
  requiredBillingContactFields = self->_requiredBillingContactFields;
  id v8 = v4;
  if (!requiredBillingContactFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_requiredBillingContactFields;
    self->_requiredBillingContactFields = v6;

    id v4 = v8;
    requiredBillingContactFields = self->_requiredBillingContactFields;
  }
  [(NSMutableArray *)requiredBillingContactFields addObject:v4];
}

- (unint64_t)requiredBillingContactFieldsCount
{
  return [(NSMutableArray *)self->_requiredBillingContactFields count];
}

- (id)requiredBillingContactFieldsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requiredBillingContactFields objectAtIndex:a3];
}

+ (Class)requiredBillingContactFieldsType
{
  return (Class)objc_opt_class();
}

- (void)clearSupportedCountries
{
}

- (void)addSupportedCountries:(id)a3
{
  id v4 = a3;
  supportedCountries = self->_supportedCountries;
  id v8 = v4;
  if (!supportedCountries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_supportedCountries;
    self->_supportedCountries = v6;

    id v4 = v8;
    supportedCountries = self->_supportedCountries;
  }
  [(NSMutableArray *)supportedCountries addObject:v4];
}

- (unint64_t)supportedCountriesCount
{
  return [(NSMutableArray *)self->_supportedCountries count];
}

- (id)supportedCountriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedCountries objectAtIndex:a3];
}

+ (Class)supportedCountriesType
{
  return (Class)objc_opt_class();
}

- (void)setApiType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_apiType = a3;
}

- (void)setHasApiType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasApiType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)clearContentItems
{
}

- (void)addContentItems:(id)a3
{
  id v4 = a3;
  contentItems = self->_contentItems;
  id v8 = v4;
  if (!contentItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contentItems;
    self->_contentItems = v6;

    id v4 = v8;
    contentItems = self->_contentItems;
  }
  [(NSMutableArray *)contentItems addObject:v4];
}

- (unint64_t)contentItemsCount
{
  return [(NSMutableArray *)self->_contentItems count];
}

- (id)contentItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentItems objectAtIndex:a3];
}

+ (Class)contentItemsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLocalizedNavigationTitle
{
  return self->_localizedNavigationTitle != 0;
}

- (BOOL)hasLocalizedSummaryItemsTitle
{
  return self->_localizedSummaryItemsTitle != 0;
}

- (void)setSuppressTotal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_suppressTotal = a3;
}

- (void)setHasSuppressTotal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSuppressTotal
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSummaryPinned:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_summaryPinned = a3;
}

- (void)setHasSummaryPinned:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSummaryPinned
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)requestor
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_requestor;
  }
  else {
    return 0;
  }
}

- (void)setRequestor:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_requestor = a3;
}

- (void)setHasRequestor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRequestor
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)requestorAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E56F3908[a3];
  }
  return v3;
}

- (int)StringAsRequestor:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ITUNES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APP_STORE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"APPLE_MUSIC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"APPLE_NEWS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"APPLE_BOOKS"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)confirmationStyle
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_confirmationStyle;
  }
  else {
    return 0;
  }
}

- (void)setConfirmationStyle:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_confirmationStyle = a3;
}

- (void)setHasConfirmationStyle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConfirmationStyle
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)confirmationStyleAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E56F3938[a3];
  }
  return v3;
}

- (int)StringAsConfirmationStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONFIRM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GET"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INSTALL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REDEEM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ADD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SUBSCRIBE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SUBSCRIBE_AND_INSTALL"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)requestType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_requestType;
  }
  else {
    return 0;
  }
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRequestType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E56F3980[a3];
  }
  return v3;
}

- (int)StringAsRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"APPLE_PAY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CARD_ON_FILE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACCOUNT_SERVICE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AMP_ENROLLMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_CARD_ACTION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INSTALLMENT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ACCESSIBILITY_ENROLLMENT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_CONTEXT_AUTHORIZATION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SERVICE_PROVIDER"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PEER_PAYMENT"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"DISBURSEMENT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PAY_LATER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"VIRTUAL_CARD_ENROLLMENT"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"IDENTITY_IN_APP"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"VIRTUAL_CARD_REFRESH"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ALTERNATIVE_APP_DISTRIBUTION"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAvailableShippingMethods
{
  return self->_availableShippingMethods != 0;
}

- (BOOL)hasRecurringPaymentRequest
{
  return self->_recurringPaymentRequest != 0;
}

- (void)clearMultiTokenContexts
{
}

- (void)addMultiTokenContexts:(id)a3
{
  id v4 = a3;
  multiTokenContexts = self->_multiTokenContexts;
  id v8 = v4;
  if (!multiTokenContexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_multiTokenContexts;
    self->_multiTokenContexts = v6;

    id v4 = v8;
    multiTokenContexts = self->_multiTokenContexts;
  }
  [(NSMutableArray *)multiTokenContexts addObject:v4];
}

- (unint64_t)multiTokenContextsCount
{
  return [(NSMutableArray *)self->_multiTokenContexts count];
}

- (id)multiTokenContextsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_multiTokenContexts objectAtIndex:a3];
}

+ (Class)multiTokenContextsType
{
  return (Class)objc_opt_class();
}

- (void)setRespectSupportedNetworksOrder:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_respectSupportedNetworksOrder = a3;
}

- (void)setHasRespectSupportedNetworksOrder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRespectSupportedNetworksOrder
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasAutomaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest != 0;
}

- (int)requestorDeviceType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_requestorDeviceType;
  }
  else {
    return 0;
  }
}

- (void)setRequestorDeviceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_requestorDeviceType = a3;
}

- (void)setHasRequestorDeviceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRequestorDeviceType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)requestorDeviceTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"TV";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"DEFAULT";
  }
  return v4;
}

- (int)StringAsRequestorDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEFAULT"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TV"];
  }

  return v4;
}

- (BOOL)hasDeferredPaymentRequest
{
  return self->_deferredPaymentRequest != 0;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (void)setMerchantCategoryCode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_merchantCategoryCode = a3;
}

- (void)setHasMerchantCategoryCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMerchantCategoryCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentRequest;
  int v4 = [(PKProtobufPaymentRequest *)&v8 description];
  v5 = [(PKProtobufPaymentRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  merchantIdentifier = self->_merchantIdentifier;
  if (merchantIdentifier) {
    [v3 setObject:merchantIdentifier forKey:@"merchantIdentifier"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v4 setObject:countryCode forKey:@"countryCode"];
  }
  currencyCode = self->_currencyCode;
  if (currencyCode) {
    [v4 setObject:currencyCode forKey:@"currencyCode"];
  }
  supportedNetworks = self->_supportedNetworks;
  if (supportedNetworks) {
    [v4 setObject:supportedNetworks forKey:@"supportedNetworks"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v47 = [NSNumber numberWithUnsignedInt:self->_merchantCapabilities];
    [v4 setObject:v47 forKey:@"merchantCapabilities"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_11:
      if ((has & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_11;
  }
  v48 = [NSNumber numberWithUnsignedInt:self->_requiredBillingAddressFields];
  [v4 setObject:v48 forKey:@"requiredBillingAddressFields"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    v10 = [NSNumber numberWithUnsignedInt:self->_requiredShippingAddressFields];
    [v4 setObject:v10 forKey:@"requiredShippingAddressFields"];
  }
LABEL_13:
  billingContact = self->_billingContact;
  if (billingContact) {
    [v4 setObject:billingContact forKey:@"billingContact"];
  }
  shippingContact = self->_shippingContact;
  if (shippingContact) {
    [v4 setObject:shippingContact forKey:@"shippingContact"];
  }
  if ([(NSMutableArray *)self->_summaryItems count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_summaryItems, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v14 = self->_summaryItems;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v91 objects:v98 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v92 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v91 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v91 objects:v98 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"summaryItems"];
  }
  if ([(NSMutableArray *)self->_shippingMethods count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_shippingMethods, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v21 = self->_shippingMethods;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v87 objects:v97 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v88 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v87 + 1) + 8 * j) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v87 objects:v97 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"shippingMethods"];
  }
  applicationData = self->_applicationData;
  if (applicationData) {
    [v4 setObject:applicationData forKey:@"applicationData"];
  }
  originatingURL = self->_originatingURL;
  if (originatingURL) {
    [v4 setObject:originatingURL forKey:@"originatingURL"];
  }
  merchantSession = self->_merchantSession;
  if (merchantSession)
  {
    v30 = [(PKProtobufPaymentMerchantSession *)merchantSession dictionaryRepresentation];
    [v4 setObject:v30 forKey:@"merchantSession"];
  }
  thumbnailURLs = self->_thumbnailURLs;
  if (thumbnailURLs) {
    [v4 setObject:thumbnailURLs forKey:@"thumbnailURLs"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v32 = [NSNumber numberWithBool:self->_expectsMerchantSession];
    [v4 setObject:v32 forKey:@"expectsMerchantSession"];
  }
  requiredShippingContactFields = self->_requiredShippingContactFields;
  if (requiredShippingContactFields) {
    [v4 setObject:requiredShippingContactFields forKey:@"requiredShippingContactFields"];
  }
  requiredBillingContactFields = self->_requiredBillingContactFields;
  if (requiredBillingContactFields) {
    [v4 setObject:requiredBillingContactFields forKey:@"requiredBillingContactFields"];
  }
  supportedCountries = self->_supportedCountries;
  if (supportedCountries) {
    [v4 setObject:supportedCountries forKey:@"supportedCountries"];
  }
  if (*(_WORD *)&self->_has)
  {
    v36 = [NSNumber numberWithUnsignedInt:self->_apiType];
    [v4 setObject:v36 forKey:@"apiType"];
  }
  if ([(NSMutableArray *)self->_contentItems count])
  {
    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contentItems, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v38 = self->_contentItems;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v83 objects:v96 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v84 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [*(id *)(*((void *)&v83 + 1) + 8 * k) dictionaryRepresentation];
          [v37 addObject:v43];
        }
        uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v83 objects:v96 count:16];
      }
      while (v40);
    }

    [v4 setObject:v37 forKey:@"contentItems"];
  }
  localizedNavigationTitle = self->_localizedNavigationTitle;
  if (localizedNavigationTitle) {
    [v4 setObject:localizedNavigationTitle forKey:@"localizedNavigationTitle"];
  }
  localizedSummaryItemsTitle = self->_localizedSummaryItemsTitle;
  if (localizedSummaryItemsTitle) {
    [v4 setObject:localizedSummaryItemsTitle forKey:@"localizedSummaryItemsTitle"];
  }
  __int16 v46 = (__int16)self->_has;
  if ((v46 & 0x1000) != 0)
  {
    v49 = [NSNumber numberWithBool:self->_suppressTotal];
    [v4 setObject:v49 forKey:@"suppressTotal"];

    __int16 v46 = (__int16)self->_has;
    if ((v46 & 0x800) == 0)
    {
LABEL_68:
      if ((v46 & 0x20) == 0) {
        goto LABEL_69;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_68;
  }
  v50 = [NSNumber numberWithBool:self->_summaryPinned];
  [v4 setObject:v50 forKey:@"summaryPinned"];

  __int16 v46 = (__int16)self->_has;
  if ((v46 & 0x20) == 0)
  {
LABEL_69:
    if ((v46 & 2) == 0) {
      goto LABEL_70;
    }
    goto LABEL_81;
  }
LABEL_77:
  uint64_t requestor = self->_requestor;
  if (requestor >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requestor);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = off_1E56F3908[requestor];
  }
  [v4 setObject:v52 forKey:@"requestor"];

  __int16 v46 = (__int16)self->_has;
  if ((v46 & 2) == 0)
  {
LABEL_70:
    if ((v46 & 0x10) == 0) {
      goto LABEL_89;
    }
    goto LABEL_85;
  }
LABEL_81:
  uint64_t confirmationStyle = self->_confirmationStyle;
  if (confirmationStyle >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_confirmationStyle);
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = off_1E56F3938[confirmationStyle];
  }
  [v4 setObject:v54 forKey:@"confirmationStyle"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_85:
    uint64_t requestType = self->_requestType;
    if (requestType >= 0x10)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requestType);
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = off_1E56F3980[requestType];
    }
    [v4 setObject:v56 forKey:@"requestType"];
  }
LABEL_89:
  availableShippingMethods = self->_availableShippingMethods;
  if (availableShippingMethods)
  {
    v58 = [(PKProtobufShippingMethods *)availableShippingMethods dictionaryRepresentation];
    [v4 setObject:v58 forKey:@"availableShippingMethods"];
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  if (recurringPaymentRequest)
  {
    v60 = [(PKProtobufRecurringPaymentRequest *)recurringPaymentRequest dictionaryRepresentation];
    [v4 setObject:v60 forKey:@"recurringPaymentRequest"];
  }
  if ([(NSMutableArray *)self->_multiTokenContexts count])
  {
    v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_multiTokenContexts, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v62 = self->_multiTokenContexts;
    uint64_t v63 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v79 objects:v95 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v80;
      do
      {
        for (uint64_t m = 0; m != v64; ++m)
        {
          if (*(void *)v80 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = [*(id *)(*((void *)&v79 + 1) + 8 * m) dictionaryRepresentation];
          [v61 addObject:v67];
        }
        uint64_t v64 = [(NSMutableArray *)v62 countByEnumeratingWithState:&v79 objects:v95 count:16];
      }
      while (v64);
    }

    [v4 setObject:v61 forKey:@"multiTokenContexts"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v68 = [NSNumber numberWithBool:self->_respectSupportedNetworksOrder];
    [v4 setObject:v68 forKey:@"respectSupportedNetworksOrder"];
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  if (automaticReloadPaymentRequest)
  {
    v70 = [(PKProtobufAutomaticReloadPaymentRequest *)automaticReloadPaymentRequest dictionaryRepresentation];
    [v4 setObject:v70 forKey:@"automaticReloadPaymentRequest"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    int requestorDeviceType = self->_requestorDeviceType;
    if (requestorDeviceType)
    {
      if (requestorDeviceType == 1)
      {
        v72 = @"TV";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requestorDeviceType);
        v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v72 = @"DEFAULT";
    }
    [v4 setObject:v72 forKey:@"requestorDeviceType"];
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  if (deferredPaymentRequest)
  {
    v74 = [(PKProtobufDeferredPaymentRequest *)deferredPaymentRequest dictionaryRepresentation];
    [v4 setObject:v74 forKey:@"deferredPaymentRequest"];
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v4 setObject:userAgent forKey:@"userAgent"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v76 = [NSNumber numberWithInt:self->_merchantCategoryCode];
    [v4 setObject:v76 forKey:@"merchantCategoryCode"];
  }
  id v77 = v4;

  return v77;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_merchantIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_currencyCode) {
    PBDataWriterWriteStringField();
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v5 = self->_supportedNetworks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v84 objects:v96 count:16];
    }
    while (v7);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_16:
      if ((has & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_billingContact) {
    PBDataWriterWriteDataField();
  }
  if (self->_shippingContact) {
    PBDataWriterWriteDataField();
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v11 = self->_summaryItems;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v81 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v80 objects:v95 count:16];
    }
    while (v13);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v16 = self->_shippingMethods;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v77;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v77 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v76 objects:v94 count:16];
    }
    while (v18);
  }

  if (self->_applicationData) {
    PBDataWriterWriteDataField();
  }
  if (self->_originatingURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_merchantSession) {
    PBDataWriterWriteSubmessage();
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v21 = self->_thumbnailURLs;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v72 objects:v93 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v73;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v73 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v72 objects:v93 count:16];
    }
    while (v23);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v26 = self->_requiredShippingContactFields;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v68 objects:v92 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v69;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v69 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v68 objects:v92 count:16];
    }
    while (v28);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v31 = self->_requiredBillingContactFields;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v64 objects:v91 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v65;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v65 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v64 objects:v91 count:16];
    }
    while (v33);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v36 = self->_supportedCountries;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v60 objects:v90 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v61;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v61 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v60 objects:v90 count:16];
    }
    while (v38);
  }

  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v41 = self->_contentItems;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v56 objects:v89 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v57;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v57 != v44) {
          objc_enumerationMutation(v41);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v56 objects:v89 count:16];
    }
    while (v43);
  }

  if (self->_localizedNavigationTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedSummaryItemsTitle) {
    PBDataWriterWriteStringField();
  }
  __int16 v46 = (__int16)self->_has;
  if ((v46 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v46 = (__int16)self->_has;
    if ((v46 & 0x800) == 0)
    {
LABEL_87:
      if ((v46 & 0x20) == 0) {
        goto LABEL_88;
      }
      goto LABEL_120;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_87;
  }
  PBDataWriterWriteBOOLField();
  __int16 v46 = (__int16)self->_has;
  if ((v46 & 0x20) == 0)
  {
LABEL_88:
    if ((v46 & 2) == 0) {
      goto LABEL_89;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteInt32Field();
  __int16 v46 = (__int16)self->_has;
  if ((v46 & 2) == 0)
  {
LABEL_89:
    if ((v46 & 0x10) == 0) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
LABEL_121:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_90:
  }
    PBDataWriterWriteInt32Field();
LABEL_91:
  if (self->_availableShippingMethods) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_recurringPaymentRequest) {
    PBDataWriterWriteSubmessage();
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v47 = self->_multiTokenContexts;
  uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v52 objects:v88 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v53;
    do
    {
      for (muint64_t m = 0; mm != v49; ++mm)
      {
        if (*(void *)v53 != v50) {
          objc_enumerationMutation(v47);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v52 objects:v88 count:16];
    }
    while (v49);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_automaticReloadPaymentRequest) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_deferredPaymentRequest) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_userAgent) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteSint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v44 = a3;
  if (self->_merchantIdentifier) {
    objc_msgSend(v44, "setMerchantIdentifier:");
  }
  if (self->_countryCode) {
    objc_msgSend(v44, "setCountryCode:");
  }
  if (self->_currencyCode) {
    objc_msgSend(v44, "setCurrencyCode:");
  }
  if ([(PKProtobufPaymentRequest *)self supportedNetworksCount])
  {
    [v44 clearSupportedNetworks];
    unint64_t v4 = [(PKProtobufPaymentRequest *)self supportedNetworksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PKProtobufPaymentRequest *)self supportedNetworksAtIndex:i];
        [v44 addSupportedNetworks:v7];
      }
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v44 + 26) = self->_merchantCapabilities;
    *((_WORD *)v44 + 126) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_13:
      if ((has & 0x100) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v44 + 41) = self->_requiredBillingAddressFields;
  *((_WORD *)v44 + 126) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    *((_DWORD *)v44 + 44) = self->_requiredShippingAddressFields;
    *((_WORD *)v44 + 126) |= 0x100u;
  }
LABEL_15:
  if (self->_billingContact) {
    objc_msgSend(v44, "setBillingContact:");
  }
  if (self->_shippingContact) {
    objc_msgSend(v44, "setShippingContact:");
  }
  if ([(PKProtobufPaymentRequest *)self summaryItemsCount])
  {
    [v44 clearSummaryItems];
    unint64_t v9 = [(PKProtobufPaymentRequest *)self summaryItemsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(PKProtobufPaymentRequest *)self summaryItemsAtIndex:j];
        [v44 addSummaryItems:v12];
      }
    }
  }
  if ([(PKProtobufPaymentRequest *)self shippingMethodsCount])
  {
    [v44 clearShippingMethods];
    unint64_t v13 = [(PKProtobufPaymentRequest *)self shippingMethodsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(PKProtobufPaymentRequest *)self shippingMethodsAtIndex:k];
        [v44 addShippingMethods:v16];
      }
    }
  }
  if (self->_applicationData) {
    objc_msgSend(v44, "setApplicationData:");
  }
  if (self->_originatingURL) {
    objc_msgSend(v44, "setOriginatingURL:");
  }
  if (self->_merchantSession) {
    objc_msgSend(v44, "setMerchantSession:");
  }
  if ([(PKProtobufPaymentRequest *)self thumbnailURLsCount])
  {
    [v44 clearThumbnailURLs];
    unint64_t v17 = [(PKProtobufPaymentRequest *)self thumbnailURLsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(PKProtobufPaymentRequest *)self thumbnailURLsAtIndex:m];
        [v44 addThumbnailURLs:v20];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((unsigned char *)v44 + 248) = self->_expectsMerchantSession;
    *((_WORD *)v44 + 126) |= 0x200u;
  }
  if ([(PKProtobufPaymentRequest *)self requiredShippingContactFieldsCount])
  {
    [v44 clearRequiredShippingContactFields];
    unint64_t v21 = [(PKProtobufPaymentRequest *)self requiredShippingContactFieldsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(PKProtobufPaymentRequest *)self requiredShippingContactFieldsAtIndex:n];
        [v44 addRequiredShippingContactFields:v24];
      }
    }
  }
  if ([(PKProtobufPaymentRequest *)self requiredBillingContactFieldsCount])
  {
    [v44 clearRequiredBillingContactFields];
    unint64_t v25 = [(PKProtobufPaymentRequest *)self requiredBillingContactFieldsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(PKProtobufPaymentRequest *)self requiredBillingContactFieldsAtIndex:ii];
        [v44 addRequiredBillingContactFields:v28];
      }
    }
  }
  if ([(PKProtobufPaymentRequest *)self supportedCountriesCount])
  {
    [v44 clearSupportedCountries];
    unint64_t v29 = [(PKProtobufPaymentRequest *)self supportedCountriesCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(PKProtobufPaymentRequest *)self supportedCountriesAtIndex:jj];
        [v44 addSupportedCountries:v32];
      }
    }
  }
  if (*(_WORD *)&self->_has)
  {
    *((_DWORD *)v44 + 2) = self->_apiType;
    *((_WORD *)v44 + 126) |= 1u;
  }
  if ([(PKProtobufPaymentRequest *)self contentItemsCount])
  {
    [v44 clearContentItems];
    unint64_t v33 = [(PKProtobufPaymentRequest *)self contentItemsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        v36 = [(PKProtobufPaymentRequest *)self contentItemsAtIndex:kk];
        [v44 addContentItems:v36];
      }
    }
  }
  if (self->_localizedNavigationTitle) {
    objc_msgSend(v44, "setLocalizedNavigationTitle:");
  }
  uint64_t v37 = v44;
  if (self->_localizedSummaryItemsTitle)
  {
    objc_msgSend(v44, "setLocalizedSummaryItemsTitle:");
    uint64_t v37 = v44;
  }
  __int16 v38 = (__int16)self->_has;
  if ((v38 & 0x1000) != 0)
  {
    v37[251] = self->_suppressTotal;
    *((_WORD *)v37 + 126) |= 0x1000u;
    __int16 v38 = (__int16)self->_has;
    if ((v38 & 0x800) == 0)
    {
LABEL_63:
      if ((v38 & 0x20) == 0) {
        goto LABEL_64;
      }
      goto LABEL_95;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_63;
  }
  v37[250] = self->_summaryPinned;
  *((_WORD *)v37 + 126) |= 0x800u;
  __int16 v38 = (__int16)self->_has;
  if ((v38 & 0x20) == 0)
  {
LABEL_64:
    if ((v38 & 2) == 0) {
      goto LABEL_65;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v37 + 39) = self->_requestor;
  *((_WORD *)v37 + 126) |= 0x20u;
  __int16 v38 = (__int16)self->_has;
  if ((v38 & 2) == 0)
  {
LABEL_65:
    if ((v38 & 0x10) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_96:
  *((_DWORD *)v37 + 12) = self->_confirmationStyle;
  *((_WORD *)v37 + 126) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_66:
    *((_DWORD *)v37 + 38) = self->_requestType;
    *((_WORD *)v37 + 126) |= 0x10u;
  }
LABEL_67:
  if (self->_availableShippingMethods) {
    objc_msgSend(v44, "setAvailableShippingMethods:");
  }
  if (self->_recurringPaymentRequest) {
    objc_msgSend(v44, "setRecurringPaymentRequest:");
  }
  if ([(PKProtobufPaymentRequest *)self multiTokenContextsCount])
  {
    [v44 clearMultiTokenContexts];
    unint64_t v39 = [(PKProtobufPaymentRequest *)self multiTokenContextsCount];
    if (v39)
    {
      unint64_t v40 = v39;
      for (muint64_t m = 0; mm != v40; ++mm)
      {
        uint64_t v42 = [(PKProtobufPaymentRequest *)self multiTokenContextsAtIndex:mm];
        [v44 addMultiTokenContexts:v42];
      }
    }
  }
  uint64_t v43 = v44;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((unsigned char *)v44 + 249) = self->_respectSupportedNetworksOrder;
    *((_WORD *)v44 + 126) |= 0x400u;
  }
  if (self->_automaticReloadPaymentRequest)
  {
    objc_msgSend(v44, "setAutomaticReloadPaymentRequest:");
    uint64_t v43 = v44;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v43[40] = self->_requestorDeviceType;
    *((_WORD *)v43 + 126) |= 0x40u;
  }
  if (self->_deferredPaymentRequest)
  {
    objc_msgSend(v44, "setDeferredPaymentRequest:");
    uint64_t v43 = v44;
  }
  if (self->_userAgent)
  {
    objc_msgSend(v44, "setUserAgent:");
    uint64_t v43 = v44;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v43[27] = self->_merchantCategoryCode;
    *((_WORD *)v43 + 126) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  uint64_t v8 = [(NSString *)self->_countryCode copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  uint64_t v10 = [(NSString *)self->_currencyCode copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  uint64_t v12 = self->_supportedNetworks;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v125 objects:v137 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v126;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v126 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v125 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addSupportedNetworks:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v125 objects:v137 count:16];
    }
    while (v14);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_merchantCapabilities;
    *(_WORD *)(v5 + 252) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_10:
      if ((has & 0x100) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 164) = self->_requiredBillingAddressFields;
  *(_WORD *)(v5 + 252) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 176) = self->_requiredShippingAddressFields;
    *(_WORD *)(v5 + 252) |= 0x100u;
  }
LABEL_12:
  uint64_t v19 = [(NSData *)self->_billingContact copyWithZone:a3];
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  uint64_t v21 = [(NSData *)self->_shippingContact copyWithZone:a3];
  unint64_t v22 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v21;

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  uint64_t v23 = self->_summaryItems;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v121 objects:v136 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v122 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = (void *)[*(id *)(*((void *)&v121 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addSummaryItems:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v121 objects:v136 count:16];
    }
    while (v25);
  }

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  unint64_t v29 = self->_shippingMethods;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v117 objects:v135 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v118;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v118 != v32) {
          objc_enumerationMutation(v29);
        }
        unint64_t v34 = (void *)[*(id *)(*((void *)&v117 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addShippingMethods:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v117 objects:v135 count:16];
    }
    while (v31);
  }

  uint64_t v35 = [(NSData *)self->_applicationData copyWithZone:a3];
  v36 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v35;

  uint64_t v37 = [(NSString *)self->_originatingURL copyWithZone:a3];
  __int16 v38 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v37;

  id v39 = [(PKProtobufPaymentMerchantSession *)self->_merchantSession copyWithZone:a3];
  unint64_t v40 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v39;

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v41 = self->_thumbnailURLs;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v113 objects:v134 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v114;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v114 != v44) {
          objc_enumerationMutation(v41);
        }
        __int16 v46 = (void *)[*(id *)(*((void *)&v113 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addThumbnailURLs:v46];
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v113 objects:v134 count:16];
    }
    while (v43);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 248) = self->_expectsMerchantSession;
    *(_WORD *)(v5 + 252) |= 0x200u;
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v47 = self->_requiredShippingContactFields;
  uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v109 objects:v133 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v110;
    do
    {
      for (uint64_t n = 0; n != v49; ++n)
      {
        if (*(void *)v110 != v50) {
          objc_enumerationMutation(v47);
        }
        long long v52 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addRequiredShippingContactFields:v52];
      }
      uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v109 objects:v133 count:16];
    }
    while (v49);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v53 = self->_requiredBillingContactFields;
  uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v105 objects:v132 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v106;
    do
    {
      for (iuint64_t i = 0; ii != v55; ++ii)
      {
        if (*(void *)v106 != v56) {
          objc_enumerationMutation(v53);
        }
        long long v58 = (void *)[*(id *)(*((void *)&v105 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addRequiredBillingContactFields:v58];
      }
      uint64_t v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v105 objects:v132 count:16];
    }
    while (v55);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v59 = self->_supportedCountries;
  uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v101 objects:v131 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v102;
    do
    {
      for (juint64_t j = 0; jj != v61; ++jj)
      {
        if (*(void *)v102 != v62) {
          objc_enumerationMutation(v59);
        }
        long long v64 = (void *)[*(id *)(*((void *)&v101 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addSupportedCountries:v64];
      }
      uint64_t v61 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v101 objects:v131 count:16];
    }
    while (v61);
  }

  if (*(_WORD *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_apiType;
    *(_WORD *)(v5 + 252) |= 1u;
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v65 = self->_contentItems;
  uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v97 objects:v130 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v98;
    do
    {
      for (kuint64_t k = 0; kk != v67; ++kk)
      {
        if (*(void *)v98 != v68) {
          objc_enumerationMutation(v65);
        }
        long long v70 = (void *)[*(id *)(*((void *)&v97 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addContentItems:v70];
      }
      uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v97 objects:v130 count:16];
    }
    while (v67);
  }

  uint64_t v71 = [(NSString *)self->_localizedNavigationTitle copyWithZone:a3];
  long long v72 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v71;

  uint64_t v73 = [(NSString *)self->_localizedSummaryItemsTitle copyWithZone:a3];
  long long v74 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v73;

  __int16 v75 = (__int16)self->_has;
  if ((v75 & 0x1000) != 0)
  {
    *(unsigned char *)(v5 + 251) = self->_suppressTotal;
    *(_WORD *)(v5 + 252) |= 0x1000u;
    __int16 v75 = (__int16)self->_has;
    if ((v75 & 0x800) == 0)
    {
LABEL_67:
      if ((v75 & 0x20) == 0) {
        goto LABEL_68;
      }
      goto LABEL_90;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_67;
  }
  *(unsigned char *)(v5 + 250) = self->_summaryPinned;
  *(_WORD *)(v5 + 252) |= 0x800u;
  __int16 v75 = (__int16)self->_has;
  if ((v75 & 0x20) == 0)
  {
LABEL_68:
    if ((v75 & 2) == 0) {
      goto LABEL_69;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v5 + 156) = self->_requestor;
  *(_WORD *)(v5 + 252) |= 0x20u;
  __int16 v75 = (__int16)self->_has;
  if ((v75 & 2) == 0)
  {
LABEL_69:
    if ((v75 & 0x10) == 0) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
LABEL_91:
  *(_DWORD *)(v5 + 48) = self->_confirmationStyle;
  *(_WORD *)(v5 + 252) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_70:
    *(_DWORD *)(v5 + 152) = self->_requestType;
    *(_WORD *)(v5 + 252) |= 0x10u;
  }
LABEL_71:
  id v76 = [(PKProtobufShippingMethods *)self->_availableShippingMethods copyWithZone:a3];
  long long v77 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v76;

  id v78 = [(PKProtobufRecurringPaymentRequest *)self->_recurringPaymentRequest copyWithZone:a3];
  long long v79 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v78;

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v80 = self->_multiTokenContexts;
  uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v93 objects:v129 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v94;
    do
    {
      for (muint64_t m = 0; mm != v82; ++mm)
      {
        if (*(void *)v94 != v83) {
          objc_enumerationMutation(v80);
        }
        long long v85 = objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * mm), "copyWithZone:", a3, (void)v93);
        [(id)v5 addMultiTokenContexts:v85];
      }
      uint64_t v82 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v93 objects:v129 count:16];
    }
    while (v82);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 249) = self->_respectSupportedNetworksOrder;
    *(_WORD *)(v5 + 252) |= 0x400u;
  }
  id v86 = -[PKProtobufAutomaticReloadPaymentRequest copyWithZone:](self->_automaticReloadPaymentRequest, "copyWithZone:", a3, (void)v93);
  long long v87 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v86;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 160) = self->_requestorDeviceType;
    *(_WORD *)(v5 + 252) |= 0x40u;
  }
  id v88 = [(PKProtobufDeferredPaymentRequest *)self->_deferredPaymentRequest copyWithZone:a3];
  long long v89 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v88;

  uint64_t v90 = [(NSString *)self->_userAgent copyWithZone:a3];
  long long v91 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v90;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_merchantCategoryCode;
    *(_WORD *)(v5 + 252) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_128;
  }
  merchantIdentifier = self->_merchantIdentifier;
  if ((unint64_t)merchantIdentifier | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](merchantIdentifier, "isEqual:")) {
      goto LABEL_128;
    }
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_128;
    }
  }
  currencyCode = self->_currencyCode;
  if ((unint64_t)currencyCode | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](currencyCode, "isEqual:")) {
      goto LABEL_128;
    }
  }
  supportedNetworks = self->_supportedNetworks;
  if ((unint64_t)supportedNetworks | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](supportedNetworks, "isEqual:")) {
      goto LABEL_128;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 126);
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_merchantCapabilities != *((_DWORD *)v4 + 26)) {
      goto LABEL_128;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_requiredBillingAddressFields != *((_DWORD *)v4 + 41)) {
      goto LABEL_128;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x100) == 0 || self->_requiredShippingAddressFields != *((_DWORD *)v4 + 44)) {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x100) != 0)
  {
    goto LABEL_128;
  }
  billingContact = self->_billingContact;
  if ((unint64_t)billingContact | *((void *)v4 + 5)
    && !-[NSData isEqual:](billingContact, "isEqual:"))
  {
    goto LABEL_128;
  }
  shippingContact = self->_shippingContact;
  if ((unint64_t)shippingContact | *((void *)v4 + 24))
  {
    if (!-[NSData isEqual:](shippingContact, "isEqual:")) {
      goto LABEL_128;
    }
  }
  summaryItems = self->_summaryItems;
  if ((unint64_t)summaryItems | *((void *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](summaryItems, "isEqual:")) {
      goto LABEL_128;
    }
  }
  shippingMethods = self->_shippingMethods;
  if ((unint64_t)shippingMethods | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](shippingMethods, "isEqual:")) {
      goto LABEL_128;
    }
  }
  applicationData = self->_applicationData;
  if ((unint64_t)applicationData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](applicationData, "isEqual:")) {
      goto LABEL_128;
    }
  }
  originatingURL = self->_originatingURL;
  if ((unint64_t)originatingURL | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](originatingURL, "isEqual:")) {
      goto LABEL_128;
    }
  }
  merchantSessiouint64_t n = self->_merchantSession;
  if ((unint64_t)merchantSession | *((void *)v4 + 15))
  {
    if (!-[PKProtobufPaymentMerchantSession isEqual:](merchantSession, "isEqual:")) {
      goto LABEL_128;
    }
  }
  thumbnailURLs = self->_thumbnailURLs;
  if ((unint64_t)thumbnailURLs | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](thumbnailURLs, "isEqual:")) {
      goto LABEL_128;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x200) == 0) {
      goto LABEL_128;
    }
    if (self->_expectsMerchantSession)
    {
      if (!*((unsigned char *)v4 + 248)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 248))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x200) != 0)
  {
    goto LABEL_128;
  }
  requiredShippingContactFields = self->_requiredShippingContactFields;
  if ((unint64_t)requiredShippingContactFields | *((void *)v4 + 23)
    && !-[NSMutableArray isEqual:](requiredShippingContactFields, "isEqual:"))
  {
    goto LABEL_128;
  }
  requiredBillingContactFields = self->_requiredBillingContactFields;
  if ((unint64_t)requiredBillingContactFields | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](requiredBillingContactFields, "isEqual:")) {
      goto LABEL_128;
    }
  }
  supportedCountries = self->_supportedCountries;
  if ((unint64_t)supportedCountries | *((void *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](supportedCountries, "isEqual:")) {
      goto LABEL_128;
    }
  }
  __int16 v22 = *((_WORD *)v4 + 126);
  if (*(_WORD *)&self->_has)
  {
    if ((v22 & 1) == 0 || self->_apiType != *((_DWORD *)v4 + 2)) {
      goto LABEL_128;
    }
  }
  else if (v22)
  {
    goto LABEL_128;
  }
  contentItems = self->_contentItems;
  if ((unint64_t)contentItems | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](contentItems, "isEqual:"))
  {
    goto LABEL_128;
  }
  localizedNavigationTitle = self->_localizedNavigationTitle;
  if ((unint64_t)localizedNavigationTitle | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](localizedNavigationTitle, "isEqual:")) {
      goto LABEL_128;
    }
  }
  localizedSummaryItemsTitle = self->_localizedSummaryItemsTitle;
  if ((unint64_t)localizedSummaryItemsTitle | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](localizedSummaryItemsTitle, "isEqual:")) {
      goto LABEL_128;
    }
  }
  __int16 v26 = (__int16)self->_has;
  __int16 v27 = *((_WORD *)v4 + 126);
  if ((v26 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x1000) == 0) {
      goto LABEL_128;
    }
    if (self->_suppressTotal)
    {
      if (!*((unsigned char *)v4 + 251)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 251))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x1000) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x800) == 0) {
      goto LABEL_128;
    }
    if (self->_summaryPinned)
    {
      if (!*((unsigned char *)v4 + 250)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 250))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x800) != 0)
  {
    goto LABEL_128;
  }
  if ((v26 & 0x20) != 0)
  {
    if ((v27 & 0x20) == 0 || self->_requestor != *((_DWORD *)v4 + 39)) {
      goto LABEL_128;
    }
  }
  else if ((v27 & 0x20) != 0)
  {
    goto LABEL_128;
  }
  if ((v26 & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_confirmationStyle != *((_DWORD *)v4 + 12)) {
      goto LABEL_128;
    }
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_128;
  }
  if ((v26 & 0x10) != 0)
  {
    if ((v27 & 0x10) == 0 || self->_requestType != *((_DWORD *)v4 + 38)) {
      goto LABEL_128;
    }
  }
  else if ((v27 & 0x10) != 0)
  {
    goto LABEL_128;
  }
  availableShippingMethods = self->_availableShippingMethods;
  if ((unint64_t)availableShippingMethods | *((void *)v4 + 4)
    && !-[PKProtobufShippingMethods isEqual:](availableShippingMethods, "isEqual:"))
  {
    goto LABEL_128;
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  if ((unint64_t)recurringPaymentRequest | *((void *)v4 + 18))
  {
    if (!-[PKProtobufRecurringPaymentRequest isEqual:](recurringPaymentRequest, "isEqual:")) {
      goto LABEL_128;
    }
  }
  multiTokenContexts = self->_multiTokenContexts;
  if ((unint64_t)multiTokenContexts | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](multiTokenContexts, "isEqual:")) {
      goto LABEL_128;
    }
  }
  __int16 v31 = (__int16)self->_has;
  __int16 v32 = *((_WORD *)v4 + 126);
  if ((v31 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x400) == 0) {
      goto LABEL_128;
    }
    if (self->_respectSupportedNetworksOrder)
    {
      if (!*((unsigned char *)v4 + 249)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 249))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x400) != 0)
  {
    goto LABEL_128;
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  if (!((unint64_t)automaticReloadPaymentRequest | *((void *)v4 + 3))) {
    goto LABEL_114;
  }
  if (!-[PKProtobufAutomaticReloadPaymentRequest isEqual:](automaticReloadPaymentRequest, "isEqual:"))
  {
LABEL_128:
    BOOL v37 = 0;
    goto LABEL_129;
  }
  __int16 v31 = (__int16)self->_has;
  __int16 v32 = *((_WORD *)v4 + 126);
LABEL_114:
  if ((v31 & 0x40) != 0)
  {
    if ((v32 & 0x40) == 0 || self->_requestorDeviceType != *((_DWORD *)v4 + 40)) {
      goto LABEL_128;
    }
  }
  else if ((v32 & 0x40) != 0)
  {
    goto LABEL_128;
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  if ((unint64_t)deferredPaymentRequest | *((void *)v4 + 10)
    && !-[PKProtobufDeferredPaymentRequest isEqual:](deferredPaymentRequest, "isEqual:"))
  {
    goto LABEL_128;
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](userAgent, "isEqual:")) {
      goto LABEL_128;
    }
  }
  __int16 v36 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v36 & 8) == 0 || self->_merchantCategoryCode != *((_DWORD *)v4 + 27)) {
      goto LABEL_128;
    }
    BOOL v37 = 1;
  }
  else
  {
    BOOL v37 = (v36 & 8) == 0;
  }
LABEL_129:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v42 = [(NSString *)self->_merchantIdentifier hash];
  NSUInteger v41 = [(NSString *)self->_countryCode hash];
  NSUInteger v40 = [(NSString *)self->_currencyCode hash];
  uint64_t v39 = [(NSMutableArray *)self->_supportedNetworks hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
    uint64_t v38 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v37 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v38 = 2654435761 * self->_merchantCapabilities;
  if ((has & 0x80) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v37 = 2654435761 * self->_requiredBillingAddressFields;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v36 = 2654435761 * self->_requiredShippingAddressFields;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v36 = 0;
LABEL_8:
  uint64_t v35 = [(NSData *)self->_billingContact hash];
  uint64_t v34 = [(NSData *)self->_shippingContact hash];
  uint64_t v33 = [(NSMutableArray *)self->_summaryItems hash];
  uint64_t v32 = [(NSMutableArray *)self->_shippingMethods hash];
  uint64_t v31 = [(NSData *)self->_applicationData hash];
  NSUInteger v30 = [(NSString *)self->_originatingURL hash];
  unint64_t v29 = [(PKProtobufPaymentMerchantSession *)self->_merchantSession hash];
  uint64_t v28 = [(NSMutableArray *)self->_thumbnailURLs hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v27 = 2654435761 * self->_expectsMerchantSession;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v26 = [(NSMutableArray *)self->_requiredShippingContactFields hash];
  uint64_t v25 = [(NSMutableArray *)self->_requiredBillingContactFields hash];
  uint64_t v24 = [(NSMutableArray *)self->_supportedCountries hash];
  if (*(_WORD *)&self->_has) {
    uint64_t v23 = 2654435761 * self->_apiType;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v22 = [(NSMutableArray *)self->_contentItems hash];
  NSUInteger v21 = [(NSString *)self->_localizedNavigationTitle hash];
  NSUInteger v20 = [(NSString *)self->_localizedSummaryItemsTitle hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x1000) != 0)
  {
    uint64_t v19 = 2654435761 * self->_suppressTotal;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_16:
      uint64_t v18 = 2654435761 * self->_summaryPinned;
      if ((v4 & 0x20) != 0) {
        goto LABEL_17;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v18 = 0;
  if ((v4 & 0x20) != 0)
  {
LABEL_17:
    uint64_t v17 = 2654435761 * self->_requestor;
    if ((v4 & 2) != 0) {
      goto LABEL_18;
    }
LABEL_23:
    uint64_t v16 = 0;
    if ((v4 & 0x10) != 0) {
      goto LABEL_19;
    }
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v17 = 0;
  if ((v4 & 2) == 0) {
    goto LABEL_23;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_confirmationStyle;
  if ((v4 & 0x10) != 0)
  {
LABEL_19:
    uint64_t v15 = 2654435761 * self->_requestType;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v15 = 0;
LABEL_25:
  unint64_t v14 = [(PKProtobufShippingMethods *)self->_availableShippingMethods hash];
  unint64_t v5 = [(PKProtobufRecurringPaymentRequest *)self->_recurringPaymentRequest hash];
  uint64_t v6 = [(NSMutableArray *)self->_multiTokenContexts hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v7 = 2654435761 * self->_respectSupportedNetworksOrder;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(PKProtobufAutomaticReloadPaymentRequest *)self->_automaticReloadPaymentRequest hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v9 = 2654435761 * self->_requestorDeviceType;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(PKProtobufDeferredPaymentRequest *)self->_deferredPaymentRequest hash];
  NSUInteger v11 = [(NSString *)self->_userAgent hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v12 = 2654435761 * self->_merchantCategoryCode;
  }
  else {
    uint64_t v12 = 0;
  }
  return v41 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 14)) {
    -[PKProtobufPaymentRequest setMerchantIdentifier:](self, "setMerchantIdentifier:");
  }
  if (*((void *)v4 + 8)) {
    -[PKProtobufPaymentRequest setCountryCode:](self, "setCountryCode:");
  }
  if (*((void *)v4 + 9)) {
    -[PKProtobufPaymentRequest setCurrencyCode:](self, "setCurrencyCode:");
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v5 = *((id *)v4 + 28);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v95 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PKProtobufPaymentRequest *)self addSupportedNetworks:*(void *)(*((void *)&v94 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v94 objects:v106 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 126);
  if ((v10 & 4) != 0)
  {
    self->_merchantCapabilities = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 4u;
    __int16 v10 = *((_WORD *)v4 + 126);
    if ((v10 & 0x80) == 0)
    {
LABEL_16:
      if ((v10 & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  self->_requiredBillingAddressFields = *((_DWORD *)v4 + 41);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 126) & 0x100) != 0)
  {
LABEL_17:
    self->_requiredShippingAddressFields = *((_DWORD *)v4 + 44);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_18:
  if (*((void *)v4 + 5)) {
    -[PKProtobufPaymentRequest setBillingContact:](self, "setBillingContact:");
  }
  if (*((void *)v4 + 24)) {
    -[PKProtobufPaymentRequest setShippingContact:](self, "setShippingContact:");
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v11 = *((id *)v4 + 26);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v90 objects:v105 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v91;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v91 != v14) {
          objc_enumerationMutation(v11);
        }
        [(PKProtobufPaymentRequest *)self addSummaryItems:*(void *)(*((void *)&v90 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v90 objects:v105 count:16];
    }
    while (v13);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v16 = *((id *)v4 + 25);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v104 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v87;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v87 != v19) {
          objc_enumerationMutation(v16);
        }
        [(PKProtobufPaymentRequest *)self addShippingMethods:*(void *)(*((void *)&v86 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v86 objects:v104 count:16];
    }
    while (v18);
  }

  if (*((void *)v4 + 2)) {
    -[PKProtobufPaymentRequest setApplicationData:](self, "setApplicationData:");
  }
  if (*((void *)v4 + 17)) {
    -[PKProtobufPaymentRequest setOriginatingURL:](self, "setOriginatingURL:");
  }
  merchantSessiouint64_t n = self->_merchantSession;
  uint64_t v22 = *((void *)v4 + 15);
  if (merchantSession)
  {
    if (v22) {
      -[PKProtobufPaymentMerchantSession mergeFrom:](merchantSession, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[PKProtobufPaymentRequest setMerchantSession:](self, "setMerchantSession:");
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v23 = *((id *)v4 + 29);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v82 objects:v103 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v83;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v83 != v26) {
          objc_enumerationMutation(v23);
        }
        [(PKProtobufPaymentRequest *)self addThumbnailURLs:*(void *)(*((void *)&v82 + 1) + 8 * m)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v82 objects:v103 count:16];
    }
    while (v25);
  }

  if ((*((_WORD *)v4 + 126) & 0x200) != 0)
  {
    self->_expectsMerchantSessiouint64_t n = *((unsigned char *)v4 + 248);
    *(_WORD *)&self->_has |= 0x200u;
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v28 = *((id *)v4 + 23);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v78 objects:v102 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v79;
    do
    {
      for (uint64_t n = 0; n != v30; ++n)
      {
        if (*(void *)v79 != v31) {
          objc_enumerationMutation(v28);
        }
        [(PKProtobufPaymentRequest *)self addRequiredShippingContactFields:*(void *)(*((void *)&v78 + 1) + 8 * n)];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v78 objects:v102 count:16];
    }
    while (v30);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v33 = *((id *)v4 + 21);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v74 objects:v101 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v75;
    do
    {
      for (iuint64_t i = 0; ii != v35; ++ii)
      {
        if (*(void *)v75 != v36) {
          objc_enumerationMutation(v33);
        }
        [(PKProtobufPaymentRequest *)self addRequiredBillingContactFields:*(void *)(*((void *)&v74 + 1) + 8 * ii)];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v74 objects:v101 count:16];
    }
    while (v35);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v38 = *((id *)v4 + 27);
  uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v100 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v71;
    do
    {
      for (juint64_t j = 0; jj != v40; ++jj)
      {
        if (*(void *)v71 != v41) {
          objc_enumerationMutation(v38);
        }
        [(PKProtobufPaymentRequest *)self addSupportedCountries:*(void *)(*((void *)&v70 + 1) + 8 * jj)];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v70 objects:v100 count:16];
    }
    while (v40);
  }

  if (*((_WORD *)v4 + 126))
  {
    self->_apiType = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v43 = *((id *)v4 + 7);
  uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v99 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v67;
    do
    {
      for (kuint64_t k = 0; kk != v45; ++kk)
      {
        if (*(void *)v67 != v46) {
          objc_enumerationMutation(v43);
        }
        [(PKProtobufPaymentRequest *)self addContentItems:*(void *)(*((void *)&v66 + 1) + 8 * kk)];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v99 count:16];
    }
    while (v45);
  }

  if (*((void *)v4 + 11)) {
    -[PKProtobufPaymentRequest setLocalizedNavigationTitle:](self, "setLocalizedNavigationTitle:");
  }
  if (*((void *)v4 + 12)) {
    -[PKProtobufPaymentRequest setLocalizedSummaryItemsTitle:](self, "setLocalizedSummaryItemsTitle:");
  }
  __int16 v48 = *((_WORD *)v4 + 126);
  if ((v48 & 0x1000) != 0)
  {
    self->_suppressTotal = *((unsigned char *)v4 + 251);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v48 = *((_WORD *)v4 + 126);
    if ((v48 & 0x800) == 0)
    {
LABEL_93:
      if ((v48 & 0x20) == 0) {
        goto LABEL_94;
      }
      goto LABEL_102;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x800) == 0)
  {
    goto LABEL_93;
  }
  self->_summaryPinned = *((unsigned char *)v4 + 250);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v48 = *((_WORD *)v4 + 126);
  if ((v48 & 0x20) == 0)
  {
LABEL_94:
    if ((v48 & 2) == 0) {
      goto LABEL_95;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_uint64_t requestor = *((_DWORD *)v4 + 39);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v48 = *((_WORD *)v4 + 126);
  if ((v48 & 2) == 0)
  {
LABEL_95:
    if ((v48 & 0x10) == 0) {
      goto LABEL_97;
    }
    goto LABEL_96;
  }
LABEL_103:
  self->_uint64_t confirmationStyle = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 126) & 0x10) != 0)
  {
LABEL_96:
    self->_uint64_t requestType = *((_DWORD *)v4 + 38);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_97:
  availableShippingMethods = self->_availableShippingMethods;
  uint64_t v50 = *((void *)v4 + 4);
  if (availableShippingMethods)
  {
    if (v50) {
      -[PKProtobufShippingMethods mergeFrom:](availableShippingMethods, "mergeFrom:");
    }
  }
  else if (v50)
  {
    -[PKProtobufPaymentRequest setAvailableShippingMethods:](self, "setAvailableShippingMethods:");
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  uint64_t v52 = *((void *)v4 + 18);
  if (recurringPaymentRequest)
  {
    if (v52) {
      -[PKProtobufRecurringPaymentRequest mergeFrom:](recurringPaymentRequest, "mergeFrom:");
    }
  }
  else if (v52)
  {
    -[PKProtobufPaymentRequest setRecurringPaymentRequest:](self, "setRecurringPaymentRequest:");
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v53 = *((id *)v4 + 16);
  uint64_t v54 = [v53 countByEnumeratingWithState:&v62 objects:v98 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v63;
    do
    {
      for (muint64_t m = 0; mm != v55; ++mm)
      {
        if (*(void *)v63 != v56) {
          objc_enumerationMutation(v53);
        }
        -[PKProtobufPaymentRequest addMultiTokenContexts:](self, "addMultiTokenContexts:", *(void *)(*((void *)&v62 + 1) + 8 * mm), (void)v62);
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v62 objects:v98 count:16];
    }
    while (v55);
  }

  if ((*((_WORD *)v4 + 126) & 0x400) != 0)
  {
    self->_respectSupportedNetworksOrder = *((unsigned char *)v4 + 249);
    *(_WORD *)&self->_has |= 0x400u;
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  uint64_t v59 = *((void *)v4 + 3);
  if (automaticReloadPaymentRequest)
  {
    if (v59) {
      -[PKProtobufAutomaticReloadPaymentRequest mergeFrom:](automaticReloadPaymentRequest, "mergeFrom:");
    }
  }
  else if (v59)
  {
    -[PKProtobufPaymentRequest setAutomaticReloadPaymentRequest:](self, "setAutomaticReloadPaymentRequest:");
  }
  if ((*((_WORD *)v4 + 126) & 0x40) != 0)
  {
    self->_int requestorDeviceType = *((_DWORD *)v4 + 40);
    *(_WORD *)&self->_has |= 0x40u;
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  uint64_t v61 = *((void *)v4 + 10);
  if (deferredPaymentRequest)
  {
    if (v61) {
      -[PKProtobufDeferredPaymentRequest mergeFrom:](deferredPaymentRequest, "mergeFrom:");
    }
  }
  else if (v61)
  {
    -[PKProtobufPaymentRequest setDeferredPaymentRequest:](self, "setDeferredPaymentRequest:");
  }
  if (*((void *)v4 + 30)) {
    -[PKProtobufPaymentRequest setUserAgent:](self, "setUserAgent:");
  }
  if ((*((_WORD *)v4 + 126) & 8) != 0)
  {
    self->_merchantCategoryCode = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_has |= 8u;
  }
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSMutableArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
}

- (unsigned)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (unsigned)requiredBillingAddressFields
{
  return self->_requiredBillingAddressFields;
}

- (unsigned)requiredShippingAddressFields
{
  return self->_requiredShippingAddressFields;
}

- (NSData)billingContact
{
  return self->_billingContact;
}

- (void)setBillingContact:(id)a3
{
}

- (NSData)shippingContact
{
  return self->_shippingContact;
}

- (void)setShippingContact:(id)a3
{
}

- (NSMutableArray)summaryItems
{
  return self->_summaryItems;
}

- (void)setSummaryItems:(id)a3
{
}

- (NSMutableArray)shippingMethods
{
  return self->_shippingMethods;
}

- (void)setShippingMethods:(id)a3
{
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
}

- (NSString)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
}

- (PKProtobufPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
}

- (NSMutableArray)thumbnailURLs
{
  return self->_thumbnailURLs;
}

- (void)setThumbnailURLs:(id)a3
{
}

- (BOOL)expectsMerchantSession
{
  return self->_expectsMerchantSession;
}

- (NSMutableArray)requiredShippingContactFields
{
  return self->_requiredShippingContactFields;
}

- (void)setRequiredShippingContactFields:(id)a3
{
}

- (NSMutableArray)requiredBillingContactFields
{
  return self->_requiredBillingContactFields;
}

- (void)setRequiredBillingContactFields:(id)a3
{
}

- (NSMutableArray)supportedCountries
{
  return self->_supportedCountries;
}

- (void)setSupportedCountries:(id)a3
{
}

- (unsigned)apiType
{
  return self->_apiType;
}

- (NSMutableArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
}

- (NSString)localizedNavigationTitle
{
  return self->_localizedNavigationTitle;
}

- (void)setLocalizedNavigationTitle:(id)a3
{
}

- (NSString)localizedSummaryItemsTitle
{
  return self->_localizedSummaryItemsTitle;
}

- (void)setLocalizedSummaryItemsTitle:(id)a3
{
}

- (BOOL)suppressTotal
{
  return self->_suppressTotal;
}

- (BOOL)summaryPinned
{
  return self->_summaryPinned;
}

- (PKProtobufShippingMethods)availableShippingMethods
{
  return self->_availableShippingMethods;
}

- (void)setAvailableShippingMethods:(id)a3
{
}

- (PKProtobufRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void)setRecurringPaymentRequest:(id)a3
{
}

- (NSMutableArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (void)setMultiTokenContexts:(id)a3
{
}

- (BOOL)respectSupportedNetworksOrder
{
  return self->_respectSupportedNetworksOrder;
}

- (PKProtobufAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void)setAutomaticReloadPaymentRequest:(id)a3
{
}

- (PKProtobufDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void)setDeferredPaymentRequest:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (int)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_thumbnailURLs, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_supportedCountries, 0);
  objc_storeStrong((id *)&self->_summaryItems, 0);
  objc_storeStrong((id *)&self->_shippingMethods, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_requiredShippingContactFields, 0);
  objc_storeStrong((id *)&self->_requiredBillingContactFields, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedSummaryItemsTitle, 0);
  objc_storeStrong((id *)&self->_localizedNavigationTitle, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
  objc_storeStrong((id *)&self->_availableShippingMethods, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
}

@end