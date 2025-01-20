@interface MOMediaPlay
+ (BOOL)supportsSecureCoding;
+ (id)mediaPlayWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 sumTimePlayed:(id)a10 repetitions:(int)a11 mediaPlaySessions:(id)a12 firstPartyTimePlayedRatio:(id)a13;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMediaPlay:(id)a3;
- (MOMediaPlay)initWithCoder:(id)a3;
- (MOMediaPlay)initWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 sumTimePlayed:(id)a10 repetitions:(int)a11 mediaPlaySessions:(id)a12 firstPartyTimePlayedRatio:(id)a13;
- (NSArray)mediaPlaySessions;
- (NSNumber)firstPartyTimePlayedRatio;
- (NSNumber)sumTimePlayed;
- (NSString)album;
- (NSString)artist;
- (NSString)bundleId;
- (NSString)genre;
- (NSString)mediaType;
- (NSString)productId;
- (NSString)title;
- (id)copyWithReplacementAlbum:(id)a3;
- (id)copyWithReplacementArtist:(id)a3;
- (id)copyWithReplacementBundleId:(id)a3;
- (id)copyWithReplacementGenre:(id)a3;
- (id)copyWithReplacementMediaPlaySessions:(id)a3;
- (id)copyWithReplacementMediaType:(id)a3;
- (id)copyWithReplacementProductId:(id)a3;
- (id)copyWithReplacementRepetitions:(int)a3;
- (id)copyWithReplacementSumTimePlayed:(id)a3;
- (id)copyWithReplacementTitle:(id)a3;
- (id)description;
- (int)repetitions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOMediaPlay

- (MOMediaPlay)initWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 sumTimePlayed:(id)a10 repetitions:(int)a11 mediaPlaySessions:(id)a12 firstPartyTimePlayedRatio:(id)a13
{
  id v37 = a3;
  id v36 = a4;
  id v30 = a5;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v31 = a8;
  id v32 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a12;
  id v22 = a13;
  if (!v21)
  {
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MOMediaPlay initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:](v23);
    }

    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MOMediaPlay.m" lineNumber:20 description:@"Invalid parameter not satisfying: mediaPlaySessions != nil (in %s:%d)", "-[MOMediaPlay initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:]", 20];
  }
  v38.receiver = self;
  v38.super_class = (Class)MOMediaPlay;
  v25 = [(MOMediaPlay *)&v38 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_title, a3);
    objc_storeStrong((id *)&v26->_album, a4);
    objc_storeStrong((id *)&v26->_bundleId, v30);
    objc_storeStrong((id *)&v26->_productId, a6);
    objc_storeStrong((id *)&v26->_genre, a7);
    objc_storeStrong((id *)&v26->_mediaType, v31);
    objc_storeStrong((id *)&v26->_artist, a9);
    objc_storeStrong((id *)&v26->_sumTimePlayed, a10);
    v26->_repetitions = a11;
    objc_storeStrong((id *)&v26->_mediaPlaySessions, a12);
    objc_storeStrong((id *)&v26->_firstPartyTimePlayedRatio, a13);
  }

  return v26;
}

+ (id)mediaPlayWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 sumTimePlayed:(id)a10 repetitions:(int)a11 mediaPlaySessions:(id)a12 firstPartyTimePlayedRatio:(id)a13
{
  id v19 = a13;
  id v20 = a12;
  id v21 = a10;
  id v22 = a9;
  id v23 = a8;
  id v24 = a7;
  id v25 = a6;
  id v26 = a5;
  id v27 = a4;
  id v28 = a3;
  LODWORD(v30) = a11;
  id v32 = [objc_alloc((Class)a1) initWithTitle:v28 album:v27 bundleId:v26 productId:v25 genre:v24 mediaType:v23 artist:v22 sumTimePlayed:v21 repetitions:v30 mediaPlaySessions:v20 firstPartyTimePlayedRatio:v19];

  return v32;
}

