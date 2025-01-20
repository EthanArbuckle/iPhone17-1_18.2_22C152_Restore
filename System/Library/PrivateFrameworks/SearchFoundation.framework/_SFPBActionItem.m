@interface _SFPBActionItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isITunes;
- (BOOL)isOverlay;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresLocalMedia;
- (BOOL)shouldSearchDirectionsAlongCurrentRoute;
- (NSArray)storeIdentifiers;
- (NSData)jsonData;
- (NSData)mapsData;
- (NSString)applicationBundleIdentifier;
- (NSString)contactIdentifier;
- (NSString)email;
- (NSString)interactionContentType;
- (NSString)label;
- (NSString)labelForLocalMedia;
- (NSString)labelITunes;
- (NSString)localMediaIdentifier;
- (NSString)messageIdentifier;
- (NSString)offerType;
- (NSString)persistentID;
- (NSString)phoneNumber;
- (NSString)provider;
- (NSString)type;
- (NSString)universalLibraryID;
- (_SFPBActionItem)initWithDictionary:(id)a3;
- (_SFPBActionItem)initWithFacade:(id)a3;
- (_SFPBActionItem)initWithJSON:(id)a3;
- (_SFPBGraphicalFloat)latitude;
- (_SFPBGraphicalFloat)longitude;
- (_SFPBImage)baseIcon;
- (_SFPBImage)icon;
- (_SFPBLatLng)location;
- (_SFPBPunchout)customDirectionsPunchout;
- (_SFPBPunchout)punchout;
- (_SFPBURL)messageURL;
- (id)dictionaryRepresentation;
- (id)storeIdentifiersAtIndex:(unint64_t)a3;
- (int)directionsMode;
- (int)mediaEntityType;
- (unint64_t)hash;
- (unint64_t)storeIdentifiersCount;
- (void)addStoreIdentifiers:(id)a3;
- (void)clearStoreIdentifiers;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setBaseIcon:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setCustomDirectionsPunchout:(id)a3;
- (void)setDirectionsMode:(int)a3;
- (void)setEmail:(id)a3;
- (void)setIcon:(id)a3;
- (void)setInteractionContentType:(id)a3;
- (void)setIsITunes:(BOOL)a3;
- (void)setIsOverlay:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLabelForLocalMedia:(id)a3;
- (void)setLabelITunes:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLocalMediaIdentifier:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapsData:(id)a3;
- (void)setMediaEntityType:(int)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setMessageURL:(id)a3;
- (void)setOfferType:(id)a3;
- (void)setPersistentID:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setProvider:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setRequiresLocalMedia:(BOOL)a3;
- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3;
- (void)setStoreIdentifiers:(id)a3;
- (void)setType:(id)a3;
- (void)setUniversalLibraryID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBActionItem

- (_SFPBActionItem)initWithFacade:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBActionItem *)self init];

  if (v5)
  {
    v6 = [v4 label];

    if (v6)
    {
      v7 = [v4 label];
      [(_SFPBActionItem *)v5 setLabel:v7];
    }
    v8 = [v4 labelForLocalMedia];

    if (v8)
    {
      v9 = [v4 labelForLocalMedia];
      [(_SFPBActionItem *)v5 setLabelForLocalMedia:v9];
    }
    if ([v4 hasIsOverlay]) {
      -[_SFPBActionItem setIsOverlay:](v5, "setIsOverlay:", [v4 isOverlay]);
    }
    v10 = [v4 storeIdentifiers];
    if (v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v11 = 0;
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v12 = objc_msgSend(v4, "storeIdentifiers", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v76 objects:v80 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v77 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(id *)(*((void *)&v76 + 1) + 8 * i);
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v76 objects:v80 count:16];
      }
      while (v14);
    }

    [(_SFPBActionItem *)v5 setStoreIdentifiers:v11];
    if ([v4 hasRequiresLocalMedia]) {
      -[_SFPBActionItem setRequiresLocalMedia:](v5, "setRequiresLocalMedia:", [v4 requiresLocalMedia]);
    }
    v18 = [v4 localMediaIdentifier];

    if (v18)
    {
      v19 = [v4 localMediaIdentifier];
      [(_SFPBActionItem *)v5 setLocalMediaIdentifier:v19];
    }
    v20 = [v4 punchout];

    if (v20)
    {
      v21 = [_SFPBPunchout alloc];
      v22 = [v4 punchout];
      v23 = [(_SFPBPunchout *)v21 initWithFacade:v22];
      [(_SFPBActionItem *)v5 setPunchout:v23];
    }
    v24 = [v4 applicationBundleIdentifier];

    if (v24)
    {
      v25 = [v4 applicationBundleIdentifier];
      [(_SFPBActionItem *)v5 setApplicationBundleIdentifier:v25];
    }
    v26 = [v4 contactIdentifier];

    if (v26)
    {
      v27 = [v4 contactIdentifier];
      [(_SFPBActionItem *)v5 setContactIdentifier:v27];
    }
    v28 = [v4 phoneNumber];

    if (v28)
    {
      v29 = [v4 phoneNumber];
      [(_SFPBActionItem *)v5 setPhoneNumber:v29];
    }
    v30 = [v4 email];

    if (v30)
    {
      v31 = [v4 email];
      [(_SFPBActionItem *)v5 setEmail:v31];
    }
    v32 = [v4 mapsData];

    if (v32)
    {
      v33 = [v4 mapsData];
      [(_SFPBActionItem *)v5 setMapsData:v33];
    }
    if ([v4 hasLatitude])
    {
      v34 = [_SFPBGraphicalFloat alloc];
      [v4 latitude];
      v35 = -[_SFPBGraphicalFloat initWithCGFloat:](v34, "initWithCGFloat:");
      [(_SFPBActionItem *)v5 setLatitude:v35];
    }
    if ([v4 hasLongitude])
    {
      v36 = [_SFPBGraphicalFloat alloc];
      [v4 longitude];
      v37 = -[_SFPBGraphicalFloat initWithCGFloat:](v36, "initWithCGFloat:");
      [(_SFPBActionItem *)v5 setLongitude:v37];
    }
    v38 = [v4 provider];

    if (v38)
    {
      v39 = [v4 provider];
      [(_SFPBActionItem *)v5 setProvider:v39];
    }
    v40 = [v4 offerType];

    if (v40)
    {
      v41 = [v4 offerType];
      [(_SFPBActionItem *)v5 setOfferType:v41];
    }
    v42 = [v4 type];

    if (v42)
    {
      v43 = [v4 type];
      [(_SFPBActionItem *)v5 setType:v43];
    }
    v44 = [v4 labelITunes];

    if (v44)
    {
      v45 = [v4 labelITunes];
      [(_SFPBActionItem *)v5 setLabelITunes:v45];
    }
    if ([v4 hasIsITunes]) {
      -[_SFPBActionItem setIsITunes:](v5, "setIsITunes:", [v4 isITunes]);
    }
    v46 = [v4 icon];

    if (v46)
    {
      v47 = [_SFPBImage alloc];
      v48 = [v4 icon];
      v49 = [(_SFPBImage *)v47 initWithFacade:v48];
      [(_SFPBActionItem *)v5 setIcon:v49];
    }
    v50 = [v4 baseIcon];

    if (v50)
    {
      v51 = [_SFPBImage alloc];
      v52 = [v4 baseIcon];
      v53 = [(_SFPBImage *)v51 initWithFacade:v52];
      [(_SFPBActionItem *)v5 setBaseIcon:v53];
    }
    v54 = [v4 location];

    if (v54)
    {
      v55 = [_SFPBLatLng alloc];
      v56 = [v4 location];
      v57 = [(_SFPBLatLng *)v55 initWithFacade:v56];
      [(_SFPBActionItem *)v5 setLocation:v57];
    }
    v58 = [v4 messageIdentifier];

    if (v58)
    {
      v59 = [v4 messageIdentifier];
      [(_SFPBActionItem *)v5 setMessageIdentifier:v59];
    }
    v60 = [v4 messageURL];

    if (v60)
    {
      v61 = [_SFPBURL alloc];
      v62 = [v4 messageURL];
      v63 = [(_SFPBURL *)v61 initWithNSURL:v62];
      [(_SFPBActionItem *)v5 setMessageURL:v63];
    }
    v64 = [v4 persistentID];

    if (v64)
    {
      v65 = [v4 persistentID];
      [(_SFPBActionItem *)v5 setPersistentID:v65];
    }
    if ([v4 hasMediaEntityType]) {
      -[_SFPBActionItem setMediaEntityType:](v5, "setMediaEntityType:", [v4 mediaEntityType]);
    }
    v66 = [v4 universalLibraryID];

    if (v66)
    {
      v67 = [v4 universalLibraryID];
      [(_SFPBActionItem *)v5 setUniversalLibraryID:v67];
    }
    v68 = [v4 interactionContentType];

    if (v68)
    {
      v69 = [v4 interactionContentType];
      [(_SFPBActionItem *)v5 setInteractionContentType:v69];
    }
    v70 = [v4 customDirectionsPunchout];

    if (v70)
    {
      v71 = [_SFPBPunchout alloc];
      v72 = [v4 customDirectionsPunchout];
      v73 = [(_SFPBPunchout *)v71 initWithFacade:v72];
      [(_SFPBActionItem *)v5 setCustomDirectionsPunchout:v73];
    }
    if ([v4 hasShouldSearchDirectionsAlongCurrentRoute]) {
      -[_SFPBActionItem setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", [v4 shouldSearchDirectionsAlongCurrentRoute]);
    }
    if ([v4 hasDirectionsMode]) {
      -[_SFPBActionItem setDirectionsMode:](v5, "setDirectionsMode:", [v4 directionsMode]);
    }
    v74 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDirectionsPunchout, 0);
  objc_storeStrong((id *)&self->_interactionContentType, 0);
  objc_storeStrong((id *)&self->_universalLibraryID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_messageURL, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_baseIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_labelITunes, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_offerType, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_localMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifiers, 0);
  objc_storeStrong((id *)&self->_labelForLocalMedia, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (int)directionsMode
{
  return self->_directionsMode;
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (_SFPBPunchout)customDirectionsPunchout
{
  return self->_customDirectionsPunchout;
}

- (NSString)interactionContentType
{
  return self->_interactionContentType;
}

- (NSString)universalLibraryID
{
  return self->_universalLibraryID;
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (_SFPBURL)messageURL
{
  return self->_messageURL;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (_SFPBImage)baseIcon
{
  return self->_baseIcon;
}

- (_SFPBImage)icon
{
  return self->_icon;
}

- (BOOL)isITunes
{
  return self->_isITunes;
}

- (NSString)labelITunes
{
  return self->_labelITunes;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)offerType
{
  return self->_offerType;
}

- (NSString)provider
{
  return self->_provider;
}

- (_SFPBGraphicalFloat)longitude
{
  return self->_longitude;
}

- (_SFPBGraphicalFloat)latitude
{
  return self->_latitude;
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (_SFPBPunchout)punchout
{
  return self->_punchout;
}

- (NSString)localMediaIdentifier
{
  return self->_localMediaIdentifier;
}

- (BOOL)requiresLocalMedia
{
  return self->_requiresLocalMedia;
}

- (NSArray)storeIdentifiers
{
  return self->_storeIdentifiers;
}

- (BOOL)isOverlay
{
  return self->_isOverlay;
}

- (NSString)labelForLocalMedia
{
  return self->_labelForLocalMedia;
}

- (NSString)label
{
  return self->_label;
}

- (_SFPBActionItem)initWithDictionary:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)_SFPBActionItem;
  v5 = [(_SFPBActionItem *)&v97 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBActionItem *)v5 setLabel:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"labelForLocalMedia"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBActionItem *)v5 setLabelForLocalMedia:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isOverlay"];
    objc_opt_class();
    v92 = v10;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBActionItem setIsOverlay:](v5, "setIsOverlay:", [v10 BOOLValue]);
    }
    long long v78 = v8;
    id v11 = [v4 objectForKeyedSubscript:@"storeIdentifiers"];
    objc_opt_class();
    v91 = v11;
    if (objc_opt_isKindOfClass())
    {
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v93 objects:v98 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v94;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v94 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v93 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = (void *)[v17 copy];
              [(_SFPBActionItem *)v5 addStoreIdentifiers:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v93 objects:v98 count:16];
        }
        while (v14);
      }
    }
    v19 = [v4 objectForKeyedSubscript:@"requiresLocalMedia"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBActionItem setRequiresLocalMedia:](v5, "setRequiresLocalMedia:", [v19 BOOLValue]);
    }
    long long v77 = v19;
    long long v79 = v6;
    v20 = [v4 objectForKeyedSubscript:@"localMediaIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = (void *)[v20 copy];
      [(_SFPBActionItem *)v5 setLocalMediaIdentifier:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"punchout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [[_SFPBPunchout alloc] initWithDictionary:v22];
      [(_SFPBActionItem *)v5 setPunchout:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"applicationBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(_SFPBActionItem *)v5 setApplicationBundleIdentifier:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"contactIdentifier"];
    objc_opt_class();
    v90 = v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBActionItem *)v5 setContactIdentifier:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"phoneNumber"];
    objc_opt_class();
    v89 = v28;
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(_SFPBActionItem *)v5 setPhoneNumber:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"email"];
    objc_opt_class();
    v88 = v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = (void *)[v30 copy];
      [(_SFPBActionItem *)v5 setEmail:v31];
    }
    long long v76 = v20;
    uint64_t v32 = [v4 objectForKeyedSubscript:@"mapsData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v32 options:0];
      [(_SFPBActionItem *)v5 setMapsData:v33];
    }
    v74 = (void *)v32;
    uint64_t v34 = [v4 objectForKeyedSubscript:@"latitude"];
    objc_opt_class();
    v87 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v34];
      [(_SFPBActionItem *)v5 setLatitude:v35];
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"longitude"];
    objc_opt_class();
    v86 = (void *)v36;
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v36];
      [(_SFPBActionItem *)v5 setLongitude:v37];
    }
    v38 = [v4 objectForKeyedSubscript:@"provider"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = (void *)[v38 copy];
      [(_SFPBActionItem *)v5 setProvider:v39];
    }
    v40 = [v4 objectForKeyedSubscript:@"offerType"];
    objc_opt_class();
    v85 = v40;
    if (objc_opt_isKindOfClass())
    {
      v41 = (void *)[v40 copy];
      [(_SFPBActionItem *)v5 setOfferType:v41];
    }
    v42 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v84 = v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = (void *)[v42 copy];
      [(_SFPBActionItem *)v5 setType:v43];
    }
    v44 = [v4 objectForKeyedSubscript:@"labelITunes"];
    objc_opt_class();
    v83 = v44;
    if (objc_opt_isKindOfClass())
    {
      v45 = (void *)[v44 copy];
      [(_SFPBActionItem *)v5 setLabelITunes:v45];
    }
    v73 = v38;
    v46 = [v4 objectForKeyedSubscript:@"isITunes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBActionItem setIsITunes:](v5, "setIsITunes:", [v46 BOOLValue]);
    }
    v72 = v46;
    uint64_t v47 = [v4 objectForKeyedSubscript:@"icon"];
    objc_opt_class();
    v82 = (void *)v47;
    if (objc_opt_isKindOfClass())
    {
      v48 = [[_SFPBImage alloc] initWithDictionary:v47];
      [(_SFPBActionItem *)v5 setIcon:v48];
    }
    uint64_t v49 = [v4 objectForKeyedSubscript:@"baseIcon"];
    objc_opt_class();
    uint64_t v81 = (void *)v49;
    if (objc_opt_isKindOfClass())
    {
      v50 = [[_SFPBImage alloc] initWithDictionary:v49];
      [(_SFPBActionItem *)v5 setBaseIcon:v50];
    }
    uint64_t v51 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = [[_SFPBLatLng alloc] initWithDictionary:v51];
      [(_SFPBActionItem *)v5 setLocation:v52];
    }
    v53 = [v4 objectForKeyedSubscript:@"messageIdentifier"];
    objc_opt_class();
    v80 = v53;
    if (objc_opt_isKindOfClass())
    {
      v54 = (void *)[v53 copy];
      [(_SFPBActionItem *)v5 setMessageIdentifier:v54];
    }
    v71 = (void *)v51;
    uint64_t v55 = [v4 objectForKeyedSubscript:@"messageURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v56 = [[_SFPBURL alloc] initWithDictionary:v55];
      [(_SFPBActionItem *)v5 setMessageURL:v56];
    }
    v57 = objc_msgSend(v4, "objectForKeyedSubscript:", @"persistentID", v55);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v58 = (void *)[v57 copy];
      [(_SFPBActionItem *)v5 setPersistentID:v58];
    }
    v75 = (void *)v22;
    v59 = [v4 objectForKeyedSubscript:@"mediaEntityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBActionItem setMediaEntityType:](v5, "setMediaEntityType:", [v59 intValue]);
    }
    v60 = [v4 objectForKeyedSubscript:@"universalLibraryID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v61 = (void *)[v60 copy];
      [(_SFPBActionItem *)v5 setUniversalLibraryID:v61];
    }
    v62 = [v4 objectForKeyedSubscript:@"interactionContentType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v63 = (void *)[v62 copy];
      [(_SFPBActionItem *)v5 setInteractionContentType:v63];
    }
    v64 = [v4 objectForKeyedSubscript:@"customDirectionsPunchout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v65 = [[_SFPBPunchout alloc] initWithDictionary:v64];
      [(_SFPBActionItem *)v5 setCustomDirectionsPunchout:v65];
    }
    v66 = [v4 objectForKeyedSubscript:@"shouldSearchDirectionsAlongCurrentRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBActionItem setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", [v66 BOOLValue]);
    }
    v67 = [v4 objectForKeyedSubscript:@"directionsMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBActionItem setDirectionsMode:](v5, "setDirectionsMode:", [v67 intValue]);
    }
    v68 = v5;
  }
  return v5;
}

