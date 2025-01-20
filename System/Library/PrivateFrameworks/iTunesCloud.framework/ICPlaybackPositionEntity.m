@interface ICPlaybackPositionEntity
+ (BOOL)supportsSecureCoding;
+ (id)keyValueStoreItemIdentifierForUniqueStoreID:(int64_t)a3 itemTitle:(id)a4 albumName:(id)a5 itemArtistName:(id)a6 feedURL:(id)a7 feedGUID:(id)a8;
+ (id)ubiquitousIdentifierWithItemTitle:(id)a3 albumName:(id)a4 itemArtistName:(id)a5;
+ (id)ubiquitousIdentifierWithPodcastFeedURL:(id)a3 feedGUID:(id)a4;
+ (id)ubiquitousIdentifierWithUniqueStoreID:(int64_t)a3;
+ (id)ubiquitousIdentifierWithiTunesUFeedURL:(id)a3 feedGUID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (ICPlaybackPositionEntity)initWithCoder:(id)a3;
- (ICPlaybackPositionEntity)initWithDomain:(id)a3;
- (ICPlaybackPositionEntity)initWithDomain:(id)a3 playbackPositionKey:(id)a4 persistentIdentifier:(id)a5;
- (NSNumber)bookmarkTime;
- (NSNumber)bookmarkTimestamp;
- (NSNumber)hasBeenPlayed;
- (NSNumber)itemPersistentIdentifier;
- (NSNumber)userPlayCount;
- (NSString)libraryIdentifier;
- (NSString)playbackPositionDomain;
- (NSString)playbackPositionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarkTime:(id)a3;
- (void)setBookmarkTimestamp:(id)a3;
- (void)setHasBeenPlayed:(id)a3;
- (void)setItemPersistentIdentifier:(id)a3;
- (void)setLibraryIdentifier:(id)a3;
- (void)setPlaybackPositionKey:(id)a3;
- (void)setUserPlayCount:(id)a3;
@end

@implementation ICPlaybackPositionEntity

+ (id)ubiquitousIdentifierWithUniqueStoreID:(int64_t)a3
{
  return +[ICPlaybackPositionEntity keyValueStoreItemIdentifierForUniqueStoreID:a3 itemTitle:0 albumName:0 itemArtistName:0 feedURL:0 feedGUID:0];
}

+ (id)keyValueStoreItemIdentifierForUniqueStoreID:(int64_t)a3 itemTitle:(id)a4 albumName:(id)a5 itemArtistName:(id)a6 feedURL:(id)a7 feedGUID:(id)a8
{
  v54[4] = *MEMORY[0x1E4F143B8];
  v13 = (__CFString *)a4;
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a6;
  id v16 = a7;
  v17 = (__CFString *)a8;
  v18 = v17;
  if (!a3 || v16 || v17)
  {
    v20 = getML3TrackPropertyTitle();
    v53[0] = v20;
    v47 = v13;
    if (v13) {
      v21 = v13;
    }
    else {
      v21 = &stru_1EF5F5C40;
    }
    v54[0] = v21;
    v22 = getML3TrackPropertyAlbum();
    v53[1] = v22;
    if (v14) {
      v23 = v14;
    }
    else {
      v23 = &stru_1EF5F5C40;
    }
    v54[1] = v23;
    v24 = getML3TrackPropertyArtist();
    v53[2] = v24;
    if (v15) {
      v25 = v15;
    }
    else {
      v25 = &stru_1EF5F5C40;
    }
    v54[2] = v25;
    v26 = getML3TrackPropertyPodcastExternalGUID();
    v53[3] = v26;
    if (v18) {
      v27 = v18;
    }
    else {
      v27 = &stru_1EF5F5C40;
    }
    v54[3] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:4];
    v29 = (void *)[v28 mutableCopy];

    if (v16)
    {
      v30 = getML3TrackPropertyFeedURL();
      [v29 setObject:v16 forKeyedSubscript:v30];
    }
    v31 = getML3TrackPropertyFeedURL();
    v52[0] = v31;
    v32 = getML3TrackPropertyPodcastExternalGUID();
    v52[1] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    v19 = ICPlaybackPositionEntityIdentifierForProperties(v33, v29);

    if (!v19)
    {
      v34 = getML3TrackPropertyTitle();
      v51[0] = v34;
      v35 = getML3TrackPropertyArtist();
      v51[1] = v35;
      v36 = getML3TrackPropertyAlbum();
      v51[2] = v36;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
      v19 = ICPlaybackPositionEntityIdentifierForProperties(v37, v29);

      if (!v19)
      {
        v38 = getML3TrackPropertyTitle();
        v50[0] = v38;
        v39 = getML3TrackPropertyAlbum();
        v50[1] = v39;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
        v19 = ICPlaybackPositionEntityIdentifierForProperties(v40, v29);

        if (!v19)
        {
          v41 = getML3TrackPropertyTitle();
          v49[0] = v41;
          v42 = getML3TrackPropertyArtist();
          v49[1] = v42;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
          v19 = ICPlaybackPositionEntityIdentifierForProperties(v43, v29);

          if (!v19)
          {
            v44 = getML3TrackPropertyTitle();
            v48 = v44;
            v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
            v19 = ICPlaybackPositionEntityIdentifierForProperties(v45, v29);
          }
        }
      }
    }

    v13 = v47;
  }
  else
  {
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasBeenPlayed, 0);
  objc_storeStrong((id *)&self->_userPlayCount, 0);
  objc_storeStrong((id *)&self->_bookmarkTime, 0);
  objc_storeStrong((id *)&self->_bookmarkTimestamp, 0);
  objc_storeStrong((id *)&self->_itemPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackPositionKey, 0);

  objc_storeStrong((id *)&self->_playbackPositionDomain, 0);
}

