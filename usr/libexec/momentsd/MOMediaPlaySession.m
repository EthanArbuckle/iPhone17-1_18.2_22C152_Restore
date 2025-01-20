@interface MOMediaPlaySession
+ (BOOL)isFirstPartyApp:(id)a3;
+ (BOOL)isValidThirdParty:(id)a3 bundleCategory:(id)a4;
+ (BOOL)isValidThirdPartyEvent:(id)a3 bundleCategory:(id)a4 mediaTypeString:(id)a5 playTime:(double)a6;
+ (BOOL)supportsSecureCoding;
+ (id)describeCategory:(int)a3;
+ (id)getMOPlaySessionMediaType:(id)a3 bundleId:(id)a4;
+ (id)redactString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMediaPlaySession:(id)a3;
- (BOOL)isRemote;
- (MOMediaPlaySession)initWithCoder:(id)a3;
- (MOMediaPlaySession)initWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 startDate:(id)a10 endDate:(id)a11 duration:(unsigned int)a12 isRemote:(BOOL)a13 deviceSource:(id)a14 bgColor:(id)a15;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)album;
- (NSString)artist;
- (NSString)bgColor;
- (NSString)bundleId;
- (NSString)deviceSource;
- (NSString)genre;
- (NSString)mediaType;
- (NSString)productId;
- (NSString)title;
- (id)description;
- (id)redactedAlbum;
- (id)redactedArtist;
- (id)redactedTitle;
- (unint64_t)hash;
- (unsigned)duration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOMediaPlaySession

- (MOMediaPlaySession)initWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 startDate:(id)a10 endDate:(id)a11 duration:(unsigned int)a12 isRemote:(BOOL)a13 deviceSource:(id)a14 bgColor:(id)a15
{
  id obj = a3;
  id v48 = a3;
  id v37 = a4;
  id v47 = a4;
  id v38 = a5;
  id v21 = a5;
  id v39 = a6;
  id v22 = a6;
  id v40 = a7;
  id v23 = a7;
  id v42 = a8;
  id v24 = a8;
  id v41 = a9;
  id v49 = a9;
  id v43 = a10;
  id v25 = a10;
  id v44 = a11;
  id v26 = a11;
  id v36 = a14;
  id v46 = a14;
  id v27 = a15;
  if (v25)
  {
    if (v26) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v28 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]();
  }

  v29 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOMediaPlaySession.m", 33, @"Invalid parameter not satisfying: startDate != nil (in %s:%d)", "-[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]", 33, obj, a14, a4, v38, v39, v40, a9, v42, a10,
    a11);

  if (!v26)
  {
LABEL_7:
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]();
    }

    v31 = +[NSAssertionHandler currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"MOMediaPlaySession.m" lineNumber:34 description:@"Invalid parameter not satisfying: endDate != nil (in %s:%d)", "-[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]", 34];
  }
LABEL_10:
  v50.receiver = self;
  v50.super_class = (Class)MOMediaPlaySession;
  v32 = [(MOMediaPlaySession *)&v50 init];
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_title, obj);
    objc_storeStrong((id *)&v33->_album, v37);
    objc_storeStrong((id *)&v33->_bundleId, v38);
    objc_storeStrong((id *)&v33->_productId, v39);
    objc_storeStrong((id *)&v33->_genre, v40);
    objc_storeStrong((id *)&v33->_mediaType, v42);
    objc_storeStrong((id *)&v33->_artist, v41);
    objc_storeStrong((id *)&v33->_startDate, v43);
    objc_storeStrong((id *)&v33->_endDate, v44);
    v33->_duration = a12;
    v33->_isRemote = a13;
    objc_storeStrong((id *)&v33->_deviceSource, v36);
    objc_storeStrong((id *)&v33->_bgColor, a15);
  }

  return v33;
}

