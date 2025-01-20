@interface BKAudiobookSupplementalContent
- (BKAudiobookSupplementalContent)initWithTitle:(id)a3 assetIdentifier:(id)a4;
- (BKLibraryAssetIdentifier)assetIdentifier;
- (NSString)title;
@end

@implementation BKAudiobookSupplementalContent

- (BKAudiobookSupplementalContent)initWithTitle:(id)a3 assetIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKAudiobookSupplementalContent;
  v8 = [(BKAudiobookSupplementalContent *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    v11 = (BKLibraryAssetIdentifier *)[v7 copy];
    assetIdentifier = v8->_assetIdentifier;
    v8->_assetIdentifier = v11;
  }
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (BKLibraryAssetIdentifier)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end