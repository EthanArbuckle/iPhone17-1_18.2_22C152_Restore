@interface WFMediaItemDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)allDescriptorsForMediaTypeUsingMPMediaQuery:(id)a3;
+ (id)collectionForPlaybackWithItemName:(id)a3 persistentIdentifier:(id)a4 mediaType:(id)a5;
+ (id)collectionsOrItemsFromQuery:(id)a3 forMediaType:(id)a4;
+ (id)descriptorForMPMediaEntity:(id)a3 mediaType:(id)a4;
+ (id)descriptorWithPersistentIdentifier:(id)a3 mediaType:(id)a4;
+ (id)intentJSONTransformer;
+ (id)itemCollectionFromQuery:(id)a3 mediaType:(id)a4;
+ (id)mpMediaQueryForName:(id)a3 withMediaType:(id)a4;
+ (id)mpMediaQueryForPersistentIdentifier:(id)a3 withMediaType:(id)a4;
+ (id)playbackArchiveDataJSONTransformer;
- (BOOL)isEqual:(id)a3;
- (INPlayMediaIntent)intent;
- (NSData)playbackArchiveData;
- (NSNumber)persistentIdentifier;
- (NSString)itemName;
- (NSString)type;
- (WFMediaItemDescriptor)initWithIntent:(id)a3;
- (WFMediaItemDescriptor)initWithMediaItemName:(id)a3 persistentIdentifier:(id)a4 mediaType:(id)a5;
- (WFMediaItemDescriptor)initWithMediaItemName:(id)a3 playbackArchiveData:(id)a4;
- (id)collectionForPlayback;
- (unint64_t)hash;
@end

@implementation WFMediaItemDescriptor

- (id)collectionForPlayback
{
  v3 = objc_opt_class();
  v4 = [(WFMediaItemDescriptor *)self itemName];
  v5 = [(WFMediaItemDescriptor *)self persistentIdentifier];
  v6 = [(WFMediaItemDescriptor *)self type];
  v7 = [v3 collectionForPlaybackWithItemName:v4 persistentIdentifier:v5 mediaType:v6];

  return v7;
}

