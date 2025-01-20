@interface TVRCNowPlayingMetadata
+ (BOOL)supportsSecureCoding;
+ (id)currentAudioLanguageOptionFromContentItem:(id)a3;
+ (id)metadataFromContentItem:(id)a3;
- (BOOL)isAppleOriginal;
- (BOOL)isEqualToNowPlayingMetadata:(id)a3;
- (BOOL)isMissingCriticalMetadata;
- (BOOL)isPlayingOnTVApp;
- (NSDate)releaseDate;
- (NSNumber)duration;
- (NSNumber)episodeNumber;
- (NSNumber)mainContentStartTime;
- (NSNumber)seasonNumber;
- (NSNumber)timeOffset;
- (NSNumber)timestamp;
- (NSString)audioLanguage;
- (NSString)bundleID;
- (NSString)canonicalID;
- (NSString)currentlyPlayingSongID;
- (NSString)episodeTitle;
- (NSString)extendedDescription;
- (NSString)genre;
- (NSString)iTunesStoreIdentifier;
- (NSString)imageURLTemplate;
- (NSString)programID;
- (NSString)ratingDescription;
- (NSString)showID;
- (NSString)title;
- (NSURL)productPageURL;
- (NSURL)showProductPageURL;
- (TVRCNowPlayingMetadata)initWithCoder:(id)a3;
- (TVRCRottenTomatoesReview)rottenTomatoesReview;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)kind;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioLanguage:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCanonicalID:(id)a3;
- (void)setCurrentlyPlayingSongID:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEpisodeNumber:(id)a3;
- (void)setEpisodeTitle:(id)a3;
- (void)setExtendedDescription:(id)a3;
- (void)setGenre:(id)a3;
- (void)setITunesStoreIdentifier:(id)a3;
- (void)setImageURLTemplate:(id)a3;
- (void)setIsAppleOriginal:(BOOL)a3;
- (void)setKind:(unint64_t)a3;
- (void)setMainContentStartTime:(id)a3;
- (void)setProductPageURL:(id)a3;
- (void)setProgramID:(id)a3;
- (void)setRatingDescription:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setRottenTomatoesReview:(id)a3;
- (void)setSeasonNumber:(id)a3;
- (void)setShowID:(id)a3;
- (void)setShowProductPageURL:(id)a3;
- (void)setTimeOffset:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVRCNowPlayingMetadata

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(TVRCNowPlayingMetadata *)self canonicalID];
  v7 = [(TVRCNowPlayingMetadata *)self title];
  v8 = [v3 stringWithFormat:@"<%@ %p: canonicalID=%@ title=%@>", v5, self, v6, v7];;

  return v8;
}