- (id)copyWithReplacementTitle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:v4 album:self->_album bundleId:self->_bundleId productId:self->_productId genre:self->_genre mediaType:self->_mediaType artist:self->_artist sumTimePlayed:self->_sumTimePlayed repetitions:v8 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (id)copyWithReplacementAlbum:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:self->_title album:v4 bundleId:self->_bundleId productId:self->_productId genre:self->_genre mediaType:self->_mediaType artist:self->_artist sumTimePlayed:self->_sumTimePlayed repetitions:v8 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (id)copyWithReplacementBundleId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:self->_title album:self->_album bundleId:v4 productId:self->_productId genre:self->_genre mediaType:self->_mediaType artist:self->_artist sumTimePlayed:self->_sumTimePlayed repetitions:v8 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (id)copyWithReplacementProductId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:self->_title album:self->_album bundleId:self->_bundleId productId:v4 genre:self->_genre mediaType:self->_mediaType artist:self->_artist sumTimePlayed:self->_sumTimePlayed repetitions:v8 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (id)copyWithReplacementGenre:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:self->_title album:self->_album bundleId:self->_bundleId productId:self->_productId genre:v4 mediaType:self->_mediaType artist:self->_artist sumTimePlayed:self->_sumTimePlayed repetitions:v8 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (id)copyWithReplacementMediaType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:self->_title album:self->_album bundleId:self->_bundleId productId:self->_productId genre:self->_genre mediaType:v4 artist:self->_artist sumTimePlayed:self->_sumTimePlayed repetitions:v8 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (id)copyWithReplacementArtist:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:self->_title album:self->_album bundleId:self->_bundleId productId:self->_productId genre:self->_genre mediaType:self->_mediaType artist:v4 sumTimePlayed:self->_sumTimePlayed repetitions:v8 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (id)copyWithReplacementSumTimePlayed:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:self->_title album:self->_album bundleId:self->_bundleId productId:self->_productId genre:self->_genre mediaType:self->_mediaType artist:self->_artist sumTimePlayed:v4 repetitions:v8 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (id)copyWithReplacementRepetitions:(int)a3
{
  LODWORD(v4) = a3;
  return [objc_alloc((Class)objc_opt_class()) initWithTitle:self->_title album:self->_album bundleId:self->_bundleId productId:self->_productId genre:self->_genre mediaType:self->_mediaType artist:self->_artist sumTimePlayed:self->_sumTimePlayed repetitions:v4 mediaPlaySessions:self->_mediaPlaySessions firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];
}

- (id)copyWithReplacementMediaPlaySessions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LODWORD(v8) = self->_repetitions;
  id v6 = [v5 initWithTitle:self->_title album:self->_album bundleId:self->_bundleId productId:self->_productId genre:self->_genre mediaType:self->_mediaType artist:self->_artist sumTimePlayed:self->_sumTimePlayed repetitions:v8 mediaPlaySessions:v4 firstPartyTimePlayedRatio:self->_firstPartyTimePlayedRatio];

  return v6;
}

