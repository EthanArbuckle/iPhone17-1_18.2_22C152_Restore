@interface MRPlaybackQueueRequest
+ (BOOL)supportsSecureCoding;
+ (MRPlaybackQueueRequest)requestWithCurrentState:(id)a3 range:(_NSRange)a4;
+ (double)defaultArtworkHeight;
+ (double)defaultArtworkWidth;
+ (id)defaultPlaybackQueueRequest;
+ (id)defaultPlaybackQueueRequestWithRange:(_NSRange)a3;
- (BOOL)containsNonDefaultAssets;
- (BOOL)exactMatch:(id)a3;
- (BOOL)hasArtworkHeight;
- (BOOL)hasArtworkWidth;
- (BOOL)hasCachingPolicy;
- (BOOL)hasIncludeAlignments;
- (BOOL)hasIncludeAvailableArtworkFormats;
- (BOOL)hasIncludeInfo;
- (BOOL)hasIncludeLanguageOptions;
- (BOOL)hasIncludeLyrics;
- (BOOL)hasIncludeMetadata;
- (BOOL)hasIncludeSections;
- (BOOL)hasLegacyNowPlayingInfoRequest;
- (BOOL)hasLength;
- (BOOL)hasLocation;
- (BOOL)hasRange;
- (BOOL)includeAlignments;
- (BOOL)includeArtwork;
- (BOOL)includeAvailableArtworkFormats;
- (BOOL)includeInfo;
- (BOOL)includeLanguageOptions;
- (BOOL)includeLyrics;
- (BOOL)includeMetadata;
- (BOOL)includeRemoteArtwork;
- (BOOL)includeSections;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacyNowPlayingInfoRequest;
- (BOOL)match:(id)a3;
- (BOOL)rangeContainsNowPlayingItem;
- (BOOL)shouldRequestItem;
- (BOOL)shouldRequestItemNotConsideringMetadata;
- (MRPlaybackQueueRequest)initWithCoder:(id)a3;
- (MRPlaybackQueueRequest)initWithData:(id)a3;
- (MRPlaybackQueueRequest)initWithIdentifiers:(id)a3;
- (MRPlaybackQueueRequest)initWithIdentifiers:(id)a3 range:(_NSRange)a4;
- (MRPlaybackQueueRequest)initWithProtobuf:(id)a3;
- (MRPlaybackQueueRequest)initWithRange:(_NSRange)a3;
- (MRPlaybackQueueRequest)skeleton;
- (MRPlayerPath)playerPath;
- (NSArray)contentItemIdentifiers;
- (NSArray)requestedArtworkFormats;
- (NSArray)requestedRemoteArtworkFormats;
- (NSData)data;
- (NSDictionary)dictionaryRepresentation;
- (NSString)label;
- (NSString)requestIdentifier;
- (_MRPlaybackQueueRequestProtobuf)protobuf;
- (_NSRange)range;
- (double)artworkHeight;
- (double)artworkWidth;
- (id)_buildRequestedPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromTransactionName:(unint64_t)a3;
- (id)requestByRemovingArtwork;
- (int64_t)length;
- (int64_t)location;
- (unsigned)cachingPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)performRequestForDestination:(id)a3 completion:(id)a4;
- (void)setArtworkHeight:(double)a3;
- (void)setArtworkWidth:(double)a3;
- (void)setCachingPolicy:(unsigned int)a3;
- (void)setContentItemIdentifiers:(id)a3;
- (void)setHasArtworkHeight:(BOOL)a3;
- (void)setHasArtworkWidth:(BOOL)a3;
- (void)setHasCachingPolicy:(BOOL)a3;
- (void)setHasIncludeAlignments:(BOOL)a3;
- (void)setHasIncludeAvailableArtworkFormats:(BOOL)a3;
- (void)setHasIncludeInfo:(BOOL)a3;
- (void)setHasIncludeLanguageOptions:(BOOL)a3;
- (void)setHasIncludeLyrics:(BOOL)a3;
- (void)setHasIncludeMetadata:(BOOL)a3;
- (void)setHasIncludeSections:(BOOL)a3;
- (void)setHasLegacyNowPlayingInfoRequest:(BOOL)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setIncludeAlignments:(BOOL)a3;
- (void)setIncludeAvailableArtworkFormats:(BOOL)a3;
- (void)setIncludeInfo:(BOOL)a3;
- (void)setIncludeLanguageOptions:(BOOL)a3;
- (void)setIncludeLyrics:(BOOL)a3;
- (void)setIncludeMetadata:(BOOL)a3;
- (void)setIncludeSections:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLegacyNowPlayingInfoRequest:(BOOL)a3;
- (void)setLength:(int64_t)a3;
- (void)setLocation:(int64_t)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestedArtworkFormats:(id)a3;
- (void)setRequestedRemoteArtworkFormats:(id)a3;
@end

@implementation MRPlaybackQueueRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_requestedArtworkFormats, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (MRPlaybackQueueRequest)skeleton
{
  v3 = objc_alloc_init(MRPlaybackQueueRequest);
  if ([(MRPlaybackQueueRequest *)self hasLocation]) {
    [(MRPlaybackQueueRequest *)v3 setLocation:[(MRPlaybackQueueRequest *)self location]];
  }
  if ([(MRPlaybackQueueRequest *)self hasLength]) {
    [(MRPlaybackQueueRequest *)v3 setLength:[(MRPlaybackQueueRequest *)self length]];
  }
  if ([(MRPlaybackQueueRequest *)self hasCachingPolicy]) {
    [(MRPlaybackQueueRequest *)v3 setCachingPolicy:[(MRPlaybackQueueRequest *)self cachingPolicy]];
  }
  if ([(MRPlaybackQueueRequest *)self hasLegacyNowPlayingInfoRequest]) {
    [(MRPlaybackQueueRequest *)v3 setLegacyNowPlayingInfoRequest:[(MRPlaybackQueueRequest *)self isLegacyNowPlayingInfoRequest]];
  }
  v4 = [(MRPlaybackQueueRequest *)self requestIdentifier];
  [(MRPlaybackQueueRequest *)v3 setRequestIdentifier:v4];

  v5 = [(MRPlaybackQueueRequest *)self label];
  [(MRPlaybackQueueRequest *)v3 setLabel:v5];

  v6 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
  [(MRPlaybackQueueRequest *)v3 setContentItemIdentifiers:v6];

  return v3;
}