- (BOOL)isEqualToNowPlayingMetadata:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_73;
  }
  v5 = [(TVRCNowPlayingMetadata *)self canonicalID];
  v6 = [v4 canonicalID];
  char v7 = (v5 == 0) ^ (v6 == 0);

  if (v7) {
    goto LABEL_73;
  }
  v8 = [(TVRCNowPlayingMetadata *)self title];
  v9 = [v4 title];
  char v10 = (v8 == 0) ^ (v9 == 0);

  if (v10) {
    goto LABEL_73;
  }
  v11 = [(TVRCNowPlayingMetadata *)self genre];
  v12 = [v4 genre];
  char v13 = (v11 == 0) ^ (v12 == 0);

  if (v13) {
    goto LABEL_73;
  }
  v14 = [(TVRCNowPlayingMetadata *)self episodeTitle];
  v15 = [v4 episodeTitle];
  char v16 = (v14 == 0) ^ (v15 == 0);

  if (v16) {
    goto LABEL_73;
  }
  v17 = [(TVRCNowPlayingMetadata *)self duration];
  v18 = [v4 duration];
  char v19 = (v17 == 0) ^ (v18 == 0);

  if (v19) {
    goto LABEL_73;
  }
  v20 = [(TVRCNowPlayingMetadata *)self showID];
  v21 = [v4 showID];
  char v22 = (v20 == 0) ^ (v21 == 0);

  if (v22) {
    goto LABEL_73;
  }
  v23 = [(TVRCNowPlayingMetadata *)self seasonNumber];
  v24 = [v4 seasonNumber];
  char v25 = (v23 == 0) ^ (v24 == 0);

  if (v25) {
    goto LABEL_73;
  }
  v26 = [(TVRCNowPlayingMetadata *)self episodeNumber];
  v27 = [v4 episodeNumber];
  char v28 = (v26 == 0) ^ (v27 == 0);

  if (v28) {
    goto LABEL_73;
  }
  v29 = [(TVRCNowPlayingMetadata *)self ratingDescription];
  v30 = [v4 ratingDescription];
  char v31 = (v29 == 0) ^ (v30 == 0);

  if (v31) {
    goto LABEL_73;
  }
  v32 = [(TVRCNowPlayingMetadata *)self extendedDescription];
  v33 = [v4 extendedDescription];
  char v34 = (v32 == 0) ^ (v33 == 0);

  if (v34) {
    goto LABEL_73;
  }
  v35 = [(TVRCNowPlayingMetadata *)self iTunesStoreIdentifier];
  v36 = [v4 iTunesStoreIdentifier];
  char v37 = (v35 == 0) ^ (v36 == 0);

  if (v37) {
    goto LABEL_73;
  }
  v38 = [(TVRCNowPlayingMetadata *)self productPageURL];
  v39 = [v4 productPageURL];
  char v40 = (v38 == 0) ^ (v39 == 0);

  if (v40) {
    goto LABEL_73;
  }
  v41 = [(TVRCNowPlayingMetadata *)self showProductPageURL];
  v42 = [v4 showProductPageURL];
  char v43 = (v41 == 0) ^ (v42 == 0);

  if (v43) {
    goto LABEL_73;
  }
  v44 = [(TVRCNowPlayingMetadata *)self mainContentStartTime];
  v45 = [v4 mainContentStartTime];
  char v46 = (v44 == 0) ^ (v45 == 0);

  if (v46) {
    goto LABEL_73;
  }
  v47 = [(TVRCNowPlayingMetadata *)self programID];
  v48 = [v4 programID];
  char v49 = (v47 == 0) ^ (v48 == 0);

  if (v49) {
    goto LABEL_73;
  }
  v50 = [(TVRCNowPlayingMetadata *)self timeOffset];
  v51 = [v4 timeOffset];
  char v52 = (v50 == 0) ^ (v51 == 0);

  if (v52) {
    goto LABEL_73;
  }
  v53 = [(TVRCNowPlayingMetadata *)self audioLanguage];
  v54 = [v4 audioLanguage];
  char v55 = (v53 == 0) ^ (v54 == 0);

  if (v55) {
    goto LABEL_73;
  }
  v56 = [(TVRCNowPlayingMetadata *)self timestamp];
  v57 = [v4 timestamp];
  char v58 = (v56 == 0) ^ (v57 == 0);

  if (v58) {
    goto LABEL_73;
  }
  v59 = [(TVRCNowPlayingMetadata *)self currentlyPlayingSongID];
  v60 = [v4 currentlyPlayingSongID];
  char v61 = (v59 == 0) ^ (v60 == 0);

  if (v61) {
    goto LABEL_73;
  }
  v62 = [(TVRCNowPlayingMetadata *)self bundleID];
  v63 = [v4 bundleID];
  char v64 = (v62 == 0) ^ (v63 == 0);

  if (v64) {
    goto LABEL_73;
  }
  v65 = [(TVRCNowPlayingMetadata *)self releaseDate];
  v66 = [v4 releaseDate];
  char v67 = (v65 == 0) ^ (v66 == 0);

  if (v67) {
    goto LABEL_73;
  }
  v68 = [(TVRCNowPlayingMetadata *)self rottenTomatoesReview];
  v69 = [v4 rottenTomatoesReview];
  char v70 = (v68 == 0) ^ (v69 == 0);

  if (v70) {
    goto LABEL_73;
  }
  uint64_t v71 = [(TVRCNowPlayingMetadata *)self canonicalID];
  if (v71)
  {
    v72 = (void *)v71;
    v73 = [(TVRCNowPlayingMetadata *)self canonicalID];
    v74 = [v4 canonicalID];
    int v75 = [v73 isEqualToString:v74];

    if (!v75) {
      goto LABEL_73;
    }
  }
  uint64_t v76 = [(TVRCNowPlayingMetadata *)self title];
  if (v76)
  {
    v77 = (void *)v76;
    v78 = [(TVRCNowPlayingMetadata *)self title];
    v79 = [v4 title];
    int v80 = [v78 isEqualToString:v79];

    if (!v80) {
      goto LABEL_73;
    }
  }
  uint64_t v81 = [(TVRCNowPlayingMetadata *)self genre];
  if (v81)
  {
    v82 = (void *)v81;
    v83 = [(TVRCNowPlayingMetadata *)self genre];
    v84 = [v4 genre];
    int v85 = [v83 isEqualToString:v84];

    if (!v85) {
      goto LABEL_73;
    }
  }
  uint64_t v86 = [(TVRCNowPlayingMetadata *)self episodeTitle];
  if (v86)
  {
    v87 = (void *)v86;
    v88 = [(TVRCNowPlayingMetadata *)self episodeTitle];
    v89 = [v4 episodeTitle];
    int v90 = [v88 isEqualToString:v89];

    if (!v90) {
      goto LABEL_73;
    }
  }
  uint64_t v91 = [(TVRCNowPlayingMetadata *)self showID];
  if (v91)
  {
    v92 = (void *)v91;
    v93 = [(TVRCNowPlayingMetadata *)self showID];
    v94 = [v4 showID];
    int v95 = [v93 isEqualToString:v94];

    if (!v95) {
      goto LABEL_73;
    }
  }
  uint64_t v96 = [(TVRCNowPlayingMetadata *)self duration];
  if (v96)
  {
    v97 = (void *)v96;
    v98 = [(TVRCNowPlayingMetadata *)self duration];
    v99 = [v4 duration];
    int v100 = [v98 isEqualToNumber:v99];

    if (!v100) {
      goto LABEL_73;
    }
  }
  uint64_t v101 = [(TVRCNowPlayingMetadata *)self seasonNumber];
  if (v101)
  {
    v102 = (void *)v101;
    v103 = [(TVRCNowPlayingMetadata *)self seasonNumber];
    v104 = [v4 seasonNumber];
    int v105 = [v103 isEqualToNumber:v104];

    if (!v105) {
      goto LABEL_73;
    }
  }
  uint64_t v106 = [(TVRCNowPlayingMetadata *)self episodeNumber];
  if (v106)
  {
    v107 = (void *)v106;
    v108 = [(TVRCNowPlayingMetadata *)self episodeNumber];
    v109 = [v4 episodeNumber];
    int v110 = [v108 isEqualToNumber:v109];

    if (!v110) {
      goto LABEL_73;
    }
  }
  uint64_t v111 = [(TVRCNowPlayingMetadata *)self ratingDescription];
  if (v111)
  {
    v112 = (void *)v111;
    v113 = [(TVRCNowPlayingMetadata *)self ratingDescription];
    v114 = [v4 ratingDescription];
    int v115 = [v113 isEqualToString:v114];

    if (!v115) {
      goto LABEL_73;
    }
  }
  uint64_t v116 = [(TVRCNowPlayingMetadata *)self extendedDescription];
  if (v116)
  {
    v117 = (void *)v116;
    v118 = [(TVRCNowPlayingMetadata *)self extendedDescription];
    v119 = [v4 extendedDescription];
    int v120 = [v118 isEqualToString:v119];

    if (!v120) {
      goto LABEL_73;
    }
  }
  uint64_t v121 = [(TVRCNowPlayingMetadata *)self iTunesStoreIdentifier];
  if (v121)
  {
    v122 = (void *)v121;
    v123 = [(TVRCNowPlayingMetadata *)self iTunesStoreIdentifier];
    v124 = [v4 iTunesStoreIdentifier];
    int v125 = [v123 isEqualToString:v124];

    if (!v125) {
      goto LABEL_73;
    }
  }
  uint64_t v126 = [(TVRCNowPlayingMetadata *)self productPageURL];
  if (v126)
  {
    v127 = (void *)v126;
    v128 = [(TVRCNowPlayingMetadata *)self productPageURL];
    v129 = [v4 productPageURL];
    int v130 = [v128 isEqual:v129];

    if (!v130) {
      goto LABEL_73;
    }
  }
  v131 = [(TVRCNowPlayingMetadata *)self showProductPageURL];
  if (v131)
  {
  }
  else
  {
    v132 = [(TVRCNowPlayingMetadata *)self showProductPageURL];
    v133 = [v4 showProductPageURL];
    int v134 = [v132 isEqual:v133];

    if (!v134)
    {
LABEL_73:
      char v186 = 0;
      goto LABEL_74;
    }
  }
  uint64_t v135 = [(TVRCNowPlayingMetadata *)self mainContentStartTime];
  if (v135)
  {
    v136 = (void *)v135;
    v137 = [(TVRCNowPlayingMetadata *)self mainContentStartTime];
    v138 = [v4 mainContentStartTime];
    int v139 = [v137 isEqual:v138];

    if (!v139) {
      goto LABEL_73;
    }
  }
  uint64_t v140 = [(TVRCNowPlayingMetadata *)self programID];
  if (v140)
  {
    v141 = (void *)v140;
    v142 = [(TVRCNowPlayingMetadata *)self programID];
    v143 = [v4 programID];
    int v144 = [v142 isEqualToString:v143];

    if (!v144) {
      goto LABEL_73;
    }
  }
  uint64_t v145 = [(TVRCNowPlayingMetadata *)self timeOffset];
  if (v145)
  {
    v146 = (void *)v145;
    v147 = [(TVRCNowPlayingMetadata *)self timeOffset];
    v148 = [v4 timeOffset];
    int v149 = [v147 isEqualToNumber:v148];

    if (!v149) {
      goto LABEL_73;
    }
  }
  uint64_t v150 = [(TVRCNowPlayingMetadata *)self audioLanguage];
  if (v150)
  {
    v151 = (void *)v150;
    v152 = [(TVRCNowPlayingMetadata *)self audioLanguage];
    v153 = [v4 audioLanguage];
    int v154 = [v152 isEqualToString:v153];

    if (!v154) {
      goto LABEL_73;
    }
  }
  uint64_t v155 = [(TVRCNowPlayingMetadata *)self timestamp];
  if (v155)
  {
    v156 = (void *)v155;
    v157 = [(TVRCNowPlayingMetadata *)self timestamp];
    v158 = [v4 timestamp];
    int v159 = [v157 isEqual:v158];

    if (!v159) {
      goto LABEL_73;
    }
  }
  uint64_t v160 = [(TVRCNowPlayingMetadata *)self currentlyPlayingSongID];
  if (v160)
  {
    v161 = (void *)v160;
    v162 = [(TVRCNowPlayingMetadata *)self currentlyPlayingSongID];
    v163 = [v4 currentlyPlayingSongID];
    int v164 = [v162 isEqualToString:v163];

    if (!v164) {
      goto LABEL_73;
    }
  }
  uint64_t v165 = [(TVRCNowPlayingMetadata *)self bundleID];
  if (v165)
  {
    v166 = (void *)v165;
    v167 = [(TVRCNowPlayingMetadata *)self bundleID];
    v168 = [v4 bundleID];
    int v169 = [v167 isEqualToString:v168];

    if (!v169) {
      goto LABEL_73;
    }
  }
  uint64_t v170 = [(TVRCNowPlayingMetadata *)self releaseDate];
  if (v170)
  {
    v171 = (void *)v170;
    v172 = [(TVRCNowPlayingMetadata *)self releaseDate];
    v173 = [v4 releaseDate];
    int v174 = [v172 isEqualToDate:v173];

    if (!v174) {
      goto LABEL_73;
    }
  }
  unint64_t v175 = [(TVRCNowPlayingMetadata *)self kind];
  if (v175 != [v4 kind]) {
    goto LABEL_73;
  }
  int v176 = [(TVRCNowPlayingMetadata *)self isAppleOriginal];
  if (v176 != [v4 isAppleOriginal]) {
    goto LABEL_73;
  }
  uint64_t v177 = [(TVRCNowPlayingMetadata *)self rottenTomatoesReview];
  if (v177)
  {
    v178 = (void *)v177;
    v179 = [(TVRCNowPlayingMetadata *)self rottenTomatoesReview];
    v180 = [v4 rottenTomatoesReview];
    int v181 = [v179 isEqualToRottenTomatoesReview:v180];

    if (!v181) {
      goto LABEL_73;
    }
  }
  uint64_t v182 = [(TVRCNowPlayingMetadata *)self imageURLTemplate];
  if (v182)
  {
    v183 = (void *)v182;
    v184 = [(TVRCNowPlayingMetadata *)self imageURLTemplate];
    v185 = [v4 imageURLTemplate];
    char v186 = [v184 isEqualToString:v185];
  }
  else
  {
    char v186 = 1;
  }
