@interface TPSConstellationContentParser
+ (id)inlineIconPlaceHolderImage;
- (BOOL)delegateRespondsToBoldFont;
- (BOOL)delegateRespondsToItalicFont;
- (BOOL)ignoreLinks;
- (BOOL)supportsLinks;
- (CGRect)boundsForImage:(id)a3 size:(CGSize)a4;
- (CGSize)normalizedSizeFromSize:(CGSize)a3 scale:(double)a4;
- (NSAttributedString)attributedString;
- (NSDictionary)defaultAttributes;
- (NSMutableDictionary)assetsSessionItemMap;
- (NSMutableDictionary)assetsTextAttachmentMap;
- (NSString)identifier;
- (NSString)language;
- (NSURL)assetsBaseURL;
- (OS_dispatch_queue)syncQueue;
- (TPSAssetFileInfoManager)assetFileInfoManager;
- (TPSConstellationContentParser)init;
- (TPSConstellationContentParserDelegate)delegate;
- (UIFont)boldFont;
- (UIFont)italicFont;
- (UITraitCollection)traitCollection;
- (double)scaledValueForSize:(double)a3;
- (id)_colorForSystemColorString:(id)a3;
- (id)accessibilityLabelFromAttribute:(id)a3;
- (id)attributedStringForConstellationContent:(id)a3 defaultAttributes:(id)a4 identifier:(id)a5 language:(id)a6 assetsBaseURL:(id)a7 assetFileInfoManager:(id)a8 supportsLinks:(BOOL)a9 error:(id *)a10;
- (id)attributedStringForContent:(id)a3 error:(id *)a4;
- (id)attributedStringForInlineIconNode:(id)a3;
- (id)attributedStringForParagraphNode:(id)a3 error:(id *)a4;
- (id)attributedStringForPersonalizedTextNode:(id)a3 error:(id *)a4;
- (id)attributedStringForSymbolNode:(id)a3;
- (id)attributedStringForTextNode:(id)a3;
- (id)attributesWithMarks:(id)a3;
- (int)numberOfParagraphTags;
- (int64_t)numOfActiveRemoteURLSessions;
- (void)cancelAssetFetches;
- (void)dealloc;
- (void)fetchAssetConfiguration:(id)a3 cacheIdentifier:(id)a4 textAttachment:(id)a5;
- (void)setAssetFileInfoManager:(id)a3;
- (void)setAssetsBaseURL:(id)a3;
- (void)setAssetsSessionItemMap:(id)a3;
- (void)setAssetsTextAttachmentMap:(id)a3;
- (void)setAttributedString:(id)a3;
- (void)setBoldFont:(id)a3;
- (void)setDefaultAttributes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateRespondsToBoldFont:(BOOL)a3;
- (void)setDelegateRespondsToItalicFont:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreLinks:(BOOL)a3;
- (void)setItalicFont:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setNumOfActiveRemoteURLSessions:(int64_t)a3;
- (void)setNumberOfParagraphTags:(int)a3;
- (void)setSupportsLinks:(BOOL)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation TPSConstellationContentParser

+ (id)inlineIconPlaceHolderImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__TPSConstellationContentParser_inlineIconPlaceHolderImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inlineIconPlaceHolderImage_predicate != -1) {
    dispatch_once(&inlineIconPlaceHolderImage_predicate, block);
  }
  v2 = (void *)inlineIconPlaceHolderImage_gInlineIconPlaceHolderImage;

  return v2;
}

void __59__TPSConstellationContentParser_inlineIconPlaceHolderImage__block_invoke()
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v0 = [MEMORY[0x263F827E8] imageNamed:@"InlineIconPlaceHolder" inBundle:v2 compatibleWithTraitCollection:0];
  v1 = (void *)inlineIconPlaceHolderImage_gInlineIconPlaceHolderImage;
  inlineIconPlaceHolderImage_gInlineIconPlaceHolderImage = v0;
}