+ (id)collectionForPlaybackWithItemName:(id)a3 persistentIdentifier:(id)a4 mediaType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9
    || ([a1 mpMediaQueryForPersistentIdentifier:v9 withMediaType:v10],
        v11 = objc_claimAutoreleasedReturnValue(),
        [a1 itemCollectionFromQuery:v11 mediaType:v10],
        v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    if ([v8 length])
    {
      v13 = [a1 mpMediaQueryForName:v8 withMediaType:v10];
      v12 = [a1 itemCollectionFromQuery:v13 mediaType:v10];
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (id)itemCollectionFromQuery:(id)a3 mediaType:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 collectionsOrItemsFromQuery:v6 forMediaType:v7];
  id v9 = [v8 firstObject];

  getMPMediaItemCollectionClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
  }
  else
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v11 = (void *)getMPMediaItemClass_softClass;
    uint64_t v20 = getMPMediaItemClass_softClass;
    if (!getMPMediaItemClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getMPMediaItemClass_block_invoke;
      v16[3] = &unk_1E6558B78;
      v16[4] = &v17;
      __getMPMediaItemClass_block_invoke((uint64_t)v16);
      v11 = (void *)v18[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v17, 8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = objc_alloc((Class)getMPMediaItemCollectionClass());
      v21[0] = v9;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      id v10 = (id)[v13 initWithItems:v14];
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

+ (id)mpMediaQueryForName:(id)a3 withMediaType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
  id v8 = v6;
  if (![v8 isEqualToString:@"Playlist"])
  {
    switch(WFGroupingPropertyForMediaType(v8))
    {
      case 1:
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2020000000;
        id v9 = (id *)getMPMediaItemPropertyAlbumTitleSymbolLoc_ptr;
        uint64_t v32 = getMPMediaItemPropertyAlbumTitleSymbolLoc_ptr;
        if (!getMPMediaItemPropertyAlbumTitleSymbolLoc_ptr)
        {
          uint64_t v25 = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          v27 = __getMPMediaItemPropertyAlbumTitleSymbolLoc_block_invoke;
          v28 = &unk_1E6558B78;
          v18 = MediaPlayerLibrary();
          v30[3] = (uint64_t)dlsym(v18, "MPMediaItemPropertyAlbumTitle");
          getMPMediaItemPropertyAlbumTitleSymbolLoc_ptr = v30[3];
          id v9 = (id *)v30[3];
        }
        _Block_object_dispose(&v29, 8);
        if (v9) {
          goto LABEL_5;
        }
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v20 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyAlbumTitle(void)"];
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFMediaItemDescriptor+Library.m", 28, @"%s", dlerror(), v25, v26, v27, v28);
        break;
      case 2:
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2020000000;
        id v9 = (id *)getMPMediaItemPropertyArtistSymbolLoc_ptr;
        uint64_t v32 = getMPMediaItemPropertyArtistSymbolLoc_ptr;
        if (!getMPMediaItemPropertyArtistSymbolLoc_ptr)
        {
          uint64_t v25 = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          v27 = __getMPMediaItemPropertyArtistSymbolLoc_block_invoke;
          v28 = &unk_1E6558B78;
          v21 = MediaPlayerLibrary();
          v30[3] = (uint64_t)dlsym(v21, "MPMediaItemPropertyArtist");
          getMPMediaItemPropertyArtistSymbolLoc_ptr = v30[3];
          id v9 = (id *)v30[3];
        }
        _Block_object_dispose(&v29, 8);
        if (v9) {
          goto LABEL_5;
        }
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v20 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyArtist(void)"];
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFMediaItemDescriptor+Library.m", 29, @"%s", dlerror(), v25, v26, v27, v28);
        break;
      case 3:
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2020000000;
        id v9 = (id *)getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr;
        uint64_t v32 = getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr;
        if (!getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr)
        {
          uint64_t v25 = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          v27 = __getMPMediaItemPropertyAlbumArtistSymbolLoc_block_invoke;
          v28 = &unk_1E6558B78;
          v22 = MediaPlayerLibrary();
          v30[3] = (uint64_t)dlsym(v22, "MPMediaItemPropertyAlbumArtist");
          getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr = v30[3];
          id v9 = (id *)v30[3];
        }
        _Block_object_dispose(&v29, 8);
        if (v9) {
          goto LABEL_5;
        }
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v20 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyAlbumArtist(void)"];
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFMediaItemDescriptor+Library.m", 30, @"%s", dlerror(), v25, v26, v27, v28);
        break;
      case 4:
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2020000000;
        id v9 = (id *)getMPMediaItemPropertyComposerSymbolLoc_ptr;
        uint64_t v32 = getMPMediaItemPropertyComposerSymbolLoc_ptr;
        if (!getMPMediaItemPropertyComposerSymbolLoc_ptr)
        {
          uint64_t v25 = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          v27 = __getMPMediaItemPropertyComposerSymbolLoc_block_invoke;
          v28 = &unk_1E6558B78;
          v23 = MediaPlayerLibrary();
          v30[3] = (uint64_t)dlsym(v23, "MPMediaItemPropertyComposer");
          getMPMediaItemPropertyComposerSymbolLoc_ptr = v30[3];
          id v9 = (id *)v30[3];
        }
        _Block_object_dispose(&v29, 8);
        if (v9) {
          goto LABEL_5;
        }
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v20 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyComposer(void)"];
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFMediaItemDescriptor+Library.m", 31, @"%s", dlerror(), v25, v26, v27, v28);
        break;
      case 5:
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2020000000;
        id v9 = (id *)getMPMediaItemPropertyGenreSymbolLoc_ptr;
        uint64_t v32 = getMPMediaItemPropertyGenreSymbolLoc_ptr;
        if (!getMPMediaItemPropertyGenreSymbolLoc_ptr)
        {
          uint64_t v25 = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          v27 = __getMPMediaItemPropertyGenreSymbolLoc_block_invoke;
          v28 = &unk_1E6558B78;
          v24 = MediaPlayerLibrary();
          v30[3] = (uint64_t)dlsym(v24, "MPMediaItemPropertyGenre");
          getMPMediaItemPropertyGenreSymbolLoc_ptr = v30[3];
          id v9 = (id *)v30[3];
        }
        _Block_object_dispose(&v29, 8);
        if (v9) {
          goto LABEL_5;
        }
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v20 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyGenre(void)"];
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFMediaItemDescriptor+Library.m", 32, @"%s", dlerror(), v25, v26, v27, v28);
        break;
      default:
        getMPMediaItemPropertyTitle();
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
    }
    goto LABEL_32;
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  id v9 = (id *)getMPMediaPlaylistPropertyNameSymbolLoc_ptr;
  uint64_t v32 = getMPMediaPlaylistPropertyNameSymbolLoc_ptr;
  if (!getMPMediaPlaylistPropertyNameSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getMPMediaPlaylistPropertyNameSymbolLoc_block_invoke;
    v28 = &unk_1E6558B78;
    id v10 = MediaPlayerLibrary();
    v30[3] = (uint64_t)dlsym(v10, "MPMediaPlaylistPropertyName");
    getMPMediaPlaylistPropertyNameSymbolLoc_ptr = v30[3];
    id v9 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"NSString *getMPMediaPlaylistPropertyName(void)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFMediaItemDescriptor+Library.m", 26, @"%s", dlerror(), v25, v26, v27, v28);
LABEL_32:

    __break(1u);
    return result;
  }
LABEL_5:
  id v11 = *v9;
LABEL_6:
  id v12 = v11;

  id v13 = [MPMediaPropertyPredicateClass predicateWithValue:v5 forProperty:v12];

  id v14 = objc_alloc((Class)getMPMediaQueryClass());
  v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
  v16 = (void *)[v14 initWithFilterPredicates:v15];

  [v16 setGroupingType:WFGroupingPropertyForMediaType(v8)];
  return v16;
}

+ (id)descriptorWithPersistentIdentifier:(id)a3 mediaType:(id)a4
{
  id v6 = a4;
  id v7 = [a1 mpMediaQueryForPersistentIdentifier:a3 withMediaType:v6];
  id v8 = [a1 collectionsOrItemsFromQuery:v7 forMediaType:v6];
  id v9 = [v8 firstObject];

  if (v9)
  {
    id v10 = [a1 descriptorForMPMediaEntity:v9 mediaType:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)mpMediaQueryForPersistentIdentifier:(id)a3 withMediaType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
  id v8 = v6;
  if ([v8 isEqualToString:@"Playlist"])
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    id v9 = (id *)getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr;
    uint64_t v31 = getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr;
    if (!getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getMPMediaPlaylistPropertyPersistentIDSymbolLoc_block_invoke;
      v27 = &unk_1E6558B78;
      id v10 = MediaPlayerLibrary();
      v29[3] = (uint64_t)dlsym(v10, "MPMediaPlaylistPropertyPersistentID");
      getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr = v29[3];
      id v9 = (id *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (!v9)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"NSString *getMPMediaPlaylistPropertyPersistentID(void)"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFMediaItemDescriptor+Library.m", 20, @"%s", dlerror(), v24, v25, v26, v27);
LABEL_37:

      __break(1u);
      return result;
    }
  }
  else if ([v8 isEqualToString:@"Song"])
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    id v9 = (id *)getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
    uint64_t v31 = getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyPersistentIDSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getMPMediaItemPropertyPersistentIDSymbolLoc_block_invoke;
      v27 = &unk_1E6558B78;
      id v13 = MediaPlayerLibrary();
      v29[3] = (uint64_t)dlsym(v13, "MPMediaItemPropertyPersistentID");
      getMPMediaItemPropertyPersistentIDSymbolLoc_ptr = v29[3];
      id v9 = (id *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (!v9)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyPersistentID(void)"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFMediaItemDescriptor+Library.m", 21, @"%s", dlerror(), v24, v25, v26, v27);
      goto LABEL_37;
    }
  }
  else if (([v8 isEqualToString:@"Album"] & 1) != 0 {
         || [v8 isEqualToString:@"Compilation"])
  }
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    id v9 = (id *)getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr;
    uint64_t v31 = getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_block_invoke;
      v27 = &unk_1E6558B78;
      id v14 = MediaPlayerLibrary();
      v29[3] = (uint64_t)dlsym(v14, "MPMediaItemPropertyAlbumPersistentID");
      getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr = v29[3];
      id v9 = (id *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (!v9)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyAlbumPersistentID(void)"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFMediaItemDescriptor+Library.m", 22, @"%s", dlerror(), v24, v25, v26, v27);
      goto LABEL_37;
    }
  }
  else if ([v8 isEqualToString:@"Artist"])
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    id v9 = (id *)getMPMediaItemPropertyArtistPersistentIDSymbolLoc_ptr;
    uint64_t v31 = getMPMediaItemPropertyArtistPersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyArtistPersistentIDSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getMPMediaItemPropertyArtistPersistentIDSymbolLoc_block_invoke;
      v27 = &unk_1E6558B78;
      v21 = MediaPlayerLibrary();
      v29[3] = (uint64_t)dlsym(v21, "MPMediaItemPropertyArtistPersistentID");
      getMPMediaItemPropertyArtistPersistentIDSymbolLoc_ptr = v29[3];
      id v9 = (id *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (!v9)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyArtistPersistentID(void)"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFMediaItemDescriptor+Library.m", 23, @"%s", dlerror(), v24, v25, v26, v27);
      goto LABEL_37;
    }
  }
  else if ([v8 isEqualToString:@"Genre"])
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    id v9 = (id *)getMPMediaItemPropertyGenrePersistentIDSymbolLoc_ptr;
    uint64_t v31 = getMPMediaItemPropertyGenrePersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyGenrePersistentIDSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getMPMediaItemPropertyGenrePersistentIDSymbolLoc_block_invoke;
      v27 = &unk_1E6558B78;
      v22 = MediaPlayerLibrary();
      v29[3] = (uint64_t)dlsym(v22, "MPMediaItemPropertyGenrePersistentID");
      getMPMediaItemPropertyGenrePersistentIDSymbolLoc_ptr = v29[3];
      id v9 = (id *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (!v9)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyGenrePersistentID(void)"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFMediaItemDescriptor+Library.m", 25, @"%s", dlerror(), v24, v25, v26, v27);
      goto LABEL_37;
    }
  }
  else
  {
    if (![v8 isEqualToString:@"Composer"])
    {
      id v15 = 0;
      goto LABEL_17;
    }
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    id v9 = (id *)getMPMediaItemPropertyComposerPersistentIDSymbolLoc_ptr;
    uint64_t v31 = getMPMediaItemPropertyComposerPersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyComposerPersistentIDSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __getMPMediaItemPropertyComposerPersistentIDSymbolLoc_block_invoke;
      v27 = &unk_1E6558B78;
      v23 = MediaPlayerLibrary();
      v29[3] = (uint64_t)dlsym(v23, "MPMediaItemPropertyComposerPersistentID");
      getMPMediaItemPropertyComposerPersistentIDSymbolLoc_ptr = v29[3];
      id v9 = (id *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (!v9)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyComposerPersistentID(void)"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"WFMediaItemDescriptor+Library.m", 24, @"%s", dlerror(), v24, v25, v26, v27);
      goto LABEL_37;
    }
  }
  id v15 = *v9;
