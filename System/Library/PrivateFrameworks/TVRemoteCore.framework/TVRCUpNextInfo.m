@interface TVRCUpNextInfo
+ (BOOL)isAppleOriginalFromDict:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)serviceNameFromDict:(id)a3;
+ (id)upNextInfoWithDictionary:(id)a3;
+ (id)upNextInfoWithMediaInfo:(id)a3 reason:(id)a4 service:(id)a5 isAppleOriginal:(BOOL)a6 progress:(id)a7 timeRemaining:(id)a8 actionURL:(id)a9 shareURL:(id)a10 shareShowURL:(id)a11 artworkNeedsCornerBlur:(BOOL)a12;
- (BOOL)artworkNeedsCornerBlur;
- (BOOL)isAppleOriginal;
- (BOOL)isEqualToUpNextInfo:(id)a3;
- (NSNumber)progress;
- (NSNumber)timeRemaining;
- (NSNumber)timestamp;
- (NSString)reason;
- (NSString)service;
- (NSURL)actionURL;
- (NSURL)shareShowURL;
- (NSURL)shareURL;
- (TVRCMediaInfo)mediaInfo;
- (TVRCUpNextInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setArtworkNeedsCornerBlur:(BOOL)a3;
- (void)setIsAppleOriginal:(BOOL)a3;
- (void)setMediaInfo:(id)a3;
- (void)setProgress:(id)a3;
- (void)setReason:(id)a3;
- (void)setService:(id)a3;
- (void)setShareShowURL:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setTimeRemaining:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation TVRCUpNextInfo

+ (id)upNextInfoWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(TVRCUpNextInfo);
  v6 = +[TVRCMediaInfo mediaInfoWithDictionary:v4];
  [(TVRCUpNextInfo *)v5 setMediaInfo:v6];

  v7 = [v4 objectForKeyedSubscript:@"localizedContext"];
  [(TVRCUpNextInfo *)v5 setReason:v7];

  v8 = [v4 objectForKeyedSubscript:@"timestamp"];
  [(TVRCUpNextInfo *)v5 setTimestamp:v8];

  v9 = [a1 serviceNameFromDict:v4];
  [(TVRCUpNextInfo *)v5 setService:v9];

  uint64_t v10 = [a1 isAppleOriginalFromDict:v4];
  [(TVRCUpNextInfo *)v5 setIsAppleOriginal:v10];

  return v5;
}

+ (id)upNextInfoWithMediaInfo:(id)a3 reason:(id)a4 service:(id)a5 isAppleOriginal:(BOOL)a6 progress:(id)a7 timeRemaining:(id)a8 actionURL:(id)a9 shareURL:(id)a10 shareShowURL:(id)a11 artworkNeedsCornerBlur:(BOOL)a12
{
  BOOL v27 = a6;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = objc_alloc_init(TVRCUpNextInfo);
  [(TVRCUpNextInfo *)v25 setMediaInfo:v24];

  [(TVRCUpNextInfo *)v25 setReason:v23];
  [(TVRCUpNextInfo *)v25 setService:v22];

  [(TVRCUpNextInfo *)v25 setIsAppleOriginal:v27];
  [(TVRCUpNextInfo *)v25 setProgress:v21];

  [(TVRCUpNextInfo *)v25 setTimeRemaining:v20];
  [(TVRCUpNextInfo *)v25 setActionURL:v19];

  [(TVRCUpNextInfo *)v25 setShareURL:v18];
  [(TVRCUpNextInfo *)v25 setShareShowURL:v17];

  [(TVRCUpNextInfo *)v25 setArtworkNeedsCornerBlur:a12];

  return v25;
}

