@interface VIObjectKnowledge
+ (BOOL)supportsSecureCoding;
- (BOOL)csuSensitiveLocation;
- (BOOL)isEqual:(id)a3;
- (NSArray)knowledgeProperties;
- (NSData)serializedDomainResponse;
- (NSDictionary)csuLocalizedLabelDictionary;
- (NSDictionary)csuLocalizedSynonymsDictionary;
- (NSString)csuCategory;
- (NSString)csuLocalizedLabel;
- (NSString)csuVertical;
- (NSString)detailedDescription;
- (NSString)knowledgeGraphID;
- (NSString)shortDescription;
- (NSString)title;
- (NSURL)thumbnailURL;
- (NSURL)webURL;
- (VIObjectKnowledge)initWithCoder:(id)a3;
- (VIObjectKnowledge)initWithKnowledgeGraphID:(id)a3 title:(id)a4 thumbnailURL:(id)a5 thumbnailAspectRatio:(float)a6 shortDescription:(id)a7 detailedDescription:(id)a8 webURL:(id)a9 knowledgeProperties:(id)a10 serializedDomainType:(int64_t)a11 serializedDomainResponse:(id)a12;
- (VIObjectKnowledge)initWithKnowledgeGraphID:(id)a3 title:(id)a4 thumbnailURL:(id)a5 thumbnailAspectRatio:(float)a6 shortDescription:(id)a7 detailedDescription:(id)a8 webURL:(id)a9 knowledgeProperties:(id)a10 serializedDomainType:(int64_t)a11 serializedDomainResponse:(id)a12 csuQid:(unint64_t)a13 csuIdType:(signed __int16)a14 csuLocalizedLabel:(id)a15 csuLocalizedLabelDictionary:(id)a16 csuConfidence:(double)a17 csuSensitiveLocation:(BOOL)a18 csuCategory:(id)a19 csuVertical:(id)a20 csuLocalizedSynonyms:(id)a21 csuLongitute:(double)a22 csuLatitute:(double)a23 csuVersion:(int)a24;
- (double)csuConfidence;
- (double)csuLatitute;
- (double)csuLongitute;
- (float)thumbnailAspectRatio;
- (int)csuVersion;
- (int64_t)serializedDomainType;
- (signed)csuIdType;
- (unint64_t)csuQid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VIObjectKnowledge

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VIObjectKnowledge)initWithKnowledgeGraphID:(id)a3 title:(id)a4 thumbnailURL:(id)a5 thumbnailAspectRatio:(float)a6 shortDescription:(id)a7 detailedDescription:(id)a8 webURL:(id)a9 knowledgeProperties:(id)a10 serializedDomainType:(int64_t)a11 serializedDomainResponse:(id)a12 csuQid:(unint64_t)a13 csuIdType:(signed __int16)a14 csuLocalizedLabel:(id)a15 csuLocalizedLabelDictionary:(id)a16 csuConfidence:(double)a17 csuSensitiveLocation:(BOOL)a18 csuCategory:(id)a19 csuVertical:(id)a20 csuLocalizedSynonyms:(id)a21 csuLongitute:(double)a22 csuLatitute:(double)a23 csuVersion:(int)a24
{
  id v68 = a3;
  id v69 = a4;
  id v74 = a5;
  id v73 = a7;
  id v72 = a8;
  id v71 = a9;
  id v70 = a10;
  id v34 = a12;
  id v35 = a15;
  id v36 = a16;
  id v37 = a19;
  id v38 = a20;
  id v39 = a21;
  v75.receiver = self;
  v75.super_class = (Class)VIObjectKnowledge;
  v40 = [(VIObjectKnowledge *)&v75 init];
  if (v40)
  {
    uint64_t v41 = [v68 copy];
    knowledgeGraphID = v40->_knowledgeGraphID;
    v40->_knowledgeGraphID = (NSString *)v41;

    uint64_t v43 = [v69 copy];
    title = v40->_title;
    v40->_title = (NSString *)v43;

    uint64_t v45 = [v74 copy];
    thumbnailURL = v40->_thumbnailURL;
    v40->_thumbnailURL = (NSURL *)v45;

    v40->_thumbnailAspectRatio = a6;
    uint64_t v47 = [v73 copy];
    shortDescription = v40->_shortDescription;
    v40->_shortDescription = (NSString *)v47;

    uint64_t v49 = [v72 copy];
    detailedDescription = v40->_detailedDescription;
    v40->_detailedDescription = (NSString *)v49;

    uint64_t v51 = [v71 copy];
    webURL = v40->_webURL;
    v40->_webURL = (NSURL *)v51;

    uint64_t v53 = [v70 copy];
    knowledgeProperties = v40->_knowledgeProperties;
    v40->_knowledgeProperties = (NSArray *)v53;

    v40->_serializedDomainType = a11;
    uint64_t v55 = [v34 copy];
    serializedDomainResponse = v40->_serializedDomainResponse;
    v40->_serializedDomainResponse = (NSData *)v55;

    v40->_csuQid = a13;
    v40->_csuIdType = a14;
    uint64_t v57 = [v35 copy];
    csuLocalizedLabel = v40->_csuLocalizedLabel;
    v40->_csuLocalizedLabel = (NSString *)v57;

    uint64_t v59 = [v36 copy];
    csuLocalizedLabelDictionary = v40->_csuLocalizedLabelDictionary;
    v40->_csuLocalizedLabelDictionary = (NSDictionary *)v59;

    v40->_csuConfidence = a17;
    v40->_csuSensitiveLocation = a18;
    uint64_t v61 = [v37 copy];
    csuCategory = v40->_csuCategory;
    v40->_csuCategory = (NSString *)v61;

    uint64_t v63 = [v38 copy];
    csuVertical = v40->_csuVertical;
    v40->_csuVertical = (NSString *)v63;

    uint64_t v65 = [v39 copy];
    csuLocalizedSynonymsDictionary = v40->_csuLocalizedSynonymsDictionary;
    v40->_csuLocalizedSynonymsDictionary = (NSDictionary *)v65;

    v40->_csuLongitute = a22;
    v40->_csuLatitute = a23;
    v40->_csuVersion = a24;
  }

  return v40;
}

