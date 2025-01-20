@interface WFHotspotHelperNetwork
- (NSString)bundleIdentifier;
- (NSString)label;
- (NSString)password;
- (NSString)ssid;
- (WFHotspotHelperNetwork)initWithSSID:(id)a3 bundleIdentifier:(id)a4 password:(id)a5 label:(id)a6;
- (id)description;
- (void)setBundleIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPassword:(id)a3;
- (void)setSsid:(id)a3;
@end

@implementation WFHotspotHelperNetwork

- (WFHotspotHelperNetwork)initWithSSID:(id)a3 bundleIdentifier:(id)a4 password:(id)a5 label:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WFHotspotHelperNetwork;
  v15 = [(WFHotspotHelperNetwork *)&v27 init];
  v16 = v15;
  if (!v15)
  {
    p_super = 0;
LABEL_14:

    goto LABEL_15;
  }
  p_ssid = &v15->_ssid;
  objc_storeStrong((id *)&v15->_ssid, a3);
  if (!v16->_ssid)
  {
    v25 = WFLogForCategory(0);
    os_log_type_t v26 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v25, v26, "Missing SSID for hotspot helper network", buf, 2u);
    }

    p_super = &v16->super;
    v16 = 0;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v16->_password, a5);
  if (!v16->_password)
  {
    v18 = WFLogForCategory(0);
    os_log_type_t v19 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v18 && os_log_type_enabled(v18, v19))
    {
      v20 = (const char *)*p_ssid;
      *(_DWORD *)buf = 138412290;
      v29 = v20;
      _os_log_impl(&dword_226071000, v18, v19, "Nil password for hotspot helper network ssid: %@", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)&v16->_label, a6);
  objc_storeStrong((id *)&v16->_bundleIdentifier, a4);
  if (!v16->_bundleIdentifier)
  {
    p_super = WFLogForCategory(0);
    os_log_type_t v22 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && p_super && os_log_type_enabled(p_super, v22))
    {
      v23 = *p_ssid;
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFHotspotHelperNetwork initWithSSID:bundleIdentifier:password:label:]";
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_226071000, p_super, v22, "%s: missing bundleIdentifier for %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_15:

  return v16;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFHotspotHelperNetwork *)self ssid];
  v7 = [(WFHotspotHelperNetwork *)self password];
  v8 = [(WFHotspotHelperNetwork *)self label];
  v9 = [(WFHotspotHelperNetwork *)self bundleIdentifier];
  v10 = [v3 stringWithFormat:@"<%@: SSID: %@, Password: %@, Label: %@, Identifier: %@>", v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end