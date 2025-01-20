@interface VUIPlistMediaDatabaseItem
- (BOOL)isEqual:(id)a3;
- (NSDate)releaseDate;
- (NSDictionary)offlineFPSKeys;
- (NSNumber)HLSColorCapability;
- (NSNumber)colorCapability;
- (NSNumber)duration;
- (NSNumber)episodeNumber;
- (NSNumber)isPlayable;
- (NSString)downloadState;
- (NSString)studio;
- (NSURL)filePathURL;
- (NSURL)playbackURL;
- (NSURL)previewFrameURL;
- (VUIContentRating)contentRating;
- (VUIMediaItemCredits)credits;
- (VUIPlistMediaDatabaseItem)initWithDictionary:(id)a3;
- (VUIPlistMediaDatabaseItem)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (VUIPlistMediaDatabaseSeason)season;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)isLocal;
- (void)setColorCapability:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setCredits:(id)a3;
- (void)setDownloadState:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEpisodeNumber:(id)a3;
- (void)setFilePathURL:(id)a3;
- (void)setHLSColorCapability:(id)a3;
- (void)setOfflineFPSKeys:(id)a3;
- (void)setPlaybackURL:(id)a3;
- (void)setPreviewFrameURL:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setSeason:(id)a3;
- (void)setStudio:(id)a3;
@end

@implementation VUIPlistMediaDatabaseItem

- (VUIPlistMediaDatabaseItem)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VUIPlistMediaDatabaseItem;
  v4 = [(VUIPlistMediaDatabaseEntity *)&v9 initWithIdentifier:a3 type:a4];
  v5 = v4;
  if (v4)
  {
    colorCapability = v4->_colorCapability;
    v4->_colorCapability = (NSNumber *)&unk_1F3F3D388;

    HLSColorCapability = v5->_HLSColorCapability;
    v5->_HLSColorCapability = (NSNumber *)&unk_1F3F3D388;

    objc_storeStrong((id *)&v5->_downloadState, VUIPlistDatabaseItemDownloadStateNotDownloaded);
  }
  return v5;
}

- (VUIPlistMediaDatabaseItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)VUIPlistMediaDatabaseItem;
  v5 = [(VUIPlistMediaDatabaseEntity *)&v53 initWithDictionary:v4];
  if (v5)
  {
    v6 = objc_msgSend(v4, "vui_numberForKey:", @"Local");
    uint64_t v7 = [v6 copy];
    local = v5->_local;
    v5->_local = (NSNumber *)v7;

    objc_super v9 = objc_msgSend(v4, "vui_numberForKey:", @"Duration");
    uint64_t v10 = [v9 copy];
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v10;

    v12 = objc_msgSend(v4, "vui_dateForKey:", @"ReleaseDate");
    uint64_t v13 = [v12 copy];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v13;

    v15 = objc_msgSend(v4, "vui_numberForKey:", @"EpisodeNumber");
    uint64_t v16 = [v15 copy];
    episodeNumber = v5->_episodeNumber;
    v5->_episodeNumber = (NSNumber *)v16;

    v18 = objc_msgSend(v4, "vui_stringForKey:", @"Studio");
    uint64_t v19 = [v18 copy];
    studio = v5->_studio;
    v5->_studio = (NSString *)v19;

    v21 = objc_msgSend(v4, "vui_numberForKey:", @"ColorCapability");
    uint64_t v22 = [v21 copy];
    colorCapability = v5->_colorCapability;
    v5->_colorCapability = (NSNumber *)v22;

    v24 = objc_msgSend(v4, "vui_numberForKey:", @"ColorCapability");
    uint64_t v25 = [v24 copy];
    HLSColorCapability = v5->_HLSColorCapability;
    v5->_HLSColorCapability = (NSNumber *)v25;

    v27 = objc_msgSend(v4, "vui_dictionaryForKey:", @"OfflineFPSKeys");
    uint64_t v28 = [v27 copy];
    offlineFPSKeys = v5->_offlineFPSKeys;
    v5->_offlineFPSKeys = (NSDictionary *)v28;

    v30 = objc_msgSend(v4, "vui_stringForKey:", @"DownloadState");
    uint64_t v31 = [v30 copy];
    downloadState = v5->_downloadState;
    v5->_downloadState = (NSString *)v31;

    if (!v5->_downloadState) {
      objc_storeStrong((id *)&v5->_downloadState, VUIPlistDatabaseItemDownloadStateNotDownloaded);
    }
    if (!v5->_colorCapability)
    {
      v5->_colorCapability = (NSNumber *)&unk_1F3F3D388;
    }
    if (!v5->_HLSColorCapability)
    {
      v5->_HLSColorCapability = (NSNumber *)&unk_1F3F3D388;
    }
    v33 = objc_msgSend(v4, "vui_stringForKey:", @"ContentRating");
    if (v33)
    {
      uint64_t v34 = [objc_alloc(MEMORY[0x1E4FB3C60]) initWithStringRepresentation:v33];
      contentRating = v5->_contentRating;
      v5->_contentRating = (VUIContentRating *)v34;
    }
    v36 = objc_msgSend(v4, "vui_stringForKey:", @"PreviewFrameURL");
    if (v36)
    {
      uint64_t v37 = [MEMORY[0x1E4F1CB10] URLWithString:v36];
      previewFrameURL = v5->_previewFrameURL;
      v5->_previewFrameURL = (NSURL *)v37;
    }
    v39 = objc_msgSend(v4, "vui_stringForKey:", @"Credits");
    if (v39)
    {
      v40 = [[VUIMediaItemCredits alloc] initWithStringRepresentation:v39];
      credits = v5->_credits;
      v5->_credits = v40;
    }
    v42 = objc_msgSend(v4, "vui_stringForKey:", @"RelativeFilePathString");
    if ([v42 length])
    {
      v43 = (void *)MEMORY[0x1E4F1CB10];
      v44 = NSHomeDirectory();
      v45 = [v43 fileURLWithPath:v44];
      uint64_t v46 = [v43 fileURLWithPath:v42 relativeToURL:v45];
      filePathURL = v5->_filePathURL;
      v5->_filePathURL = (NSURL *)v46;
    }
    v48 = objc_msgSend(v4, "vui_stringForKey:", @"PlaybackURL");
    v49 = v48;
    if (v48 && [v48 length])
    {
      uint64_t v50 = [MEMORY[0x1E4F1CB10] URLWithString:v49];
      playbackURL = v5->_playbackURL;
      v5->_playbackURL = (NSURL *)v50;
    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v26.receiver = self;
  v26.super_class = (Class)VUIPlistMediaDatabaseItem;
  v3 = [(VUIPlistMediaDatabaseEntity *)&v26 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];
  v5 = [(VUIPlistMediaDatabaseItem *)self isLocal];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v5, @"Local");

  v6 = [(VUIPlistMediaDatabaseItem *)self duration];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v6, @"Duration");

  uint64_t v7 = [(VUIPlistMediaDatabaseItem *)self releaseDate];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v7, @"ReleaseDate");

  v8 = [(VUIPlistMediaDatabaseItem *)self episodeNumber];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v8, @"EpisodeNumber");

  objc_super v9 = [(VUIPlistMediaDatabaseItem *)self studio];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v9, @"Studio");

  uint64_t v10 = [(VUIPlistMediaDatabaseItem *)self credits];
  v11 = [v10 stringRepresentation];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v11, @"Credits");

  v12 = [(VUIPlistMediaDatabaseItem *)self previewFrameURL];
  uint64_t v13 = [v12 absoluteString];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v13, @"PreviewFrameURL");

  v14 = [(VUIPlistMediaDatabaseItem *)self contentRating];
  v15 = [v14 stringRepresentation];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v15, @"ContentRating");

  uint64_t v16 = [(VUIPlistMediaDatabaseItem *)self colorCapability];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v16, @"ColorCapability");

  v17 = [(VUIPlistMediaDatabaseItem *)self HLSColorCapability];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v17, @"HLSColorCapability");

  v18 = [(VUIPlistMediaDatabaseItem *)self playbackURL];
  uint64_t v19 = [v18 absoluteString];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v19, @"PlaybackURL");

  v20 = [(VUIPlistMediaDatabaseItem *)self filePathURL];
  v21 = [v20 relativeString];
  uint64_t v22 = [v21 stringByRemovingPercentEncoding];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v22, @"RelativeFilePathString");

  v23 = [(VUIPlistMediaDatabaseItem *)self offlineFPSKeys];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v23, @"OfflineFPSKeys");

  v24 = [(VUIPlistMediaDatabaseItem *)self downloadState];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v24, @"DownloadState");

  return v4;
}