- (BOOL)includeRemoteArtwork
{
  v2 = [(MRPlaybackQueueRequest *)self requestedRemoteArtworkFormats];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)exactMatch:(id)a3
{
  v4 = (MRPlaybackQueueRequest *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else if (v4 {
         && (BOOL v6 = [(MRPlaybackQueueRequest *)self includeMetadata],
  }
             v6 == [(MRPlaybackQueueRequest *)v5 includeMetadata])
         && (BOOL v7 = [(MRPlaybackQueueRequest *)self includeInfo],
             v7 == [(MRPlaybackQueueRequest *)v5 includeInfo])
         && (BOOL v8 = [(MRPlaybackQueueRequest *)self includeAlignments],
             v8 == [(MRPlaybackQueueRequest *)v5 includeAlignments])
         && (BOOL v9 = [(MRPlaybackQueueRequest *)self includeLyrics],
             v9 == [(MRPlaybackQueueRequest *)v5 includeLyrics])
         && (BOOL v10 = [(MRPlaybackQueueRequest *)self includeLanguageOptions],
             v10 == [(MRPlaybackQueueRequest *)v5 includeLanguageOptions])
         && (BOOL v11 = [(MRPlaybackQueueRequest *)self includeSections],
             v11 == [(MRPlaybackQueueRequest *)v5 includeSections]))
  {
    BOOL v14 = [(MRPlaybackQueueRequest *)self includeArtwork];
    BOOL v12 = v14 ^ [(MRPlaybackQueueRequest *)v5 includeArtwork] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setLocation:", -[MRPlaybackQueueRequest location](self, "location"));
  objc_msgSend(v5, "setHasLocation:", -[MRPlaybackQueueRequest hasLocation](self, "hasLocation"));
  objc_msgSend(v5, "setLength:", -[MRPlaybackQueueRequest length](self, "length"));
  objc_msgSend(v5, "setHasLength:", -[MRPlaybackQueueRequest hasLength](self, "hasLength"));
  objc_msgSend(v5, "setIncludeMetadata:", -[MRPlaybackQueueRequest includeMetadata](self, "includeMetadata"));
  objc_msgSend(v5, "setHasIncludeMetadata:", -[MRPlaybackQueueRequest hasIncludeMetadata](self, "hasIncludeMetadata"));
  [(MRPlaybackQueueRequest *)self artworkWidth];
  objc_msgSend(v5, "setArtworkWidth:");
  objc_msgSend(v5, "setHasArtworkWidth:", -[MRPlaybackQueueRequest hasArtworkWidth](self, "hasArtworkWidth"));
  [(MRPlaybackQueueRequest *)self artworkHeight];
  objc_msgSend(v5, "setArtworkHeight:");
  objc_msgSend(v5, "setHasArtworkHeight:", -[MRPlaybackQueueRequest hasArtworkHeight](self, "hasArtworkHeight"));
  objc_msgSend(v5, "setIncludeLyrics:", -[MRPlaybackQueueRequest includeLyrics](self, "includeLyrics"));
  objc_msgSend(v5, "setHasIncludeLyrics:", -[MRPlaybackQueueRequest hasIncludeLyrics](self, "hasIncludeLyrics"));
  objc_msgSend(v5, "setIncludeSections:", -[MRPlaybackQueueRequest includeSections](self, "includeSections"));
  objc_msgSend(v5, "setHasIncludeSections:", -[MRPlaybackQueueRequest hasIncludeSections](self, "hasIncludeSections"));
  objc_msgSend(v5, "setIncludeInfo:", -[MRPlaybackQueueRequest includeInfo](self, "includeInfo"));
  objc_msgSend(v5, "setHasIncludeInfo:", -[MRPlaybackQueueRequest hasIncludeInfo](self, "hasIncludeInfo"));
  objc_msgSend(v5, "setIncludeAlignments:", -[MRPlaybackQueueRequest includeAlignments](self, "includeAlignments"));
  objc_msgSend(v5, "setHasIncludeAlignments:", -[MRPlaybackQueueRequest hasIncludeAlignments](self, "hasIncludeAlignments"));
  objc_msgSend(v5, "setIncludeLanguageOptions:", -[MRPlaybackQueueRequest includeLanguageOptions](self, "includeLanguageOptions"));
  objc_msgSend(v5, "setHasIncludeLanguageOptions:", -[MRPlaybackQueueRequest hasIncludeLanguageOptions](self, "hasIncludeLanguageOptions"));
  objc_msgSend(v5, "setIncludeAvailableArtworkFormats:", -[MRPlaybackQueueRequest includeAvailableArtworkFormats](self, "includeAvailableArtworkFormats"));
  objc_msgSend(v5, "setHasIncludeAvailableArtworkFormats:", -[MRPlaybackQueueRequest hasIncludeAvailableArtworkFormats](self, "hasIncludeAvailableArtworkFormats"));
  BOOL v6 = [(MRPlaybackQueueRequest *)self requestedArtworkFormats];
  [v5 setRequestedArtworkFormats:v6];

  BOOL v7 = [(MRPlaybackQueueRequest *)self requestedRemoteArtworkFormats];
  [v5 setRequestedRemoteArtworkFormats:v7];

  objc_msgSend(v5, "setLegacyNowPlayingInfoRequest:", -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](self, "isLegacyNowPlayingInfoRequest"));
  objc_msgSend(v5, "setHasLegacyNowPlayingInfoRequest:", -[MRPlaybackQueueRequest isLegacyNowPlayingInfoRequest](self, "isLegacyNowPlayingInfoRequest"));
  objc_msgSend(v5, "setCachingPolicy:", -[MRPlaybackQueueRequest cachingPolicy](self, "cachingPolicy"));
  objc_msgSend(v5, "setHasCachingPolicy:", -[MRPlaybackQueueRequest cachingPolicy](self, "cachingPolicy") != 0);
  BOOL v8 = [(MRPlaybackQueueRequest *)self playerPath];
  BOOL v9 = (void *)[v8 copyWithZone:a3];
  [v5 setPlayerPath:v9];

  BOOL v10 = [(MRPlaybackQueueRequest *)self requestIdentifier];
  BOOL v11 = (void *)[v10 copyWithZone:a3];
  [v5 setRequestIdentifier:v11];

  BOOL v12 = [(MRPlaybackQueueRequest *)self label];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setLabel:v13];

  BOOL v14 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setContentItemIdentifiers:v15];

  return v5;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isLegacyNowPlayingInfoRequest
{
  return self->_legacyNowPlayingInfoRequest;
}

