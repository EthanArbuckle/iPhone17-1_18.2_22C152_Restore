@interface SFActionItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDirectionsMode;
- (BOOL)hasIsITunes;
- (BOOL)hasIsOverlay;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasMediaEntityType;
- (BOOL)hasRequiresLocalMedia;
- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isITunes;
- (BOOL)isOverlay;
- (BOOL)requiresLocalMedia;
- (BOOL)shouldSearchDirectionsAlongCurrentRoute;
- (NSArray)storeIdentifiers;
- (NSData)jsonData;
- (NSData)mapsData;
- (NSDictionary)dictionaryRepresentation;
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
- (NSURL)messageURL;
- (SFActionItem)initWithCoder:(id)a3;
- (SFActionItem)initWithProtobuf:(id)a3;
- (SFImage)baseIcon;
- (SFImage)icon;
- (SFLatLng)location;
- (SFPunchout)customDirectionsPunchout;
- (SFPunchout)punchout;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (int)directionsMode;
- (int)mediaEntityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
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
- (void)setLatitude:(double)a3;
- (void)setLocalMediaIdentifier:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLongitude:(double)a3;
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
@end

@implementation SFActionItem

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void)setCustomDirectionsPunchout:(id)a3
{
}

- (SFPunchout)customDirectionsPunchout
{
  return self->_customDirectionsPunchout;
}

- (void)setInteractionContentType:(id)a3
{
}

- (NSString)interactionContentType
{
  return self->_interactionContentType;
}

- (void)setUniversalLibraryID:(id)a3
{
}