- (VIObjectKnowledge)initWithKnowledgeGraphID:(id)a3 title:(id)a4 thumbnailURL:(id)a5 thumbnailAspectRatio:(float)a6 shortDescription:(id)a7 detailedDescription:(id)a8 webURL:(id)a9 knowledgeProperties:(id)a10 serializedDomainType:(int64_t)a11 serializedDomainResponse:(id)a12
{
  v43[1] = *MEMORY[0x1E4F143B8];
  v19 = (void *)MEMORY[0x1E4F1CA20];
  id v36 = a12;
  id v20 = a10;
  id v35 = a9;
  id v34 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v37 = [v19 currentLocale];
  v42 = v37;
  v43[0] = v23;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
  v33 = [MEMORY[0x1E4F1CA20] currentLocale];
  v40 = v33;
  v25 = objc_opt_new();
  uint64_t v41 = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  LODWORD(v31) = 0;
  LOBYTE(v30) = 0;
  LOWORD(v29) = 0;
  *(float *)&double v27 = a6;
  id v39 = -[VIObjectKnowledge initWithKnowledgeGraphID:title:thumbnailURL:thumbnailAspectRatio:shortDescription:detailedDescription:webURL:knowledgeProperties:serializedDomainType:serializedDomainResponse:csuQid:csuIdType:csuLocalizedLabel:csuLocalizedLabelDictionary:csuConfidence:csuSensitiveLocation:csuCategory:csuVertical:csuLocalizedSynonyms:csuLongitute:csuLatitute:csuVersion:](self, "initWithKnowledgeGraphID:title:thumbnailURL:thumbnailAspectRatio:shortDescription:detailedDescription:webURL:knowledgeProperties:serializedDomainType:serializedDomainResponse:csuQid:csuIdType:csuLocalizedLabel:csuLocalizedLabelDictionary:csuConfidence:csuSensitiveLocation:csuCategory:csuVertical:csuLocalizedSynonyms:csuLongitute:csuLatitute:csuVersion:", v24, v23, v22, v21, v34, v35, v27, 1.0, 0.0, 0.0, v20, a11, v36, 0,
          v29,
          v23,
          v32,
          v30,
          &stru_1F3843BD8,
          &stru_1F3843BD8,
          v26,
          v31);

  return v39;
}

