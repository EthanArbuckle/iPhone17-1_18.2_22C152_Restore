@interface NMSAudiobookReferenceObject
- (BOOL)isEqual:(id)a3;
- (NMSAudiobookReferenceObject)initWithAudiobookIdentifier:(id)a3 downloadLimit:(unint64_t)a4;
- (NSNumber)audiobookIdentifier;
- (id)audiobookMediaItem;
- (id)description;
- (unint64_t)downloadLimit;
- (void)setDownloadLimit:(unint64_t)a3;
@end

@implementation NMSAudiobookReferenceObject

- (NMSAudiobookReferenceObject)initWithAudiobookIdentifier:(id)a3 downloadLimit:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSAudiobookReferenceObject;
  v8 = [(NMSAudiobookReferenceObject *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audiobookIdentifier, a3);
    v9->_downloadLimit = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NMSAudiobookReferenceObject *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(NMSAudiobookReferenceObject *)self audiobookIdentifier];
    v8 = [(NMSAudiobookReferenceObject *)v6 audiobookIdentifier];
    if ([v7 isEqual:v8])
    {
      unint64_t v9 = [(NMSAudiobookReferenceObject *)self downloadLimit];
      BOOL v10 = v9 == [(NMSAudiobookReferenceObject *)v6 downloadLimit];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)audiobookMediaItem
{
  v3 = [MEMORY[0x263F11E68] audiobooksQuery];
  v4 = (void *)MEMORY[0x263F11E60];
  v5 = [(NMSAudiobookReferenceObject *)self audiobookIdentifier];
  v6 = [v4 predicateWithValue:v5 forProperty:*MEMORY[0x263F113D8]];

  [v3 addFilterPredicate:v6];
  id v7 = [v3 items];
  v8 = [v7 firstObject];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NMSAudiobookReferenceObject;
  v4 = [(NMSAudiobookReferenceObject *)&v8 description];
  v5 = [(NMSAudiobookReferenceObject *)self audiobookIdentifier];
  v6 = [v3 stringWithFormat:@"<%@ - identifier: %@ - downloadInfo: %lu>", v4, v5, -[NMSAudiobookReferenceObject downloadLimit](self, "downloadLimit")];

  return v6;
}

- (NSNumber)audiobookIdentifier
{
  return self->_audiobookIdentifier;
}

- (unint64_t)downloadLimit
{
  return self->_downloadLimit;
}

- (void)setDownloadLimit:(unint64_t)a3
{
  self->_downloadLimit = a3;
}

- (void).cxx_destruct
{
}

@end