- (BOOL)isEqualToUpNextInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  v5 = [(TVRCUpNextInfo *)self progress];
  v6 = [v4 progress];
  char v7 = (v5 == 0) ^ (v6 == 0);

  if (v7) {
    goto LABEL_24;
  }
  v8 = [(TVRCUpNextInfo *)self timeRemaining];
  v9 = [v4 timeRemaining];
  char v10 = (v8 == 0) ^ (v9 == 0);

  if (v10) {
    goto LABEL_24;
  }
  v11 = [(TVRCUpNextInfo *)self actionURL];
  v12 = [v4 actionURL];
  char v13 = (v11 == 0) ^ (v12 == 0);

  if (v13) {
    goto LABEL_24;
  }
  v14 = [(TVRCUpNextInfo *)self shareURL];
  v15 = [v4 shareURL];
  char v16 = (v14 == 0) ^ (v15 == 0);

  if (v16) {
    goto LABEL_24;
  }
  id v17 = [(TVRCUpNextInfo *)self shareShowURL];
  id v18 = [v4 shareShowURL];
  char v19 = (v17 == 0) ^ (v18 == 0);

  if (v19) {
    goto LABEL_24;
  }
  id v20 = [(TVRCUpNextInfo *)self reason];
  id v21 = [v4 reason];
  int v22 = [v20 isEqualToString:v21];

  if (!v22) {
    goto LABEL_24;
  }
  id v23 = [(TVRCUpNextInfo *)self timestamp];
  id v24 = [v4 timestamp];
  int v25 = [v23 isEqualToNumber:v24];

  if (!v25) {
    goto LABEL_24;
  }
  v26 = [(TVRCUpNextInfo *)self service];
  BOOL v27 = [v4 service];
  int v28 = [v26 isEqualToString:v27];

  if (!v28) {
    goto LABEL_24;
  }
  int v29 = [(TVRCUpNextInfo *)self isAppleOriginal];
  if (v29 != [v4 isAppleOriginal]) {
    goto LABEL_24;
  }
  v30 = [(TVRCUpNextInfo *)self mediaInfo];
  v31 = [v4 mediaInfo];
  int v32 = [v30 isEqualToMediaInfo:v31];

  if (!v32) {
    goto LABEL_24;
  }
  uint64_t v33 = [(TVRCUpNextInfo *)self progress];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(TVRCUpNextInfo *)self progress];
    v36 = [v4 progress];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_24;
    }
  }
  uint64_t v38 = [(TVRCUpNextInfo *)self timeRemaining];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(TVRCUpNextInfo *)self timeRemaining];
    v41 = [v4 timeRemaining];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_24;
    }
  }
  uint64_t v43 = [(TVRCUpNextInfo *)self actionURL];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(TVRCUpNextInfo *)self actionURL];
    v46 = [v4 actionURL];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_24;
    }
  }
  uint64_t v48 = [(TVRCUpNextInfo *)self shareURL];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(TVRCUpNextInfo *)self shareURL];
    v51 = [v4 shareURL];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_24;
    }
  }
  uint64_t v53 = [(TVRCUpNextInfo *)self shareShowURL];
  if (!v53) {
    goto LABEL_23;
  }
  v54 = (void *)v53;
  v55 = [(TVRCUpNextInfo *)self shareShowURL];
  v56 = [v4 shareShowURL];
  int v57 = [v55 isEqual:v56];

  if (v57)
  {
LABEL_23:
    BOOL v58 = [(TVRCUpNextInfo *)self artworkNeedsCornerBlur];
    int v59 = v58 ^ [v4 artworkNeedsCornerBlur] ^ 1;
  }
  else
  {
LABEL_24:
    LOBYTE(v59) = 0;
  }

  return v59;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = [(TVRCUpNextInfo *)self mediaInfo];
  char v7 = (void *)[v6 copyWithZone:a3];
  [v5 setMediaInfo:v7];

  v8 = [(TVRCUpNextInfo *)self reason];
  [v5 setReason:v8];

  v9 = [(TVRCUpNextInfo *)self service];
  [v5 setService:v9];

  char v10 = [(TVRCUpNextInfo *)self timestamp];
  [v5 setTimestamp:v10];

  objc_msgSend(v5, "setIsAppleOriginal:", -[TVRCUpNextInfo isAppleOriginal](self, "isAppleOriginal"));
  v11 = [(TVRCUpNextInfo *)self progress];
  [v5 setProgress:v11];

  v12 = [(TVRCUpNextInfo *)self timeRemaining];
  [v5 setTimeRemaining:v12];

  char v13 = [(TVRCUpNextInfo *)self actionURL];
  [v5 setActionURL:v13];

  v14 = [(TVRCUpNextInfo *)self shareURL];
  [v5 setShareURL:v14];

  v15 = [(TVRCUpNextInfo *)self shareShowURL];
  [v5 setShareShowURL:v15];

  objc_msgSend(v5, "setArtworkNeedsCornerBlur:", -[TVRCUpNextInfo artworkNeedsCornerBlur](self, "artworkNeedsCornerBlur"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCUpNextInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TVRCUpNextInfo;
  id v5 = [(TVRCUpNextInfo *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaInfo"];
    mediaInfo = v5->_mediaInfo;
    v5->_mediaInfo = (TVRCMediaInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
    service = v5->_service;
    v5->_service = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v12;

    v5->_isAppleOriginal = [v4 decodeBoolForKey:@"isAppleOriginal"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progress"];
    progress = v5->_progress;
    v5->_progress = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeRemaining"];
    timeRemaining = v5->_timeRemaining;
    v5->_timeRemaining = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareShowURL"];
    shareShowURL = v5->_shareShowURL;
    v5->_shareShowURL = (NSURL *)v22;

    v5->_artworkNeedsCornerBlur = [v4 decodeBoolForKey:@"artworkNeedsCornerBlur"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  mediaInfo = self->_mediaInfo;
  id v5 = a3;
  [v5 encodeObject:mediaInfo forKey:@"mediaInfo"];
  [v5 encodeObject:self->_reason forKey:@"reason"];
  [v5 encodeObject:self->_service forKey:@"service"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeBool:self->_isAppleOriginal forKey:@"isAppleOriginal"];
  [v5 encodeObject:self->_progress forKey:@"progress"];
  [v5 encodeObject:self->_timeRemaining forKey:@"timeRemaining"];
  [v5 encodeObject:self->_actionURL forKey:@"actionURL"];
  [v5 encodeObject:self->_shareURL forKey:@"shareURL"];
  [v5 encodeObject:self->_shareShowURL forKey:@"shareShowURL"];
  [v5 encodeBool:self->_artworkNeedsCornerBlur forKey:@"artworkNeedsCornerBlur"];
}

+ (id)serviceNameFromDict:(id)a3
{
  return &stru_26DA49BC8;
}

+ (BOOL)isAppleOriginalFromDict:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"isAppleOriginal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (TVRCMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (void)setMediaInfo:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
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

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(id)a3
{
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSURL)shareShowURL
{
  return self->_shareShowURL;
}

- (void)setShareShowURL:(id)a3
{
}

- (BOOL)artworkNeedsCornerBlur
{
  return self->_artworkNeedsCornerBlur;
}

- (void)setArtworkNeedsCornerBlur:(BOOL)a3
{
  self->_artworkNeedsCornerBlur = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareShowURL, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_timeRemaining, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_mediaInfo, 0);
}

@end