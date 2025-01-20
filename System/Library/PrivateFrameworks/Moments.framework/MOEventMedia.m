@interface MOEventMedia
+ (BOOL)supportsSecureCoding;
- (MOEventMedia)initWithCoder:(id)a3;
- (NSArray)mediaPlaySessions;
- (NSNumber)mediaFirstPartyTimePlayedRatio;
- (NSNumber)mediaRepetitions;
- (NSNumber)mediaSumTimePlayed;
- (NSString)mediaAlbum;
- (NSString)mediaArtist;
- (NSString)mediaGenre;
- (NSString)mediaPlayerBundleId;
- (NSString)mediaProductId;
- (NSString)mediaTitle;
- (NSString)mediaType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMediaAlbum:(id)a3;
- (void)setMediaArtist:(id)a3;
- (void)setMediaFirstPartyTimePlayedRatio:(id)a3;
- (void)setMediaGenre:(id)a3;
- (void)setMediaPlaySessions:(id)a3;
- (void)setMediaPlayerBundleId:(id)a3;
- (void)setMediaProductId:(id)a3;
- (void)setMediaRepetitions:(id)a3;
- (void)setMediaSumTimePlayed:(id)a3;
- (void)setMediaTitle:(id)a3;
- (void)setMediaType:(id)a3;
@end

@implementation MOEventMedia

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  mediaTitle = self->_mediaTitle;
  id v5 = a3;
  [v5 encodeObject:mediaTitle forKey:@"mediaTitle"];
  [v5 encodeObject:self->_mediaAlbum forKey:@"mediaAlbum"];
  [v5 encodeObject:self->_mediaPlayerBundleId forKey:@"mediaPlayerBundleId"];
  [v5 encodeObject:self->_mediaProductId forKey:@"mediaProductId"];
  [v5 encodeObject:self->_mediaGenre forKey:@"mediaGenre"];
  [v5 encodeObject:self->_mediaType forKey:@"mediaType"];
  [v5 encodeObject:self->_mediaArtist forKey:@"mediaArtist"];
  [v5 encodeObject:self->_mediaRepetitions forKey:@"mediaRepetitions"];
  [v5 encodeObject:self->_mediaSumTimePlayed forKey:@"mediaSumTimePlayed"];
  [v5 encodeObject:self->_mediaPlaySessions forKey:@"mediaPlaySessions"];
  [v5 encodeObject:self->_mediaFirstPartyTimePlayedRatio forKey:@"firstPartyTimePlayedRatio"];
}