- (NSNumber)isPlayable
{
  return (NSNumber *)MEMORY[0x1E4F1CC38];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)VUIPlistMediaDatabaseItem;
  id v4 = [(VUIPlistMediaDatabaseEntity *)&v34 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_local copy];
  v6 = (void *)v4[8];
  v4[8] = v5;

  uint64_t v7 = [(NSNumber *)self->_duration copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSDate *)self->_releaseDate copy];
  uint64_t v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_episodeNumber copy];
  v12 = (void *)v4[16];
  v4[16] = v11;

  uint64_t v13 = [(NSString *)self->_studio copy];
  v14 = (void *)v4[17];
  v4[17] = v13;

  uint64_t v15 = [(VUIMediaItemCredits *)self->_credits copy];
  uint64_t v16 = (void *)v4[18];
  v4[18] = v15;

  uint64_t v17 = [(NSURL *)self->_previewFrameURL copy];
  v18 = (void *)v4[12];
  v4[12] = v17;

  uint64_t v19 = [(VUIContentRating *)self->_contentRating copy];
  v20 = (void *)v4[13];
  v4[13] = v19;

  uint64_t v21 = [(NSNumber *)self->_colorCapability copy];
  uint64_t v22 = (void *)v4[14];
  v4[14] = v21;

  uint64_t v23 = [(NSNumber *)self->_HLSColorCapability copy];
  v24 = (void *)v4[15];
  v4[15] = v23;

  uint64_t v25 = [(NSURL *)self->_playbackURL copy];
  objc_super v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSURL *)self->_filePathURL copy];
  uint64_t v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSDictionary *)self->_offlineFPSKeys copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSString *)self->_downloadState copy];
  v32 = (void *)v4[22];
  v4[22] = v31;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIPlistMediaDatabaseItem *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v66.receiver = self;
        v66.super_class = (Class)VUIPlistMediaDatabaseItem;
        if (![(VUIPlistMediaDatabaseEntity *)&v66 isEqual:v6])
        {
LABEL_83:
          char v12 = 0;
LABEL_91:

          goto LABEL_92;
        }
        uint64_t v7 = [(VUIPlistMediaDatabaseItem *)self isPlayable];
        v8 = [(VUIPlistMediaDatabaseItem *)v6 isPlayable];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          uint64_t v11 = v10;
          char v12 = 0;
          if (!v9 || !v10) {
            goto LABEL_90;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0) {
            goto LABEL_83;
          }
        }
        v14 = [(VUIPlistMediaDatabaseItem *)self duration];
        uint64_t v15 = [(VUIPlistMediaDatabaseItem *)v6 duration];
        id v9 = v14;
        id v16 = v15;
        if (v9 == v16)
        {
        }
        else
        {
          uint64_t v11 = v16;
          char v12 = 0;
          if (!v9 || !v16) {
            goto LABEL_90;
          }
          char v17 = [v9 isEqual:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_83;
          }
        }
        v18 = [(VUIPlistMediaDatabaseItem *)self releaseDate];
        uint64_t v19 = [(VUIPlistMediaDatabaseItem *)v6 releaseDate];
        id v9 = v18;
        id v20 = v19;
        if (v9 == v20)
        {
        }
        else
        {
          uint64_t v11 = v20;
          char v12 = 0;
          if (!v9 || !v20) {
            goto LABEL_90;
          }
          char v21 = [v9 isEqual:v20];

          if ((v21 & 1) == 0) {
            goto LABEL_83;
          }
        }
        uint64_t v22 = [(VUIPlistMediaDatabaseItem *)self episodeNumber];
        uint64_t v23 = [(VUIPlistMediaDatabaseItem *)v6 episodeNumber];
        id v9 = v22;
        id v24 = v23;
        if (v9 == v24)
        {
        }
        else
        {
          uint64_t v11 = v24;
          char v12 = 0;
          if (!v9 || !v24) {
            goto LABEL_90;
          }
          char v25 = [v9 isEqual:v24];

          if ((v25 & 1) == 0) {
            goto LABEL_83;
          }
        }
        objc_super v26 = [(VUIPlistMediaDatabaseItem *)self studio];
        uint64_t v27 = [(VUIPlistMediaDatabaseItem *)v6 studio];
        id v9 = v26;
        id v28 = v27;
        if (v9 == v28)
        {
        }
        else
        {
          uint64_t v11 = v28;
          char v12 = 0;
          if (!v9 || !v28) {
            goto LABEL_90;
          }
          char v29 = [v9 isEqual:v28];

          if ((v29 & 1) == 0) {
            goto LABEL_83;
          }
        }
        v30 = [(VUIPlistMediaDatabaseItem *)self credits];
        uint64_t v31 = [(VUIPlistMediaDatabaseItem *)v6 credits];
        id v9 = v30;
        id v32 = v31;
        if (v9 == v32)
        {
        }
        else
        {
          uint64_t v11 = v32;
          char v12 = 0;
          if (!v9 || !v32) {
            goto LABEL_90;
          }
          char v33 = [v9 isEqual:v32];

          if ((v33 & 1) == 0) {
            goto LABEL_83;
          }
        }
        objc_super v34 = [(VUIPlistMediaDatabaseItem *)self previewFrameURL];
        v35 = [(VUIPlistMediaDatabaseItem *)v6 previewFrameURL];
        id v9 = v34;
        id v36 = v35;
        if (v9 == v36)
        {
        }
        else
        {
          uint64_t v11 = v36;
          char v12 = 0;
          if (!v9 || !v36) {
            goto LABEL_90;
          }
          char v37 = [v9 isEqual:v36];

          if ((v37 & 1) == 0) {
            goto LABEL_83;
          }
        }
        v38 = [(VUIPlistMediaDatabaseItem *)self contentRating];
        v39 = [(VUIPlistMediaDatabaseItem *)v6 contentRating];
        id v9 = v38;
        id v40 = v39;
        if (v9 == v40)
        {
        }
        else
        {
          uint64_t v11 = v40;
          char v12 = 0;
          if (!v9 || !v40) {
            goto LABEL_90;
          }
          char v41 = [v9 isEqual:v40];

          if ((v41 & 1) == 0) {
            goto LABEL_83;
          }
        }
        v42 = [(VUIPlistMediaDatabaseItem *)self colorCapability];
        v43 = [(VUIPlistMediaDatabaseItem *)v6 colorCapability];
        id v9 = v42;
        id v44 = v43;
        if (v9 == v44)
        {
        }
        else
        {
          uint64_t v11 = v44;
          char v12 = 0;
          if (!v9 || !v44) {
            goto LABEL_90;
          }
          char v45 = [v9 isEqual:v44];

          if ((v45 & 1) == 0) {
            goto LABEL_83;
          }
        }
        uint64_t v46 = [(VUIPlistMediaDatabaseItem *)self HLSColorCapability];
        v47 = [(VUIPlistMediaDatabaseItem *)v6 HLSColorCapability];
        id v9 = v46;
        id v48 = v47;
        if (v9 == v48)
        {
        }
        else
        {
          uint64_t v11 = v48;
          char v12 = 0;
          if (!v9 || !v48) {
            goto LABEL_90;
          }
          char v49 = [v9 isEqual:v48];

          if ((v49 & 1) == 0) {
            goto LABEL_83;
          }
        }
        uint64_t v50 = [(VUIPlistMediaDatabaseItem *)self playbackURL];
        v51 = [(VUIPlistMediaDatabaseItem *)v6 playbackURL];
        id v9 = v50;
        id v52 = v51;
        if (v9 == v52)
        {
        }
        else
        {
          uint64_t v11 = v52;
          char v12 = 0;
          if (!v9 || !v52) {
            goto LABEL_90;
          }
          char v53 = [v9 isEqual:v52];

          if ((v53 & 1) == 0) {
            goto LABEL_83;
          }
        }
        v54 = [(VUIPlistMediaDatabaseItem *)self filePathURL];
        v55 = [(VUIPlistMediaDatabaseItem *)v6 filePathURL];
        id v9 = v54;
        id v56 = v55;
        if (v9 == v56)
        {
        }
        else
        {
          uint64_t v11 = v56;
          char v12 = 0;
          if (!v9 || !v56) {
            goto LABEL_90;
          }
          char v57 = [v9 isEqual:v56];

          if ((v57 & 1) == 0) {
            goto LABEL_83;
          }
        }
        v58 = [(VUIPlistMediaDatabaseItem *)self offlineFPSKeys];
        v59 = [(VUIPlistMediaDatabaseItem *)v6 offlineFPSKeys];
        id v9 = v58;
        id v60 = v59;
        if (v9 == v60)
        {

LABEL_85:
          v62 = [(VUIPlistMediaDatabaseItem *)self downloadState];
          v63 = [(VUIPlistMediaDatabaseItem *)v6 downloadState];
          id v9 = v62;
          id v64 = v63;
          uint64_t v11 = v64;
          if (v9 == v64)
          {
            char v12 = 1;
          }
          else
          {
            char v12 = 0;
            if (v9 && v64) {
              char v12 = [v9 isEqual:v64];
            }
          }
          goto LABEL_90;
        }
        uint64_t v11 = v60;
        char v12 = 0;
        if (v9 && v60)
        {
          char v61 = [v9 isEqual:v60];

          if ((v61 & 1) == 0) {
            goto LABEL_83;
          }
          goto LABEL_85;
        }