- (unsigned)cachingPolicy
{
  return self->_cachingPolicy;
}

- (void)setIncludeMetadata:(BOOL)a3
{
  self->_includeMetadata = a3;
  if (a3) {
    [(MRPlaybackQueueRequest *)self setIncludeAvailableArtworkFormats:1];
  }
  self->_hasIncludeMetadata = 1;
}

- (void)setIncludeAvailableArtworkFormats:(BOOL)a3
{
  self->_includeAvailableArtworkFormats = a3;
  self->_hasIncludeAvailableArtworkFormats = 1;
}

- (void)setIncludeLanguageOptions:(BOOL)a3
{
  self->_includeLanguageOptions = a3;
  self->_hasIncludeLanguageOptions = 1;
}

- (id)_buildRequestedPropertiesDescription
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if ([v1 includeMetadata]) {
      [v2 appendString:@"/M"];
    }
    if ([v1 includeInfo]) {
      [v2 appendString:@"/I"];
    }
    if ([v1 includeLanguageOptions]) {
      [v2 appendString:@"/L"];
    }
    if ([v1 includeLyrics]) {
      [v2 appendString:@"/Ly"];
    }
    if ([v1 includeAlignments]) {
      [v2 appendString:@"/Al"];
    }
    if ([v1 includeSections]) {
      [v2 appendString:@"/S"];
    }
    if ([v1 includeAvailableArtworkFormats]) {
      [v2 appendString:@"/AF"];
    }
    [v1 artworkWidth];
    if (v3 != 0.0)
    {
      [v1 artworkHeight];
      if (v4 != 0.0)
      {
        [v1 artworkWidth];
        uint64_t v6 = v5;
        [v1 artworkHeight];
        objc_msgSend(v2, "appendFormat:", @"/A%lfx%lf", v6, v7);
      }
    }
    BOOL v8 = [v1 requestedArtworkFormats];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      BOOL v10 = [v1 requestedArtworkFormats];
      objc_msgSend(v2, "appendFormat:", @"/FA[%ld]", objc_msgSend(v10, "count"));
    }
    BOOL v11 = [v1 requestedRemoteArtworkFormats];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v13 = [v1 requestedRemoteArtworkFormats];
      objc_msgSend(v2, "appendFormat:", @"/RFA[%ld]", objc_msgSend(v13, "count"));
    }
    if ([v1 hasLocation] && objc_msgSend(v1, "hasLength")) {
      objc_msgSend(v2, "appendFormat:", @"/R[%ld:%ld]", objc_msgSend(v1, "location"), objc_msgSend(v1, "length"));
    }
    id v1 = (id)[v2 copy];
  }

  return v1;
}

- (int64_t)location
{
  return self->_location;
}

- (int64_t)length
{
  return self->_length;
}

- (BOOL)includeMetadata
{
  return self->_includeMetadata;
}

- (BOOL)includeSections
{
  return self->_includeSections;
}

- (BOOL)includeLanguageOptions
{
  return self->_includeLanguageOptions;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)includeLyrics
{
  return self->_includeLyrics;
}

