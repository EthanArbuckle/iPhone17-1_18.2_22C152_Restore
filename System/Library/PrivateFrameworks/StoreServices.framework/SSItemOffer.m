@interface SSItemOffer
+ (id)_preferredOfferIdentifiers;
- (BOOL)isOneTapOffer;
- (BOOL)isPreorder;
- (BOOL)shouldShowPlusIcon;
- (NSArray)supportedDevices;
- (NSSet)accountIdentifiers;
- (NSString)actionDisplayName;
- (NSString)actionType;
- (NSString)buyParameters;
- (NSString)offerIdentifier;
- (NSString)priceDisplay;
- (SSDialog)confirmationDialog;
- (SSDialog)successDialog;
- (SSItem)_offerItem;
- (SSItemMedia)offerMedia;
- (SSItemOffer)init;
- (SSItemOffer)initWithOfferIdentifier:(id)a3 dictionary:(id)a4;
- (SSNetworkConstraints)networkConstraints;
- (id)allowedToneStyles;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)documentCannotOpenDialog;
- (id)documentRequiredHandlers;
- (id)documentUTI;
- (id)requiredSoftwareCapabilities;
- (id)valueForProperty:(id)a3;
- (int64_t)estimatedDiskSpaceNeeded;
- (void)_setOfferItem:(id)a3;
- (void)dealloc;
- (void)setActionDisplayName:(id)a3;
- (void)setBuyParameters:(id)a3;
- (void)setOneTapOffer:(BOOL)a3;
- (void)setPriceDisplay:(id)a3;
@end

@implementation SSItemOffer

- (SSItemOffer)init
{
  return [(SSItemOffer *)self initWithOfferIdentifier:0 dictionary:0];
}

