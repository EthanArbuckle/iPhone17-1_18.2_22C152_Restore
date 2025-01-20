@interface TVRCMediaInfo
+ (BOOL)supportsSecureCoding;
+ (id)imageTemplateFromDict:(id)a3;
+ (id)mediaInfoWithDictionary:(id)a3;
+ (unint64_t)kindForMediaType:(id)a3;
- (BOOL)isAppleOriginal;
- (BOOL)isEqualToMediaInfo:(id)a3;
- (NSArray)roleCategories;
- (NSArray)roles;
- (NSDate)releaseDate;
- (NSNumber)duration;
- (NSNumber)episodeNumber;
- (NSNumber)seasonNumber;
- (NSString)extendedDescription;
- (NSString)genre;
- (NSString)identifier;
- (NSString)imageURLTemplate;
- (NSString)ratingDescription;
- (NSString)showIdentifier;
- (NSString)showTitle;
- (NSString)title;
- (NSURL)productURL;
- (NSURL)showURL;
- (TVRCMediaInfo)initWithCoder:(id)a3;
- (TVRCRottenTomatoesReview)rottenTomatoesReview;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)kind;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEpisodeNumber:(id)a3;
- (void)setExtendedDescription:(id)a3;
- (void)setGenre:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageURLTemplate:(id)a3;
- (void)setIsAppleOriginal:(BOOL)a3;
- (void)setKind:(unint64_t)a3;
- (void)setProductURL:(id)a3;
- (void)setRatingDescription:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setRoleCategories:(id)a3;
- (void)setRoles:(id)a3;
- (void)setRottenTomatoesReview:(id)a3;
- (void)setSeasonNumber:(id)a3;
- (void)setShowIdentifier:(id)a3;
- (void)setShowTitle:(id)a3;
- (void)setShowURL:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVRCMediaInfo

+ (id)mediaInfoWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  id v6 = [v4 objectForKeyedSubscript:@"content"];
  if (!v6) {
    id v6 = v4;
  }
  v7 = [v4 objectForKeyedSubscript:@"roles"];
  if (!v7)
  {
    v7 = [v4 objectForKeyedSubscript:@"roles"];
  }
  v8 = [v6 objectForKeyedSubscript:@"id"];
  [v5 setIdentifier:v8];

  v9 = [v6 objectForKeyedSubscript:@"title"];
  [v5 setTitle:v9];

  v10 = [v6 objectForKeyedSubscript:@"type"];
  objc_msgSend(v5, "setKind:", objc_msgSend(a1, "kindForMediaType:", v10));

  v11 = [v6 objectForKeyedSubscript:@"description"];
  [v5 setExtendedDescription:v11];

  v12 = [v6 objectForKeyedSubscript:@"genres"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [v12 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v13 objectForKeyedSubscript:@"name"];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  [v5 setGenre:v14];
  v15 = [a1 imageTemplateFromDict:v6];
  [v5 setImageURLTemplate:v15];

  v16 = [v6 objectForKeyedSubscript:@"rating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v16 objectForKeyedSubscript:@"displayName"];
  }
  else
  {
    v17 = 0;
  }

  [v5 setRatingDescription:v17];
  v18 = [v6 objectForKeyedSubscript:@"duration"];
  [v5 setDuration:v18];

  v19 = [v6 objectForKeyedSubscript:@"showTitle"];
  [v5 setShowTitle:v19];

  v20 = [v6 objectForKeyedSubscript:@"seasonNumber"];
  [v5 setSeasonNumber:v20];

  v21 = [v6 objectForKeyedSubscript:@"episodeNumber"];
  [v5 setEpisodeNumber:v21];

  v23 = __41__TVRCMediaInfo_mediaInfoWithDictionary___block_invoke(v22, v6);
  [v5 setProductURL:v23];

  v25 = __41__TVRCMediaInfo_mediaInfoWithDictionary___block_invoke(v24, v6);
  [v5 setShowURL:v25];

  v26 = [v6 objectForKeyedSubscript:@"showId"];
  [v5 setShowIdentifier:v26];

  v27 = [v6 objectForKeyedSubscript:@"isAppleOriginal"];
  objc_msgSend(v5, "setIsAppleOriginal:", objc_msgSend(v27, "BOOLValue"));

  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v29 = v7;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = +[TVRCMediaInfoRole roleWithDictionary:](TVRCMediaInfoRole, "roleWithDictionary:", *(void *)(*((void *)&v41 + 1) + 8 * i), (void)v41);
        [v28 addObject:v34];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v31);
  }

  [v5 setRoles:v28];
  v35 = [v6 objectForKeyedSubscript:@"releaseDate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v35 doubleValue], v36 > 0.0))
  {
    v37 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v36 / 1000.0];
  }
  else
  {
    v37 = 0;
  }

  [v5 setReleaseDate:v37];
  v38 = [v6 objectForKeyedSubscript:@"rottenTomatoesReviews"];
  if (v38)
  {
    v39 = +[TVRCRottenTomatoesReview rottenTomatoesReviewWithDictionary:v38];
  }
  else
  {
    v39 = 0;
  }

  [v5 setRottenTomatoesReview:v39];

  return v5;
}

