@interface PUSlideshowMediaItem
+ (id)mediaItemForType:(int64_t)a3 uniqueIdentifier:(id)a4;
+ (id)mediaItemsForOKThemes;
- (BOOL)isEqual:(id)a3;
- (NSString)localizedName;
- (NSString)uniqueIdentifier;
- (NSURL)audioURL;
- (PUSlideshowMediaItem)init;
- (id)_initWithType:(int64_t)a3;
- (id)initWitMediaItem:(id)a3;
- (id)initWitPreset:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation PUSlideshowMediaItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preset, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)localizedName
{
  int64_t type = self->_type;
  if (type == 2)
  {
    v3 = [(OKProducerPreset *)self->_preset localizedName];
  }
  else if (type == 1)
  {
    v3 = [(MPMediaItem *)self->_mediaItem title];
  }
  else if (type)
  {
    v3 = 0;
  }
  else
  {
    v3 = PULocalizedString(@"SLIDESHOW_SETTINGS_MUSIC_NONE");
  }
  return (NSString *)v3;
}

- (NSString)uniqueIdentifier
{
  int64_t type = self->_type;
  if (type == 2)
  {
    v3 = [(OKProducerPreset *)self->_preset uniqueIdentifier];
  }
  else if (type == 1)
  {
    v4 = NSString;
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPMediaItem persistentID](self->_mediaItem, "persistentID"));
    v3 = [v4 stringWithFormat:@"%@", v5];
  }
  else if (type)
  {
    v3 = 0;
  }
  else
  {
    v3 = @"PUSlideshowMediaItemNoneUniqueIdentifier";
  }
  return (NSString *)v3;
}

- (NSURL)audioURL
{
  int64_t type = self->_type;
  if (type == 1)
  {
    v4 = [(MPMediaItem *)self->_mediaItem assetURL];
  }
  else if (type == 2)
  {
    v3 = [(OKProducerPreset *)self->_preset audioURLs];
    v4 = [v3 firstObject];
  }
  else
  {
    v4 = 0;
  }
  return (NSURL *)v4;
}

- (unint64_t)hash
{
  v3 = [(PUSlideshowMediaItem *)self audioURL];
  uint64_t v4 = [v3 hash];

  v5 = [(PUSlideshowMediaItem *)self uniqueIdentifier];
  uint64_t v6 = [v5 hash] ^ (1739761 * v4);

  v7 = [(PUSlideshowMediaItem *)self localizedName];
  unint64_t v8 = [v7 hash] ^ (1319 * v6);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    unint64_t v8 = [(PUSlideshowMediaItem *)self audioURL];
    v9 = [v7 audioURL];
    if (v8 == v9
      || ([(PUSlideshowMediaItem *)self audioURL],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v7 audioURL],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v11 = [(PUSlideshowMediaItem *)self uniqueIdentifier];
      v12 = [v7 uniqueIdentifier];
      if ([v11 isEqualToString:v12])
      {
        v13 = [(PUSlideshowMediaItem *)self localizedName];
        [v7 localizedName];
        v17 = v4;
        v15 = v14 = v3;
        char v10 = [v13 isEqualToString:v15];

        v3 = v14;
        uint64_t v4 = v17;
      }
      else
      {
        char v10 = 0;
      }

      if (v8 == v9) {
        goto LABEL_11;
      }
    }
    else
    {
      char v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  char v10 = 0;
LABEL_12:

  return v10;
}

- (id)initWitMediaItem:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUSlideshowMediaItem.m", 104, @"Invalid parameter not satisfying: %@", @"mediaItem" object file lineNumber description];
  }
  id v7 = [(PUSlideshowMediaItem *)self _initWithType:1];
  unint64_t v8 = v7;
  if (v7) {
    objc_storeStrong(v7 + 1, a3);
  }

  return v8;
}

- (id)initWitPreset:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUSlideshowMediaItem.m", 95, @"Invalid parameter not satisfying: %@", @"preset" object file lineNumber description];
  }
  id v7 = [(PUSlideshowMediaItem *)self _initWithType:2];
  unint64_t v8 = v7;
  if (v7) {
    objc_storeStrong(v7 + 2, a3);
  }

  return v8;
}

- (PUSlideshowMediaItem)init
{
  return (PUSlideshowMediaItem *)[(PUSlideshowMediaItem *)self _initWithType:0];
}

- (id)_initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowMediaItem;
  id result = [(PUSlideshowMediaItem *)&v5 init];
  if (result) {
    *((void *)result + 3) = a3;
  }
  return result;
}

+ (id)mediaItemForType:(int64_t)a3 uniqueIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!v5)
  {
LABEL_7:
    id v7 = 0;
    goto LABEL_16;
  }
  if (a3 == 2)
  {
    unint64_t v8 = [getOKProducerPresetsManagerClass() defaultManager];
    v9 = [v8 presetForUniqueIdentifier:v6];

    if (v9) {
      id v7 = [[PUSlideshowMediaItem alloc] initWitPreset:v9];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (a3 != 1)
    {
      if (!a3 && [v5 isEqualToString:@"PUSlideshowMediaItemNoneUniqueIdentifier"])
      {
        id v7 = objc_alloc_init(PUSlideshowMediaItem);
        goto LABEL_16;
      }
      goto LABEL_7;
    }
    v9 = [MEMORY[0x1E4F31968] predicateWithValue:v5 forProperty:*MEMORY[0x1E4F31430]];
    id v10 = objc_alloc_init(MEMORY[0x1E4F31970]);
    [v10 addFilterPredicate:v9];
    v11 = [v10 items];
    v12 = [v11 firstObject];

    if (v12) {
      id v7 = [[PUSlideshowMediaItem alloc] initWitMediaItem:v12];
    }
    else {
      id v7 = 0;
    }
  }
LABEL_16:

  return v7;
}

+ (id)mediaItemsForOKThemes
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [getOKProducerPresetsManagerClass() defaultManager];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v3 = (void *)getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr;
  uint64_t v29 = getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr;
  if (!getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_block_invoke;
    v24 = &unk_1E5F2E228;
    v25 = &v26;
    uint64_t v4 = SlideshowKitLibrary();
    v27[3] = (uint64_t)dlsym(v4, "kOKProducerPresetsFamilyPhotosPhone");
    getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr = *(void *)(v25[1] + 24);
    v3 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"NSString *getkOKProducerPresetsFamilyPhotosPhone(void)"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"PUSlideshowMediaItem.m", 20, @"%s", dlerror());

    __break(1u);
  }
  id v5 = [v2 presetsForFamily:*v3];

  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
  id v7 = objc_alloc_init(PUSlideshowMediaItem);
  [v6 addObject:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [[PUSlideshowMediaItem alloc] initWitPreset:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v30 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];
  return v13;
}

@end