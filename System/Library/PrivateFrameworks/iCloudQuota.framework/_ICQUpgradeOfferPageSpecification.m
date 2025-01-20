@interface _ICQUpgradeOfferPageSpecification
+ (id)upgradeOfferPageSpecificationSampleForLevel:(int64_t)a3;
- (ICQLink)bottomLink;
- (ICQLink)purchase2Link;
- (ICQLink)purchaseLink;
- (NSArray)altMessageLinks;
- (NSArray)fineprintLinks;
- (NSArray)messageLinks;
- (NSDictionary)serverDict;
- (NSString)altMessage;
- (NSString)bottomLinkVisibleKey;
- (NSString)fineprintFormat;
- (NSString)iconBundleIdentifier;
- (NSString)message;
- (NSString)purchase2LinkVisibleKey;
- (NSString)title;
- (_ICQUpgradeOfferPageSpecification)initWithServerDictionary:(id)a3;
- (_ICQUpgradeOfferPageSpecification)initWithServerDictionary:(id)a3 pageIdentifier:(id)a4;
- (id)copy;
- (id)copyWithBindings:(id)a3;
- (id)debugDescription;
- (void)setAltMessage:(id)a3;
- (void)setAltMessageLinks:(id)a3;
- (void)setBottomLink:(id)a3;
- (void)setBottomLinkVisibleKey:(id)a3;
- (void)setFineprintFormat:(id)a3;
- (void)setFineprintLinks:(id)a3;
- (void)setIconBundleIdentifier:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageLinks:(id)a3;
- (void)setPurchase2Link:(id)a3;
- (void)setPurchase2LinkVisibleKey:(id)a3;
- (void)setPurchaseLink:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _ICQUpgradeOfferPageSpecification

- (_ICQUpgradeOfferPageSpecification)initWithServerDictionary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [v6 UUIDString];

  v8 = [(_ICQUpgradeOfferPageSpecification *)self initWithServerDictionary:v5 pageIdentifier:v7];
  return v8;
}

