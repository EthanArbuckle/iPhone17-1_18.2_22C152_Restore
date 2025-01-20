@interface NESportsEventLinkPresentationSource
+ (id)iconItemProviderForSportsEvent:(id)a3 tagImageProvider:(id)a4;
+ (id)imageItemProviderForSportsEvent:(id)a3 tagImageProvider:(id)a4;
+ (id)titleFromSportsEvent:(id)a3;
+ (id)urlFromSportsEvent:(id)a3;
- (LPLinkMetadata)linkMetadata;
- (NESportsEventLinkPresentationSource)initWithSportsEvent:(id)a3 tagImageProvider:(id)a4;
- (NESportsEventLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 sportsEvent:(id)a5 tagImageProvider:(id)a6;
- (NSItemProvider)linkPresentationIconProvider;
- (NSItemProvider)linkPresentationImageProvider;
- (NSString)title;
- (NSURL)url;
@end

@implementation NESportsEventLinkPresentationSource

- (NESportsEventLinkPresentationSource)initWithSportsEvent:(id)a3 tagImageProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NESportsEventLinkPresentationSource titleFromSportsEvent:v7];
  v9 = +[NESportsEventLinkPresentationSource urlFromSportsEvent:v7];
  v10 = [(NESportsEventLinkPresentationSource *)self initWithTitle:v8 url:v9 sportsEvent:v7 tagImageProvider:v6];

  return v10;
}

- (NESportsEventLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 sportsEvent:(id)a5 tagImageProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)NESportsEventLinkPresentationSource;
  v15 = [(NESportsEventLinkPresentationSource *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_url, a4);
    uint64_t v17 = +[NESportsEventLinkPresentationSource imageItemProviderForSportsEvent:v13 tagImageProvider:v14];
    linkPresentationImageProvider = v16->_linkPresentationImageProvider;
    v16->_linkPresentationImageProvider = (NSItemProvider *)v17;

    uint64_t v19 = +[NESportsEventLinkPresentationSource iconItemProviderForSportsEvent:v13 tagImageProvider:v14];
    linkPresentationIconProvider = v16->_linkPresentationIconProvider;
    v16->_linkPresentationIconProvider = (NSItemProvider *)v19;
  }
  return v16;
}

- (LPLinkMetadata)linkMetadata
{
  v3 = [NELinkMetadataSource alloc];
  v4 = [(NESportsEventLinkPresentationSource *)self title];
  v5 = [(NESportsEventLinkPresentationSource *)self url];
  id v6 = [(NESportsEventLinkPresentationSource *)self linkPresentationImageProvider];
  id v7 = [(NESportsEventLinkPresentationSource *)self linkPresentationIconProvider];
  v8 = [(NELinkMetadataSource *)v3 initWithTitle:v4 url:v5 imageProvider:v6 iconProvider:v7];

  v9 = [(NELinkMetadataSource *)v8 linkMetadata];

  return (LPLinkMetadata *)v9;
}

+ (id)titleFromSportsEvent:(id)a3
{
  return (id)[a3 name];
}

+ (id)urlFromSportsEvent:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [a3 identifier];
  v5 = objc_msgSend(v3, "nss_NewsURLForTagID:", v4);

  return v5;
}

+ (id)imageItemProviderForSportsEvent:(id)a3 tagImageProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v8 = [(id)*MEMORY[0x1E4F44460] identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__NESportsEventLinkPresentationSource_imageItemProviderForSportsEvent_tagImageProvider___block_invoke;
  v12[3] = &unk_1E64158F0;
  id v13 = v6;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v7 registerItemForTypeIdentifier:v8 loadHandler:v12];

  return v7;
}

void __88__NESportsEventLinkPresentationSource_imageItemProviderForSportsEvent_tagImageProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__NESportsEventLinkPresentationSource_imageItemProviderForSportsEvent_tagImageProvider___block_invoke_2;
  v7[3] = &unk_1E64158C8;
  id v8 = v3;
  id v6 = v3;
  objc_msgSend(v5, "createShareSportsEventImageFor:size:logoWidth:completion:", v4, v7, 260.0, 150.0, 67.0);
}

void __88__NESportsEventLinkPresentationSource_imageItemProviderForSportsEvent_tagImageProvider___block_invoke_2(uint64_t a1, UIImage *image)
{
  UIImagePNGRepresentation(image);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)iconItemProviderForSportsEvent:(id)a3 tagImageProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v8 = [(id)*MEMORY[0x1E4F44460] identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__NESportsEventLinkPresentationSource_iconItemProviderForSportsEvent_tagImageProvider___block_invoke;
  v12[3] = &unk_1E64158F0;
  id v13 = v6;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v7 registerItemForTypeIdentifier:v8 loadHandler:v12];

  return v7;
}

void __87__NESportsEventLinkPresentationSource_iconItemProviderForSportsEvent_tagImageProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__NESportsEventLinkPresentationSource_iconItemProviderForSportsEvent_tagImageProvider___block_invoke_2;
  v7[3] = &unk_1E64158C8;
  id v8 = v3;
  id v6 = v3;
  objc_msgSend(v5, "createShareSportsEventImageFor:size:logoWidth:completion:", v4, v7, 40.0, 40.0, 10.0);
}

void __87__NESportsEventLinkPresentationSource_iconItemProviderForSportsEvent_tagImageProvider___block_invoke_2(uint64_t a1, UIImage *image)
{
  UIImagePNGRepresentation(image);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)title
{
  return self->_title;
}

- (NSItemProvider)linkPresentationImageProvider
{
  return self->_linkPresentationImageProvider;
}

- (NSItemProvider)linkPresentationIconProvider
{
  return self->_linkPresentationIconProvider;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_linkPresentationIconProvider, 0);
  objc_storeStrong((id *)&self->_linkPresentationImageProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end