- (NSString)universalLibraryID
{
  return self->_universalLibraryID;
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (void)setPersistentID:(id)a3
{
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setMessageURL:(id)a3
{
}

- (NSURL)messageURL
{
  return self->_messageURL;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setLocation:(id)a3
{
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setBaseIcon:(id)a3
{
}

- (SFImage)baseIcon
{
  return self->_baseIcon;
}

- (void)setIcon:(id)a3
{
}

- (SFImage)icon
{
  return self->_icon;
}

- (BOOL)isITunes
{
  return self->_isITunes;
}

- (void)setLabelITunes:(id)a3
{
}

- (NSString)labelITunes
{
  return self->_labelITunes;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setOfferType:(id)a3
{
}

- (NSString)offerType
{
  return self->_offerType;
}

- (void)setProvider:(id)a3
{
}

- (NSString)provider
{
  return self->_provider;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setMapsData:(id)a3
{
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setPunchout:(id)a3
{
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setLocalMediaIdentifier:(id)a3
{
}

- (NSString)localMediaIdentifier
{
  return self->_localMediaIdentifier;
}

- (BOOL)requiresLocalMedia
{
  return self->_requiresLocalMedia;
}

- (void)setStoreIdentifiers:(id)a3
{
}

- (NSArray)storeIdentifiers
{
  return self->_storeIdentifiers;
}

- (BOOL)isOverlay
{
  return self->_isOverlay;
}

- (void)setLabelForLocalMedia:(id)a3
{
}

- (NSString)labelForLocalMedia
{
  return self->_labelForLocalMedia;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)hash
{
  v63 = [(SFActionItem *)self label];
  uint64_t v3 = [v63 hash];
  v62 = [(SFActionItem *)self labelForLocalMedia];
  uint64_t v4 = [v62 hash] ^ v3;
  uint64_t v5 = v4 ^ [(SFActionItem *)self isOverlay];
  v61 = [(SFActionItem *)self storeIdentifiers];
  uint64_t v6 = [v61 hash];
  uint64_t v7 = v5 ^ v6 ^ [(SFActionItem *)self requiresLocalMedia];
  v60 = [(SFActionItem *)self localMediaIdentifier];
  uint64_t v8 = [v60 hash];
  v59 = [(SFActionItem *)self punchout];
  uint64_t v9 = v8 ^ [v59 hash];
  v58 = [(SFActionItem *)self applicationBundleIdentifier];
  uint64_t v10 = v9 ^ [v58 hash];
  v57 = [(SFActionItem *)self contactIdentifier];
  uint64_t v53 = v7 ^ v10 ^ [v57 hash];
  v56 = [(SFActionItem *)self phoneNumber];
  uint64_t v11 = [v56 hash];
  v55 = [(SFActionItem *)self email];
  uint64_t v12 = v11 ^ [v55 hash];
  v54 = [(SFActionItem *)self mapsData];
  uint64_t v50 = v12 ^ [v54 hash];
  [(SFActionItem *)self latitude];
  double v14 = -v13;
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  long double v15 = round(v14);
  unint64_t v48 = (unint64_t)(fmod(v15, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v14 - v15, 0x40uLL);
  [(SFActionItem *)self longitude];
  double v17 = -v16;
  if (v16 >= 0.0) {
    double v17 = v16;
  }
  long double v18 = round(v17);
  unint64_t v46 = (unint64_t)(fmod(v18, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v17 - v18, 0x40uLL);
  v52 = [(SFActionItem *)self provider];
  uint64_t v44 = [v52 hash];
  v51 = [(SFActionItem *)self offerType];
  uint64_t v42 = [v51 hash];
  v49 = [(SFActionItem *)self type];
  uint64_t v41 = [v49 hash];
  v47 = [(SFActionItem *)self labelITunes];
  uint64_t v39 = [v47 hash];
  uint64_t v38 = [(SFActionItem *)self isITunes];
  v45 = [(SFActionItem *)self icon];
  uint64_t v36 = [v45 hash];
  v43 = [(SFActionItem *)self baseIcon];
  uint64_t v34 = [v43 hash];
  v40 = [(SFActionItem *)self location];
  uint64_t v33 = [v40 hash];
  v37 = [(SFActionItem *)self messageIdentifier];
  uint64_t v32 = [v37 hash];
  v35 = [(SFActionItem *)self messageURL];
  uint64_t v31 = [v35 hash];
  v19 = [(SFActionItem *)self persistentID];
  uint64_t v30 = [v19 hash];
  uint64_t v20 = [(SFActionItem *)self mediaEntityType];
  v21 = [(SFActionItem *)self universalLibraryID];
  uint64_t v22 = [v21 hash];
  v23 = [(SFActionItem *)self interactionContentType];
  uint64_t v24 = [v23 hash];
  v25 = [(SFActionItem *)self customDirectionsPunchout];
  uint64_t v26 = [v25 hash];
  uint64_t v27 = [(SFActionItem *)self shouldSearchDirectionsAlongCurrentRoute];
  unint64_t v28 = v53 ^ v50 ^ v44 ^ v42 ^ v48 ^ v46 ^ v41 ^ v39 ^ v38 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v20 ^ v22 ^ v24 ^ v26 ^ v27 ^ [(SFActionItem *)self directionsMode];

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFActionItem *)a3;
  if (self == v6)
  {
    BOOL v15 = 1;
    goto LABEL_150;
  }
  if (![(SFActionItem *)v6 isMemberOfClass:objc_opt_class()])
  {
    BOOL v15 = 0;
    goto LABEL_150;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(SFActionItem *)self label];
  uint64_t v9 = v8 == 0;
  id v211 = [(SFActionItem *)v7 label];
  id v212 = v8;
  int v209 = v211 != 0;
  int v210 = v9;
  if (v9 == v209)
  {
    uint64_t v208 = 0;
    int v201 = 0;
    int v198 = 0;
    int v196 = 0;
    long long v219 = 0uLL;
    memset(v194, 0, sizeof(v194));
    int v11 = 0;
    int v189 = 0;
    int v191 = 0;
    BOOL v218 = 0;
    int v186 = 0;
    int v187 = 0;
    BOOL v217 = 0;
    int v181 = 0;
    int v184 = 0;
    BOOL v216 = 0;
    int v173 = 0;
    int v167 = 0;
    BOOL v215 = 0;
    int v175 = 0;
    int v179 = 0;
    BOOL v214 = 0;
    int v168 = 0;
    int v176 = 0;
    BOOL v213 = 0;
    int v164 = 0;
    int v170 = 0;
    BOOL v207 = 0;
    int v162 = 0;
    int v163 = 0;
    BOOL v206 = 0;
    int v165 = 0;
    int v171 = 0;
    BOOL v205 = 0;
    int v166 = 0;
    int v174 = 0;
    BOOL v204 = 0;
    int v169 = 0;
    int v177 = 0;
    BOOL v203 = 0;
    int v172 = 0;
    int v180 = 0;
    BOOL v202 = 0;
    int v178 = 0;
    int v183 = 0;
    BOOL v200 = 0;
    int v182 = 0;
    int v185 = 0;
    BOOL v199 = 0;
    int v188 = 0;
    int v190 = 0;
    BOOL v197 = 0;
    int v192 = 0;
    int v193 = 0;
    BOOL v195 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    BOOL v15 = 0;
    goto LABEL_15;
  }
  uint64_t v3 = [(SFActionItem *)self label];
  uint64_t v4 = v3 != 0;
  v161 = (void *)v3;
  if (v3)
  {
    uint64_t v10 = [(SFActionItem *)self label];
    [(SFActionItem *)v7 label];
    v157 = v158 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      int v201 = 0;
      int v198 = 0;
      uint64_t v208 = 0x100000000;
      int v196 = 0;
      long long v219 = 0uLL;
      memset(v194, 0, sizeof(v194));
      int v11 = 0;
      int v189 = 0;
      int v191 = 0;
      BOOL v218 = 0;
      int v186 = 0;
      int v187 = 0;
      BOOL v217 = 0;
      int v181 = 0;
      int v184 = 0;
      BOOL v216 = 0;
      int v173 = 0;
      int v167 = 0;
      BOOL v215 = 0;
      int v175 = 0;
      int v179 = 0;
      BOOL v214 = 0;
      int v168 = 0;
      int v176 = 0;
      BOOL v213 = 0;
      int v164 = 0;
      int v170 = 0;
      BOOL v207 = 0;
      int v162 = 0;
      int v163 = 0;
      BOOL v206 = 0;
      int v165 = 0;
      int v171 = 0;
      BOOL v205 = 0;
      int v166 = 0;
      int v174 = 0;
      BOOL v204 = 0;
      int v169 = 0;
      int v177 = 0;
      BOOL v203 = 0;
      int v172 = 0;
      int v180 = 0;
      BOOL v202 = 0;
      int v178 = 0;
      int v183 = 0;
      BOOL v200 = 0;
      int v182 = 0;
      int v185 = 0;
      BOOL v199 = 0;
      int v188 = 0;
      int v190 = 0;
      BOOL v197 = 0;
      int v192 = 0;
      int v193 = 0;
      BOOL v195 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      BOOL v15 = 0;
      goto LABEL_15;
    }
  }
  v160 = [(SFActionItem *)self labelForLocalMedia];
  uint64_t v3 = v160 == 0;
  v159 = [(SFActionItem *)v7 labelForLocalMedia];
  HIDWORD(v208) = v4;
  if (v3 == (v159 != 0))
  {
    int v198 = 0;
    LODWORD(v208) = 0;
    int v196 = 0;
    long long v219 = 0uLL;
    memset(v194, 0, sizeof(v194));
    int v11 = 0;
    int v189 = 0;
    int v191 = 0;
    BOOL v218 = 0;
    int v186 = 0;
    int v187 = 0;
    BOOL v217 = 0;
    int v181 = 0;
    int v184 = 0;
    BOOL v216 = 0;
    int v173 = 0;
    int v167 = 0;
    BOOL v215 = 0;
    int v175 = 0;
    int v179 = 0;
    BOOL v214 = 0;
    int v168 = 0;
    int v176 = 0;
    BOOL v213 = 0;
    int v164 = 0;
    int v170 = 0;
    BOOL v207 = 0;
    int v162 = 0;
    int v163 = 0;
    BOOL v206 = 0;
    int v165 = 0;
    int v171 = 0;
    BOOL v205 = 0;
    int v166 = 0;
    int v174 = 0;
    BOOL v204 = 0;
    int v169 = 0;
    int v177 = 0;
    BOOL v203 = 0;
    int v172 = 0;
    int v180 = 0;
    BOOL v202 = 0;
    int v178 = 0;
    int v183 = 0;
    BOOL v200 = 0;
    int v182 = 0;
    int v185 = 0;
    BOOL v199 = 0;
    int v188 = 0;
    int v190 = 0;
    BOOL v197 = 0;
    int v192 = 0;
    int v193 = 0;
    BOOL v195 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    BOOL v15 = 0;
    int v201 = 1;
    goto LABEL_15;
  }
  uint64_t v16 = [(SFActionItem *)self labelForLocalMedia];
  BOOL v17 = v16 != 0;
  v156 = (void *)v16;
  if (v16)
  {
    uint64_t v3 = [(SFActionItem *)self labelForLocalMedia];
    [(SFActionItem *)v7 labelForLocalMedia];
    v154 = v155 = (void *)v3;
    if (!objc_msgSend((id)v3, "isEqual:"))
    {
      int v196 = 0;
      long long v219 = 0uLL;
      memset(v194, 0, sizeof(v194));
      int v11 = 0;
      int v189 = 0;
      int v191 = 0;
      BOOL v218 = 0;
      int v186 = 0;
      int v187 = 0;
      BOOL v217 = 0;
      int v181 = 0;
      int v184 = 0;
      BOOL v216 = 0;
      int v173 = 0;
      int v167 = 0;
      BOOL v215 = 0;
      int v175 = 0;
      int v179 = 0;
      BOOL v214 = 0;
      int v168 = 0;
      int v176 = 0;
      BOOL v213 = 0;
      int v164 = 0;
      int v170 = 0;
      BOOL v207 = 0;
      int v162 = 0;
      int v163 = 0;
      BOOL v206 = 0;
      int v165 = 0;
      int v171 = 0;
      BOOL v205 = 0;
      int v166 = 0;
      int v174 = 0;
      BOOL v204 = 0;
      int v169 = 0;
      int v177 = 0;
      BOOL v203 = 0;
      int v172 = 0;
      int v180 = 0;
      BOOL v202 = 0;
      int v178 = 0;
      int v183 = 0;
      BOOL v200 = 0;
      int v182 = 0;
      int v185 = 0;
      BOOL v199 = 0;
      int v188 = 0;
      int v190 = 0;
      BOOL v197 = 0;
      int v192 = 0;
      int v193 = 0;
      BOOL v195 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      BOOL v15 = 0;
      int v201 = 1;
      int v198 = 1;
      LODWORD(v208) = 1;
      goto LABEL_15;
    }
  }
  uint64_t v3 = [(SFActionItem *)self isOverlay];
  LODWORD(v208) = v17;
  if (v3 != [(SFActionItem *)v7 isOverlay])
  {
    int v196 = 0;
    long long v219 = 0uLL;
    memset(v194, 0, sizeof(v194));
    int v11 = 0;
    int v189 = 0;
    int v191 = 0;
    BOOL v218 = 0;
    int v186 = 0;
    int v187 = 0;
    BOOL v217 = 0;
    int v181 = 0;
    int v184 = 0;
    BOOL v216 = 0;
    int v173 = 0;
    int v167 = 0;
    BOOL v215 = 0;
    int v175 = 0;
    int v179 = 0;
    BOOL v214 = 0;
    int v168 = 0;
    int v176 = 0;
    BOOL v213 = 0;
    int v164 = 0;
    int v170 = 0;
    BOOL v207 = 0;
    int v162 = 0;
    int v163 = 0;
    BOOL v206 = 0;
    int v165 = 0;
    int v171 = 0;
    BOOL v205 = 0;
    int v166 = 0;
    int v174 = 0;
    BOOL v204 = 0;
    int v169 = 0;
    int v177 = 0;
    BOOL v203 = 0;
    int v172 = 0;
    int v180 = 0;
    BOOL v202 = 0;
    int v178 = 0;
    int v183 = 0;
    BOOL v200 = 0;
    int v182 = 0;
    int v185 = 0;
    BOOL v199 = 0;
    int v188 = 0;
    int v190 = 0;
    BOOL v197 = 0;
    int v192 = 0;
    int v193 = 0;
    BOOL v195 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    BOOL v15 = 0;
    int v201 = 1;
    int v198 = 1;
    goto LABEL_15;
  }
  v153 = [(SFActionItem *)self storeIdentifiers];
  uint64_t v3 = v153 == 0;
  v152 = [(SFActionItem *)v7 storeIdentifiers];
  if (v3 == (v152 != 0))
  {
    long long v219 = 0uLL;
    memset(v194, 0, sizeof(v194));
    int v11 = 0;
    int v189 = 0;
    int v191 = 0;
    BOOL v218 = 0;
    int v186 = 0;
    int v187 = 0;
    BOOL v217 = 0;
    int v181 = 0;
    int v184 = 0;
    BOOL v216 = 0;
    int v173 = 0;
    int v167 = 0;
    BOOL v215 = 0;
    int v175 = 0;
    int v179 = 0;
    BOOL v214 = 0;
    int v168 = 0;
    int v176 = 0;
    BOOL v213 = 0;
    int v164 = 0;
    int v170 = 0;
    BOOL v207 = 0;
    int v162 = 0;
    int v163 = 0;
    BOOL v206 = 0;
    int v165 = 0;
    int v171 = 0;
    BOOL v205 = 0;
    int v166 = 0;
    int v174 = 0;
    BOOL v204 = 0;
    int v169 = 0;
    int v177 = 0;
    BOOL v203 = 0;
    int v172 = 0;
    int v180 = 0;
    BOOL v202 = 0;
    int v178 = 0;
    int v183 = 0;
    BOOL v200 = 0;
    int v182 = 0;
    int v185 = 0;
    BOOL v199 = 0;
    int v188 = 0;
    int v190 = 0;
    BOOL v197 = 0;
    int v192 = 0;
    int v193 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    BOOL v15 = 0;
    int v201 = 1;
    int v198 = 1;
    BOOL v195 = 0;
    int v196 = 1;
    goto LABEL_15;
  }
  uint64_t v3 = [(SFActionItem *)self storeIdentifiers];
  HIDWORD(v219) = v3 != 0;
  v151 = (void *)v3;
  if (v3)
  {
    uint64_t v22 = [(SFActionItem *)self storeIdentifiers];
    v23 = v7;
    uint64_t v24 = (void *)v22;
    v51 = v23;
    [(SFActionItem *)v23 storeIdentifiers];
    v149 = v150 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      *(void *)((char *)&v219 + 4) = 0;
      memset(v194, 0, 20);
      int v11 = 0;
      LODWORD(v219) = 0;
      int v189 = 0;
      int v191 = 0;
      BOOL v218 = 0;
      int v186 = 0;
      int v187 = 0;
      BOOL v217 = 0;
      int v181 = 0;
      int v184 = 0;
      BOOL v216 = 0;
      int v173 = 0;
      int v167 = 0;
      BOOL v215 = 0;
      int v175 = 0;
      int v179 = 0;
      BOOL v214 = 0;
      int v168 = 0;
      int v176 = 0;
      BOOL v213 = 0;
      int v164 = 0;
      int v170 = 0;
      BOOL v207 = 0;
      int v162 = 0;
      int v163 = 0;
      BOOL v206 = 0;
      int v165 = 0;
      int v171 = 0;
      BOOL v205 = 0;
      int v166 = 0;
      int v174 = 0;
      BOOL v204 = 0;
      int v169 = 0;
      int v177 = 0;
      BOOL v203 = 0;
      int v172 = 0;
      int v180 = 0;
      BOOL v202 = 0;
      int v178 = 0;
      int v183 = 0;
      BOOL v200 = 0;
      int v182 = 0;
      int v185 = 0;
      BOOL v199 = 0;
      int v188 = 0;
      int v190 = 0;
      BOOL v197 = 0;
      int v192 = 0;
      int v193 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      BOOL v15 = 0;
      int v201 = 1;
      int v198 = 1;
      BOOL v195 = 0;
      int v196 = 1;
      HIDWORD(v194[2]) = 1;
      HIDWORD(v219) = 1;
      uint64_t v7 = v51;
      goto LABEL_15;
    }
    uint64_t v7 = v51;
  }
  uint64_t v3 = [(SFActionItem *)self requiresLocalMedia];
  if (v3 == [(SFActionItem *)v7 requiresLocalMedia])
  {
    v148 = [(SFActionItem *)self localMediaIdentifier];
    uint64_t v3 = v148 == 0;
    v147 = [(SFActionItem *)v7 localMediaIdentifier];
    if (v3 == (v147 != 0))
    {
      v194[2] = 0x100000000;
      *(void *)((char *)&v219 + 4) = 0;
      *(void *)((char *)v194 + 4) = 0;
      LODWORD(v194[0]) = 0;
      int v11 = 0;
      LODWORD(v219) = 0;
      int v189 = 0;
      int v191 = 0;
      BOOL v218 = 0;
      int v186 = 0;
      int v187 = 0;
      BOOL v217 = 0;
      int v181 = 0;
      int v184 = 0;
      BOOL v216 = 0;
      int v173 = 0;
      int v167 = 0;
      BOOL v215 = 0;
      int v175 = 0;
      int v179 = 0;
      BOOL v214 = 0;
      int v168 = 0;
      int v176 = 0;
      BOOL v213 = 0;
      int v164 = 0;
      int v170 = 0;
      BOOL v207 = 0;
      int v162 = 0;
      int v163 = 0;
      BOOL v206 = 0;
      int v165 = 0;
      int v171 = 0;
      BOOL v205 = 0;
      int v166 = 0;
      int v174 = 0;
      BOOL v204 = 0;
      int v169 = 0;
      int v177 = 0;
      BOOL v203 = 0;
      int v172 = 0;
      int v180 = 0;
      BOOL v202 = 0;
      int v178 = 0;
      int v183 = 0;
      BOOL v200 = 0;
      int v182 = 0;
      int v185 = 0;
      BOOL v199 = 0;
      int v188 = 0;
      int v190 = 0;
      BOOL v197 = 0;
      int v192 = 0;
      int v193 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      BOOL v15 = 0;
      int v201 = 1;
      int v198 = 1;
      BOOL v195 = 0;
      int v196 = 1;
      HIDWORD(v194[1]) = 1;
    }
    else
    {
      v146 = [(SFActionItem *)self localMediaIdentifier];
      DWORD2(v219) = v146 != 0;
      if (!v146
        || ([(SFActionItem *)self localMediaIdentifier],
            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
            [(SFActionItem *)v7 localMediaIdentifier],
            v143 = (void *)v3,
            v142 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend((id)v3, "isEqual:")))
      {
        v145 = [(SFActionItem *)self punchout];
        uint64_t v3 = v145 == 0;
        v144 = [(SFActionItem *)v7 punchout];
        if (v3 == (v144 != 0))
        {
          v194[1] = 0x100000000;
          *(void *)&long long v219 = 0;
          v194[0] = 0x100000000;
          int v11 = 0;
          int v189 = 0;
          int v191 = 0;
          BOOL v218 = 0;
          int v186 = 0;
          int v187 = 0;
          BOOL v217 = 0;
          int v181 = 0;
          int v184 = 0;
          BOOL v216 = 0;
          int v173 = 0;
          int v167 = 0;
          BOOL v215 = 0;
          int v175 = 0;
          int v179 = 0;
          BOOL v214 = 0;
          int v168 = 0;
          int v176 = 0;
          BOOL v213 = 0;
          int v164 = 0;
          int v170 = 0;
          BOOL v207 = 0;
          int v162 = 0;
          int v163 = 0;
          BOOL v206 = 0;
          int v165 = 0;
          int v171 = 0;
          BOOL v205 = 0;
          int v166 = 0;
          int v174 = 0;
          BOOL v204 = 0;
          int v169 = 0;
          int v177 = 0;
          BOOL v203 = 0;
          int v172 = 0;
          int v180 = 0;
          BOOL v202 = 0;
          int v178 = 0;
          int v183 = 0;
          BOOL v200 = 0;
          int v182 = 0;
          int v185 = 0;
          BOOL v199 = 0;
          int v188 = 0;
          int v190 = 0;
          BOOL v197 = 0;
          int v192 = 0;
          int v193 = 0;
          int v12 = 0;
          int v13 = 0;
          int v14 = 0;
          BOOL v15 = 0;
          int v201 = 1;
          int v198 = 1;
          BOOL v195 = 0;
          int v196 = 1;
          v194[2] = 0x100000001;
        }
        else
        {
          v141 = [(SFActionItem *)self punchout];
          DWORD1(v219) = v141 != 0;
          if (!v141
            || ([(SFActionItem *)self punchout],
                uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                [(SFActionItem *)v7 punchout],
                v138 = (void *)v3,
                v137 = objc_claimAutoreleasedReturnValue(),
                objc_msgSend((id)v3, "isEqual:")))
          {
            v140 = [(SFActionItem *)self applicationBundleIdentifier];
            uint64_t v3 = v140 == 0;
            v139 = [(SFActionItem *)v7 applicationBundleIdentifier];
            if (v3 == (v139 != 0))
            {
              int v11 = 0;
              LODWORD(v219) = 0;
              int v189 = 0;
              int v191 = 0;
              BOOL v218 = 0;
              int v186 = 0;
              int v187 = 0;
              BOOL v217 = 0;
              int v181 = 0;
              int v184 = 0;
              BOOL v216 = 0;
              int v173 = 0;
              int v167 = 0;
              BOOL v215 = 0;
              int v175 = 0;
              int v179 = 0;
              BOOL v214 = 0;
              int v168 = 0;
              int v176 = 0;
              BOOL v213 = 0;
              int v164 = 0;
              int v170 = 0;
              BOOL v207 = 0;
              int v162 = 0;
              int v163 = 0;
              BOOL v206 = 0;
              int v165 = 0;
              int v171 = 0;
              BOOL v205 = 0;
              int v166 = 0;
              int v174 = 0;
              BOOL v204 = 0;
              int v169 = 0;
              int v177 = 0;
              BOOL v203 = 0;
              int v172 = 0;
              int v180 = 0;
              BOOL v202 = 0;
              int v178 = 0;
              int v183 = 0;
              BOOL v200 = 0;
              int v182 = 0;
              int v185 = 0;
              BOOL v199 = 0;
              int v188 = 0;
              int v190 = 0;
              BOOL v197 = 0;
              int v192 = 0;
              int v12 = 0;
              int v13 = 0;
              int v14 = 0;
              BOOL v15 = 0;
              int v201 = 1;
              int v198 = 1;
              BOOL v195 = 0;
              int v196 = 1;
              v194[2] = 0x100000001;
              v194[1] = 0x100000001;
              int v193 = 0;
              v194[0] = 0x100000001;
            }
            else
            {
              uint64_t v25 = [(SFActionItem *)self applicationBundleIdentifier];
              LODWORD(v219) = v25 != 0;
              v136 = (void *)v25;
              if (!v25
                || ([(SFActionItem *)self applicationBundleIdentifier],
                    uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                    [(SFActionItem *)v7 applicationBundleIdentifier],
                    v133 = (void *)v3,
                    v132 = objc_claimAutoreleasedReturnValue(),
                    objc_msgSend((id)v3, "isEqual:")))
              {
                v135 = [(SFActionItem *)self contactIdentifier];
                uint64_t v3 = v135 == 0;
                v134 = [(SFActionItem *)v7 contactIdentifier];
                if (v3 == (v134 != 0))
                {
                  int v191 = 0;
                  BOOL v218 = 0;
                  int v186 = 0;
                  int v187 = 0;
                  BOOL v217 = 0;
                  int v181 = 0;
                  int v184 = 0;
                  BOOL v216 = 0;
                  int v173 = 0;
                  int v167 = 0;
                  BOOL v215 = 0;
                  int v175 = 0;
                  int v179 = 0;
                  BOOL v214 = 0;
                  int v168 = 0;
                  int v176 = 0;
                  BOOL v213 = 0;
                  int v164 = 0;
                  int v170 = 0;
                  BOOL v207 = 0;
                  int v162 = 0;
                  int v163 = 0;
                  BOOL v206 = 0;
                  int v165 = 0;
                  int v171 = 0;
                  BOOL v205 = 0;
                  int v166 = 0;
                  int v174 = 0;
                  BOOL v204 = 0;
                  int v169 = 0;
                  int v177 = 0;
                  BOOL v203 = 0;
                  int v172 = 0;
                  int v180 = 0;
                  BOOL v202 = 0;
                  int v178 = 0;
                  int v183 = 0;
                  BOOL v200 = 0;
                  int v182 = 0;
                  int v185 = 0;
                  BOOL v199 = 0;
                  int v188 = 0;
                  int v190 = 0;
                  BOOL v197 = 0;
                  int v192 = 0;
                  int v12 = 0;
                  int v13 = 0;
                  int v14 = 0;
                  BOOL v15 = 0;
                  int v201 = 1;
                  int v198 = 1;
                  BOOL v195 = 0;
                  int v196 = 1;
                  v194[2] = 0x100000001;
                  v194[1] = 0x100000001;
                  int v193 = 0;
                  v194[0] = 0x100000001;
                  int v11 = 1;
                  int v189 = 1;
                }
                else
                {
                  uint64_t v26 = [(SFActionItem *)self contactIdentifier];
                  BOOL v218 = v26 != 0;
                  v131 = (void *)v26;
                  if (!v26
                    || ([(SFActionItem *)self contactIdentifier],
                        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                        [(SFActionItem *)v7 contactIdentifier],
                        v128 = (void *)v3,
                        v127 = objc_claimAutoreleasedReturnValue(),
                        objc_msgSend((id)v3, "isEqual:")))
                  {
                    v130 = [(SFActionItem *)self phoneNumber];
                    uint64_t v3 = v130 == 0;
                    v129 = [(SFActionItem *)v7 phoneNumber];
                    if (v3 == (v129 != 0))
                    {
                      int v187 = 0;
                      BOOL v217 = 0;
                      int v181 = 0;
                      int v184 = 0;
                      BOOL v216 = 0;
                      int v173 = 0;
                      int v167 = 0;
                      BOOL v215 = 0;
                      int v175 = 0;
                      int v179 = 0;
                      BOOL v214 = 0;
                      int v168 = 0;
                      int v176 = 0;
                      BOOL v213 = 0;
                      int v164 = 0;
                      int v170 = 0;
                      BOOL v207 = 0;
                      int v162 = 0;
                      int v163 = 0;
                      BOOL v206 = 0;
                      int v165 = 0;
                      int v171 = 0;
                      BOOL v205 = 0;
                      int v166 = 0;
                      int v174 = 0;
                      BOOL v204 = 0;
                      int v169 = 0;
                      int v177 = 0;
                      BOOL v203 = 0;
                      int v172 = 0;
                      int v180 = 0;
                      BOOL v202 = 0;
                      int v178 = 0;
                      int v183 = 0;
                      BOOL v200 = 0;
                      int v182 = 0;
                      int v185 = 0;
                      BOOL v199 = 0;
                      int v188 = 0;
                      int v190 = 0;
                      BOOL v197 = 0;
                      int v192 = 0;
                      int v12 = 0;
                      int v13 = 0;
                      int v14 = 0;
                      BOOL v15 = 0;
                      int v201 = 1;
                      int v198 = 1;
                      BOOL v195 = 0;
                      int v196 = 1;
                      v194[2] = 0x100000001;
                      v194[1] = 0x100000001;
                      int v193 = 0;
                      v194[0] = 0x100000001;
                      int v11 = 1;
                      int v189 = 1;
                      int v191 = 1;
                      int v186 = 1;
                    }
                    else
                    {
                      uint64_t v27 = [(SFActionItem *)self phoneNumber];
                      BOOL v217 = v27 != 0;
                      v126 = (void *)v27;
                      if (!v27
                        || ([(SFActionItem *)self phoneNumber],
                            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                            [(SFActionItem *)v7 phoneNumber],
                            v123 = (void *)v3,
                            v122 = objc_claimAutoreleasedReturnValue(),
                            objc_msgSend((id)v3, "isEqual:")))
                      {
                        v125 = [(SFActionItem *)self email];
                        uint64_t v3 = v125 == 0;
                        v124 = [(SFActionItem *)v7 email];
                        if (v3 == (v124 != 0))
                        {
                          int v184 = 0;
                          BOOL v216 = 0;
                          int v173 = 0;
                          int v167 = 0;
                          BOOL v215 = 0;
                          int v175 = 0;
                          int v179 = 0;
                          BOOL v214 = 0;
                          int v168 = 0;
                          int v176 = 0;
                          BOOL v213 = 0;
                          int v164 = 0;
                          int v170 = 0;
                          BOOL v207 = 0;
                          int v162 = 0;
                          int v163 = 0;
                          BOOL v206 = 0;
                          int v165 = 0;
                          int v171 = 0;
                          BOOL v205 = 0;
                          int v166 = 0;
                          int v174 = 0;
                          BOOL v204 = 0;
                          int v169 = 0;
                          int v177 = 0;
                          BOOL v203 = 0;
                          int v172 = 0;
                          int v180 = 0;
                          BOOL v202 = 0;
                          int v178 = 0;
                          int v183 = 0;
                          BOOL v200 = 0;
                          int v182 = 0;
                          int v185 = 0;
                          BOOL v199 = 0;
                          int v188 = 0;
                          int v190 = 0;
                          BOOL v197 = 0;
                          int v192 = 0;
                          int v12 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          BOOL v15 = 0;
                          int v201 = 1;
                          int v198 = 1;
                          BOOL v195 = 0;
                          int v196 = 1;
                          v194[2] = 0x100000001;
                          v194[1] = 0x100000001;
                          int v193 = 0;
                          v194[0] = 0x100000001;
                          int v11 = 1;
                          int v189 = 1;
                          int v191 = 1;
                          int v186 = 1;
                          int v187 = 1;
                          int v181 = 1;
                        }
                        else
                        {
                          uint64_t v28 = [(SFActionItem *)self email];
                          BOOL v216 = v28 != 0;
                          v121 = (void *)v28;
                          if (!v28
                            || ([(SFActionItem *)self email],
                                uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                [(SFActionItem *)v7 email],
                                v118 = (void *)v3,
                                v117 = objc_claimAutoreleasedReturnValue(),
                                objc_msgSend((id)v3, "isEqual:")))
                          {
                            v120 = [(SFActionItem *)self mapsData];
                            uint64_t v3 = v120 == 0;
                            v119 = [(SFActionItem *)v7 mapsData];
                            if (v3 == (v119 != 0))
                            {
                              int v167 = 0;
                              BOOL v215 = 0;
                              int v175 = 0;
                              int v179 = 0;
                              BOOL v214 = 0;
                              int v168 = 0;
                              int v176 = 0;
                              BOOL v213 = 0;
                              int v164 = 0;
                              int v170 = 0;
                              BOOL v207 = 0;
                              int v162 = 0;
                              int v163 = 0;
                              BOOL v206 = 0;
                              int v165 = 0;
                              int v171 = 0;
                              BOOL v205 = 0;
                              int v166 = 0;
                              int v174 = 0;
                              BOOL v204 = 0;
                              int v169 = 0;
                              int v177 = 0;
                              BOOL v203 = 0;
                              int v172 = 0;
                              int v180 = 0;
                              BOOL v202 = 0;
                              int v178 = 0;
                              int v183 = 0;
                              BOOL v200 = 0;
                              int v182 = 0;
                              int v185 = 0;
                              BOOL v199 = 0;
                              int v188 = 0;
                              int v190 = 0;
                              BOOL v197 = 0;
                              int v192 = 0;
                              int v12 = 0;
                              int v13 = 0;
                              int v14 = 0;
                              BOOL v15 = 0;
                              int v201 = 1;
                              int v198 = 1;
                              BOOL v195 = 0;
                              int v196 = 1;
                              v194[2] = 0x100000001;
                              v194[1] = 0x100000001;
                              int v193 = 0;
                              v194[0] = 0x100000001;
                              int v11 = 1;
                              int v189 = 1;
                              int v191 = 1;
                              int v186 = 1;
                              int v187 = 1;
                              int v181 = 1;
                              int v184 = 1;
                              int v173 = 1;
                            }
                            else
                            {
                              uint64_t v29 = [(SFActionItem *)self mapsData];
                              BOOL v215 = v29 != 0;
                              v116 = (void *)v29;
                              if (!v29
                                || ([(SFActionItem *)self mapsData],
                                    uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                    [(SFActionItem *)v7 mapsData],
                                    v114 = objc_claimAutoreleasedReturnValue(),
                                    v115 = (void *)v3,
                                    objc_msgSend((id)v3, "isEqual:")))
                              {
                                [(SFActionItem *)self latitude];
                                double v31 = v30;
                                [(SFActionItem *)v7 latitude];
                                if (vabdd_f64(v31, v32) >= 2.22044605e-16
                                  || ([(SFActionItem *)self longitude],
                                      double v34 = v33,
                                      [(SFActionItem *)v7 longitude],
                                      vabdd_f64(v34, v35) >= 2.22044605e-16))
                                {
                                  int v175 = 0;
                                  int v179 = 0;
                                  BOOL v214 = 0;
                                  int v168 = 0;
                                  int v176 = 0;
                                  BOOL v213 = 0;
                                  int v164 = 0;
                                  int v170 = 0;
                                  BOOL v207 = 0;
                                  int v162 = 0;
                                  int v163 = 0;
                                  BOOL v206 = 0;
                                  int v165 = 0;
                                  int v171 = 0;
                                  BOOL v205 = 0;
                                  int v166 = 0;
                                  int v174 = 0;
                                  BOOL v204 = 0;
                                  int v169 = 0;
                                  int v177 = 0;
                                  BOOL v203 = 0;
                                  int v172 = 0;
                                  int v180 = 0;
                                  BOOL v202 = 0;
                                  int v178 = 0;
                                  int v183 = 0;
                                  BOOL v200 = 0;
                                  int v182 = 0;
                                  int v185 = 0;
                                  BOOL v199 = 0;
                                  int v188 = 0;
                                  int v190 = 0;
                                  BOOL v197 = 0;
                                  int v192 = 0;
                                  int v12 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  BOOL v15 = 0;
                                  int v201 = 1;
                                  int v198 = 1;
                                  BOOL v195 = 0;
                                  int v196 = 1;
                                  v194[2] = 0x100000001;
                                  v194[1] = 0x100000001;
                                  int v193 = 0;
                                  v194[0] = 0x100000001;
                                  int v11 = 1;
                                  int v189 = 1;
                                  int v191 = 1;
                                  int v186 = 1;
                                  int v187 = 1;
                                  int v181 = 1;
                                  int v184 = 1;
                                  int v173 = 1;
                                  int v167 = 1;
                                }
                                else
                                {
                                  v113 = [(SFActionItem *)self provider];
                                  uint64_t v3 = v113 == 0;
                                  v112 = [(SFActionItem *)v7 provider];
                                  if (v3 == (v112 != 0))
                                  {
                                    int v179 = 0;
                                    BOOL v214 = 0;
                                    int v168 = 0;
                                    int v176 = 0;
                                    BOOL v213 = 0;
                                    int v164 = 0;
                                    int v170 = 0;
                                    BOOL v207 = 0;
                                    int v162 = 0;
                                    int v163 = 0;
                                    BOOL v206 = 0;
                                    int v165 = 0;
                                    int v171 = 0;
                                    BOOL v205 = 0;
                                    int v166 = 0;
                                    int v174 = 0;
                                    BOOL v204 = 0;
                                    int v169 = 0;
                                    int v177 = 0;
                                    BOOL v203 = 0;
                                    int v172 = 0;
                                    int v180 = 0;
                                    BOOL v202 = 0;
                                    int v178 = 0;
                                    int v183 = 0;
                                    BOOL v200 = 0;
                                    int v182 = 0;
                                    int v185 = 0;
                                    BOOL v199 = 0;
                                    int v188 = 0;
                                    int v190 = 0;
                                    BOOL v197 = 0;
                                    int v192 = 0;
                                    int v12 = 0;
                                    int v13 = 0;
                                    int v14 = 0;
                                    BOOL v15 = 0;
                                    int v201 = 1;
                                    int v198 = 1;
                                    BOOL v195 = 0;
                                    int v196 = 1;
                                    v194[2] = 0x100000001;
                                    v194[1] = 0x100000001;
                                    int v193 = 0;
                                    v194[0] = 0x100000001;
                                    int v11 = 1;
                                    int v189 = 1;
                                    int v191 = 1;
                                    int v186 = 1;
                                    int v187 = 1;
                                    int v181 = 1;
                                    int v184 = 1;
                                    int v173 = 1;
                                    int v167 = 1;
                                    int v175 = 1;
                                  }
                                  else
                                  {
                                    uint64_t v36 = [(SFActionItem *)self provider];
                                    BOOL v214 = v36 != 0;
                                    v111 = (void *)v36;
                                    if (!v36
                                      || ([(SFActionItem *)self provider],
                                          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                          [(SFActionItem *)v7 provider],
                                          v107 = objc_claimAutoreleasedReturnValue(),
                                          v108 = (void *)v3,
                                          objc_msgSend((id)v3, "isEqual:")))
                                    {
                                      v110 = [(SFActionItem *)self offerType];
                                      uint64_t v3 = v110 == 0;
                                      v109 = [(SFActionItem *)v7 offerType];
                                      if (v3 == (v109 != 0))
                                      {
                                        int v176 = 0;
                                        BOOL v213 = 0;
                                        int v164 = 0;
                                        int v170 = 0;
                                        BOOL v207 = 0;
                                        int v162 = 0;
                                        int v163 = 0;
                                        BOOL v206 = 0;
                                        int v165 = 0;
                                        int v171 = 0;
                                        BOOL v205 = 0;
                                        int v166 = 0;
                                        int v174 = 0;
                                        BOOL v204 = 0;
                                        int v169 = 0;
                                        int v177 = 0;
                                        BOOL v203 = 0;
                                        int v172 = 0;
                                        int v180 = 0;
                                        BOOL v202 = 0;
                                        int v178 = 0;
                                        int v183 = 0;
                                        BOOL v200 = 0;
                                        int v182 = 0;
                                        int v185 = 0;
                                        BOOL v199 = 0;
                                        int v188 = 0;
                                        int v190 = 0;
                                        BOOL v197 = 0;
                                        int v192 = 0;
                                        int v12 = 0;
                                        int v13 = 0;
                                        int v14 = 0;
                                        BOOL v15 = 0;
                                        int v201 = 1;
                                        int v198 = 1;
                                        BOOL v195 = 0;
                                        int v196 = 1;
                                        v194[2] = 0x100000001;
                                        v194[1] = 0x100000001;
                                        int v193 = 0;
                                        v194[0] = 0x100000001;
                                        int v11 = 1;
                                        int v189 = 1;
                                        int v191 = 1;
                                        int v186 = 1;
                                        int v187 = 1;
                                        int v181 = 1;
                                        int v184 = 1;
                                        int v173 = 1;
                                        int v167 = 1;
                                        int v175 = 1;
                                        int v179 = 1;
                                        int v168 = 1;
                                      }
                                      else
                                      {
                                        uint64_t v37 = [(SFActionItem *)self offerType];
                                        BOOL v213 = v37 != 0;
                                        v106 = (void *)v37;
                                        if (!v37
                                          || ([(SFActionItem *)self offerType],
                                              uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                              [(SFActionItem *)v7 offerType],
                                              v102 = objc_claimAutoreleasedReturnValue(),
                                              v103 = (void *)v3,
                                              objc_msgSend((id)v3, "isEqual:")))
                                        {
                                          v105 = [(SFActionItem *)self type];
                                          uint64_t v3 = v105 == 0;
                                          v104 = [(SFActionItem *)v7 type];
                                          if (v3 == (v104 != 0))
                                          {
                                            int v170 = 0;
                                            BOOL v207 = 0;
                                            int v162 = 0;
                                            int v163 = 0;
                                            BOOL v206 = 0;
                                            int v165 = 0;
                                            int v171 = 0;
                                            BOOL v205 = 0;
                                            int v166 = 0;
                                            int v174 = 0;
                                            BOOL v204 = 0;
                                            int v169 = 0;
                                            int v177 = 0;
                                            BOOL v203 = 0;
                                            int v172 = 0;
                                            int v180 = 0;
                                            BOOL v202 = 0;
                                            int v178 = 0;
                                            int v183 = 0;
                                            BOOL v200 = 0;
                                            int v182 = 0;
                                            int v185 = 0;
                                            BOOL v199 = 0;
                                            int v188 = 0;
                                            int v190 = 0;
                                            BOOL v197 = 0;
                                            int v192 = 0;
                                            int v12 = 0;
                                            int v13 = 0;
                                            int v14 = 0;
                                            BOOL v15 = 0;
                                            int v201 = 1;
                                            int v198 = 1;
                                            BOOL v195 = 0;
                                            int v196 = 1;
                                            v194[2] = 0x100000001;
                                            v194[1] = 0x100000001;
                                            int v193 = 0;
                                            v194[0] = 0x100000001;
                                            int v11 = 1;
                                            int v189 = 1;
                                            int v191 = 1;
                                            int v186 = 1;
                                            int v187 = 1;
                                            int v181 = 1;
                                            int v184 = 1;
                                            int v173 = 1;
                                            int v167 = 1;
                                            int v175 = 1;
                                            int v179 = 1;
                                            int v168 = 1;
                                            int v176 = 1;
                                            int v164 = 1;
                                          }
                                          else
                                          {
                                            uint64_t v38 = [(SFActionItem *)self type];
                                            BOOL v207 = v38 != 0;
                                            v101 = (void *)v38;
                                            if (!v38
                                              || ([(SFActionItem *)self type],
                                                  uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                                  [(SFActionItem *)v7 type],
                                                  v99 = objc_claimAutoreleasedReturnValue(),
                                                  v100 = (void *)v3,
                                                  objc_msgSend((id)v3, "isEqual:")))
                                            {
                                              v98 = [(SFActionItem *)self labelITunes];
                                              uint64_t v3 = v98 == 0;
                                              v97 = [(SFActionItem *)v7 labelITunes];
                                              if (v3 == (v97 != 0))
                                              {
                                                int v163 = 0;
                                                BOOL v206 = 0;
                                                int v165 = 0;
                                                int v171 = 0;
                                                BOOL v205 = 0;
                                                int v166 = 0;
                                                int v174 = 0;
                                                BOOL v204 = 0;
                                                int v169 = 0;
                                                int v177 = 0;
                                                BOOL v203 = 0;
                                                int v172 = 0;
                                                int v180 = 0;
                                                BOOL v202 = 0;
                                                int v178 = 0;
                                                int v183 = 0;
                                                BOOL v200 = 0;
                                                int v182 = 0;
                                                int v185 = 0;
                                                BOOL v199 = 0;
                                                int v188 = 0;
                                                int v190 = 0;
                                                BOOL v197 = 0;
                                                int v192 = 0;
                                                int v12 = 0;
                                                int v13 = 0;
                                                int v14 = 0;
                                                BOOL v15 = 0;
                                                int v201 = 1;
                                                int v198 = 1;
                                                BOOL v195 = 0;
                                                int v196 = 1;
                                                v194[2] = 0x100000001;
                                                v194[1] = 0x100000001;
                                                int v193 = 0;
                                                v194[0] = 0x100000001;
                                                int v11 = 1;
                                                int v189 = 1;
                                                int v191 = 1;
                                                int v186 = 1;
                                                int v187 = 1;
                                                int v181 = 1;
                                                int v184 = 1;
                                                int v173 = 1;
                                                int v167 = 1;
                                                int v175 = 1;
                                                int v179 = 1;
                                                int v168 = 1;
                                                int v176 = 1;
                                                int v164 = 1;
                                                int v170 = 1;
                                                int v162 = 1;
                                              }
                                              else
                                              {
                                                uint64_t v39 = [(SFActionItem *)self labelITunes];
                                                BOOL v206 = v39 != 0;
                                                v96 = (void *)v39;
                                                if (!v39
                                                  || ([(SFActionItem *)self labelITunes],
                                                      uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                                      [(SFActionItem *)v7 labelITunes],
                                                      v94 = objc_claimAutoreleasedReturnValue(),
                                                      v95 = (void *)v3,
                                                      objc_msgSend((id)v3, "isEqual:")))
                                                {
                                                  uint64_t v3 = [(SFActionItem *)self isITunes];
                                                  if (v3 == [(SFActionItem *)v7 isITunes])
                                                  {
                                                    v91 = [(SFActionItem *)self icon];
                                                    uint64_t v3 = v91 == 0;
                                                    v88 = [(SFActionItem *)v7 icon];
                                                    if (v3 == (v88 != 0))
                                                    {
                                                      int v171 = 0;
                                                      BOOL v205 = 0;
                                                      int v166 = 0;
                                                      int v174 = 0;
                                                      BOOL v204 = 0;
                                                      int v169 = 0;
                                                      int v177 = 0;
                                                      BOOL v203 = 0;
                                                      int v172 = 0;
                                                      int v180 = 0;
                                                      BOOL v202 = 0;
                                                      int v178 = 0;
                                                      int v183 = 0;
                                                      BOOL v200 = 0;
                                                      int v182 = 0;
                                                      int v185 = 0;
                                                      BOOL v199 = 0;
                                                      int v188 = 0;
                                                      int v190 = 0;
                                                      BOOL v197 = 0;
                                                      int v192 = 0;
                                                      int v12 = 0;
                                                      int v13 = 0;
                                                      int v14 = 0;
                                                      BOOL v15 = 0;
                                                      int v201 = 1;
                                                      int v198 = 1;
                                                      BOOL v195 = 0;
                                                      int v196 = 1;
                                                      v194[2] = 0x100000001;
                                                      v194[1] = 0x100000001;
                                                      int v193 = 0;
                                                      v194[0] = 0x100000001;
                                                      int v11 = 1;
                                                      int v189 = 1;
                                                      int v191 = 1;
                                                      int v186 = 1;
                                                      int v187 = 1;
                                                      int v181 = 1;
                                                      int v184 = 1;
                                                      int v173 = 1;
                                                      int v167 = 1;
                                                      int v175 = 1;
                                                      int v179 = 1;
                                                      int v168 = 1;
                                                      int v176 = 1;
                                                      int v164 = 1;
                                                      int v170 = 1;
                                                      int v162 = 1;
                                                      int v163 = 1;
                                                      int v165 = 1;
                                                    }
                                                    else
                                                    {
                                                      uint64_t v40 = [(SFActionItem *)self icon];
                                                      BOOL v205 = v40 != 0;
                                                      v87 = (void *)v40;
                                                      if (!v40
                                                        || ([(SFActionItem *)self icon],
                                                            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                                            [(SFActionItem *)v7 icon],
                                                            v92 = objc_claimAutoreleasedReturnValue(),
                                                            v93 = (void *)v3,
                                                            objc_msgSend((id)v3, "isEqual:")))
                                                      {
                                                        v86 = [(SFActionItem *)self baseIcon];
                                                        uint64_t v3 = v86 == 0;
                                                        v84 = [(SFActionItem *)v7 baseIcon];
                                                        if (v3 == (v84 != 0))
                                                        {
                                                          int v174 = 0;
                                                          BOOL v204 = 0;
                                                          int v169 = 0;
                                                          int v177 = 0;
                                                          BOOL v203 = 0;
                                                          int v172 = 0;
                                                          int v180 = 0;
                                                          BOOL v202 = 0;
                                                          int v178 = 0;
                                                          int v183 = 0;
                                                          BOOL v200 = 0;
                                                          int v182 = 0;
                                                          int v185 = 0;
                                                          BOOL v199 = 0;
                                                          int v188 = 0;
                                                          int v190 = 0;
                                                          BOOL v197 = 0;
                                                          int v192 = 0;
                                                          int v12 = 0;
                                                          int v13 = 0;
                                                          int v14 = 0;
                                                          BOOL v15 = 0;
                                                          int v201 = 1;
                                                          int v198 = 1;
                                                          BOOL v195 = 0;
                                                          int v196 = 1;
                                                          v194[2] = 0x100000001;
                                                          v194[1] = 0x100000001;
                                                          int v193 = 0;
                                                          v194[0] = 0x100000001;
                                                          int v11 = 1;
                                                          int v189 = 1;
                                                          int v191 = 1;
                                                          int v186 = 1;
                                                          int v187 = 1;
                                                          int v181 = 1;
                                                          int v184 = 1;
                                                          int v173 = 1;
                                                          int v167 = 1;
                                                          int v175 = 1;
                                                          int v179 = 1;
                                                          int v168 = 1;
                                                          int v176 = 1;
                                                          int v164 = 1;
                                                          int v170 = 1;
                                                          int v162 = 1;
                                                          int v163 = 1;
                                                          int v165 = 1;
                                                          int v171 = 1;
                                                          int v166 = 1;
                                                        }
                                                        else
                                                        {
                                                          uint64_t v41 = [(SFActionItem *)self baseIcon];
                                                          BOOL v204 = v41 != 0;
                                                          v82 = (void *)v41;
                                                          if (!v41
                                                            || ([(SFActionItem *)self baseIcon],
                                                                uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                                                [(SFActionItem *)v7 baseIcon],
                                                                v89 = objc_claimAutoreleasedReturnValue(),
                                                                v90 = (void *)v3,
                                                                objc_msgSend((id)v3, "isEqual:")))
                                                          {
                                                            v81 = [(SFActionItem *)self location];
                                                            uint64_t v3 = v81 == 0;
                                                            v79 = [(SFActionItem *)v7 location];
                                                            if (v3 == (v79 != 0))
                                                            {
                                                              int v177 = 0;
                                                              BOOL v203 = 0;
                                                              int v172 = 0;
                                                              int v180 = 0;
                                                              BOOL v202 = 0;
                                                              int v178 = 0;
                                                              int v183 = 0;
                                                              BOOL v200 = 0;
                                                              int v182 = 0;
                                                              int v185 = 0;
                                                              BOOL v199 = 0;
                                                              int v188 = 0;
                                                              int v190 = 0;
                                                              BOOL v197 = 0;
                                                              int v192 = 0;
                                                              int v12 = 0;
                                                              int v13 = 0;
                                                              int v14 = 0;
                                                              BOOL v15 = 0;
                                                              int v201 = 1;
                                                              int v198 = 1;
                                                              BOOL v195 = 0;
                                                              int v196 = 1;
                                                              v194[2] = 0x100000001;
                                                              v194[1] = 0x100000001;
                                                              int v193 = 0;
                                                              v194[0] = 0x100000001;
                                                              int v11 = 1;
                                                              int v189 = 1;
                                                              int v191 = 1;
                                                              int v186 = 1;
                                                              int v187 = 1;
                                                              int v181 = 1;
                                                              int v184 = 1;
                                                              int v173 = 1;
                                                              int v167 = 1;
                                                              int v175 = 1;
                                                              int v179 = 1;
                                                              int v168 = 1;
                                                              int v176 = 1;
                                                              int v164 = 1;
                                                              int v170 = 1;
                                                              int v162 = 1;
                                                              int v163 = 1;
                                                              int v165 = 1;
                                                              int v171 = 1;
                                                              int v166 = 1;
                                                              int v174 = 1;
                                                              int v169 = 1;
                                                            }
                                                            else
                                                            {
                                                              uint64_t v42 = [(SFActionItem *)self location];
                                                              BOOL v203 = v42 != 0;
                                                              v77 = (void *)v42;
                                                              if (!v42
                                                                || ([(SFActionItem *)self location],
                                                                    uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                                                    [(SFActionItem *)v7 location],
                                                                    v85 = (void *)v3,
                                                                    v83 = objc_claimAutoreleasedReturnValue(),
                                                                    objc_msgSend((id)v3, "isEqual:")))
                                                              {
                                                                v76 = [(SFActionItem *)self messageIdentifier];
                                                                uint64_t v3 = v76 == 0;
                                                                v75 = [(SFActionItem *)v7 messageIdentifier];
                                                                if (v3 == (v75 != 0))
                                                                {
                                                                  int v180 = 0;
                                                                  BOOL v202 = 0;
                                                                  int v178 = 0;
                                                                  int v183 = 0;
                                                                  BOOL v200 = 0;
                                                                  int v182 = 0;
                                                                  int v185 = 0;
                                                                  BOOL v199 = 0;
                                                                  int v188 = 0;
                                                                  int v190 = 0;
                                                                  BOOL v197 = 0;
                                                                  int v192 = 0;
                                                                  int v12 = 0;
                                                                  int v13 = 0;
                                                                  int v14 = 0;
                                                                  BOOL v15 = 0;
                                                                  int v201 = 1;
                                                                  int v198 = 1;
                                                                  BOOL v195 = 0;
                                                                  int v196 = 1;
                                                                  v194[2] = 0x100000001;
                                                                  v194[1] = 0x100000001;
                                                                  int v193 = 0;
                                                                  v194[0] = 0x100000001;
                                                                  int v11 = 1;
                                                                  int v189 = 1;
                                                                  int v191 = 1;
                                                                  int v186 = 1;
                                                                  int v187 = 1;
                                                                  int v181 = 1;
                                                                  int v184 = 1;
                                                                  int v173 = 1;
                                                                  int v167 = 1;
                                                                  int v175 = 1;
                                                                  int v179 = 1;
                                                                  int v168 = 1;
                                                                  int v176 = 1;
                                                                  int v164 = 1;
                                                                  int v170 = 1;
                                                                  int v162 = 1;
                                                                  int v163 = 1;
                                                                  int v165 = 1;
                                                                  int v171 = 1;
                                                                  int v166 = 1;
                                                                  int v174 = 1;
                                                                  int v169 = 1;
                                                                  int v177 = 1;
                                                                  int v172 = 1;
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v43 = [(SFActionItem *)self messageIdentifier];
                                                                  BOOL v202 = v43 != 0;
                                                                  v72 = (void *)v43;
                                                                  if (!v43
                                                                    || (-[SFActionItem messageIdentifier](self, "messageIdentifier"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem messageIdentifier](v7, "messageIdentifier"), v80 = (void *)v3, v78 = objc_claimAutoreleasedReturnValue(), objc_msgSend((id)v3, "isEqual:")))
                                                                  {
                                                                    v71 = [(SFActionItem *)self messageURL];
                                                                    uint64_t v3 = v71 == 0;
                                                                    v70 = [(SFActionItem *)v7 messageURL];
                                                                    if (v3 == (v70 != 0))
                                                                    {
                                                                      int v183 = 0;
                                                                      BOOL v200 = 0;
                                                                      int v182 = 0;
                                                                      int v185 = 0;
                                                                      BOOL v199 = 0;
                                                                      int v188 = 0;
                                                                      int v190 = 0;
                                                                      BOOL v197 = 0;
                                                                      int v192 = 0;
                                                                      int v12 = 0;
                                                                      int v13 = 0;
                                                                      int v14 = 0;
                                                                      BOOL v15 = 0;
                                                                      int v201 = 1;
                                                                      int v198 = 1;
                                                                      BOOL v195 = 0;
                                                                      int v196 = 1;
                                                                      v194[2] = 0x100000001;
                                                                      v194[1] = 0x100000001;
                                                                      int v193 = 0;
                                                                      v194[0] = 0x100000001;
                                                                      int v11 = 1;
                                                                      int v189 = 1;
                                                                      int v191 = 1;
                                                                      int v186 = 1;
                                                                      int v187 = 1;
                                                                      int v181 = 1;
                                                                      int v184 = 1;
                                                                      int v173 = 1;
                                                                      int v167 = 1;
                                                                      int v175 = 1;
                                                                      int v179 = 1;
                                                                      int v168 = 1;
                                                                      int v176 = 1;
                                                                      int v164 = 1;
                                                                      int v170 = 1;
                                                                      int v162 = 1;
                                                                      int v163 = 1;
                                                                      int v165 = 1;
                                                                      int v171 = 1;
                                                                      int v166 = 1;
                                                                      int v174 = 1;
                                                                      int v169 = 1;
                                                                      int v177 = 1;
                                                                      int v172 = 1;
                                                                      int v180 = 1;
                                                                      int v178 = 1;
                                                                    }
                                                                    else
                                                                    {
                                                                      uint64_t v44 = [(SFActionItem *)self messageURL];
                                                                      BOOL v200 = v44 != 0;
                                                                      v67 = (void *)v44;
                                                                      if (!v44
                                                                        || (-[SFActionItem messageURL](self, "messageURL"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem messageURL](v7, "messageURL"), v73 = objc_claimAutoreleasedReturnValue(), v74 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                      {
                                                                        v66 = [(SFActionItem *)self persistentID];
                                                                        uint64_t v3 = v66 == 0;
                                                                        v65 = [(SFActionItem *)v7 persistentID];
                                                                        if (v3 == (v65 != 0))
                                                                        {
                                                                          int v185 = 0;
                                                                          BOOL v199 = 0;
                                                                          int v188 = 0;
                                                                          int v190 = 0;
                                                                          BOOL v197 = 0;
                                                                          int v192 = 0;
                                                                          int v12 = 0;
                                                                          int v13 = 0;
                                                                          int v14 = 0;
                                                                          BOOL v15 = 0;
                                                                          int v201 = 1;
                                                                          int v198 = 1;
                                                                          BOOL v195 = 0;
                                                                          int v196 = 1;
                                                                          v194[2] = 0x100000001;
                                                                          v194[1] = 0x100000001;
                                                                          int v193 = 0;
                                                                          v194[0] = 0x100000001;
                                                                          int v11 = 1;
                                                                          int v189 = 1;
                                                                          int v191 = 1;
                                                                          int v186 = 1;
                                                                          int v187 = 1;
                                                                          int v181 = 1;
                                                                          int v184 = 1;
                                                                          int v173 = 1;
                                                                          int v167 = 1;
                                                                          int v175 = 1;
                                                                          int v179 = 1;
                                                                          int v168 = 1;
                                                                          int v176 = 1;
                                                                          int v164 = 1;
                                                                          int v170 = 1;
                                                                          int v162 = 1;
                                                                          int v163 = 1;
                                                                          int v165 = 1;
                                                                          int v171 = 1;
                                                                          int v166 = 1;
                                                                          int v174 = 1;
                                                                          int v169 = 1;
                                                                          int v177 = 1;
                                                                          int v172 = 1;
                                                                          int v180 = 1;
                                                                          int v178 = 1;
                                                                          int v183 = 1;
                                                                          int v182 = 1;
                                                                        }
                                                                        else
                                                                        {
                                                                          uint64_t v45 = [(SFActionItem *)self persistentID];
                                                                          BOOL v199 = v45 != 0;
                                                                          v64 = (void *)v45;
                                                                          if (!v45
                                                                            || (-[SFActionItem persistentID](self, "persistentID"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem persistentID](v7, "persistentID"), v68 = objc_claimAutoreleasedReturnValue(), v69 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                          {
                                                                            uint64_t v3 = [(SFActionItem *)self mediaEntityType];
                                                                            if (v3 == [(SFActionItem *)v7 mediaEntityType])
                                                                            {
                                                                              v61 = [(SFActionItem *)self universalLibraryID];
                                                                              uint64_t v3 = v61 == 0;
                                                                              v60 = [(SFActionItem *)v7 universalLibraryID];
                                                                              if (v3 == (v60 != 0))
                                                                              {
                                                                                int v190 = 0;
                                                                                BOOL v197 = 0;
                                                                                int v192 = 0;
                                                                                int v12 = 0;
                                                                                int v13 = 0;
                                                                                int v14 = 0;
                                                                                BOOL v15 = 0;
                                                                                int v201 = 1;
                                                                                int v198 = 1;
                                                                                BOOL v195 = 0;
                                                                                int v196 = 1;
                                                                                v194[2] = 0x100000001;
                                                                                v194[1] = 0x100000001;
                                                                                int v193 = 0;
                                                                                v194[0] = 0x100000001;
                                                                                int v11 = 1;
                                                                                int v189 = 1;
                                                                                int v191 = 1;
                                                                                int v186 = 1;
                                                                                int v187 = 1;
                                                                                int v181 = 1;
                                                                                int v184 = 1;
                                                                                int v173 = 1;
                                                                                int v167 = 1;
                                                                                int v175 = 1;
                                                                                int v179 = 1;
                                                                                int v168 = 1;
                                                                                int v176 = 1;
                                                                                int v164 = 1;
                                                                                int v170 = 1;
                                                                                int v162 = 1;
                                                                                int v163 = 1;
                                                                                int v165 = 1;
                                                                                int v171 = 1;
                                                                                int v166 = 1;
                                                                                int v174 = 1;
                                                                                int v169 = 1;
                                                                                int v177 = 1;
                                                                                int v172 = 1;
                                                                                int v180 = 1;
                                                                                int v178 = 1;
                                                                                int v183 = 1;
                                                                                int v182 = 1;
                                                                                int v185 = 1;
                                                                                int v188 = 1;
                                                                              }
                                                                              else
                                                                              {
                                                                                uint64_t v46 = [(SFActionItem *)self universalLibraryID];
                                                                                BOOL v197 = v46 != 0;
                                                                                v59 = (void *)v46;
                                                                                if (!v46
                                                                                  || (-[SFActionItem universalLibraryID](self, "universalLibraryID"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem universalLibraryID](v7, "universalLibraryID"), v62 = objc_claimAutoreleasedReturnValue(), v63 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                                {
                                                                                  v56 = [(SFActionItem *)self interactionContentType];
                                                                                  uint64_t v3 = v56 == 0;
                                                                                  v55 = [(SFActionItem *)v7 interactionContentType];
                                                                                  if (v3 == (v55 != 0))
                                                                                  {
                                                                                    int v12 = 0;
                                                                                    int v13 = 0;
                                                                                    int v14 = 0;
                                                                                    BOOL v15 = 0;
                                                                                    int v201 = 1;
                                                                                    int v198 = 1;
                                                                                    BOOL v195 = 0;
                                                                                    int v196 = 1;
                                                                                    v194[2] = 0x100000001;
                                                                                    v194[1] = 0x100000001;
                                                                                    int v193 = 0;
                                                                                    v194[0] = 0x100000001;
                                                                                    int v11 = 1;
                                                                                    int v189 = 1;
                                                                                    int v191 = 1;
                                                                                    int v186 = 1;
                                                                                    int v187 = 1;
                                                                                    int v181 = 1;
                                                                                    int v184 = 1;
                                                                                    int v173 = 1;
                                                                                    int v167 = 1;
                                                                                    int v175 = 1;
                                                                                    int v179 = 1;
                                                                                    int v168 = 1;
                                                                                    int v176 = 1;
                                                                                    int v164 = 1;
                                                                                    int v170 = 1;
                                                                                    int v162 = 1;
                                                                                    int v163 = 1;
                                                                                    int v165 = 1;
                                                                                    int v171 = 1;
                                                                                    int v166 = 1;
                                                                                    int v174 = 1;
                                                                                    int v169 = 1;
                                                                                    int v177 = 1;
                                                                                    int v172 = 1;
                                                                                    int v180 = 1;
                                                                                    int v178 = 1;
                                                                                    int v183 = 1;
                                                                                    int v182 = 1;
                                                                                    int v185 = 1;
                                                                                    int v188 = 1;
                                                                                    int v190 = 1;
                                                                                    int v192 = 1;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    uint64_t v47 = [(SFActionItem *)self interactionContentType];
                                                                                    BOOL v195 = v47 != 0;
                                                                                    v54 = (void *)v47;
                                                                                    if (!v47
                                                                                      || (-[SFActionItem interactionContentType](self, "interactionContentType"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem interactionContentType](v7, "interactionContentType"), v57 = objc_claimAutoreleasedReturnValue(), v58 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                                    {
                                                                                      uint64_t v4 = [(SFActionItem *)self customDirectionsPunchout];
                                                                                      uint64_t v3 = v4 == 0;
                                                                                      uint64_t v8 = [(SFActionItem *)v7 customDirectionsPunchout];
                                                                                      if (v3 == (v8 != 0))
                                                                                      {
                                                                                        int v13 = 0;
                                                                                        int v14 = 0;
                                                                                        BOOL v15 = 0;
                                                                                        int v201 = 1;
                                                                                        int v198 = 1;
                                                                                        int v196 = 1;
                                                                                        v194[2] = 0x100000001;
                                                                                        v194[1] = 0x100000001;
                                                                                        v194[0] = 0x100000001;
                                                                                        int v11 = 1;
                                                                                        int v189 = 1;
                                                                                        int v191 = 1;
                                                                                        int v186 = 1;
                                                                                        int v187 = 1;
                                                                                        int v181 = 1;
                                                                                        int v184 = 1;
                                                                                        int v173 = 1;
                                                                                        int v167 = 1;
                                                                                        int v175 = 1;
                                                                                        int v179 = 1;
                                                                                        int v168 = 1;
                                                                                        int v176 = 1;
                                                                                        int v164 = 1;
                                                                                        int v170 = 1;
                                                                                        int v162 = 1;
                                                                                        int v163 = 1;
                                                                                        int v165 = 1;
                                                                                        int v171 = 1;
                                                                                        int v166 = 1;
                                                                                        int v174 = 1;
                                                                                        int v169 = 1;
                                                                                        int v177 = 1;
                                                                                        int v172 = 1;
                                                                                        int v180 = 1;
                                                                                        int v178 = 1;
                                                                                        int v183 = 1;
                                                                                        int v182 = 1;
                                                                                        int v185 = 1;
                                                                                        int v188 = 1;
                                                                                        int v190 = 1;
                                                                                        int v192 = 1;
                                                                                        int v193 = 1;
                                                                                        int v12 = 1;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        uint64_t v9 = [(SFActionItem *)self customDirectionsPunchout];
                                                                                        if (!v9
                                                                                          || (-[SFActionItem customDirectionsPunchout](self, "customDirectionsPunchout"), v48 = objc_claimAutoreleasedReturnValue(), -[SFActionItem customDirectionsPunchout](v7, "customDirectionsPunchout"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), v53 = v48, [v48 isEqual:v3]))
                                                                                        {
                                                                                          LODWORD(v51) = v9 != 0;
                                                                                          BOOL v49 = [(SFActionItem *)self shouldSearchDirectionsAlongCurrentRoute];
                                                                                          if (v49 == [(SFActionItem *)v7 shouldSearchDirectionsAlongCurrentRoute])
                                                                                          {
                                                                                            int v50 = [(SFActionItem *)self directionsMode];
                                                                                            BOOL v15 = v50 == [(SFActionItem *)v7 directionsMode];
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            BOOL v15 = 0;
                                                                                          }
                                                                                          int v201 = 1;
                                                                                          int v198 = 1;
                                                                                          int v196 = 1;
                                                                                          v194[2] = 0x100000001;
                                                                                          v194[1] = 0x100000001;
                                                                                          v194[0] = 0x100000001;
                                                                                          int v11 = 1;
                                                                                          int v189 = 1;
                                                                                          int v191 = 1;
                                                                                          int v186 = 1;
                                                                                          int v187 = 1;
                                                                                          int v181 = 1;
                                                                                          int v184 = 1;
                                                                                          int v173 = 1;
                                                                                          int v167 = 1;
                                                                                          int v175 = 1;
                                                                                          int v179 = 1;
                                                                                          int v168 = 1;
                                                                                          int v176 = 1;
                                                                                          int v164 = 1;
                                                                                          int v170 = 1;
                                                                                          int v162 = 1;
                                                                                          int v163 = 1;
                                                                                          int v165 = 1;
                                                                                          int v171 = 1;
                                                                                          int v166 = 1;
                                                                                          int v174 = 1;
                                                                                          int v169 = 1;
                                                                                          int v177 = 1;
                                                                                          int v172 = 1;
                                                                                          int v180 = 1;
                                                                                          int v178 = 1;
                                                                                          int v183 = 1;
                                                                                          int v182 = 1;
                                                                                          int v185 = 1;
                                                                                          int v188 = 1;
                                                                                          int v190 = 1;
                                                                                          int v192 = 1;
                                                                                          int v193 = 1;
                                                                                          int v12 = 1;
                                                                                          int v13 = 1;
                                                                                          int v14 = v52;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          BOOL v15 = 0;
                                                                                          int v201 = 1;
                                                                                          int v198 = 1;
                                                                                          int v196 = 1;
                                                                                          v194[2] = 0x100000001;
                                                                                          v194[1] = 0x100000001;
                                                                                          v194[0] = 0x100000001;
                                                                                          int v11 = 1;
                                                                                          int v189 = 1;
                                                                                          int v191 = 1;
                                                                                          int v186 = 1;
                                                                                          int v187 = 1;
                                                                                          int v181 = 1;
                                                                                          int v184 = 1;
                                                                                          int v173 = 1;
                                                                                          int v167 = 1;
                                                                                          int v175 = 1;
                                                                                          int v179 = 1;
                                                                                          int v168 = 1;
                                                                                          int v176 = 1;
                                                                                          int v164 = 1;
                                                                                          int v170 = 1;
                                                                                          int v162 = 1;
                                                                                          int v163 = 1;
                                                                                          int v165 = 1;
                                                                                          int v171 = 1;
                                                                                          int v166 = 1;
                                                                                          int v174 = 1;
                                                                                          int v169 = 1;
                                                                                          int v177 = 1;
                                                                                          int v172 = 1;
                                                                                          int v180 = 1;
                                                                                          int v178 = 1;
                                                                                          int v183 = 1;
                                                                                          int v182 = 1;
                                                                                          int v185 = 1;
                                                                                          int v188 = 1;
                                                                                          int v190 = 1;
                                                                                          int v192 = 1;
                                                                                          int v193 = 1;
                                                                                          int v12 = 1;
                                                                                          int v13 = 1;
                                                                                          int v14 = 1;
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      int v12 = 0;
                                                                                      int v13 = 0;
                                                                                      int v14 = 0;
                                                                                      BOOL v15 = 0;
                                                                                      int v201 = 1;
                                                                                      int v198 = 1;
                                                                                      int v196 = 1;
                                                                                      v194[2] = 0x100000001;
                                                                                      v194[1] = 0x100000001;
                                                                                      v194[0] = 0x100000001;
                                                                                      int v11 = 1;
                                                                                      int v189 = 1;
                                                                                      int v191 = 1;
                                                                                      int v186 = 1;
                                                                                      int v187 = 1;
                                                                                      int v181 = 1;
                                                                                      int v184 = 1;
                                                                                      int v173 = 1;
                                                                                      int v167 = 1;
                                                                                      int v175 = 1;
                                                                                      int v179 = 1;
                                                                                      int v168 = 1;
                                                                                      int v176 = 1;
                                                                                      int v164 = 1;
                                                                                      int v170 = 1;
                                                                                      int v162 = 1;
                                                                                      int v163 = 1;
                                                                                      int v165 = 1;
                                                                                      int v171 = 1;
                                                                                      int v166 = 1;
                                                                                      int v174 = 1;
                                                                                      int v169 = 1;
                                                                                      int v177 = 1;
                                                                                      int v172 = 1;
                                                                                      int v180 = 1;
                                                                                      int v178 = 1;
                                                                                      int v183 = 1;
                                                                                      int v182 = 1;
                                                                                      int v185 = 1;
                                                                                      int v188 = 1;
                                                                                      int v190 = 1;
                                                                                      int v192 = 1;
                                                                                      int v193 = 1;
                                                                                      BOOL v195 = 1;
                                                                                    }
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  int v192 = 0;
                                                                                  int v12 = 0;
                                                                                  int v13 = 0;
                                                                                  int v14 = 0;
                                                                                  BOOL v15 = 0;
                                                                                  int v201 = 1;
                                                                                  int v198 = 1;
                                                                                  BOOL v195 = 0;
                                                                                  int v196 = 1;
                                                                                  v194[2] = 0x100000001;
                                                                                  v194[1] = 0x100000001;
                                                                                  int v193 = 0;
                                                                                  v194[0] = 0x100000001;
                                                                                  int v11 = 1;
                                                                                  int v189 = 1;
                                                                                  int v191 = 1;
                                                                                  int v186 = 1;
                                                                                  int v187 = 1;
                                                                                  int v181 = 1;
                                                                                  int v184 = 1;
                                                                                  int v173 = 1;
                                                                                  int v167 = 1;
                                                                                  int v175 = 1;
                                                                                  int v179 = 1;
                                                                                  int v168 = 1;
                                                                                  int v176 = 1;
                                                                                  int v164 = 1;
                                                                                  int v170 = 1;
                                                                                  int v162 = 1;
                                                                                  int v163 = 1;
                                                                                  int v165 = 1;
                                                                                  int v171 = 1;
                                                                                  int v166 = 1;
                                                                                  int v174 = 1;
                                                                                  int v169 = 1;
                                                                                  int v177 = 1;
                                                                                  int v172 = 1;
                                                                                  int v180 = 1;
                                                                                  int v178 = 1;
                                                                                  int v183 = 1;
                                                                                  int v182 = 1;
                                                                                  int v185 = 1;
                                                                                  int v188 = 1;
                                                                                  int v190 = 1;
                                                                                  BOOL v197 = 1;
                                                                                }
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              int v188 = 0;
                                                                              int v190 = 0;
                                                                              BOOL v197 = 0;
                                                                              int v192 = 0;
                                                                              int v12 = 0;
                                                                              int v13 = 0;
                                                                              int v14 = 0;
                                                                              BOOL v15 = 0;
                                                                              int v201 = 1;
                                                                              int v198 = 1;
                                                                              BOOL v195 = 0;
                                                                              int v196 = 1;
                                                                              v194[2] = 0x100000001;
                                                                              v194[1] = 0x100000001;
                                                                              int v193 = 0;
                                                                              v194[0] = 0x100000001;
                                                                              int v11 = 1;
                                                                              int v189 = 1;
                                                                              int v191 = 1;
                                                                              int v186 = 1;
                                                                              int v187 = 1;
                                                                              int v181 = 1;
                                                                              int v184 = 1;
                                                                              int v173 = 1;
                                                                              int v167 = 1;
                                                                              int v175 = 1;
                                                                              int v179 = 1;
                                                                              int v168 = 1;
                                                                              int v176 = 1;
                                                                              int v164 = 1;
                                                                              int v170 = 1;
                                                                              int v162 = 1;
                                                                              int v163 = 1;
                                                                              int v165 = 1;
                                                                              int v171 = 1;
                                                                              int v166 = 1;
                                                                              int v174 = 1;
                                                                              int v169 = 1;
                                                                              int v177 = 1;
                                                                              int v172 = 1;
                                                                              int v180 = 1;
                                                                              int v178 = 1;
                                                                              int v183 = 1;
                                                                              int v182 = 1;
                                                                              int v185 = 1;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            int v188 = 0;
                                                                            int v190 = 0;
                                                                            BOOL v197 = 0;
                                                                            int v192 = 0;
                                                                            int v12 = 0;
                                                                            int v13 = 0;
                                                                            int v14 = 0;
                                                                            BOOL v15 = 0;
                                                                            int v201 = 1;
                                                                            int v198 = 1;
                                                                            BOOL v195 = 0;
                                                                            int v196 = 1;
                                                                            v194[2] = 0x100000001;
                                                                            v194[1] = 0x100000001;
                                                                            int v193 = 0;
                                                                            v194[0] = 0x100000001;
                                                                            int v11 = 1;
                                                                            int v189 = 1;
                                                                            int v191 = 1;
                                                                            int v186 = 1;
                                                                            int v187 = 1;
                                                                            int v181 = 1;
                                                                            int v184 = 1;
                                                                            int v173 = 1;
                                                                            int v167 = 1;
                                                                            int v175 = 1;
                                                                            int v179 = 1;
                                                                            int v168 = 1;
                                                                            int v176 = 1;
                                                                            int v164 = 1;
                                                                            int v170 = 1;
                                                                            int v162 = 1;
                                                                            int v163 = 1;
                                                                            int v165 = 1;
                                                                            int v171 = 1;
                                                                            int v166 = 1;
                                                                            int v174 = 1;
                                                                            int v169 = 1;
                                                                            int v177 = 1;
                                                                            int v172 = 1;
                                                                            int v180 = 1;
                                                                            int v178 = 1;
                                                                            int v183 = 1;
                                                                            int v182 = 1;
                                                                            int v185 = 1;
                                                                            BOOL v199 = 1;
                                                                          }
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        int v182 = 0;
                                                                        int v185 = 0;
                                                                        BOOL v199 = 0;
                                                                        int v188 = 0;
                                                                        int v190 = 0;
                                                                        BOOL v197 = 0;
                                                                        int v192 = 0;
                                                                        int v12 = 0;
                                                                        int v13 = 0;
                                                                        int v14 = 0;
                                                                        BOOL v15 = 0;
                                                                        int v201 = 1;
                                                                        int v198 = 1;
                                                                        BOOL v195 = 0;
                                                                        int v196 = 1;
                                                                        v194[2] = 0x100000001;
                                                                        v194[1] = 0x100000001;
                                                                        int v193 = 0;
                                                                        v194[0] = 0x100000001;
                                                                        int v11 = 1;
                                                                        int v189 = 1;
                                                                        int v191 = 1;
                                                                        int v186 = 1;
                                                                        int v187 = 1;
                                                                        int v181 = 1;
                                                                        int v184 = 1;
                                                                        int v173 = 1;
                                                                        int v167 = 1;
                                                                        int v175 = 1;
                                                                        int v179 = 1;
                                                                        int v168 = 1;
                                                                        int v176 = 1;
                                                                        int v164 = 1;
                                                                        int v170 = 1;
                                                                        int v162 = 1;
                                                                        int v163 = 1;
                                                                        int v165 = 1;
                                                                        int v171 = 1;
                                                                        int v166 = 1;
                                                                        int v174 = 1;
                                                                        int v169 = 1;
                                                                        int v177 = 1;
                                                                        int v172 = 1;
                                                                        int v180 = 1;
                                                                        int v178 = 1;
                                                                        int v183 = 1;
                                                                        BOOL v200 = 1;
                                                                      }
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    int v178 = 0;
                                                                    int v183 = 0;
                                                                    BOOL v200 = 0;
                                                                    int v182 = 0;
                                                                    int v185 = 0;
                                                                    BOOL v199 = 0;
                                                                    int v188 = 0;
                                                                    int v190 = 0;
                                                                    BOOL v197 = 0;
                                                                    int v192 = 0;
                                                                    int v12 = 0;
                                                                    int v13 = 0;
                                                                    int v14 = 0;
                                                                    BOOL v15 = 0;
                                                                    int v201 = 1;
                                                                    int v198 = 1;
                                                                    BOOL v195 = 0;
                                                                    int v196 = 1;
                                                                    v194[2] = 0x100000001;
                                                                    v194[1] = 0x100000001;
                                                                    int v193 = 0;
                                                                    v194[0] = 0x100000001;
                                                                    int v11 = 1;
                                                                    int v189 = 1;
                                                                    int v191 = 1;
                                                                    int v186 = 1;
                                                                    int v187 = 1;
                                                                    int v181 = 1;
                                                                    int v184 = 1;
                                                                    int v173 = 1;
                                                                    int v167 = 1;
                                                                    int v175 = 1;
                                                                    int v179 = 1;
                                                                    int v168 = 1;
                                                                    int v176 = 1;
                                                                    int v164 = 1;
                                                                    int v170 = 1;
                                                                    int v162 = 1;
                                                                    int v163 = 1;
                                                                    int v165 = 1;
                                                                    int v171 = 1;
                                                                    int v166 = 1;
                                                                    int v174 = 1;
                                                                    int v169 = 1;
                                                                    int v177 = 1;
                                                                    int v172 = 1;
                                                                    int v180 = 1;
                                                                    BOOL v202 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                int v172 = 0;
                                                                int v180 = 0;
                                                                BOOL v202 = 0;
                                                                int v178 = 0;
                                                                int v183 = 0;
                                                                BOOL v200 = 0;
                                                                int v182 = 0;
                                                                int v185 = 0;
                                                                BOOL v199 = 0;
                                                                int v188 = 0;
                                                                int v190 = 0;
                                                                BOOL v197 = 0;
                                                                int v192 = 0;
                                                                int v12 = 0;
                                                                int v13 = 0;
                                                                int v14 = 0;
                                                                BOOL v15 = 0;
                                                                int v201 = 1;
                                                                int v198 = 1;
                                                                BOOL v195 = 0;
                                                                int v196 = 1;
                                                                v194[2] = 0x100000001;
                                                                v194[1] = 0x100000001;
                                                                int v193 = 0;
                                                                v194[0] = 0x100000001;
                                                                int v11 = 1;
                                                                int v189 = 1;
                                                                int v191 = 1;
                                                                int v186 = 1;
                                                                int v187 = 1;
                                                                int v181 = 1;
                                                                int v184 = 1;
                                                                int v173 = 1;
                                                                int v167 = 1;
                                                                int v175 = 1;
                                                                int v179 = 1;
                                                                int v168 = 1;
                                                                int v176 = 1;
                                                                int v164 = 1;
                                                                int v170 = 1;
                                                                int v162 = 1;
                                                                int v163 = 1;
                                                                int v165 = 1;
                                                                int v171 = 1;
                                                                int v166 = 1;
                                                                int v174 = 1;
                                                                int v169 = 1;
                                                                int v177 = 1;
                                                                BOOL v203 = 1;
                                                              }
                                                            }
                                                          }
                                                          else
                                                          {
                                                            int v169 = 0;
                                                            int v177 = 0;
                                                            BOOL v203 = 0;
                                                            int v172 = 0;
                                                            int v180 = 0;
                                                            BOOL v202 = 0;
                                                            int v178 = 0;
                                                            int v183 = 0;
                                                            BOOL v200 = 0;
                                                            int v182 = 0;
                                                            int v185 = 0;
                                                            BOOL v199 = 0;
                                                            int v188 = 0;
                                                            int v190 = 0;
                                                            BOOL v197 = 0;
                                                            int v192 = 0;
                                                            int v12 = 0;
                                                            int v13 = 0;
                                                            int v14 = 0;
                                                            BOOL v15 = 0;
                                                            int v201 = 1;
                                                            int v198 = 1;
                                                            BOOL v195 = 0;
                                                            int v196 = 1;
                                                            v194[2] = 0x100000001;
                                                            v194[1] = 0x100000001;
                                                            int v193 = 0;
                                                            v194[0] = 0x100000001;
                                                            int v11 = 1;
                                                            int v189 = 1;
                                                            int v191 = 1;
                                                            int v186 = 1;
                                                            int v187 = 1;
                                                            int v181 = 1;
                                                            int v184 = 1;
                                                            int v173 = 1;
                                                            int v167 = 1;
                                                            int v175 = 1;
                                                            int v179 = 1;
                                                            int v168 = 1;
                                                            int v176 = 1;
                                                            int v164 = 1;
                                                            int v170 = 1;
                                                            int v162 = 1;
                                                            int v163 = 1;
                                                            int v165 = 1;
                                                            int v171 = 1;
                                                            int v166 = 1;
                                                            int v174 = 1;
                                                            BOOL v204 = 1;
                                                          }
                                                        }
                                                      }
                                                      else
                                                      {
                                                        int v166 = 0;
                                                        int v174 = 0;
                                                        BOOL v204 = 0;
                                                        int v169 = 0;
                                                        int v177 = 0;
                                                        BOOL v203 = 0;
                                                        int v172 = 0;
                                                        int v180 = 0;
                                                        BOOL v202 = 0;
                                                        int v178 = 0;
                                                        int v183 = 0;
                                                        BOOL v200 = 0;
                                                        int v182 = 0;
                                                        int v185 = 0;
                                                        BOOL v199 = 0;
                                                        int v188 = 0;
                                                        int v190 = 0;
                                                        BOOL v197 = 0;
                                                        int v192 = 0;
                                                        int v12 = 0;
                                                        int v13 = 0;
                                                        int v14 = 0;
                                                        BOOL v15 = 0;
                                                        int v201 = 1;
                                                        int v198 = 1;
                                                        BOOL v195 = 0;
                                                        int v196 = 1;
                                                        v194[2] = 0x100000001;
                                                        v194[1] = 0x100000001;
                                                        int v193 = 0;
                                                        v194[0] = 0x100000001;
                                                        int v11 = 1;
                                                        int v189 = 1;
                                                        int v191 = 1;
                                                        int v186 = 1;
                                                        int v187 = 1;
                                                        int v181 = 1;
                                                        int v184 = 1;
                                                        int v173 = 1;
                                                        int v167 = 1;
                                                        int v175 = 1;
                                                        int v179 = 1;
                                                        int v168 = 1;
                                                        int v176 = 1;
                                                        int v164 = 1;
                                                        int v170 = 1;
                                                        int v162 = 1;
                                                        int v163 = 1;
                                                        int v165 = 1;
                                                        int v171 = 1;
                                                        BOOL v205 = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    int v165 = 0;
                                                    int v171 = 0;
                                                    BOOL v205 = 0;
                                                    int v166 = 0;
                                                    int v174 = 0;
                                                    BOOL v204 = 0;
                                                    int v169 = 0;
                                                    int v177 = 0;
                                                    BOOL v203 = 0;
                                                    int v172 = 0;
                                                    int v180 = 0;
                                                    BOOL v202 = 0;
                                                    int v178 = 0;
                                                    int v183 = 0;
                                                    BOOL v200 = 0;
                                                    int v182 = 0;
                                                    int v185 = 0;
                                                    BOOL v199 = 0;
                                                    int v188 = 0;
                                                    int v190 = 0;
                                                    BOOL v197 = 0;
                                                    int v192 = 0;
                                                    int v12 = 0;
                                                    int v13 = 0;
                                                    int v14 = 0;
                                                    BOOL v15 = 0;
                                                    int v201 = 1;
                                                    int v198 = 1;
                                                    BOOL v195 = 0;
                                                    int v196 = 1;
                                                    v194[2] = 0x100000001;
                                                    v194[1] = 0x100000001;
                                                    int v193 = 0;
                                                    v194[0] = 0x100000001;
                                                    int v11 = 1;
                                                    int v189 = 1;
                                                    int v191 = 1;
                                                    int v186 = 1;
                                                    int v187 = 1;
                                                    int v181 = 1;
                                                    int v184 = 1;
                                                    int v173 = 1;
                                                    int v167 = 1;
                                                    int v175 = 1;
                                                    int v179 = 1;
                                                    int v168 = 1;
                                                    int v176 = 1;
                                                    int v164 = 1;
                                                    int v170 = 1;
                                                    int v162 = 1;
                                                    int v163 = 1;
                                                  }
                                                }
                                                else
                                                {
                                                  int v165 = 0;
                                                  int v171 = 0;
                                                  BOOL v205 = 0;
                                                  int v166 = 0;
                                                  int v174 = 0;
                                                  BOOL v204 = 0;
                                                  int v169 = 0;
                                                  int v177 = 0;
                                                  BOOL v203 = 0;
                                                  int v172 = 0;
                                                  int v180 = 0;
                                                  BOOL v202 = 0;
                                                  int v178 = 0;
                                                  int v183 = 0;
                                                  BOOL v200 = 0;
                                                  int v182 = 0;
                                                  int v185 = 0;
                                                  BOOL v199 = 0;
                                                  int v188 = 0;
                                                  int v190 = 0;
                                                  BOOL v197 = 0;
                                                  int v192 = 0;
                                                  int v12 = 0;
                                                  int v13 = 0;
                                                  int v14 = 0;
                                                  BOOL v15 = 0;
                                                  int v201 = 1;
                                                  int v198 = 1;
                                                  BOOL v195 = 0;
                                                  int v196 = 1;
                                                  v194[2] = 0x100000001;
                                                  v194[1] = 0x100000001;
                                                  int v193 = 0;
                                                  v194[0] = 0x100000001;
                                                  int v11 = 1;
                                                  int v189 = 1;
                                                  int v191 = 1;
                                                  int v186 = 1;
                                                  int v187 = 1;
                                                  int v181 = 1;
                                                  int v184 = 1;
                                                  int v173 = 1;
                                                  int v167 = 1;
                                                  int v175 = 1;
                                                  int v179 = 1;
                                                  int v168 = 1;
                                                  int v176 = 1;
                                                  int v164 = 1;
                                                  int v170 = 1;
                                                  int v162 = 1;
                                                  int v163 = 1;
                                                  BOOL v206 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              int v162 = 0;
                                              int v163 = 0;
                                              BOOL v206 = 0;
                                              int v165 = 0;
                                              int v171 = 0;
                                              BOOL v205 = 0;
                                              int v166 = 0;
                                              int v174 = 0;
                                              BOOL v204 = 0;
                                              int v169 = 0;
                                              int v177 = 0;
                                              BOOL v203 = 0;
                                              int v172 = 0;
                                              int v180 = 0;
                                              BOOL v202 = 0;
                                              int v178 = 0;
                                              int v183 = 0;
                                              BOOL v200 = 0;
                                              int v182 = 0;
                                              int v185 = 0;
                                              BOOL v199 = 0;
                                              int v188 = 0;
                                              int v190 = 0;
                                              BOOL v197 = 0;
                                              int v192 = 0;
                                              int v12 = 0;
                                              int v13 = 0;
                                              int v14 = 0;
                                              BOOL v15 = 0;
                                              int v201 = 1;
                                              int v198 = 1;
                                              BOOL v195 = 0;
                                              int v196 = 1;
                                              v194[2] = 0x100000001;
                                              v194[1] = 0x100000001;
                                              int v193 = 0;
                                              v194[0] = 0x100000001;
                                              int v11 = 1;
                                              int v189 = 1;
                                              int v191 = 1;
                                              int v186 = 1;
                                              int v187 = 1;
                                              int v181 = 1;
                                              int v184 = 1;
                                              int v173 = 1;
                                              int v167 = 1;
                                              int v175 = 1;
                                              int v179 = 1;
                                              int v168 = 1;
                                              int v176 = 1;
                                              int v164 = 1;
                                              int v170 = 1;
                                              BOOL v207 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          int v164 = 0;
                                          int v170 = 0;
                                          BOOL v207 = 0;
                                          int v162 = 0;
                                          int v163 = 0;
                                          BOOL v206 = 0;
                                          int v165 = 0;
                                          int v171 = 0;
                                          BOOL v205 = 0;
                                          int v166 = 0;
                                          int v174 = 0;
                                          BOOL v204 = 0;
                                          int v169 = 0;
                                          int v177 = 0;
                                          BOOL v203 = 0;
                                          int v172 = 0;
                                          int v180 = 0;
                                          BOOL v202 = 0;
                                          int v178 = 0;
                                          int v183 = 0;
                                          BOOL v200 = 0;
                                          int v182 = 0;
                                          int v185 = 0;
                                          BOOL v199 = 0;
                                          int v188 = 0;
                                          int v190 = 0;
                                          BOOL v197 = 0;
                                          int v192 = 0;
                                          int v12 = 0;
                                          int v13 = 0;
                                          int v14 = 0;
                                          BOOL v15 = 0;
                                          int v201 = 1;
                                          int v198 = 1;
                                          BOOL v195 = 0;
                                          int v196 = 1;
                                          v194[2] = 0x100000001;
                                          v194[1] = 0x100000001;
                                          int v193 = 0;
                                          v194[0] = 0x100000001;
                                          int v11 = 1;
                                          int v189 = 1;
                                          int v191 = 1;
                                          int v186 = 1;
                                          int v187 = 1;
                                          int v181 = 1;
                                          int v184 = 1;
                                          int v173 = 1;
                                          int v167 = 1;
                                          int v175 = 1;
                                          int v179 = 1;
                                          int v168 = 1;
                                          int v176 = 1;
                                          BOOL v213 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      int v168 = 0;
                                      int v176 = 0;
                                      BOOL v213 = 0;
                                      int v164 = 0;
                                      int v170 = 0;
                                      BOOL v207 = 0;
                                      int v162 = 0;
                                      int v163 = 0;
                                      BOOL v206 = 0;
                                      int v165 = 0;
                                      int v171 = 0;
                                      BOOL v205 = 0;
                                      int v166 = 0;
                                      int v174 = 0;
                                      BOOL v204 = 0;
                                      int v169 = 0;
                                      int v177 = 0;
                                      BOOL v203 = 0;
                                      int v172 = 0;
                                      int v180 = 0;
                                      BOOL v202 = 0;
                                      int v178 = 0;
                                      int v183 = 0;
                                      BOOL v200 = 0;
                                      int v182 = 0;
                                      int v185 = 0;
                                      BOOL v199 = 0;
                                      int v188 = 0;
                                      int v190 = 0;
                                      BOOL v197 = 0;
                                      int v192 = 0;
                                      int v12 = 0;
                                      int v13 = 0;
                                      int v14 = 0;
                                      BOOL v15 = 0;
                                      int v201 = 1;
                                      int v198 = 1;
                                      BOOL v195 = 0;
                                      int v196 = 1;
                                      v194[2] = 0x100000001;
                                      v194[1] = 0x100000001;
                                      int v193 = 0;
                                      v194[0] = 0x100000001;
                                      int v11 = 1;
                                      int v189 = 1;
                                      int v191 = 1;
                                      int v186 = 1;
                                      int v187 = 1;
                                      int v181 = 1;
                                      int v184 = 1;
                                      int v173 = 1;
                                      int v167 = 1;
                                      int v175 = 1;
                                      int v179 = 1;
                                      BOOL v214 = 1;
                                    }
                                  }
                                }
                              }
                              else
                              {
                                int v175 = 0;
                                int v179 = 0;
                                BOOL v214 = 0;
                                int v168 = 0;
                                int v176 = 0;
                                BOOL v213 = 0;
                                int v164 = 0;
                                int v170 = 0;
                                BOOL v207 = 0;
                                int v162 = 0;
                                int v163 = 0;
                                BOOL v206 = 0;
                                int v165 = 0;
                                int v171 = 0;
                                BOOL v205 = 0;
                                int v166 = 0;
                                int v174 = 0;
                                BOOL v204 = 0;
                                int v169 = 0;
                                int v177 = 0;
                                BOOL v203 = 0;
                                int v172 = 0;
                                int v180 = 0;
                                BOOL v202 = 0;
                                int v178 = 0;
                                int v183 = 0;
                                BOOL v200 = 0;
                                int v182 = 0;
                                int v185 = 0;
                                BOOL v199 = 0;
                                int v188 = 0;
                                int v190 = 0;
                                BOOL v197 = 0;
                                int v192 = 0;
                                int v12 = 0;
                                int v13 = 0;
                                int v14 = 0;
                                BOOL v15 = 0;
                                int v201 = 1;
                                int v198 = 1;
                                BOOL v195 = 0;
                                int v196 = 1;
                                v194[2] = 0x100000001;
                                v194[1] = 0x100000001;
                                int v193 = 0;
                                v194[0] = 0x100000001;
                                int v11 = 1;
                                int v189 = 1;
                                int v191 = 1;
                                int v186 = 1;
                                int v187 = 1;
                                int v181 = 1;
                                int v184 = 1;
                                int v173 = 1;
                                int v167 = 1;
                                BOOL v215 = 1;
                              }
                            }
                          }
                          else
                          {
                            int v173 = 0;
                            int v167 = 0;
                            BOOL v215 = 0;
                            int v175 = 0;
                            int v179 = 0;
                            BOOL v214 = 0;
                            int v168 = 0;
                            int v176 = 0;
                            BOOL v213 = 0;
                            int v164 = 0;
                            int v170 = 0;
                            BOOL v207 = 0;
                            int v162 = 0;
                            int v163 = 0;
                            BOOL v206 = 0;
                            int v165 = 0;
                            int v171 = 0;
                            BOOL v205 = 0;
                            int v166 = 0;
                            int v174 = 0;
                            BOOL v204 = 0;
                            int v169 = 0;
                            int v177 = 0;
                            BOOL v203 = 0;
                            int v172 = 0;
                            int v180 = 0;
                            BOOL v202 = 0;
                            int v178 = 0;
                            int v183 = 0;
                            BOOL v200 = 0;
                            int v182 = 0;
                            int v185 = 0;
                            BOOL v199 = 0;
                            int v188 = 0;
                            int v190 = 0;
                            BOOL v197 = 0;
                            int v192 = 0;
                            int v12 = 0;
                            int v13 = 0;
                            int v14 = 0;
                            BOOL v15 = 0;
                            int v201 = 1;
                            int v198 = 1;
                            BOOL v195 = 0;
                            int v196 = 1;
                            v194[2] = 0x100000001;
                            v194[1] = 0x100000001;
                            int v193 = 0;
                            v194[0] = 0x100000001;
                            int v11 = 1;
                            int v189 = 1;
                            int v191 = 1;
                            int v186 = 1;
                            int v187 = 1;
                            int v181 = 1;
                            int v184 = 1;
                            BOOL v216 = 1;
                          }
                        }
                      }
                      else
                      {
                        int v181 = 0;
                        int v184 = 0;
                        BOOL v216 = 0;
                        int v173 = 0;
                        int v167 = 0;
                        BOOL v215 = 0;
                        int v175 = 0;
                        int v179 = 0;
                        BOOL v214 = 0;
                        int v168 = 0;
                        int v176 = 0;
                        BOOL v213 = 0;
                        int v164 = 0;
                        int v170 = 0;
                        BOOL v207 = 0;
                        int v162 = 0;
                        int v163 = 0;
                        BOOL v206 = 0;
                        int v165 = 0;
                        int v171 = 0;
                        BOOL v205 = 0;
                        int v166 = 0;
                        int v174 = 0;
                        BOOL v204 = 0;
                        int v169 = 0;
                        int v177 = 0;
                        BOOL v203 = 0;
                        int v172 = 0;
                        int v180 = 0;
                        BOOL v202 = 0;
                        int v178 = 0;
                        int v183 = 0;
                        BOOL v200 = 0;
                        int v182 = 0;
                        int v185 = 0;
                        BOOL v199 = 0;
                        int v188 = 0;
                        int v190 = 0;
                        BOOL v197 = 0;
                        int v192 = 0;
                        int v12 = 0;
                        int v13 = 0;
                        int v14 = 0;
                        BOOL v15 = 0;
                        int v201 = 1;
                        int v198 = 1;
                        BOOL v195 = 0;
                        int v196 = 1;
                        v194[2] = 0x100000001;
                        v194[1] = 0x100000001;
                        int v193 = 0;
                        v194[0] = 0x100000001;
                        int v11 = 1;
                        int v189 = 1;
                        int v191 = 1;
                        int v186 = 1;
                        int v187 = 1;
                        BOOL v217 = 1;
                      }
                    }
                  }
                  else
                  {
                    int v186 = 0;
                    int v187 = 0;
                    BOOL v217 = 0;
                    int v181 = 0;
                    int v184 = 0;
                    BOOL v216 = 0;
                    int v173 = 0;
                    int v167 = 0;
                    BOOL v215 = 0;
                    int v175 = 0;
                    int v179 = 0;
                    BOOL v214 = 0;
                    int v168 = 0;
                    int v176 = 0;
                    BOOL v213 = 0;
                    int v164 = 0;
                    int v170 = 0;
                    BOOL v207 = 0;
                    int v162 = 0;
                    int v163 = 0;
                    BOOL v206 = 0;
                    int v165 = 0;
                    int v171 = 0;
                    BOOL v205 = 0;
                    int v166 = 0;
                    int v174 = 0;
                    BOOL v204 = 0;
                    int v169 = 0;
                    int v177 = 0;
                    BOOL v203 = 0;
                    int v172 = 0;
                    int v180 = 0;
                    BOOL v202 = 0;
                    int v178 = 0;
                    int v183 = 0;
                    BOOL v200 = 0;
                    int v182 = 0;
                    int v185 = 0;
                    BOOL v199 = 0;
                    int v188 = 0;
                    int v190 = 0;
                    BOOL v197 = 0;
                    int v192 = 0;
                    int v12 = 0;
                    int v13 = 0;
                    int v14 = 0;
                    BOOL v15 = 0;
                    int v201 = 1;
                    int v198 = 1;
                    BOOL v195 = 0;
                    int v196 = 1;
                    v194[2] = 0x100000001;
                    v194[1] = 0x100000001;
                    int v193 = 0;
                    v194[0] = 0x100000001;
                    int v11 = 1;
                    int v189 = 1;
                    int v191 = 1;
                    BOOL v218 = 1;
                  }
                }
              }
              else
              {
                int v189 = 0;
                int v191 = 0;
                BOOL v218 = 0;
                int v186 = 0;
                int v187 = 0;
                BOOL v217 = 0;
                int v181 = 0;
                int v184 = 0;
                BOOL v216 = 0;
                int v173 = 0;
                int v167 = 0;
                BOOL v215 = 0;
                int v175 = 0;
                int v179 = 0;
                BOOL v214 = 0;
                int v168 = 0;
                int v176 = 0;
                BOOL v213 = 0;
                int v164 = 0;
                int v170 = 0;
                BOOL v207 = 0;
                int v162 = 0;
                int v163 = 0;
                BOOL v206 = 0;
                int v165 = 0;
                int v171 = 0;
                BOOL v205 = 0;
                int v166 = 0;
                int v174 = 0;
                BOOL v204 = 0;
                int v169 = 0;
                int v177 = 0;
                BOOL v203 = 0;
                int v172 = 0;
                int v180 = 0;
                BOOL v202 = 0;
                int v178 = 0;
                int v183 = 0;
                BOOL v200 = 0;
                int v182 = 0;
                int v185 = 0;
                BOOL v199 = 0;
                int v188 = 0;
                int v190 = 0;
                BOOL v197 = 0;
                int v192 = 0;
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
                BOOL v15 = 0;
                int v201 = 1;
                int v198 = 1;
                BOOL v195 = 0;
                int v196 = 1;
                v194[2] = 0x100000001;
                v194[1] = 0x100000001;
                int v193 = 0;
                v194[0] = 0x100000001;
                int v11 = 1;
                LODWORD(v219) = 1;
              }
            }
          }
          else
          {
            v194[0] = 0x100000000;
            int v11 = 0;
            *(void *)&long long v219 = 0x100000000;
            int v189 = 0;
            int v191 = 0;
            BOOL v218 = 0;
            int v186 = 0;
            int v187 = 0;
            BOOL v217 = 0;
            int v181 = 0;
            int v184 = 0;
            BOOL v216 = 0;
            int v173 = 0;
            int v167 = 0;
            BOOL v215 = 0;
            int v175 = 0;
            int v179 = 0;
            BOOL v214 = 0;
            int v168 = 0;
            int v176 = 0;
            BOOL v213 = 0;
            int v164 = 0;
            int v170 = 0;
            BOOL v207 = 0;
            int v162 = 0;
            int v163 = 0;
            BOOL v206 = 0;
            int v165 = 0;
            int v171 = 0;
            BOOL v205 = 0;
            int v166 = 0;
            int v174 = 0;
            BOOL v204 = 0;
            int v169 = 0;
            int v177 = 0;
            BOOL v203 = 0;
            int v172 = 0;
            int v180 = 0;
            BOOL v202 = 0;
            int v178 = 0;
            int v183 = 0;
            BOOL v200 = 0;
            int v182 = 0;
            int v185 = 0;
            BOOL v199 = 0;
            int v188 = 0;
            int v190 = 0;
            BOOL v197 = 0;
            int v192 = 0;
            int v193 = 0;
            int v12 = 0;
            int v13 = 0;
            int v14 = 0;
            BOOL v15 = 0;
            int v201 = 1;
            int v198 = 1;
            BOOL v195 = 0;
            int v196 = 1;
            v194[2] = 0x100000001;
            v194[1] = 0x100000001;
          }
        }
      }
      else
      {
        *(void *)((char *)v194 + 4) = 0;
        *(void *)&long long v219 = 0;
        LODWORD(v194[0]) = 0;
        int v11 = 0;
        int v189 = 0;
        int v191 = 0;
        BOOL v218 = 0;
        int v186 = 0;
        int v187 = 0;
        BOOL v217 = 0;
        int v181 = 0;
        int v184 = 0;
        BOOL v216 = 0;
        int v173 = 0;
        int v167 = 0;
        BOOL v215 = 0;
        int v175 = 0;
        int v179 = 0;
        BOOL v214 = 0;
        int v168 = 0;
        int v176 = 0;
        BOOL v213 = 0;
        int v164 = 0;
        int v170 = 0;
        BOOL v207 = 0;
        int v162 = 0;
        int v163 = 0;
        BOOL v206 = 0;
        int v165 = 0;
        int v171 = 0;
        BOOL v205 = 0;
        int v166 = 0;
        int v174 = 0;
        BOOL v204 = 0;
        int v169 = 0;
        int v177 = 0;
        BOOL v203 = 0;
        int v172 = 0;
        int v180 = 0;
        BOOL v202 = 0;
        int v178 = 0;
        int v183 = 0;
        BOOL v200 = 0;
        int v182 = 0;
        int v185 = 0;
        BOOL v199 = 0;
        int v188 = 0;
        int v190 = 0;
        BOOL v197 = 0;
        int v192 = 0;
        int v193 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        BOOL v15 = 0;
        int v201 = 1;
        int v198 = 1;
        BOOL v195 = 0;
        int v196 = 1;
        v194[2] = 0x100000001;
        HIDWORD(v194[1]) = 1;
        DWORD2(v219) = 1;
      }
    }
  }
  else
  {
    *(void *)((char *)&v219 + 4) = 0;
    memset(v194, 0, 20);
    int v11 = 0;
    LODWORD(v219) = 0;
    int v189 = 0;
    int v191 = 0;
    BOOL v218 = 0;
    int v186 = 0;
    int v187 = 0;
    BOOL v217 = 0;
    int v181 = 0;
    int v184 = 0;
    BOOL v216 = 0;
    int v173 = 0;
    int v167 = 0;
    BOOL v215 = 0;
    int v175 = 0;
    int v179 = 0;
    BOOL v214 = 0;
    int v168 = 0;
    int v176 = 0;
    BOOL v213 = 0;
    int v164 = 0;
    int v170 = 0;
    BOOL v207 = 0;
    int v162 = 0;
    int v163 = 0;
    BOOL v206 = 0;
    int v165 = 0;
    int v171 = 0;
    BOOL v205 = 0;
    int v166 = 0;
    int v174 = 0;
    BOOL v204 = 0;
    int v169 = 0;
    int v177 = 0;
    BOOL v203 = 0;
    int v172 = 0;
    int v180 = 0;
    BOOL v202 = 0;
    int v178 = 0;
    int v183 = 0;
    BOOL v200 = 0;
    int v182 = 0;
    int v185 = 0;
    BOOL v199 = 0;
    int v188 = 0;
    int v190 = 0;
    BOOL v197 = 0;
    int v192 = 0;
    int v193 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    BOOL v15 = 0;
    int v201 = 1;
    int v198 = 1;
    BOOL v195 = 0;
    int v196 = 1;
    HIDWORD(v194[2]) = 1;
  }
LABEL_15:
  if (v14)
  {
    int v18 = v11;
    int v19 = v13;

    int v20 = v19;
    int v11 = v18;
    if (!v20) {
      goto LABEL_17;
    }
LABEL_152:

    if (!v12) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v13) {
    goto LABEL_152;
  }
LABEL_17:
  if (v12)
  {
LABEL_18:
  }
LABEL_19:
  if (v195)
  {
  }
  if (v193) {

  }
  if (v192)
  {
  }
  if (v197)
  {
  }
  if (v190) {

  }
  if (v188)
  {
  }
  if (v199)
  {
  }
  if (v185) {

  }
  if (v182)
  {
  }
  if (v200)
  {
  }
  if (v183) {

  }
  if (v178)
  {
  }
  if (v202)
  {
  }
  if (v180) {

  }
  if (v172)
  {
  }
  if (v203)
  {
  }
  if (v177) {

  }
  if (v169)
  {
  }
  if (v204)
  {
  }
  if (v174) {

  }
  if (v166)
  {
  }
  if (v205)
  {
  }
  if (v171) {

  }
  if (v165)
  {
  }
  if (v206)
  {
  }
  if (v163) {

  }
  if (v162)
  {
  }
  if (v207)
  {
  }
  if (v170) {

  }
  if (v164)
  {
  }
  if (v213)
  {
  }
  if (v176) {

  }
  if (v168)
  {
  }
  if (v214)
  {
  }
  if (v179) {

  }
  if (v175)
  {
  }
  if (v215)
  {
  }
  if (v167) {

  }
  if (v173)
  {
  }
  if (v216)
  {
  }
  if (v184) {

  }
  if (v181)
  {
  }
  if (v217)
  {
  }
  if (v187) {

  }
  if (v186)
  {
  }
  if (v218)
  {
  }
  if (v191) {

  }
  if (v189)
  {
  }
  if (v219)
  {
  }
  if (v11) {

  }
  if (LODWORD(v194[0]))
  {
  }
  if (DWORD1(v219))
  {
  }
  if (LODWORD(v194[1])) {

  }
  if (HIDWORD(v194[0]))
  {
  }
  if (DWORD2(v219))
  {
  }
  if (LODWORD(v194[2])) {

  }
  if (HIDWORD(v194[1]))
  {
  }
  if (HIDWORD(v219))
  {
  }
  if (HIDWORD(v194[2])) {

  }
  if (v196)
  {
  }
  if (v208)
  {
  }
  if (v198) {

  }
  if (v201)
  {
  }
  if (HIDWORD(v208))
  {
  }
  if (v210 != v209) {

  }
LABEL_150:
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFActionItem *)self label];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setLabel:v6];

  uint64_t v7 = [(SFActionItem *)self labelForLocalMedia];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setLabelForLocalMedia:v8];

  objc_msgSend(v4, "setIsOverlay:", -[SFActionItem isOverlay](self, "isOverlay"));
  uint64_t v9 = [(SFActionItem *)self storeIdentifiers];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setStoreIdentifiers:v10];

  objc_msgSend(v4, "setRequiresLocalMedia:", -[SFActionItem requiresLocalMedia](self, "requiresLocalMedia"));
  int v11 = [(SFActionItem *)self localMediaIdentifier];
  int v12 = (void *)[v11 copy];
  [v4 setLocalMediaIdentifier:v12];

  int v13 = [(SFActionItem *)self punchout];
  int v14 = (void *)[v13 copy];
  [v4 setPunchout:v14];

  BOOL v15 = [(SFActionItem *)self applicationBundleIdentifier];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setApplicationBundleIdentifier:v16];

  BOOL v17 = [(SFActionItem *)self contactIdentifier];
  int v18 = (void *)[v17 copy];
  [v4 setContactIdentifier:v18];

  int v19 = [(SFActionItem *)self phoneNumber];
  int v20 = (void *)[v19 copy];
  [v4 setPhoneNumber:v20];

  v21 = [(SFActionItem *)self email];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setEmail:v22];

  v23 = [(SFActionItem *)self mapsData];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setMapsData:v24];

  [(SFActionItem *)self latitude];
  objc_msgSend(v4, "setLatitude:");
  [(SFActionItem *)self longitude];
  objc_msgSend(v4, "setLongitude:");
  uint64_t v25 = [(SFActionItem *)self provider];
  uint64_t v26 = (void *)[v25 copy];
  [v4 setProvider:v26];

  uint64_t v27 = [(SFActionItem *)self offerType];
  uint64_t v28 = (void *)[v27 copy];
  [v4 setOfferType:v28];

  uint64_t v29 = [(SFActionItem *)self type];
  double v30 = (void *)[v29 copy];
  [v4 setType:v30];

  double v31 = [(SFActionItem *)self labelITunes];
  double v32 = (void *)[v31 copy];
  [v4 setLabelITunes:v32];

  objc_msgSend(v4, "setIsITunes:", -[SFActionItem isITunes](self, "isITunes"));
  double v33 = [(SFActionItem *)self icon];
  double v34 = (void *)[v33 copy];
  [v4 setIcon:v34];

  double v35 = [(SFActionItem *)self baseIcon];
  uint64_t v36 = (void *)[v35 copy];
  [v4 setBaseIcon:v36];

  uint64_t v37 = [(SFActionItem *)self location];
  uint64_t v38 = (void *)[v37 copy];
  [v4 setLocation:v38];

  uint64_t v39 = [(SFActionItem *)self messageIdentifier];
  uint64_t v40 = (void *)[v39 copy];
  [v4 setMessageIdentifier:v40];

  uint64_t v41 = [(SFActionItem *)self messageURL];
  uint64_t v42 = (void *)[v41 copy];
  [v4 setMessageURL:v42];

  uint64_t v43 = [(SFActionItem *)self persistentID];
  uint64_t v44 = (void *)[v43 copy];
  [v4 setPersistentID:v44];

  objc_msgSend(v4, "setMediaEntityType:", -[SFActionItem mediaEntityType](self, "mediaEntityType"));
  uint64_t v45 = [(SFActionItem *)self universalLibraryID];
  uint64_t v46 = (void *)[v45 copy];
  [v4 setUniversalLibraryID:v46];

  uint64_t v47 = [(SFActionItem *)self interactionContentType];
  unint64_t v48 = (void *)[v47 copy];
  [v4 setInteractionContentType:v48];

  BOOL v49 = [(SFActionItem *)self customDirectionsPunchout];
  int v50 = (void *)[v49 copy];
  [v4 setCustomDirectionsPunchout:v50];

  objc_msgSend(v4, "setShouldSearchDirectionsAlongCurrentRoute:", -[SFActionItem shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
  objc_msgSend(v4, "setDirectionsMode:", -[SFActionItem directionsMode](self, "directionsMode"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBActionItem alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBActionItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBActionItem alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBActionItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBActionItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBActionItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFActionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBActionItem alloc] initWithData:v5];
  uint64_t v7 = [(SFActionItem *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasDirectionsMode
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setDirectionsMode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_directionsMode = a3;
}

- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_shouldSearchDirectionsAlongCurrentRoute = a3;
}

- (BOOL)hasMediaEntityType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMediaEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_mediaEntityType = a3;
}

- (BOOL)hasIsITunes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsITunes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isITunes = a3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_longitude = a3;
}

- (BOOL)hasLatitude
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_latitude = a3;
}

- (BOOL)hasRequiresLocalMedia
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequiresLocalMedia:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requiresLocalMedia = a3;
}

- (BOOL)hasIsOverlay
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsOverlay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isOverlay = a3;
}

- (SFActionItem)initWithProtobuf:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)SFActionItem;
  uint64_t v5 = [(SFActionItem *)&v79 init];

  if (v5)
  {
    uint64_t v6 = [v4 label];

    if (v6)
    {
      uint64_t v7 = [v4 label];
      [(SFActionItem *)v5 setLabel:v7];
    }
    uint64_t v8 = [v4 labelForLocalMedia];

    if (v8)
    {
      uint64_t v9 = [v4 labelForLocalMedia];
      [(SFActionItem *)v5 setLabelForLocalMedia:v9];
    }
    if ([v4 isOverlay]) {
      -[SFActionItem setIsOverlay:](v5, "setIsOverlay:", [v4 isOverlay]);
    }
    uint64_t v10 = [v4 storeIdentifiers];
    if (v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v11 = 0;
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    int v12 = objc_msgSend(v4, "storeIdentifiers", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v75 objects:v80 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v76 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(id *)(*((void *)&v75 + 1) + 8 * i);
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v75 objects:v80 count:16];
      }
      while (v14);
    }

    [(SFActionItem *)v5 setStoreIdentifiers:v11];
    if ([v4 requiresLocalMedia]) {
      -[SFActionItem setRequiresLocalMedia:](v5, "setRequiresLocalMedia:", [v4 requiresLocalMedia]);
    }
    int v18 = [v4 localMediaIdentifier];

    if (v18)
    {
      int v19 = [v4 localMediaIdentifier];
      [(SFActionItem *)v5 setLocalMediaIdentifier:v19];
    }
    int v20 = [v4 punchout];

    if (v20)
    {
      v21 = [SFPunchout alloc];
      uint64_t v22 = [v4 punchout];
      v23 = [(SFPunchout *)v21 initWithProtobuf:v22];
      [(SFActionItem *)v5 setPunchout:v23];
    }
    uint64_t v24 = [v4 applicationBundleIdentifier];

    if (v24)
    {
      uint64_t v25 = [v4 applicationBundleIdentifier];
      [(SFActionItem *)v5 setApplicationBundleIdentifier:v25];
    }
    uint64_t v26 = [v4 contactIdentifier];

    if (v26)
    {
      uint64_t v27 = [v4 contactIdentifier];
      [(SFActionItem *)v5 setContactIdentifier:v27];
    }
    uint64_t v28 = [v4 phoneNumber];

    if (v28)
    {
      uint64_t v29 = [v4 phoneNumber];
      [(SFActionItem *)v5 setPhoneNumber:v29];
    }
    double v30 = [v4 email];

    if (v30)
    {
      double v31 = [v4 email];
      [(SFActionItem *)v5 setEmail:v31];
    }
    double v32 = [v4 mapsData];

    if (v32)
    {
      double v33 = [v4 mapsData];
      [(SFActionItem *)v5 setMapsData:v33];
    }
    double v34 = [v4 latitude];

    if (v34)
    {
      double v35 = [v4 latitude];
      [v35 doubleValue];
      -[SFActionItem setLatitude:](v5, "setLatitude:");
    }
    uint64_t v36 = [v4 longitude];

    if (v36)
    {
      uint64_t v37 = [v4 longitude];
      [v37 doubleValue];
      -[SFActionItem setLongitude:](v5, "setLongitude:");
    }
    uint64_t v38 = [v4 provider];

    if (v38)
    {
      uint64_t v39 = [v4 provider];
      [(SFActionItem *)v5 setProvider:v39];
    }
    uint64_t v40 = [v4 offerType];

    if (v40)
    {
      uint64_t v41 = [v4 offerType];
      [(SFActionItem *)v5 setOfferType:v41];
    }
    uint64_t v42 = [v4 type];

    if (v42)
    {
      uint64_t v43 = [v4 type];
      [(SFActionItem *)v5 setType:v43];
    }
    uint64_t v44 = [v4 labelITunes];

    if (v44)
    {
      uint64_t v45 = [v4 labelITunes];
      [(SFActionItem *)v5 setLabelITunes:v45];
    }
    if ([v4 isITunes]) {
      -[SFActionItem setIsITunes:](v5, "setIsITunes:", [v4 isITunes]);
    }
    uint64_t v46 = [v4 icon];

    if (v46)
    {
      uint64_t v47 = [SFImage alloc];
      unint64_t v48 = [v4 icon];
      BOOL v49 = [(SFImage *)v47 initWithProtobuf:v48];
      [(SFActionItem *)v5 setIcon:v49];
    }
    int v50 = [v4 baseIcon];

    if (v50)
    {
      v51 = [SFImage alloc];
      int v52 = [v4 baseIcon];
      uint64_t v53 = [(SFImage *)v51 initWithProtobuf:v52];
      [(SFActionItem *)v5 setBaseIcon:v53];
    }
    v54 = [v4 location];

    if (v54)
    {
      v55 = [SFLatLng alloc];
      v56 = [v4 location];
      v57 = [(SFLatLng *)v55 initWithProtobuf:v56];
      [(SFActionItem *)v5 setLocation:v57];
    }
    v58 = [v4 messageIdentifier];

    if (v58)
    {
      v59 = [v4 messageIdentifier];
      [(SFActionItem *)v5 setMessageIdentifier:v59];
    }
    v60 = [v4 messageURL];

    if (v60)
    {
      v61 = [v4 messageURL];
      v62 = _SFPBURLHandwrittenTranslator(v61);
      [(SFActionItem *)v5 setMessageURL:v62];
    }
    v63 = [v4 persistentID];

    if (v63)
    {
      v64 = [v4 persistentID];
      [(SFActionItem *)v5 setPersistentID:v64];
    }
    if ([v4 mediaEntityType]) {
      -[SFActionItem setMediaEntityType:](v5, "setMediaEntityType:", [v4 mediaEntityType]);
    }
    v65 = [v4 universalLibraryID];

    if (v65)
    {
      v66 = [v4 universalLibraryID];
      [(SFActionItem *)v5 setUniversalLibraryID:v66];
    }
    v67 = [v4 interactionContentType];

    if (v67)
    {
      v68 = [v4 interactionContentType];
      [(SFActionItem *)v5 setInteractionContentType:v68];
    }
    v69 = [v4 customDirectionsPunchout];

    if (v69)
    {
      v70 = [SFPunchout alloc];
      v71 = [v4 customDirectionsPunchout];
      v72 = [(SFPunchout *)v70 initWithProtobuf:v71];
      [(SFActionItem *)v5 setCustomDirectionsPunchout:v72];
    }
    if ([v4 shouldSearchDirectionsAlongCurrentRoute]) {
      -[SFActionItem setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", [v4 shouldSearchDirectionsAlongCurrentRoute]);
    }
    if ([v4 directionsMode]) {
      -[SFActionItem setDirectionsMode:](v5, "setDirectionsMode:", [v4 directionsMode]);
    }
    v73 = v5;
  }
  return v5;
}

@end