LABEL_90:

        goto LABEL_91;
      }
    }
    char v12 = 0;
  }
LABEL_92:

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v50.receiver = self;
  v50.super_class = (Class)VUIPlistMediaDatabaseItem;
  id v4 = [(VUIPlistMediaDatabaseEntity *)&v50 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  v6 = [(VUIPlistMediaDatabaseItem *)self isPlayable];
  [v6 BOOLValue];
  uint64_t v7 = VUIBoolLogString();
  v8 = [v5 stringWithFormat:@"%@=%@", @"isPlayable", v7];
  [v3 addObject:v8];

  id v9 = NSString;
  id v10 = [(VUIPlistMediaDatabaseItem *)self duration];
  uint64_t v11 = [v9 stringWithFormat:@"%@=%@", @"duration", v10];
  [v3 addObject:v11];

  char v12 = NSString;
  char v13 = [(VUIPlistMediaDatabaseItem *)self releaseDate];
  v14 = [v12 stringWithFormat:@"%@=%@", @"releaseDate", v13];
  [v3 addObject:v14];

  uint64_t v15 = NSString;
  id v16 = [(VUIPlistMediaDatabaseItem *)self episodeNumber];
  char v17 = [v15 stringWithFormat:@"%@=%@", @"episodeNumber", v16];
  [v3 addObject:v17];

  v18 = NSString;
  uint64_t v19 = [(VUIPlistMediaDatabaseItem *)self studio];
  id v20 = [v18 stringWithFormat:@"%@=%@", @"studio", v19];
  [v3 addObject:v20];

  char v21 = NSString;
  uint64_t v22 = [(VUIPlistMediaDatabaseItem *)self credits];
  uint64_t v23 = [v21 stringWithFormat:@"%@=%@", @"credits", v22];
  [v3 addObject:v23];

  id v24 = NSString;
  char v25 = [(VUIPlistMediaDatabaseItem *)self previewFrameURL];
  objc_super v26 = [v24 stringWithFormat:@"%@=%@", @"previewFrameURL", v25];
  [v3 addObject:v26];

  uint64_t v27 = NSString;
  id v28 = [(VUIPlistMediaDatabaseItem *)self contentRating];
  char v29 = [v27 stringWithFormat:@"%@=%@", @"contentRating", v28];
  [v3 addObject:v29];

  v30 = NSString;
  uint64_t v31 = [(VUIPlistMediaDatabaseItem *)self colorCapability];
  id v32 = [v30 stringWithFormat:@"%@=%@", @"colorCapability", v31];
  [v3 addObject:v32];

  char v33 = NSString;
  objc_super v34 = [(VUIPlistMediaDatabaseItem *)self HLSColorCapability];
  v35 = [v33 stringWithFormat:@"%@=%@", @"HLSColorCapability", v34];
  [v3 addObject:v35];

  id v36 = NSString;
  char v37 = [(VUIPlistMediaDatabaseItem *)self playbackURL];
  v38 = [v36 stringWithFormat:@"%@=%@", @"playbackURL", v37];
  [v3 addObject:v38];

  v39 = NSString;
  id v40 = [(VUIPlistMediaDatabaseItem *)self filePathURL];
  char v41 = [v39 stringWithFormat:@"%@=%@", @"filePathURL", v40];
  [v3 addObject:v41];

  v42 = [NSString stringWithFormat:@"%@=%@", @"offlineFPSKeys", @"[omitted]"];
  [v3 addObject:v42];

  v43 = NSString;
  id v44 = [(VUIPlistMediaDatabaseItem *)self downloadState];
  char v45 = [v43 stringWithFormat:@"%@=%@", @"downloadState", v44];
  [v3 addObject:v45];

  uint64_t v46 = NSString;
  v47 = [v3 componentsJoinedByString:@", "];
  id v48 = [v46 stringWithFormat:@"<%@>", v47];

  return v48;
}

