@interface VUIPlistSeasonMediaCollection
- (VUIPlistMediaDatabaseSeason)databaseSeason;
- (VUIPlistSeasonMediaCollection)initWithMediaLibrary:(id)a3 databaseSeason:(id)a4 requestedProperties:(id)a5;
- (VUIPlistSeasonMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6;
- (id)_valueForPropertyDescriptor:(id)a3;
- (id)coverArtImageIdentifier;
- (id)imageLoadParamsWithImageType:(unint64_t)a3;
- (id)mediaItemCount;
- (id)playedState;
- (id)seasonNumber;
- (id)showIdentifier;
- (id)showTitle;
- (void)setDatabaseSeason:(id)a3;
@end

@implementation VUIPlistSeasonMediaCollection

- (VUIPlistSeasonMediaCollection)initWithMediaLibrary:(id)a3 databaseSeason:(id)a4 requestedProperties:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [VUIPlistMediaEntityIdentifier alloc];
  v13 = [v9 identifier];
  v14 = [(VUIPlistMediaEntityIdentifier *)v12 initWithIdentifier:v13 type:5];

  v15 = VUIPlistSeasonMediaKind();
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistSeasonMediaCollection;
  v16 = [(VUIMediaEntity *)&v18 initWithMediaLibrary:v11 identifier:v14 requestedProperties:v10 kind:v15];

  if (v16) {
    objc_storeStrong((id *)&v16->_databaseSeason, a4);
  }

  return v16;
}

- (VUIPlistSeasonMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  id v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The %@ initializer is not available.", v9 format];

  return 0;
}

- (id)coverArtImageIdentifier
{
  v2 = [(VUIPlistSeasonMediaCollection *)self databaseSeason];
  v3 = [v2 coverArtURL];
  v4 = [v3 absoluteString];

  return v4;
}

- (id)playedState
{
  return &unk_1F3F3C8D8;
}

- (id)showIdentifier
{
  v2 = [(VUIPlistSeasonMediaCollection *)self databaseSeason];
  v3 = [v2 show];
  v4 = [v3 identifier];

  v5 = [[VUIPlistMediaEntityIdentifier alloc] initWithIdentifier:v4 type:4];
  return v5;
}

- (id)showTitle
{
  v2 = [(VUIPlistSeasonMediaCollection *)self databaseSeason];
  v3 = [v2 show];
  v4 = [v3 title];

  return v4;
}

- (id)seasonNumber
{
  v2 = [(VUIPlistSeasonMediaCollection *)self databaseSeason];
  v3 = [v2 seasonNumber];

  return v3;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  v4 = [a3 sourcePropertyNames];
  v5 = [v4 allObjects];

  if ([v5 count] == 1)
  {
    v6 = [v5 firstObject];
    v7 = [(VUIPlistSeasonMediaCollection *)self databaseSeason];
    NSSelectorFromString(v6);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v7 valueForKey:v6];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)mediaItemCount
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  v3 = [(VUIPlistSeasonMediaCollection *)self databaseSeason];
  v4 = [v3 episodes];
  v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));

  return v5;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v5 = [(VUIPlistSeasonMediaCollection *)self databaseSeason];
    v6 = [v5 coverArtURL];

    v7 = [(VUIPlistSeasonMediaCollection *)self coverArtImageIdentifier];
    v3 = [[VUIPlistMediaEntityImageLoadParams alloc] initWithImageURL:v6 baseImageIdentifier:v7 imageType:0];
  }
  return v3;
}

- (VUIPlistMediaDatabaseSeason)databaseSeason
{
  return self->_databaseSeason;
}

- (void)setDatabaseSeason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end