- (_ICQUpgradeOfferPageSpecification)initWithServerDictionary:(id)a3 pageIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)_ICQUpgradeOfferPageSpecification;
  v9 = [(_ICQUpgradeOfferPageSpecification *)&v48 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serverDict, a3);
    [(_ICQPageSpecification *)v10 setPageIdentifier:v8];
    id v11 = v7;
    v12 = [v11 objectForKeyedSubscript:@"appId"];
    if (!v12)
    {
      v13 = [v11 objectForKeyedSubscript:@"icloudApps"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 count])
      {
        v14 = [v13 objectAtIndexedSubscript:0];
        objc_opt_class();
        v12 = 0;
        if (objc_opt_isKindOfClass())
        {
          v12 = [v14 objectForKeyedSubscript:@"appId"];
        }
      }
      else
      {
        v12 = 0;
      }
    }
    [(_ICQUpgradeOfferPageSpecification *)v10 setIconBundleIdentifier:v12];

    v15 = [v11 objectForKeyedSubscript:@"title"];
    [(_ICQUpgradeOfferPageSpecification *)v10 setTitle:v15];

    v16 = [v11 objectForKeyedSubscript:@"header"];
    id v46 = 0;
    id v47 = 0;
    _ICQServerHeaderGetFormatAndLinks(v16, &v47, &v46);
    id v17 = v47;
    id v18 = v46;

    [(_ICQUpgradeOfferPageSpecification *)v10 setMessage:v17];
    [(_ICQUpgradeOfferPageSpecification *)v10 setMessageLinks:v18];
    v19 = [v11 objectForKeyedSubscript:@"altHeader"];

    if (v19)
    {
      v20 = [v11 objectForKeyedSubscript:@"altHeader"];
      id v44 = v18;
      id v45 = v17;
      _ICQServerHeaderGetFormatAndLinks(v20, &v45, &v44);
      id v21 = v45;

      id v22 = v44;
      [(_ICQUpgradeOfferPageSpecification *)v10 setAltMessage:v21];
      [(_ICQUpgradeOfferPageSpecification *)v10 setAltMessageLinks:v22];
      id v18 = v22;
      id v17 = v21;
    }
    v23 = [v11 objectForKeyedSubscript:@"footer"];
    id v42 = v18;
    id v43 = v17;
    _ICQServerHeaderGetFormatAndLinks(v23, &v43, &v42);
    id v24 = v43;

    id v25 = v42;
    [(_ICQUpgradeOfferPageSpecification *)v10 setFineprintFormat:v24];
    [(_ICQUpgradeOfferPageSpecification *)v10 setFineprintLinks:v25];
    v26 = _ICQDictionaryForKey(v11, @"actionBtn");
    v27 = v26;
    if (v26)
    {
      v28 = _ICQLinkForServerMessageParameterWithOptions(v26, 0);
      [(_ICQUpgradeOfferPageSpecification *)v10 setPurchaseLink:v28];
    }
    else
    {
      v29 = [v11 objectForKeyedSubscript:@"buyBtn"];
      v30 = v29;
      if (v29)
      {
        id v31 = v29;
      }
      else
      {
        id v31 = [v11 objectForKeyedSubscript:@"doneBtn"];
      }
      v28 = v31;

      id v32 = [(_ICQPageSpecification *)v10 pageIdentifier];
      if ([v32 isEqualToString:@"UpgradeOffer"])
      {
        uint64_t v33 = 4;
      }
      else if ([v32 isEqualToString:@"UpgradeComplete"])
      {
        uint64_t v33 = 5;
      }
      else if ([v32 isEqualToString:@"UpgradeSuccessWiFi"])
      {
        uint64_t v33 = 5;
      }
      else
      {
        uint64_t v33 = 1;
      }

      v34 = +[ICQLink linkWithText:v28 action:v33 parameters:MEMORY[0x1E4F1CC08]];
      [(_ICQUpgradeOfferPageSpecification *)v10 setPurchaseLink:v34];
    }
    v35 = _ICQDictionaryForKey(v11, @"actionBtn2");

    v36 = _ICQLinkForServerMessageParameterWithOptions(v35, 0);
    [(_ICQUpgradeOfferPageSpecification *)v10 setPurchase2Link:v36];

    v37 = _ICQLinkVisibleKeyForServerMessageParameter(v35);
    [(_ICQUpgradeOfferPageSpecification *)v10 setPurchase2LinkVisibleKey:v37];

    v38 = _ICQDictionaryForOneOfKeys(v11, &unk_1F2DE1A80);

    v39 = _ICQLinkForServerMessageParameterWithOptions(v38, 0);
    [(_ICQUpgradeOfferPageSpecification *)v10 setBottomLink:v39];

    v40 = _ICQLinkVisibleKeyForServerMessageParameter(v38);
    [(_ICQUpgradeOfferPageSpecification *)v10 setBottomLinkVisibleKey:v40];

    [(_ICQPageSpecification *)v10 setHasCancelButtonForBack:1];
  }

  return v10;
}

- (id)debugDescription
{
  v15 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)_ICQUpgradeOfferPageSpecification;
  v14 = [(_ICQPageSpecification *)&v16 debugDescription];
  v3 = [(_ICQUpgradeOfferPageSpecification *)self title];
  v4 = [(_ICQUpgradeOfferPageSpecification *)self message];
  id v5 = [(_ICQUpgradeOfferPageSpecification *)self purchaseLink];
  v6 = [v5 text];
  id v7 = [(_ICQUpgradeOfferPageSpecification *)self purchase2Link];
  id v8 = [v7 text];
  v9 = [(_ICQUpgradeOfferPageSpecification *)self bottomLink];
  v10 = [v9 text];
  id v11 = [(_ICQUpgradeOfferPageSpecification *)self fineprintFormat];
  v12 = [v15 stringWithFormat:@"%@: title:%@ message:%@ purchase:%@ purchase2:%@ bottom:%@ fine:%@", v14, v3, v4, v6, v8, v10, v11];

  return v12;
}

- (id)copy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(_ICQUpgradeOfferPageSpecification *)self serverDict];
  id v5 = [(_ICQPageSpecification *)self pageIdentifier];
  v6 = (void *)[v3 initWithServerDictionary:v4 pageIdentifier:v5];

  return v6;
}