id __41__TVRCMediaInfo_mediaInfoWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "objectForKeyedSubscript:");
  if ([v2 length])
  {
    v3 = [NSURL URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(TVRCMediaInfo *)self identifier];
  [v4 setIdentifier:v5];

  id v6 = [(TVRCMediaInfo *)self title];
  [v4 setTitle:v6];

  objc_msgSend(v4, "setKind:", -[TVRCMediaInfo kind](self, "kind"));
  v7 = [(TVRCMediaInfo *)self extendedDescription];
  [v4 setExtendedDescription:v7];

  v8 = [(TVRCMediaInfo *)self genre];
  [v4 setGenre:v8];

  v9 = [(TVRCMediaInfo *)self imageURLTemplate];
  [v4 setImageURLTemplate:v9];

  v10 = [(TVRCMediaInfo *)self ratingDescription];
  [v4 setRatingDescription:v10];

  v11 = [(TVRCMediaInfo *)self duration];
  [v4 setDuration:v11];

  v12 = [(TVRCMediaInfo *)self showTitle];
  [v4 setShowTitle:v12];

  v13 = [(TVRCMediaInfo *)self seasonNumber];
  [v4 setSeasonNumber:v13];

  v14 = [(TVRCMediaInfo *)self episodeNumber];
  [v4 setEpisodeNumber:v14];

  v15 = [(TVRCMediaInfo *)self productURL];
  [v4 setProductURL:v15];

  v16 = [(TVRCMediaInfo *)self showURL];
  [v4 setShowURL:v16];

  v17 = [(TVRCMediaInfo *)self showIdentifier];
  [v4 setShowIdentifier:v17];

  objc_msgSend(v4, "setIsAppleOriginal:", -[TVRCMediaInfo isAppleOriginal](self, "isAppleOriginal"));
  v18 = [(TVRCMediaInfo *)self roles];
  [v4 setRoles:v18];

  v19 = [(TVRCMediaInfo *)self releaseDate];
  [v4 setReleaseDate:v19];

  v20 = [(TVRCMediaInfo *)self rottenTomatoesReview];
  v21 = (void *)[v20 copy];
  [v4 setRottenTomatoesReview:v21];

  return v4;
}