- (BOOL)isEqualToMediaPlay:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_30;
  }
  int v6 = self->_title != 0;
  v7 = [v4 title];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_30;
  }
  title = self->_title;
  if (title)
  {
    v10 = [v5 title];
    unsigned int v11 = [(NSString *)title isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  int v12 = self->_album != 0;
  v13 = [v5 album];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_30;
  }
  album = self->_album;
  if (album)
  {
    v16 = [v5 album];
    unsigned int v17 = [(NSString *)album isEqual:v16];

    if (!v17) {
      goto LABEL_30;
    }
  }
  int v18 = self->_bundleId != 0;
  id v19 = [v5 bundleId];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_30;
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    id v22 = [v5 bundleId];
    unsigned int v23 = [(NSString *)bundleId isEqual:v22];

    if (!v23) {
      goto LABEL_30;
    }
  }
  int v24 = self->_productId != 0;
  id v25 = [v5 productId];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_30;
  }
  productId = self->_productId;
  if (productId)
  {
    id v28 = [v5 productId];
    unsigned int v29 = [(NSString *)productId isEqual:v28];

    if (!v29) {
      goto LABEL_30;
    }
  }
  int v30 = self->_genre != 0;
  id v31 = [v5 genre];
  int v32 = v31 == 0;

  if (v30 == v32) {
    goto LABEL_30;
  }
  genre = self->_genre;
  if (genre)
  {
    id v34 = [v5 genre];
    unsigned int v35 = [(NSString *)genre isEqual:v34];

    if (!v35) {
      goto LABEL_30;
    }
  }
  int v36 = self->_mediaType != 0;
  id v37 = [v5 mediaType];
  int v38 = v37 == 0;

  if (v36 == v38) {
    goto LABEL_30;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    v40 = [v5 mediaType];
    unsigned int v41 = [(NSString *)mediaType isEqual:v40];

    if (!v41) {
      goto LABEL_30;
    }
  }
  int v42 = self->_artist != 0;
  v43 = [v5 artist];
  int v44 = v43 == 0;

  if (v42 == v44) {
    goto LABEL_30;
  }
  artist = self->_artist;
  if (artist)
  {
    v46 = [v5 artist];
    unsigned int v47 = [(NSString *)artist isEqual:v46];

    if (!v47) {
      goto LABEL_30;
    }
  }
  int v48 = self->_sumTimePlayed != 0;
  v49 = [v5 sumTimePlayed];
  int v50 = v49 == 0;

  if (v48 == v50) {
    goto LABEL_30;
  }
  sumTimePlayed = self->_sumTimePlayed;
  if (sumTimePlayed)
  {
    v52 = [v5 sumTimePlayed];
    unsigned int v53 = [(NSNumber *)sumTimePlayed isEqual:v52];

    if (!v53) {
      goto LABEL_30;
    }
  }
  int repetitions = self->_repetitions;
  if (repetitions != [v5 repetitions]
    || (int v55 = self->_mediaPlaySessions != 0,
        [v5 mediaPlaySessions],
        v56 = objc_claimAutoreleasedReturnValue(),
        int v57 = v56 == 0,
        v56,
        v55 == v57))
  {
LABEL_30:
    unsigned __int8 v60 = 0;
  }
  else
  {
    mediaPlaySessions = self->_mediaPlaySessions;
    if (mediaPlaySessions)
    {
      v59 = [v5 mediaPlaySessions];
      unsigned __int8 v60 = [(NSArray *)mediaPlaySessions isEqual:v59];
    }
    else
    {
      unsigned __int8 v60 = 1;
    }
  }

  return v60;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MOMediaPlay *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(MOMediaPlay *)self isEqualToMediaPlay:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  id v4 = (char *)[(NSString *)self->_album hash] + 32 * v3 - v3;
  int64_t v5 = (unsigned char *)[(NSString *)self->_bundleId hash] - v4 + 32 * (void)v4;
  int64_t v6 = [(NSString *)self->_productId hash] + 32 * v5 - v5;
  int64_t v7 = [(NSString *)self->_genre hash] + 32 * v6 - v6;
  int64_t v8 = [(NSString *)self->_mediaType hash] + 32 * v7 - v7;
  int64_t v9 = [(NSString *)self->_artist hash] + 32 * v8 - v8;
  v10 = [(NSNumber *)self->_sumTimePlayed hash];
  uint64_t v11 = self->_repetitions - (void)&v10[32 * v9 - v9] + 32 * (void)&v10[32 * v9 - v9];
  return (unint64_t)[(NSArray *)self->_mediaPlaySessions hash] + 32 * v11 - v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOMediaPlay)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64_t v6 = (objc_class *)objc_opt_class();
      int64_t v7 = NSStringFromClass(v6);
      int64_t v8 = (objc_class *)objc_opt_class();
      int64_t v9 = NSStringFromClass(v8);
      id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"title\" (expected %@, decoded %@)", v7, v9, 0];
      NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
      id v102 = v10;
      id v11 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      id v12 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
      v13 = 0;
LABEL_42:

      goto LABEL_43;
    }
LABEL_6:
    int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"album"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        int64_t v9 = NSStringFromClass(v15);
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"album\" (expected %@, decoded %@)", v9, v10, 0];
        NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
        id v100 = v11;
        id v12 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        id v17 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v17];
        v13 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      int v18 = [v4 error];

      if (v18)
      {
        v13 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v78 = self;
        id v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        int v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"bundleId\" (expected %@, decoded %@)", v10, v11, 0];
        NSErrorUserInfoKey v97 = NSLocalizedDescriptionKey;
        id v98 = v12;
        id v17 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        id v21 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v17];
        [v4 failWithError:v21];
        v13 = 0;
LABEL_39:

LABEL_40:
        self = v78;
        goto LABEL_41;
      }
    }
    else
    {
      id v22 = [v4 error];

      if (v22)
      {
        v13 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productId"];
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v78 = self;
        unsigned int v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        int v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"productId\" (expected %@, decoded %@)", v11, v12, 0];
        NSErrorUserInfoKey v95 = NSLocalizedDescriptionKey;
        id v96 = v17;
        uint64_t v77 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        id v25 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v77];
        [v4 failWithError:v25];
        v13 = 0;
LABEL_37:

LABEL_38:
        id v21 = (id)v77;
        goto LABEL_39;
      }
    }
    else
    {
      int v26 = [v4 error];

      if (v26)
      {
        v13 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    v78 = self;
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
        id v94 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"genre\" (expected %@, decoded %@)", v12, v17, 0];
        uint64_t v77 = (uint64_t)v94;
        id v25 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        id v29 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v25];
        [v4 failWithError:v29];
        int v30 = v29;