- (void)setHasBeenPlayed:(id)a3
{
}

- (NSNumber)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setUserPlayCount:(id)a3
{
}

- (NSNumber)userPlayCount
{
  return self->_userPlayCount;
}

- (void)setBookmarkTime:(id)a3
{
}

- (NSNumber)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTimestamp:(id)a3
{
}

- (NSNumber)bookmarkTimestamp
{
  return self->_bookmarkTimestamp;
}

- (void)setItemPersistentIdentifier:(id)a3
{
}

- (NSNumber)itemPersistentIdentifier
{
  return self->_itemPersistentIdentifier;
}

- (void)setLibraryIdentifier:(id)a3
{
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (void)setPlaybackPositionKey:(id)a3
{
}

- (NSString)playbackPositionKey
{
  return self->_playbackPositionKey;
}

- (NSString)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDomain:", self->_playbackPositionDomain);
  [v4 setPlaybackPositionKey:self->_playbackPositionKey];
  [v4 setLibraryIdentifier:self->_libraryIdentifier];
  [v4 setItemPersistentIdentifier:self->_itemPersistentIdentifier];
  [v4 setBookmarkTimestamp:self->_bookmarkTimestamp];
  [v4 setBookmarkTime:self->_bookmarkTime];
  [v4 setUserPlayCount:self->_userPlayCount];
  [v4 setHasBeenPlayed:self->_hasBeenPlayed];
  return v4;
}