- (id)isLocal
{
  return self->_local;
}

- (VUIPlistMediaDatabaseSeason)season
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_season);
  return (VUIPlistMediaDatabaseSeason *)WeakRetained;
}

- (void)setSeason:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSURL)previewFrameURL
{
  return self->_previewFrameURL;
}

- (void)setPreviewFrameURL:(id)a3
{
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
}

- (NSNumber)colorCapability
{
  return self->_colorCapability;
}

- (void)setColorCapability:(id)a3
{
}

- (NSNumber)HLSColorCapability
{
  return self->_HLSColorCapability;
}

- (void)setHLSColorCapability:(id)a3
{
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
}

- (NSString)studio
{
  return self->_studio;
}

- (void)setStudio:(id)a3
{
}

- (VUIMediaItemCredits)credits
{
  return self->_credits;
}

- (void)setCredits:(id)a3
{
}

- (NSURL)playbackURL
{
  return self->_playbackURL;
}

- (void)setPlaybackURL:(id)a3
{
}

- (NSURL)filePathURL
{
  return self->_filePathURL;
}

- (void)setFilePathURL:(id)a3
{
}

- (NSDictionary)offlineFPSKeys
{
  return self->_offlineFPSKeys;
}

- (void)setOfflineFPSKeys:(id)a3
{
}

- (NSString)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadState, 0);
  objc_storeStrong((id *)&self->_offlineFPSKeys, 0);
  objc_storeStrong((id *)&self->_filePathURL, 0);
  objc_storeStrong((id *)&self->_playbackURL, 0);
  objc_storeStrong((id *)&self->_credits, 0);
  objc_storeStrong((id *)&self->_studio, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_HLSColorCapability, 0);
  objc_storeStrong((id *)&self->_colorCapability, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_previewFrameURL, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_destroyWeak((id *)&self->_season);
  objc_storeStrong((id *)&self->_local, 0);
}

@end