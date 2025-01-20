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
  v28 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]();
  }

  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOMediaPlaySession.m", 33, @"Invalid parameter not satisfying: startDate != nil (in %s:%d)", "-[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]", 33, obj, a14, a4, v38, v39, v40, a9, v42, a10,
    a11);

  if (!v26)
  {
LABEL_7:
    v30 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]();
    }

    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOMediaPlaySession.m", 34, @"Invalid parameter not satisfying: endDate != nil (in %s:%d)", "-[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]", 34);
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
    int v11 = [(NSString *)title isEqual:v10];

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
    int v17 = [(NSString *)album isEqual:v16];

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
    int v23 = [(NSString *)bundleId isEqual:v22];

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
    int v29 = [(NSString *)productId isEqual:v28];

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
    int v35 = [(NSString *)genre isEqual:v34];

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
    int v41 = [(NSString *)mediaType isEqual:v40];

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
    int v47 = [(NSString *)artist isEqual:v46];

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
    int v53 = [(NSDate *)startDate isEqual:v52];

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
    char v59 = 0;
  }
  else
  {
    endDate = self->_endDate;
    if (endDate)
    {
      v58 = [v5 endDate];
      char v59 = [(NSDate *)endDate isEqual:v58];
    }
    else
    {
      char v59 = 1;
    }
  }

  return v59;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MOMediaPlaySession *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(MOMediaPlaySession *)self isEqualToMediaPlaySession:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_album hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_bundleId hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_productId hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_genre hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_mediaType hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_artist hash] - v8 + 32 * v8;
  uint64_t v10 = [(NSDate *)self->_startDate hash] - v9 + 32 * v9;
  return [(NSDate *)self->_endDate hash] - v10 + 32 * v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOMediaPlaySession)initWithCoder:(id)a3
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSUInteger v6 = (objc_class *)objc_opt_class();
      NSUInteger v7 = NSStringFromClass(v6);
      NSUInteger v8 = (objc_class *)objc_opt_class();
      NSUInteger v9 = NSStringFromClass(v8);
      uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"title\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v105 = *MEMORY[0x1E4F28568];
      v106[0] = v10;
      int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:&v105 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_4:
      v13 = 0;
LABEL_43:

      goto LABEL_44;
    }
LABEL_7:
    NSUInteger v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"album"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSUInteger v9 = NSStringFromClass(v15);
        v16 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v16);
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"album\" (expected %@, decoded %@)", v9, v10, 0];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        v104 = v11;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        int v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v12];
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
    NSUInteger v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v19);
        int v20 = (objc_class *)objc_opt_class();
        int v11 = NSStringFromClass(v20);
        int v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"bundleId\" (expected %@, decoded %@)", v10, v11, 0];
        uint64_t v101 = *MEMORY[0x1E4F28568];
        v102 = v12;
        int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
        uint64_t v21 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v17];
        [v4 failWithError:v21];
        id v22 = (void *)v21;
        v13 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      int v23 = [v4 error];

      if (v23)
      {
        v13 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productId"];
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v24 = (objc_class *)objc_opt_class();
        int v11 = NSStringFromClass(v24);
        id v25 = (objc_class *)objc_opt_class();
        int v12 = NSStringFromClass(v25);
        int v17 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"productId\" (expected %@, decoded %@)", v11, v12, 0];
        uint64_t v99 = *MEMORY[0x1E4F28568];
        v100 = v17;
        id v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        uint64_t v26 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v82];
        [v4 failWithError:v26];
        id v27 = (void *)v26;
        v13 = 0;
LABEL_39:

LABEL_40:
        id v22 = v82;
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
    int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v80 = self;
        int v29 = (objc_class *)objc_opt_class();
        int v12 = NSStringFromClass(v29);
        int v30 = (objc_class *)objc_opt_class();
        int v17 = NSStringFromClass(v30);
        uint64_t v31 = [[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"genre\" (expected %@, decoded %@)", v12, v17, 0];
        uint64_t v97 = *MEMORY[0x1E4F28568];
        uint64_t v98 = v31;
        id v82 = (id)v31;
        uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        int v32 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v81];
        [v4 failWithError:v32];
        v13 = 0;
LABEL_37:

LABEL_38:
        self = v80;
        id v27 = (void *)v81;
        goto LABEL_39;
      }
    }
    else
    {
      v33 = [v4 error];

      if (v33)
      {
        v13 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v80 = self;
        v34 = (objc_class *)objc_opt_class();
        uint64_t v35 = NSStringFromClass(v34);
        int v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        int v17 = (void *)v35;
        id v82 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = [[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"mediaType\" (expected %@, decoded %@)", v35, v82, 0];
        uint64_t v95 = *MEMORY[0x1E4F28568];
        uint64_t v96 = v37;
        uint64_t v81 = v37;
        uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        int v38 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v79];
        [v4 failWithError:v38];
LABEL_34:
        v13 = 0;
LABEL_35:

LABEL_36:
        int v32 = (void *)v79;
        goto LABEL_37;
      }
    }
    else
    {
      id v39 = [v4 error];

      if (v39) {
        goto LABEL_4;
      }
    }
    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artist"];
    if (v78)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v80 = self;
        id v40 = (objc_class *)objc_opt_class();
        uint64_t v41 = NSStringFromClass(v40);
        int v42 = (objc_class *)objc_opt_class();
        uint64_t v81 = NSStringFromClass(v42);
        int v17 = (void *)v78;
        id v82 = (id)v41;
        uint64_t v43 = [[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"artist\" (expected %@, decoded %@)", v41, v81, 0];
        uint64_t v93 = *MEMORY[0x1E4F28568];
        uint64_t v94 = v43;
        uint64_t v79 = v43;
        int v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        int v44 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v38];
        [v4 failWithError:v44];

        goto LABEL_34;
      }
    }
    else
    {
      id v46 = [v4 error];

      if (v46)
      {
        v13 = 0;
        int v17 = 0;
        goto LABEL_42;
      }
    }
    id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    if (!v22)
    {
      v13 = 0;
      int v17 = (void *)v78;
      goto LABEL_41;
    }
    id v82 = v22;
    int v47 = [v4 error];

    if (v47)
    {
      v13 = 0;
      int v17 = (void *)v78;
      goto LABEL_40;
    }
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    id v49 = (objc_class *)objc_opt_class();
    if ((isKindOfClass & 1) == 0)
    {
      v80 = self;
      uint64_t v51 = NSStringFromClass(v49);
      v52 = (objc_class *)objc_opt_class();
      uint64_t v79 = NSStringFromClass(v52);
      uint64_t v81 = v51;
      int v38 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"startDate\" (expected %@, decoded %@)", v51, v79, 0];
      uint64_t v91 = *MEMORY[0x1E4F28568];
      v92 = v38;
      int v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      int v54 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v53];
      [v4 failWithError:v54];

LABEL_60:
      v13 = 0;
      int v17 = (void *)v78;
      goto LABEL_35;
    }
    id v27 = [v4 decodeObjectOfClass:v49 forKey:@"endDate"];
    if (!v27)
    {
      v13 = 0;
      int v17 = (void *)v78;
      goto LABEL_39;
    }
    uint64_t v81 = (uint64_t)v27;
    int v50 = [v4 error];

    if (v50)
    {
      v13 = 0;
      int v17 = (void *)v78;
      id v27 = (void *)v81;
      goto LABEL_39;
    }
    v80 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v76 = [v4 decodeInt32ForKey:@"duration"];
      char v73 = [v4 decodeBoolForKey:@"isRemote"];
      if ((v73 & 1) == 0)
      {
        v64 = [v4 error];

        if (v64)
        {
          v13 = 0;
          int v17 = (void *)v78;
          goto LABEL_38;
        }
        if (([v4 containsValueForKey:@"isRemote"] & 1) == 0)
        {
          uint64_t v87 = *MEMORY[0x1E4F28568];
          v88 = @"Missing serialized value for MOMediaPlay.isRemote";
          uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          int v38 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:1 userInfo:v79];
          [v4 failWithError:v38];
          goto LABEL_60;
        }
      }
      uint64_t v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSource"];
      if (v79)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v55 = (objc_class *)objc_opt_class();
          int v38 = NSStringFromClass(v55);
          int v56 = (objc_class *)objc_opt_class();
          v77 = NSStringFromClass(v56);
          v74 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"deviceSource\" (expected %@, decoded %@)", v38, v77, 0];
          uint64_t v85 = *MEMORY[0x1E4F28568];
          v86 = v74;
          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          v58 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v57];
          [v4 failWithError:v58];

