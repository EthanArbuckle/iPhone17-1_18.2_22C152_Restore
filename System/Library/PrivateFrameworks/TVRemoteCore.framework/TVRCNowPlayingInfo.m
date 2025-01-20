@interface TVRCNowPlayingInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToNowPlayingInfo:(id)a3;
- (NSData)imageData;
- (NSData)rawTimedMetadata;
- (NSNumber)captionsEnabled;
- (NSNumber)expectsTimedMetadata;
- (NSNumber)hasValidCaptionOptions;
- (NSNumber)imageDataIsPlaceholder;
- (NSNumber)playbackRate;
- (NSNumber)playbackState;
- (NSString)identifier;
- (NSString)playerIdentifier;
- (TVRCNowPlayingInfo)initWithCoder:(id)a3;
- (TVRCNowPlayingMetadata)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nowPlayingInfoMergedWithNowPlayingInfo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptionsEnabled:(id)a3;
- (void)setExpectsTimedMetadata:(id)a3;
- (void)setHasValidCaptionOptions:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageDataIsPlaceholder:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPlaybackRate:(id)a3;
- (void)setPlaybackState:(id)a3;
- (void)setPlayerIdentifier:(id)a3;
- (void)setRawTimedMetadata:(id)a3;
@end

@implementation TVRCNowPlayingInfo

- (id)description
{
  v21 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v3);
  v28 = [(TVRCNowPlayingInfo *)self identifier];
  v29 = [(TVRCNowPlayingInfo *)self playbackRate];
  v18 = [(TVRCNowPlayingInfo *)self playbackState];
  v25 = [(TVRCNowPlayingInfo *)self metadata];
  v27 = [v25 title];
  v24 = [(TVRCNowPlayingInfo *)self metadata];
  v16 = [v24 canonicalID];
  v23 = [(TVRCNowPlayingInfo *)self metadata];
  v26 = [v23 timestamp];
  v19 = [(TVRCNowPlayingInfo *)self metadata];
  v14 = [v19 timeOffset];
  v15 = [(TVRCNowPlayingInfo *)self playerIdentifier];
  v4 = NSNumber;
  v17 = [(TVRCNowPlayingInfo *)self imageData];
  v13 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
  v5 = [(TVRCNowPlayingInfo *)self imageDataIsPlaceholder];
  v6 = NSNumber;
  v7 = [(TVRCNowPlayingInfo *)self rawTimedMetadata];
  v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
  v9 = [(TVRCNowPlayingInfo *)self expectsTimedMetadata];
  v10 = [(TVRCNowPlayingInfo *)self captionsEnabled];
  v11 = [(TVRCNowPlayingInfo *)self hasValidCaptionOptions];
  objc_msgSend(v21, "stringWithFormat:", @"<%@ %p: identifier=%@; playbackRate=%@; playbackState=%@; metadata.title=%@; metadata.canonicalID=%@; timestamp=%@; timeOffset=%@; playerIdentifier=%@; imageData.length=%@; imageDataIsPlaceholder=%@; rawTimedMetadata.length=%@, expectsTimedMetadata=%@, captionsEnabled=%@, hasValidCaptionOptions=%@",
    v20,
    self,
    v28,
    v29,
    v18,
    v27,
    v16,
    v26,
    v14,
    v15,
    v13,
    v5,
    v8,
    v9,
    v10,
  v22 = v11);

  return v22;
}