- (SSItemOffer)initWithOfferIdentifier:(id)a3 dictionary:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SSItemOffer;
  v6 = [(SSItemOffer *)&v8 init];
  if (v6)
  {
    v6->_offerDictionary = (NSMutableDictionary *)[a4 mutableCopy];
    v6->_offerIdentifier = (NSString *)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemOffer;
  [(SSItemOffer *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[2] = [(NSMutableDictionary *)self->_offerDictionary mutableCopyWithZone:a3];
  v5[3] = [(NSString *)self->_offerIdentifier copyWithZone:a3];
  v5[4] = [(NSArray *)self->_supportedDevices copyWithZone:a3];
  return v5;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemOffer;
  return (id)[NSString stringWithFormat:@"%@: (%@: %@)", -[SSItemOffer description](&v3, sel_description), -[SSItemOffer offerIdentifier](self, "offerIdentifier"), -[SSItemOffer buyParameters](self, "buyParameters")];
}

- (NSString)actionDisplayName
{
  v2 = [(SSItemOffer *)self valueForProperty:@"action-display-name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)allowedToneStyles
{
  id v3 = [(SSItemOffer *)self valueForProperty:@"allowed-tone-styles"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  BOOL v5 = [(SSItemMedia *)[(SSItemOffer *)self offerMedia] isProtectedMedia];
  v6 = (void *)MEMORY[0x1E4F1C978];
  if (!v5) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"ringtone", @"texttone", 0);
  }
  return (id)[v6 arrayWithObject:@"ringtone"];
}

- (NSString)buyParameters
{
  if ([(SSItem *)self->_item isRestricted])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(SSItemOffer *)self valueForProperty:@"action-params"];
    if (!v3) {
      id v3 = [(SSItemOffer *)self valueForProperty:@"buy-params"];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (SSDialog)confirmationDialog
{
  v2 = [[SSDialog alloc] initWithDialogDictionary:[(NSMutableDictionary *)self->_offerDictionary objectForKey:@"confirmation-dialog"]];
  return v2;
}

- (id)documentCannotOpenDialog
{
  v2 = [[SSDialog alloc] initWithDialogDictionary:[(NSMutableDictionary *)self->_offerDictionary objectForKey:@"document-cannot-open-dialog"]];
  return v2;
}

- (id)documentRequiredHandlers
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"required-document-handlers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)documentUTI
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"UTI"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (BOOL)isOneTapOffer
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"should-show-confirmation"];
  if (objc_opt_respondsToSelector()) {
    return [v2 BOOLValue] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isPreorder
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"is-preorder"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (SSNetworkConstraints)networkConstraints
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"network-constraints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc_init(SSNetworkConstraints);
    [(SSNetworkConstraints *)v3 setSizeLimitsWithStoreConstraintDictionary:v2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (SSItemMedia)offerMedia
{
  id v3 = [[SSItemMedia alloc] initWithStoreOfferDictionary:self->_offerDictionary];
  item = self->_item;
  if (item)
  {
    uint64_t v5 = [(SSItem *)item mediaKind];
LABEL_13:
    [(SSItemMedia *)v3 setMediaKind:v5];
    goto LABEL_14;
  }
  offerIdentifier = self->_offerIdentifier;
  if (!offerIdentifier) {
    goto LABEL_14;
  }
  if ([(NSString *)offerIdentifier rangeOfString:@"video" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = SSItemMediaKindVideo;
    goto LABEL_12;
  }
  v7 = self->_offerIdentifier;
  if (!v7) {
    goto LABEL_14;
  }
  if ([(NSString *)v7 rangeOfString:@"audio" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = SSItemMediaKindAudio;
    goto LABEL_12;
  }
  objc_super v8 = self->_offerIdentifier;
  if (v8
    && [(NSString *)v8 rangeOfString:@"document" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = SSItemMediaKindDocument;
LABEL_12:
    uint64_t v5 = (uint64_t)*v9;
    goto LABEL_13;
  }
LABEL_14:
  return v3;
}

- (NSString)priceDisplay
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"price-display"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (SSDialog)successDialog
{
  id v2 = [[SSDialog alloc] initWithDialogDictionary:[(NSMutableDictionary *)self->_offerDictionary objectForKey:@"success-dialog"]];
  return v2;
}

- (NSArray)supportedDevices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  result = self->_supportedDevices;
  if (!result)
  {
    id v4 = [(SSItemOffer *)self valueForProperty:@"supported-device-types"];
    if (!v4) {
      id v4 = [(SSItemOffer *)self valueForProperty:@"supported-devices"];
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = [[SSItemOfferDevice alloc] initWithOfferDeviceDicitionary:v10];
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
            v11 = -[SSItemOfferDevice initWithDeviceIdentifier:]([SSItemOfferDevice alloc], "initWithDeviceIdentifier:", (int)[v10 intValue]);
          }
          v12 = v11;
          if (v11)
          {
            [v5 addObject:v11];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    self->_supportedDevices = (NSArray *)[v5 copy];

    return self->_supportedDevices;
  }
  return result;
}

- (id)valueForProperty:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_offerDictionary objectForKey:a3];
  return v3;
}

- (NSSet)accountIdentifiers
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"ds-ids"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  return (NSSet *)[v3 setWithArray:v2];
}

- (NSString)actionType
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"action-type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return (NSString *)@"buy";
  }
}

- (int64_t)estimatedDiskSpaceNeeded
{
  id v2 = [(SSItemOffer *)self offerMedia];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  int64_t v4 = [(SSItemMedia *)v2 mediaFileSize];
  if ([(NSString *)[(SSItemMedia *)v3 mediaKind] isEqualToString:@"software"]) {
    return (uint64_t)((double)v4 * 2.5);
  }
  return v4;
}

- (id)requiredSoftwareCapabilities
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"UIRequiredDeviceCapabilities"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return v2;
}

- (void)setActionDisplayName:(id)a3
{
  offerDictionary = self->_offerDictionary;
  if (a3) {
    [(NSMutableDictionary *)offerDictionary setObject:a3 forKey:@"action-display-name"];
  }
  else {
    [(NSMutableDictionary *)offerDictionary removeObjectForKey:@"action-display-name"];
  }
}

- (void)setBuyParameters:(id)a3
{
  offerDictionary = self->_offerDictionary;
  if (a3)
  {
    -[NSMutableDictionary setObject:forKey:](offerDictionary, "setObject:forKey:");
  }
  else
  {
    [(NSMutableDictionary *)offerDictionary removeObjectForKey:@"action-params"];
    id v5 = self->_offerDictionary;
    [(NSMutableDictionary *)v5 removeObjectForKey:@"buy-params"];
  }
}

- (void)setOneTapOffer:(BOOL)a3
{
  offerDictionary = self->_offerDictionary;
  uint64_t v4 = [NSNumber numberWithBool:!a3];
  [(NSMutableDictionary *)offerDictionary setObject:v4 forKey:@"should-show-confirmation"];
}

- (void)setPriceDisplay:(id)a3
{
  offerDictionary = self->_offerDictionary;
  if (a3) {
    [(NSMutableDictionary *)offerDictionary setObject:a3 forKey:@"price-display"];
  }
  else {
    [(NSMutableDictionary *)offerDictionary removeObjectForKey:@"price-display"];
  }
}

- (BOOL)shouldShowPlusIcon
{
  id v2 = [(SSItemOffer *)self valueForProperty:@"plus-icon-badge"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

+ (id)_preferredOfferIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"PLUSPRE", @"STDQPRE", @"HDPRE", @"HQRDL", @"PLUS", @"STDRDL", @"STDQ", @"SWUPD", @"HDRDL", @"SDVOD", @"HDVOD", @"LCVOD", @"HDBUY", @"standard-audio", @"standard-video", @"standard-document", 0);
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (SSItem)_offerItem
{
  return self->_item;
}

- (void)_setOfferItem:(id)a3
{
  self->_item = (SSItem *)a3;
}

@end