LABEL_35:
        v13 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      id v31 = [v4 error];

      if (v31)
      {
        v13 = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v32 = (objc_class *)objc_opt_class();
        uint64_t v33 = NSStringFromClass(v32);
        id v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v77 = id v17 = (id)v33;
        id v25 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"mediaType\" (expected %@, decoded %@)", v33, v77, 0];
        NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
        id v92 = v25;
        id v74 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        id v35 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v74];
        [v4 failWithError:v35];

LABEL_34:
        int v30 = v74;
        goto LABEL_35;
      }
    }
    else
    {
      int v36 = [v4 error];

      if (v36)
      {
        v13 = 0;
        goto LABEL_42;
      }
    }
    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artist"];
    if (v73)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v37 = (objc_class *)objc_opt_class();
        uint64_t v77 = NSStringFromClass(v37);
        int v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v17 = (id)v73;
        id v74 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"artist\" (expected %@, decoded %@)", v77, v25, 0];
        NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
        id v90 = v74;
        v69 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        id v39 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v69];
        [v4 failWithError:v39];

        goto LABEL_34;
      }
    }
    else
    {
      unsigned int v41 = [v4 error];

      if (v41)
      {
        v13 = 0;
        id v17 = 0;
        goto LABEL_40;
      }
    }
    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sumTimePlayed"];
    if (v77)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        v43 = (objc_class *)objc_opt_class();
        uint64_t v75 = NSStringFromClass(v43);
        id v70 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"sumTimePlayed\" (expected %@, decoded %@)", v25, v75, 0];
        NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
        id v88 = v70;
        int v44 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        id v45 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v44];
        [v4 failWithError:v45];

LABEL_65:
        int v30 = (void *)v75;
LABEL_66:
        v13 = 0;
        id v17 = (id)v73;
        goto LABEL_36;
      }
    }
    else
    {
      v46 = [v4 error];

      if (v46) {
        goto LABEL_61;
      }
    }
    unsigned int v71 = [v4 decodeInt64ForKey:@"repetitions"];
    if (v71) {
      goto LABEL_55;
    }
    int v55 = [v4 error];

    if (!v55)
    {
      if (([v4 containsValueForKey:@"repetitions"] & 1) == 0)
      {
        NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
        CFStringRef v86 = @"Missing serialized value for MOMediaPlay.repetitions";
        id v25 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        id v61 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:1 userInfo:v25];
        [v4 failWithError:v61];
        int v30 = v61;
        goto LABEL_66;
      }
LABEL_55:
      id v47 = objc_alloc((Class)NSSet);
      uint64_t v48 = objc_opt_class();
      id v49 = [v47 initWithObjects:v48, objc_opt_class(), 0];
      id v25 = [v4 decodeObjectOfClasses:v49 forKey:@"mediaPlaySessions"];

      if (!v25)
      {
        id v67 = 0;
        v56 = [v4 error];

        id v17 = (id)v73;
        if (v56)
        {
          v13 = 0;
          id v25 = 0;
          goto LABEL_37;
        }
        NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
        CFStringRef v84 = @"Retrieved nil serialized value for nonnull MOMediaPlay.mediaPlaySessions";
        uint64_t v62 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        id v63 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:2 userInfo:v62];
        [v4 failWithError:v63];

        int v30 = (void *)v62;
        goto LABEL_70;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v57 = (objc_class *)objc_opt_class();
        uint64_t v75 = NSStringFromClass(v57);
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        id v70 = (id)objc_claimAutoreleasedReturnValue();
        id v68 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"mediaPlaySessions\" (expected %@, decoded %@)", v75, v70, 0];
        NSErrorUserInfoKey v81 = NSLocalizedDescriptionKey;
        id v82 = v68;
        v59 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        id v60 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v59];
        [v4 failWithError:v60];

        goto LABEL_65;
      }
      id v67 = v25;
      uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstPartyTimePlayedRatio"];
      if (v76)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v50 = (objc_class *)objc_opt_class();
          v66 = NSStringFromClass(v50);
          v51 = (objc_class *)objc_opt_class();
          v72 = NSStringFromClass(v51);
          id v52 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"firstPartyTimePlayedRatio\" (expected %@, decoded %@)", v66, v72, 0];
          NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
          id v80 = v52;
          unsigned int v53 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          id v54 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v53];
          [v4 failWithError:v54];

          id v17 = (id)v73;
          int v30 = (void *)v76;
