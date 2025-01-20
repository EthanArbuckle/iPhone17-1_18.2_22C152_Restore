@interface SUUIProductPageInformationViewController
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUIProductPageInformationViewController)initWithItem:(id)a3 clientContext:(id)a4;
- (SUUIProductPageInformationViewController)initWithProductInformation:(id)a3 clientContext:(id)a4;
- (SUUIProductPageItem)item;
- (id)_contentRatingResourceLoader;
- (id)_informationLinesWithItem:(id)a3 ratingImage:(id)a4;
- (id)_informationLinesWithProductInfo:(id)a3;
- (void)_updateLinesWithRatingImage:(id)a3;
- (void)contentRatingArtworkLoader:(id)a3 didLoadImage:(id)a4 forContentRating:(id)a5;
- (void)dealloc;
- (void)loadView;
- (void)setOperationQueue:(id)a3;
@end

@implementation SUUIProductPageInformationViewController

- (SUUIProductPageInformationViewController)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIProductPageInformationViewController;
  v9 = [(SUUIProductPageInformationViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_item, a3);
  }

  return v10;
}

- (SUUIProductPageInformationViewController)initWithProductInformation:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIProductPageInformationViewController;
  v9 = [(SUUIProductPageInformationViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_productInfo, a3);
  }

  return v10;
}

- (void)dealloc
{
  [(SUUIContentRatingArtworkResourceLoader *)self->_contentRatingArtworkLoader removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageInformationViewController;
  [(SUUIProductPageInformationViewController *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(SUUIProductInformationView);
  informationView = self->_informationView;
  self->_informationView = v3;

  v5 = self->_informationView;
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_TITLE" inTable:@"ProductPage"];
  }
  else {
  id v7 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_TITLE" inBundles:0 inTable:@"ProductPage"];
  }
  [(SUUIProductInformationView *)v5 setTitle:v7];

  id v8 = [(SUUIProductPageItem *)self->_item secondaryContentRatings];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    if (!self->_contentRatingArtworkLoader)
    {
      v10 = [(SUUIProductPageInformationViewController *)self _contentRatingResourceLoader];
      contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
      self->_contentRatingArtworkLoader = v10;

      [(SUUIContentRatingArtworkResourceLoader *)self->_contentRatingArtworkLoader addObserver:self];
    }
    objc_super v12 = [(SUUIProductPageItem *)self->_item secondaryContentRatings];
    v13 = [v12 lastObject];

    uint64_t v14 = [(SUUIContentRatingArtworkResourceLoader *)self->_contentRatingArtworkLoader cachedImageForContentRating:v13 withClientContext:self->_clientContext];
    if (!v14)
    {
      [(SUUIContentRatingArtworkResourceLoader *)self->_contentRatingArtworkLoader loadImageForContentRating:v13 clientContent:self->_clientContext reason:1];
      uint64_t v14 = [(SUUIContentRatingArtworkResourceLoader *)self->_contentRatingArtworkLoader placeholderImage];
    }
    id v15 = (id)v14;
  }
  else
  {
    id v15 = 0;
  }
  [(SUUIProductPageInformationViewController *)self _updateLinesWithRatingImage:v15];
  [(SUUIProductPageInformationViewController *)self setView:self->_informationView];
}

- (void)contentRatingArtworkLoader:(id)a3 didLoadImage:(id)a4 forContentRating:(id)a5
{
}

- (id)_contentRatingResourceLoader
{
  objc_super v3 = [SUUIResourceLoader alloc];
  v4 = [(SUUIProductPageInformationViewController *)self clientContext];
  v5 = [(SUUIResourceLoader *)v3 initWithClientContext:v4];

  v6 = [[SUUIContentRatingArtworkResourceLoader alloc] initWithArtworkLoader:v5];
  id v7 = +[SUUIStyledImageDataConsumer appIconConsumerWithSize:](SUUIStyledImageDataConsumer, "appIconConsumerWithSize:", 11.0, 11.0);
  [(SUUIContentRatingArtworkResourceLoader *)v6 setImageDataConsumer:v7];

  return v6;
}

- (id)_informationLinesWithItem:(id)a3 ratingImage:(id)a4
{
  v116[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [v6 artistName];
  uint64_t v10 = [v6 sellerName];
  objc_opt_class();
  unint64_t v11 = 0x263EFF000uLL;
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    clientContext = self->_clientContext;
    if (clientContext)
    {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_SELLER" inTable:@"ProductPage"];
    }
    else
    {
      id v19 = 0;
      +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_SELLER" inBundles:0 inTable:@"ProductPage"];
    v20 = };

    v116[0] = v20;
    v116[1] = v10;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:2];
    [v8 addObject:v21];

    v22 = self->_clientContext;
    if (v22)
    {
      [(SUUIClientContext *)v22 localizedStringForKey:@"PRODUCT_PAGE_INFO_DEVELOPER" inTable:@"ProductPage"];
    }
    else
    {
      id v23 = 0;
      +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_DEVELOPER" inBundles:0 inTable:@"ProductPage"];
    v16 = };

    v115 = v16;
    v17 = &v115;
    uint64_t v18 = v9;
    unint64_t v11 = 0x263EFF000;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = self->_clientContext;
      if (v13)
      {
        [(SUUIClientContext *)v13 localizedStringForKey:@"PRODUCT_PAGE_INFO_SELLER" inTable:@"ProductPage"];
      }
      else
      {
        id v15 = 0;
        +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_SELLER" inBundles:0 inTable:@"ProductPage"];
      v16 = };

      v114 = v16;
      v17 = &v114;
      uint64_t v18 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      uint64_t v14 = self->_clientContext;
      if (v14)
      {
        [(SUUIClientContext *)v14 localizedStringForKey:@"PRODUCT_PAGE_INFO_SELLER" inTable:@"ProductPage"];
      }
      else
      {
        id v24 = 0;
        +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_SELLER" inBundles:0 inTable:@"ProductPage"];
      v16 = };

      v113 = v16;
      v17 = &v113;
      uint64_t v18 = v9;
    }
  }
  v17[1] = (void *)v18;
  v25 = objc_msgSend(*(id *)(v11 + 2240), "arrayWithObjects:count:");
  [v8 addObject:v25];

