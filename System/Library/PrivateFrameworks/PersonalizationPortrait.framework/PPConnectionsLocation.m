@interface PPConnectionsLocation
+ (BOOL)supportsSecureCoding;
+ (unint64_t)round:(double)a3 toNearest:(double)a4;
- (BOOL)copiedToPasteboard;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConnectionsLocation:(id)a3;
- (BOOL)shouldAggregate;
- (NSArray)contactHandles;
- (NSDate)createdAt;
- (NSDictionary)addressComponents;
- (NSNumber)latitude;
- (NSNumber)lifetime;
- (NSNumber)longitude;
- (NSString)administrativeArea;
- (NSString)authorHandle;
- (NSString)country;
- (NSString)documentID;
- (NSString)fullFormattedAddress;
- (NSString)identifier;
- (NSString)label;
- (NSString)locality;
- (NSString)name;
- (NSString)originatingBundleID;
- (NSString)postalCode;
- (NSString)shortValue;
- (NSString)source;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (NSString)trigger;
- (NSString)value;
- (NSURL)mapItemURL;
- (NSURL)originatingWebsiteURL;
- (PPConnectionsLocation)initWithCoder:(id)a3;
- (PPConnectionsLocation)initWithOriginatingBundleID:(id)a3;
- (id)addressDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)quickTypeItem;
- (unint64_t)_roundedPredictionAge;
- (unint64_t)hash;
- (unsigned)_pexItemSource;
- (void)encodeWithCoder:(id)a3;
- (void)setAddressComponents:(id)a3;
- (void)setAdministrativeArea:(id)a3;
- (void)setAuthorHandle:(id)a3;
- (void)setContactHandles:(id)a3;
- (void)setCopiedToPasteboard:(BOOL)a3;
- (void)setCountry:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDocumentID:(id)a3;
- (void)setFullFormattedAddress:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLifetime:(id)a3;
- (void)setLocality:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapItemURL:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginatingWebsiteURL:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setShortValue:(id)a3;
- (void)setShouldAggregate:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setSubThoroughfare:(id)a3;
- (void)setThoroughfare:(id)a3;
- (void)setTrigger:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PPConnectionsLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetime, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_addressComponents, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_shortValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_authorHandle, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_mapItemURL, 0);
  objc_storeStrong((id *)&self->_originatingWebsiteURL, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_fullFormattedAddress, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setLifetime:(id)a3
{
}

- (NSNumber)lifetime
{
  return self->_lifetime;
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setTrigger:(id)a3
{
}

- (NSString)trigger
{
  return self->_trigger;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setAddressComponents:(id)a3
{
}

- (NSDictionary)addressComponents
{
  return self->_addressComponents;
}

- (void)setDocumentID:(id)a3
{
}

- (NSString)documentID
{
  return self->_documentID;
}

- (void)setShouldAggregate:(BOOL)a3
{
  self->_shouldAggregate = a3;
}

- (BOOL)shouldAggregate
{
  return self->_shouldAggregate;
}

- (void)setShortValue:(id)a3
{
}

- (NSString)shortValue
{
  return self->_shortValue;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setCopiedToPasteboard:(BOOL)a3
{
  self->_copiedToPasteboard = a3;
}

- (BOOL)copiedToPasteboard
{
  return self->_copiedToPasteboard;
}

- (void)setAuthorHandle:(id)a3
{
}

- (NSString)authorHandle
{
  return self->_authorHandle;
}

- (void)setContactHandles:(id)a3
{
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (void)setMapItemURL:(id)a3
{
}

- (NSURL)mapItemURL
{
  return self->_mapItemURL;
}

- (void)setOriginatingWebsiteURL:(id)a3
{
}

- (NSURL)originatingWebsiteURL
{
  return self->_originatingWebsiteURL;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setLocality:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setSubThoroughfare:(id)a3
{
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setThoroughfare:(id)a3
{
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setFullFormattedAddress:(id)a3
{
}

- (NSString)fullFormattedAddress
{
  return self->_fullFormattedAddress;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqualToConnectionsLocation:(id)a3
{
  v4 = (id *)a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = identifier;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_96;
    }
  }
  name = self->_name;
  v11 = (NSString *)v4[3];
  if (name == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = name;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_96;
    }
  }
  originatingBundleID = self->_originatingBundleID;
  v16 = (NSString *)v4[4];
  if (originatingBundleID == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = originatingBundleID;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_96;
    }
  }
  fullFormattedAddress = self->_fullFormattedAddress;
  v21 = (NSString *)v4[5];
  if (fullFormattedAddress == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = fullFormattedAddress;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_96;
    }
  }
  thoroughfare = self->_thoroughfare;
  v26 = (NSString *)v4[6];
  if (thoroughfare == v26)
  {
  }
  else
  {
    v27 = v26;
    v28 = thoroughfare;
    char v29 = [(NSString *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_96;
    }
  }
  subThoroughfare = self->_subThoroughfare;
  v31 = (NSString *)v4[7];
  if (subThoroughfare == v31)
  {
  }
  else
  {
    v32 = v31;
    v33 = subThoroughfare;
    char v34 = [(NSString *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_96;
    }
  }
  locality = self->_locality;
  v36 = (NSString *)v4[8];
  if (locality == v36)
  {
  }
  else
  {
    v37 = v36;
    v38 = locality;
    char v39 = [(NSString *)v38 isEqual:v37];

    if ((v39 & 1) == 0) {
      goto LABEL_96;
    }
  }
  administrativeArea = self->_administrativeArea;
  v41 = (NSString *)v4[9];
  if (administrativeArea == v41)
  {
  }
  else
  {
    v42 = v41;
    v43 = administrativeArea;
    char v44 = [(NSString *)v43 isEqual:v42];

    if ((v44 & 1) == 0) {
      goto LABEL_96;
    }
  }
  postalCode = self->_postalCode;
  v46 = (NSString *)v4[10];
  if (postalCode == v46)
  {
  }
  else
  {
    v47 = v46;
    v48 = postalCode;
    char v49 = [(NSString *)v48 isEqual:v47];

    if ((v49 & 1) == 0) {
      goto LABEL_96;
    }
  }
  country = self->_country;
  v51 = (NSString *)v4[11];
  if (country == v51)
  {
  }
  else
  {
    v52 = v51;
    v53 = country;
    char v54 = [(NSString *)v53 isEqual:v52];

    if ((v54 & 1) == 0) {
      goto LABEL_96;
    }
  }
  latitude = self->_latitude;
  v56 = (NSNumber *)v4[12];
  if (latitude == v56)
  {
  }
  else
  {
    v57 = v56;
    v58 = latitude;
    char v59 = [(NSNumber *)v58 isEqual:v57];

    if ((v59 & 1) == 0) {
      goto LABEL_96;
    }
  }
  longitude = self->_longitude;
  v61 = (NSNumber *)v4[13];
  if (longitude == v61)
  {
  }
  else
  {
    v62 = v61;
    v63 = longitude;
    char v64 = [(NSNumber *)v63 isEqual:v62];

    if ((v64 & 1) == 0) {
      goto LABEL_96;
    }
  }
  originatingWebsiteURL = self->_originatingWebsiteURL;
  v66 = (NSURL *)v4[14];
  if (originatingWebsiteURL == v66)
  {
  }
  else
  {
    v67 = v66;
    v68 = originatingWebsiteURL;
    char v69 = [(NSURL *)v68 isEqual:v67];

    if ((v69 & 1) == 0) {
      goto LABEL_96;
    }
  }
  mapItemURL = self->_mapItemURL;
  v71 = (NSURL *)v4[15];
  if (mapItemURL == v71)
  {
  }
  else
  {
    v72 = v71;
    v73 = mapItemURL;
    char v74 = [(NSURL *)v73 isEqual:v72];

    if ((v74 & 1) == 0) {
      goto LABEL_96;
    }
  }
  label = self->_label;
  v76 = (NSString *)v4[18];
  if (label == v76)
  {
  }
  else
  {
    v77 = v76;
    v78 = label;
    char v79 = [(NSString *)v78 isEqual:v77];

    if ((v79 & 1) == 0) {
      goto LABEL_96;
    }
  }
  value = self->_value;
  v81 = (NSString *)v4[19];
  if (value == v81)
  {
  }
  else
  {
    v82 = v81;
    v83 = value;
    char v84 = [(NSString *)v83 isEqual:v82];

    if ((v84 & 1) == 0) {
      goto LABEL_96;
    }
  }
  shortValue = self->_shortValue;
  v86 = (NSString *)v4[20];
  if (shortValue == v86)
  {
  }
  else
  {
    v87 = v86;
    v88 = shortValue;
    char v89 = [(NSString *)v88 isEqual:v87];

    if ((v89 & 1) == 0) {
      goto LABEL_96;
    }
  }
  if (self->_shouldAggregate == *((unsigned __int8 *)v4 + 9))
  {
    addressComponents = self->_addressComponents;
    v91 = (NSDictionary *)v4[22];
    if (addressComponents == v91)
    {
    }
    else
    {
      v92 = v91;
      v93 = addressComponents;
      char v94 = [(NSDictionary *)v93 isEqual:v92];

      if ((v94 & 1) == 0) {
        goto LABEL_96;
      }
    }
    source = self->_source;
    v96 = (NSString *)v4[23];
    if (source == v96)
    {
    }
    else
    {
      v97 = v96;
      v98 = source;
      char v99 = [(NSString *)v98 isEqual:v97];

      if ((v99 & 1) == 0) {
        goto LABEL_96;
      }
    }
    trigger = self->_trigger;
    v101 = (NSString *)v4[24];
    if (trigger == v101)
    {
    }
    else
    {
      v102 = v101;
      v103 = trigger;
      char v104 = [(NSString *)v103 isEqual:v102];

      if ((v104 & 1) == 0) {
        goto LABEL_96;
      }
    }
    createdAt = self->_createdAt;
    v106 = (NSDate *)v4[25];
    if (createdAt == v106)
    {
    }
    else
    {
      v107 = v106;
      v108 = createdAt;
      char v109 = [(NSDate *)v108 isEqual:v107];

      if ((v109 & 1) == 0) {
        goto LABEL_96;
      }
    }
    lifetime = self->_lifetime;
    v111 = (NSNumber *)v4[26];
    if (lifetime == v111)
    {
    }
    else
    {
      v112 = v111;
      v113 = lifetime;
      char v114 = [(NSNumber *)v113 isEqual:v112];

      if ((v114 & 1) == 0) {
        goto LABEL_96;
      }
    }
    authorHandle = self->_authorHandle;
    v116 = (NSString *)v4[17];
    if (authorHandle == v116)
    {
    }
    else
    {
      v117 = v116;
      v118 = authorHandle;
      char v119 = [(NSString *)v118 isEqual:v117];

      if ((v119 & 1) == 0) {
        goto LABEL_96;
      }
    }
    contactHandles = self->_contactHandles;
    v121 = (NSArray *)v4[16];
    if (contactHandles == v121)
    {
    }
    else
    {
      v122 = v121;
      v123 = contactHandles;
      char v124 = [(NSArray *)v123 isEqual:v122];

      if ((v124 & 1) == 0) {
        goto LABEL_96;
      }
    }
    BOOL v125 = *((unsigned __int8 *)v4 + 8) == self->_copiedToPasteboard;
    goto LABEL_97;
  }
LABEL_96:
  BOOL v125 = 0;
LABEL_97:

  return v125;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPConnectionsLocation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPConnectionsLocation *)self isEqualToConnectionsLocation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
    char v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_originatingBundleID copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    uint64_t v12 = [(NSString *)self->_fullFormattedAddress copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    uint64_t v14 = [(NSString *)self->_thoroughfare copyWithZone:a3];
    v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    uint64_t v16 = [(NSString *)self->_subThoroughfare copyWithZone:a3];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    uint64_t v18 = [(NSString *)self->_locality copyWithZone:a3];
    char v19 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v18;

    uint64_t v20 = [(NSString *)self->_administrativeArea copyWithZone:a3];
    v21 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v20;

    uint64_t v22 = [(NSString *)self->_postalCode copyWithZone:a3];
    v23 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v22;

    uint64_t v24 = [(NSString *)self->_country copyWithZone:a3];
    v25 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v24;

    uint64_t v26 = [(NSNumber *)self->_latitude copyWithZone:a3];
    v27 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v26;

    uint64_t v28 = [(NSNumber *)self->_longitude copyWithZone:a3];
    char v29 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v28;

    uint64_t v30 = [(NSURL *)self->_originatingWebsiteURL copyWithZone:a3];
    v31 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v30;

    uint64_t v32 = [(NSURL *)self->_mapItemURL copyWithZone:a3];
    v33 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v32;

    uint64_t v34 = [(NSString *)self->_label copyWithZone:a3];
    v35 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v34;

    uint64_t v36 = [(NSString *)self->_value copyWithZone:a3];
    v37 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v36;

    uint64_t v38 = [(NSString *)self->_shortValue copyWithZone:a3];
    char v39 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = v38;

    *(unsigned char *)(v5 + 9) = self->_shouldAggregate;
    uint64_t v40 = [(NSDictionary *)self->_addressComponents copyWithZone:a3];
    v41 = *(void **)(v5 + 176);
    *(void *)(v5 + 176) = v40;

    uint64_t v42 = [(NSString *)self->_source copyWithZone:a3];
    v43 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = v42;

    uint64_t v44 = [(NSString *)self->_trigger copyWithZone:a3];
    v45 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v44;

    uint64_t v46 = [(NSDate *)self->_createdAt copyWithZone:a3];
    v47 = *(void **)(v5 + 200);
    *(void *)(v5 + 200) = v46;

    uint64_t v48 = [(NSNumber *)self->_lifetime copyWithZone:a3];
    char v49 = *(void **)(v5 + 208);
    *(void *)(v5 + 208) = v48;

    uint64_t v50 = [(NSString *)self->_authorHandle copyWithZone:a3];
    v51 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v50;

    uint64_t v52 = [(NSArray *)self->_contactHandles copyWithZone:a3];
    v53 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v52;

    *(unsigned char *)(v5 + 8) = self->_copiedToPasteboard;
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"ide"];
  [v5 encodeObject:self->_name forKey:@"nam"];
  [v5 encodeObject:self->_originatingBundleID forKey:@"bid"];
  [v5 encodeObject:self->_fullFormattedAddress forKey:@"ffa"];
  [v5 encodeObject:self->_thoroughfare forKey:@"thr"];
  [v5 encodeObject:self->_subThoroughfare forKey:@"sth"];
  [v5 encodeObject:self->_locality forKey:@"loc"];
  [v5 encodeObject:self->_administrativeArea forKey:@"aar"];
  [v5 encodeObject:self->_postalCode forKey:@"poc"];
  [v5 encodeObject:self->_country forKey:@"cnt"];
  [v5 encodeObject:self->_latitude forKey:@"lat"];
  [v5 encodeObject:self->_longitude forKey:@"lon"];
  [v5 encodeObject:self->_originatingWebsiteURL forKey:@"owu"];
  [v5 encodeObject:self->_mapItemURL forKey:@"miu"];
  [v5 encodeObject:self->_label forKey:@"lab"];
  [v5 encodeObject:self->_value forKey:@"val"];
  [v5 encodeObject:self->_shortValue forKey:@"shv"];
  [v5 encodeBool:self->_shouldAggregate forKey:@"sha"];
  [v5 encodeObject:self->_addressComponents forKey:@"add"];
  [v5 encodeObject:self->_source forKey:@"src"];
  [v5 encodeObject:self->_trigger forKey:@"trg"];
  [v5 encodeObject:self->_createdAt forKey:@"cra"];
  [v5 encodeObject:self->_lifetime forKey:@"lft"];
  [v5 encodeObject:self->_authorHandle forKey:@"auh"];
  [v5 encodeObject:self->_contactHandles forKey:@"cnh"];
  [v5 encodeBool:self->_copiedToPasteboard forKey:@"cpb"];
}

- (PPConnectionsLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = [v4 decodeObjectOfClass:v5 forKey:@"bid"];
  uint64_t v12 = [v4 decodeObjectOfClass:v5 forKey:@"ide"];
  v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    v15 = 0;
  }
  else
  {
    v67.receiver = self;
    v67.super_class = (Class)PPConnectionsLocation;
    uint64_t v16 = [(PPConnectionsLocation *)&v67 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_identifier, v13);
      uint64_t v18 = [v4 decodeObjectOfClass:v5 forKey:@"nam"];
      name = v17->_name;
      v17->_name = (NSString *)v18;

      objc_storeStrong((id *)&v17->_originatingBundleID, v11);
      uint64_t v20 = [v4 decodeObjectOfClass:v5 forKey:@"ffa"];
      fullFormattedAddress = v17->_fullFormattedAddress;
      v17->_fullFormattedAddress = (NSString *)v20;

      uint64_t v22 = [v4 decodeObjectOfClass:v5 forKey:@"thr"];
      thoroughfare = v17->_thoroughfare;
      v17->_thoroughfare = (NSString *)v22;

      uint64_t v24 = [v4 decodeObjectOfClass:v5 forKey:@"sth"];
      subThoroughfare = v17->_subThoroughfare;
      v17->_subThoroughfare = (NSString *)v24;

      uint64_t v26 = [v4 decodeObjectOfClass:v5 forKey:@"loc"];
      locality = v17->_locality;
      v17->_locality = (NSString *)v26;

      uint64_t v28 = [v4 decodeObjectOfClass:v5 forKey:@"aar"];
      administrativeArea = v17->_administrativeArea;
      v17->_administrativeArea = (NSString *)v28;

      uint64_t v30 = [v4 decodeObjectOfClass:v5 forKey:@"poc"];
      postalCode = v17->_postalCode;
      v17->_postalCode = (NSString *)v30;

      uint64_t v32 = [v4 decodeObjectOfClass:v5 forKey:@"cnt"];
      country = v17->_country;
      v17->_country = (NSString *)v32;

      uint64_t v34 = [v4 decodeObjectOfClass:v6 forKey:@"lat"];
      latitude = v17->_latitude;
      v17->_latitude = (NSNumber *)v34;

      uint64_t v36 = [v4 decodeObjectOfClass:v6 forKey:@"lon"];
      longitude = v17->_longitude;
      v17->_longitude = (NSNumber *)v36;

      uint64_t v38 = [v4 decodeObjectOfClass:v7 forKey:@"owu"];
      originatingWebsiteURL = v17->_originatingWebsiteURL;
      v17->_originatingWebsiteURL = (NSURL *)v38;

      uint64_t v40 = [v4 decodeObjectOfClass:v7 forKey:@"miu"];
      mapItemURL = v17->_mapItemURL;
      v17->_mapItemURL = (NSURL *)v40;

      uint64_t v42 = [v4 decodeObjectOfClass:v5 forKey:@"lab"];
      label = v17->_label;
      v17->_label = (NSString *)v42;

      uint64_t v44 = [v4 decodeObjectOfClass:v5 forKey:@"val"];
      value = v17->_value;
      v17->_value = (NSString *)v44;

      uint64_t v46 = [v4 decodeObjectOfClass:v5 forKey:@"shv"];
      shortValue = v17->_shortValue;
      v17->_shortValue = (NSString *)v46;

      v17->_shouldAggregate = [v4 decodeBoolForKey:@"sha"];
      uint64_t v48 = (void *)MEMORY[0x192F97350]();
      char v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v8, v5, 0);
      uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"add"];
      addressComponents = v17->_addressComponents;
      v17->_addressComponents = (NSDictionary *)v50;

      uint64_t v52 = [v4 decodeObjectOfClass:v5 forKey:@"src"];
      source = v17->_source;
      v17->_source = (NSString *)v52;

      uint64_t v54 = [v4 decodeObjectOfClass:v5 forKey:@"trg"];
      trigger = v17->_trigger;
      v17->_trigger = (NSString *)v54;

      uint64_t v56 = [v4 decodeObjectOfClass:v10 forKey:@"cra"];
      createdAt = v17->_createdAt;
      v17->_createdAt = (NSDate *)v56;

      uint64_t v58 = [v4 decodeObjectOfClass:v6 forKey:@"lft"];
      lifetime = v17->_lifetime;
      v17->_lifetime = (NSNumber *)v58;

      uint64_t v60 = [v4 decodeObjectOfClass:v5 forKey:@"auh"];
      authorHandle = v17->_authorHandle;
      v17->_authorHandle = (NSString *)v60;

      v62 = (void *)MEMORY[0x192F97350]();
      v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v9, v5, 0);
      uint64_t v64 = [v4 decodeObjectOfClasses:v63 forKey:@"cnh"];
      contactHandles = v17->_contactHandles;
      v17->_contactHandles = (NSArray *)v64;

      v17->_copiedToPasteboard = [v4 decodeBoolForKey:@"cpb"];
    }
    self = v17;
    v15 = self;
  }

  return v15;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<PPConnectionsLocation i:%@ n:%@ l:%@ v:%@ b:%@ t:%@ s:%@ loc:%@ a:%@ p:%@ c:%@ ll:(%@,%@) w:%@ lt:%@ pb:%d mu:%@ ah:%@ ch:%@>", self->_identifier, self->_name, self->_label, self->_value, self->_originatingBundleID, self->_thoroughfare, self->_subThoroughfare, self->_locality, self->_administrativeArea, self->_postalCode, self->_country, self->_latitude, self->_longitude, self->_originatingWebsiteURL, self->_lifetime, self->_copiedToPasteboard,
                 self->_mapItemURL,
                 self->_authorHandle,
                 self->_contactHandles);
  return v2;
}