- (MOEventMedia)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MOEventMedia;
  id v5 = [(MOEventMedia *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaTitle"];
    mediaTitle = v5->_mediaTitle;
    v5->_mediaTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaAlbum"];
    mediaAlbum = v5->_mediaAlbum;
    v5->_mediaAlbum = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaPlayerBundleId"];
    mediaPlayerBundleId = v5->_mediaPlayerBundleId;
    v5->_mediaPlayerBundleId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaProductId"];
    mediaProductId = v5->_mediaProductId;
    v5->_mediaProductId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaGenre"];
    mediaGenre = v5->_mediaGenre;
    v5->_mediaGenre = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaArtist"];
    mediaArtist = v5->_mediaArtist;
    v5->_mediaArtist = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaRepetitions"];
    mediaRepetitions = v5->_mediaRepetitions;
    v5->_mediaRepetitions = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaSumTimePlayed"];
    mediaSumTimePlayed = v5->_mediaSumTimePlayed;
    v5->_mediaSumTimePlayed = (NSNumber *)v22;

    v24 = (void *)MEMORY[0x1D26065F0]();
    id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v25, "initWithObjects:", v26, v27, v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"mediaPlaySessions"];
    mediaPlaySessions = v5->_mediaPlaySessions;
    v5->_mediaPlaySessions = (NSArray *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstPartyTimePlayedRatio"];
    mediaFirstPartyTimePlayedRatio = v5->_mediaFirstPartyTimePlayedRatio;
    v5->_mediaFirstPartyTimePlayedRatio = (NSNumber *)v32;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventMedia);
  objc_storeStrong((id *)&v4->_mediaType, self->_mediaType);
  objc_storeStrong((id *)&v4->_mediaAlbum, self->_mediaAlbum);
  objc_storeStrong((id *)&v4->_mediaArtist, self->_mediaArtist);
  objc_storeStrong((id *)&v4->_mediaPlayerBundleId, self->_mediaPlayerBundleId);
  objc_storeStrong((id *)&v4->_mediaProductId, self->_mediaProductId);
  objc_storeStrong((id *)&v4->_mediaGenre, self->_mediaGenre);
  objc_storeStrong((id *)&v4->_mediaRepetitions, self->_mediaRepetitions);
  objc_storeStrong((id *)&v4->_mediaSumTimePlayed, self->_mediaSumTimePlayed);
  objc_storeStrong((id *)&v4->_mediaPlaySessions, self->_mediaPlaySessions);
  objc_storeStrong((id *)&v4->_mediaTitle, self->_mediaTitle);
  objc_storeStrong((id *)&v4->_mediaFirstPartyTimePlayedRatio, self->_mediaFirstPartyTimePlayedRatio);
  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(NSString *)self->_mediaTitle mask];
  id v5 = [(NSString *)self->_mediaAlbum mask];
  uint64_t v6 = (void *)[v3 initWithFormat:@"mediaTitle, %@, mediaAlbum, %@, mediaPlayerBundleId, %@, mediaProductId, %@, mediaType, %@, mediaRepetitions, %@, mediaSumTimePlayed, %@, number of media play events, %lu", v4, v5, self->_mediaPlayerBundleId, self->_mediaProductId, self->_mediaType, self->_mediaRepetitions, self->_mediaSumTimePlayed, -[NSArray count](self->_mediaPlaySessions, "count")];

  return v6;
}

- (NSString)mediaTitle
{
  return self->_mediaTitle;
}

- (void)setMediaTitle:(id)a3
{
}

- (NSString)mediaAlbum
{
  return self->_mediaAlbum;
}

- (void)setMediaAlbum:(id)a3
{
}

- (NSString)mediaPlayerBundleId
{
  return self->_mediaPlayerBundleId;
}

- (void)setMediaPlayerBundleId:(id)a3
{
}

- (NSString)mediaProductId
{
  return self->_mediaProductId;
}

- (void)setMediaProductId:(id)a3
{
}

- (NSString)mediaGenre
{
  return self->_mediaGenre;
}

- (void)setMediaGenre:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSString)mediaArtist
{
  return self->_mediaArtist;
}

- (void)setMediaArtist:(id)a3
{
}

- (NSNumber)mediaRepetitions
{
  return self->_mediaRepetitions;
}

- (void)setMediaRepetitions:(id)a3
{
}

- (NSNumber)mediaSumTimePlayed
{
  return self->_mediaSumTimePlayed;
}

- (void)setMediaSumTimePlayed:(id)a3
{
}

- (NSArray)mediaPlaySessions
{
  return self->_mediaPlaySessions;
}

- (void)setMediaPlaySessions:(id)a3
{
}

- (NSNumber)mediaFirstPartyTimePlayedRatio
{
  return self->_mediaFirstPartyTimePlayedRatio;
}

- (void)setMediaFirstPartyTimePlayedRatio:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaFirstPartyTimePlayedRatio, 0);
  objc_storeStrong((id *)&self->_mediaPlaySessions, 0);
  objc_storeStrong((id *)&self->_mediaSumTimePlayed, 0);
  objc_storeStrong((id *)&self->_mediaRepetitions, 0);
  objc_storeStrong((id *)&self->_mediaArtist, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_mediaGenre, 0);
  objc_storeStrong((id *)&self->_mediaProductId, 0);
  objc_storeStrong((id *)&self->_mediaPlayerBundleId, 0);
  objc_storeStrong((id *)&self->_mediaAlbum, 0);
  objc_storeStrong((id *)&self->_mediaTitle, 0);
}

@end