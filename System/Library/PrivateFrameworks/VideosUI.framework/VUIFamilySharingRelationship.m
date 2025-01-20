@interface VUIFamilySharingRelationship
- (NSDate)releaseDate;
- (NSString)artworkURL;
- (NSString)genreTitle;
- (NSString)identifier;
- (NSString)standardDescription;
- (VUIContentRating)contentRating;
- (void)setArtworkURL:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setGenreTitle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setStandardDescription:(id)a3;
@end

@implementation VUIFamilySharingRelationship

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
}

- (NSString)standardDescription
{
  return self->_standardDescription;
}

- (void)setStandardDescription:(id)a3
{
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSString)genreTitle
{
  return self->_genreTitle;
}

- (void)setGenreTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreTitle, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_standardDescription, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end