LABEL_17:

  v16 = [MPMediaPropertyPredicateClass predicateWithValue:v5 forProperty:v15];

  id v17 = objc_alloc((Class)getMPMediaQueryClass());
  v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
  uint64_t v19 = (void *)[v17 initWithFilterPredicates:v18];

  return v19;
}

+ (id)allDescriptorsForMediaTypeUsingMPMediaQuery:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Playlist"])
  {
    uint64_t v5 = [getMPMediaQueryClass() playlistsQuery];
  }
  else if ([v4 isEqualToString:@"Song"])
  {
    uint64_t v5 = [getMPMediaQueryClass() songsQuery];
  }
  else if ([v4 isEqualToString:@"Album"])
  {
    uint64_t v5 = [getMPMediaQueryClass() albumsQuery];
  }
  else if ([v4 isEqualToString:@"Artist"])
  {
    uint64_t v5 = [getMPMediaQueryClass() artistsQuery];
  }
  else if ([v4 isEqualToString:@"Genre"])
  {
    uint64_t v5 = [getMPMediaQueryClass() genresQuery];
  }
  else if ([v4 isEqualToString:@"Compilation"])
  {
    uint64_t v5 = [getMPMediaQueryClass() compilationsQuery];
  }
  else
  {
    if (([v4 isEqualToString:@"Composer"] & 1) == 0)
    {

      goto LABEL_18;
    }
    uint64_t v5 = [getMPMediaQueryClass() composersQuery];
  }
  id v6 = (void *)v5;

  if (v6)
  {
    id v7 = [a1 collectionsOrItemsFromQuery:v6 forMediaType:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__WFMediaItemDescriptor_Library__allDescriptorsForMediaTypeUsingMPMediaQuery___block_invoke;
    v10[3] = &unk_1E65515C0;
    id v12 = a1;
    id v11 = v4;
    id v8 = objc_msgSend(v7, "if_map:", v10);

    goto LABEL_19;
  }
LABEL_18:
  id v8 = 0;
LABEL_19:

  return v8;
}