- (void)dealloc
{
  [(TPSConstellationContentParser *)self cancelAssetFetches];
  v3.receiver = self;
  v3.super_class = (Class)TPSConstellationContentParser;
  [(TPSConstellationContentParser *)&v3 dealloc];
}

- (TPSConstellationContentParser)init
{
  v11.receiver = self;
  v11.super_class = (Class)TPSConstellationContentParser;
  id v2 = [(TPSConstellationContentParser *)&v11 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.tips.constellationContentParserQueue", v3);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    assetsSessionItemMap = v2->_assetsSessionItemMap;
    v2->_assetsSessionItemMap = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    assetsTextAttachmentMap = v2->_assetsTextAttachmentMap;
    v2->_assetsTextAttachmentMap = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    [(TPSConstellationContentParser *)self setDelegateRespondsToBoldFont:objc_opt_respondsToSelector() & 1];

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [(TPSConstellationContentParser *)self setDelegateRespondsToItalicFont:objc_opt_respondsToSelector() & 1];
  }
}

- (void)cancelAssetFetches
{
  objc_super v3 = [(TPSConstellationContentParser *)self assetsSessionItemMap];
  id v6 = (id)[v3 copy];

  dispatch_queue_t v4 = [(TPSConstellationContentParser *)self assetsSessionItemMap];
  [v4 removeAllObjects];

  id v5 = [(TPSConstellationContentParser *)self assetsTextAttachmentMap];
  [v5 removeAllObjects];

  [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global];
}

void __51__TPSConstellationContentParser_cancelAssetFetches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v3 = (void *)MEMORY[0x263F7F638];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  [v5 cancelSessionItem:v4];
}

- (UIFont)boldFont
{
  boldFont = self->_boldFont;
  if (!boldFont)
  {
    if ([(TPSConstellationContentParser *)self delegateRespondsToBoldFont])
    {
      id v4 = [(TPSConstellationContentParser *)self delegate];
      id v5 = [v4 constellationContentParserBoldFont:self];
      id v6 = self->_boldFont;
      self->_boldFont = v5;
    }
    boldFont = self->_boldFont;
    if (!boldFont)
    {
      v7 = [(TPSConstellationContentParser *)self defaultAttributes];
      uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F814F0]];
      v9 = self->_boldFont;
      self->_boldFont = v8;

      boldFont = self->_boldFont;
    }
  }

  return boldFont;
}

- (UIFont)italicFont
{
  italicFont = self->_italicFont;
  if (!italicFont)
  {
    if ([(TPSConstellationContentParser *)self delegateRespondsToItalicFont])
    {
      id v4 = [(TPSConstellationContentParser *)self delegate];
      id v5 = [v4 constellationContentParserItalicFont:self];
      id v6 = self->_italicFont;
      self->_italicFont = v5;
    }
    italicFont = self->_italicFont;
    if (!italicFont)
    {
      v7 = [(TPSConstellationContentParser *)self defaultAttributes];
      uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F814F0]];
      v9 = self->_italicFont;
      self->_italicFont = v8;

      italicFont = self->_italicFont;
    }
  }

  return italicFont;
}