- (id)addressDictionary
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (addressDictionary_onceToken != -1) {
    dispatch_once(&addressDictionary_onceToken, &__block_literal_global_2055);
  }
  v3 = objc_opt_new();
  uint64_t v4 = PPCollapseWhitespaceAndStrip(self->_value);
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    v15[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v3 setObject:v6 forKeyedSubscript:@"FormattedAddressLines"];
  }
  uint64_t v7 = PPCollapseWhitespaceAndStrip(self->_name);
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"Name"];
  }
  uint64_t v8 = (void *)addressDictionary_mapping;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__PPConnectionsLocation_addressDictionary__block_invoke_2;
  v13[3] = &unk_1E550E370;
  v13[4] = self;
  id v9 = v3;
  id v14 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
  uint64_t v10 = v14;
  id v11 = v9;

  return v11;
}

void __42__PPConnectionsLocation_addressDictionary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKeyedSubscript:a2];
  uint64_t v6 = PPCollapseWhitespaceAndStrip(v5);

  if (v6) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

void __42__PPConnectionsLocation_addressDictionary__block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F28920];
  v4[0] = *MEMORY[0x1E4F28958];
  v4[1] = v0;
  v5[0] = @"Street";
  v5[1] = @"City";
  uint64_t v1 = *MEMORY[0x1E4F28960];
  v4[2] = *MEMORY[0x1E4F28950];
  v4[3] = v1;
  v5[2] = @"State";
  v5[3] = @"ZIP";
  v4[4] = *MEMORY[0x1E4F28928];
  v5[4] = @"Country";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  v3 = (void *)addressDictionary_mapping;
  addressDictionary_mapping = v2;
}

