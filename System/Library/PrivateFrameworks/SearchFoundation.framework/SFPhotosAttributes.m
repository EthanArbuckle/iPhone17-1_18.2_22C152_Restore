@interface SFPhotosAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsEmbeddingMatched;
- (BOOL)hasIsFavorite;
- (BOOL)hasIsMetadataMatched;
- (BOOL)hasIsVideo;
- (BOOL)hasPhotosSuggestionType;
- (BOOL)hasPositionIndex;
- (BOOL)isEmbeddingMatched;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isMetadataMatched;
- (BOOL)isVideo;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFPhotosAttributes)initWithCoder:(id)a3;
- (SFPhotosAttributes)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)photosSuggestionType;
- (unint64_t)hash;
- (unint64_t)positionIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setIsEmbeddingMatched:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsMetadataMatched:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setPhotosSuggestionType:(int)a3;
- (void)setPositionIndex:(unint64_t)a3;
@end

@implementation SFPhotosAttributes

- (SFPhotosAttributes)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPhotosAttributes;
  v5 = [(SFPhotosAttributes *)&v8 init];
  if (v5)
  {
    if ([v4 positionIndex]) {
      -[SFPhotosAttributes setPositionIndex:](v5, "setPositionIndex:", [v4 positionIndex]);
    }
    if ([v4 isEmbeddingMatched]) {
      -[SFPhotosAttributes setIsEmbeddingMatched:](v5, "setIsEmbeddingMatched:", [v4 isEmbeddingMatched]);
    }
    if ([v4 isMetadataMatched]) {
      -[SFPhotosAttributes setIsMetadataMatched:](v5, "setIsMetadataMatched:", [v4 isMetadataMatched]);
    }
    if ([v4 isVideo]) {
      -[SFPhotosAttributes setIsVideo:](v5, "setIsVideo:", [v4 isVideo]);
    }
    if ([v4 isFavorite]) {
      -[SFPhotosAttributes setIsFavorite:](v5, "setIsFavorite:", [v4 isFavorite]);
    }
    if ([v4 photosSuggestionType]) {
      -[SFPhotosAttributes setPhotosSuggestionType:](v5, "setPhotosSuggestionType:", [v4 photosSuggestionType]);
    }
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)photosSuggestionType
{
  return self->_photosSuggestionType;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isMetadataMatched
{
  return self->_isMetadataMatched;
}

- (BOOL)isEmbeddingMatched
{
  return self->_isEmbeddingMatched;
}

- (unint64_t)positionIndex
{
  return self->_positionIndex;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SFPhotosAttributes *)self positionIndex];
  unint64_t v4 = v3 ^ [(SFPhotosAttributes *)self isEmbeddingMatched];
  uint64_t v5 = [(SFPhotosAttributes *)self isMetadataMatched];
  unint64_t v6 = v4 ^ v5 ^ [(SFPhotosAttributes *)self isVideo];
  uint64_t v7 = [(SFPhotosAttributes *)self isFavorite];
  return v6 ^ v7 ^ [(SFPhotosAttributes *)self photosSuggestionType];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SFPhotosAttributes *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else if ([(SFPhotosAttributes *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    unint64_t v6 = [(SFPhotosAttributes *)self positionIndex];
    if (v6 == [(SFPhotosAttributes *)v5 positionIndex]
      && (BOOL v7 = [(SFPhotosAttributes *)self isEmbeddingMatched],
          v7 == [(SFPhotosAttributes *)v5 isEmbeddingMatched])
      && (BOOL v8 = [(SFPhotosAttributes *)self isMetadataMatched],
          v8 == [(SFPhotosAttributes *)v5 isMetadataMatched])
      && (BOOL v9 = [(SFPhotosAttributes *)self isVideo], v9 == [(SFPhotosAttributes *)v5 isVideo])
      && (BOOL v10 = [(SFPhotosAttributes *)self isFavorite],
          v10 == [(SFPhotosAttributes *)v5 isFavorite]))
    {
      int v13 = [(SFPhotosAttributes *)self photosSuggestionType];
      BOOL v11 = v13 == [(SFPhotosAttributes *)v5 photosSuggestionType];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPositionIndex:", -[SFPhotosAttributes positionIndex](self, "positionIndex"));
  objc_msgSend(v4, "setIsEmbeddingMatched:", -[SFPhotosAttributes isEmbeddingMatched](self, "isEmbeddingMatched"));
  objc_msgSend(v4, "setIsMetadataMatched:", -[SFPhotosAttributes isMetadataMatched](self, "isMetadataMatched"));
  objc_msgSend(v4, "setIsVideo:", -[SFPhotosAttributes isVideo](self, "isVideo"));
  objc_msgSend(v4, "setIsFavorite:", -[SFPhotosAttributes isFavorite](self, "isFavorite"));
  objc_msgSend(v4, "setPhotosSuggestionType:", -[SFPhotosAttributes photosSuggestionType](self, "photosSuggestionType"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPhotosAttributes alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPhotosAttributes *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPhotosAttributes alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPhotosAttributes *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBPhotosAttributes alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBPhotosAttributes *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPhotosAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBPhotosAttributes alloc] initWithData:v5];
  BOOL v7 = [(SFPhotosAttributes *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasPhotosSuggestionType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPhotosSuggestionType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_photosSuggestionType = a3;
}

- (BOOL)hasIsFavorite
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsFavorite:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isFavorite = a3;
}

- (BOOL)hasIsVideo
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isVideo = a3;
}

- (BOOL)hasIsMetadataMatched
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsMetadataMatched:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isMetadataMatched = a3;
}

- (BOOL)hasIsEmbeddingMatched
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsEmbeddingMatched:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isEmbeddingMatched = a3;
}

- (BOOL)hasPositionIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPositionIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_positionIndex = a3;
}

@end