- (BOOL)isEqualToMediaPlaySession:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_29;
  }
  int v6 = self->_title != 0;
  v7 = [v4 title];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_29;
  }
  title = self->_title;
  if (title)
  {
    v10 = [v5 title];
    unsigned int v11 = [(NSString *)title isEqual:v10];

    if (!v11) {
      goto LABEL_29;
    }
  }
  int v12 = self->_album != 0;
  v13 = [v5 album];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_29;
  }
  album = self->_album;
  if (album)
  {
    v16 = [v5 album];
    unsigned int v17 = [(NSString *)album isEqual:v16];

    if (!v17) {
      goto LABEL_29;
    }
  }
  int v18 = self->_bundleId != 0;
  v19 = [v5 bundleId];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_29;
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    id v22 = [v5 bundleId];
    unsigned int v23 = [(NSString *)bundleId isEqual:v22];

    if (!v23) {
      goto LABEL_29;
    }
  }
  int v24 = self->_productId != 0;
  id v25 = [v5 productId];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_29;
  }
  productId = self->_productId;
  if (productId)
  {
    v28 = [v5 productId];
    unsigned int v29 = [(NSString *)productId isEqual:v28];

    if (!v29) {
      goto LABEL_29;
    }
  }
  int v30 = self->_genre != 0;
  v31 = [v5 genre];
  int v32 = v31 == 0;

  if (v30 == v32) {
    goto LABEL_29;
  }
  genre = self->_genre;
  if (genre)
  {
    v34 = [v5 genre];
    unsigned int v35 = [(NSString *)genre isEqual:v34];

    if (!v35) {
      goto LABEL_29;
    }
  }
  int v36 = self->_mediaType != 0;
  id v37 = [v5 mediaType];
  int v38 = v37 == 0;

  if (v36 == v38) {
    goto LABEL_29;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    id v40 = [v5 mediaType];
    unsigned int v41 = [(NSString *)mediaType isEqual:v40];

    if (!v41) {
      goto LABEL_29;
    }
  }
  int v42 = self->_artist != 0;
  id v43 = [v5 artist];
  int v44 = v43 == 0;

  if (v42 == v44) {
    goto LABEL_29;
  }
  artist = self->_artist;
  if (artist)
  {
    id v46 = [v5 artist];
    unsigned int v47 = [(NSString *)artist isEqual:v46];

    if (!v47) {
      goto LABEL_29;
    }
  }
  int v48 = self->_startDate != 0;
  id v49 = [v5 startDate];
  int v50 = v49 == 0;

  if (v48 == v50) {
    goto LABEL_29;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    v52 = [v5 startDate];
    unsigned int v53 = [(NSDate *)startDate isEqual:v52];

    if (!v53) {
      goto LABEL_29;
    }
  }
  int v54 = self->_endDate != 0;
  v55 = [v5 endDate];
  int v56 = v55 == 0;

  if (v54 == v56)
  {
LABEL_29:
    unsigned __int8 v59 = 0;
  }
  else
  {
    endDate = self->_endDate;
    if (endDate)
    {
      v58 = [v5 endDate];
      unsigned __int8 v59 = [(NSDate *)endDate isEqual:v58];
    }
    else
    {
      unsigned __int8 v59 = 1;
    }
  }

  return v59;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MOMediaPlaySession *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(MOMediaPlaySession *)self isEqualToMediaPlaySession:v5];
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
  int64_t v10 = (int64_t)[(NSDate *)self->_startDate hash] + 32 * v9 - v9;
  return (unint64_t)[(NSDate *)self->_endDate hash] + 32 * v10 - v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOMediaPlaySession)initWithCoder:(id)a3
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
      id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"title\" (expected %@, decoded %@)", v7, v9, 0];
      NSErrorUserInfoKey v102 = NSLocalizedDescriptionKey;
      id v103 = v10;
      id v11 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
      id v12 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_4:
      v13 = 0;
LABEL_43:

      goto LABEL_44;
    }
LABEL_7:
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
        id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"album\" (expected %@, decoded %@)", v9, v10, 0];
        NSErrorUserInfoKey v100 = NSLocalizedDescriptionKey;
        id v101 = v11;
        id v12 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        id v17 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v17];
        v13 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {
      int v18 = [v4 error];

      if (v18)
      {
        v13 = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        int v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"bundleId\" (expected %@, decoded %@)", v10, v11, 0];
        NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
        id v99 = v12;
        id v17 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        id v21 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v17];
        [v4 failWithError:v21];
        id v22 = v21;
        v13 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      unsigned int v23 = [v4 error];

      if (v23)
      {
        v13 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productId"];
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"productId\" (expected %@, decoded %@)", v11, v12, 0];
        NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
        id v97 = v17;
        id v79 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        id v26 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v79];
        [v4 failWithError:v26];
        id v27 = v26;
        v13 = 0;
LABEL_39:

LABEL_40:
        id v22 = v79;
        goto LABEL_41;
      }
    }
    else
    {
      v28 = [v4 error];

      if (v28)
      {
        v13 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v77 = self;
        unsigned int v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        int v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
        id v95 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"genre\" (expected %@, decoded %@)", v12, v17, 0];
        id v79 = v95;
        uint64_t v78 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
        id v31 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v78];
        [v4 failWithError:v31];
        v13 = 0;