- (int64_t)numOfActiveRemoteURLSessions
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  objc_super v3 = [(TPSConstellationContentParser *)self syncQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__TPSConstellationContentParser_numOfActiveRemoteURLSessions__block_invoke;
  v6[3] = &unk_2642B1EA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__TPSConstellationContentParser_numOfActiveRemoteURLSessions__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetsSessionItemMap];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)attributedStringForConstellationContent:(id)a3 defaultAttributes:(id)a4 identifier:(id)a5 language:(id)a6 assetsBaseURL:(id)a7 assetFileInfoManager:(id)a8 supportsLinks:(BOOL)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  [(TPSConstellationContentParser *)self setIdentifier:v18];
  [(TPSConstellationContentParser *)self setDefaultAttributes:v17];
  [(TPSConstellationContentParser *)self setNumberOfParagraphTags:0];
  [(TPSConstellationContentParser *)self setLanguage:v19];
  [(TPSConstellationContentParser *)self setAssetsBaseURL:v20];
  [(TPSConstellationContentParser *)self setAssetFileInfoManager:v21];
  [(TPSConstellationContentParser *)self setSupportsLinks:a9];
  v22 = [(TPSConstellationContentParser *)self attributedStringForContent:v16 error:a10];
  if ([(TPSConstellationContentParser *)self numberOfParagraphTags] >= 2)
  {
    id v23 = objc_alloc_init(MEMORY[0x263F81650]);
    [v23 setParagraphSpacing:12.0];
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x263F81540], v23, 0, objc_msgSend(v22, "length"));
  }
  objc_initWeak(&location, self);
  v24 = (void *)[v22 copy];
  v25 = [(TPSConstellationContentParser *)self syncQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __166__TPSConstellationContentParser_attributedStringForConstellationContent_defaultAttributes_identifier_language_assetsBaseURL_assetFileInfoManager_supportsLinks_error___block_invoke;
  block[3] = &unk_2642B1ED0;
  objc_copyWeak(&v30, &location);
  id v26 = v24;
  id v29 = v26;
  dispatch_async(v25, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v26;
}

void __166__TPSConstellationContentParser_attributedStringForConstellationContent_defaultAttributes_identifier_language_assetsBaseURL_assetFileInfoManager_supportsLinks_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAttributedString:*(void *)(a1 + 32)];
}

- (id)attributedStringForContent:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:&stru_26C7F3A90 attributes:0];
    [v7 beginEditing];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          switch(objc_msgSend(MEMORY[0x263F7F5D0], "contentTypeForContentDictionary:", v13, (void)v17))
          {
            case 0:
              uint64_t v14 = [(TPSConstellationContentParser *)self attributedStringForTextNode:v13];
              goto LABEL_13;
            case 1:
              uint64_t v14 = [(TPSConstellationContentParser *)self attributedStringForParagraphNode:v13 error:a4];
              goto LABEL_13;
            case 2:
              uint64_t v14 = [(TPSConstellationContentParser *)self attributedStringForSymbolNode:v13];
              goto LABEL_13;
            case 3:
              uint64_t v14 = [(TPSConstellationContentParser *)self attributedStringForInlineIconNode:v13];
              goto LABEL_13;
            case 4:
              uint64_t v14 = [(TPSConstellationContentParser *)self attributedStringForPersonalizedTextNode:v13 error:a4];
LABEL_13:
              v15 = (void *)v14;
              if (v14)
              {
                [v7 appendAttributedString:v14];
              }
              break;
            default:
              continue;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v7 endEditing];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)attributesWithMarks:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_22;
  }
  id v5 = [(TPSConstellationContentParser *)self defaultAttributes];
  id v6 = (void *)[v5 mutableCopy];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v26 = v4;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    uint64_t v11 = *MEMORY[0x263F81500];
    uint64_t v12 = *MEMORY[0x263F814F0];
    uint64_t v27 = *MEMORY[0x263F81520];
    id v28 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        switch([MEMORY[0x263F7F5D0] markTypeForMarkDictionary:v14])
        {
          case 0:
            if (!self->_ignoreLinks)
            {
              v15 = self;
              uint64_t v16 = v12;
              uint64_t v17 = v11;
              long long v18 = [MEMORY[0x263F7F5D0] hrefForLinkMark:v14];
              long long v19 = [NSURL URLWithString:v18];
              if (v19) {
                [v6 setObject:v19 forKey:v27];
              }

              uint64_t v11 = v17;
              uint64_t v12 = v16;
              self = v15;
              id v7 = v28;
              goto LABEL_17;
            }
            continue;
          case 1:
            uint64_t v20 = [(TPSConstellationContentParser *)self boldFont];
            goto LABEL_14;
          case 2:
            uint64_t v20 = [(TPSConstellationContentParser *)self italicFont];
LABEL_14:
            long long v18 = (void *)v20;
            id v21 = v6;
            uint64_t v22 = v18;
            uint64_t v23 = v12;
            goto LABEL_16;
          case 3:
            long long v18 = [MEMORY[0x263F825C8] labelColor];
            id v21 = v6;
            uint64_t v22 = v18;
            uint64_t v23 = v11;
LABEL_16:
            [v21 setObject:v22 forKey:v23];
LABEL_17:

            break;
          default:
            continue;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  id v4 = v26;
  if (v6)
  {
    v24 = (void *)[v6 copy];
  }
  else
  {
LABEL_22:
    v24 = [(TPSConstellationContentParser *)self defaultAttributes];
  }

  return v24;
}

