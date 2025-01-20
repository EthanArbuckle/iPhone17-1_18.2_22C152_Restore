@interface PDBarcodeServiceBarcodeEventTask
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSData)event;
- (NSData)signature;
- (NSString)barcodeIdentifier;
- (PDBarcodeServiceBarcodeEventTask)initWithCoder:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setBarcodeIdentifier:(id)a3;
- (void)setEvent:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation PDBarcodeServiceBarcodeEventTask

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDBarcodeServiceBarcodeEventTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDBarcodeServiceBarcodeEventTask;
  v5 = [(PDBarcodeServiceConnectionTask *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeIdentifier"];
    barcodeIdentifier = v5->_barcodeIdentifier;
    v5->_barcodeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
    event = v5->_event;
    v5->_event = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDBarcodeServiceBarcodeEventTask;
  id v4 = a3;
  [(PDBarcodeServiceConnectionTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_barcodeIdentifier, @"barcodeIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_event forKey:@"event"];
  [v4 encodeObject:self->_signature forKey:@"signature"];
}

- (BOOL)isValid
{
  v5.receiver = self;
  v5.super_class = (Class)PDBarcodeServiceBarcodeEventTask;
  BOOL v3 = [(PDBarcodeServiceConnectionTask *)&v5 isValid];
  if (v3) {
    LOBYTE(v3) = self->_barcodeIdentifier && self->_event && self->_signature != 0;
  }
  return v3;
}

- (id)method
{
  return @"POST";
}

- (id)endpointComponents
{
  v4[0] = @"v1";
  v4[1] = @"barcode";
  v4[2] = self->_barcodeIdentifier;
  v4[3] = @"event";
  v2 = +[NSArray arrayWithObjects:v4 count:4];
  return v2;
}

- (id)bodyDictionary
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  id v4 = [(NSData *)self->_event base64EncodedStringWithOptions:0];
  [v3 setObject:v4 forKey:@"event"];

  objc_super v5 = [(NSData *)self->_signature base64EncodedStringWithOptions:0];
  [v3 setObject:v5 forKey:@"signature"];

  id v6 = [v3 copy];
  return v6;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PDBarcodeServiceBarcodeEventTask;
  id v7 = a3;
  [(PDBarcodeServiceConnectionTask *)&v17 handleResponse:v7 data:v6];
  id v8 = [v7 statusCode];

  if (v8 == (id)403)
  {
    v11 = [[PDBarcodeServiceConnectionForbiddenErrorResponse alloc] initWithData:v6];
    if ((id)[(PDBarcodeServiceConnectionForbiddenErrorResponse *)v11 errorCode] == (id)40601)
    {
      v16 = PDTaskError(40601, self, 0, @"Invalid Certificate", v12, v13, v14, v15, (uint64_t)v17.receiver);
      [(PDNetworkTask *)self reportError:v16];
    }
    [(PDNetworkTask *)self fail];
  }
  else if (v8 == (id)200)
  {
    v9 = [PDBarcodeServiceBarcodeEventResponse alloc];
    uint64_t v10 = -[PDBarcodeServiceBarcodeEventResponse initWithData:](v9, "initWithData:", v6, v17.receiver, v17.super_class);
    [(PDNetworkTask *)self deliverResult:v10];

    [(PDNetworkTask *)self succeed];
  }
  else
  {
    [(PDNetworkTask *)self fail];
  }
}

- (void)handleError:(id)a3
{
  objc_super v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }

  [(PDNetworkTask *)self fail];
}

- (id)description
{
  return +[NSString stringWithFormat:@"BarcodeEvent Task (barcode identifier: %@)", self->_barcodeIdentifier];
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
}

- (NSData)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
}

@end