LABEL_74:

  return v186;
}

- (BOOL)isMissingCriticalMetadata
{
  v2 = [(TVRCNowPlayingMetadata *)self extendedDescription];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (BOOL)isPlayingOnTVApp
{
  v2 = [(TVRCNowPlayingMetadata *)self bundleID];
  char v3 = [v2 isEqualToString:@"com.apple.TVWatchList"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TVRCNowPlayingMetadata);
  v5 = [(TVRCNowPlayingMetadata *)self canonicalID];
  [(TVRCNowPlayingMetadata *)v4 setCanonicalID:v5];

  v6 = [(TVRCNowPlayingMetadata *)self title];
  [(TVRCNowPlayingMetadata *)v4 setTitle:v6];

  char v7 = [(TVRCNowPlayingMetadata *)self genre];
  [(TVRCNowPlayingMetadata *)v4 setGenre:v7];

  v8 = [(TVRCNowPlayingMetadata *)self episodeTitle];
  [(TVRCNowPlayingMetadata *)v4 setEpisodeTitle:v8];

  v9 = [(TVRCNowPlayingMetadata *)self duration];
  [(TVRCNowPlayingMetadata *)v4 setDuration:v9];

  char v10 = [(TVRCNowPlayingMetadata *)self showID];
  [(TVRCNowPlayingMetadata *)v4 setShowID:v10];

  v11 = [(TVRCNowPlayingMetadata *)self seasonNumber];
  [(TVRCNowPlayingMetadata *)v4 setSeasonNumber:v11];

  v12 = [(TVRCNowPlayingMetadata *)self episodeNumber];
  [(TVRCNowPlayingMetadata *)v4 setEpisodeNumber:v12];

  char v13 = [(TVRCNowPlayingMetadata *)self ratingDescription];
  [(TVRCNowPlayingMetadata *)v4 setRatingDescription:v13];

  v14 = [(TVRCNowPlayingMetadata *)self extendedDescription];
  [(TVRCNowPlayingMetadata *)v4 setExtendedDescription:v14];

  v15 = [(TVRCNowPlayingMetadata *)self iTunesStoreIdentifier];
  [(TVRCNowPlayingMetadata *)v4 setITunesStoreIdentifier:v15];

  char v16 = [(TVRCNowPlayingMetadata *)self productPageURL];
  [(TVRCNowPlayingMetadata *)v4 setProductPageURL:v16];

  v17 = [(TVRCNowPlayingMetadata *)self showProductPageURL];
  [(TVRCNowPlayingMetadata *)v4 setShowProductPageURL:v17];

  v18 = [(TVRCNowPlayingMetadata *)self mainContentStartTime];
  [(TVRCNowPlayingMetadata *)v4 setMainContentStartTime:v18];

  char v19 = [(TVRCNowPlayingMetadata *)self programID];
  [(TVRCNowPlayingMetadata *)v4 setProgramID:v19];

  v20 = [(TVRCNowPlayingMetadata *)self timeOffset];
  [(TVRCNowPlayingMetadata *)v4 setTimeOffset:v20];

  v21 = [(TVRCNowPlayingMetadata *)self audioLanguage];
  [(TVRCNowPlayingMetadata *)v4 setAudioLanguage:v21];

  char v22 = [(TVRCNowPlayingMetadata *)self timestamp];
  [(TVRCNowPlayingMetadata *)v4 setTimestamp:v22];

  v23 = [(TVRCNowPlayingMetadata *)self currentlyPlayingSongID];
  [(TVRCNowPlayingMetadata *)v4 setCurrentlyPlayingSongID:v23];

  v24 = [(TVRCNowPlayingMetadata *)self bundleID];
  [(TVRCNowPlayingMetadata *)v4 setBundleID:v24];

  char v25 = [(TVRCNowPlayingMetadata *)self releaseDate];
  [(TVRCNowPlayingMetadata *)v4 setReleaseDate:v25];

  [(TVRCNowPlayingMetadata *)v4 setIsAppleOriginal:[(TVRCNowPlayingMetadata *)self isAppleOriginal]];
  [(TVRCNowPlayingMetadata *)v4 setKind:[(TVRCNowPlayingMetadata *)self kind]];
  v26 = [(TVRCNowPlayingMetadata *)self rottenTomatoesReview];
  v27 = (void *)[v26 copy];
  [(TVRCNowPlayingMetadata *)v4 setRottenTomatoesReview:v27];

  char v28 = [(TVRCNowPlayingMetadata *)self imageURLTemplate];
  [(TVRCNowPlayingMetadata *)v4 setImageURLTemplate:v28];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCNowPlayingMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)TVRCNowPlayingMetadata;
  v5 = [(TVRCNowPlayingMetadata *)&v53 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"canonicalID"];
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    genre = v5->_genre;
    v5->_genre = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"episodeTitle"];
    episodeTitle = v5->_episodeTitle;
    v5->_episodeTitle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"duration"];
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showID"];
    showID = v5->_showID;
    v5->_showID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seasonNumber"];
    seasonNumber = v5->_seasonNumber;
    v5->_seasonNumber = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"episodeNumber"];
    episodeNumber = v5->_episodeNumber;
    v5->_episodeNumber = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ratingDescription"];
    ratingDescription = v5->_ratingDescription;
    v5->_ratingDescription = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extendedDescription"];
    extendedDescription = v5->_extendedDescription;
    v5->_extendedDescription = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iTunesStoreIdentifier"];
    iTunesStoreIdentifier = v5->_iTunesStoreIdentifier;
    v5->_iTunesStoreIdentifier = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productPageURL"];
    productPageURL = v5->_productPageURL;
    v5->_productPageURL = (NSURL *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showProductPageURL"];
    showProductPageURL = v5->_showProductPageURL;
    v5->_showProductPageURL = (NSURL *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mainContentStartTime"];
    mainContentStartTime = v5->_mainContentStartTime;
    v5->_mainContentStartTime = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"programID"];
    programID = v5->_programID;
    v5->_programID = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeOffset"];
    timeOffset = v5->_timeOffset;
    v5->_timeOffset = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioLanguage"];
    audioLanguage = v5->_audioLanguage;
    v5->_audioLanguage = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentlyPlayingSongID"];
    currentlyPlayingSongID = v5->_currentlyPlayingSongID;
    v5->_currentlyPlayingSongID = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseDate"];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v46;

    v5->_isAppleOriginal = [v4 decodeBoolForKey:@"isAppleOriginal"];
    v5->_kind = (int)[v4 decodeIntForKey:@"kind"];
    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rottenTomatoesReview"];
    rottenTomatoesReview = v5->_rottenTomatoesReview;
    v5->_rottenTomatoesReview = (TVRCRottenTomatoesReview *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURLTemplate"];
    imageURLTemplate = v5->_imageURLTemplate;
    v5->_imageURLTemplate = (NSString *)v50;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  canonicalID = self->_canonicalID;
  id v5 = a3;
  [v5 encodeObject:canonicalID forKey:@"canonicalID"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_genre forKey:@"genre"];
  [v5 encodeObject:self->_episodeTitle forKey:@"episodeTitle"];
  [v5 encodeObject:self->_duration forKey:@"duration"];
  [v5 encodeObject:self->_showID forKey:@"showID"];
  [v5 encodeObject:self->_seasonNumber forKey:@"seasonNumber"];
  [v5 encodeObject:self->_episodeNumber forKey:@"episodeNumber"];
  [v5 encodeObject:self->_ratingDescription forKey:@"ratingDescription"];
  [v5 encodeObject:self->_extendedDescription forKey:@"extendedDescription"];
  [v5 encodeObject:self->_iTunesStoreIdentifier forKey:@"iTunesStoreIdentifier"];
  [v5 encodeObject:self->_productPageURL forKey:@"productPageURL"];
  [v5 encodeObject:self->_showProductPageURL forKey:@"showProductPageURL"];
  [v5 encodeObject:self->_mainContentStartTime forKey:@"mainContentStartTime"];
  [v5 encodeObject:self->_programID forKey:@"programID"];
  [v5 encodeObject:self->_timeOffset forKey:@"timeOffset"];
  [v5 encodeObject:self->_audioLanguage forKey:@"audioLanguage"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_currentlyPlayingSongID forKey:@"currentlyPlayingSongID"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_releaseDate forKey:@"releaseDate"];
  [v5 encodeBool:self->_isAppleOriginal forKey:@"isAppleOriginal"];
  [v5 encodeInt:LODWORD(self->_kind) forKey:@"kind"];
  [v5 encodeObject:self->_rottenTomatoesReview forKey:@"rottenTomatoesReview"];
  [v5 encodeObject:self->_imageURLTemplate forKey:@"imageURLTemplate"];
}

+ (id)metadataFromContentItem:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_57;
  }
  id v5 = objc_alloc_init(TVRCNowPlayingMetadata);
  uint64_t v6 = [v4 metadata];
  char v7 = NSNumber;
  [v6 duration];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  [(TVRCNowPlayingMetadata *)v5 setDuration:v8];

  v9 = [v6 title];
  [(TVRCNowPlayingMetadata *)v5 setTitle:v9];

  uint64_t v10 = NSString;
  v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "iTunesStoreIdentifier"));
  uint64_t v12 = [v10 stringWithFormat:@"%@", v11];
  [(TVRCNowPlayingMetadata *)v5 setITunesStoreIdentifier:v12];

  char v13 = [a1 currentAudioLanguageOptionFromContentItem:v4];
  [(TVRCNowPlayingMetadata *)v5 setAudioLanguage:v13];

  uint64_t v14 = NSNumber;
  v15 = [v4 metadata];
  [v15 elapsedTimeTimestamp];
  uint64_t v16 = objc_msgSend(v14, "numberWithDouble:");
  [(TVRCNowPlayingMetadata *)v5 setTimestamp:v16];

  v17 = NSNumber;
  uint64_t v18 = [v4 metadata];
  [v18 elapsedTime];
  char v19 = objc_msgSend(v17, "numberWithDouble:");
  [(TVRCNowPlayingMetadata *)v5 setTimeOffset:v19];

  uint64_t v20 = [v4 metadata];
  v21 = [v20 nowPlayingInfo];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"TVRAdditionalMetadata"];

  if (!v22) {
    goto LABEL_55;
  }
  v41 = v6;
  id v42 = v4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [v22 allKeys];
  uint64_t v23 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (!v23) {
    goto LABEL_54;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v45;
  do
  {
    uint64_t v26 = 0;
    do
    {
      if (*(void *)v45 != v25) {
        objc_enumerationMutation(obj);
      }
      v27 = *(void **)(*((void *)&v44 + 1) + 8 * v26);
      uint64_t v28 = [v22 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
      id v30 = v29;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v31 = v28;
      }
      else {
        char v31 = 0;
      }
      id v32 = v31;
      if (![v27 isEqual:@"avkt/com.apple.avkit.iTunesStoreIdentifier"])
      {
        uint64_t v33 = [v27 isEqual:@"avkt/com.apple.avkit.seasonNumber"];
        if (v33)
        {
          uint64_t v34 = __50__TVRCNowPlayingMetadata_metadataFromContentItem___block_invoke(v33, v30, v32);
          [(TVRCNowPlayingMetadata *)v5 setSeasonNumber:v34];
        }
        else
        {
          uint64_t v35 = [v27 isEqual:@"avkt/com.apple.avkit.episodeNumber"];
          if (!v35)
          {
            if ([v27 isEqual:@"mdta/com.apple.hls.episode-title"])
            {
              if (v30) {
                [(TVRCNowPlayingMetadata *)v5 setEpisodeTitle:v30];
              }
            }
            else if ([v27 isEqual:@"mdta/com.apple.hls.description"])
            {
              if (v30)
              {
                uint64_t v36 = [(TVRCNowPlayingMetadata *)v5 extendedDescription];
                uint64_t v37 = [v36 length];

                if (!v37) {
                  [(TVRCNowPlayingMetadata *)v5 setExtendedDescription:v30];
                }
              }
            }
            else if ([v27 isEqual:@"mdta/com.apple.hls.genre"])
            {
              if (v30) {
                [(TVRCNowPlayingMetadata *)v5 setGenre:v30];
              }
            }
            else if ([v27 isEqual:@"mdta/com.apple.hls.rating-display-name"])
            {
              if (v30) {
                [(TVRCNowPlayingMetadata *)v5 setRatingDescription:v30];
              }
            }
            else if ([v27 isEqual:@"avkt/TVRMainContentStartTime"])
            {
              if (v32) {
                [(TVRCNowPlayingMetadata *)v5 setMainContentStartTime:v32];
              }
            }
            else if ([v27 isEqual:@"avkt/TVRProgramID"])
            {
              if (v30) {
                [(TVRCNowPlayingMetadata *)v5 setProgramID:v30];
              }
            }
            else if ([v27 isEqual:@"avkt/TVRTimeOffset"])
            {
              if (v32) {
                [(TVRCNowPlayingMetadata *)v5 setTimeOffset:v32];
              }
            }
            else if ([v27 isEqual:@"avkt/TVRCurrentlyPlayingSongID"])
            {
              if (v30)
              {
                [(TVRCNowPlayingMetadata *)v5 setCurrentlyPlayingSongID:v30];
              }
              else if (v32)
              {
                uint64_t v38 = [v32 stringValue];
                [(TVRCNowPlayingMetadata *)v5 setCurrentlyPlayingSongID:v38];
              }
            }
            goto LABEL_24;
          }
          uint64_t v34 = __50__TVRCNowPlayingMetadata_metadataFromContentItem___block_invoke(v35, v30, v32);
          [(TVRCNowPlayingMetadata *)v5 setEpisodeNumber:v34];
        }
LABEL_23:

        goto LABEL_24;
      }
      if (v30)
      {
        [(TVRCNowPlayingMetadata *)v5 setITunesStoreIdentifier:v30];
        goto LABEL_24;
      }
      if (v32)
      {
        uint64_t v34 = [v32 stringValue];
        [(TVRCNowPlayingMetadata *)v5 setITunesStoreIdentifier:v34];
        goto LABEL_23;
      }
LABEL_24:

      ++v26;
    }
    while (v24 != v26);
    uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    uint64_t v24 = v39;
  }
  while (v39);
LABEL_54:

  uint64_t v6 = v41;
  id v4 = v42;
LABEL_55:

LABEL_57:

  return v5;
}