LABEL_21:
  v26 = [v6 categoryName];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = self->_clientContext;
    if (v27)
    {
      [(SUUIClientContext *)v27 localizedStringForKey:@"PRODUCT_PAGE_INFO_CATEGORY" inTable:@"ProductPage"];
    }
    else
    {
      id v28 = 0;
      +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_CATEGORY" inBundles:0 inTable:@"ProductPage"];
    v29 = };

    v112[0] = v29;
    v112[1] = v26;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v112 count:2];
    [v8 addObject:v30];
  }
  v98 = (void *)v10;
  if ([(SUUIItem *)self->_item itemKind] == 17)
  {
    v31 = v26;
  }
  else
  {
    v31 = [(SUUIProductPageItem *)self->_item lastUpdateDateString];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = self->_clientContext;
      if (v32)
      {
        [(SUUIClientContext *)v32 localizedStringForKey:@"PRODUCT_PAGE_INFO_UPDATED" inTable:@"ProductPage"];
      }
      else
      {
        id v33 = 0;
        +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_UPDATED" inBundles:0 inTable:@"ProductPage"];
      v34 = };

      v111[0] = v34;
      v111[1] = v31;
      v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:2];
      [v8 addObject:v35];
    }
  }
  v36 = [(SUUIItem *)self->_item versionString];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = self->_clientContext;
    if (v37)
    {
      [(SUUIClientContext *)v37 localizedStringForKey:@"PRODUCT_PAGE_INFO_VERSION" inTable:@"ProductPage"];
    }
    else
    {
      id v38 = 0;
      +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_VERSION" inBundles:0 inTable:@"ProductPage"];
    v39 = };

    v110[0] = v39;
    v110[1] = v36;
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:2];
    [v8 addObject:v40];
  }
  v99 = (void *)v9;
  if ([v6 itemKind] == 17)
  {
    v41 = [v6 childItemIdentifiers];
    uint64_t v42 = [v41 count];

    if (v42 < 2)
    {
      v97 = v36;
      goto LABEL_53;
    }
    id v43 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v43 setNumberStyle:1];
    v44 = [NSNumber numberWithInteger:v42];
    uint64_t v47 = [v43 stringFromNumber:v44];

    v45 = self->_clientContext;
    if (v45)
    {
      [(SUUIClientContext *)v45 localizedStringForKey:@"PRODUCT_PAGE_INFO_BUNDLE_APP_COUNT" inTable:@"ProductPage"];
    }
    else
    {
      id v50 = 0;
      +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_BUNDLE_APP_COUNT" inBundles:0 inTable:@"ProductPage"];
    v51 = };

    v108[0] = v51;
    v108[1] = v47;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:2];
    [v8 addObject:v52];
  }
  else
  {
    v46 = [v6 primaryItemOffer];
    uint64_t v47 = [v46 fileSizeText];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      v97 = (void *)v47;
      goto LABEL_53;
    }
    v49 = self->_clientContext;
    if (v49)
    {
      [(SUUIClientContext *)v49 localizedStringForKey:@"PRODUCT_PAGE_INFO_SIZE" inTable:@"ProductPage"];
    }
    else
    {
      id v53 = 0;
      +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_SIZE" inBundles:0 inTable:@"ProductPage"];
    }
    id v43 = (id)objc_claimAutoreleasedReturnValue();

    v109[0] = v43;
    v109[1] = v47;
    v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:2];
    [v8 addObject:v51];
  }
  v97 = (void *)v47;