- (BOOL)includeAlignments
{
  return self->_includeAlignments;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (NSArray)requestedRemoteArtworkFormats
{
  return self->_requestedRemoteArtworkFormats;
}

- (BOOL)hasLength
{
  return self->_hasLength;
}

- (BOOL)includeAvailableArtworkFormats
{
  return self->_includeAvailableArtworkFormats;
}

- (NSArray)requestedArtworkFormats
{
  return self->_requestedArtworkFormats;
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (BOOL)includeArtwork
{
  [(MRPlaybackQueueRequest *)self artworkHeight];
  if (fabs(v3) <= 2.22044605e-16) {
    return 0;
  }
  [(MRPlaybackQueueRequest *)self artworkWidth];
  return fabs(v4) > 2.22044605e-16;
}

- (double)artworkHeight
{
  return self->_artworkHeight;
}

- (void)setContentItemIdentifiers:(id)a3
{
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
  self->_hasLocation = 1;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
  self->_hasLength = 1;
}

- (void)setIncludeSections:(BOOL)a3
{
  self->_includeSections = a3;
  self->_hasIncludeSections = 1;
}

- (void)setIncludeInfo:(BOOL)a3
{
  self->_includeInfo = a3;
  self->_hasIncludeInfo = 1;
}

- (void)setLegacyNowPlayingInfoRequest:(BOOL)a3
{
  self->_legacyNowPlayingInfoRequest = a3;
  self->_hasLegacyNowPlayingInfoRequest = 1;
}

- (void)setCachingPolicy:(unsigned int)a3
{
  self->_cachingPolicy = a3;
  self->_hasCachingPolicy = 1;
}

- (void)setArtworkWidth:(double)a3
{
  self->_artworkWidth = a3;
  self->_hasArtworkWidth = 1;
}

- (void)setArtworkHeight:(double)a3
{
  self->_artworkHeight = a3;
  self->_hasArtworkHeight = 1;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (BOOL)hasIncludeSections
{
  return self->_hasIncludeSections;
}

- (BOOL)hasIncludeMetadata
{
  return self->_hasIncludeMetadata;
}

- (BOOL)hasIncludeLyrics
{
  return self->_hasIncludeLyrics;
}

- (BOOL)hasIncludeLanguageOptions
{
  return self->_hasIncludeLanguageOptions;
}

- (BOOL)hasIncludeInfo
{
  return self->_hasIncludeInfo;
}

- (BOOL)hasIncludeAvailableArtworkFormats
{
  return self->_hasIncludeAvailableArtworkFormats;
}

- (BOOL)hasArtworkWidth
{
  return self->_hasArtworkWidth;
}

- (BOOL)hasArtworkHeight
{
  return self->_hasArtworkHeight;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  double v4 = [(MRPlaybackQueueRequest *)self requestIdentifier];
  [v3 appendFormat:@"%@ ", v4];

  uint64_t v5 = [(MRPlaybackQueueRequest *)self label];
  [v3 appendFormat:@"%@ ", v5];

  uint64_t v6 = -[MRPlaybackQueueRequest _buildRequestedPropertiesDescription](self);
  [v3 appendString:v6];

  uint64_t v7 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];

  if (v7)
  {
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    for (unint64_t i = 0; ; ++i)
    {
      BOOL v10 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
      if ((unint64_t)[v10 count] > 3)
      {

        if (i >= 3)
        {
LABEL_8:
          v15 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
          [v3 appendFormat:@"/IDs (%ld): %@", objc_msgSend(v15, "count"), v8];

          break;
        }
      }
      else
      {
        BOOL v11 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
        unint64_t v12 = [v11 count];

        if (i >= v12) {
          goto LABEL_8;
        }
      }
      v13 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
      BOOL v14 = [v13 objectAtIndex:i];

      [v8 addObject:v14];
    }
  }
  v16 = (void *)[v3 copy];

  return v16;
}

- (NSArray)contentItemIdentifiers
{
  return self->_contentItemIdentifiers;
}

- (NSString)label
{
  return self->_label;
}

- (void)setRequestedRemoteArtworkFormats:(id)a3
{
}

- (void)setRequestedArtworkFormats:(id)a3
{
}

- (void)setPlayerPath:(id)a3
{
}

- (void)setIncludeLyrics:(BOOL)a3
{
  self->_includeLyrics = a3;
  self->_hasIncludeLyrics = 1;
}

- (void)setIncludeAlignments:(BOOL)a3
{
  self->_includeAlignments = a3;
  self->_hasIncludeAlignments = 1;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (void)setHasLength:(BOOL)a3
{
  self->_hasLength = a3;
}

- (void)setHasLegacyNowPlayingInfoRequest:(BOOL)a3
{
  self->_hasLegacyNowPlayingInfoRequest = a3;
}

- (void)setHasIncludeSections:(BOOL)a3
{
  self->_hasIncludeSections = a3;
}

- (void)setHasIncludeMetadata:(BOOL)a3
{
  self->_hasIncludeMetadata = a3;
}

- (void)setHasIncludeLyrics:(BOOL)a3
{
  self->_hasIncludeLyrics = a3;
}

- (void)setHasIncludeLanguageOptions:(BOOL)a3
{
  self->_hasIncludeLanguageOptions = a3;
}

- (void)setHasIncludeInfo:(BOOL)a3
{
  self->_hasIncludeInfo = a3;
}

- (void)setHasIncludeAvailableArtworkFormats:(BOOL)a3
{
  self->_hasIncludeAvailableArtworkFormats = a3;
}

- (void)setHasIncludeAlignments:(BOOL)a3
{
  self->_hasIncludeAlignments = a3;
}

- (void)setHasCachingPolicy:(BOOL)a3
{
  self->_hasCachingPolicy = a3;
}

- (void)setHasArtworkWidth:(BOOL)a3
{
  self->_hasArtworkWidth = a3;
}

- (void)setHasArtworkHeight:(BOOL)a3
{
  self->_hasArtworkHeight = a3;
}

- (BOOL)hasIncludeAlignments
{
  return self->_hasIncludeAlignments;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (_NSRange)range
{
  int64_t v3 = [(MRPlaybackQueueRequest *)self location];
  NSUInteger v4 = [(MRPlaybackQueueRequest *)self length];
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (BOOL)hasLegacyNowPlayingInfoRequest
{
  return self->_hasLegacyNowPlayingInfoRequest;
}

- (BOOL)hasCachingPolicy
{
  return self->_hasCachingPolicy;
}

- (BOOL)hasRange
{
  BOOL v3 = [(MRPlaybackQueueRequest *)self hasLocation];
  if (v3)
  {
    LOBYTE(v3) = [(MRPlaybackQueueRequest *)self hasLength];
  }
  return v3;
}

- (BOOL)shouldRequestItem
{
  if ([(MRPlaybackQueueRequest *)self includeMetadata]) {
    return 1;
  }

  return [(MRPlaybackQueueRequest *)self shouldRequestItemNotConsideringMetadata];
}

- (MRPlaybackQueueRequest)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    NSUInteger v5 = [[_MRPlaybackQueueRequestProtobuf alloc] initWithData:v4];

    self = [(MRPlaybackQueueRequest *)self initWithProtobuf:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (MRPlaybackQueueRequest)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v29.receiver = self;
    v29.super_class = (Class)MRPlaybackQueueRequest;
    NSUInteger v5 = [(MRPlaybackQueueRequest *)&v29 init];
    if (v5)
    {
      v5->_location = (int)[v4 location];
      v5->_hasLocation = [v4 hasLocation];
      v5->_length = (int)[v4 length];
      v5->_hasLength = [v4 hasLength];
      v5->_includeMetadata = [v4 includeMetadata];
      v5->_hasIncludeMetadata = [v4 hasIncludeMetadata];
      [v4 artworkWidth];
      v5->_artworkWidth = v6;
      v5->_hasArtworkWidth = [v4 hasArtworkWidth];
      [v4 artworkHeight];
      v5->_artworkHeight = v7;
      v5->_hasArtworkHeight = [v4 hasArtworkHeight];
      v5->_includeLyrics = [v4 includeLyrics];
      v5->_hasIncludeLyrics = [v4 hasIncludeLyrics];
      v5->_includeSections = [v4 includeSections];
      v5->_hasIncludeSections = [v4 hasIncludeSections];
      v5->_includeInfo = [v4 includeInfo];
      v5->_hasIncludeInfo = [v4 hasIncludeInfo];
      v5->_includeAlignments = [v4 includeAlignments];
      v5->_hasIncludeAlignments = [v4 hasIncludeAlignments];
      v5->_includeLanguageOptions = [v4 includeLanguageOptions];
      v5->_hasIncludeLanguageOptions = [v4 hasIncludeLanguageOptions];
      v5->_includeAvailableArtworkFormats = [v4 includeAvailableArtworkFormats];
      v5->_hasIncludeAvailableArtworkFormats = [v4 hasIncludeAvailableArtworkFormats];
      v5->_legacyNowPlayingInfoRequest = [v4 isLegacyNowPlayingInfoRequest];
      v5->_hasLegacyNowPlayingInfoRequest = [v4 hasIsLegacyNowPlayingInfoRequest];
      v5->_cachingPolicy = [v4 cachingPolicy];
      v5->_hasCachingPolicy = [v4 hasCachingPolicy];
      if ([v4 hasPlayerPath])
      {
        BOOL v8 = [MRPlayerPath alloc];
        uint64_t v9 = [v4 playerPath];
        uint64_t v10 = [(MRPlayerPath *)v8 initWithProtobuf:v9];
        playerPath = v5->_playerPath;
        v5->_playerPath = (MRPlayerPath *)v10;
      }
      unint64_t v12 = [v4 requestID];
      uint64_t v13 = [v12 copy];
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSString *)v13;

      v15 = [v4 label];
      uint64_t v16 = [v15 copy];
      label = v5->_label;
      v5->_label = (NSString *)v16;

      v18 = [v4 contentItemIdentifiers];
      uint64_t v19 = [v18 copy];
      contentItemIdentifiers = v5->_contentItemIdentifiers;
      v5->_contentItemIdentifiers = (NSArray *)v19;

      v21 = [v4 requestedArtworkFormats];
      uint64_t v22 = [v21 copy];
      requestedArtworkFormats = v5->_requestedArtworkFormats;
      v5->_requestedArtworkFormats = (NSArray *)v22;

      v24 = [v4 requestedRemoteArtworkFormats];
      uint64_t v25 = [v24 copy];
      requestedRemoteArtworkFormats = v5->_requestedRemoteArtworkFormats;
      v5->_requestedRemoteArtworkFormats = (NSArray *)v25;
    }
    self = v5;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSData)data
{
  id v2 = [(MRPlaybackQueueRequest *)self protobuf];
  BOOL v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRPlaybackQueueRequestProtobuf)protobuf
{
  BOOL v3 = objc_alloc_init(_MRPlaybackQueueRequestProtobuf);
  [(_MRPlaybackQueueRequestProtobuf *)v3 setLocation:[(MRPlaybackQueueRequest *)self location]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasLocation:[(MRPlaybackQueueRequest *)self hasLocation]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setLength:[(MRPlaybackQueueRequest *)self length]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasLength:[(MRPlaybackQueueRequest *)self hasLength]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setIncludeMetadata:[(MRPlaybackQueueRequest *)self includeMetadata]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasIncludeMetadata:[(MRPlaybackQueueRequest *)self hasIncludeMetadata]];
  [(MRPlaybackQueueRequest *)self artworkWidth];
  -[_MRPlaybackQueueRequestProtobuf setArtworkWidth:](v3, "setArtworkWidth:");
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasArtworkWidth:[(MRPlaybackQueueRequest *)self hasArtworkWidth]];
  [(MRPlaybackQueueRequest *)self artworkHeight];
  -[_MRPlaybackQueueRequestProtobuf setArtworkHeight:](v3, "setArtworkHeight:");
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasArtworkHeight:[(MRPlaybackQueueRequest *)self hasArtworkHeight]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setIncludeLyrics:[(MRPlaybackQueueRequest *)self includeLyrics]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasIncludeLyrics:[(MRPlaybackQueueRequest *)self hasIncludeLyrics]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setIncludeSections:[(MRPlaybackQueueRequest *)self includeSections]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasIncludeSections:[(MRPlaybackQueueRequest *)self hasIncludeSections]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setIncludeInfo:[(MRPlaybackQueueRequest *)self includeInfo]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasIncludeInfo:[(MRPlaybackQueueRequest *)self hasIncludeInfo]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setIncludeLanguageOptions:[(MRPlaybackQueueRequest *)self includeLanguageOptions]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasIncludeLanguageOptions:[(MRPlaybackQueueRequest *)self hasIncludeLanguageOptions]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setIncludeAvailableArtworkFormats:[(MRPlaybackQueueRequest *)self includeAvailableArtworkFormats]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasIncludeAvailableArtworkFormats:[(MRPlaybackQueueRequest *)self hasIncludeAvailableArtworkFormats]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setReturnContentItemAssetsInUserCompletion:1];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasReturnContentItemAssetsInUserCompletion:1];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setIsLegacyNowPlayingInfoRequest:[(MRPlaybackQueueRequest *)self isLegacyNowPlayingInfoRequest]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasIsLegacyNowPlayingInfoRequest:[(MRPlaybackQueueRequest *)self isLegacyNowPlayingInfoRequest]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setCachingPolicy:[(MRPlaybackQueueRequest *)self cachingPolicy]];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setHasCachingPolicy:[(MRPlaybackQueueRequest *)self cachingPolicy] != 0];
  id v4 = [(MRPlaybackQueueRequest *)self playerPath];
  NSUInteger v5 = [v4 protobuf];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setPlayerPath:v5];

  double v6 = [(MRPlaybackQueueRequest *)self requestIdentifier];
  double v7 = (void *)[v6 copy];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setRequestID:v7];

  BOOL v8 = [(MRPlaybackQueueRequest *)self label];
  uint64_t v9 = (void *)[v8 copy];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setLabel:v9];

  uint64_t v10 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
  BOOL v11 = (void *)[v10 mutableCopy];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setContentItemIdentifiers:v11];

  unint64_t v12 = [(MRPlaybackQueueRequest *)self requestedArtworkFormats];
  uint64_t v13 = (void *)[v12 mutableCopy];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setRequestedArtworkFormats:v13];

  BOOL v14 = [(MRPlaybackQueueRequest *)self requestedRemoteArtworkFormats];
  v15 = (void *)[v14 mutableCopy];
  [(_MRPlaybackQueueRequestProtobuf *)v3 setRequestedRemoteArtworkFormats:v15];

  return v3;
}