id __50__TVRCNowPlayingMetadata_metadataFromContentItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_5:
    uint64_t v8 = v7;
    goto LABEL_6;
  }
  if (v4)
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

+ (id)currentAudioLanguageOptionFromContentItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(v3, "currentLanguageOptions", 0);
    uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (![v9 type])
          {
            uint64_t v6 = [v9 languageTag];
            goto LABEL_12;
          }
        }
        uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSString)episodeTitle
{
  return self->_episodeTitle;
}

- (void)setEpisodeTitle:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSString)showID
{
  return self->_showID;
}

- (void)setShowID:(id)a3
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

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void)setRatingDescription:(id)a3
{
}

- (NSString)extendedDescription
{
  return self->_extendedDescription;
}

- (void)setExtendedDescription:(id)a3
{
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void)setITunesStoreIdentifier:(id)a3
{
}

- (NSURL)productPageURL
{
  return self->_productPageURL;
}

- (void)setProductPageURL:(id)a3
{
}

- (NSURL)showProductPageURL
{
  return self->_showProductPageURL;
}

- (void)setShowProductPageURL:(id)a3
{
}

- (NSNumber)mainContentStartTime
{
  return self->_mainContentStartTime;
}

- (void)setMainContentStartTime:(id)a3
{
}

- (NSString)programID
{
  return self->_programID;
}

- (void)setProgramID:(id)a3
{
}

- (NSNumber)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(id)a3
{
}

- (NSString)audioLanguage
{
  return self->_audioLanguage;
}

- (void)setAudioLanguage:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)currentlyPlayingSongID
{
  return self->_currentlyPlayingSongID;
}

- (void)setCurrentlyPlayingSongID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
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

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (TVRCRottenTomatoesReview)rottenTomatoesReview
{
  return self->_rottenTomatoesReview;
}

- (void)setRottenTomatoesReview:(id)a3
{
}

- (NSString)imageURLTemplate
{
  return self->_imageURLTemplate;
}

- (void)setImageURLTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURLTemplate, 0);
  objc_storeStrong((id *)&self->_rottenTomatoesReview, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingSongID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_audioLanguage, 0);
  objc_storeStrong((id *)&self->_timeOffset, 0);
  objc_storeStrong((id *)&self->_programID, 0);
  objc_storeStrong((id *)&self->_mainContentStartTime, 0);
  objc_storeStrong((id *)&self->_showProductPageURL, 0);
  objc_storeStrong((id *)&self->_productPageURL, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_extendedDescription, 0);
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_episodeTitle, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end