LABEL_70:
          v13 = 0;
          id v25 = v67;
          goto LABEL_36;
        }
      }
      else
      {
        v64 = [v4 error];

        if (v64)
        {
          v13 = 0;
          id v17 = (id)v73;
LABEL_74:
          int v30 = (void *)v76;
          goto LABEL_36;
        }
      }
      id v17 = (id)v73;
      LODWORD(v65) = v71;
      v13 = [(MOMediaPlay *)v78 initWithTitle:v5 album:v7 bundleId:v9 productId:v10 genre:v11 mediaType:v12 artist:v73 sumTimePlayed:v77 repetitions:v65 mediaPlaySessions:v25 firstPartyTimePlayedRatio:v76];
      v78 = v13;
      goto LABEL_74;
    }
LABEL_61:
    v13 = 0;
    id v17 = (id)v73;
    goto LABEL_38;
  }
  int v14 = [v4 error];

  if (!v14) {
    goto LABEL_6;
  }
  v13 = 0;
LABEL_47:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  title = self->_title;
  id v15 = v4;
  if (title)
  {
    [v4 encodeObject:title forKey:@"title"];
    id v4 = v15;
  }
  album = self->_album;
  if (album)
  {
    [v15 encodeObject:album forKey:@"album"];
    id v4 = v15;
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    [v15 encodeObject:bundleId forKey:@"bundleId"];
    id v4 = v15;
  }
  productId = self->_productId;
  if (productId)
  {
    [v15 encodeObject:productId forKey:@"productId"];
    id v4 = v15;
  }
  genre = self->_genre;
  if (genre)
  {
    [v15 encodeObject:genre forKey:@"genre"];
    id v4 = v15;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    [v15 encodeObject:mediaType forKey:@"mediaType"];
    id v4 = v15;
  }
  artist = self->_artist;
  if (artist)
  {
    [v15 encodeObject:artist forKey:@"artist"];
    id v4 = v15;
  }
  sumTimePlayed = self->_sumTimePlayed;
  if (sumTimePlayed)
  {
    [v15 encodeObject:sumTimePlayed forKey:@"sumTimePlayed"];
    id v4 = v15;
  }
  [v4 encodeInt64:self->_repetitions forKey:@"repetitions"];
  mediaPlaySessions = self->_mediaPlaySessions;
  if (mediaPlaySessions) {
    [v15 encodeObject:mediaPlaySessions forKey:@"mediaPlaySessions"];
  }
  firstPartyTimePlayedRatio = self->_firstPartyTimePlayedRatio;
  if (firstPartyTimePlayedRatio) {
    [v15 encodeObject:firstPartyTimePlayedRatio forKey:@"firstPartyTimePlayedRatio"];
  }
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  long long v10 = *(_OWORD *)&self->_bundleId;
  long long v11 = *(_OWORD *)&self->_title;
  long long v9 = *(_OWORD *)&self->_genre;
  artist = self->_artist;
  sumTimePlayed = self->_sumTimePlayed;
  int64_t v6 = +[NSNumber numberWithInt:self->_repetitions];
  id v7 = [v3 initWithFormat:@"<MOMediaPlay | title:%@ album:%@ bundleId:%@ productId:%@ genre:%@ mediaType:%@ artist:%@ sumTimePlayed:%@ repetitions:%@ mediaPlaySessions:%@>", v11, v10, v9, artist, sumTimePlayed, v6, self->_mediaPlaySessions];

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)album
{
  return self->_album;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)productId
{
  return self->_productId;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSNumber)sumTimePlayed
{
  return self->_sumTimePlayed;
}

- (int)repetitions
{
  return self->_repetitions;
}

- (NSArray)mediaPlaySessions
{
  return self->_mediaPlaySessions;
}

- (NSNumber)firstPartyTimePlayedRatio
{
  return self->_firstPartyTimePlayedRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPartyTimePlayedRatio, 0);
  objc_storeStrong((id *)&self->_mediaPlaySessions, 0);
  objc_storeStrong((id *)&self->_sumTimePlayed, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_album, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:(os_log_t)log album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:.cold.1(os_log_t log)
{
  int v1 = 136315394;
  v2 = "-[MOMediaPlay initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySe"
       "ssions:firstPartyTimePlayedRatio:]";
  __int16 v3 = 1024;
  int v4 = 20;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mediaPlaySessions != nil (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end