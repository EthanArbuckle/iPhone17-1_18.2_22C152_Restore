@interface PDBarcodeServiceBarcodeEventResponse
- (BOOL)transactionAvailable;
- (PDBarcodeServiceBarcodeEventResponse)initWithData:(id)a3;
- (id)description;
@end

@implementation PDBarcodeServiceBarcodeEventResponse

- (PDBarcodeServiceBarcodeEventResponse)initWithData:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_13;
  }
  id v13 = 0;
  v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v13];
  id v6 = v13;
  if (v6)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      v8 = "PDBarcodeServiceBarcodeEventResponse failed to parse response data with error: %@";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "PDBarcodeServiceBarcodeEventResponse body is not a dictionary";
      v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_11;
    }
LABEL_12:

LABEL_13:
    v5 = 0;
LABEL_14:

    self = 0;
    goto LABEL_15;
  }
  if (!v5) {
    goto LABEL_14;
  }
  v12.receiver = self;
  v12.super_class = (Class)PDBarcodeServiceBarcodeEventResponse;
  self = [(PDBarcodeServiceBarcodeEventResponse *)&v12 init];
  if (!self) {
    goto LABEL_14;
  }
  self->_transactionAvailable = [v5 PKBoolForKey:@"transactionAvailable"];
LABEL_15:

  return self;
}

- (id)description
{
  if (self->_transactionAvailable) {
    CFStringRef v2 = @"YES";
  }
  else {
    CFStringRef v2 = @"NO";
  }
  return +[NSString stringWithFormat:@"PDBarcodeServiceBarcodeEventResponse <%p>: transactionAvailable %@", self, v2];
}

- (BOOL)transactionAvailable
{
  return self->_transactionAvailable;
}

@end