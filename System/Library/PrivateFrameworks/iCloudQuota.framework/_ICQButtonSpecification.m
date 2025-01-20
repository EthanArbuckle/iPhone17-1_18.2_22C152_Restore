@interface _ICQButtonSpecification
+ (id)buttonSpecificationSampleForLevel:(int64_t)a3;
- (ICQLink)buttonLink;
- (NSDictionary)linkForBundleIdentifier;
- (NSString)buttonFormat;
- (NSString)linkFormat;
- (NSString)textFormat;
- (_ICQButtonSpecification)initWithServerDictionary:(id)a3;
- (id)linkForBundleIdentifier:(id)a3;
- (void)setLinkForBundleIdentifier:(id)a3;
@end

@implementation _ICQButtonSpecification

- (_ICQButtonSpecification)initWithServerDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(_ICQButtonSpecification *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverDict, a3);
    v8 = [v5 objectForKeyedSubscript:@"mesg"];
    uint64_t v9 = _ICQStringForKey(v8, @"format");
    buttonFormat = v7->_buttonFormat;
    v7->_buttonFormat = (NSString *)v9;

    v11 = _ICQArrayForKey(v8, @"detailedFormat");
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 objectAtIndex:0];
      textFormat = v7->_textFormat;
      v7->_textFormat = (NSString *)v13;

      uint64_t v15 = [v12 objectAtIndex:1];
      linkFormat = v7->_linkFormat;
      v7->_linkFormat = (NSString *)v15;
    }
    else
    {
      v17 = v7->_buttonFormat;
      linkFormat = v7->_textFormat;
      v7->_textFormat = v17;
    }

    v18 = _ICQGetLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v7->_textFormat;
      v20 = v7->_linkFormat;
      int v24 = 138412546;
      v25 = v19;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, "format array \"%@\" \"%@\"", (uint8_t *)&v24, 0x16u);
    }

    uint64_t v21 = _ICQLinkButtonForServerMessage(v8, 2);
    buttonLink = v7->_buttonLink;
    v7->_buttonLink = (ICQLink *)v21;
  }
  return v7;
}

- (ICQLink)buttonLink
{
  if (self->_serverDict)
  {
    v3 = self->_buttonLink;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v4 bundleIdentifier];
    v3 = [(_ICQButtonSpecification *)self linkForBundleIdentifier:v5];
  }
  return v3;
}

- (id)linkForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (self->_serverDict)
  {
    id v5 = [(_ICQButtonSpecification *)self buttonLink];
  }
  else
  {
    v6 = [(_ICQButtonSpecification *)self linkForBundleIdentifier];
    id v5 = [v6 objectForKeyedSubscript:v4];
  }
  return v5;
}

- (NSString)buttonFormat
{
  return self->_buttonFormat;
}

- (NSString)textFormat
{
  return self->_textFormat;
}

- (NSString)linkFormat
{
  return self->_linkFormat;
}

- (NSDictionary)linkForBundleIdentifier
{
  return self->_linkForBundleIdentifier;
}

- (void)setLinkForBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkForBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_linkFormat, 0);
  objc_storeStrong((id *)&self->_textFormat, 0);
  objc_storeStrong((id *)&self->_buttonFormat, 0);
  objc_storeStrong((id *)&self->_buttonLink, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

+ (id)buttonSpecificationSampleForLevel:(int64_t)a3
{
  if (a3 == 3)
  {
    if (_ButtonSpecificationSampleForFullLevel_onceToken != -1) {
      dispatch_once(&_ButtonSpecificationSampleForFullLevel_onceToken, &__block_literal_global_14_0);
    }
    v3 = &_ButtonSpecificationSampleForFullLevel_sButtonSpecification;
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    if (_ButtonSpecificationSampleForAlmostFullLevel_onceToken != -1) {
      dispatch_once(&_ButtonSpecificationSampleForAlmostFullLevel_onceToken, &__block_literal_global_19);
    }
    v3 = &_ButtonSpecificationSampleForAlmostFullLevel_sButtonSpecification;
LABEL_9:
    id v4 = (id)*v3;
    goto LABEL_11;
  }
  id v4 = 0;
LABEL_11:
  return v4;
}

@end