LABEL_37:

LABEL_38:
        self = v77;
        id v27 = (void *)v78;
        goto LABEL_39;
      }
    }
    else
    {
      int v32 = [v4 error];

      if (v32)
      {
        v13 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v77 = self;
        v33 = (objc_class *)objc_opt_class();
        uint64_t v34 = NSStringFromClass(v33);
        unsigned int v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        id v17 = (id)v34;
        id v79 = (id)objc_claimAutoreleasedReturnValue();
        NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
        id v93 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"mediaType\" (expected %@, decoded %@)", v34, v79, 0];
        uint64_t v78 = (uint64_t)v93;
        uint64_t v76 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        id v36 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v76];
        [v4 failWithError:v36];
LABEL_34:
        v13 = 0;
LABEL_35:

LABEL_36:
        id v31 = (id)v76;
        goto LABEL_37;
      }
    }
    else
    {
      id v37 = [v4 error];

      if (v37) {
        goto LABEL_4;
      }
    }
    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artist"];
    if (v75)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v77 = self;
        int v38 = (objc_class *)objc_opt_class();
        uint64_t v39 = NSStringFromClass(v38);
        id v40 = (objc_class *)objc_opt_class();
        uint64_t v78 = NSStringFromClass(v40);
        id v17 = (id)v75;
        id v79 = (id)v39;
        NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
        id v91 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"artist\" (expected %@, decoded %@)", v39, v78, 0];
        uint64_t v76 = (uint64_t)v91;
        id v36 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        id v41 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v36];
        [v4 failWithError:v41];

        goto LABEL_34;
      }
    }
    else
    {
      id v43 = [v4 error];

      if (v43)
      {
        v13 = 0;
        id v17 = 0;
        goto LABEL_42;
      }
    }
    id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    if (!v22)
    {
      v13 = 0;
      id v17 = (id)v75;
      goto LABEL_41;
    }
    id v79 = v22;
    int v44 = [v4 error];

    if (v44)
    {
      v13 = 0;
      id v17 = (id)v75;
      goto LABEL_40;
    }
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    id v46 = (objc_class *)objc_opt_class();
    if ((isKindOfClass & 1) == 0)
    {
      v77 = self;
      uint64_t v48 = NSStringFromClass(v46);
      id v49 = (objc_class *)objc_opt_class();
      uint64_t v76 = NSStringFromClass(v49);
      uint64_t v78 = v48;
      id v36 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"startDate\" (expected %@, decoded %@)", v48, v76, 0];
      NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
      id v89 = v36;
      int v50 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      id v51 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v50];
      [v4 failWithError:v51];

LABEL_60:
      v13 = 0;
      id v17 = (id)v75;
      goto LABEL_35;
    }
    id v27 = [v4 decodeObjectOfClass:v46 forKey:@"endDate"];
    if (!v27)
    {
      v13 = 0;
      id v17 = (id)v75;
      goto LABEL_39;
    }
    uint64_t v78 = (uint64_t)v27;
    unsigned int v47 = [v4 error];

    if (v47)
    {
      v13 = 0;
      id v17 = (id)v75;
      id v27 = (void *)v78;
      goto LABEL_39;
    }
    v77 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v73 = [v4 decodeInt32ForKey:@"duration"];
      unsigned __int8 v70 = [v4 decodeBoolForKey:@"isRemote"];
      if ((v70 & 1) == 0)
      {
        v61 = [v4 error];

        if (v61)
        {
          v13 = 0;
          id v17 = (id)v75;
          goto LABEL_38;
        }
        if (([v4 containsValueForKey:@"isRemote"] & 1) == 0)
        {
          NSErrorUserInfoKey v84 = NSLocalizedDescriptionKey;
          CFStringRef v85 = @"Missing serialized value for MOMediaPlay.isRemote";
          uint64_t v76 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          id v36 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:1 userInfo:v76];
          [v4 failWithError:v36];
          goto LABEL_60;
        }
      }
      uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSource"];
      if (v76)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v52 = (objc_class *)objc_opt_class();
          NSStringFromClass(v52);
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          unsigned int v53 = (objc_class *)objc_opt_class();
          NSStringFromClass(v53);
          id v74 = (id)objc_claimAutoreleasedReturnValue();
          id v71 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"deviceSource\" (expected %@, decoded %@)", v36, v74, 0];
          NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
          id v83 = v71;
          int v54 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          id v55 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v54];
          [v4 failWithError:v55];