uint64_t __78__WFMediaItemDescriptor_Library__allDescriptorsForMediaTypeUsingMPMediaQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) descriptorForMPMediaEntity:a2 mediaType:*(void *)(a1 + 32)];
}

+ (id)collectionsOrItemsFromQuery:(id)a3 forMediaType:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"Song"]) {
    [v5 items];
  }
  else {
  id v6 = [v5 collections];
  }

  return v6;
}

+ (id)descriptorForMPMediaEntity:(id)a3 mediaType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "persistentID"));
  int v8 = [v6 isEqualToString:@"Song"];
  if ([v6 isEqualToString:@"Playlist"]) {
    int v9 = 0;
  }
  else {
    int v9 = [v6 isEqualToString:@"Song"] ^ 1;
  }
  if ((v8 | v9) == 1)
  {
    id v10 = v5;
  }
  else
  {
    id v10 = [v5 representativeItem];
  }
  id v11 = v10;
  id v12 = v6;
  if ([v12 isEqualToString:@"Playlist"])
  {
    id v13 = @"name";
  }
  else if ([v12 isEqualToString:@"Song"])
  {
    id v13 = @"title";
  }
  else if (([v12 isEqualToString:@"Album"] & 1) != 0 {
         || ([v12 isEqualToString:@"Compilation"] & 1) != 0)
  }
  {
    id v13 = @"albumTitle";
  }
  else if ([v12 isEqualToString:@"Artist"])
  {
    id v13 = @"artist";
  }
  else if ([v12 isEqualToString:@"Genre"])
  {
    id v13 = @"genre";
  }
  else if ([v12 isEqualToString:@"Composer"])
  {
    id v13 = @"composer";
  }
  else
  {
    id v13 = 0;
  }

  id v14 = [v11 valueForKey:v13];
  id v15 = [[WFMediaItemDescriptor alloc] initWithMediaItemName:v14 persistentIdentifier:v7 mediaType:v12];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_playbackArchiveData, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
}