- (_SFPBActionItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBActionItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBActionItem *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_applicationBundleIdentifier)
  {
    id v4 = [(_SFPBActionItem *)self applicationBundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  if (self->_baseIcon)
  {
    v6 = [(_SFPBActionItem *)self baseIcon];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"baseIcon"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"baseIcon"];
    }
  }
  if (self->_contactIdentifier)
  {
    v9 = [(_SFPBActionItem *)self contactIdentifier];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"contactIdentifier"];
  }
  if (self->_customDirectionsPunchout)
  {
    id v11 = [(_SFPBActionItem *)self customDirectionsPunchout];
    id v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"customDirectionsPunchout"];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"customDirectionsPunchout"];
    }
  }
  if (self->_directionsMode)
  {
    uint64_t v14 = [(_SFPBActionItem *)self directionsMode];
    if (v14 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = off_1E5A2F090[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"directionsMode"];
  }
  if (self->_email)
  {
    v16 = [(_SFPBActionItem *)self email];
    id v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"email"];
  }
  if (self->_icon)
  {
    v18 = [(_SFPBActionItem *)self icon];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"icon"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"icon"];
    }
  }
  if (self->_interactionContentType)
  {
    v21 = [(_SFPBActionItem *)self interactionContentType];
    uint64_t v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"interactionContentType"];
  }
  if (self->_isITunes)
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBActionItem isITunes](self, "isITunes"));
    [v3 setObject:v23 forKeyedSubscript:@"isITunes"];
  }
  if (self->_isOverlay)
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBActionItem isOverlay](self, "isOverlay"));
    [v3 setObject:v24 forKeyedSubscript:@"isOverlay"];
  }
  if (self->_label)
  {
    v25 = [(_SFPBActionItem *)self label];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"label"];
  }
  if (self->_labelForLocalMedia)
  {
    v27 = [(_SFPBActionItem *)self labelForLocalMedia];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"labelForLocalMedia"];
  }
  if (self->_labelITunes)
  {
    v29 = [(_SFPBActionItem *)self labelITunes];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"labelITunes"];
  }
  if (self->_latitude)
  {
    v31 = [(_SFPBActionItem *)self latitude];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"latitude"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"latitude"];
    }
  }
  if (self->_localMediaIdentifier)
  {
    uint64_t v34 = [(_SFPBActionItem *)self localMediaIdentifier];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"localMediaIdentifier"];
  }
  if (self->_location)
  {
    uint64_t v36 = [(_SFPBActionItem *)self location];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"location"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"location"];
    }
  }
  if (self->_longitude)
  {
    v39 = [(_SFPBActionItem *)self longitude];
    v40 = [v39 dictionaryRepresentation];
    if (v40)
    {
      [v3 setObject:v40 forKeyedSubscript:@"longitude"];
    }
    else
    {
      v41 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v41 forKeyedSubscript:@"longitude"];
    }
  }
  if (self->_mapsData)
  {
    v42 = [(_SFPBActionItem *)self mapsData];
    v43 = [v42 base64EncodedStringWithOptions:0];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"mapsData"];
    }
    else
    {
      v44 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v44 forKeyedSubscript:@"mapsData"];
    }
  }
  if (self->_mediaEntityType)
  {
    uint64_t v45 = [(_SFPBActionItem *)self mediaEntityType];
    if (v45 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v45);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = off_1E5A2EFD8[v45];
    }
    [v3 setObject:v46 forKeyedSubscript:@"mediaEntityType"];
  }
  if (self->_messageIdentifier)
  {
    uint64_t v47 = [(_SFPBActionItem *)self messageIdentifier];
    v48 = (void *)[v47 copy];
    [v3 setObject:v48 forKeyedSubscript:@"messageIdentifier"];
  }
  if (self->_messageURL)
  {
    uint64_t v49 = [(_SFPBActionItem *)self messageURL];
    v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"messageURL"];
    }
    else
    {
      uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"messageURL"];
    }
  }
  if (self->_offerType)
  {
    v52 = [(_SFPBActionItem *)self offerType];
    v53 = (void *)[v52 copy];
    [v3 setObject:v53 forKeyedSubscript:@"offerType"];
  }
  if (self->_persistentID)
  {
    v54 = [(_SFPBActionItem *)self persistentID];
    uint64_t v55 = (void *)[v54 copy];
    [v3 setObject:v55 forKeyedSubscript:@"persistentID"];
  }
  if (self->_phoneNumber)
  {
    v56 = [(_SFPBActionItem *)self phoneNumber];
    v57 = (void *)[v56 copy];
    [v3 setObject:v57 forKeyedSubscript:@"phoneNumber"];
  }
  if (self->_provider)
  {
    v58 = [(_SFPBActionItem *)self provider];
    v59 = (void *)[v58 copy];
    [v3 setObject:v59 forKeyedSubscript:@"provider"];
  }
  if (self->_punchout)
  {
    v60 = [(_SFPBActionItem *)self punchout];
    v61 = [v60 dictionaryRepresentation];
    if (v61)
    {
      [v3 setObject:v61 forKeyedSubscript:@"punchout"];
    }
    else
    {
      v62 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v62 forKeyedSubscript:@"punchout"];
    }
  }
  if (self->_requiresLocalMedia)
  {
    v63 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBActionItem requiresLocalMedia](self, "requiresLocalMedia"));
    [v3 setObject:v63 forKeyedSubscript:@"requiresLocalMedia"];
  }
  if (self->_shouldSearchDirectionsAlongCurrentRoute)
  {
    v64 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBActionItem shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
    [v3 setObject:v64 forKeyedSubscript:@"shouldSearchDirectionsAlongCurrentRoute"];
  }
  if (self->_storeIdentifiers)
  {
    v65 = [(_SFPBActionItem *)self storeIdentifiers];
    v66 = (void *)[v65 copy];
    [v3 setObject:v66 forKeyedSubscript:@"storeIdentifiers"];
  }
  if (self->_type)
  {
    v67 = [(_SFPBActionItem *)self type];
    v68 = (void *)[v67 copy];
    [v3 setObject:v68 forKeyedSubscript:@"type"];
  }
  if (self->_universalLibraryID)
  {
    v69 = [(_SFPBActionItem *)self universalLibraryID];
    v70 = (void *)[v69 copy];
    [v3 setObject:v70 forKeyedSubscript:@"universalLibraryID"];
  }
  id v71 = v3;

  return v71;
}