- (id)requestByRemovingArtwork
{
  id v2 = (void *)[(MRPlaybackQueueRequest *)self copy];
  [v2 setArtworkWidth:0.0];
  [v2 setArtworkHeight:0.0];

  return v2;
}

- (BOOL)containsNonDefaultAssets
{
  BOOL v3 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  LOBYTE(self) = [v3 match:self];

  return (char)self;
}

+ (id)defaultPlaybackQueueRequestWithRange:(_NSRange)a3
{
  BOOL v3 = -[MRPlaybackQueueRequest initWithRange:]([MRPlaybackQueueRequest alloc], "initWithRange:", a3.location, a3.length);
  [(MRPlaybackQueueRequest *)v3 setIncludeMetadata:1];
  [(MRPlaybackQueueRequest *)v3 setIncludeLanguageOptions:1];

  return v3;
}

- (MRPlaybackQueueRequest)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  _NSRange result = [(MRPlaybackQueueRequest *)self init];
  if (result)
  {
    *(_WORD *)&result->_hasLocation = 257;
    result->_NSUInteger location = location;
    result->_NSUInteger length = length;
  }
  return result;
}

+ (id)defaultPlaybackQueueRequest
{
  return (id)objc_msgSend(a1, "defaultPlaybackQueueRequestWithRange:", 0, 1);
}

