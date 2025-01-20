@interface VUIFamilySharingEntity
- (NSDate)releaseDate;
- (NSNumber)episodeNumber;
- (NSNumber)seasonNumber;
- (NSSet)capabilities;
- (NSString)artworkURL;
- (NSString)genreTitle;
- (NSString)iTunesExtrasUrl;
- (NSString)identifier;
- (NSString)previewArtworkURL;
- (NSString)showTitle;
- (NSString)standardDescription;
- (NSString)title;
- (VUIContentRating)contentRating;
- (VUIFamilySharingRelationships)relationships;
- (VUIMediaEntityType)type;
- (WLKOfferListing)offerListing;
- (WLKOfferListing)personalizedOfferListing;
- (void)setArtworkURL:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setEpisodeNumber:(id)a3;
- (void)setGenreTitle:(id)a3;
- (void)setITunesExtrasUrl:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOfferListing:(id)a3;
- (void)setPersonalizedOfferListing:(id)a3;
- (void)setPreviewArtworkURL:(id)a3;
- (void)setRelationships:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setSeasonNumber:(id)a3;
- (void)setShowTitle:(id)a3;
- (void)setStandardDescription:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation VUIFamilySharingEntity

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (VUIMediaEntityType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (void)setShowTitle:(id)a3
{
}

- (NSString)genreTitle
{
  return self->_genreTitle;
}

- (void)setGenreTitle:(id)a3
{
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSString)iTunesExtrasUrl
{
  return self->_iTunesExtrasUrl;
}

- (void)setITunesExtrasUrl:(id)a3
{
}

- (NSString)previewArtworkURL
{
  return self->_previewArtworkURL;
}

- (void)setPreviewArtworkURL:(id)a3
{
}

- (NSString)standardDescription
{
  return self->_standardDescription;
}

- (void)setStandardDescription:(id)a3
{
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
}

- (VUIFamilySharingRelationships)relationships
{
  return self->_relationships;
}

- (void)setRelationships:(id)a3
{
}

- (WLKOfferListing)offerListing
{
  return self->_offerListing;
}

- (void)setOfferListing:(id)a3
{
}

- (WLKOfferListing)personalizedOfferListing
{
  return self->_personalizedOfferListing;
}

- (void)setPersonalizedOfferListing:(id)a3
{
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_personalizedOfferListing, 0);
  objc_storeStrong((id *)&self->_offerListing, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_standardDescription, 0);
  objc_storeStrong((id *)&self->_previewArtworkURL, 0);
  objc_storeStrong((id *)&self->_iTunesExtrasUrl, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_genreTitle, 0);
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end