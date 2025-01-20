@interface IMPodcastFeed
- (BOOL)hasEpisodes;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicit;
- (BOOL)isNotSubscribable;
- (BOOL)preferredCategoryFound;
- (IMPodcastFeed)init;
- (IMPodcastFeedChannelItem)channelItem;
- (NSArray)offers;
- (NSMutableArray)items;
- (NSOrderedSet)categories;
- (NSString)artworkPrimaryColor;
- (NSString)artworkTemplateURL;
- (NSString)artworkTextPrimaryColor;
- (NSString)artworkTextQuaternaryColor;
- (NSString)artworkTextSecondaryColor;
- (NSString)artworkTextTertiaryColor;
- (NSString)author;
- (NSString)category;
- (NSString)displayType;
- (NSString)feedDescription;
- (NSString)globalImageURL;
- (NSString)imageURL;
- (NSString)podcastStoreId;
- (NSString)provider;
- (NSString)resolvedFeedURL;
- (NSString)shareURL;
- (NSString)showSpecificUpsellCopy;
- (NSString)showType;
- (NSString)title;
- (NSString)uberArtworkTextPrimaryColor;
- (NSString)uberArtworkTextQuaternaryColor;
- (NSString)uberArtworkTextSecondaryColor;
- (NSString)uberArtworkTextTertiaryColor;
- (NSString)uberBackgroundImageURL;
- (NSString)uberBackgroundJoeColor;
- (NSString)updatedFeedURL;
- (NSString)webpageURL;
- (unint64_t)offerTypesAsFlagBits;
- (void)setArtworkPrimaryColor:(id)a3;
- (void)setArtworkTemplateURL:(id)a3;
- (void)setArtworkTextPrimaryColor:(id)a3;
- (void)setArtworkTextQuaternaryColor:(id)a3;
- (void)setArtworkTextSecondaryColor:(id)a3;
- (void)setArtworkTextTertiaryColor:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setCategories:(id)a3;
- (void)setCategory:(id)a3;
- (void)setChannelItem:(id)a3;
- (void)setDisplayType:(id)a3;
- (void)setFeedDescription:(id)a3;
- (void)setGlobalImageURL:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsNotSubscribable:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPodcastStoreId:(id)a3;
- (void)setPreferredCategoryFound:(BOOL)a3;
- (void)setProvider:(id)a3;
- (void)setResolvedFeedURL:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setShowSpecificUpsellCopy:(id)a3;
- (void)setShowType:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUberArtworkTextPrimaryColor:(id)a3;
- (void)setUberArtworkTextQuaternaryColor:(id)a3;
- (void)setUberArtworkTextSecondaryColor:(id)a3;
- (void)setUberArtworkTextTertiaryColor:(id)a3;
- (void)setUberBackgroundImageURL:(id)a3;
- (void)setUberBackgroundJoeColor:(id)a3;
- (void)setUpdatedFeedURL:(id)a3;
- (void)setWebpageURL:(id)a3;
@end

@implementation IMPodcastFeed