- (ICPlaybackPositionEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  v6 = [(ICPlaybackPositionEntity *)self initWithDomain:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    playbackPositionKey = v6->_playbackPositionKey;
    v6->_playbackPositionKey = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryUID"];
    libraryIdentifier = v6->_libraryIdentifier;
    v6->_libraryIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemPersistenIdentifier"];
    itemPersistentIdentifier = v6->_itemPersistentIdentifier;
    v6->_itemPersistentIdentifier = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmarkTimestamp"];
    bookmarkTimestamp = v6->_bookmarkTimestamp;
    v6->_bookmarkTimestamp = (NSNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmarkTime"];
    bookmarkTime = v6->_bookmarkTime;
    v6->_bookmarkTime = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playCount"];
    userPlayCount = v6->_userPlayCount;
    v6->_userPlayCount = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasBeenPlayed"];
    hasBeenPlayed = v6->_hasBeenPlayed;
    v6->_hasBeenPlayed = (NSNumber *)v19;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  playbackPositionDomain = self->_playbackPositionDomain;
  id v5 = a3;
  [v5 encodeObject:playbackPositionDomain forKey:@"domain"];
  [v5 encodeObject:self->_playbackPositionKey forKey:@"key"];
  [v5 encodeObject:self->_libraryIdentifier forKey:@"libraryUID"];
  [v5 encodeObject:self->_itemPersistentIdentifier forKey:@"itemPersistenIdentifier"];
  [v5 encodeObject:self->_bookmarkTimestamp forKey:@"bookmarkTimestamp"];
  [v5 encodeObject:self->_bookmarkTime forKey:@"bookmarkTime"];
  [v5 encodeObject:self->_userPlayCount forKey:@"playCount"];
  [v5 encodeObject:self->_hasBeenPlayed forKey:@"hasBeenPlayed"];
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v127 = __ROR8__(v14 + v13, 32);
  uint64_t v136 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v118 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_playbackPositionDomain;
  uint64_t v19 = [(NSString *)v18 hash];
  uint64_t v20 = (v17 + v118) ^ __ROR8__(v118, 51);
  uint64_t v21 = v127 + (v136 ^ v19);
  uint64_t v22 = __ROR8__(v136 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v118, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v128 = __ROR8__(v25, 32);
  uint64_t v137 = v24;
  uint64_t v110 = v23 ^ v19;
  uint64_t v119 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_playbackPositionKey;
  uint64_t data = [(NSString *)v26 hash];
  uint64_t v27 = (v110 + v119) ^ __ROR8__(v119, 51);
  uint64_t v28 = v128 + (v137 ^ data);
  uint64_t v29 = __ROR8__(v137 ^ data, 48);
  uint64_t v30 = (v28 ^ v29) + __ROR8__(v110 + v119, 32);
  uint64_t v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  uint64_t v32 = v28 + v27;
  uint64_t v129 = __ROR8__(v32, 32);
  uint64_t v138 = v31;
  uint64_t v111 = v30 ^ data;
  uint64_t v120 = v32 ^ __ROR8__(v27, 47);

  v33 = self->_libraryIdentifier;
  uint64_t v34 = [(NSString *)v33 hash];
  uint64_t v35 = (v111 + v120) ^ __ROR8__(v120, 51);
  uint64_t v36 = v129 + (v138 ^ v34);
  uint64_t v37 = __ROR8__(v138 ^ v34, 48);
  uint64_t v38 = (v36 ^ v37) + __ROR8__(v111 + v120, 32);
  uint64_t v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
  uint64_t v40 = v36 + v35;
  uint64_t v130 = __ROR8__(v40, 32);
  uint64_t v139 = v39;
  uint64_t v112 = v38 ^ v34;
  uint64_t v121 = v40 ^ __ROR8__(v35, 47);

  v41 = self->_itemPersistentIdentifier;
  uint64_t v42 = [(NSNumber *)v41 hash];
  uint64_t v43 = (v112 + v121) ^ __ROR8__(v121, 51);
  uint64_t v44 = v130 + (v139 ^ v42);
  uint64_t v45 = __ROR8__(v139 ^ v42, 48);
  uint64_t v46 = (v44 ^ v45) + __ROR8__(v112 + v121, 32);
  uint64_t v47 = v46 ^ __ROR8__(v44 ^ v45, 43);
  uint64_t v48 = v44 + v43;
  uint64_t v131 = __ROR8__(v48, 32);
  uint64_t v140 = v47;
  uint64_t v113 = v46 ^ v42;
  uint64_t v122 = v48 ^ __ROR8__(v43, 47);

  v49 = self->_bookmarkTimestamp;
  uint64_t v50 = [(NSNumber *)v49 hash];
  uint64_t v51 = (v113 + v122) ^ __ROR8__(v122, 51);
  uint64_t v52 = v131 + (v140 ^ v50);
  uint64_t v53 = __ROR8__(v140 ^ v50, 48);
  uint64_t v54 = (v52 ^ v53) + __ROR8__(v113 + v122, 32);
  uint64_t v55 = v54 ^ __ROR8__(v52 ^ v53, 43);
  uint64_t v56 = v52 + v51;
  uint64_t v132 = __ROR8__(v56, 32);
  uint64_t v141 = v55;
  uint64_t v114 = v54 ^ v50;
  uint64_t v123 = v56 ^ __ROR8__(v51, 47);

  v57 = self->_bookmarkTime;
  uint64_t v58 = [(NSNumber *)v57 hash];
  uint64_t v59 = (v114 + v123) ^ __ROR8__(v123, 51);
  uint64_t v60 = v132 + (v141 ^ v58);
  uint64_t v61 = __ROR8__(v141 ^ v58, 48);
  uint64_t v62 = (v60 ^ v61) + __ROR8__(v114 + v123, 32);
  uint64_t v63 = v62 ^ __ROR8__(v60 ^ v61, 43);
  uint64_t v64 = v60 + v59;
  uint64_t v133 = __ROR8__(v64, 32);
  uint64_t v142 = v63;
  uint64_t v115 = v62 ^ v58;
  uint64_t v124 = v64 ^ __ROR8__(v59, 47);

  v65 = self->_userPlayCount;
  uint64_t v66 = [(NSNumber *)v65 hash];
  uint64_t v67 = (v115 + v124) ^ __ROR8__(v124, 51);
  uint64_t v68 = v133 + (v142 ^ v66);
  uint64_t v69 = __ROR8__(v142 ^ v66, 48);
  uint64_t v70 = (v68 ^ v69) + __ROR8__(v115 + v124, 32);
  uint64_t v71 = v70 ^ __ROR8__(v68 ^ v69, 43);
  uint64_t v72 = v68 + v67;
  uint64_t v134 = __ROR8__(v72, 32);
  uint64_t v143 = v71;
  uint64_t v116 = v70 ^ v66;
  uint64_t v125 = v72 ^ __ROR8__(v67, 47);

  v73 = self->_hasBeenPlayed;
  uint64_t v74 = [(NSNumber *)v73 hash];
  uint64_t v75 = (v116 + v125) ^ __ROR8__(v125, 51);
  uint64_t v76 = v134 + (v143 ^ v74);
  uint64_t v77 = __ROR8__(v143 ^ v74, 48);
  uint64_t v78 = (v76 ^ v77) + __ROR8__(v116 + v125, 32);
  uint64_t v79 = v78 ^ __ROR8__(v76 ^ v77, 43);
  uint64_t v80 = v76 + v75;
  uint64_t v135 = __ROR8__(v80, 32);
  uint64_t v144 = v79;
  uint64_t v117 = v78 ^ v74;
  uint64_t v126 = v80 ^ __ROR8__(v75, 47);

  uint64_t v81 = (v117 + v126) ^ __ROR8__(v126, 51);
  uint64_t v82 = v135 + (v144 ^ 0x4800000000000000);
  uint64_t v83 = __ROR8__(v144 ^ 0x4800000000000000, 48);
  uint64_t v84 = (v82 ^ v83) + __ROR8__(v117 + v126, 32);
  uint64_t v85 = v84 ^ __ROR8__(v82 ^ v83, 43);
  uint64_t v86 = v82 + v81;
  uint64_t v87 = v86 ^ __ROR8__(v81, 47);
  uint64_t v88 = (v84 ^ 0x4800000000000000) + v87;
  uint64_t v89 = v88 ^ __ROR8__(v87, 51);
  uint64_t v90 = (__ROR8__(v86, 32) ^ 0xFFLL) + v85;
  uint64_t v91 = __ROR8__(v85, 48);
  uint64_t v92 = __ROR8__(v88, 32) + (v90 ^ v91);
  uint64_t v93 = v92 ^ __ROR8__(v90 ^ v91, 43);
  uint64_t v94 = v89 + v90;
  uint64_t v95 = v94 ^ __ROR8__(v89, 47);
  uint64_t v96 = v95 + v92;
  uint64_t v97 = v96 ^ __ROR8__(v95, 51);
  uint64_t v98 = __ROR8__(v94, 32) + v93;
  uint64_t v99 = __ROR8__(v93, 48);
  uint64_t v100 = __ROR8__(v96, 32) + (v98 ^ v99);
  uint64_t v101 = v100 ^ __ROR8__(v98 ^ v99, 43);
  uint64_t v102 = v97 + v98;
  uint64_t v103 = v102 ^ __ROR8__(v97, 47);
  uint64_t v104 = v103 + v100;
  uint64_t v105 = v104 ^ __ROR8__(v103, 51);
  uint64_t v106 = __ROR8__(v102, 32) + v101;
  uint64_t v107 = __ROR8__(v101, 48);
  uint64_t v108 = __ROR8__(v104, 32) + (v106 ^ v107);
  return (v105 + v106) ^ __ROR8__(v105, 47) ^ v108 ^ __ROR8__(v105 + v106, 32) ^ v108 ^ __ROR8__(v106 ^ v107, 43);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    playbackPositionDomain = self->_playbackPositionDomain;
    uint64_t v6 = [v4 playbackPositionDomain];
    if ([(NSString *)playbackPositionDomain isEqual:v6])
    {
      playbackPositionKey = self->_playbackPositionKey;
      uint64_t v8 = [v4 playbackPositionKey];
      if ([(NSString *)playbackPositionKey isEqualToString:v8])
      {
        libraryIdentifier = self->_libraryIdentifier;
        id v10 = [v4 libraryIdentifier];
        if ([(NSString *)libraryIdentifier isEqualToString:v10])
        {
          itemPersistentIdentifier = self->_itemPersistentIdentifier;
          uint64_t v12 = [v4 itemPersistentIdentifier];
          if ([(NSNumber *)itemPersistentIdentifier isEqual:v12])
          {
            bookmarkTimestamp = self->_bookmarkTimestamp;
            uint64_t v14 = [v4 bookmarkTimestamp];
            if ([(NSNumber *)bookmarkTimestamp isEqual:v14])
            {
              bookmarkTime = self->_bookmarkTime;
              uint64_t v16 = [v4 bookmarkTime];
              if ([(NSNumber *)bookmarkTime isEqual:v16])
              {
                userPlayCount = self->_userPlayCount;
                v18 = [v4 userPlayCount];
                if ([(NSNumber *)userPlayCount isEqual:v18])
                {
                  hasBeenPlayed = self->_hasBeenPlayed;
                  uint64_t v20 = [v4 hasBeenPlayed];
                  char v21 = [(NSNumber *)hasBeenPlayed isEqual:v20];
                }
                else
                {
                  char v21 = 0;
                }
              }
              else
              {
                char v21 = 0;
              }
            }
            else
            {
              char v21 = 0;
            }
          }
          else
          {
            char v21 = 0;
          }
        }
        else
        {
          char v21 = 0;
        }
      }
      else
      {
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ICPlaybackPositionEntity %p domain=%@ playbackPositionID=%@ itemPID=%@ libraryUID=%@ bookmarkTime=%@ bookmarkTimestamp=%@ playCount=%@ hasBeenPlayed=%@>", self, self->_playbackPositionDomain, self->_playbackPositionKey, self->_itemPersistentIdentifier, self->_libraryIdentifier, self->_bookmarkTime, self->_bookmarkTimestamp, self->_userPlayCount, self->_hasBeenPlayed];
}

- (ICPlaybackPositionEntity)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPlaybackPositionEntity;
  uint64_t v6 = [(ICPlaybackPositionEntity *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playbackPositionDomain, a3);
  }

  return v7;
}

- (ICPlaybackPositionEntity)initWithDomain:(id)a3 playbackPositionKey:(id)a4 persistentIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ICPlaybackPositionEntity *)self initWithDomain:a3];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_playbackPositionKey, a4);
    objc_storeStrong((id *)&v12->_itemPersistentIdentifier, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ubiquitousIdentifierWithiTunesUFeedURL:(id)a3 feedGUID:(id)a4
{
  return +[ICPlaybackPositionEntity keyValueStoreItemIdentifierForUniqueStoreID:0 itemTitle:0 albumName:0 itemArtistName:0 feedURL:a3 feedGUID:a4];
}

+ (id)ubiquitousIdentifierWithPodcastFeedURL:(id)a3 feedGUID:(id)a4
{
  return +[ICPlaybackPositionEntity keyValueStoreItemIdentifierForUniqueStoreID:0 itemTitle:0 albumName:0 itemArtistName:0 feedURL:a3 feedGUID:a4];
}

+ (id)ubiquitousIdentifierWithItemTitle:(id)a3 albumName:(id)a4 itemArtistName:(id)a5
{
  return +[ICPlaybackPositionEntity keyValueStoreItemIdentifierForUniqueStoreID:0 itemTitle:a3 albumName:a4 itemArtistName:a5 feedURL:0 feedGUID:0];
}

@end