LABEL_53:
  v54 = [v6 contentRating];
  v55 = [v54 contentRatingName];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_104;
  }
  id v92 = v7;
  uint64_t v57 = [v6 ageBandRange];
  if (v57 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v96 = 0;
    v94 = 0;
  }
  else
  {
    uint64_t v58 = v56;
    id v59 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v59 setNumberStyle:1];
    [v59 setUsesGroupingSeparator:0];
    v60 = [NSNumber numberWithUnsignedInteger:v57];
    v94 = [v59 stringFromNumber:v60];

    v61 = [NSNumber numberWithUnsignedInteger:v57 + v58];
    v96 = [v59 stringFromNumber:v61];
  }
  v95 = [v54 contentRatingAdvisories];
  v62 = self->_clientContext;
  if (v62)
  {
    [(SUUIClientContext *)v62 localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING" inTable:@"ProductPage"];
  }
  else
  {
    id v63 = 0;
    +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING" inBundles:0 inTable:@"ProductPage"];
  uint64_t v93 = };

  if ([v95 count])
  {
    id v64 = objc_alloc_init(MEMORY[0x263F089D8]);
    if (v57 || !v96)
    {
      v67 = self->_clientContext;
      if (v94 && v96)
      {
        if (v67) {
          [(SUUIClientContext *)v67 localizedStringForKey:@"PRODUCT_PAGE_INFO_RATED_FOR_WITH_AGE_BAND" inTable:@"ProductPage"];
        }
        else {
        v69 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_RATED_FOR_WITH_AGE_BAND" inBundles:0 inTable:@"ProductPage"];
        }
        [NSString stringWithValidatedFormat:v69, @"%@%@%@", 0, v94, v96, v55 validFormatSpecifiers error];
      }
      else
      {
        if (v67) {
          [(SUUIClientContext *)v67 localizedStringForKey:@"PRODUCT_PAGE_INFO_RATED_FOR" inTable:@"ProductPage"];
        }
        else {
        v69 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_RATED_FOR" inBundles:0 inTable:@"ProductPage"];
        }
        [NSString stringWithValidatedFormat:v69, @"%@", 0, v55, v90, v91 validFormatSpecifiers error];
      }
    }
    else
    {
      v65 = self->_clientContext;
      if (v65) {
        [(SUUIClientContext *)v65 localizedStringForKey:@"PRODUCT_PAGE_INFO_RATED_FOR_WITH_AGE_MINIMUM" inTable:@"ProductPage"];
      }
      else {
      v69 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_RATED_FOR_WITH_AGE_MINIMUM" inBundles:0 inTable:@"ProductPage"];
      }
      [NSString stringWithValidatedFormat:v69, @"%@%@", 0, v96, v55, v91 validFormatSpecifiers error];
    v71 = };
    [v64 appendString:v71];

    v72 = self->_clientContext;
    if (v72)
    {
      [(SUUIClientContext *)v72 localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING_ADVISORY" inTable:@"ProductPage"];
    }
    else
    {
      id v73 = 0;
      +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING_ADVISORY" inBundles:0 inTable:@"ProductPage"];
    v74 = };
    id v7 = v92;

    v100[0] = MEMORY[0x263EF8330];
    v100[1] = 3221225472;
    v100[2] = __82__SUUIProductPageInformationViewController__informationLinesWithItem_ratingImage___block_invoke;
    v100[3] = &unk_2654061A8;
    id v75 = v64;
    id v101 = v75;
    id v76 = v74;
    id v102 = v76;
    [v95 enumerateObjectsUsingBlock:v100];
    v105[0] = v93;
    v105[1] = v75;
    v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:2];
    [v8 addObject:v77];

    if (v92)
    {
      v104[0] = &stru_2704F8130;
      v104[1] = &stru_2704F8130;
      v104[2] = v92;
      v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:3];
      [v8 addObject:v78];
    }
    v79 = (void *)v93;
    goto LABEL_103;
  }
  if (v57 || !v96)
  {
    if (!v94)
    {
      id v7 = v92;
      goto LABEL_97;
    }
    id v7 = v92;
    if (!v96) {
      goto LABEL_97;
    }
    v68 = self->_clientContext;
    if (v68) {
      [(SUUIClientContext *)v68 localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING_WITH_AGE_BAND" inTable:@"ProductPage"];
    }
    else {
    v70 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING_WITH_AGE_BAND" inBundles:0 inTable:@"ProductPage"];
    }
    [NSString stringWithValidatedFormat:v70, @"%@%@%@", 0, v55, v94, v96 validFormatSpecifiers error];
  }
  else
  {
    v66 = self->_clientContext;
    if (v66) {
      [(SUUIClientContext *)v66 localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING_WITH_AGE_MINIMUM" inTable:@"ProductPage"];
    }
    else {
    v70 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING_WITH_AGE_MINIMUM" inBundles:0 inTable:@"ProductPage"];
    }
    id v7 = v92;
    [NSString stringWithValidatedFormat:v70, @"%@%@", 0, v55, v96, v91 validFormatSpecifiers error];
  uint64_t v80 = };

  v55 = (void *)v80;
LABEL_97:
  if (v7)
  {
    v81 = self->_clientContext;
    if (v81) {
      [(SUUIClientContext *)v81 localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING_WITH_SECONDARY_TYPE" inTable:@"ProductPage"];
    }
    else {
    id v75 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_RATING_WITH_SECONDARY_TYPE" inBundles:0 inTable:@"ProductPage"];
    }
    uint64_t v82 = [NSString stringWithValidatedFormat:v75, @"%@", 0, v55 validFormatSpecifiers error];

    v107[0] = v93;
    v107[1] = v82;
    v107[2] = v7;
    v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:3];
    [v8 addObject:v83];

    v79 = (void *)v93;
    v55 = (void *)v82;
  }
  else
  {
    v79 = (void *)v93;
    v106[0] = v93;
    v106[1] = v55;
    id v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:v106 count:2];
    [v8 addObject:v75];
  }
LABEL_103:

LABEL_104:
  v84 = [v6 installationRequirementsDescription];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v85 = self->_clientContext;
    if (v85)
    {
      [(SUUIClientContext *)v85 localizedStringForKey:@"PRODUCT_PAGE_INFO_REQUIRES" inTable:@"ProductPage"];
    }
    else
    {
      id v86 = 0;
      +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_INFO_REQUIRES" inBundles:0 inTable:@"ProductPage"];
    v87 = };

    v103[0] = v87;
    v103[1] = v84;
    v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:2];
    [v8 addObject:v88];
  }
  return v8;
}

