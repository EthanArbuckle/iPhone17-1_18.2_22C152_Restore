@interface VUIDocumentContextDataTVShow
- (BOOL)isEqual:(id)a3;
- (BOOL)needsAdamIdToCanonicalIdConversion;
- (NSString)adamID;
- (NSString)episodeID;
- (NSString)showID;
- (VUIDocumentContextDataTVShow)initWithAdamID:(id)a3;
- (VUIDocumentContextDataTVShow)initWithShowID:(id)a3 episodeID:(id)a4;
- (id)jsonData;
- (void)setNeedsAdamIdToCanonicalIdConversion:(BOOL)a3;
@end

@implementation VUIDocumentContextDataTVShow

- (VUIDocumentContextDataTVShow)initWithAdamID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDocumentContextDataTVShow;
  v6 = [(VUIDocumentContextDataTVShow *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adamID, a3);
    v7->_needsAdamIdToCanonicalIdConversion = 1;
  }

  return v7;
}

- (VUIDocumentContextDataTVShow)initWithShowID:(id)a3 episodeID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIDocumentContextDataTVShow;
  objc_super v9 = [(VUIDocumentContextDataTVShow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_showID, a3);
    objc_storeStrong((id *)&v10->_episodeID, a4);
    v10->_needsAdamIdToCanonicalIdConversion = 0;
  }

  return v10;
}

- (id)jsonData
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if ([(NSString *)self->_episodeID length])
  {
    [v3 setObject:self->_episodeID forKeyedSubscript:@"id"];
    [v3 setObject:@"Episode" forKeyedSubscript:@"type"];
    if (![(NSString *)self->_showID length]) {
      goto LABEL_9;
    }
    showID = (__CFString *)self->_showID;
    id v5 = @"showId";
  }
  else if ([(NSString *)self->_showID length])
  {
    [v3 setObject:self->_showID forKeyedSubscript:@"id"];
    showID = @"Show";
    id v5 = @"type";
  }
  else
  {
    if (![(NSString *)self->_adamID length]) {
      goto LABEL_9;
    }
    showID = (__CFString *)self->_adamID;
    id v5 = @"adamId";
  }
  [v3 setObject:showID forKeyedSubscript:v5];
LABEL_9:
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_needsAdamIdToCanonicalIdConversion];
  [v3 setObject:v6 forKeyedSubscript:@"needsAdamIdToCanonicalIdConversion"];

  id v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(VUIDocumentContextDataTVShow *)self showID];
    id v7 = [v5 showID];
    if ([v6 isEqual:v7])
    {
      id v8 = [(VUIDocumentContextDataTVShow *)self episodeID];
      objc_super v9 = [v5 episodeID];
      if ([v8 isEqual:v9])
      {
        v10 = [(VUIDocumentContextDataTVShow *)self adamID];
        v11 = [v5 adamID];
        if ([v10 isEqual:v11])
        {
          BOOL v12 = [(VUIDocumentContextDataTVShow *)self needsAdamIdToCanonicalIdConversion];
          int v13 = v12 ^ [v5 needsAdamIdToCanonicalIdConversion] ^ 1;
        }
        else
        {
          LOBYTE(v13) = 0;
        }
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)showID
{
  return self->_showID;
}

- (NSString)episodeID
{
  return self->_episodeID;
}

- (BOOL)needsAdamIdToCanonicalIdConversion
{
  return self->_needsAdamIdToCanonicalIdConversion;
}

- (void)setNeedsAdamIdToCanonicalIdConversion:(BOOL)a3
{
  self->_needsAdamIdToCanonicalIdConversion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeID, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end