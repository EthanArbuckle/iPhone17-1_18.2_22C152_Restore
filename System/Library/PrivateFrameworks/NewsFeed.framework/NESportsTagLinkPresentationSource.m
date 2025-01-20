@interface NESportsTagLinkPresentationSource
+ (id)iconItemProviderForSportsTag:(id)a3 tagImageProvider:(id)a4;
+ (id)imageItemProviderForSportsTag:(id)a3 tagImageProvider:(id)a4;
- (FCSportsProviding)sportsTag;
- (LPLinkMetadata)linkMetadata;
- (NESportsTagLinkPresentationSource)initWithSportsTag:(id)a3 tagImageProvider:(id)a4;
- (NESportsTagLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 sportsTag:(id)a5 tagImageProvider:(id)a6;
- (NETagImageShareAttributeProviderType)tagImageProvider;
- (NSString)title;
- (NSURL)url;
@end

@implementation NESportsTagLinkPresentationSource

- (NESportsTagLinkPresentationSource)initWithSportsTag:(id)a3 tagImageProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 name];
  v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = [v7 identifier];
  v11 = objc_msgSend(v9, "nss_NewsURLForTagID:", v10);
  v12 = [(NESportsTagLinkPresentationSource *)self initWithTitle:v8 url:v11 sportsTag:v7 tagImageProvider:v6];

  return v12;
}

- (NESportsTagLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 sportsTag:(id)a5 tagImageProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NESportsTagLinkPresentationSource;
  v15 = [(NESportsTagLinkPresentationSource *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sportsTag, a5);
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v16->_url, a4);
    objc_storeStrong((id *)&v16->_tagImageProvider, a6);
  }

  return v16;
}

- (LPLinkMetadata)linkMetadata
{
  v3 = [(NESportsTagLinkPresentationSource *)self title];
  v4 = [(NESportsTagLinkPresentationSource *)self url];
  v5 = [(NESportsTagLinkPresentationSource *)self sportsTag];
  int v6 = [v5 isMySports];

  id v7 = [NELinkMetadataSource alloc];
  if (v6)
  {
    v8 = [(NESportsTagLinkPresentationSource *)self tagImageProvider];
    v9 = [(NESportsTagLinkPresentationSource *)self sportsTag];
    v10 = [v8 mySportsShareImageFor:v9];
    id v11 = [(NELinkMetadataSource *)v7 initWithTitle:v3 url:v4 image:v10];
  }
  else
  {
    v8 = [(NESportsTagLinkPresentationSource *)self sportsTag];
    v9 = [(NESportsTagLinkPresentationSource *)self tagImageProvider];
    v10 = +[NESportsTagLinkPresentationSource imageItemProviderForSportsTag:v8 tagImageProvider:v9];
    id v12 = [(NESportsTagLinkPresentationSource *)self sportsTag];
    id v13 = [(NESportsTagLinkPresentationSource *)self tagImageProvider];
    id v14 = +[NESportsTagLinkPresentationSource iconItemProviderForSportsTag:v12 tagImageProvider:v13];
    id v11 = [(NELinkMetadataSource *)v7 initWithTitle:v3 url:v4 imageProvider:v10 iconProvider:v14];
  }
  v15 = [(NELinkMetadataSource *)v11 linkMetadata];

  return (LPLinkMetadata *)v15;
}

+ (id)imageItemProviderForSportsTag:(id)a3 tagImageProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v8 = [(id)*MEMORY[0x1E4F44460] identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__NESportsTagLinkPresentationSource_imageItemProviderForSportsTag_tagImageProvider___block_invoke;
  v12[3] = &unk_1E64158F0;
  id v13 = v6;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v7 registerItemForTypeIdentifier:v8 loadHandler:v12];

  return v7;
}

void __84__NESportsTagLinkPresentationSource_imageItemProviderForSportsTag_tagImageProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__NESportsTagLinkPresentationSource_imageItemProviderForSportsTag_tagImageProvider___block_invoke_2;
  v7[3] = &unk_1E64158C8;
  id v8 = v3;
  id v6 = v3;
  [v5 createSportsShareImageFor:v4 completion:v7];
}

void __84__NESportsTagLinkPresentationSource_imageItemProviderForSportsTag_tagImageProvider___block_invoke_2(uint64_t a1, UIImage *image)
{
  UIImagePNGRepresentation(image);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)iconItemProviderForSportsTag:(id)a3 tagImageProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v8 = [(id)*MEMORY[0x1E4F44460] identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__NESportsTagLinkPresentationSource_iconItemProviderForSportsTag_tagImageProvider___block_invoke;
  v12[3] = &unk_1E64158F0;
  id v13 = v6;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v7 registerItemForTypeIdentifier:v8 loadHandler:v12];

  return v7;
}

void __83__NESportsTagLinkPresentationSource_iconItemProviderForSportsTag_tagImageProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__NESportsTagLinkPresentationSource_iconItemProviderForSportsTag_tagImageProvider___block_invoke_2;
  v7[3] = &unk_1E64158C8;
  id v8 = v3;
  id v6 = v3;
  [v5 createSportsShareImageFor:v4 completion:v7];
}

void __83__NESportsTagLinkPresentationSource_iconItemProviderForSportsTag_tagImageProvider___block_invoke_2(uint64_t a1, UIImage *image)
{
  UIImagePNGRepresentation(image);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FCSportsProviding)sportsTag
{
  return self->_sportsTag;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NETagImageShareAttributeProviderType)tagImageProvider
{
  return self->_tagImageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagImageProvider, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sportsTag, 0);
}

@end