LABEL_76:
          goto LABEL_60;
        }
      }
      else
      {
        v65 = [v4 error];

        if (v65)
        {
          v13 = 0;
          int v17 = (void *)v78;
          goto LABEL_36;
        }
      }
      int v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bkColor"];
      if (v38)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v66 = (objc_class *)objc_opt_class();
          v77 = NSStringFromClass(v66);
          v67 = (objc_class *)objc_opt_class();
          v75 = NSStringFromClass(v67);
          v72 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlay key \"bkColor\" (expected %@, decoded %@)", v77, v75, 0];
          uint64_t v83 = *MEMORY[0x1E4F28568];
          v84 = v72;
          v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          v69 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlayOCNTErrorDomain" code:3 userInfo:v68];
          [v4 failWithError:v69];

          goto LABEL_76;
        }
      }
      else
      {
        v70 = [v4 error];

        if (v70) {
          goto LABEL_60;
        }
      }
      int v17 = (void *)v78;
      BYTE4(v71) = v73;
      LODWORD(v71) = v76;
      v13 = -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:](v80, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:", v5, v7, v9, v10, v11, v12, v78, v82, v81, v71, v79, v38);
      v80 = v13;
      goto LABEL_35;
    }
    char v59 = (objc_class *)objc_opt_class();
    uint64_t v60 = NSStringFromClass(v59);
    v61 = (objc_class *)objc_opt_class();
    int v38 = NSStringFromClass(v61);
    uint64_t v79 = v60;
    v77 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for MOMediaPlaySession key \"endDate\" (expected %@, decoded %@)", v60, v38, 0];
    uint64_t v89 = *MEMORY[0x1E4F28568];
    v90 = v77;
    v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    v63 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MOMediaPlaySessionOCNTErrorDomain" code:3 userInfo:v62];
    [v4 failWithError:v63];

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
  NSUInteger v9 = [a1 describeCategory:6011];
  if ([v7 isEqualToString:v9]) {
    goto LABEL_7;
  }
  uint64_t v10 = [a1 describeCategory:6009];
  if ([v7 isEqualToString:v10])
  {

LABEL_7:
LABEL_8:
    BOOL v8 = 1;
    goto LABEL_9;
  }
  int v12 = [a1 describeCategory:6016];
  char v13 = [v7 isEqualToString:v12];

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
  char v13 = [a1 describeCategory:6011];
  char v14 = [v11 isEqualToString:v13];
  if (a6 < 90.0 || (v14 & 1) == 0)
  {
    v15 = [a1 describeCategory:6009];
    char v16 = [v11 isEqualToString:v15];
    if (v16)
    {
      if (a6 < 600.0 || !v12) {
        goto LABEL_18;
      }
    }
    else
    {
      a1 = [a1 describeCategory:6016];
      char v17 = [v11 isEqualToString:a1];
      if (!v12 || a6 < 600.0 || (v17 & 1) == 0)
      {

LABEL_18:
        goto LABEL_19;
      }
    }
    int v18 = [v12 lowercaseString];
    char v19 = [v18 containsString:@"podcast"];

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
    NSUInteger v5 = NSString;
    unint64_t v6 = [v4 length];
    if (v6 >> 1 >= 5) {
      uint64_t v7 = 5;
    }
    else {
      uint64_t v7 = v6 >> 1;
    }
    BOOL v8 = [v4 substringToIndex:v7];
    id v9 = [v5 stringWithFormat:@"%@.%lu", v8, objc_msgSend(v4, "hash")];
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setCalendar:v3];
  [v4 setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
  NSUInteger v5 = [v4 stringFromDate:self->_startDate];
  unint64_t v6 = [v4 stringFromDate:self->_endDate];
  id v7 = [NSString alloc];
  BOOL v8 = [(MOMediaPlaySession *)self redactedTitle];
  id v9 = [(MOMediaPlaySession *)self redactedAlbum];
  id v10 = (void *)[v7 initWithFormat:@"<MOMediaPlaySession | title:%@ album:%@ mediaType:%@ bundleId:%@ startDate:%@ endDate:%@ isRemote:%d deviceSource:%@>", v8, v9, self->_mediaType, self->_bundleId, v5, v6, self->_isRemote, self->_deviceSource];

  return v10;
}

+ (id)getMOPlaySessionMediaType:(id)a3 bundleId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && ![v6 hasPrefix:@"com.apple."])
  {
    id v9 = &unk_1F29322C0;
  }
  else if (v5)
  {
    BOOL v8 = [v5 lowercaseString];
    if ([v8 containsString:@"music"])
    {
      id v9 = &unk_1F29322F0;
    }
    else if ([v8 containsString:@"podcast"])
    {
      id v9 = &unk_1F2932308;
    }
    else if ([v8 containsString:@"video"])
    {
      id v9 = &unk_1F2932320;
    }
    else
    {
      id v9 = &unk_1F2932338;
    }
  }
  else
  {
    id v9 = &unk_1F29322D8;
  }

  return v9;
}

+ (id)describeCategory:(int)a3
{
  if ((a3 - 6000) >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%lu)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E691F130[a3 - 6000];
  }
  return v3;
}

+ (BOOL)isFirstPartyApp:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F29323C8];
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
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  int v2 = 34;
  _os_log_error_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate != nil (in %s:%d)", v1, 0x12u);
}

- (void)initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  int v2 = 33;
  _os_log_error_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate != nil (in %s:%d)", v1, 0x12u);
}

@end