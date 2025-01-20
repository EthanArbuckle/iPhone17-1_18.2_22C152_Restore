@interface VUIFamilySharingMediaCollection
- (NSArray)seasonNumbers;
- (NSString)amsSeasonIdentifier;
- (NSString)amsShowIdentifier;
- (NSString)artworkURL;
- (VUIFamilySharingEntity)entity;
- (VUIFamilySharingMediaCollection)initWithAMSEntity:(id)a3 requestedProperties:(id)a4 mediaEntityType:(id)a5;
- (id)contentDescription;
- (id)contentRating;
- (id)duration;
- (id)genreTitle;
- (id)releaseDate;
- (id)releaseYear;
- (id)seasonCount;
- (id)seasonNumber;
- (id)showTitle;
- (id)title;
- (void)setAmsSeasonIdentifier:(id)a3;
- (void)setAmsShowIdentifier:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setEntity:(id)a3;
- (void)setSeasonNumbers:(id)a3;
@end

@implementation VUIFamilySharingMediaCollection

- (VUIFamilySharingMediaCollection)initWithAMSEntity:(id)a3 requestedProperties:(id)a4 mediaEntityType:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = [VUIFamilySharingMediaEntityIdentifier alloc];
  v13 = [v9 identifier];
  v14 = [(VUIFamilySharingMediaEntityIdentifier *)v12 initWithEntityIdentifier:v13 mediaEntityType:v10];

  v15 = VUIFamilySharingMediaCollectionKind();
  v20.receiver = self;
  v20.super_class = (Class)VUIFamilySharingMediaCollection;
  v16 = [(VUIMediaEntity *)&v20 initWithMediaLibrary:0 identifier:v14 requestedProperties:v11 kind:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_entity, a3);
    v17 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    seasonNumbers = v16->_seasonNumbers;
    v16->_seasonNumbers = v17;
  }
  return v16;
}

- (id)title
{
  v2 = [(VUIFamilySharingMediaCollection *)self entity];
  v3 = [v2 showTitle];

  return v3;
}

- (NSString)artworkURL
{
  artworkURL = self->_artworkURL;
  if (!artworkURL)
  {
    v4 = [(VUIFamilySharingMediaCollection *)self entity];
    v5 = [v4 artworkURL];
    v6 = self->_artworkURL;
    self->_artworkURL = v5;

    artworkURL = self->_artworkURL;
  }
  return artworkURL;
}

- (id)seasonNumber
{
  v3 = [(VUIFamilySharingMediaCollection *)self entity];
  v4 = [v3 seasonNumber];

  if (v4)
  {
    v5 = [(VUIFamilySharingMediaCollection *)self entity];
    v6 = [v5 seasonNumber];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)amsShowIdentifier
{
  amsShowIdentifier = self->_amsShowIdentifier;
  if (!amsShowIdentifier)
  {
    v4 = [(VUIFamilySharingMediaCollection *)self entity];
    v5 = [v4 relationships];
    v6 = [v5 show];

    if (v6)
    {
      v7 = [v6 identifier];
      v8 = self->_amsShowIdentifier;
      self->_amsShowIdentifier = v7;
    }
    amsShowIdentifier = self->_amsShowIdentifier;
  }
  return amsShowIdentifier;
}

- (NSString)amsSeasonIdentifier
{
  amsSeasonIdentifier = self->_amsSeasonIdentifier;
  if (!amsSeasonIdentifier)
  {
    v4 = [(VUIFamilySharingMediaCollection *)self entity];
    v5 = [v4 relationships];
    v6 = [v5 season];

    if (v6)
    {
      v7 = [v6 identifier];
      v8 = self->_amsSeasonIdentifier;
      self->_amsSeasonIdentifier = v7;
    }
    amsSeasonIdentifier = self->_amsSeasonIdentifier;
  }
  return amsSeasonIdentifier;
}

- (id)seasonCount
{
  v3 = [(VUIFamilySharingMediaCollection *)self seasonNumbers];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28ED0];
    v5 = [(VUIFamilySharingMediaCollection *)self seasonNumbers];
    v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  }
  else
  {
    v6 = &unk_1F3F3E150;
  }
  return v6;
}

- (id)contentRating
{
  v2 = [(VUIFamilySharingMediaCollection *)self entity];
  v3 = [v2 contentRating];

  return v3;
}

- (id)contentDescription
{
  v2 = [(VUIFamilySharingMediaCollection *)self entity];
  v3 = [v2 standardDescription];

  return v3;
}

- (id)releaseDate
{
  v2 = [(VUIFamilySharingMediaCollection *)self entity];
  v3 = [v2 releaseDate];

  return v3;
}

- (id)releaseYear
{
  v2 = [(VUIFamilySharingMediaCollection *)self releaseDate];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v5 = [v4 components:4 fromDate:v2];
  uint64_t v6 = [v5 year];
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];

  return v7;
}

- (id)genreTitle
{
  v2 = [(VUIFamilySharingMediaCollection *)self entity];
  id v3 = [v2 genreTitle];

  return v3;
}

- (id)duration
{
  v2 = [(VUIFamilySharingMediaCollection *)self entity];
  id v3 = [v2 offerListing];
  v4 = [v3 bestStoreBuyOffer];

  if (v4)
  {
    v5 = [v4 dictionary];
    uint64_t v6 = objc_msgSend(v5, "vui_numberForKey:", @"durationInMilliseconds");

    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 doubleValue], v7 / 1000.0 > 0.0))
    {
      v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)showTitle
{
  v2 = [(VUIFamilySharingMediaCollection *)self entity];
  id v3 = [v2 showTitle];

  return v3;
}

- (void)setArtworkURL:(id)a3
{
}

- (void)setAmsShowIdentifier:(id)a3
{
}

- (void)setAmsSeasonIdentifier:(id)a3
{
}

- (NSArray)seasonNumbers
{
  return self->_seasonNumbers;
}

- (void)setSeasonNumbers:(id)a3
{
}

- (VUIFamilySharingEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_seasonNumbers, 0);
  objc_storeStrong((id *)&self->_amsSeasonIdentifier, 0);
  objc_storeStrong((id *)&self->_amsShowIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
}

@end