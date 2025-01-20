@interface TVMediaItem
- (BOOL)containsExplicitContent;
- (NSArray)highlightGroups;
- (NSArray)interstitials;
- (NSDictionary)userInfo;
- (NSNumber)contentRatingRanking;
- (NSNumber)playbackProgress;
- (NSString)contentRating;
- (NSString)contentRatingDomain;
- (NSString)externalContentIdentifier;
- (NSString)externalIdentifier;
- (NSString)externalProfileIdentifier;
- (NSString)externalServiceIdentifier;
- (NSString)itemDescription;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (NSURL)artworkImageURL;
- (NSURL)url;
- (_TVSecureKeyLoading)secureKeyLoader;
- (double)contentProposalAutomaticAcceptanceInterval;
- (double)contentProposalPresentationTime;
- (double)resumeTime;
- (void)setArtworkImageURL:(id)a3;
- (void)setContainsExplicitContent:(BOOL)a3;
- (void)setContentProposalAutomaticAcceptanceInterval:(double)a3;
- (void)setContentProposalPresentationTime:(double)a3;
- (void)setContentRating:(id)a3;
- (void)setContentRatingDomain:(id)a3;
- (void)setContentRatingRanking:(id)a3;
- (void)setExternalContentIdentifier:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setExternalProfileIdentifier:(id)a3;
- (void)setExternalServiceIdentifier:(id)a3;
- (void)setHighlightGroups:(id)a3;
- (void)setInterstitials:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setPlaybackProgress:(id)a3;
- (void)setResumeTime:(double)a3;
- (void)setSecureKeyLoader:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation TVMediaItem

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)contentRatingDomain
{
  return self->_contentRatingDomain;
}

- (void)setContentRatingDomain:(id)a3
{
}

- (NSNumber)contentRatingRanking
{
  return self->_contentRatingRanking;
}

- (void)setContentRatingRanking:(id)a3
{
}

- (NSURL)artworkImageURL
{
  return self->_artworkImageURL;
}

- (void)setArtworkImageURL:(id)a3
{
}

- (BOOL)containsExplicitContent
{
  return self->_containsExplicitContent;
}

- (void)setContainsExplicitContent:(BOOL)a3
{
  self->_containsExplicitContent = a3;
}

- (double)resumeTime
{
  return self->_resumeTime;
}

- (void)setResumeTime:(double)a3
{
  self->_resumeTime = a3;
}

- (NSArray)interstitials
{
  return self->_interstitials;
}

- (void)setInterstitials:(id)a3
{
}

- (NSArray)highlightGroups
{
  return self->_highlightGroups;
}

- (void)setHighlightGroups:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
}

- (double)contentProposalPresentationTime
{
  return self->_contentProposalPresentationTime;
}

- (void)setContentProposalPresentationTime:(double)a3
{
  self->_contentProposalPresentationTime = a3;
}

- (double)contentProposalAutomaticAcceptanceInterval
{
  return self->_contentProposalAutomaticAcceptanceInterval;
}

- (void)setContentProposalAutomaticAcceptanceInterval:(double)a3
{
  self->_contentProposalAutomaticAcceptanceInterval = a3;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)externalContentIdentifier
{
  return self->_externalContentIdentifier;
}

- (void)setExternalContentIdentifier:(id)a3
{
}

- (NSString)externalProfileIdentifier
{
  return self->_externalProfileIdentifier;
}

- (void)setExternalProfileIdentifier:(id)a3
{
}

- (NSString)externalServiceIdentifier
{
  return self->_externalServiceIdentifier;
}

- (void)setExternalServiceIdentifier:(id)a3
{
}

- (NSNumber)playbackProgress
{
  return self->_playbackProgress;
}

- (void)setPlaybackProgress:(id)a3
{
}

- (_TVSecureKeyLoading)secureKeyLoader
{
  return self->_secureKeyLoader;
}

- (void)setSecureKeyLoader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureKeyLoader, 0);
  objc_storeStrong((id *)&self->_playbackProgress, 0);
  objc_storeStrong((id *)&self->_externalServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_externalProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_externalContentIdentifier, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_highlightGroups, 0);
  objc_storeStrong((id *)&self->_interstitials, 0);
  objc_storeStrong((id *)&self->_artworkImageURL, 0);
  objc_storeStrong((id *)&self->_contentRatingRanking, 0);
  objc_storeStrong((id *)&self->_contentRatingDomain, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end