- (id)attributedStringForTextNode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 TPSSafeArrayForKey:@"marks"];
  id v6 = [(TPSConstellationContentParser *)self attributesWithMarks:v5];
  if ([(TPSConstellationContentParser *)self supportsLinks]
    || ([v6 objectForKeyedSubscript:*MEMORY[0x263F81520]],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    uint64_t v9 = [MEMORY[0x263F7F5D0] textForContentNode:v4];
    if (v9) {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v9 attributes:v6];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)attributedStringForParagraphNode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(TPSConstellationContentParser *)self numberOfParagraphTags] < 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v8 = [(TPSConstellationContentParser *)self defaultAttributes];
    uint64_t v9 = (void *)[v7 initWithString:@"\n" attributes:v8];

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v9];
  }
  [(TPSConstellationContentParser *)self setNumberOfParagraphTags:[(TPSConstellationContentParser *)self numberOfParagraphTags] + 1];
  uint64_t v11 = [v6 TPSSafeArrayForKey:*MEMORY[0x263F7F6F8]];

  uint64_t v12 = [(TPSConstellationContentParser *)self attributedStringForContent:v11 error:a4];
  uint64_t v13 = v12;
  if (v12)
  {
    if (v10)
    {
      [v10 appendAttributedString:v12];
      id v14 = (id)[v10 copy];
    }
    else
    {
      id v14 = v12;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)attributedStringForSymbolNode:(id)a3
{
  id v4 = [a3 TPSSafeDictionaryForKey:*MEMORY[0x263F7F6F0]];
  id v5 = [v4 TPSSafeStringForKey:*MEMORY[0x263F7F6E8]];
  if (!v5)
  {
    uint64_t v9 = 0;
    goto LABEL_21;
  }
  id v6 = [v4 TPSSafeStringForKey:*MEMORY[0x263F7F6C0]];
  id v7 = v6;
  if (v6)
  {
    if ([v6 isEqualToString:*MEMORY[0x263F7F6D8]])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:*MEMORY[0x263F7F6D0]])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:*MEMORY[0x263F7F6C8]])
    {
      uint64_t v8 = -1;
    }
    else if ([v7 isEqualToString:*MEMORY[0x263F7F6E0]])
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 2;
  }
  uint64_t v10 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570] scale:v8];
  uint64_t v11 = [MEMORY[0x263F827E8] _systemImageNamed:v5 withConfiguration:v10];
  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = [v4 TPSSafeStringForKey:*MEMORY[0x263F7F690]];
  if (![v13 isEqualToString:*MEMORY[0x263F7F698]])
  {
    id v14 = [(TPSConstellationContentParser *)self _colorForSystemColorString:v13];
    uint64_t v15 = [v12 imageWithTintColor:v14 renderingMode:1];

    uint64_t v12 = (void *)v15;
    if (v15) {
      goto LABEL_18;
    }
LABEL_19:
    uint64_t v9 = 0;
    goto LABEL_20;
  }

