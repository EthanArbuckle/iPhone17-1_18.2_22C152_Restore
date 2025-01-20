@interface _ML3ArtworkConfigurationMediaArtworkTypeKey
+ (id)keyWithMediaType:(unsigned int)a3 artworkType:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _ML3ArtworkConfigurationMediaArtworkTypeKey

- (unint64_t)hash
{
  return self->_artworkType ^ self->_mediaType;
}

+ (id)keyWithMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  v6 = objc_alloc_init((Class)a1);
  v6[2] = a3;
  *((void *)v6 + 2) = a4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_ML3ArtworkConfigurationMediaArtworkTypeKey *)a3;
  BOOL v5 = self == v4 || v4 && self->_mediaType == v4->_mediaType && self->_artworkType == v4->_artworkType;

  return v5;
}

@end