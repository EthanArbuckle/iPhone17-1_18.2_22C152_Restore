@interface MSClientContext
- (MSClientContext)initWithConfigurationDictionary:(id)a3;
- (id)localizedAlertWithError:(id)a3;
- (id)localizedStringForKey:(id)a3 inTable:(id)a4;
@end

@implementation MSClientContext

- (MSClientContext)initWithConfigurationDictionary:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MSClientContext;
  v3 = [(MSClientContext *)&v11 initWithConfigurationDictionary:a3];
  if (v3)
  {
    uint64_t v4 = +[NSBundle mainBundle];
    bundle = v3->_bundle;
    v3->_bundle = (NSBundle *)v4;

    v6 = [(MSClientContext *)v3 clientInterface];
    [v6 setClientIdentifier:@"WiFi-Music"];
    v7 = +[UIColor systemBlueColor];
    [v6 setDarkKeyColor:v7];

    v8 = +[UIColor systemBlueColor];
    [v6 setLightKeyColor:v8];

    [v6 setURLBagKey:@"p2-music-searchHints" forIdentifier:SUURLBagKeySearchHints];
    [v6 setURLBagKey:@"p2-music-search" forIdentifier:SUURLBagKeySearch];
    id v9 = objc_alloc_init((Class)MSViewControllerFactory);
    [v6 setViewControllerFactory:v9];
  }
  return v3;
}

- (id)localizedStringForKey:(id)a3 inTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localizedStrings = self->_localizedStrings;
  if (!localizedStrings)
  {
    id v9 = [(MSClientContext *)self valueForConfigurationKey:SUUIConfigurationKeyLocale];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = objc_alloc((Class)NSArray);
      bundle = self->_bundle;
      v12 = SUUIBundle();
      id v13 = [v10 initWithObjects:bundle, v12, 0];

      v14 = (SUUILocalizedStringDictionary *)[objc_alloc((Class)SUUILocalizedStringDictionary) initWithLocaleName:v9 bundles:v13];
      v15 = self->_localizedStrings;
      self->_localizedStrings = v14;
    }
    localizedStrings = self->_localizedStrings;
  }
  v16 = [(SUUILocalizedStringDictionary *)localizedStrings localizedStringForKey:v6 inTable:v7];

  return v16;
}

- (id)localizedAlertWithError:(id)a3
{
  id v4 = a3;
  if (self) {
    [(MSClientContext *)self localizedStringForKey:@"GENERIC_ERROR"];
  }
  else {
  v5 = +[SUUIClientContext localizedStringForKey:@"GENERIC_ERROR" inBundles:0];
  }
  if (v5)
  {
    id v6 = objc_alloc_init((Class)UIAlertView);
    if (self) {
      [(MSClientContext *)self localizedStringForKey:@"ERROR_CANCEL_BUTTON"];
    }
    else {
    id v7 = +[SUUIClientContext localizedStringForKey:@"ERROR_CANCEL_BUTTON" inBundles:0];
    }
    [v6 addButtonWithTitle:v7];

    [v6 setCancelButtonIndex:0];
    [v6 setTitle:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStrings, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end