LABEL_18:
  uint64_t v16 = [MEMORY[0x263F81678] textAttachmentWithImage:v12];
  uint64_t v17 = [(TPSConstellationContentParser *)self accessibilityLabelFromAttribute:v4];
  [v16 setAccessibilityLabel:v17];
  objc_msgSend(v16, "setAccessibilityElementsHidden:", objc_msgSend(v17, "isEqualToString:", @" "));
  id v18 = objc_alloc(MEMORY[0x263F086A0]);
  long long v19 = [(TPSConstellationContentParser *)self defaultAttributes];
  uint64_t v20 = (void *)[v18 initWithAttachment:v16 attributes:v19];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v20];
  uint64_t v10 = v7;
  id v7 = v12;
LABEL_20:

LABEL_21:

  return v9;
}

- (id)accessibilityLabelFromAttribute:(id)a3
{
  objc_super v3 = [a3 TPSSafeStringForKey:*MEMORY[0x263F7F688]];
  if (![(__CFString *)v3 length])
  {

    objc_super v3 = @" ";
  }

  return v3;
}

- (id)attributedStringForInlineIconNode:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = [a3 TPSSafeDictionaryForKey:*MEMORY[0x263F7F6F0]];
  id v5 = [v4 TPSSafeStringForKey:*MEMORY[0x263F7F6A8]];
  id v6 = [(TPSConstellationContentParser *)self assetsBaseURL];
  uint64_t v7 = [(TPSConstellationContentParser *)self language];
  uint64_t v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    uint64_t v11 = [MEMORY[0x263F7F5F8] default];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217984000, v11, OS_LOG_TYPE_DEFAULT, "Unable to fetch inline icon due due to missing imageID / baseURL / language", buf, 2u);
    }
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v13 = [(TPSConstellationContentParser *)self traitCollection];
    BOOL v14 = [v13 userInterfaceStyle] == 2;

    uint64_t v15 = [(TPSConstellationContentParser *)self traitCollection];
    [v15 displayScale];
    double v17 = v16;

    if (v17 == 0.0)
    {
      id v18 = [MEMORY[0x263F82B60] mainScreen];
      [v18 scale];
      double v17 = v19;
    }
    uint64_t v20 = [(TPSConstellationContentParser *)self assetFileInfoManager];
    uint64_t v11 = [v20 fileInfoWithMainIdentifier:v5 userInterfaceStyle:v14 scale:(uint64_t)v17];

    id v21 = [v11 size];
    uint64_t v22 = [v21 width];
    [v22 floatValue];
    double v24 = v23;
    v25 = [v21 height];
    [v25 floatValue];
    double v27 = v26;

    double v28 = *(double *)(MEMORY[0x263F001B0] + 8);
    if (*MEMORY[0x263F001B0] == v24 && v28 == v27)
    {
      v45 = objc_msgSend(MEMORY[0x263F7F5F8], "default", *MEMORY[0x263F001B0], v28);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v5;
        _os_log_impl(&dword_217984000, v45, OS_LOG_TYPE_DEFAULT, "No file found with size information for identifier %@", buf, 0xCu);
      }
      uint64_t v12 = 0;
    }
    else
    {
      v51 = v21;
      -[TPSConstellationContentParser normalizedSizeFromSize:scale:](self, "normalizedSizeFromSize:scale:", v24, v27, v17);
      double v31 = v30;
      double v33 = v32;
      id v34 = objc_alloc_init(MEMORY[0x263F81678]);
      v35 = [(TPSConstellationContentParser *)self accessibilityLabelFromAttribute:v4];
      [v34 setAccessibilityLabel:v35];
      v50 = v35;
      objc_msgSend(v34, "setAccessibilityElementsHidden:", objc_msgSend(v35, "isEqualToString:", @" "));
      id v36 = objc_alloc_init(MEMORY[0x263F7F5A8]);
      [v36 setImageId:v5];
      [v36 setBaseURL:v6];
      id v37 = objc_alloc(MEMORY[0x263F7F5B0]);
      uint64_t v38 = [(TPSConstellationContentParser *)self assetFileInfoManager];
      BOOL v39 = v14;
      v40 = (void *)v38;
      v41 = (void *)[v37 initWithAssets:v36 language:v8 userInterfaceStyle:v39 assetFileInfoManager:v38];

      v52 = v41;
      uint64_t v42 = [v41 cacheIdentifierForType:0];
      v43 = +[TPSImageAssetController getImageForIdentifier:v42];
      if (!v43)
      {
        v43 = [(id)objc_opt_class() inlineIconPlaceHolderImage];
        [(TPSConstellationContentParser *)self fetchAssetConfiguration:v52 cacheIdentifier:v42 textAttachment:v34];
      }
      [v34 setImage:v43];
      -[TPSConstellationContentParser boundsForImage:size:](self, "boundsForImage:size:", v43, v31, v33);
      objc_msgSend(v34, "setBounds:");
      uint64_t v48 = v42;
      if (v34)
      {
        v44 = objc_msgSend(MEMORY[0x263F086A0], "attributedStringWithAttachment:", v34, v42);
      }
      else
      {
        v44 = 0;
      }
      v46 = objc_msgSend(MEMORY[0x263F7F5F8], "default", v48);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[TPSConstellationContentParser attributedStringForInlineIconNode:]((uint64_t)v5, v46, v31, v33);
      }

      v45 = v44;
      uint64_t v12 = v45;
      id v21 = v51;
    }
  }

  return v12;
}