- (BOOL)match:(id)a3
{
  id v4 = a3;
  int v5 = [(MRPlaybackQueueRequest *)self includeMetadata];
  if (v5 == [v4 includeMetadata]
    || (int v6 = [(MRPlaybackQueueRequest *)self includeInfo],
        v6 == [v4 includeInfo])
    || (int v7 = [(MRPlaybackQueueRequest *)self includeAlignments],
        v7 == [v4 includeAlignments])
    || (int v8 = [(MRPlaybackQueueRequest *)self includeLyrics],
        v8 == [v4 includeLyrics])
    || (int v9 = [(MRPlaybackQueueRequest *)self includeLanguageOptions],
        v9 == [v4 includeLanguageOptions])
    || (int v10 = [(MRPlaybackQueueRequest *)self includeSections],
        v10 == [v4 includeSections]))
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    BOOL v11 = [(MRPlaybackQueueRequest *)self includeArtwork];
    int v12 = v11 ^ [v4 includeArtwork] ^ 1;
  }

  return v12;
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  if ([v10 includeMetadata]) {
    -[MRPlaybackQueueRequest setIncludeMetadata:](self, "setIncludeMetadata:", [v10 includeMetadata]);
  }
  if ([v10 includeInfo]) {
    -[MRPlaybackQueueRequest setIncludeInfo:](self, "setIncludeInfo:", [v10 includeInfo]);
  }
  if ([v10 includeAlignments]) {
    -[MRPlaybackQueueRequest setIncludeAlignments:](self, "setIncludeAlignments:", [v10 includeAlignments]);
  }
  if ([v10 includeLyrics]) {
    -[MRPlaybackQueueRequest setIncludeLyrics:](self, "setIncludeLyrics:", [v10 includeLyrics]);
  }
  if ([v10 includeSections]) {
    -[MRPlaybackQueueRequest setIncludeSections:](self, "setIncludeSections:", [v10 includeSections]);
  }
  if ([v10 includeLanguageOptions]) {
    -[MRPlaybackQueueRequest setIncludeLanguageOptions:](self, "setIncludeLanguageOptions:", [v10 includeLanguageOptions]);
  }
  if ([v10 hasArtworkWidth])
  {
    [v10 artworkWidth];
    -[MRPlaybackQueueRequest setArtworkWidth:](self, "setArtworkWidth:");
  }
  if ([v10 hasArtworkHeight])
  {
    [v10 artworkHeight];
    -[MRPlaybackQueueRequest setArtworkHeight:](self, "setArtworkHeight:");
  }
  if ([v10 hasIncludeAvailableArtworkFormats]) {
    -[MRPlaybackQueueRequest setIncludeAvailableArtworkFormats:](self, "setIncludeAvailableArtworkFormats:", [v10 includeAvailableArtworkFormats]);
  }
  id v4 = [v10 requestedArtworkFormats];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    int v6 = [v10 requestedArtworkFormats];
    [(MRPlaybackQueueRequest *)self setRequestedArtworkFormats:v6];
  }
  int v7 = [v10 requestedRemoteArtworkFormats];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    int v9 = [v10 requestedRemoteArtworkFormats];
    [(MRPlaybackQueueRequest *)self setRequestedRemoteArtworkFormats:v9];
  }
}

+ (MRPlaybackQueueRequest)requestWithCurrentState:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  int v7 = -[MRPlaybackQueueRequest initWithIdentifiers:range:]([MRPlaybackQueueRequest alloc], "initWithIdentifiers:range:", v6, location, length);

  return v7;
}

- (MRPlaybackQueueRequest)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPlaybackQueueRequest;
  uint64_t v5 = [(MRPlaybackQueueRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contentItemIdentifiers = v5->_contentItemIdentifiers;
    v5->_contentItemIdentifiers = (NSArray *)v6;
  }
  return v5;
}

- (MRPlaybackQueueRequest)initWithIdentifiers:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _NSRange result = [(MRPlaybackQueueRequest *)self initWithIdentifiers:a3];
  if (result)
  {
    *(_WORD *)&result->_hasLocation = 257;
    result->_NSUInteger location = location;
    result->_NSUInteger length = length;
  }
  return result;
}