LABEL_76:
          goto LABEL_60;
        }
      }
      else
      {
        v62 = [v4 error];

        if (v62)
        {
          v13 = 0;
          id v17 = (id)v75;
          goto LABEL_36;
        }
      }
      id v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bkColor"];
      if (v36)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v63 = (objc_class *)objc_opt_class();
          NSStringFromClass(v63);
          id v74 = (id)objc_claimAutoreleasedReturnValue();
          v64 = (objc_class *)objc_opt_class();
          v72 = NSStringFromClass(v64);
          id v69 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"bkColor\" (expected %@, decoded %@)", v74, v72, 0];
          NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
          id v81 = v69;
          v65 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          id v66 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v65];
          [v4 failWithError:v66];

          goto LABEL_76;
        }
      }
      else
      {
        v67 = [v4 error];

        if (v67) {
          goto LABEL_60;
        }
      }
      id v17 = (id)v75;
      BYTE4(v68) = v70;
      LODWORD(v68) = v73;
      v13 = -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:](v77, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:", v5, v7, v9, v10, v11, v12, v75, v79, v78, v68, v76, v36);
      v77 = v13;
      goto LABEL_35;
    }
    int v56 = (objc_class *)objc_opt_class();
    uint64_t v57 = NSStringFromClass(v56);
    v58 = (objc_class *)objc_opt_class();
    NSStringFromClass(v58);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = v57;
    id v74 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"endDate\" (expected %@, decoded %@)", v57, v36, 0];
    NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
    id v87 = v74;
    unsigned __int8 v59 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    id v60 = [objc_alloc((Class)NSError) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v59];
    [v4 failWithError:v60];

    goto LABEL_76;
  }
  int v14 = [v4 error];

  if (!v14) {
    goto LABEL_7;
  }
  v13 = 0;
LABEL_48:

  return v13;
}

+ (BOOL)isValidThirdParty:(id)a3 bundleCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || ([v6 hasPrefix:@"com.apple."] & 1) != 0) {
    goto LABEL_3;
  }
  int64_t v9 = [a1 describeCategory:6011];
  if ([v7 isEqualToString:v9]) {
    goto LABEL_7;
  }
  id v10 = [a1 describeCategory:6009];
  if ([v7 isEqualToString:v10])
  {

LABEL_7:
LABEL_8:
    BOOL v8 = 1;
    goto LABEL_9;
  }
  id v12 = [a1 describeCategory:6016];
  unsigned __int8 v13 = [v7 isEqualToString:v12];

  if (v13) {
    goto LABEL_8;
  }
LABEL_3:
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

+ (BOOL)isValidThirdPartyEvent:(id)a3 bundleCategory:(id)a4 mediaTypeString:(id)a5 playTime:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10 || ([v10 hasPrefix:@"com.apple."] & 1) != 0) {
    goto LABEL_19;
  }
  unsigned __int8 v13 = [a1 describeCategory:6011];
  unsigned __int8 v14 = [v11 isEqualToString:v13];
  if (a6 < 90.0 || (v14 & 1) == 0)
  {
    v15 = [a1 describeCategory:6009];
    unsigned __int8 v16 = [v11 isEqualToString:v15];
    if (v16)
    {
      if (a6 < 600.0 || !v12) {
        goto LABEL_18;
      }
    }
    else
    {
      a1 = [a1 describeCategory:6016];
      unsigned __int8 v17 = [v11 isEqualToString:a1];
      if (!v12 || a6 < 600.0 || (v17 & 1) == 0)
      {

LABEL_18:
        goto LABEL_19;
      }
    }
    int v18 = [v12 lowercaseString];
    unsigned __int8 v19 = [v18 containsString:@"podcast"];

    if ((v16 & 1) == 0) {
    if (v19)
    }
      goto LABEL_16;
LABEL_19:
    BOOL v20 = 0;
    goto LABEL_20;
  }

