@interface IMPodcastFeedItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicit;
- (BOOL)preferredCategoryFound;
- (NSDate)firstTimeAvailableAsFree;
- (NSDate)firstTimeAvailableAsPaid;
- (NSDate)pubDate;
- (NSString)artworkBackgroundColor;
- (NSString)artworkTemplateURL;
- (NSString)artworkTextPrimaryColor;
- (NSString)artworkTextQuaternaryColor;
- (NSString)artworkTextSecondaryColor;
- (NSString)artworkTextTertiaryColor;
- (NSString)author;
- (NSString)category;
- (NSString)enclosureParameterString;
- (NSString)enclosureURL;
- (NSString)entitledEnclosureURL;
- (NSString)entitledPriceType;
- (NSString)entitledTranscriptIdentifier;
- (NSString)entitledTranscriptProvider;
- (NSString)entitledTranscriptSnippet;
- (NSString)episodeStoreId;
- (NSString)episodeType;
- (NSString)freeTranscriptIdentifier;
- (NSString)freeTranscriptProvider;
- (NSString)freeTranscriptSnippet;
- (NSString)guid;
- (NSString)itemDescription;
- (NSString)itemDescriptionSourceElement;
- (NSString)itemSummary;
- (NSString)itemSummarySourceElement;
- (NSString)itunesTitle;
- (NSString)priceType;
- (NSString)resolvedEnclosureUrl;
- (NSString)title;
- (NSString)uti;
- (NSString)webpageURL;
- (double)artworkHeight;
- (double)artworkWidth;
- (double)duration;
- (double)entitledDuration;
- (id)description;
- (int64_t)episodeNumber;
- (int64_t)seasonNumber;
- (unint64_t)byteSize;
- (unsigned)trackNum;
- (void)setArtworkBackgroundColor:(id)a3;
- (void)setArtworkHeight:(double)a3;
- (void)setArtworkTemplateURL:(id)a3;
- (void)setArtworkTextPrimaryColor:(id)a3;
- (void)setArtworkTextQuaternaryColor:(id)a3;
- (void)setArtworkTextSecondaryColor:(id)a3;
- (void)setArtworkTextTertiaryColor:(id)a3;
- (void)setArtworkWidth:(double)a3;
- (void)setAuthor:(id)a3;
- (void)setByteSize:(unint64_t)a3;
- (void)setCategory:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEnclosureParameterString:(id)a3;
- (void)setEnclosureURL:(id)a3;
- (void)setEntitledDuration:(double)a3;
- (void)setEntitledEnclosureURL:(id)a3;
- (void)setEntitledPriceType:(id)a3;
- (void)setEntitledTranscriptIdentifier:(id)a3;
- (void)setEntitledTranscriptProvider:(id)a3;
- (void)setEntitledTranscriptSnippet:(id)a3;
- (void)setEpisodeNumber:(int64_t)a3;
- (void)setEpisodeStoreId:(id)a3;
- (void)setEpisodeType:(id)a3;
- (void)setFirstTimeAvailableAsFree:(id)a3;
- (void)setFirstTimeAvailableAsPaid:(id)a3;
- (void)setFreeTranscriptIdentifier:(id)a3;
- (void)setFreeTranscriptProvider:(id)a3;
- (void)setFreeTranscriptSnippet:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemDescriptionSourceElement:(id)a3;
- (void)setItemSummary:(id)a3;
- (void)setItemSummarySourceElement:(id)a3;
- (void)setItunesTitle:(id)a3;
- (void)setPreferredCategoryFound:(BOOL)a3;
- (void)setPriceType:(id)a3;
- (void)setPubDate:(id)a3;
- (void)setSeasonNumber:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTrackNum:(unsigned int)a3;
- (void)setUti:(id)a3;
- (void)setWebpageURL:(id)a3;
@end

