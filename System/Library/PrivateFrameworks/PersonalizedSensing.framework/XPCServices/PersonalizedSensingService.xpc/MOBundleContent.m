@interface MOBundleContent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCityName;
- (BOOL)hasPersonName;
- (BOOL)hasPlaceName;
- (BOOL)hasTimeReference;
- (BOOL)isEqual:(id)a3;
- (MOBundleContent)initWithBundleContentIdentifier:(id)a3;
- (MOBundleContent)initWithCoder:(id)a3;
- (NSArray)personNames;
- (NSDictionary)llmInputDictionary;
- (NSString)cityName;
- (NSString)musicSuggestionArtistName;
- (NSString)musicSuggestionContentRating;
- (NSString)musicSuggestionSongTitle;
- (NSString)musicSuggestionTrackID;
- (NSString)placeName;
- (NSString)suggestionLabel;
- (NSString)timeReference;
- (NSUUID)associatedBundleID;
- (NSUUID)associatedSuggestionID;
- (NSUUID)bundleContentIdentifier;
- (double)bundleGoodnessScore;
- (double)contextGoodnessScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)metadataDict;
- (unint64_t)activityType;
- (unint64_t)bundleType;
- (unint64_t)compareMetadataWith:(id)a3;
- (unint64_t)patternType;
- (unint64_t)peopleClassification;
- (unint64_t)photoTrait;
- (unint64_t)placeType;
- (unint64_t)time;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityType:(unint64_t)a3;
- (void)setAssociatedBundleID:(id)a3;
- (void)setAssociatedSuggestionID:(id)a3;
- (void)setBundleContentIdentifier:(id)a3;
- (void)setBundleGoodnessScore:(double)a3;
- (void)setBundleType:(unint64_t)a3;
- (void)setCityName:(id)a3;
- (void)setContextGoodnessScore:(double)a3;
- (void)setHasCityName:(BOOL)a3;
- (void)setHasPersonName:(BOOL)a3;
- (void)setHasPlaceName:(BOOL)a3;
- (void)setHasTimeReference:(BOOL)a3;
- (void)setLlmInputDictionary:(id)a3;
- (void)setMusicSuggestionArtistName:(id)a3;
- (void)setMusicSuggestionContentRating:(id)a3;
- (void)setMusicSuggestionSongTitle:(id)a3;
- (void)setMusicSuggestionTrackID:(id)a3;
- (void)setPatternType:(unint64_t)a3;
- (void)setPeopleClassification:(unint64_t)a3;
- (void)setPersonNames:(id)a3;
- (void)setPhotoTrait:(unint64_t)a3;
- (void)setPlaceName:(id)a3;
- (void)setPlaceType:(unint64_t)a3;
- (void)setSuggestionLabel:(id)a3;
- (void)setTime:(unint64_t)a3;
- (void)setTimeReference:(id)a3;
@end

@implementation MOBundleContent