- (BOOL)isEqualToMediaInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_43;
  }
  id v5 = [(TVRCMediaInfo *)self extendedDescription];
  id v6 = [v4 extendedDescription];
  char v7 = (v5 == 0) ^ (v6 == 0);

  if (v7) {
    goto LABEL_43;
  }
  v8 = [(TVRCMediaInfo *)self genre];
  v9 = [v4 genre];
  char v10 = (v8 == 0) ^ (v9 == 0);

  if (v10) {
    goto LABEL_43;
  }
  v11 = [(TVRCMediaInfo *)self imageURLTemplate];
  v12 = [v4 imageURLTemplate];
  char v13 = (v11 == 0) ^ (v12 == 0);

  if (v13) {
    goto LABEL_43;
  }
  v14 = [(TVRCMediaInfo *)self ratingDescription];
  v15 = [v4 ratingDescription];
  char v16 = (v14 == 0) ^ (v15 == 0);

  if (v16) {
    goto LABEL_43;
  }
  v17 = [(TVRCMediaInfo *)self showTitle];
  v18 = [v4 showTitle];
  char v19 = (v17 == 0) ^ (v18 == 0);

  if (v19) {
    goto LABEL_43;
  }
  v20 = [(TVRCMediaInfo *)self seasonNumber];
  v21 = [v4 seasonNumber];
  char v22 = (v20 == 0) ^ (v21 == 0);

  if (v22) {
    goto LABEL_43;
  }
  v23 = [(TVRCMediaInfo *)self episodeNumber];
  uint64_t v24 = [v4 episodeNumber];
  char v25 = (v23 == 0) ^ (v24 == 0);

  if (v25) {
    goto LABEL_43;
  }
  v26 = [(TVRCMediaInfo *)self showURL];
  v27 = [v4 showURL];
  char v28 = (v26 == 0) ^ (v27 == 0);

  if (v28) {
    goto LABEL_43;
  }
  id v29 = [(TVRCMediaInfo *)self showIdentifier];
  uint64_t v30 = [v4 showIdentifier];
  char v31 = (v29 == 0) ^ (v30 == 0);

  if (v31) {
    goto LABEL_43;
  }
  uint64_t v32 = [(TVRCMediaInfo *)self releaseDate];
  v33 = [v4 releaseDate];
  char v34 = (v32 == 0) ^ (v33 == 0);

  if (v34) {
    goto LABEL_43;
  }
  v35 = [(TVRCMediaInfo *)self rottenTomatoesReview];
  double v36 = [v4 rottenTomatoesReview];
  char v37 = (v35 == 0) ^ (v36 == 0);

  if (v37) {
    goto LABEL_43;
  }
  v38 = [(TVRCMediaInfo *)self identifier];
  v39 = [v4 identifier];
  int v40 = [v38 isEqualToString:v39];

  if (!v40) {
    goto LABEL_43;
  }
  long long v41 = [(TVRCMediaInfo *)self title];
  long long v42 = [v4 title];
  int v43 = [v41 isEqualToString:v42];

  if (!v43) {
    goto LABEL_43;
  }
  unint64_t v44 = [(TVRCMediaInfo *)self kind];
  if (v44 != [v4 kind]) {
    goto LABEL_43;
  }
  uint64_t v45 = [(TVRCMediaInfo *)self extendedDescription];
  if (v45)
  {
    uint64_t v46 = (void *)v45;
    v47 = [(TVRCMediaInfo *)self extendedDescription];
    v48 = [v4 extendedDescription];
    int v49 = [v47 isEqualToString:v48];

    if (!v49) {
      goto LABEL_43;
    }
  }
  uint64_t v50 = [(TVRCMediaInfo *)self genre];
  if (v50)
  {
    v51 = (void *)v50;
    v52 = [(TVRCMediaInfo *)self genre];
    v53 = [v4 genre];
    int v54 = [v52 isEqualToString:v53];

    if (!v54) {
      goto LABEL_43;
    }
  }
  uint64_t v55 = [(TVRCMediaInfo *)self imageURLTemplate];
  if (v55)
  {
    v56 = (void *)v55;
    v57 = [(TVRCMediaInfo *)self imageURLTemplate];
    v58 = [v4 imageURLTemplate];
    int v59 = [v57 isEqual:v58];

    if (!v59) {
      goto LABEL_43;
    }
  }
  uint64_t v60 = [(TVRCMediaInfo *)self ratingDescription];
  if (v60)
  {
    v61 = (void *)v60;
    v62 = [(TVRCMediaInfo *)self ratingDescription];
    v63 = [v4 ratingDescription];
    int v64 = [v62 isEqualToString:v63];

    if (!v64) {
      goto LABEL_43;
    }
  }
  v65 = [(TVRCMediaInfo *)self duration];
  v66 = [v4 duration];
  int v67 = [v65 isEqualToNumber:v66];

  if (!v67) {
    goto LABEL_43;
  }
  uint64_t v68 = [(TVRCMediaInfo *)self showTitle];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(TVRCMediaInfo *)self showTitle];
    v71 = [v4 showTitle];
    int v72 = [v70 isEqualToString:v71];

    if (!v72) {
      goto LABEL_43;
    }
  }
  uint64_t v73 = [(TVRCMediaInfo *)self seasonNumber];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(TVRCMediaInfo *)self seasonNumber];
    v76 = [v4 seasonNumber];
    int v77 = [v75 isEqualToNumber:v76];

    if (!v77) {
      goto LABEL_43;
    }
  }
  uint64_t v78 = [(TVRCMediaInfo *)self episodeNumber];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(TVRCMediaInfo *)self episodeNumber];
    v81 = [v4 episodeNumber];
    int v82 = [v80 isEqualToNumber:v81];

    if (!v82) {
      goto LABEL_43;
    }
  }
  v83 = [(TVRCMediaInfo *)self productURL];
  v84 = [v4 productURL];
  int v85 = [v83 isEqual:v84];

  if (!v85) {
    goto LABEL_43;
  }
  uint64_t v86 = [(TVRCMediaInfo *)self showURL];
  if (v86)
  {
    v87 = (void *)v86;
    v88 = [(TVRCMediaInfo *)self showURL];
    v89 = [v4 showURL];
    int v90 = [v88 isEqual:v89];

    if (!v90) {
      goto LABEL_43;
    }
  }
  uint64_t v91 = [(TVRCMediaInfo *)self showIdentifier];
  if (v91)
  {
    v92 = (void *)v91;
    v93 = [(TVRCMediaInfo *)self showIdentifier];
    v94 = [v4 showIdentifier];
    int v95 = [v93 isEqualToString:v94];

    if (!v95) {
      goto LABEL_43;
    }
  }
  int v96 = [(TVRCMediaInfo *)self isAppleOriginal];
  if (v96 != [v4 isAppleOriginal]) {
    goto LABEL_43;
  }
  v97 = [(TVRCMediaInfo *)self roles];
  v98 = [v4 roles];
  int v99 = [v97 isEqualToArray:v98];

  if (!v99) {
    goto LABEL_43;
  }
  uint64_t v100 = [(TVRCMediaInfo *)self releaseDate];
  if (!v100) {
    goto LABEL_41;
  }
  v101 = (void *)v100;
  v102 = [(TVRCMediaInfo *)self releaseDate];
  v103 = [v4 releaseDate];
  int v104 = [v102 isEqualToDate:v103];

  if (!v104)
  {
LABEL_43:
    char v109 = 0;
  }
  else
  {
LABEL_41:
    uint64_t v105 = [(TVRCMediaInfo *)self rottenTomatoesReview];
    if (v105)
    {
      v106 = (void *)v105;
      v107 = [(TVRCMediaInfo *)self rottenTomatoesReview];
      v108 = [v4 rottenTomatoesReview];
      char v109 = [v107 isEqualToRottenTomatoesReview:v108];
    }
    else
    {
      char v109 = 1;
    }
  }

  return v109;
}

