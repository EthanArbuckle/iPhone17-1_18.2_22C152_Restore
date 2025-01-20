@interface IMPodcastFeedChannelItem
- (BOOL)isEqual:(id)a3;
- (NSString)artworkURL;
- (NSString)backgroundColor;
- (NSString)displayType;
- (NSString)fallbackSubscriptionName;
- (NSString)logoImageURL;
- (NSString)name;
- (NSString)storeId;
- (NSString)subscriptionName;
- (NSString)uberBackgroundImageURL;
- (NSString)uberBackgroundJoeColor;
- (NSString)url;
- (float)logoImageHeight;
- (float)logoImageWidth;
- (id)description;
- (int64_t)availableShowCount;
- (int64_t)showCount;
- (void)setArtworkURL:(id)a3;
- (void)setAvailableShowCount:(int64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDisplayType:(id)a3;
- (void)setFallbackSubscriptionName:(id)a3;
- (void)setLogoImageHeight:(float)a3;
- (void)setLogoImageURL:(id)a3;
- (void)setLogoImageWidth:(float)a3;
- (void)setName:(id)a3;
- (void)setShowCount:(int64_t)a3;
- (void)setStoreId:(id)a3;
- (void)setSubscriptionName:(id)a3;
- (void)setUberBackgroundImageURL:(id)a3;
- (void)setUberBackgroundJoeColor:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation IMPodcastFeedChannelItem

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMPodcastFeedChannelItem;
  v4 = [(IMPodcastFeedChannelItem *)&v9 description];
  v5 = [(IMPodcastFeedChannelItem *)self name];
  v6 = [(IMPodcastFeedChannelItem *)self storeId];
  v7 = [v3 stringWithFormat:@"%@ Name: %@ ID: %@", v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(IMPodcastFeedChannelItem *)self name];
    v7 = [v5 name];
    if ((v6 == v7 || [v6 isEqual:v7])
      && (int64_t v8 = -[IMPodcastFeedChannelItem showCount](self, "showCount"), v8 == [v5 showCount])
      && (int64_t v9 = [(IMPodcastFeedChannelItem *)self availableShowCount],
          v9 == [v5 availableShowCount]))
    {
      v10 = [(IMPodcastFeedChannelItem *)self storeId];
      v11 = [v5 storeId];
      if (v10 == v11 || [v10 isEqual:v11])
      {
        v12 = [(IMPodcastFeedChannelItem *)self displayType];
        v13 = [v5 displayType];
        if (v12 == v13 || [v12 isEqual:v13])
        {
          v46 = v12;
          v14 = [(IMPodcastFeedChannelItem *)self artworkURL];
          v15 = [v5 artworkURL];
          v45 = v14;
          if (v14 == v15 || [v14 isEqual:v15])
          {
            v44 = v15;
            uint64_t v16 = [(IMPodcastFeedChannelItem *)self logoImageURL];
            uint64_t v17 = [v5 logoImageURL];
            v18 = (void *)v16;
            v19 = (void *)v17;
            v43 = v18;
            if (v18 == (void *)v17 || [v18 isEqual:v17])
            {
              v42 = v19;
              v20 = [(IMPodcastFeedChannelItem *)self backgroundColor];
              v21 = [v5 backgroundColor];
              if (v20 == v21 || [v20 isEqual:v21])
              {
                v41 = v21;
                [(IMPodcastFeedChannelItem *)self logoImageHeight];
                float v23 = v22;
                [v5 logoImageHeight];
                if (v23 == v24
                  && ([(IMPodcastFeedChannelItem *)self logoImageWidth],
                      float v26 = v25,
                      [v5 logoImageWidth],
                      v26 == v27))
                {
                  uint64_t v28 = [(IMPodcastFeedChannelItem *)self uberBackgroundImageURL];
                  uint64_t v29 = [v5 uberBackgroundImageURL];
                  v30 = (void *)v28;
                  v31 = (void *)v29;
                  v40 = v30;
                  if (v30 == (void *)v29 || [v30 isEqual:v29])
                  {
                    v32 = [(IMPodcastFeedChannelItem *)self uberBackgroundJoeColor];
                    v33 = [v5 uberBackgroundJoeColor];
                    if (v32 == v33)
                    {
                      v36 = v32;
                      BOOL v37 = 1;
                    }
                    else
                    {
                      v34 = v33;
                      char v35 = [v32 isEqual:v33];
                      v33 = v34;
                      v36 = v32;
                      BOOL v37 = v35;
                    }

                    v31 = v39;
                  }
                  else
                  {
                    BOOL v37 = 0;
                  }
                }
                else
                {
                  BOOL v37 = 0;
                }
                v21 = v41;
              }
              else
              {
                BOOL v37 = 0;
              }

              v19 = v42;
            }
            else
            {
              BOOL v37 = 0;
            }

            v15 = v44;
          }
          else
          {
            BOOL v37 = 0;
          }

          v12 = v46;
        }
        else
        {
          BOOL v37 = 0;
        }
      }
      else
      {
        BOOL v37 = 0;
      }
    }
    else
    {
      BOOL v37 = 0;
    }
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)subscriptionName
{
  return self->_subscriptionName;
}

- (void)setSubscriptionName:(id)a3
{
}

- (int64_t)showCount
{
  return self->_showCount;
}

- (void)setShowCount:(int64_t)a3
{
  self->_showCount = a3;
}

- (int64_t)availableShowCount
{
  return self->_availableShowCount;
}

- (void)setAvailableShowCount:(int64_t)a3
{
  self->_availableShowCount = a3;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (void)setStoreId:(id)a3
{
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSString)logoImageURL
{
  return self->_logoImageURL;
}

- (void)setLogoImageURL:(id)a3
{
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (float)logoImageHeight
{
  return self->_logoImageHeight;
}

- (void)setLogoImageHeight:(float)a3
{
  self->_logoImageHeight = a3;
}

- (float)logoImageWidth
{
  return self->_logoImageWidth;
}

- (void)setLogoImageWidth:(float)a3
{
  self->_logoImageWidth = a3;
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

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)fallbackSubscriptionName
{
  return self->_fallbackSubscriptionName;
}

- (void)setFallbackSubscriptionName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackSubscriptionName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uberBackgroundJoeColor, 0);
  objc_storeStrong((id *)&self->_uberBackgroundImageURL, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_logoImageURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end