- (CGSize)normalizedSizeFromSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(TPSConstellationContentParser *)self defaultAttributes];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F814F0]];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[TPSAppearance bodyFont];
  }
  uint64_t v10 = v9;

  [v10 pointSize];
  double v12 = 19.0;
  if (width <= 200.0) {
    double v13 = width;
  }
  else {
    double v13 = 19.0;
  }
  if (height <= 40.0) {
    double v12 = height;
  }
  double v14 = v11 / 17.0;
  double v15 = v13 * v14;
  double v16 = v12 * v14;

  double v17 = v15;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (id)attributedStringForPersonalizedTextNode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 TPSSafeArrayForKey:@"marks"];
  uint64_t v8 = [(TPSConstellationContentParser *)self attributesWithMarks:v7];
  id v9 = [v6 TPSSafeDictionaryForKey:*MEMORY[0x263F7F6F0]];

  uint64_t v10 = [v9 TPSSafeNumberForKey:*MEMORY[0x263F7F6B8]];
  uint64_t v11 = [v9 TPSSafeNumberForKey:*MEMORY[0x263F7F6B0]];
  double v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    goto LABEL_12;
  }
  uint64_t v14 = [v10 integerValue];
  uint64_t v15 = [v12 integerValue];
  if (!v14)
  {
    uint64_t v16 = v15;
    double v17 = [(TPSConstellationContentParser *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      double v19 = [(TPSConstellationContentParser *)self delegate];
      uint64_t v20 = [v19 constellationContentParser:self personalizedStringForID:v16];

      if (v20) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v20 = [v9 objectForKeyedSubscript:*MEMORY[0x263F7F6A0]];
  if (![v20 length])
  {

    goto LABEL_12;
  }
  if (!v20)
  {
LABEL_12:
    if (a4 && !*a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.tipsUI.contentParser" code:1 userInfo:0];
      uint64_t v20 = 0;
      id v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v20 = 0;
      id v21 = 0;
    }
    goto LABEL_16;
  }
LABEL_10:
  id v21 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v20 attributes:v8];
LABEL_16:

  return v21;
}

- (void)fetchAssetConfiguration:(id)a3 cacheIdentifier:(id)a4 textAttachment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    objc_initWeak(location, self);
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy_;
    v47 = __Block_byref_object_dispose_;
    id v48 = 0;
    uint64_t v11 = [(TPSConstellationContentParser *)self syncQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke;
    block[3] = &unk_2642B1EF8;
    uint64_t v42 = &v43;
    void block[4] = self;
    id v12 = v9;
    id v41 = v12;
    dispatch_sync(v11, block);

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_2;
    aBlock[3] = &unk_2642B1F48;
    id v13 = v12;
    id v36 = v13;
    id v37 = self;
    objc_copyWeak(&v39, location);
    id v38 = v10;
    uint64_t v14 = (void (**)(void *))_Block_copy(aBlock);
    uint64_t v15 = v14;
    uint64_t v16 = v14[2];
    if (v44[5])
    {
      v16(v14);
    }
    else
    {
      v16(v14);
      double v17 = [MEMORY[0x263F7F5D8] assetPathFromAssetConfiguration:v8 type:0];
      int v18 = *MEMORY[0x263F085C0];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_4;
      v30[3] = &unk_2642B1FC0;
      objc_copyWeak(&v34, location);
      double v33 = &v43;
      id v19 = v13;
      id v31 = v19;
      double v32 = self;
      LODWORD(v20) = v18;
      uint64_t v21 = +[TPSImageAssetController formattedDataForPath:v17 identifier:v19 priority:v30 completionHandler:v20];
      uint64_t v22 = (void *)v44[5];
      v44[5] = v21;

      float v23 = [(id)v44[5] sessionTask];
      LODWORD(v24) = v18;
      [v23 setPriority:v24];

      v25 = [(TPSConstellationContentParser *)self syncQueue];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_7;
      v26[3] = &unk_2642B1FE8;
      objc_copyWeak(&v29, location);
      id v27 = v19;
      double v28 = &v43;
      dispatch_async(v25, v26);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v34);
    }
    objc_destroyWeak(&v39);

    _Block_object_dispose(&v43, 8);
    objc_destroyWeak(location);
  }
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) assetsSessionItemMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_2(id *a1)
{
  if (a1[4])
  {
    uint64_t v2 = [a1[5] syncQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_3;
    block[3] = &unk_2642B1F20;
    objc_copyWeak(&v6, a1 + 7);
    id v4 = a1[4];
    id v5 = a1[6];
    dispatch_async(v2, block);

    objc_destroyWeak(&v6);
  }
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained assetsTextAttachmentMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
    id v4 = [WeakRetained assetsTextAttachmentMap];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  [v3 addObject:*(void *)(a1 + 40)];
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) sessionTask];
  id v12 = [v11 identifier];
  id v13 = v12;
  if (!v12) {
    id v13 = *(void **)(a1 + 32);
  }
  id v14 = v13;

  id v15 = 0;
  if (v9 && !a7)
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCancelled]) {
      id v15 = 0;
    }
    else {
      id v15 = v9;
    }
  }
  uint64_t v16 = [*(id *)(a1 + 40) syncQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_5;
  block[3] = &unk_2642B1F98;
  id v20 = v15;
  id v21 = WeakRetained;
  id v22 = v14;
  id v17 = v14;
  id v18 = v15;
  dispatch_async(v16, block);
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_5(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) assetsTextAttachmentMap];
    uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v8++) setImage:*(void *)(a1 + 32)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_6;
    block[3] = &unk_2642B1F70;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (*(void *)(a1 + 48))
  {
    id v9 = [*(id *)(a1 + 40) assetsSessionItemMap];
    [v9 setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];

    id v10 = [*(id *)(a1 + 40) assetsTextAttachmentMap];
    [v10 setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 constellationContentParserAttributedStringUpdated:*(void *)(a1 + 32)];
  }
}