void __82__SUUIProductPageInformationViewController__informationLinesWithItem_ratingImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  v5 = *(void **)(a1 + 32);
  id v6 = [NSString stringWithValidatedFormat:*(void *)(a1 + 40), @"%@", 0, v7 validFormatSpecifiers error];
  [v5 appendString:v6];
}

- (id)_informationLinesWithProductInfo:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__SUUIProductPageInformationViewController__informationLinesWithProductInfo___block_invoke;
  v8[3] = &unk_265408C60;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateEntriesWithBlock:v8];

  return v6;
}

void __77__SUUIProductPageInformationViewController__informationLinesWithProductInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)objc_msgSend([v5 alloc], "initWithObjects:", v7, v6, 0);

  [*(id *)(a1 + 32) addObject:v8];
}

- (void)_updateLinesWithRatingImage:(id)a3
{
  productInfo = self->_productInfo;
  if (productInfo) {
    -[SUUIProductPageInformationViewController _informationLinesWithProductInfo:](self, "_informationLinesWithProductInfo:", productInfo, a3);
  }
  else {
  id v6 = [(SUUIProductPageInformationViewController *)self _informationLinesWithItem:self->_item ratingImage:a3];
  }
  [(SUUIProductInformationView *)self->_informationView setInformationLines:v6];
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIProductPageItem)item
{
  return self->_item;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_informationView, 0);
  objc_storeStrong((id *)&self->_contentRatingArtworkLoader, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end