@interface MTLinkPresentationMetadataUtil
+ (id)_storefrontIdentifierFromPreviewUrl:(id)a3;
+ (id)linkMetadataForDataSource:(id)a3;
@end

@implementation MTLinkPresentationMetadataUtil

+ (id)linkMetadataForDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)LPLinkMetadata);
  v6 = [v4 shareURL];
  [v5 setURL:v6];

  uint64_t v7 = [v4 shareImage];
  uint64_t v8 = [v4 shareImageProvider];
  if (v7 | v8)
  {
    v9 = [v5 URL];
    uint64_t v10 = [a1 _storefrontIdentifierFromPreviewUrl:v9];

    if (!v10)
    {
      v11 = +[MTAccountController sharedInstance];
      uint64_t v10 = [v11 activeStorefront];
    }
    id v12 = objc_alloc((Class)LPImage);
    uint64_t v32 = v8;
    v34 = (void *)v10;
    uint64_t v30 = v7;
    if (!v8 || v7)
    {
      UIImagePNGRepresentation((UIImage *)v7);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = [v12 initWithData:v15 MIMEType:@"image/png"];
    }
    else
    {
      v13 = +[UIImage defaultPodcastArtwork];
      v14 = UIImagePNGRepresentation(v13);
      id v15 = [v12 initWithData:v14 MIMEType:@"image/png"];

      id v16 = objc_alloc((Class)LPImage);
      v17 = [v4 shareImageProvider];
      id v18 = [v16 initWithItemProvider:v17 properties:0 placeholderImage:v15];
    }
    v20 = [v4 storeIdentifier];
    v21 = [v4 shareEpisodeTitle];
    v22 = [v4 sharePodcastTitle];
    v23 = [v4 shareProvider];
    if (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", [v20 longLongValue]))
    {

      v20 = 0;
    }
    if (objc_msgSend(v4, "currentShareMode", v30, v32) == (id)2 || objc_msgSend(v4, "currentShareMode") == (id)4)
    {
      id v24 = objc_alloc_init((Class)LPiTunesMediaPodcastEpisodeMetadata);
      [v24 setEpisodeName:v21];
      [v24 setPodcastName:v22];
      [v24 setArtist:v23];
      v25 = [v4 pubDate];
      [v24 setReleaseDate:v25];

      [v24 setArtwork:v18];
      v26 = v34;
      [v24 setStoreFrontIdentifier:v34];
      [v24 setStoreIdentifier:v20];
      CFStringRef v36 = @"anonymousDownload";
      v27 = &v36;
    }
    else
    {
      id v24 = objc_alloc_init((Class)LPiTunesMediaPodcastMetadata);
      [v24 setName:v22];
      [v24 setArtist:v23];
      [v24 setArtwork:v18];
      v26 = v34;
      [v24 setStoreFrontIdentifier:v34];
      [v24 setStoreIdentifier:v20];
      CFStringRef v35 = @"anonymousDownload";
      v27 = &v35;
    }
    v28 = +[NSArray arrayWithObjects:v27 count:1];
    [v24 setOffers:v28];

    [v5 setSpecialization:v24];
    id v19 = v5;

    uint64_t v7 = v31;
    uint64_t v8 = v33;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)_storefrontIdentifierFromPreviewUrl:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [objc_alloc((Class)NSURLComponents) initWithURL:v3 resolvingAgainstBaseURL:0];

    id v5 = [v4 path];
    v6 = [v5 pathComponents];

    if ((unint64_t)[v6 count] >= 3)
    {
      uint64_t v8 = [v6 objectAtIndexedSubscript:1];
      uint64_t v7 = +[MTiTunesMediaStorefrontMappings storefrontIdentifierFromCountryCode:v8];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end