void __88__TPSConstellationContentParser_fetchAssetConfiguration_cacheIdentifier_textAttachment___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  char v3 = [WeakRetained assetsSessionItemMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (CGRect)boundsForImage:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [a3 size];
  if (width == 0.0)
  {
    if (v7 == 0.0) {
      double width = 19.0;
    }
    else {
      double width = v7;
    }
  }
  double v9 = 19.0;
  if (v8 != 0.0) {
    double v9 = v8;
  }
  if (height == 0.0) {
    double height = v9;
  }
  [(TPSConstellationContentParser *)self scaledValueForSize:width];
  double v11 = v10;
  [(TPSConstellationContentParser *)self scaledValueForSize:height];
  double v13 = v12;
  double v14 = -floor(v12 * 0.25);
  double v15 = 0.0;
  double v16 = v11;
  result.size.double height = v13;
  result.size.double width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (double)scaledValueForSize:(double)a3
{
  id v4 = [(TPSConstellationContentParser *)self defaultAttributes];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F814F0]];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  }
  double v8 = v7;

  [v8 pointSize];
  double v10 = v9;
  if (a3 <= 0.0)
  {
    double v11 = [MEMORY[0x263F82B60] mainScreen];
    [v11 scale];
    a3 = a3 / v12;
  }
  return v10 / 17.0 * a3;
}