- (unint64_t)hash
{
  NSUInteger v39 = [(NSString *)self->_label hash];
  NSUInteger v3 = [(NSString *)self->_labelForLocalMedia hash];
  if (self->_isOverlay) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v37 = v4;
  NSUInteger v38 = v3;
  uint64_t v5 = [(NSArray *)self->_storeIdentifiers hash];
  if (self->_requiresLocalMedia) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v35 = v6;
  uint64_t v36 = v5;
  NSUInteger v34 = [(NSString *)self->_localMediaIdentifier hash];
  unint64_t v33 = [(_SFPBPunchout *)self->_punchout hash];
  NSUInteger v32 = [(NSString *)self->_applicationBundleIdentifier hash];
  NSUInteger v31 = [(NSString *)self->_contactIdentifier hash];
  NSUInteger v30 = [(NSString *)self->_phoneNumber hash];
  NSUInteger v29 = [(NSString *)self->_email hash];
  uint64_t v28 = [(NSData *)self->_mapsData hash];
  unint64_t v27 = [(_SFPBGraphicalFloat *)self->_latitude hash];
  unint64_t v26 = [(_SFPBGraphicalFloat *)self->_longitude hash];
  NSUInteger v25 = [(NSString *)self->_provider hash];
  NSUInteger v24 = [(NSString *)self->_offerType hash];
  NSUInteger v23 = [(NSString *)self->_type hash];
  NSUInteger v7 = [(NSString *)self->_labelITunes hash];
  if (self->_isITunes) {
    uint64_t v8 = 2654435761;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(_SFPBImage *)self->_icon hash];
  unint64_t v10 = [(_SFPBImage *)self->_baseIcon hash];
  unint64_t v11 = [(_SFPBLatLng *)self->_location hash];
  NSUInteger v12 = [(NSString *)self->_messageIdentifier hash];
  unint64_t v13 = [(_SFPBURL *)self->_messageURL hash];
  NSUInteger v14 = [(NSString *)self->_persistentID hash];
  uint64_t v15 = 2654435761 * self->_mediaEntityType;
  NSUInteger v16 = [(NSString *)self->_universalLibraryID hash];
  NSUInteger v17 = [(NSString *)self->_interactionContentType hash];
  unint64_t v18 = [(_SFPBPunchout *)self->_customDirectionsPunchout hash];
  uint64_t v19 = 2654435761;
  if (!self->_shouldSearchDirectionsAlongCurrentRoute) {
    uint64_t v19 = 0;
  }
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ (2654435761 * self->_directionsMode);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_131;
  }
  uint64_t v5 = [(_SFPBActionItem *)self label];
  uint64_t v6 = [v4 label];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v7 = [(_SFPBActionItem *)self label];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBActionItem *)self label];
    unint64_t v10 = [v4 label];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self labelForLocalMedia];
  uint64_t v6 = [v4 labelForLocalMedia];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v12 = [(_SFPBActionItem *)self labelForLocalMedia];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    NSUInteger v14 = [(_SFPBActionItem *)self labelForLocalMedia];
    uint64_t v15 = [v4 labelForLocalMedia];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  int isOverlay = self->_isOverlay;
  if (isOverlay != [v4 isOverlay]) {
    goto LABEL_131;
  }
  uint64_t v5 = [(_SFPBActionItem *)self storeIdentifiers];
  uint64_t v6 = [v4 storeIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v18 = [(_SFPBActionItem *)self storeIdentifiers];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    v20 = [(_SFPBActionItem *)self storeIdentifiers];
    uint64_t v21 = [v4 storeIdentifiers];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  int requiresLocalMedia = self->_requiresLocalMedia;
  if (requiresLocalMedia != [v4 requiresLocalMedia]) {
    goto LABEL_131;
  }
  uint64_t v5 = [(_SFPBActionItem *)self localMediaIdentifier];
  uint64_t v6 = [v4 localMediaIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v24 = [(_SFPBActionItem *)self localMediaIdentifier];
  if (v24)
  {
    NSUInteger v25 = (void *)v24;
    unint64_t v26 = [(_SFPBActionItem *)self localMediaIdentifier];
    unint64_t v27 = [v4 localMediaIdentifier];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self punchout];
  uint64_t v6 = [v4 punchout];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v29 = [(_SFPBActionItem *)self punchout];
  if (v29)
  {
    NSUInteger v30 = (void *)v29;
    NSUInteger v31 = [(_SFPBActionItem *)self punchout];
    NSUInteger v32 = [v4 punchout];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self applicationBundleIdentifier];
  uint64_t v6 = [v4 applicationBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v34 = [(_SFPBActionItem *)self applicationBundleIdentifier];
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    uint64_t v36 = [(_SFPBActionItem *)self applicationBundleIdentifier];
    uint64_t v37 = [v4 applicationBundleIdentifier];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self contactIdentifier];
  uint64_t v6 = [v4 contactIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v39 = [(_SFPBActionItem *)self contactIdentifier];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [(_SFPBActionItem *)self contactIdentifier];
    v42 = [v4 contactIdentifier];
    int v43 = [v41 isEqual:v42];

    if (!v43) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self phoneNumber];
  uint64_t v6 = [v4 phoneNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v44 = [(_SFPBActionItem *)self phoneNumber];
  if (v44)
  {
    uint64_t v45 = (void *)v44;
    v46 = [(_SFPBActionItem *)self phoneNumber];
    uint64_t v47 = [v4 phoneNumber];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self email];
  uint64_t v6 = [v4 email];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v49 = [(_SFPBActionItem *)self email];
  if (v49)
  {
    v50 = (void *)v49;
    uint64_t v51 = [(_SFPBActionItem *)self email];
    v52 = [v4 email];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self mapsData];
  uint64_t v6 = [v4 mapsData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v54 = [(_SFPBActionItem *)self mapsData];
  if (v54)
  {
    uint64_t v55 = (void *)v54;
    v56 = [(_SFPBActionItem *)self mapsData];
    v57 = [v4 mapsData];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self latitude];
  uint64_t v6 = [v4 latitude];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v59 = [(_SFPBActionItem *)self latitude];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [(_SFPBActionItem *)self latitude];
    v62 = [v4 latitude];
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self longitude];
  uint64_t v6 = [v4 longitude];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v64 = [(_SFPBActionItem *)self longitude];
  if (v64)
  {
    v65 = (void *)v64;
    v66 = [(_SFPBActionItem *)self longitude];
    v67 = [v4 longitude];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self provider];
  uint64_t v6 = [v4 provider];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v69 = [(_SFPBActionItem *)self provider];
  if (v69)
  {
    v70 = (void *)v69;
    id v71 = [(_SFPBActionItem *)self provider];
    v72 = [v4 provider];
    int v73 = [v71 isEqual:v72];

    if (!v73) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self offerType];
  uint64_t v6 = [v4 offerType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v74 = [(_SFPBActionItem *)self offerType];
  if (v74)
  {
    v75 = (void *)v74;
    long long v76 = [(_SFPBActionItem *)self offerType];
    long long v77 = [v4 offerType];
    int v78 = [v76 isEqual:v77];

    if (!v78) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v79 = [(_SFPBActionItem *)self type];
  if (v79)
  {
    v80 = (void *)v79;
    uint64_t v81 = [(_SFPBActionItem *)self type];
    v82 = [v4 type];
    int v83 = [v81 isEqual:v82];

    if (!v83) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self labelITunes];
  uint64_t v6 = [v4 labelITunes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v84 = [(_SFPBActionItem *)self labelITunes];
  if (v84)
  {
    v85 = (void *)v84;
    v86 = [(_SFPBActionItem *)self labelITunes];
    v87 = [v4 labelITunes];
    int v88 = [v86 isEqual:v87];

    if (!v88) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  int isITunes = self->_isITunes;
  if (isITunes != [v4 isITunes]) {
    goto LABEL_131;
  }
  uint64_t v5 = [(_SFPBActionItem *)self icon];
  uint64_t v6 = [v4 icon];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v90 = [(_SFPBActionItem *)self icon];
  if (v90)
  {
    v91 = (void *)v90;
    v92 = [(_SFPBActionItem *)self icon];
    long long v93 = [v4 icon];
    int v94 = [v92 isEqual:v93];

    if (!v94) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self baseIcon];
  uint64_t v6 = [v4 baseIcon];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v95 = [(_SFPBActionItem *)self baseIcon];
  if (v95)
  {
    long long v96 = (void *)v95;
    objc_super v97 = [(_SFPBActionItem *)self baseIcon];
    v98 = [v4 baseIcon];
    int v99 = [v97 isEqual:v98];

    if (!v99) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self location];
  uint64_t v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v100 = [(_SFPBActionItem *)self location];
  if (v100)
  {
    v101 = (void *)v100;
    v102 = [(_SFPBActionItem *)self location];
    v103 = [v4 location];
    int v104 = [v102 isEqual:v103];

    if (!v104) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self messageIdentifier];
  uint64_t v6 = [v4 messageIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v105 = [(_SFPBActionItem *)self messageIdentifier];
  if (v105)
  {
    v106 = (void *)v105;
    v107 = [(_SFPBActionItem *)self messageIdentifier];
    v108 = [v4 messageIdentifier];
    int v109 = [v107 isEqual:v108];

    if (!v109) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self messageURL];
  uint64_t v6 = [v4 messageURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v110 = [(_SFPBActionItem *)self messageURL];
  if (v110)
  {
    v111 = (void *)v110;
    v112 = [(_SFPBActionItem *)self messageURL];
    v113 = [v4 messageURL];
    int v114 = [v112 isEqual:v113];

    if (!v114) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self persistentID];
  uint64_t v6 = [v4 persistentID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v115 = [(_SFPBActionItem *)self persistentID];
  if (v115)
  {
    v116 = (void *)v115;
    v117 = [(_SFPBActionItem *)self persistentID];
    v118 = [v4 persistentID];
    int v119 = [v117 isEqual:v118];

    if (!v119) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  int mediaEntityType = self->_mediaEntityType;
  if (mediaEntityType != [v4 mediaEntityType]) {
    goto LABEL_131;
  }
  uint64_t v5 = [(_SFPBActionItem *)self universalLibraryID];
  uint64_t v6 = [v4 universalLibraryID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v121 = [(_SFPBActionItem *)self universalLibraryID];
  if (v121)
  {
    v122 = (void *)v121;
    v123 = [(_SFPBActionItem *)self universalLibraryID];
    v124 = [v4 universalLibraryID];
    int v125 = [v123 isEqual:v124];

    if (!v125) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self interactionContentType];
  uint64_t v6 = [v4 interactionContentType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v126 = [(_SFPBActionItem *)self interactionContentType];
  if (v126)
  {
    v127 = (void *)v126;
    v128 = [(_SFPBActionItem *)self interactionContentType];
    v129 = [v4 interactionContentType];
    int v130 = [v128 isEqual:v129];

    if (!v130) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBActionItem *)self customDirectionsPunchout];
  uint64_t v6 = [v4 customDirectionsPunchout];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_130:

    goto LABEL_131;
  }
  uint64_t v131 = [(_SFPBActionItem *)self customDirectionsPunchout];
  if (v131)
  {
    v132 = (void *)v131;
    v133 = [(_SFPBActionItem *)self customDirectionsPunchout];
    v134 = [v4 customDirectionsPunchout];
    int v135 = [v133 isEqual:v134];

    if (!v135) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  int shouldSearchDirectionsAlongCurrentRoute = self->_shouldSearchDirectionsAlongCurrentRoute;
  if (shouldSearchDirectionsAlongCurrentRoute == [v4 shouldSearchDirectionsAlongCurrentRoute])
  {
    int directionsMode = self->_directionsMode;
    BOOL v136 = directionsMode == [v4 directionsMode];
    goto LABEL_132;
  }
LABEL_131:
  BOOL v136 = 0;
LABEL_132:

  return v136;
}

- (void)writeTo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBActionItem *)self label];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  uint64_t v6 = [(_SFPBActionItem *)self labelForLocalMedia];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBActionItem *)self isOverlay]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v7 = [(_SFPBActionItem *)self storeIdentifiers];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v9);
  }

  if ([(_SFPBActionItem *)self requiresLocalMedia]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBActionItem *)self localMediaIdentifier];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  unint64_t v13 = [(_SFPBActionItem *)self punchout];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v14 = [(_SFPBActionItem *)self applicationBundleIdentifier];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  uint64_t v15 = [(_SFPBActionItem *)self contactIdentifier];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  int v16 = [(_SFPBActionItem *)self phoneNumber];
  if (v16) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v17 = [(_SFPBActionItem *)self email];
  if (v17) {
    PBDataWriterWriteStringField();
  }

  uint64_t v18 = [(_SFPBActionItem *)self mapsData];
  if (v18) {
    PBDataWriterWriteDataField();
  }

  uint64_t v19 = [(_SFPBActionItem *)self latitude];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  v20 = [(_SFPBActionItem *)self longitude];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v21 = [(_SFPBActionItem *)self provider];
  if (v21) {
    PBDataWriterWriteStringField();
  }

  int v22 = [(_SFPBActionItem *)self offerType];
  if (v22) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v23 = [(_SFPBActionItem *)self type];
  if (v23) {
    PBDataWriterWriteStringField();
  }

  uint64_t v24 = [(_SFPBActionItem *)self labelITunes];
  if (v24) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBActionItem *)self isITunes]) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v25 = [(_SFPBActionItem *)self icon];
  if (v25) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v26 = [(_SFPBActionItem *)self baseIcon];
  if (v26) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v27 = [(_SFPBActionItem *)self location];
  if (v27) {
    PBDataWriterWriteSubmessage();
  }

  int v28 = [(_SFPBActionItem *)self messageIdentifier];
  if (v28) {
    PBDataWriterWriteStringField();
  }

  uint64_t v29 = [(_SFPBActionItem *)self messageURL];
  if (v29) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v30 = [(_SFPBActionItem *)self persistentID];
  if (v30) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBActionItem *)self mediaEntityType]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v31 = [(_SFPBActionItem *)self universalLibraryID];
  if (v31) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v32 = [(_SFPBActionItem *)self interactionContentType];
  if (v32) {
    PBDataWriterWriteStringField();
  }

  int v33 = [(_SFPBActionItem *)self customDirectionsPunchout];
  if (v33) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBActionItem *)self shouldSearchDirectionsAlongCurrentRoute]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBActionItem *)self directionsMode]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBActionItemReadFrom(self, (uint64_t)a3);
}