- (unint64_t)_roundedPredictionAge
{
  uint64_t v2 = [(PPConnectionsLocation *)self createdAt];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  uint64_t v5 = v4;

  uint64_t v6 = objc_opt_class();
  id v7 = objc_opt_new();
  [v7 timeIntervalSinceDate:v5];
  int v9 = (int)v8;
  if ((int)v8 < 0) {
    int v9 = -v9;
  }
  unint64_t v10 = [v6 round:(double)v9 toNearest:30.0];

  return v10;
}

- (unsigned)_pexItemSource
{
  if ([(NSString *)self->_source isEqualToString:@"calendar"]) {
    return 3;
  }
  if ([(NSString *)self->_source isEqualToString:@"donation"]) {
    return 5;
  }
  if ([(NSString *)self->_source isEqualToString:@"schemaorg"]) {
    return 6;
  }
  if ([(NSString *)self->_source isEqualToString:@"siri"]) {
    return 8;
  }
  if ([(NSString *)self->_source isEqualToString:@"pasteboard"]) {
    return 7;
  }
  return 0;
}

- (id)quickTypeItem
{
  v3 = [(PPConnectionsLocation *)self label];
  if (v3)
  {
    id v4 = [(PPConnectionsLocation *)self value];
    uint64_t v5 = [(PPConnectionsLocation *)self label];
    if (v4)
    {
      uint64_t v6 = [(PPConnectionsLocation *)self value];
      if ([(__CFString *)v5 isEqualToString:v6])
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = [(PPConnectionsLocation *)self label];
      }

      uint64_t v5 = (__CFString *)v7;
    }
  }
  else
  {
    uint64_t v5 = [(PPConnectionsLocation *)self label];
  }

  double v8 = [(PPConnectionsLocation *)self value];

  if (v8)
  {
    int v9 = &stru_1EDA56F70;
    if (v5) {
      int v9 = v5;
    }
    v21 = v9;
    unint64_t v10 = [(PPConnectionsLocation *)self value];
    id v11 = [(PPConnectionsLocation *)self name];
    uint64_t v12 = [(PPConnectionsLocation *)self originatingBundleID];
    v13 = [(PPConnectionsLocation *)self originatingWebsiteURL];
    unint64_t v14 = [(PPConnectionsLocation *)self _roundedPredictionAge];
    BOOL v15 = [(PPConnectionsLocation *)self shouldAggregate];
    unsigned __int8 v16 = [(PPConnectionsLocation *)self _pexItemSource];
    v17 = [(PPConnectionsLocation *)self source];
    BYTE2(v20) = v16;
    LOWORD(v20) = v15;
    uint64_t v18 = +[PPQuickTypeItem quickTypeItemWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:](PPQuickTypeItem, "quickTypeItemWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v21, v10, v11, 0, 4, v12, 200.0, v13, v14, v20, v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)setIdentifier:(id)a3
{
}

- (PPConnectionsLocation)initWithOriginatingBundleID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPConnectionsLocation;
  uint64_t v5 = [(PPConnectionsLocation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [v6 UUIDString];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = [v4 copy];
    originatingBundleID = v5->_originatingBundleID;
    v5->_originatingBundleID = (NSString *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)round:(double)a3 toNearest:(double)a4
{
  float v4 = a3 / a4 + 0.5;
  float v5 = floorf(v4) * a4;
  return vcvtas_u32_f32(v5);
}

@end