- (id)_colorForSystemColorString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F825C8] labelColor];
  if (v3
    && ([v3 isEqualToString:@"black"] & 1) == 0
    && ([v3 isEqualToString:@"labelColor"] & 1) == 0)
  {
    if (([v3 hasSuffix:@"Color"] & 1) == 0)
    {
      uint64_t v5 = [v3 stringByAppendingString:@"Color"];

      id v3 = (id)v5;
    }
    uint64_t v6 = [MEMORY[0x263F825C8] performSelector:NSSelectorFromString((NSString *)v3)];

    id v4 = (void *)v6;
  }
  id v7 = v4;

  return v7;
}

- (TPSConstellationContentParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSConstellationContentParserDelegate *)WeakRetained;
}

- (void)setNumOfActiveRemoteURLSessions:(int64_t)a3
{
  self->_numOfActiveRemoteURLSessions = a3;
}

- (BOOL)ignoreLinks
{
  return self->_ignoreLinks;
}

- (void)setIgnoreLinks:(BOOL)a3
{
  self->_ignoreLinks = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (BOOL)delegateRespondsToBoldFont
{
  return self->_delegateRespondsToBoldFont;
}

- (void)setDelegateRespondsToBoldFont:(BOOL)a3
{
  self->_delegateRespondsToBoldFont = a3;
}

- (BOOL)delegateRespondsToItalicFont
{
  return self->_delegateRespondsToItalicFont;
}

- (void)setDelegateRespondsToItalicFont:(BOOL)a3
{
  self->_delegateRespondsToItalicFont = a3;
}

- (BOOL)supportsLinks
{
  return self->_supportsLinks;
}

- (void)setSupportsLinks:(BOOL)a3
{
  self->_supportsLinks = a3;
}

- (int)numberOfParagraphTags
{
  return self->_numberOfParagraphTags;
}

- (void)setNumberOfParagraphTags:(int)a3
{
  self->_numberOfParagraphTags = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (NSMutableDictionary)assetsSessionItemMap
{
  return self->_assetsSessionItemMap;
}

- (void)setAssetsSessionItemMap:(id)a3
{
}

- (NSMutableDictionary)assetsTextAttachmentMap
{
  return self->_assetsTextAttachmentMap;
}

- (void)setAssetsTextAttachmentMap:(id)a3
{
}

- (void)setBoldFont:(id)a3
{
}

- (void)setItalicFont:(id)a3
{
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (void)setDefaultAttributes:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSURL)assetsBaseURL
{
  return self->_assetsBaseURL;
}

- (void)setAssetsBaseURL:(id)a3
{
}

- (TPSAssetFileInfoManager)assetFileInfoManager
{
  return self->_assetFileInfoManager;
}

- (void)setAssetFileInfoManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFileInfoManager, 0);
  objc_storeStrong((id *)&self->_assetsBaseURL, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_assetsTextAttachmentMap, 0);
  objc_storeStrong((id *)&self->_assetsSessionItemMap, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)attributedStringForInlineIconNode:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3, double a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v6 = NSStringFromCGSize(*(CGSize *)&a3);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  double v10 = v6;
  _os_log_debug_impl(&dword_217984000, a2, OS_LOG_TYPE_DEBUG, "Displaying %@ with size %@", (uint8_t *)&v7, 0x16u);
}

@end