@interface VUIMPSeasonMediaCollection
- (VUIMPSeasonMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7;
- (VUIMPSeasonMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 requestedProperties:(id)a5;
@end

@implementation VUIMPSeasonMediaCollection

- (VUIMPSeasonMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 requestedProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_7:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaItemCollection" format];
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  if (!v9) {
    goto LABEL_7;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_8:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"requestedProperties" format];
LABEL_4:
  v11 = [v9 representativeItem];
  v12 = +[VUIMPSeasonMediaCollectionIdentifier seasonIdentifierWithMediaItem:v11];
  if (v12)
  {
    v13 = VUIMPSeasonMediaCollectionKind();
    v17.receiver = self;
    v17.super_class = (Class)VUIMPSeasonMediaCollection;
    v14 = [(VUIMPMediaCollection *)&v17 initWithMediaLibrary:v8 mediaItemCollection:v9 identifier:v12 requestedProperties:v10 kind:v13];

    self = v14;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VUIMPSeasonMediaCollection)initWithMediaLibrary:(id)a3 mediaItemCollection:(id)a4 identifier:(id)a5 requestedProperties:(id)a6 kind:(id)a7
{
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3C8];
  id v10 = NSStringFromSelector(a2);
  [v8 raise:v9, @"The %@ initializer is not available.", v10 format];

  return 0;
}

@end