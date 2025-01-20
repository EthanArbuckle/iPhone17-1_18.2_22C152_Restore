@interface WFPortalContext
- (NSString)userPortalURL;
- (NSString)venueInfoURL;
- (WFPortalContext)initWithCaptiveProfile:(id)a3;
- (id)portalURLForDisplay;
- (void)setUserPortalURL:(id)a3;
- (void)setVenueInfoURL:(id)a3;
@end

@implementation WFPortalContext

- (WFPortalContext)initWithCaptiveProfile:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFPortalContext;
  v5 = [(WFPortalContext *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 objectForKey:*MEMORY[0x263F30858]];
      venueInfoURL = v5->_venueInfoURL;
      v5->_venueInfoURL = (NSString *)v6;

      uint64_t v8 = [v4 objectForKey:*MEMORY[0x263F30850]];
      userPortalURL = (WFPortalContext *)v5->_userPortalURL;
      v5->_userPortalURL = (NSString *)v8;
    }
    else
    {
      v11 = WFLogForCategory(0);
      os_log_type_t v12 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v11 && os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[WFPortalContext initWithCaptiveProfile:]";
        _os_log_impl(&dword_226071000, v11, v12, "%s: nil captiveProfile", buf, 0xCu);
      }

      userPortalURL = v5;
      v5 = 0;
    }
  }
  else
  {
    userPortalURL = 0;
  }

  return v5;
}

- (id)portalURLForDisplay
{
  v3 = [(WFPortalContext *)self venueInfoURL];

  if (v3) {
    [(WFPortalContext *)self venueInfoURL];
  }
  else {
  id v4 = [(WFPortalContext *)self userPortalURL];
  }
  return v4;
}

- (NSString)venueInfoURL
{
  return self->_venueInfoURL;
}

- (void)setVenueInfoURL:(id)a3
{
}

- (NSString)userPortalURL
{
  return self->_userPortalURL;
}

- (void)setUserPortalURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPortalURL, 0);
  objc_storeStrong((id *)&self->_venueInfoURL, 0);
}

@end