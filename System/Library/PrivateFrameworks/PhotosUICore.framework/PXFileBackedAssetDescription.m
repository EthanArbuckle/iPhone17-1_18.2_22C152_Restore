@interface PXFileBackedAssetDescription
+ (id)simpleImageDescriptionWithURL:(id)a3;
+ (id)simpleImageDescriptionWithURL:(id)a3 previewImage:(id)a4;
- (NSURL)url;
- (PXFileBackedAssetDescription)init;
- (PXFileBackedAssetDescription)initWithURL:(id)a3;
- (PXFileBackedAssetDescription)initWithURL:(id)a3 previewImage:(id)a4;
- (UIImage)previewImage;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation PXFileBackedAssetDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_descriptionDictionary, 0);
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_descriptionDictionary objectForKeyedSubscript:a3];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PXFileBackedAssetDescription;
  v3 = [(PXFileBackedAssetDescription *)&v7 description];
  v4 = [(PXFileBackedAssetDescription *)self url];
  v5 = [v3 stringByAppendingFormat:@" - URL: %@", v4];

  return v5;
}

- (PXFileBackedAssetDescription)initWithURL:(id)a3 previewImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXFileBackedAsset.m", 46, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PXFileBackedAssetDescription;
  v9 = [(PXFileBackedAssetDescription *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previewImage, a4);
    uint64_t v11 = [v7 copy];
    url = v10->_url;
    v10->_url = (NSURL *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    descriptionDictionary = v10->_descriptionDictionary;
    v10->_descriptionDictionary = v13;
  }
  return v10;
}

- (PXFileBackedAssetDescription)initWithURL:(id)a3
{
  return [(PXFileBackedAssetDescription *)self initWithURL:a3 previewImage:0];
}

- (PXFileBackedAssetDescription)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFileBackedAsset.m", 38, @"%s is not available as initializer", "-[PXFileBackedAssetDescription init]");

  abort();
}

+ (id)simpleImageDescriptionWithURL:(id)a3 previewImage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PXFileBackedAssetDescription alloc] initWithURL:v6 previewImage:v5];

  [(PXFileBackedAssetDescription *)v7 setObject:&unk_1F02D87A0 forKeyedSubscript:@"mediaType"];
  [(PXFileBackedAssetDescription *)v7 setObject:&unk_1F02D87B8 forKeyedSubscript:@"mediaSubtypes"];
  [(PXFileBackedAssetDescription *)v7 setObject:&unk_1F02D87A0 forKeyedSubscript:@"playbackStyle"];
  [(PXFileBackedAssetDescription *)v7 setObject:&unk_1F02D87D0 forKeyedSubscript:@"playbackVariation"];
  return v7;
}

+ (id)simpleImageDescriptionWithURL:(id)a3
{
  return (id)[a1 simpleImageDescriptionWithURL:a3 previewImage:0];
}

@end