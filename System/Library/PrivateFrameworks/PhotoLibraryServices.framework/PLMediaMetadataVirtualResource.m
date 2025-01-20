@interface PLMediaMetadataVirtualResource
- (PLMediaMetadataVirtualResource)initWithAsset:(id)a3 resourceType:(unsigned int)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 dataLength:(unint64_t)a7;
- (int64_t)dataLength;
- (int64_t)estimatedDataLength;
@end

@implementation PLMediaMetadataVirtualResource

- (int64_t)estimatedDataLength
{
  return self->_dataLength;
}

- (int64_t)dataLength
{
  return self->_dataLength;
}

- (PLMediaMetadataVirtualResource)initWithAsset:(id)a3 resourceType:(unsigned int)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 dataLength:(unint64_t)a7
{
  v11.receiver = self;
  v11.super_class = (Class)PLMediaMetadataVirtualResource;
  v8 = [(PLVirtualResource *)&v11 initWithAsset:a3 resourceType:*(void *)&a4 version:*(void *)&a5 recipeID:*(void *)&a6];
  if (v8)
  {
    v9 = +[PLUniformTypeIdentifier plistUniformTypeIdentifier];
    [(PLVirtualResource *)v8 setUniformTypeIdentifier:v9];

    v8->_dataLength = a7;
  }
  return v8;
}

@end