- (INPlayMediaIntent)intent
{
  return self->_intent;
}

- (NSString)type
{
  return self->_type;
}

- (NSData)playbackArchiveData
{
  return self->_playbackArchiveData;
}

- (NSNumber)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSString)itemName
{
  return self->_itemName;
}

- (unint64_t)hash
{
  v3 = [(WFMediaItemDescriptor *)self itemName];
  uint64_t v4 = [v3 hash];
  id v5 = [(WFMediaItemDescriptor *)self persistentIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(WFMediaItemDescriptor *)self type];
  uint64_t v8 = [v7 hash];
  int v9 = [(WFMediaItemDescriptor *)self playbackArchiveData];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  id v11 = [(WFMediaItemDescriptor *)self intent];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = (WFMediaItemDescriptor *)a3;
  if (self == v7)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = v7;
      int v9 = [(WFMediaItemDescriptor *)self itemName];
      if (v9
        || ([(WFMediaItemDescriptor *)v8 itemName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v4 = [(WFMediaItemDescriptor *)self itemName];
        uint64_t v10 = [(WFMediaItemDescriptor *)v8 itemName];
        char v27 = [v4 isEqual:v10];

        if (v9)
        {
LABEL_11:

          unint64_t v12 = [(WFMediaItemDescriptor *)self persistentIdentifier];
          if (v12
            || ([(WFMediaItemDescriptor *)v8 persistentIdentifier],
                (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v13 = [(WFMediaItemDescriptor *)self persistentIdentifier];
            id v5 = [(WFMediaItemDescriptor *)v8 persistentIdentifier];
            char v14 = [v13 isEqual:v5];

            if (v12)
            {
LABEL_17:

              id v15 = [(WFMediaItemDescriptor *)self type];
              v16 = [(WFMediaItemDescriptor *)v8 type];
              char v17 = [v15 isEqual:v16];

              v18 = [(WFMediaItemDescriptor *)self playbackArchiveData];
              if (v18
                || ([(WFMediaItemDescriptor *)v8 playbackArchiveData],
                    (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                uint64_t v19 = [(WFMediaItemDescriptor *)self playbackArchiveData];
                uint64_t v20 = [(WFMediaItemDescriptor *)v8 playbackArchiveData];
                char v21 = [v19 isEqual:v20];

                if (v18)
                {
LABEL_23:

                  v22 = [(WFMediaItemDescriptor *)self intent];
                  if (v22
                    || ([(WFMediaItemDescriptor *)v8 intent],
                        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    v23 = [(WFMediaItemDescriptor *)self intent];
                    uint64_t v24 = [(WFMediaItemDescriptor *)v8 intent];
                    char v25 = [v23 isEqual:v24];

                    if (v22)
                    {
LABEL_29:

                      char v11 = v27 & v14 & v17 & v21 & v25;
                      goto LABEL_30;
                    }
                  }
                  else
                  {
                    char v25 = 1;
                  }

                  goto LABEL_29;
                }
              }
              else
              {
                char v21 = 1;
              }

              goto LABEL_23;
            }
          }
          else
          {
            char v14 = 1;
          }

          goto LABEL_17;
        }
      }
      else
      {
        char v27 = 1;
      }

      goto LABEL_11;
    }
    char v11 = 0;
  }
LABEL_30:

  return v11;
}

- (WFMediaItemDescriptor)initWithIntent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFMediaItemState.m", 90, @"Invalid parameter not satisfying: %@", @"intent" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFMediaItemDescriptor;
  uint64_t v6 = [(MTLModel *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    intent = v6->_intent;
    v6->_intent = (INPlayMediaIntent *)v7;

    int v9 = [v5 mediaContainer];
    uint64_t v10 = [v9 title];
    uint64_t v11 = [v10 copy];
    itemName = v6->_itemName;
    v6->_itemName = (NSString *)v11;

    type = v6->_type;
    v6->_type = (NSString *)@"ContextualActionIntent";

    char v14 = v6;
  }

  return v6;
}

- (WFMediaItemDescriptor)initWithMediaItemName:(id)a3 playbackArchiveData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFMediaItemState.m", 75, @"Invalid parameter not satisfying: %@", @"itemName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"WFMediaItemState.m", 76, @"Invalid parameter not satisfying: %@", @"playbackArchiveData" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)WFMediaItemDescriptor;
  uint64_t v10 = [(MTLModel *)&v20 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    itemName = v10->_itemName;
    v10->_itemName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    playbackArchiveData = v10->_playbackArchiveData;
    v10->_playbackArchiveData = (NSData *)v13;

    type = v10->_type;
    v10->_type = (NSString *)@"PlaybackArchive";

    v16 = v10;
  }

  return v10;
}

- (WFMediaItemDescriptor)initWithMediaItemName:(id)a3 persistentIdentifier:(id)a4 mediaType:(id)a5
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  unint64_t v12 = v11;
  if (v9 | v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFMediaItemState.m", 60, @"Invalid parameter not satisfying: %@", @"itemName || persistentIdentifier" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"WFMediaItemState.m", 61, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)WFMediaItemDescriptor;
  uint64_t v13 = [(MTLModel *)&v24 init];
  if (v13)
  {
    uint64_t v14 = [(id)v9 copy];
    itemName = v13->_itemName;
    v13->_itemName = (NSString *)v14;

    uint64_t v16 = [(id)v10 copy];
    persistentIdentifier = v13->_persistentIdentifier;
    v13->_persistentIdentifier = (NSNumber *)v16;

    uint64_t v18 = [v12 copy];
    type = v13->_type;
    v13->_type = (NSString *)v18;

    objc_super v20 = v13;
  }

  return v13;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "mtl_identityPropertyMapWithModel:", a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)intentJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_212_52175 reverseBlock:&__block_literal_global_217];
}

id __46__WFMediaItemDescriptor_intentJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [a2 _JSONDictionaryRepresentation];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:0 error:0];

  return v4;
}

id __46__WFMediaItemDescriptor_intentJSONTransformer__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a2 options:0 error:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F305C8]);
  [v3 _updateWithJSONDictionary:v2];

  return v3;
}

+ (id)playbackArchiveDataJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_52179 reverseBlock:&__block_literal_global_210_52180];
}

uint64_t __59__WFMediaItemDescriptor_playbackArchiveDataJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

id __59__WFMediaItemDescriptor_playbackArchiveDataJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithBase64EncodedString:v3 options:0];

  return v4;
}

@end