- (NSArray)roleCategories
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  roleCategories = self->_roleCategories;
  if (!roleCategories)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v26 = self;
    id v6 = [(TVRCMediaInfo *)self roles];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v12 = [v11 roleDescription];
          if ([v12 length])
          {
            char v13 = [v11 roleDescription];
            id v14 = [v5 objectForKeyedSubscript:v13];

            if (!v14)
            {
              [v4 addObject:v12];
              id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v5 setObject:v14 forKeyedSubscript:v12];
            }
            [v14 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v8);
    }

    v15 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          char v22 = [v5 objectForKeyedSubscript:v21];
          if (v22)
          {
            v23 = +[TVRCMediaInfoRoleCategory roleCategoryWithRoleDescription:v21 roles:v22];
            [(NSArray *)v15 addObject:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v18);
    }

    uint64_t v24 = v26->_roleCategories;
    v26->_roleCategories = v15;

    roleCategories = v26->_roleCategories;
  }

  return roleCategories;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCMediaInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TVRCMediaInfo;
  id v5 = [(TVRCMediaInfo *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_kind = [v4 decodeIntegerForKey:@"kind"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extendedDescription"];
    extendedDescription = v5->_extendedDescription;
    v5->_extendedDescription = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    genre = v5->_genre;
    v5->_genre = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURLTemplate"];
    imageURLTemplate = v5->_imageURLTemplate;
    v5->_imageURLTemplate = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ratingDescription"];
    ratingDescription = v5->_ratingDescription;
    v5->_ratingDescription = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"duration"];
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showTitle"];
    showTitle = v5->_showTitle;
    v5->_showTitle = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seasonNumber"];
    seasonNumber = v5->_seasonNumber;
    v5->_seasonNumber = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"episodeNumber"];
    episodeNumber = v5->_episodeNumber;
    v5->_episodeNumber = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productURL"];
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showURL"];
    showURL = v5->_showURL;
    v5->_showURL = (NSURL *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showIdentifier"];
    showIdentifier = v5->_showIdentifier;
    v5->_showIdentifier = (NSString *)v30;

    v5->_isAppleOriginal = [v4 decodeBoolForKey:@"isAppleOriginal"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roles"];
    roles = v5->_roles;
    v5->_roles = (NSArray *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseDate"];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rottenTomatoesReview"];
    rottenTomatoesReview = v5->_rottenTomatoesReview;
    v5->_rottenTomatoesReview = (TVRCRottenTomatoesReview *)v36;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeInteger:self->_kind forKey:@"kind"];
  [v5 encodeObject:self->_extendedDescription forKey:@"extendedDescription"];
  [v5 encodeObject:self->_genre forKey:@"genre"];
  [v5 encodeObject:self->_imageURLTemplate forKey:@"imageURLTemplate"];
  [v5 encodeObject:self->_ratingDescription forKey:@"ratingDescription"];
  [v5 encodeObject:self->_duration forKey:@"duration"];
  [v5 encodeObject:self->_showTitle forKey:@"showTitle"];
  [v5 encodeObject:self->_seasonNumber forKey:@"seasonNumber"];
  [v5 encodeObject:self->_episodeNumber forKey:@"episodeNumber"];
  [v5 encodeObject:self->_productURL forKey:@"productURL"];
  [v5 encodeObject:self->_showURL forKey:@"showURL"];
  [v5 encodeObject:self->_showIdentifier forKey:@"showIdentifier"];
  [v5 encodeBool:self->_isAppleOriginal forKey:@"isAppleOriginal"];
  [v5 encodeObject:self->_roles forKey:@"roles"];
  [v5 encodeObject:self->_releaseDate forKey:@"releaseDate"];
  [v5 encodeObject:self->_rottenTomatoesReview forKey:@"rottenTomatoesReview"];
}

+ (unint64_t)kindForMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Episode"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Movie"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Show"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"SportingEvent"])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)imageTemplateFromDict:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [a3 objectForKeyedSubscript:@"images"];
  if (v3
    && (long long v14 = 0u,
        long long v15 = 0u,
        long long v12 = 0u,
        long long v13 = 0u,
        (uint64_t v4 = [&unk_26DA62FB0 countByEnumeratingWithState:&v12 objects:v16 count:16]) != 0))
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&unk_26DA62FB0);
        }
        uint64_t v8 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v8)
        {
          uint64_t v10 = v8;
          uint64_t v9 = [v8 objectForKeyedSubscript:@"url"];

          goto LABEL_13;
        }
      }
      uint64_t v5 = [&unk_26DA62FB0 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_13:

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (NSString)extendedDescription
{
  return self->_extendedDescription;
}

- (void)setExtendedDescription:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSString)imageURLTemplate
{
  return self->_imageURLTemplate;
}

- (void)setImageURLTemplate:(id)a3
{
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void)setRatingDescription:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (void)setShowTitle:(id)a3
{
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (void)setProductURL:(id)a3
{
}

- (NSURL)showURL
{
  return self->_showURL;
}

- (void)setShowURL:(id)a3
{
}

- (NSString)showIdentifier
{
  return self->_showIdentifier;
}

- (void)setShowIdentifier:(id)a3
{
}

- (BOOL)isAppleOriginal
{
  return self->_isAppleOriginal;
}

- (void)setIsAppleOriginal:(BOOL)a3
{
  self->_isAppleOriginal = a3;
}

- (NSArray)roles
{
  return self->_roles;
}

- (void)setRoles:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (TVRCRottenTomatoesReview)rottenTomatoesReview
{
  return self->_rottenTomatoesReview;
}

- (void)setRottenTomatoesReview:(id)a3
{
}

- (void)setRoleCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleCategories, 0);
  objc_storeStrong((id *)&self->_rottenTomatoesReview, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_roles, 0);
  objc_storeStrong((id *)&self->_showIdentifier, 0);
  objc_storeStrong((id *)&self->_showURL, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_imageURLTemplate, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_extendedDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end