- (BOOL)isEqualToNowPlayingInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_36;
  }
  v5 = [(TVRCNowPlayingInfo *)self identifier];
  v6 = [v4 identifier];
  char v7 = (v5 == 0) ^ (v6 == 0);

  if (v7) {
    goto LABEL_36;
  }
  v8 = [(TVRCNowPlayingInfo *)self playbackRate];
  v9 = [v4 playbackRate];
  char v10 = (v8 == 0) ^ (v9 == 0);

  if (v10) {
    goto LABEL_36;
  }
  v11 = [(TVRCNowPlayingInfo *)self playbackState];
  v12 = [v4 playbackState];
  char v13 = (v11 == 0) ^ (v12 == 0);

  if (v13) {
    goto LABEL_36;
  }
  v14 = [(TVRCNowPlayingInfo *)self playerIdentifier];
  v15 = [v4 playerIdentifier];
  char v16 = (v14 == 0) ^ (v15 == 0);

  if (v16) {
    goto LABEL_36;
  }
  v17 = [(TVRCNowPlayingInfo *)self metadata];
  v18 = [v4 metadata];
  char v19 = (v17 == 0) ^ (v18 == 0);

  if (v19) {
    goto LABEL_36;
  }
  v20 = [(TVRCNowPlayingInfo *)self imageData];
  v21 = [v4 imageData];
  char v22 = (v20 == 0) ^ (v21 == 0);

  if (v22) {
    goto LABEL_36;
  }
  v23 = [(TVRCNowPlayingInfo *)self imageDataIsPlaceholder];
  v24 = [v4 imageDataIsPlaceholder];
  char v25 = (v23 == 0) ^ (v24 == 0);

  if (v25) {
    goto LABEL_36;
  }
  v26 = [(TVRCNowPlayingInfo *)self rawTimedMetadata];
  v27 = [v4 rawTimedMetadata];
  char v28 = (v26 == 0) ^ (v27 == 0);

  if (v28) {
    goto LABEL_36;
  }
  v29 = [(TVRCNowPlayingInfo *)self expectsTimedMetadata];
  v30 = [v4 expectsTimedMetadata];
  char v31 = (v29 == 0) ^ (v30 == 0);

  if (v31) {
    goto LABEL_36;
  }
  v32 = [(TVRCNowPlayingInfo *)self captionsEnabled];
  v33 = [v4 captionsEnabled];
  char v34 = (v32 == 0) ^ (v33 == 0);

  if (v34) {
    goto LABEL_36;
  }
  v35 = [(TVRCNowPlayingInfo *)self hasValidCaptionOptions];
  v36 = [v4 hasValidCaptionOptions];
  char v37 = (v35 == 0) ^ (v36 == 0);

  if (v37) {
    goto LABEL_36;
  }
  uint64_t v38 = [(TVRCNowPlayingInfo *)self identifier];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(TVRCNowPlayingInfo *)self identifier];
    v41 = [v4 identifier];
    int v42 = [v40 isEqualToString:v41];

    if (!v42) {
      goto LABEL_36;
    }
  }
  uint64_t v43 = [(TVRCNowPlayingInfo *)self playbackRate];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(TVRCNowPlayingInfo *)self playbackRate];
    v46 = [v4 playbackRate];
    int v47 = [v45 isEqualToNumber:v46];

    if (!v47) {
      goto LABEL_36;
    }
  }
  uint64_t v48 = [(TVRCNowPlayingInfo *)self playbackState];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(TVRCNowPlayingInfo *)self playbackState];
    v51 = [v4 playbackState];
    int v52 = [v50 isEqualToNumber:v51];

    if (!v52) {
      goto LABEL_36;
    }
  }
  uint64_t v53 = [(TVRCNowPlayingInfo *)self playerIdentifier];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(TVRCNowPlayingInfo *)self playerIdentifier];
    v56 = [v4 playerIdentifier];
    int v57 = [v55 isEqualToString:v56];

    if (!v57) {
      goto LABEL_36;
    }
  }
  uint64_t v58 = [(TVRCNowPlayingInfo *)self imageDataIsPlaceholder];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(TVRCNowPlayingInfo *)self imageDataIsPlaceholder];
    v61 = [v4 imageDataIsPlaceholder];
    int v62 = [v60 isEqualToNumber:v61];

    if (!v62) {
      goto LABEL_36;
    }
  }
  uint64_t v63 = [(TVRCNowPlayingInfo *)self imageData];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(TVRCNowPlayingInfo *)self imageData];
    v66 = [v4 imageData];
    int v67 = [v65 isEqualToData:v66];

    if (!v67) {
      goto LABEL_36;
    }
  }
  uint64_t v68 = [(TVRCNowPlayingInfo *)self metadata];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(TVRCNowPlayingInfo *)self metadata];
    v71 = [v4 metadata];
    int v72 = [v70 isEqualToNowPlayingMetadata:v71];

    if (!v72) {
      goto LABEL_36;
    }
  }
  uint64_t v73 = [(TVRCNowPlayingInfo *)self rawTimedMetadata];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(TVRCNowPlayingInfo *)self rawTimedMetadata];
    v76 = [v4 rawTimedMetadata];
    int v77 = [v75 isEqualToData:v76];

    if (!v77) {
      goto LABEL_36;
    }
  }
  uint64_t v78 = [(TVRCNowPlayingInfo *)self expectsTimedMetadata];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(TVRCNowPlayingInfo *)self expectsTimedMetadata];
    v81 = [v4 expectsTimedMetadata];
    int v82 = [v80 isEqualToNumber:v81];

    if (!v82) {
      goto LABEL_36;
    }
  }
  uint64_t v83 = [(TVRCNowPlayingInfo *)self captionsEnabled];
  if (!v83) {
    goto LABEL_34;
  }
  v84 = (void *)v83;
  v85 = [(TVRCNowPlayingInfo *)self captionsEnabled];
  v86 = [v4 captionsEnabled];
  int v87 = [v85 isEqualToNumber:v86];

  if (!v87)
  {
LABEL_36:
    char v92 = 0;
  }
  else
  {
LABEL_34:
    uint64_t v88 = [(TVRCNowPlayingInfo *)self hasValidCaptionOptions];
    if (v88)
    {
      v89 = (void *)v88;
      v90 = [(TVRCNowPlayingInfo *)self hasValidCaptionOptions];
      v91 = [v4 hasValidCaptionOptions];
      char v92 = [v90 isEqualToNumber:v91];
    }
    else
    {
      char v92 = 1;
    }
  }

  return v92;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TVRCNowPlayingInfo);
  v5 = (void *)[(NSString *)self->_identifier copy];
  [(TVRCNowPlayingInfo *)v4 setIdentifier:v5];

  v6 = (void *)[(NSNumber *)self->_playbackRate copy];
  [(TVRCNowPlayingInfo *)v4 setPlaybackRate:v6];

  char v7 = (void *)[(NSNumber *)self->_playbackState copy];
  [(TVRCNowPlayingInfo *)v4 setPlaybackState:v7];

  v8 = (void *)[(NSString *)self->_playerIdentifier copy];
  [(TVRCNowPlayingInfo *)v4 setPlayerIdentifier:v8];

  v9 = (void *)[(TVRCNowPlayingMetadata *)self->_metadata copy];
  [(TVRCNowPlayingInfo *)v4 setMetadata:v9];

  [(TVRCNowPlayingInfo *)v4 setImageData:self->_imageData];
  char v10 = (void *)[(NSNumber *)self->_imageDataIsPlaceholder copy];
  [(TVRCNowPlayingInfo *)v4 setImageDataIsPlaceholder:v10];

  [(TVRCNowPlayingInfo *)v4 setRawTimedMetadata:self->_rawTimedMetadata];
  [(TVRCNowPlayingInfo *)v4 setExpectsTimedMetadata:self->_expectsTimedMetadata];
  v11 = (void *)[(NSNumber *)self->_captionsEnabled copy];
  [(TVRCNowPlayingInfo *)v4 setCaptionsEnabled:v11];

  v12 = (void *)[(NSNumber *)self->_hasValidCaptionOptions copy];
  [(TVRCNowPlayingInfo *)v4 setHasValidCaptionOptions:v12];

  return v4;
}