- (id)initFromTransactionName:(unint64_t)a3
{
  id result = -[MRPlaybackQueueRequest initWithRange:](self, "initWithRange:", 0, 0);
  if (result)
  {
    switch(a3)
    {
      case 2uLL:
        *((unsigned char *)result + 8) = 1;
        uint64_t v5 = 17;
        goto LABEL_10;
      case 3uLL:
        *((unsigned char *)result + 11) = 1;
        uint64_t v5 = 22;
        goto LABEL_10;
      case 4uLL:
        *((unsigned char *)result + 9) = 1;
        uint64_t v5 = 20;
        goto LABEL_10;
      case 5uLL:
        *((unsigned char *)result + 13) = 1;
        uint64_t v5 = 24;
        goto LABEL_10;
      case 6uLL:
        *((unsigned char *)result + 10) = 1;
        uint64_t v5 = 21;
        goto LABEL_10;
      case 7uLL:
        *((unsigned char *)result + 18) = 1;
        *(int64x2_t *)((char *)result + 40) = vdupq_n_s64(0x4082C00000000000uLL);
        uint64_t v5 = 19;
        goto LABEL_10;
      case 8uLL:
        *((unsigned char *)result + 12) = 1;
        uint64_t v5 = 23;
LABEL_10:
        *((unsigned char *)result + v5) = 1;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (double)defaultArtworkWidth
{
  return 600.0;
}

+ (double)defaultArtworkHeight
{
  return 600.0;
}

- (NSDictionary)dictionaryRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"playbackQueueRequest";
  id v2 = [(MRPlaybackQueueRequest *)self description];
  v6[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (BOOL)rangeContainsNowPlayingItem
{
  uint64_t v3 = [(MRPlaybackQueueRequest *)self location];
  int64_t v4 = [(MRPlaybackQueueRequest *)self location];
  int64_t v5 = [(MRPlaybackQueueRequest *)self length] + v4;
  return v3 < 1 && v5 > 0;
}

- (BOOL)shouldRequestItemNotConsideringMetadata
{
  if ([(MRPlaybackQueueRequest *)self includeLanguageOptions]) {
    return 1;
  }
  if ([(MRPlaybackQueueRequest *)self includeSections]) {
    return 1;
  }
  if ([(MRPlaybackQueueRequest *)self includeInfo]) {
    return 1;
  }
  if ([(MRPlaybackQueueRequest *)self includeAlignments]) {
    return 1;
  }
  if ([(MRPlaybackQueueRequest *)self includeLyrics]) {
    return 1;
  }
  [(MRPlaybackQueueRequest *)self artworkWidth];
  if (v3 != 0.0)
  {
    [(MRPlaybackQueueRequest *)self artworkHeight];
    if (v4 != 0.0) {
      return 1;
    }
  }
  if ([(MRPlaybackQueueRequest *)self includeAvailableArtworkFormats]) {
    return 1;
  }
  int v7 = [(MRPlaybackQueueRequest *)self requestedArtworkFormats];
  if ([v7 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v8 = [(MRPlaybackQueueRequest *)self requestedRemoteArtworkFormats];
    BOOL v5 = [v8 count] != 0;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (MRPlaybackQueueRequest *)a3;
  if (v4 == self)
  {
    char v41 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_66;
    }
    BOOL v5 = [(MRPlaybackQueueRequest *)v4 hasLocation];
    if (v5 != [(MRPlaybackQueueRequest *)self hasLocation]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasLocation])
    {
      if ([(MRPlaybackQueueRequest *)self hasLocation])
      {
        uint64_t v6 = [(MRPlaybackQueueRequest *)v4 location];
        if (v6 != [(MRPlaybackQueueRequest *)self location]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v7 = [(MRPlaybackQueueRequest *)v4 hasLength];
    if (v7 != [(MRPlaybackQueueRequest *)self hasLength]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasLength])
    {
      if ([(MRPlaybackQueueRequest *)self hasLength])
      {
        uint64_t v8 = [(MRPlaybackQueueRequest *)v4 length];
        if (v8 != [(MRPlaybackQueueRequest *)self length]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v9 = [(MRPlaybackQueueRequest *)v4 hasIncludeMetadata];
    if (v9 != [(MRPlaybackQueueRequest *)self hasIncludeMetadata]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasIncludeMetadata])
    {
      if ([(MRPlaybackQueueRequest *)self hasIncludeMetadata])
      {
        BOOL v10 = [(MRPlaybackQueueRequest *)v4 includeMetadata];
        if (v10 != [(MRPlaybackQueueRequest *)self includeMetadata]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v11 = [(MRPlaybackQueueRequest *)v4 hasArtworkWidth];
    if (v11 != [(MRPlaybackQueueRequest *)self hasArtworkWidth]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasArtworkWidth])
    {
      if ([(MRPlaybackQueueRequest *)self hasArtworkWidth])
      {
        [(MRPlaybackQueueRequest *)v4 artworkWidth];
        double v13 = v12;
        [(MRPlaybackQueueRequest *)self artworkWidth];
        if (v13 != v14) {
          goto LABEL_66;
        }
      }
    }
    BOOL v15 = [(MRPlaybackQueueRequest *)v4 hasArtworkHeight];
    if (v15 != [(MRPlaybackQueueRequest *)self hasArtworkHeight]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasArtworkHeight])
    {
      if ([(MRPlaybackQueueRequest *)self hasArtworkHeight])
      {
        [(MRPlaybackQueueRequest *)v4 artworkHeight];
        double v17 = v16;
        [(MRPlaybackQueueRequest *)self artworkHeight];
        if (v17 != v18) {
          goto LABEL_66;
        }
      }
    }
    BOOL v19 = [(MRPlaybackQueueRequest *)v4 hasIncludeLyrics];
    if (v19 != [(MRPlaybackQueueRequest *)self hasIncludeLyrics]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasIncludeLyrics])
    {
      if ([(MRPlaybackQueueRequest *)self hasIncludeLyrics])
      {
        BOOL v20 = [(MRPlaybackQueueRequest *)v4 includeLyrics];
        if (v20 != [(MRPlaybackQueueRequest *)self includeLyrics]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v21 = [(MRPlaybackQueueRequest *)v4 hasIncludeSections];
    if (v21 != [(MRPlaybackQueueRequest *)self hasIncludeSections]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasIncludeSections])
    {
      if ([(MRPlaybackQueueRequest *)self hasIncludeSections])
      {
        BOOL v22 = [(MRPlaybackQueueRequest *)v4 includeSections];
        if (v22 != [(MRPlaybackQueueRequest *)self includeSections]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v23 = [(MRPlaybackQueueRequest *)v4 hasIncludeInfo];
    if (v23 != [(MRPlaybackQueueRequest *)self hasIncludeInfo]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasIncludeInfo])
    {
      if ([(MRPlaybackQueueRequest *)self hasIncludeInfo])
      {
        BOOL v24 = [(MRPlaybackQueueRequest *)v4 includeInfo];
        if (v24 != [(MRPlaybackQueueRequest *)self includeInfo]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v25 = [(MRPlaybackQueueRequest *)v4 hasIncludeAlignments];
    if (v25 != [(MRPlaybackQueueRequest *)self hasIncludeAlignments]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasIncludeAlignments])
    {
      if ([(MRPlaybackQueueRequest *)self hasIncludeAlignments])
      {
        BOOL v26 = [(MRPlaybackQueueRequest *)v4 includeAlignments];
        if (v26 != [(MRPlaybackQueueRequest *)self includeAlignments]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v27 = [(MRPlaybackQueueRequest *)v4 hasIncludeLanguageOptions];
    if (v27 != [(MRPlaybackQueueRequest *)self hasIncludeLanguageOptions]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasIncludeLanguageOptions])
    {
      if ([(MRPlaybackQueueRequest *)self hasIncludeLanguageOptions])
      {
        BOOL v28 = [(MRPlaybackQueueRequest *)v4 includeLanguageOptions];
        if (v28 != [(MRPlaybackQueueRequest *)self includeLanguageOptions]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v29 = [(MRPlaybackQueueRequest *)v4 hasIncludeAvailableArtworkFormats];
    if (v29 != [(MRPlaybackQueueRequest *)self hasIncludeAvailableArtworkFormats]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasIncludeAvailableArtworkFormats])
    {
      if ([(MRPlaybackQueueRequest *)self hasIncludeAvailableArtworkFormats])
      {
        BOOL v30 = [(MRPlaybackQueueRequest *)v4 includeAvailableArtworkFormats];
        if (v30 != [(MRPlaybackQueueRequest *)self includeAvailableArtworkFormats]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v31 = [(MRPlaybackQueueRequest *)v4 hasLegacyNowPlayingInfoRequest];
    if (v31 != [(MRPlaybackQueueRequest *)self hasLegacyNowPlayingInfoRequest]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasLegacyNowPlayingInfoRequest])
    {
      if ([(MRPlaybackQueueRequest *)self hasLegacyNowPlayingInfoRequest])
      {
        BOOL v32 = [(MRPlaybackQueueRequest *)v4 isLegacyNowPlayingInfoRequest];
        if (v32 != [(MRPlaybackQueueRequest *)self isLegacyNowPlayingInfoRequest]) {
          goto LABEL_66;
        }
      }
    }
    BOOL v33 = [(MRPlaybackQueueRequest *)v4 hasCachingPolicy];
    if (v33 != [(MRPlaybackQueueRequest *)self hasCachingPolicy]) {
      goto LABEL_66;
    }
    if ([(MRPlaybackQueueRequest *)v4 hasCachingPolicy])
    {
      if ([(MRPlaybackQueueRequest *)self hasCachingPolicy])
      {
        unsigned int v34 = [(MRPlaybackQueueRequest *)v4 cachingPolicy];
        if (v34 != [(MRPlaybackQueueRequest *)self cachingPolicy]) {
          goto LABEL_66;
        }
      }
    }
    v35 = [(MRPlaybackQueueRequest *)v4 playerPath];
    uint64_t v36 = [(MRPlaybackQueueRequest *)self playerPath];
    if (v35 == (void *)v36)
    {
    }
    else
    {
      v37 = (void *)v36;
      v38 = [(MRPlaybackQueueRequest *)v4 playerPath];
      v39 = [(MRPlaybackQueueRequest *)self playerPath];
      int v40 = [v38 isEqual:v39];

      if (!v40) {
        goto LABEL_66;
      }
    }
    v42 = [(MRPlaybackQueueRequest *)v4 requestIdentifier];
    uint64_t v43 = [(MRPlaybackQueueRequest *)self requestIdentifier];
    if (v42 == (void *)v43)
    {
    }
    else
    {
      v44 = (void *)v43;
      v45 = [(MRPlaybackQueueRequest *)v4 requestIdentifier];
      v46 = [(MRPlaybackQueueRequest *)self requestIdentifier];
      int v47 = [v45 isEqualToString:v46];

      if (!v47) {
        goto LABEL_66;
      }
    }
    v48 = [(MRPlaybackQueueRequest *)v4 label];
    uint64_t v49 = [(MRPlaybackQueueRequest *)self label];
    if (v48 == (void *)v49)
    {
    }
    else
    {
      v50 = (void *)v49;
      v51 = [(MRPlaybackQueueRequest *)v4 label];
      v52 = [(MRPlaybackQueueRequest *)self label];
      int v53 = [v51 isEqualToString:v52];

      if (!v53)
      {
LABEL_66:
        char v41 = 0;
        goto LABEL_67;
      }
    }
    v55 = [(MRPlaybackQueueRequest *)v4 contentItemIdentifiers];
    uint64_t v56 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
    if (v55 == (void *)v56)
    {
      char v41 = 1;
      v57 = v55;
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(MRPlaybackQueueRequest *)v4 contentItemIdentifiers];
      v59 = [(MRPlaybackQueueRequest *)self contentItemIdentifiers];
      char v41 = [v58 isEqualToArray:v59];
    }
  }
LABEL_67:

  return v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRPlaybackQueueRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MRLanguageOption initWithCoder:]((uint64_t)v5, v6);
    }

    BOOL v5 = 0;
  }
  BOOL v7 = [(MRPlaybackQueueRequest *)self initWithProtobuf:v5];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRPlaybackQueueRequest *)self protobuf];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

- (void)performRequestForDestination:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[MRNowPlayingControllerConfiguration alloc] initWithDestination:v7];

  [(MRNowPlayingControllerConfiguration *)v8 setPlaybackQueueRequest:self];
  [(MRNowPlayingControllerConfiguration *)v8 setLabel:@"performPlaybackQueueRequest"];
  BOOL v9 = [[MRNowPlayingController alloc] initWithConfiguration:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__MRPlaybackQueueRequest_performRequestForDestination_completion___block_invoke;
  v11[3] = &unk_1E57D5718;
  id v12 = v6;
  id v10 = v6;
  [(MRNowPlayingController *)v9 performRequestWithCompletion:v11];
}

void __66__MRPlaybackQueueRequest_performRequestForDestination_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 playbackQueue];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

@end