- (MOBundleContent)initWithBundleContentIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOBundleContent;
  v6 = [(MOBundleContent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleContentIdentifier, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleContentIdentifier = self->_bundleContentIdentifier;
  id v6 = a3;
  [v6 encodeObject:bundleContentIdentifier forKey:@"bundleContentIdentifier"];
  [v6 encodeInteger:self->_patternType forKey:@"patternType"];
  [v6 encodeInteger:self->_placeType forKey:@"placeType"];
  [v6 encodeInteger:self->_bundleType forKey:@"bundleType"];
  [v6 encodeInteger:self->_peopleClassification forKey:@"peopleClassification"];
  [v6 encodeInteger:self->_time forKey:@"time"];
  [v6 encodeInteger:self->_activityType forKey:@"activityType"];
  id v5 = +[MODictionaryEncoder encodeDictionary:self->_llmInputDictionary];
  [v6 encodeObject:v5 forKey:@"llmInputDictionary"];

  [v6 encodeBool:self->_hasPersonName forKey:@"hasPersonName"];
  [v6 encodeBool:self->_hasPlaceName forKey:@"hasPlaceName"];
  [v6 encodeBool:self->_hasCityName forKey:@"hasCityName"];
  [v6 encodeBool:self->_hasTimeReference forKey:@"hasTimeReference"];
  [v6 encodeObject:self->_personNames forKey:@"personNames"];
  [v6 encodeObject:self->_placeName forKey:@"placeName"];
  [v6 encodeObject:self->_cityName forKey:@"cityName"];
  [v6 encodeObject:self->_timeReference forKey:@"timeReference"];
  [v6 encodeObject:self->_musicSuggestionSongTitle forKey:@"musicSuggestionSongTitle"];
  [v6 encodeObject:self->_musicSuggestionArtistName forKey:@"musicSuggestionArtistName"];
  [v6 encodeObject:self->_musicSuggestionTrackID forKey:@"musicSuggestionTrackID"];
  [v6 encodeObject:self->_musicSuggestionContentRating forKey:@"musicSuggestionContentRating"];
  [v6 encodeObject:self->_suggestionLabel forKey:@"suggestionLabel"];
  [v6 encodeObject:self->_associatedBundleID forKey:@"associatedBundleID"];
  [v6 encodeObject:self->_associatedSuggestionID forKey:@"associatedSuggestionID"];
  [v6 encodeObject:self->_bundleContentIdentifier forKey:@"bundleContentIdentifier"];
  [v6 encodeInteger:self->_photoTrait forKey:@"photoTrait"];
}

- (MOBundleContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MOBundleContent;
  id v5 = [(MOBundleContent *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleContentIdentifier"];
    bundleContentIdentifier = v5->_bundleContentIdentifier;
    v5->_bundleContentIdentifier = (NSUUID *)v6;

    v5->_patternType = (unint64_t)[v4 decodeIntegerForKey:@"patternType"];
    v5->_placeType = (unint64_t)[v4 decodeIntegerForKey:@"placeType"];
    v5->_bundleType = (unint64_t)[v4 decodeIntegerForKey:@"bundleType"];
    v5->_peopleClassification = (unint64_t)[v4 decodeIntegerForKey:@"peopleClassification"];
    v5->_time = (unint64_t)[v4 decodeIntegerForKey:@"time"];
    v5->_activityType = (unint64_t)[v4 decodeIntegerForKey:@"activityType"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"llmInputDictionary"];
    uint64_t v9 = +[MODictionaryEncoder decodeToDictionary:v8];
    llmInputDictionary = v5->_llmInputDictionary;
    v5->_llmInputDictionary = (NSDictionary *)v9;

    v5->_hasPersonName = [v4 decodeBoolForKey:@"hasPersonName"];
    v5->_hasPlaceName = [v4 decodeBoolForKey:@"hasPlaceName"];
    v5->_hasCityName = [v4 decodeBoolForKey:@"hasCityName"];
    v5->_hasTimeReference = [v4 decodeBoolForKey:@"hasTimeReference"];
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"personNames"];
    personNames = v5->_personNames;
    v5->_personNames = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeName"];
    placeName = v5->_placeName;
    v5->_placeName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cityName"];
    cityName = v5->_cityName;
    v5->_cityName = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeReference"];
    timeReference = v5->_timeReference;
    v5->_timeReference = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"musicSuggestionSongTitle"];
    musicSuggestionSongTitle = v5->_musicSuggestionSongTitle;
    v5->_musicSuggestionSongTitle = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"musicSuggestionArtistName"];
    musicSuggestionArtistName = v5->_musicSuggestionArtistName;
    v5->_musicSuggestionArtistName = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"musicSuggestionTrackID"];
    musicSuggestionTrackID = v5->_musicSuggestionTrackID;
    v5->_musicSuggestionTrackID = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"musicSuggestionContentRating"];
    musicSuggestionContentRating = v5->_musicSuggestionContentRating;
    v5->_musicSuggestionContentRating = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionLabel"];
    suggestionLabel = v5->_suggestionLabel;
    v5->_suggestionLabel = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedBundleID"];
    associatedBundleID = v5->_associatedBundleID;
    v5->_associatedBundleID = (NSUUID *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedSuggestionID"];
    associatedSuggestionID = v5->_associatedSuggestionID;
    v5->_associatedSuggestionID = (NSUUID *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleContentIdentifier"];
    v36 = v5->_bundleContentIdentifier;
    v5->_bundleContentIdentifier = (NSUUID *)v35;

    v5->_photoTrait = (unint64_t)[v4 decodeIntegerForKey:@"photoTrait"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOBundleContent);
  objc_storeStrong((id *)&v4->_bundleContentIdentifier, self->_bundleContentIdentifier);
  v4->_patternType = self->_patternType;
  v4->_placeType = self->_placeType;
  v4->_bundleType = self->_bundleType;
  v4->_peopleClassification = self->_peopleClassification;
  v4->_time = self->_time;
  v4->_activityType = self->_activityType;
  objc_storeStrong((id *)&v4->_llmInputDictionary, self->_llmInputDictionary);
  v4->_hasPersonName = self->_hasPersonName;
  v4->_hasPlaceName = self->_hasPlaceName;
  v4->_hasCityName = self->_hasCityName;
  v4->_hasTimeReference = self->_hasTimeReference;
  objc_storeStrong((id *)&v4->_suggestionLabel, self->_suggestionLabel);
  objc_storeStrong((id *)&v4->_associatedBundleID, self->_associatedBundleID);
  objc_storeStrong((id *)&v4->_associatedSuggestionID, self->_associatedSuggestionID);
  objc_storeStrong((id *)&v4->_bundleContentIdentifier, self->_bundleContentIdentifier);
  objc_storeStrong((id *)&v4->_personNames, self->_personNames);
  objc_storeStrong((id *)&v4->_placeName, self->_placeName);
  objc_storeStrong((id *)&v4->_cityName, self->_cityName);
  objc_storeStrong((id *)&v4->_timeReference, self->_timeReference);
  v4->_photoTrait = self->_photoTrait;
  objc_storeStrong((id *)&v4->_musicSuggestionSongTitle, self->_musicSuggestionSongTitle);
  objc_storeStrong((id *)&v4->_musicSuggestionArtistName, self->_musicSuggestionArtistName);
  objc_storeStrong((id *)&v4->_musicSuggestionContentRating, self->_musicSuggestionContentRating);
  return v4;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"bundle Content Identifier, %@, associated bundleID, %@, associated suggestionID, %@, bundleType %ld, placeType %ld, activityType %ld, photoTrait %ld, peopleClassification %ld, hasPersonName %d, hasPlaceName %d, hasCityName %d, hasTimeReference %d, patternType %ld", self->_bundleContentIdentifier, self->_associatedBundleID, self->_associatedSuggestionID, self->_bundleType, self->_placeType, self->_activityType, self->_photoTrait, self->_peopleClassification, self->_hasPersonName, self->_hasPlaceName, self->_hasCityName, self->_hasTimeReference, self->_patternType];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (MOBundleContent *)a3;
  v7 = v6;
  if (self == v6)
  {
    char v12 = 1;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = v7;
        uint64_t v9 = [(MOBundleContent *)self bundleContentIdentifier];
        if (v9
          || ([(MOBundleContent *)v8 bundleContentIdentifier],
              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v4 = [(MOBundleContent *)self bundleContentIdentifier];
          v10 = [(MOBundleContent *)v8 bundleContentIdentifier];
          unsigned __int8 v11 = [v4 isEqual:v10];

          if (v9)
          {
LABEL_12:

            uint64_t v13 = [(MOBundleContent *)self associatedBundleID];
            if (v13
              || ([(MOBundleContent *)v8 associatedBundleID],
                  (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v14 = [(MOBundleContent *)self associatedBundleID];
              uint64_t v15 = [(MOBundleContent *)v8 associatedBundleID];
              unsigned __int8 v16 = [v14 isEqual:v15];

              if (v13)
              {
LABEL_18:

                uint64_t v17 = [(MOBundleContent *)self associatedSuggestionID];
                if (v17
                  || ([(MOBundleContent *)v8 associatedSuggestionID],
                      (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v18 = [(MOBundleContent *)self associatedSuggestionID];
                  uint64_t v19 = [(MOBundleContent *)v8 associatedSuggestionID];
                  unsigned __int8 v20 = [v18 isEqual:v19];

                  if (v17)
                  {
LABEL_24:

                    char v12 = v11 & v16 & v20;
                    goto LABEL_25;
                  }
                }
                else
                {
                  unsigned __int8 v20 = 1;
                }

                goto LABEL_24;
              }
            }
            else
            {
              unsigned __int8 v16 = 1;
            }

            goto LABEL_18;
          }
        }
        else
        {
          unsigned __int8 v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v12 = 0;
  }
LABEL_25:

  return v12;
}

- (unint64_t)compareMetadataWith:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    unint64_t v22 = 0;
    goto LABEL_40;
  }
  id v5 = [(MOBundleContent *)self metadataDict];
  id v28 = v4;
  uint64_t v6 = [v4 metadataDict];
  uint64_t v27 = (char *)[v5 count];
  v26 = (char *)[v6 count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v43 count:16];
  if (!v8)
  {
    v10 = 0;
    goto LABEL_22;
  }
  id v9 = v8;
  v10 = 0;
  uint64_t v11 = *(void *)v30;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      if ([&off_1000B8120 containsObject:v13])
      {
        uint64_t v14 = [v6 objectForKeyedSubscript:v13];
        if (!v14) {
          continue;
        }
        uint64_t v15 = (void *)v14;
        unsigned __int8 v16 = [v7 objectForKeyedSubscript:v13];
        uint64_t v17 = [v6 objectForKeyedSubscript:v13];
        unsigned int v18 = [v16 isEqualToNumber:v17];
        goto LABEL_16;
      }
      if ([&off_1000B8138 containsObject:v13])
      {
        uint64_t v19 = [v6 objectForKeyedSubscript:v13];
        if (!v19) {
          continue;
        }
        uint64_t v15 = (void *)v19;
        unsigned __int8 v16 = [v7 objectForKeyedSubscript:v13];
        uint64_t v17 = [v6 objectForKeyedSubscript:v13];
        unsigned int v18 = [v16 isEqualToString:v17];
        goto LABEL_16;
      }
      if ([&off_1000B8150 containsObject:v13])
      {
        uint64_t v20 = [v6 objectForKeyedSubscript:v13];
        if (v20)
        {
          uint64_t v15 = (void *)v20;
          unsigned __int8 v16 = [v7 objectForKeyedSubscript:v13];
          uint64_t v17 = [v6 objectForKeyedSubscript:v13];
          unsigned int v18 = [v16 isEqualToSet:v17];
LABEL_16:
          unsigned int v21 = v18;

          v10 += v21;
          continue;
        }
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v29 objects:v43 count:16];
  }
  while (v9);
LABEL_22:

  uint64_t v23 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v34 = v7;
    __int16 v35 = 2112;
    v36 = v6;
    __int16 v37 = 2048;
    objc_super v38 = v27;
    __int16 v39 = 2048;
    v40 = v26;
    __int16 v41 = 2048;
    v42 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "selfMetadata %@ otherMetadata %@: selfMetadataCount %lu,otherMetadataCount %lu,overlappedMetadataCount %lu", buf, 0x34u);
  }

  if (v10 == v27 && v10 == v26)
  {
    unint64_t v22 = 1;
  }
  else if (v10 >= v27 || v10 >= v26)
  {
    if (v10 == v27 && v10 < v26)
    {
      unint64_t v22 = 4;
    }
    else if (v10 < v27 && v10 == v26)
    {
      unint64_t v22 = 3;
    }
    else
    {
      unint64_t v22 = 0;
    }
  }
  else
  {
    unint64_t v22 = 2;
  }

  id v4 = v28;
LABEL_40:

  return v22;
}

- (id)metadataDict
{
  v3 = objc_opt_new();
  if ([(MOBundleContent *)self patternType])
  {
    id v4 = +[NSNumber numberWithUnsignedInteger:[(MOBundleContent *)self patternType]];
    [v3 setObject:v4 forKeyedSubscript:@"patternType"];
  }
  if ([(MOBundleContent *)self activityType])
  {
    id v5 = +[NSNumber numberWithUnsignedInteger:[(MOBundleContent *)self activityType]];
    [v3 setObject:v5 forKeyedSubscript:@"activityType"];
  }
  if ([(MOBundleContent *)self placeType])
  {
    uint64_t v6 = +[NSNumber numberWithUnsignedInteger:[(MOBundleContent *)self placeType]];
    [v3 setObject:v6 forKeyedSubscript:@"placeType"];
  }
  if ([(MOBundleContent *)self bundleType])
  {
    id v7 = +[NSNumber numberWithUnsignedInteger:[(MOBundleContent *)self bundleType]];
    [v3 setObject:v7 forKeyedSubscript:@"bundleType"];
  }
  if ([(MOBundleContent *)self peopleClassification])
  {
    id v8 = +[NSNumber numberWithUnsignedInteger:[(MOBundleContent *)self peopleClassification]];
    [v3 setObject:v8 forKeyedSubscript:@"peopleClassification"];
  }
  if ([(MOBundleContent *)self hasPersonName])
  {
    id v9 = [(MOBundleContent *)self personNames];
    v10 = +[NSSet setWithArray:v9];
    [v3 setObject:v10 forKeyedSubscript:@"personNames"];
  }
  if ([(MOBundleContent *)self hasPlaceName])
  {
    uint64_t v11 = [(MOBundleContent *)self placeName];
    [v3 setObject:v11 forKeyedSubscript:@"placeName"];
  }
  if ([(MOBundleContent *)self hasCityName])
  {
    char v12 = [(MOBundleContent *)self cityName];
    [v3 setObject:v12 forKeyedSubscript:@"cityName"];
  }
  if ([(MOBundleContent *)self photoTrait])
  {
    uint64_t v13 = +[NSNumber numberWithUnsignedInteger:[(MOBundleContent *)self photoTrait]];
    [v3 setObject:v13 forKeyedSubscript:@"photoTrait"];
  }
  uint64_t v14 = [(MOBundleContent *)self musicSuggestionArtistName];

  if (v14)
  {
    uint64_t v15 = [(MOBundleContent *)self musicSuggestionArtistName];
    [v3 setObject:v15 forKeyedSubscript:@"musicSuggestionArtistName"];
  }
  return v3;
}

- (NSUUID)bundleContentIdentifier
{
  return self->_bundleContentIdentifier;
}

- (void)setBundleContentIdentifier:(id)a3
{
}

- (NSDictionary)llmInputDictionary
{
  return self->_llmInputDictionary;
}

- (void)setLlmInputDictionary:(id)a3
{
}

- (unint64_t)patternType
{
  return self->_patternType;
}

- (void)setPatternType:(unint64_t)a3
{
  self->_patternType = a3;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(unint64_t)a3
{
  self->_activityType = a3;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (void)setPlaceType:(unint64_t)a3
{
  self->_placeType = a3;
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  self->_time = a3;
}

- (unint64_t)bundleType
{
  return self->_bundleType;
}

- (void)setBundleType:(unint64_t)a3
{
  self->_bundleType = a3;
}

- (unint64_t)peopleClassification
{
  return self->_peopleClassification;
}

- (void)setPeopleClassification:(unint64_t)a3
{
  self->_peopleClassification = a3;
}

- (BOOL)hasPersonName
{
  return self->_hasPersonName;
}

- (void)setHasPersonName:(BOOL)a3
{
  self->_hasPersonName = a3;
}

- (BOOL)hasPlaceName
{
  return self->_hasPlaceName;
}

- (void)setHasPlaceName:(BOOL)a3
{
  self->_hasPlaceName = a3;
}

- (BOOL)hasCityName
{
  return self->_hasCityName;
}

- (void)setHasCityName:(BOOL)a3
{
  self->_hasCityName = a3;
}

- (BOOL)hasTimeReference
{
  return self->_hasTimeReference;
}

- (void)setHasTimeReference:(BOOL)a3
{
  self->_hasTimeReference = a3;
}

- (NSArray)personNames
{
  return self->_personNames;
}

- (void)setPersonNames:(id)a3
{
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
}

- (NSString)cityName
{
  return self->_cityName;
}

- (void)setCityName:(id)a3
{
}

- (NSString)timeReference
{
  return self->_timeReference;
}

- (void)setTimeReference:(id)a3
{
}

- (unint64_t)photoTrait
{
  return self->_photoTrait;
}

- (void)setPhotoTrait:(unint64_t)a3
{
  self->_photoTrait = a3;
}

- (NSString)suggestionLabel
{
  return self->_suggestionLabel;
}

- (void)setSuggestionLabel:(id)a3
{
}

- (NSString)musicSuggestionSongTitle
{
  return self->_musicSuggestionSongTitle;
}

- (void)setMusicSuggestionSongTitle:(id)a3
{
}

- (NSString)musicSuggestionArtistName
{
  return self->_musicSuggestionArtistName;
}

- (void)setMusicSuggestionArtistName:(id)a3
{
}

- (NSString)musicSuggestionTrackID
{
  return self->_musicSuggestionTrackID;
}

- (void)setMusicSuggestionTrackID:(id)a3
{
}

- (NSString)musicSuggestionContentRating
{
  return self->_musicSuggestionContentRating;
}

- (void)setMusicSuggestionContentRating:(id)a3
{
}

- (NSUUID)associatedBundleID
{
  return self->_associatedBundleID;
}

- (void)setAssociatedBundleID:(id)a3
{
}

- (NSUUID)associatedSuggestionID
{
  return self->_associatedSuggestionID;
}

- (void)setAssociatedSuggestionID:(id)a3
{
}

- (double)bundleGoodnessScore
{
  return self->_bundleGoodnessScore;
}

- (void)setBundleGoodnessScore:(double)a3
{
  self->_bundleGoodnessScore = a3;
}

- (double)contextGoodnessScore
{
  return self->_contextGoodnessScore;
}

- (void)setContextGoodnessScore:(double)a3
{
  self->_contextGoodnessScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedSuggestionID, 0);
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
  objc_storeStrong((id *)&self->_musicSuggestionContentRating, 0);
  objc_storeStrong((id *)&self->_musicSuggestionTrackID, 0);
  objc_storeStrong((id *)&self->_musicSuggestionArtistName, 0);
  objc_storeStrong((id *)&self->_musicSuggestionSongTitle, 0);
  objc_storeStrong((id *)&self->_suggestionLabel, 0);
  objc_storeStrong((id *)&self->_timeReference, 0);
  objc_storeStrong((id *)&self->_cityName, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_personNames, 0);
  objc_storeStrong((id *)&self->_llmInputDictionary, 0);
  objc_storeStrong((id *)&self->_bundleContentIdentifier, 0);
}

@end