- (IMPodcastFeed)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMPodcastFeed;
  v2 = [(IMPodcastFeed *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    [(IMPodcastFeed *)v2 setItems:v3];
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(IMPodcastFeed *)self feedDescription];
    v7 = [(IMPodcastFeed *)self feedDescription];
    if (v6 == v7 || [v6 isEqual:v7])
    {
      v8 = [(IMPodcastFeed *)self author];
      v9 = [v5 author];
      if (v8 == v9 || [v8 isEqual:v9])
      {
        v10 = [(IMPodcastFeed *)self category];
        v11 = [v5 category];
        if (v10 == v11 || [v10 isEqual:v11])
        {
          v67 = v10;
          v12 = [(IMPodcastFeed *)self imageURL];
          v13 = [v5 imageURL];
          if (v12 == v13 || [v12 isEqual:v13])
          {
            v65 = v11;
            v66 = v13;
            v14 = [(IMPodcastFeed *)self globalImageURL];
            v15 = [v5 globalImageURL];
            if (v14 == v15 || [v14 isEqual:v15])
            {
              v63 = v8;
              v64 = v15;
              v16 = [(IMPodcastFeed *)self items];
              v17 = [v5 items];
              if (v16 == v17 || [v16 isEqual:v17])
              {
                v61 = v9;
                v62 = v17;
                v18 = [(IMPodcastFeed *)self provider];
                v19 = [v5 provider];
                v60 = v18;
                if (v18 == v19 || [v18 isEqual:v19])
                {
                  v59 = v19;
                  v20 = [(IMPodcastFeed *)self category];
                  v21 = [v5 category];
                  v58 = v20;
                  if (v20 == v21 || [v20 isEqual:v21])
                  {
                    v57 = v21;
                    v22 = [(IMPodcastFeed *)self updatedFeedURL];
                    v23 = [v5 updatedFeedURL];
                    v56 = v22;
                    if (v22 == v23 || [v22 isEqual:v23])
                    {
                      v55 = v23;
                      v24 = [(IMPodcastFeed *)self title];
                      v25 = [v5 title];
                      v54 = v24;
                      if (v24 == v25 || [v24 isEqual:v25])
                      {
                        v53 = v25;
                        int v26 = [(IMPodcastFeed *)self isExplicit];
                        if (v26 == [v5 isExplicit]
                          && (int v27 = [(IMPodcastFeed *)self isNotSubscribable],
                              v27 == [v5 isNotSubscribable]))
                        {
                          v29 = [(IMPodcastFeed *)self shareURL];
                          v30 = [v5 shareURL];
                          v52 = v29;
                          if (v29 == v30 || [v29 isEqual:v30])
                          {
                            v51 = v30;
                            v31 = [(IMPodcastFeed *)self showType];
                            v32 = [v5 showType];
                            v50 = v31;
                            if (v31 == v32 || [v31 isEqual:v32])
                            {
                              v49 = v32;
                              v33 = [(IMPodcastFeed *)self webpageURL];
                              v34 = [v5 webpageURL];
                              v48 = v33;
                              if (v33 == v34 || [v33 isEqual:v34])
                              {
                                v47 = v34;
                                v35 = [(IMPodcastFeed *)self displayType];
                                v36 = [v5 displayType];
                                v46 = v35;
                                if (v35 == v36 || [v35 isEqual:v36])
                                {
                                  v45 = v36;
                                  v37 = [(IMPodcastFeed *)self offers];
                                  v38 = [(IMPodcastFeed *)self offers];
                                  if (v37 == v38 || [v37 isEqual:v38])
                                  {
                                    v44 = v38;
                                    v39 = [(IMPodcastFeed *)self showSpecificUpsellCopy];
                                    v40 = [(IMPodcastFeed *)self showSpecificUpsellCopy];
                                    if (v39 == v40)
                                    {
                                      BOOL v28 = 1;
                                    }
                                    else
                                    {
                                      v41 = v40;
                                      char v42 = [v39 isEqual:v40];
                                      v40 = v41;
                                      BOOL v28 = v42;
                                    }

                                    v38 = v44;
                                  }
                                  else
                                  {
                                    BOOL v28 = 0;
                                  }

                                  v36 = v45;
                                }
                                else
                                {
                                  BOOL v28 = 0;
                                }

                                v34 = v47;
                              }
                              else
                              {
                                BOOL v28 = 0;
                              }

                              v32 = v49;
                            }
                            else
                            {
                              BOOL v28 = 0;
                            }

                            v30 = v51;
                          }
                          else
                          {
                            BOOL v28 = 0;
                          }
                        }
                        else
                        {
                          BOOL v28 = 0;
                        }
                        v25 = v53;
                      }
                      else
                      {
                        BOOL v28 = 0;
                      }

                      v23 = v55;
                    }
                    else
                    {
                      BOOL v28 = 0;
                    }

                    v21 = v57;
                  }
                  else
                  {
                    BOOL v28 = 0;
                  }

                  v19 = v59;
                }
                else
                {
                  BOOL v28 = 0;
                }

                v17 = v62;
                v9 = v61;
              }
              else
              {
                BOOL v28 = 0;
              }

              v8 = v63;
              v15 = v64;
            }
            else
            {
              BOOL v28 = 0;
            }

            v11 = v65;
            v13 = v66;
          }
          else
          {
            BOOL v28 = 0;
          }

          v10 = v67;
        }
        else
        {
          BOOL v28 = 0;
        }
      }
      else
      {
        BOOL v28 = 0;
      }
    }
    else
    {
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (unint64_t)offerTypesAsFlagBits
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(IMPodcastFeed *)self offers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) offerTypeAsFlagBit];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasEpisodes
{
  v2 = [(IMPodcastFeed *)self items];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)preferredCategoryFound
{
  return self->_preferredCategoryFound;
}

- (void)setPreferredCategoryFound:(BOOL)a3
{
  self->_preferredCategoryFound = a3;
}