- (VIObjectKnowledge)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VIObjectKnowledge *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"knowledgeGraphID"];
    knowledgeGraphID = v5->_knowledgeGraphID;
    v5->_knowledgeGraphID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"thumbnailURL"];
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSURL *)v10;

    v12 = [v4 decodeObjectForKey:@"thumbnailAspectRatio"];
    [v12 floatValue];
    v5->_thumbnailAspectRatio = v13;

    uint64_t v14 = [v4 decodeObjectForKey:@"shortDecription"];
    shortDescription = v5->_shortDescription;
    v5->_shortDescription = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"detailedDescription"];
    detailedDescription = v5->_detailedDescription;
    v5->_detailedDescription = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectForKey:@"webURL"];
    webURL = v5->_webURL;
    v5->_webURL = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectForKey:@"knowledgeProperties"];
    knowledgeProperties = v5->_knowledgeProperties;
    v5->_knowledgeProperties = (NSArray *)v20;

    id v22 = [v4 decodeObjectForKey:@"serializedDomainType"];
    v5->_serializedDomainType = [v22 integerValue];

    uint64_t v23 = [v4 decodeObjectForKey:@"serializedDomainResponse"];
    serializedDomainResponse = v5->_serializedDomainResponse;
    v5->_serializedDomainResponse = (NSData *)v23;

    v25 = [v4 decodeObjectForKey:@"csuQid"];
    v5->_csuQid = [v25 unsignedLongLongValue];

    v26 = [v4 decodeObjectForKey:@"csuQid"];
    v5->_csuIdType = [v26 shortValue];

    uint64_t v27 = [v4 decodeObjectForKey:@"csuLocalizedLabel"];
    csuLocalizedLabel = v5->_csuLocalizedLabel;
    v5->_csuLocalizedLabel = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectForKey:@"csuLocalizedLabelDictionary"];
    csuLocalizedLabelDictionary = v5->_csuLocalizedLabelDictionary;
    v5->_csuLocalizedLabelDictionary = (NSDictionary *)v29;

    uint64_t v31 = [v4 decodeObjectForKey:@"csuConfidence"];
    [v31 doubleValue];
    v5->_csuConfidence = v32;

    v33 = [v4 decodeObjectForKey:@"csuSensitiveLocation"];
    v5->_csuSensitiveLocation = [v33 BOOLValue];

    uint64_t v34 = [v4 decodeObjectForKey:@"csuCategory"];
    csuCategory = v5->_csuCategory;
    v5->_csuCategory = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectForKey:@"csuVertical"];
    csuVertical = v5->_csuVertical;
    v5->_csuVertical = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectForKey:@"csuLocalizedSynonymsDictionary"];
    csuLocalizedSynonymsDictionary = v5->_csuLocalizedSynonymsDictionary;
    v5->_csuLocalizedSynonymsDictionary = (NSDictionary *)v38;

    v40 = [v4 decodeObjectForKey:@"csuLongitute"];
    [v40 doubleValue];
    v5->_csuLongitute = v41;

    v42 = [v4 decodeObjectForKey:@"csuLatitute"];
    [v42 doubleValue];
    v5->_csuLatitute = v43;

    v44 = [v4 decodeObjectForKey:@"csuVersion"];
    v5->_csuVersion = [v44 intValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  knowledgeGraphID = self->_knowledgeGraphID;
  id v5 = a3;
  [v5 encodeObject:knowledgeGraphID forKey:@"knowledgeGraphID"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_thumbnailURL forKey:@"thumbnailURL"];
  *(float *)&double v6 = self->_thumbnailAspectRatio;
  v7 = [NSNumber numberWithFloat:v6];
  [v5 encodeObject:v7 forKey:@"thumbnailAspectRatio"];

  [v5 encodeObject:self->_shortDescription forKey:@"shortDecription"];
  [v5 encodeObject:self->_detailedDescription forKey:@"detailedDescription"];
  [v5 encodeObject:self->_webURL forKey:@"webURL"];
  [v5 encodeObject:self->_knowledgeProperties forKey:@"knowledgeProperties"];
  uint64_t v8 = [NSNumber numberWithInteger:self->_serializedDomainType];
  [v5 encodeObject:v8 forKey:@"serializedDomainType"];

  [v5 encodeObject:self->_serializedDomainResponse forKey:@"serializedDomainResponse"];
  v9 = [NSNumber numberWithUnsignedLongLong:self->_csuQid];
  [v5 encodeObject:v9 forKey:@"csuQid"];

  uint64_t v10 = [NSNumber numberWithShort:self->_csuIdType];
  [v5 encodeObject:v10 forKey:@"csuIdType"];

  [v5 encodeObject:self->_csuLocalizedLabel forKey:@"csuLocalizedLabel"];
  [v5 encodeObject:self->_csuLocalizedLabelDictionary forKey:@"csuLocalizedLabelDictionary"];
  v11 = [NSNumber numberWithDouble:self->_csuConfidence];
  [v5 encodeObject:v11 forKey:@"csuConfidence"];

  v12 = [NSNumber numberWithBool:self->_csuSensitiveLocation];
  [v5 encodeObject:v12 forKey:@"csuSensitiveLocation"];

  [v5 encodeObject:self->_csuCategory forKey:@"csuCategory"];
  [v5 encodeObject:self->_csuVertical forKey:@"csuVertical"];
  [v5 encodeObject:self->_csuLocalizedSynonymsDictionary forKey:@"csuLocalizedSynonymsDictionary"];
  float v13 = [NSNumber numberWithDouble:self->_csuLongitute];
  [v5 encodeObject:v13 forKey:@"csuLongitute"];

  uint64_t v14 = [NSNumber numberWithDouble:self->_csuLatitute];
  [v5 encodeObject:v14 forKey:@"csuLatitute"];

  id v15 = [NSNumber numberWithInt:self->_csuVersion];
  [v5 encodeObject:v15 forKey:@"csuVersion"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VIObjectKnowledge *)a3;
  if (v4 == self)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    double v6 = v5;
    v7 = [(VIObjectKnowledge *)v6 knowledgeGraphID];
    if (VIObjectIsEqual((unint64_t)v7, (uint64_t)self->_knowledgeGraphID))
    {
      uint64_t v8 = [(VIObjectKnowledge *)v6 title];
      if (VIObjectIsEqual((unint64_t)v8, (uint64_t)self->_title))
      {
        v9 = [(VIObjectKnowledge *)v6 thumbnailURL];
        if (VIObjectIsEqual((unint64_t)v9, (uint64_t)self->_thumbnailURL)
          && ([(VIObjectKnowledge *)v6 thumbnailAspectRatio],
              VICompareFloat(v10, self->_thumbnailAspectRatio)))
        {
          v11 = [(VIObjectKnowledge *)v6 shortDescription];
          if (VIObjectIsEqual((unint64_t)v11, (uint64_t)self->_shortDescription))
          {
            v12 = [(VIObjectKnowledge *)v6 detailedDescription];
            if (VIObjectIsEqual((unint64_t)v12, (uint64_t)self->_detailedDescription))
            {
              float v13 = [(VIObjectKnowledge *)v6 webURL];
              if (VIObjectIsEqual((unint64_t)v13, (uint64_t)self->_webURL))
              {
                uint64_t v14 = [(VIObjectKnowledge *)v6 knowledgeProperties];
                if (VIObjectIsEqual((unint64_t)v14, (uint64_t)self->_knowledgeProperties))
                {
                  uint64_t v20 = [(VIObjectKnowledge *)v6 csuLocalizedLabel];
                  if (VIObjectIsEqual((unint64_t)v20, (uint64_t)self->_csuLocalizedLabel)
                    && ([(VIObjectKnowledge *)v6 csuConfidence],
                        VICompareDouble(v15, self->_csuConfidence)))
                  {
                    v19 = [(VIObjectKnowledge *)v6 csuCategory];
                    if (VIObjectIsEqual((unint64_t)v19, (uint64_t)self->_csuCategory))
                    {
                      uint64_t v18 = [(VIObjectKnowledge *)v6 csuVertical];
                      BOOL v16 = VIObjectIsEqual((unint64_t)v18, (uint64_t)self->_csuVertical)
                         && VICompareUInt64([(VIObjectKnowledge *)v6 csuQid], self->_csuQid)
                         && self->_csuSensitiveLocation == [(VIObjectKnowledge *)v6 csuSensitiveLocation]&& [(VIObjectKnowledge *)v6 csuVersion] == self->_csuVersion;
                    }
                    else
                    {
                      BOOL v16 = 0;
                    }
                  }
                  else
                  {
                    BOOL v16 = 0;
                  }
                }
                else
                {
                  BOOL v16 = 0;
                }
              }
              else
              {
                BOOL v16 = 0;
              }
            }
            else
            {
              BOOL v16 = 0;
            }
          }
          else
          {
            BOOL v16 = 0;
          }
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_knowledgeGraphID hash];
  NSUInteger v4 = [(NSString *)self->_title hash];
  uint64_t v5 = [(NSURL *)self->_thumbnailURL hash];
  float thumbnailAspectRatio = self->_thumbnailAspectRatio;
  float v7 = -thumbnailAspectRatio;
  if (thumbnailAspectRatio >= 0.0) {
    float v7 = self->_thumbnailAspectRatio;
  }
  float v8 = floorf(v7 + 0.5);
  float v9 = (float)(v7 - v8) * 1.8447e19;
  float v10 = fmodf(v8, 1.8447e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabsf(v9);
  if (v9 < 0.0) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v12;
  }
  NSUInteger v15 = [(NSString *)self->_shortDescription hash];
  NSUInteger v16 = [(NSString *)self->_detailedDescription hash];
  uint64_t v17 = [(NSURL *)self->_webURL hash];
  uint64_t v18 = [(NSArray *)self->_knowledgeProperties hash];
  NSUInteger v19 = [(NSString *)self->_csuLocalizedLabel hash];
  double csuConfidence = self->_csuConfidence;
  double v21 = -csuConfidence;
  if (csuConfidence >= 0.0) {
    double v21 = self->_csuConfidence;
  }
  long double v22 = floor(v21 + 0.5);
  double v23 = (v21 - v22) * 1.84467441e19;
  double v24 = fmod(v22, 1.84467441e19);
  unint64_t v25 = 2654435761u * (unint64_t)v24;
  unint64_t v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0) {
    unint64_t v26 = 2654435761u * (unint64_t)v24;
  }
  unint64_t v27 = v25 - (unint64_t)fabs(v23);
  if (v23 >= 0.0) {
    unint64_t v27 = v26;
  }
  NSUInteger v28 = v4 ^ v3 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v27 ^ v5 ^ v14 ^ [(NSString *)self->_csuCategory hash];
  NSUInteger v29 = [(NSString *)self->_csuVertical hash];
  uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", self->_csuQid);
  unint64_t v31 = v28 ^ v29 ^ [v30 hash];

  return v31;
}

- (NSString)knowledgeGraphID
{
  return self->_knowledgeGraphID;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (float)thumbnailAspectRatio
{
  return self->_thumbnailAspectRatio;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (NSArray)knowledgeProperties
{
  return self->_knowledgeProperties;
}

- (unint64_t)csuQid
{
  return self->_csuQid;
}

- (signed)csuIdType
{
  return self->_csuIdType;
}

- (NSString)csuLocalizedLabel
{
  return self->_csuLocalizedLabel;
}

- (NSDictionary)csuLocalizedLabelDictionary
{
  return self->_csuLocalizedLabelDictionary;
}

- (double)csuConfidence
{
  return self->_csuConfidence;
}

- (BOOL)csuSensitiveLocation
{
  return self->_csuSensitiveLocation;
}

- (NSString)csuCategory
{
  return self->_csuCategory;
}

- (NSString)csuVertical
{
  return self->_csuVertical;
}

- (NSDictionary)csuLocalizedSynonymsDictionary
{
  return self->_csuLocalizedSynonymsDictionary;
}

- (double)csuLongitute
{
  return self->_csuLongitute;
}

- (double)csuLatitute
{
  return self->_csuLatitute;
}

- (int)csuVersion
{
  return self->_csuVersion;
}

- (int64_t)serializedDomainType
{
  return self->_serializedDomainType;
}

- (NSData)serializedDomainResponse
{
  return self->_serializedDomainResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedDomainResponse, 0);
  objc_storeStrong((id *)&self->_csuLocalizedSynonymsDictionary, 0);
  objc_storeStrong((id *)&self->_csuVertical, 0);
  objc_storeStrong((id *)&self->_csuCategory, 0);
  objc_storeStrong((id *)&self->_csuLocalizedLabelDictionary, 0);
  objc_storeStrong((id *)&self->_csuLocalizedLabel, 0);
  objc_storeStrong((id *)&self->_knowledgeProperties, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_detailedDescription, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_knowledgeGraphID, 0);
}

@end