- (void)setDirectionsMode:(int)a3
{
  self->_int directionsMode = a3;
}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  self->_int shouldSearchDirectionsAlongCurrentRoute = a3;
}

- (void)setCustomDirectionsPunchout:(id)a3
{
}

- (void)setInteractionContentType:(id)a3
{
  self->_interactionContentType = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setUniversalLibraryID:(id)a3
{
  self->_universalLibraryID = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMediaEntityType:(int)a3
{
  self->_int mediaEntityType = a3;
}

- (void)setPersistentID:(id)a3
{
  self->_persistentID = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMessageURL:(id)a3
{
}

- (void)setMessageIdentifier:(id)a3
{
  self->_messageIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLocation:(id)a3
{
}

- (void)setBaseIcon:(id)a3
{
}

- (void)setIcon:(id)a3
{
}

- (void)setIsITunes:(BOOL)a3
{
  self->_int isITunes = a3;
}

- (void)setLabelITunes:(id)a3
{
  self->_labelITunes = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setOfferType:(id)a3
{
  self->_offerType = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setProvider:(id)a3
{
  self->_provider = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLongitude:(id)a3
{
}

- (void)setLatitude:(id)a3
{
}

- (void)setMapsData:(id)a3
{
  self->_mapsData = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setEmail:(id)a3
{
  self->_email = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPhoneNumber:(id)a3
{
  self->_phoneNumber = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setContactIdentifier:(id)a3
{
  self->_contactIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  self->_applicationBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPunchout:(id)a3
{
}

- (void)setLocalMediaIdentifier:(id)a3
{
  self->_localMediaIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setRequiresLocalMedia:(BOOL)a3
{
  self->_int requiresLocalMedia = a3;
}

- (id)storeIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_storeIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)storeIdentifiersCount
{
  return [(NSArray *)self->_storeIdentifiers count];
}

- (void)addStoreIdentifiers:(id)a3
{
  id v4 = a3;
  storeIdentifiers = self->_storeIdentifiers;
  id v8 = v4;
  if (!storeIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_storeIdentifiers;
    self->_storeIdentifiers = v6;

    id v4 = v8;
    storeIdentifiers = self->_storeIdentifiers;
  }
  [(NSArray *)storeIdentifiers addObject:v4];
}

- (void)clearStoreIdentifiers
{
}

- (void)setStoreIdentifiers:(id)a3
{
  self->_storeIdentifiers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIsOverlay:(BOOL)a3
{
  self->_int isOverlay = a3;
}

- (void)setLabelForLocalMedia:(id)a3
{
  self->_labelForLocalMedia = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLabel:(id)a3
{
  self->_label = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end