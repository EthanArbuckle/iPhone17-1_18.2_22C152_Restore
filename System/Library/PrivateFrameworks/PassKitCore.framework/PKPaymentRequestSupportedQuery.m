@interface PKPaymentRequestSupportedQuery
+ (id)inAppQueryWithSupportedNetworkIDs:(id)a3 merchantCapabilities:(unint64_t)a4 merchantCountryCode:(id)a5 paymentMode:(int64_t)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 webService:(id)a10;
+ (id)webQueryWithSupportedNetworkIDs:(id)a3 merchantCapabilities:(unint64_t)a4 merchantCountryCode:(id)a5 paymentMode:(int64_t)a6 paymentApplicationStates:(id)a7 isMultiTokensRequest:(BOOL)a8 webService:(id)a9;
- (BOOL)isMultiTokensRequest;
- (BOOL)issuedOnTheWeb;
- (NSArray)supportedNetworkIDs;
- (NSNumber)paymentRequestType;
- (NSSet)paymentApplicationStates;
- (NSString)merchantCountryCode;
- (PKPaymentRequestSupportedQuery)initWithIssuedOnTheWeb:(BOOL)a3 supportedNetworkIDs:(id)a4 merchantCapabilities:(unint64_t)a5 merchantCountryCode:(id)a6 paymentMode:(int64_t)a7 paymentApplicationStates:(id)a8 paymentRequestType:(id)a9 isMultiTokensRequest:(BOOL)a10 webService:(id)a11;
- (PKPaymentWebService)webService;
- (int64_t)paymentMode;
- (unint64_t)merchantCapabilities;
@end

@implementation PKPaymentRequestSupportedQuery

+ (id)webQueryWithSupportedNetworkIDs:(id)a3 merchantCapabilities:(unint64_t)a4 merchantCountryCode:(id)a5 paymentMode:(int64_t)a6 paymentApplicationStates:(id)a7 isMultiTokensRequest:(BOOL)a8 webService:(id)a9
{
  id v16 = a9;
  id v17 = a7;
  id v18 = a5;
  id v19 = a3;
  LOBYTE(v22) = a8;
  v20 = (void *)[objc_alloc((Class)a1) initWithIssuedOnTheWeb:1 supportedNetworkIDs:v19 merchantCapabilities:a4 merchantCountryCode:v18 paymentMode:a6 paymentApplicationStates:v17 paymentRequestType:0 isMultiTokensRequest:v22 webService:v16];

  return v20;
}

+ (id)inAppQueryWithSupportedNetworkIDs:(id)a3 merchantCapabilities:(unint64_t)a4 merchantCountryCode:(id)a5 paymentMode:(int64_t)a6 paymentApplicationStates:(id)a7 paymentRequestType:(id)a8 isMultiTokensRequest:(BOOL)a9 webService:(id)a10
{
  id v17 = a10;
  id v18 = a8;
  id v19 = a7;
  id v20 = a5;
  id v21 = a3;
  LOBYTE(v24) = a9;
  uint64_t v22 = (void *)[objc_alloc((Class)a1) initWithIssuedOnTheWeb:0 supportedNetworkIDs:v21 merchantCapabilities:a4 merchantCountryCode:v20 paymentMode:a6 paymentApplicationStates:v19 paymentRequestType:v18 isMultiTokensRequest:v24 webService:v17];

  return v22;
}

- (PKPaymentRequestSupportedQuery)initWithIssuedOnTheWeb:(BOOL)a3 supportedNetworkIDs:(id)a4 merchantCapabilities:(unint64_t)a5 merchantCountryCode:(id)a6 paymentMode:(int64_t)a7 paymentApplicationStates:(id)a8 paymentRequestType:(id)a9 isMultiTokensRequest:(BOOL)a10 webService:(id)a11
{
  id v18 = a4;
  id v19 = (NSString *)a6;
  id v20 = a8;
  id v21 = (NSNumber *)a9;
  id v25 = a11;
  if (!v20)
  {
    id v20 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EE22B9A8];
  }
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentRequestSupportedQuery;
  uint64_t v22 = [(PKPaymentRequestSupportedQuery *)&v26 init];
  v23 = v22;
  if (v22)
  {
    v22->_issuedOnTheWeb = a3;
    objc_storeStrong((id *)&v22->_supportedNetworkIDs, a4);
    v23->_merchantCapabilities = a5;
    v23->_merchantCountryCode = v19;
    v23->_paymentMode = a7;
    objc_storeStrong((id *)&v23->_paymentApplicationStates, v20);
    v23->_paymentRequestType = v21;
    v23->_isMultiTokensRequest = a10;
    objc_storeStrong((id *)&v23->_webService, a11);
  }

  return v23;
}

- (BOOL)issuedOnTheWeb
{
  return self->_issuedOnTheWeb;
}

- (NSArray)supportedNetworkIDs
{
  return self->_supportedNetworkIDs;
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (int64_t)paymentMode
{
  return self->_paymentMode;
}

- (NSSet)paymentApplicationStates
{
  return self->_paymentApplicationStates;
}

- (NSNumber)paymentRequestType
{
  return self->_paymentRequestType;
}

- (BOOL)isMultiTokensRequest
{
  return self->_isMultiTokensRequest;
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentApplicationStates, 0);
  objc_storeStrong((id *)&self->_supportedNetworkIDs, 0);
}

@end