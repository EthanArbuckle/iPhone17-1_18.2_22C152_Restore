@interface SDAirDropHandlerMapsLinks
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerMapsLinks)initWithTransfer:(id)a3;
- (id)candidateIdentifiers;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
@end

@implementation SDAirDropHandlerMapsLinks

- (SDAirDropHandlerMapsLinks)initWithTransfer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerMapsLinks;
  return [(SDAirDropHandler *)&v4 initWithTransfer:a3 bundleIdentifier:@"com.apple.Maps"];
}

- (id)candidateIdentifiers
{
  v3 = objc_opt_new();
  objc_super v4 = [(SDAirDropHandler *)self bundleProxy];

  if (v4)
  {
    v5 = [(SDAirDropHandler *)self bundleProxy];
    v6 = [v5 bundleIdentifier];
    [v3 addObject:v6];
  }

  return v3;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustLinks]) {
    return 0;
  }
  v3 = [(SDAirDropHandlerMapsLinks *)self candidateIdentifiers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v4 = [(SDAirDropHandler *)self transfer];
  v5 = [v4 completedURLs];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(SDAirDropHandler *)self bundleProxyFromCandidateIdentifiers:v3 handlesURL:*(void *)(*((void *)&v13 + 1) + 8 * i)];

        if (!v10)
        {
          BOOL v11 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerMapsLinks;
  return (unint64_t)[(SDAirDropHandlerGenericLinks *)&v3 transferTypes] | 0x80000000;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  v5 = [(SDAirDropHandler *)self transfer];
  id v6 = [v5 metaData];
  id v7 = [v6 itemsDescriptionAdvanced];

  if (v4 == 1
    && v7
    && ([v7 objectForKeyedSubscript:@"SFAirDropActivitySubjectMapsLinkType"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v9 = [v7 objectForKeyedSubscript:@"SFAirDropActivitySubjectMapsLinkType"];
    id v10 = [v9 integerValue];

    switch((unint64_t)v10)
    {
      case 0uLL:
        CFStringRef v42 = @"MAPS_LINK_CURRENT_LOCATION";
        BOOL v11 = +[NSNumber numberWithUnsignedInteger:1];
        v43 = v11;
        v12 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        v44 = v12;
        long long v13 = &v44;
        goto LABEL_13;
      case 1uLL:
        CFStringRef v39 = @"MAPS_LINK_DIRECTIONS";
        BOOL v11 = +[NSNumber numberWithUnsignedInteger:1];
        v40 = v11;
        v12 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        v41 = v12;
        long long v13 = &v41;
        goto LABEL_13;
      case 2uLL:
        CFStringRef v36 = @"MAPS_LINK_DROPPED_PIN";
        BOOL v11 = +[NSNumber numberWithUnsignedInteger:1];
        v37 = v11;
        v12 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v38 = v12;
        long long v13 = &v38;
        goto LABEL_13;
      case 3uLL:
        CFStringRef v33 = @"MAPS_LINK_POI";
        BOOL v11 = +[NSNumber numberWithUnsignedInteger:1];
        v34 = v11;
        v12 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v35 = v12;
        long long v13 = &v35;
LABEL_13:
        v20 = +[NSArray arrayWithObjects:v13 count:1];
        v17 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v20];

        break;
      default:
        v17 = 0;
        break;
    }
    v21 = [(SDAirDropHandler *)self transfer];
    v22 = [v21 metaData];
    v23 = [v22 itemsDescription];
    if ([v23 length])
    {
      v24 = [(SDAirDropHandler *)self transfer];
      v25 = [v24 metaData];
      v18 = [v25 itemsDescription];
    }
    else
    {
      v18 = 0;
    }

    unsigned int v26 = [(SDAirDropHandler *)self isModernProgress];
    v27 = SFLocalizedStringForKey();
    if (v26) {
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v18, v29);
    }
    else {
    v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v3, v18);
    }
  }
  else
  {
    CFStringRef v30 = @"MAPS_LINK";
    long long v14 = +[NSNumber numberWithUnsignedInteger:v4];
    v31 = v14;
    long long v15 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v32 = v15;
    long long v16 = +[NSArray arrayWithObjects:&v32 count:1];
    v17 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v16];

    LODWORD(v15) = [(SDAirDropHandler *)self isModernProgress];
    v18 = SFLocalizedStringForKey();
    if (v15) {
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v4, v29);
    }
    else {
    v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v3, v4);
    }
  }

  return v19;
}

@end