@implementation IMPodcastFeedItem

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)IMPodcastFeedItem;
  v4 = [(IMPodcastFeedItem *)&v10 description];
  v5 = [(IMPodcastFeedItem *)self title];
  v6 = [(IMPodcastFeedItem *)self guid];
  v7 = [(IMPodcastFeedItem *)self uti];
  v8 = [v3 stringWithFormat:@"%@ Title: %@ GUID: %@ uti: %@", v4, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(IMPodcastFeedItem *)self author];
    v7 = [v5 author];
    if ((v6 == v7 || [v6 isEqual:v7])
      && (unint64_t v8 = -[IMPodcastFeedItem byteSize](self, "byteSize"), v8 == [v5 byteSize]))
    {
      v9 = [(IMPodcastFeedItem *)self category];
      objc_super v10 = [v5 category];
      if ((v9 == v10 || [v9 isEqual:v10])
        && (-[IMPodcastFeedItem duration](self, "duration"), double v12 = v11, [v5 duration], v12 == v13))
      {
        v14 = [(IMPodcastFeedItem *)self enclosureParameterString];
        v15 = [v5 enclosureParameterString];
        if (v14 == v15 || [v14 isEqual:v15])
        {
          v113 = v14;
          v16 = [(IMPodcastFeedItem *)self enclosureURL];
          v17 = [v5 enclosureURL];
          if (v16 == v17 || [v16 isEqual:v17])
          {
            v111 = v17;
            v112 = v16;
            int v18 = [(IMPodcastFeedItem *)self isExplicit];
            if (v18 == [v5 isExplicit])
            {
              v20 = [(IMPodcastFeedItem *)self guid];
              v21 = [v5 guid];
              v110 = v20;
              if (v20 == v21 || [v20 isEqual:v21])
              {
                v108 = v15;
                v109 = v21;
                v22 = [(IMPodcastFeedItem *)self itemDescription];
                v23 = [v5 itemDescription];
                v107 = v22;
                if (v22 == v23 || [v22 isEqual:v23])
                {
                  v106 = v23;
                  v24 = [(IMPodcastFeedItem *)self itemDescriptionSourceElement];
                  v25 = [v5 itemDescriptionSourceElement];
                  v105 = v24;
                  if (v24 == v25 || (v26 = v25, int v27 = [v24 isEqual:v25], v25 = v26, v27))
                  {
                    v104 = v25;
                    v28 = [(IMPodcastFeedItem *)self pubDate];
                    v29 = [v5 pubDate];
                    v103 = v28;
                    if (v28 == v29 || (v30 = v29, int v31 = [v28 isEqual:v29], v29 = v30, v31))
                    {
                      v101 = v29;
                      v32 = [(IMPodcastFeedItem *)self firstTimeAvailableAsPaid];
                      v33 = [v5 firstTimeAvailableAsPaid];
                      v100 = v32;
                      if (v32 == v33 || (v34 = v33, int v35 = [v32 isEqual:v33], v33 = v34, v35))
                      {
                        v99 = v33;
                        v36 = [(IMPodcastFeedItem *)self firstTimeAvailableAsFree];
                        [v5 firstTimeAvailableAsFree];
                        uint64_t v102 = v98 = v36;
                        if (v36 == (void *)v102 || (int v37 = [v36 isEqual:v102], v38 = (void *)v102, v37))
                        {
                          v39 = [(IMPodcastFeedItem *)self title];
                          v40 = [v5 title];
                          if ((v39 == v40 || [v39 isEqual:v40])
                            && (unsigned int v41 = [(IMPodcastFeedItem *)self trackNum],
                                v41 == [v5 trackNum]))
                          {
                            v96 = v40;
                            v97 = v39;
                            v42 = [(IMPodcastFeedItem *)self uti];
                            v43 = [v5 uti];
                            v16 = v112;
                            v95 = v42;
                            if (v42 == v43 || [v42 isEqual:v43])
                            {
                              v93 = v43;
                              v44 = [(IMPodcastFeedItem *)self itunesTitle];
                              v45 = [v5 itunesTitle];
                              v94 = v44;
                              if (v44 == v45 || [v44 isEqual:v45])
                              {
                                uint64_t v46 = [(IMPodcastFeedItem *)self itemSummary];
                                uint64_t v47 = [v5 itemSummary];
                                v92 = (void *)v46;
                                BOOL v48 = v46 == v47;
                                v49 = (void *)v47;
                                if (v48 || [v92 isEqual:v47])
                                {
                                  v90 = v45;
                                  uint64_t v50 = [(IMPodcastFeedItem *)self itemSummarySourceElement];
                                  uint64_t v51 = [v5 itemSummarySourceElement];
                                  v91 = (void *)v50;
                                  BOOL v48 = v50 == v51;
                                  v52 = (void *)v51;
                                  if (v48 || [v91 isEqual:v51])
                                  {
                                    int64_t v53 = [(IMPodcastFeedItem *)self seasonNumber];
                                    if (v53 == [v5 seasonNumber])
                                    {
                                      v89 = v49;
                                      int64_t v54 = [(IMPodcastFeedItem *)self episodeNumber];
                                      if (v54 == [v5 episodeNumber])
                                      {
                                        v55 = [(IMPodcastFeedItem *)self episodeType];
                                        v87 = [v5 episodeType];
                                        v88 = v55;
                                        if (v55 == v87 || [v55 isEqual:v87])
                                        {
                                          v56 = [(IMPodcastFeedItem *)self webpageURL];
                                          v85 = [v5 webpageURL];
                                          v86 = v56;
                                          if (v56 == v85 || [v56 isEqual:v85])
                                          {
                                            v57 = [(IMPodcastFeedItem *)self priceType];
                                            v83 = [v5 priceType];
                                            v84 = v57;
                                            if (v57 == v83 || [v57 isEqual:v83])
                                            {
                                              v58 = [(IMPodcastFeedItem *)self entitledPriceType];
                                              v81 = [v5 entitledPriceType];
                                              v82 = v58;
                                              if (v58 == v81 || [v58 isEqual:v81])
                                              {
                                                v59 = [(IMPodcastFeedItem *)self entitledEnclosureURL];
                                                v79 = [v5 entitledEnclosureURL];
                                                v80 = v59;
                                                if ((v59 == v79 || [v59 isEqual:v79])
                                                  && ([(IMPodcastFeedItem *)self entitledDuration],
                                                      double v61 = v60,
                                                      [v5 entitledDuration],
                                                      v61 == v62))
                                                {
                                                  uint64_t v63 = [(IMPodcastFeedItem *)self freeTranscriptIdentifier];
                                                  v77 = [v5 freeTranscriptIdentifier];
                                                  v78 = (void *)v63;
                                                  if ((void *)v63 == v77)
                                                  {
                                                    uint64_t v64 = [(IMPodcastFeedItem *)self entitledTranscriptIdentifier];
                                                    v75 = [v5 entitledTranscriptIdentifier];
                                                    v76 = (void *)v64;
                                                    if ((void *)v64 == v75)
                                                    {
                                                      v65 = [(IMPodcastFeedItem *)self freeTranscriptSnippet];
                                                      v74 = [v5 freeTranscriptSnippet];
                                                      if (v65 == v74)
                                                      {
                                                        uint64_t v66 = [(IMPodcastFeedItem *)self entitledTranscriptSnippet];
                                                        v72 = [v5 entitledTranscriptSnippet];
                                                        v73 = (void *)v66;
                                                        if ((void *)v66 == v72)
                                                        {
                                                          v67 = [(IMPodcastFeedItem *)self freeTranscriptProvider];
                                                          v71 = [v5 freeTranscriptProvider];
                                                          if (v67 == v71)
                                                          {
                                                            v70 = [(IMPodcastFeedItem *)self entitledTranscriptProvider];
                                                            v68 = [v5 entitledTranscriptProvider];
                                                            BOOL v19 = v70 == v68;
                                                          }
                                                          else
                                                          {
                                                            BOOL v19 = 0;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          BOOL v19 = 0;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        BOOL v19 = 0;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      BOOL v19 = 0;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    BOOL v19 = 0;
                                                  }
                                                }
                                                else
                                                {
                                                  BOOL v19 = 0;
                                                }
                                              }
                                              else
                                              {
                                                BOOL v19 = 0;
                                              }
                                            }
                                            else
                                            {
                                              BOOL v19 = 0;
                                            }
                                          }
                                          else
                                          {
                                            BOOL v19 = 0;
                                          }
                                        }
                                        else
                                        {
                                          BOOL v19 = 0;
                                        }
                                      }
                                      else
                                      {
                                        BOOL v19 = 0;
                                      }
                                      v16 = v112;
                                      v49 = v89;
                                    }
                                    else
                                    {
                                      BOOL v19 = 0;
                                      v16 = v112;
                                    }
                                  }
                                  else
                                  {
                                    BOOL v19 = 0;
                                  }

                                  v45 = v90;
                                }
                                else
                                {
                                  BOOL v19 = 0;
                                }
                              }
                              else
                              {
                                BOOL v19 = 0;
                              }

                              v43 = v93;
                            }
                            else
                            {
                              BOOL v19 = 0;
                            }

                            v40 = v96;
                            v39 = v97;
                          }
                          else
                          {
                            BOOL v19 = 0;
                            v16 = v112;
                          }

                          v38 = (void *)v102;
                        }
                        else
                        {
                          BOOL v19 = 0;
                          v16 = v112;
                        }

                        v33 = v99;
                      }
                      else
                      {
                        BOOL v19 = 0;
                        v16 = v112;
                      }

                      v29 = v101;
                    }
                    else
                    {
                      BOOL v19 = 0;
                      v16 = v112;
                    }

                    v25 = v104;
                  }
                  else
                  {
                    BOOL v19 = 0;
                    v16 = v112;
                  }

                  v23 = v106;
                }
                else
                {
                  BOOL v19 = 0;
                  v16 = v112;
                }

                v15 = v108;
                v21 = v109;
              }
              else
              {
                BOOL v19 = 0;
                v16 = v112;
              }
            }
            else
            {
              BOOL v19 = 0;
              v16 = v112;
            }
            v17 = v111;
          }
          else
          {
            BOOL v19 = 0;
          }

          v14 = v113;
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (NSString)resolvedEnclosureUrl
{
  v3 = [(IMPodcastFeedItem *)self enclosureParameterString];

  id v4 = [(IMPodcastFeedItem *)self enclosureURL];
  if (v3)
  {
    id v5 = [(IMPodcastFeedItem *)self enclosureParameterString];
    uint64_t v6 = [v4 stringByAppendingFormat:@"?%@", v5];

    id v4 = (void *)v6;
  }
  return (NSString *)v4;
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (unint64_t)byteSize
{
  return self->_byteSize;
}

- (void)setByteSize:(unint64_t)a3
{
  self->_byteSize = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)enclosureParameterString
{
  return self->_enclosureParameterString;
}

- (void)setEnclosureParameterString:(id)a3
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

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)itemDescriptionSourceElement
{
  return self->_itemDescriptionSourceElement;
}

- (void)setItemDescriptionSourceElement:(id)a3
{
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (void)setPubDate:(id)a3
{
}

- (NSDate)firstTimeAvailableAsPaid
{
  return self->_firstTimeAvailableAsPaid;
}

- (void)setFirstTimeAvailableAsPaid:(id)a3
{
}

- (NSDate)firstTimeAvailableAsFree
{
  return self->_firstTimeAvailableAsFree;
}

- (void)setFirstTimeAvailableAsFree:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unsigned)trackNum
{
  return self->_trackNum;
}

- (void)setTrackNum:(unsigned int)a3
{
  self->_trackNum = a3;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (NSString)itunesTitle
{
  return self->_itunesTitle;
}

- (void)setItunesTitle:(id)a3
{
}

- (NSString)itemSummary
{
  return self->_itemSummary;
}

- (void)setItemSummary:(id)a3
{
}

- (NSString)itemSummarySourceElement
{
  return self->_itemSummarySourceElement;
}

- (void)setItemSummarySourceElement:(id)a3
{
}

- (int64_t)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(int64_t)a3
{
  self->_seasonNumber = a3;
}

- (int64_t)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(int64_t)a3
{
  self->_episodeNumber = a3;
}

- (NSString)episodeType
{
  return self->_episodeType;
}

- (void)setEpisodeType:(id)a3
{
}

- (NSString)webpageURL
{
  return self->_webpageURL;
}

- (void)setWebpageURL:(id)a3
{
}

- (NSString)episodeStoreId
{
  return self->_episodeStoreId;
}

- (void)setEpisodeStoreId:(id)a3
{
}

- (NSString)priceType
{
  return self->_priceType;
}

- (void)setPriceType:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)enclosureURL
{
  return self->_enclosureURL;
}

- (void)setEnclosureURL:(id)a3
{
}

- (NSString)entitledPriceType
{
  return self->_entitledPriceType;
}

- (void)setEntitledPriceType:(id)a3
{
}

- (double)entitledDuration
{
  return self->_entitledDuration;
}

- (void)setEntitledDuration:(double)a3
{
  self->_entitledDuration = a3;
}

- (NSString)entitledEnclosureURL
{
  return self->_entitledEnclosureURL;
}

- (void)setEntitledEnclosureURL:(id)a3
{
}

- (NSString)artworkTemplateURL
{
  return self->_artworkTemplateURL;
}

- (void)setArtworkTemplateURL:(id)a3
{
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (void)setArtworkWidth:(double)a3
{
  self->_artworkWidth = a3;
}

- (double)artworkHeight
{
  return self->_artworkHeight;
}

- (void)setArtworkHeight:(double)a3
{
  self->_artworkHeight = a3;
}

- (NSString)artworkBackgroundColor
{
  return self->_artworkBackgroundColor;
}

- (void)setArtworkBackgroundColor:(id)a3
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

- (NSString)freeTranscriptIdentifier
{
  return self->_freeTranscriptIdentifier;
}

- (void)setFreeTranscriptIdentifier:(id)a3
{
}

- (NSString)entitledTranscriptIdentifier
{
  return self->_entitledTranscriptIdentifier;
}

- (void)setEntitledTranscriptIdentifier:(id)a3
{
}

- (NSString)freeTranscriptSnippet
{
  return self->_freeTranscriptSnippet;
}

- (void)setFreeTranscriptSnippet:(id)a3
{
}

- (NSString)entitledTranscriptSnippet
{
  return self->_entitledTranscriptSnippet;
}

- (void)setEntitledTranscriptSnippet:(id)a3
{
}

- (NSString)freeTranscriptProvider
{
  return self->_freeTranscriptProvider;
}

- (void)setFreeTranscriptProvider:(id)a3
{
}

- (NSString)entitledTranscriptProvider
{
  return self->_entitledTranscriptProvider;
}

- (void)setEntitledTranscriptProvider:(id)a3
{
}

- (BOOL)preferredCategoryFound
{
  return self->_preferredCategoryFound;
}

- (void)setPreferredCategoryFound:(BOOL)a3
{
  self->_preferredCategoryFound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitledTranscriptProvider, 0);
  objc_storeStrong((id *)&self->_freeTranscriptProvider, 0);
  objc_storeStrong((id *)&self->_entitledTranscriptSnippet, 0);
  objc_storeStrong((id *)&self->_freeTranscriptSnippet, 0);
  objc_storeStrong((id *)&self->_entitledTranscriptIdentifier, 0);
  objc_storeStrong((id *)&self->_freeTranscriptIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkTextQuaternaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextTertiaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextSecondaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextPrimaryColor, 0);
  objc_storeStrong((id *)&self->_artworkBackgroundColor, 0);
  objc_storeStrong((id *)&self->_artworkTemplateURL, 0);
  objc_storeStrong((id *)&self->_entitledEnclosureURL, 0);
  objc_storeStrong((id *)&self->_entitledPriceType, 0);
  objc_storeStrong((id *)&self->_enclosureURL, 0);
  objc_storeStrong((id *)&self->_priceType, 0);
  objc_storeStrong((id *)&self->_episodeStoreId, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_episodeType, 0);
  objc_storeStrong((id *)&self->_itemSummarySourceElement, 0);
  objc_storeStrong((id *)&self->_itemSummary, 0);
  objc_storeStrong((id *)&self->_itunesTitle, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_firstTimeAvailableAsFree, 0);
  objc_storeStrong((id *)&self->_firstTimeAvailableAsPaid, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_itemDescriptionSourceElement, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_enclosureParameterString, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_author, 0);
}

@end