- (id)copyWithBindings:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICQUpgradeOfferPageSpecification *)self copy];
  v6 = [v5 purchase2LinkVisibleKey];

  if (v6)
  {
    id v7 = [v5 purchase2LinkVisibleKey];
    id v8 = [v4 objectForKeyedSubscript:v7];
    char v9 = _ICQBooleanForServerObjectDefault(v8, 0);

    if ((v9 & 1) == 0) {
      [v5 setPurchase2Link:0];
    }
  }
  v10 = [v5 bottomLinkVisibleKey];

  if (v10)
  {
    id v11 = [v5 bottomLinkVisibleKey];
    v12 = [v4 objectForKeyedSubscript:v11];
    char v13 = _ICQBooleanForServerObjectDefault(v12, 0);

    if ((v13 & 1) == 0) {
      [v5 setBottomLink:0];
    }
  }

  return v5;
}

- (NSDictionary)serverDict
{
  return self->_serverDict;
}

- (NSString)iconBundleIdentifier
{
  return self->_iconBundleIdentifier;
}

- (void)setIconBundleIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSArray)messageLinks
{
  return self->_messageLinks;
}

- (void)setMessageLinks:(id)a3
{
}

- (NSString)altMessage
{
  return self->_altMessage;
}

- (void)setAltMessage:(id)a3
{
}

- (NSArray)altMessageLinks
{
  return self->_altMessageLinks;
}

- (void)setAltMessageLinks:(id)a3
{
}

- (ICQLink)purchaseLink
{
  return self->_purchaseLink;
}

- (void)setPurchaseLink:(id)a3
{
}

- (ICQLink)purchase2Link
{
  return self->_purchase2Link;
}

- (void)setPurchase2Link:(id)a3
{
}

- (ICQLink)bottomLink
{
  return self->_bottomLink;
}

- (void)setBottomLink:(id)a3
{
}

- (NSString)fineprintFormat
{
  return self->_fineprintFormat;
}

- (void)setFineprintFormat:(id)a3
{
}

- (NSArray)fineprintLinks
{
  return self->_fineprintLinks;
}

- (void)setFineprintLinks:(id)a3
{
}

- (NSString)purchase2LinkVisibleKey
{
  return self->_purchase2LinkVisibleKey;
}

- (void)setPurchase2LinkVisibleKey:(id)a3
{
}

- (NSString)bottomLinkVisibleKey
{
  return self->_bottomLinkVisibleKey;
}

- (void)setBottomLinkVisibleKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLinkVisibleKey, 0);
  objc_storeStrong((id *)&self->_purchase2LinkVisibleKey, 0);
  objc_storeStrong((id *)&self->_fineprintLinks, 0);
  objc_storeStrong((id *)&self->_fineprintFormat, 0);
  objc_storeStrong((id *)&self->_bottomLink, 0);
  objc_storeStrong((id *)&self->_purchase2Link, 0);
  objc_storeStrong((id *)&self->_purchaseLink, 0);
  objc_storeStrong((id *)&self->_altMessageLinks, 0);
  objc_storeStrong((id *)&self->_altMessage, 0);
  objc_storeStrong((id *)&self->_messageLinks, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

+ (id)upgradeOfferPageSpecificationSampleForLevel:(int64_t)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  [v3 setTitle:@"Upgrade your iCloud Storage"];
  [v3 setMessage:@"Add more storage to continue using iCloud and keep the most important things on your iPhone safe."];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Buy 50 GB for $0.99%C/%Cmo", 8288, 8288);
  id v5 = +[ICQLink linkWithText:v4 action:4 parameters:MEMORY[0x1E4F1CC08]];
  [v3 setPurchaseLink:v5];

  objc_super v16 = @"URL";
  v17[0] = @"http://www.apple.com/icloud/";
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v7 = +[ICQLink linkWithText:@"Learn about managing storage" action:6 parameters:v6];
  [v3 setBottomLink:v7];

  [v3 setFineprintFormat:@"You will be charged $0.99 right now and each month. You can cancel at any time. Contact Apple within 15 days for a refund. Partial refunds are available where required. See %@."];
  v14 = @"URL";
  v15 = @"https://www.apple.com/legal/internet-services/icloud/en/terms.html";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  char v9 = +[ICQLink linkWithText:@"Terms & Conditions" action:6 parameters:v8];

  char v13 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v3 setFineprintLinks:v10];

  [v3 setHasCancelButtonForBack:1];
  id v11 = [v3 pageIdentifier];

  if (!v11) {
    [v3 setPageIdentifier:&stru_1F2DCE430];
  }

  return v3;
}

@end