LABEL_16:
  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  title = self->_title;
  id v16 = v4;
  if (title)
  {
    [v4 encodeObject:title forKey:@"title"];
    id v4 = v16;
  }
  album = self->_album;
  if (album)
  {
    [v16 encodeObject:album forKey:@"album"];
    id v4 = v16;
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    [v16 encodeObject:bundleId forKey:@"bundleId"];
    id v4 = v16;
  }
  productId = self->_productId;
  if (productId)
  {
    [v16 encodeObject:productId forKey:@"productId"];
    id v4 = v16;
  }
  genre = self->_genre;
  if (genre)
  {
    [v16 encodeObject:genre forKey:@"genre"];
    id v4 = v16;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    [v16 encodeObject:mediaType forKey:@"mediaType"];
    id v4 = v16;
  }
  artist = self->_artist;
  if (artist)
  {
    [v16 encodeObject:artist forKey:@"artist"];
    id v4 = v16;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    [v16 encodeObject:startDate forKey:@"startDate"];
    id v4 = v16;
  }
  endDate = self->_endDate;
  if (endDate)
  {
    [v16 encodeObject:endDate forKey:@"endDate"];
    id v4 = v16;
  }
  uint64_t duration = self->_duration;
  if (duration)
  {
    [v16 encodeInt32:duration forKey:@"duration"];
    id v4 = v16;
  }
  [v4 encodeBool:self->_isRemote forKey:@"isRemote"];
  deviceSource = self->_deviceSource;
  if (deviceSource) {
    [v16 encodeObject:deviceSource forKey:@"deviceSource"];
  }
  if (self->_bgColor) {
    [v16 encodeObject:self->_deviceSource forKey:@"bkColor"];
  }
}

- (id)redactedTitle
{
  return +[MOMediaPlaySession redactString:self->_title];
}

- (id)redactedAlbum
{
  return +[MOMediaPlaySession redactString:self->_album];
}

- (id)redactedArtist
{
  return +[MOMediaPlaySession redactString:self->_artist];
}

+ (id)redactString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    unint64_t v5 = (unint64_t)[v4 length];
    if (v5 >> 1 >= 5) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = v5 >> 1;
    }
    id v7 = [v4 substringToIndex:v6];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%lu", v7, [v4 hash]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (id)description
{
  id v3 = +[NSCalendar currentCalendar];
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setCalendar:v3];
  [v4 setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
  unint64_t v5 = [v4 stringFromDate:self->_startDate];
  uint64_t v6 = [v4 stringFromDate:self->_endDate];
  id v7 = objc_alloc((Class)NSString);
  id v8 = [(MOMediaPlaySession *)self redactedTitle];
  int64_t v9 = [(MOMediaPlaySession *)self redactedAlbum];
  id v10 = [v7 initWithFormat:@"<MOMediaPlaySession | title:%@ album:%@ mediaType:%@ bundleId:%@ startDate:%@ endDate:%@ isRemote:%d deviceSource:%@>", v8, v9, self->_mediaType, self->_bundleId, v5, v6, self->_isRemote, self->_deviceSource];

  return v10;
}

+ (id)getMOPlaySessionMediaType:(id)a3 bundleId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && ![v6 hasPrefix:@"com.apple."])
  {
    int64_t v9 = &off_1002F4AA8;
  }
  else if (v5)
  {
    id v8 = [v5 lowercaseString];
    if ([v8 containsString:@"music"])
    {
      int64_t v9 = &off_1002F4AD8;
    }
    else if ([v8 containsString:@"podcast"])
    {
      int64_t v9 = &off_1002F4AF0;
    }
    else if ([v8 containsString:@"video"])
    {
      int64_t v9 = &off_1002F4B08;
    }
    else
    {
      int64_t v9 = &off_1002F4B20;
    }
  }
  else
  {
    int64_t v9 = &off_1002F4AC0;
  }

  return v9;
}

+ (id)describeCategory:(int)a3
{
  if ((a3 - 6000) >= 0x16)
  {
    id v3 = +[NSString stringWithFormat:@"Unknown (%lu)", a3];
  }
  else
  {
    id v3 = *(&off_1002CAEE0 + a3 - 6000);
  }

  return v3;
}

+ (BOOL)isFirstPartyApp:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSet setWithArray:&off_1002F8DE0];
  id v5 = v4;
  BOOL v6 = v3 && ([v4 containsObject:v3] & 1) != 0;

  return v6;
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

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unsigned)duration
{
  return self->_duration;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (NSString)deviceSource
{
  return self->_deviceSource;
}

- (NSString)bgColor
{
  return self->_bgColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgColor, 0);
  objc_storeStrong((id *)&self->_deviceSource, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_album, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 34;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate != nil (in %s:%d)", v1, 0x12u);
}

- (void)initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 33;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate != nil (in %s:%d)", v1, 0x12u);
}

@end