- (NSString)feedDescription
{
  return self->_feedDescription;
}

- (void)setFeedDescription:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)globalImageURL
{
  return self->_globalImageURL;
}

- (void)setGlobalImageURL:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSString)updatedFeedURL
{
  return self->_updatedFeedURL;
}

- (void)setUpdatedFeedURL:(id)a3
{
}

- (NSString)resolvedFeedURL
{
  return self->_resolvedFeedURL;
}

- (void)setResolvedFeedURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (BOOL)isNotSubscribable
{
  return self->_isNotSubscribable;
}

- (void)setIsNotSubscribable:(BOOL)a3
{
  self->_isNotSubscribable = a3;
}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSString)showType
{
  return self->_showType;
}

- (void)setShowType:(id)a3
{
}

- (NSString)webpageURL
{
  return self->_webpageURL;
}

- (void)setWebpageURL:(id)a3
{
}

- (NSString)podcastStoreId
{
  return self->_podcastStoreId;
}

- (void)setPodcastStoreId:(id)a3
{
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
}

- (NSString)uberBackgroundImageURL
{
  return self->_uberBackgroundImageURL;
}

- (void)setUberBackgroundImageURL:(id)a3
{
}

- (NSString)uberBackgroundJoeColor
{
  return self->_uberBackgroundJoeColor;
}

- (void)setUberBackgroundJoeColor:(id)a3
{
}

- (NSString)uberArtworkTextPrimaryColor
{
  return self->_uberArtworkTextPrimaryColor;
}

- (void)setUberArtworkTextPrimaryColor:(id)a3
{
}

- (NSString)uberArtworkTextSecondaryColor
{
  return self->_uberArtworkTextSecondaryColor;
}

- (void)setUberArtworkTextSecondaryColor:(id)a3
{
}

- (NSString)uberArtworkTextTertiaryColor
{
  return self->_uberArtworkTextTertiaryColor;
}

- (void)setUberArtworkTextTertiaryColor:(id)a3
{
}

- (NSString)uberArtworkTextQuaternaryColor
{
  return self->_uberArtworkTextQuaternaryColor;
}

- (void)setUberArtworkTextQuaternaryColor:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSString)artworkTemplateURL
{
  return self->_artworkTemplateURL;
}

- (void)setArtworkTemplateURL:(id)a3
{
}

- (NSString)artworkPrimaryColor
{
  return self->_artworkPrimaryColor;
}

- (void)setArtworkPrimaryColor:(id)a3
{
}

- (NSString)artworkTextPrimaryColor
{
  return self->_artworkTextPrimaryColor;
}

- (void)setArtworkTextPrimaryColor:(id)a3
{
}

- (NSString)artworkTextSecondaryColor
{
  return self->_artworkTextSecondaryColor;
}

- (void)setArtworkTextSecondaryColor:(id)a3
{
}

- (NSString)artworkTextTertiaryColor
{
  return self->_artworkTextTertiaryColor;
}

- (void)setArtworkTextTertiaryColor:(id)a3
{
}

- (NSString)artworkTextQuaternaryColor
{
  return self->_artworkTextQuaternaryColor;
}

- (void)setArtworkTextQuaternaryColor:(id)a3
{
}

- (IMPodcastFeedChannelItem)channelItem
{
  return self->_channelItem;
}

- (void)setChannelItem:(id)a3
{
}

- (NSOrderedSet)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (NSString)showSpecificUpsellCopy
{
  return self->_showSpecificUpsellCopy;
}

- (void)setShowSpecificUpsellCopy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showSpecificUpsellCopy, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_channelItem, 0);
  objc_storeStrong((id *)&self->_artworkTextQuaternaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextTertiaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextSecondaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextPrimaryColor, 0);
  objc_storeStrong((id *)&self->_artworkPrimaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTemplateURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_uberArtworkTextQuaternaryColor, 0);
  objc_storeStrong((id *)&self->_uberArtworkTextTertiaryColor, 0);
  objc_storeStrong((id *)&self->_uberArtworkTextSecondaryColor, 0);
  objc_storeStrong((id *)&self->_uberArtworkTextPrimaryColor, 0);
  objc_storeStrong((id *)&self->_uberBackgroundJoeColor, 0);
  objc_storeStrong((id *)&self->_uberBackgroundImageURL, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_podcastStoreId, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_showType, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_resolvedFeedURL, 0);
  objc_storeStrong((id *)&self->_updatedFeedURL, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_globalImageURL, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_feedDescription, 0);
}

@end