- (id)nowPlayingInfoMergedWithNowPlayingInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(TVRCNowPlayingInfo *)self copy];
  v6 = [v4 identifier];

  if (v6)
  {
    char v7 = [v4 identifier];
    [v5 setIdentifier:v7];
  }
  v8 = [v4 playbackRate];

  if (v8)
  {
    v9 = [v4 playbackRate];
    [v5 setPlaybackRate:v9];
  }
  char v10 = [v4 playbackState];

  if (v10)
  {
    v11 = [v4 playbackState];
    [v5 setPlaybackState:v11];
  }
  v12 = [v4 playerIdentifier];

  if (v12)
  {
    char v13 = [v4 playerIdentifier];
    [v5 setPlayerIdentifier:v13];
  }
  v14 = [v4 metadata];

  if (v14)
  {
    v15 = [v4 metadata];
    [v5 setMetadata:v15];
  }
  char v16 = [v4 imageData];

  if (v16)
  {
    v17 = [v4 imageData];
    [v5 setImageData:v17];
  }
  v18 = [v4 imageDataIsPlaceholder];

  if (v18)
  {
    char v19 = [v4 imageDataIsPlaceholder];
    [v5 setImageDataIsPlaceholder:v19];
  }
  v20 = [v4 rawTimedMetadata];

  if (v20)
  {
    v21 = [v4 rawTimedMetadata];
    [v5 setRawTimedMetadata:v21];
  }
  char v22 = [v4 expectsTimedMetadata];

  if (v22)
  {
    v23 = [v4 expectsTimedMetadata];
    [v5 setExpectsTimedMetadata:v23];
  }
  v24 = [v4 captionsEnabled];

  if (v24)
  {
    char v25 = [v4 captionsEnabled];
    [v5 setCaptionsEnabled:v25];
  }
  v26 = [v4 hasValidCaptionOptions];

  if (v26)
  {
    v27 = [v4 hasValidCaptionOptions];
    [v5 setHasValidCaptionOptions:v27];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCNowPlayingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TVRCNowPlayingInfo;
  v5 = [(TVRCNowPlayingInfo *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playbackRate"];
    playbackRate = v5->_playbackRate;
    v5->_playbackRate = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playbackState"];
    playbackState = v5->_playbackState;
    v5->_playbackState = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerIdentifier"];
    playerIdentifier = v5->_playerIdentifier;
    v5->_playerIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (TVRCNowPlayingMetadata *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageDataIsPlaceholder"];
    imageDataIsPlaceholder = v5->_imageDataIsPlaceholder;
    v5->_imageDataIsPlaceholder = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawTimedMetadata"];
    rawTimedMetadata = v5->_rawTimedMetadata;
    v5->_rawTimedMetadata = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectsTimedMetadata"];
    expectsTimedMetadata = v5->_expectsTimedMetadata;
    v5->_expectsTimedMetadata = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"captionsEnabled"];
    captionsEnabled = v5->_captionsEnabled;
    v5->_captionsEnabled = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasValidCaptionOptions"];
    hasValidCaptionOptions = v5->_hasValidCaptionOptions;
    v5->_hasValidCaptionOptions = (NSNumber *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_playbackRate forKey:@"playbackRate"];
  [v5 encodeObject:self->_playbackState forKey:@"playbackState"];
  [v5 encodeObject:self->_playerIdentifier forKey:@"playerIdentifier"];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
  [v5 encodeObject:self->_imageData forKey:@"imageData"];
  [v5 encodeObject:self->_imageDataIsPlaceholder forKey:@"imageDataIsPlaceholder"];
  [v5 encodeObject:self->_rawTimedMetadata forKey:@"rawTimedMetadata"];
  [v5 encodeObject:self->_expectsTimedMetadata forKey:@"expectsTimedMetadata"];
  [v5 encodeObject:self->_captionsEnabled forKey:@"captionsEnabled"];
  [v5 encodeObject:self->_hasValidCaptionOptions forKey:@"hasValidCaptionOptions"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(id)a3
{
}

- (NSNumber)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(id)a3
{
}

- (NSString)playerIdentifier
{
  return self->_playerIdentifier;
}

- (void)setPlayerIdentifier:(id)a3
{
}

- (TVRCNowPlayingMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSData)rawTimedMetadata
{
  return self->_rawTimedMetadata;
}

- (void)setRawTimedMetadata:(id)a3
{
}

- (NSNumber)expectsTimedMetadata
{
  return self->_expectsTimedMetadata;
}

- (void)setExpectsTimedMetadata:(id)a3
{
}

- (NSNumber)captionsEnabled
{
  return self->_captionsEnabled;
}

- (void)setCaptionsEnabled:(id)a3
{
}

- (NSNumber)hasValidCaptionOptions
{
  return self->_hasValidCaptionOptions;
}

- (void)setHasValidCaptionOptions:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSNumber)imageDataIsPlaceholder
{
  return self->_imageDataIsPlaceholder;
}

- (void)setImageDataIsPlaceholder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDataIsPlaceholder, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_hasValidCaptionOptions, 0);
  objc_storeStrong((id *)&self->_captionsEnabled, 0);
  objc_storeStrong((id *)&self->_expectsTimedMetadata, 0);
  objc_storeStrong((id *)&self->_rawTimedMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_playerIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_playbackRate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end