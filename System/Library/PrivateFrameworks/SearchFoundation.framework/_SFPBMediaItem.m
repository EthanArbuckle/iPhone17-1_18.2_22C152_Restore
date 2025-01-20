@interface _SFPBMediaItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)buyOptions;
- (NSArray)subtitleCustomLineBreakings;
- (NSData)jsonData;
- (NSString)contentAdvisory;
- (NSString)reviewText;
- (NSString)title;
- (_SFPBImage)contentAdvisoryImage;
- (_SFPBImage)overlayImage;
- (_SFPBImage)reviewGlyph;
- (_SFPBImage)thumbnail;
- (_SFPBMediaItem)initWithDictionary:(id)a3;
- (_SFPBMediaItem)initWithFacade:(id)a3;
- (_SFPBMediaItem)initWithJSON:(id)a3;
- (_SFPBPunchout)punchout;
- (_SFPBText)subtitleText;
- (id)buyOptionsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)subtitleCustomLineBreakingAtIndex:(unint64_t)a3;
- (unint64_t)buyOptionsCount;
- (unint64_t)hash;
- (unint64_t)subtitleCustomLineBreakingCount;
- (void)addBuyOptions:(id)a3;
- (void)addSubtitleCustomLineBreaking:(id)a3;
- (void)clearBuyOptions;
- (void)clearSubtitleCustomLineBreaking;
- (void)setBuyOptions:(id)a3;
- (void)setContentAdvisory:(id)a3;
- (void)setContentAdvisoryImage:(id)a3;
- (void)setOverlayImage:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setReviewGlyph:(id)a3;
- (void)setReviewText:(id)a3;
- (void)setSubtitleCustomLineBreaking:(id)a3;
- (void)setSubtitleCustomLineBreakings:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMediaItem

- (_SFPBMediaItem)initWithFacade:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBMediaItem *)self init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(_SFPBMediaItem *)v5 setTitle:v7];
    }
    v8 = [v4 subtitleText];

    if (v8)
    {
      v9 = [_SFPBText alloc];
      v10 = [v4 subtitleText];
      v11 = [(_SFPBText *)v9 initWithFacade:v10];
      [(_SFPBMediaItem *)v5 setSubtitleText:v11];
    }
    v12 = [v4 thumbnail];

    if (v12)
    {
      v13 = [_SFPBImage alloc];
      v14 = [v4 thumbnail];
      v15 = [(_SFPBImage *)v13 initWithFacade:v14];
      [(_SFPBMediaItem *)v5 setThumbnail:v15];
    }
    v16 = [v4 reviewGlyph];

    if (v16)
    {
      v17 = [_SFPBImage alloc];
      v18 = [v4 reviewGlyph];
      v19 = [(_SFPBImage *)v17 initWithFacade:v18];
      [(_SFPBMediaItem *)v5 setReviewGlyph:v19];
    }
    v20 = [v4 overlayImage];

    if (v20)
    {
      v21 = [_SFPBImage alloc];
      v22 = [v4 overlayImage];
      v23 = [(_SFPBImage *)v21 initWithFacade:v22];
      [(_SFPBMediaItem *)v5 setOverlayImage:v23];
    }
    v24 = [v4 reviewText];

    if (v24)
    {
      v25 = [v4 reviewText];
      [(_SFPBMediaItem *)v5 setReviewText:v25];
    }
    v26 = [v4 punchout];

    if (v26)
    {
      v27 = [_SFPBPunchout alloc];
      v28 = [v4 punchout];
      v29 = [(_SFPBPunchout *)v27 initWithFacade:v28];
      [(_SFPBMediaItem *)v5 setPunchout:v29];
    }
    v30 = [v4 subtitleCustomLineBreaking];
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v32 = [v4 subtitleCustomLineBreaking];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v58 != v35) {
            objc_enumerationMutation(v32);
          }
          if (*(void *)(*((void *)&v57 + 1) + 8 * i)) {
            objc_msgSend(v31, "addObject:");
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v34);
    }

    [(_SFPBMediaItem *)v5 setSubtitleCustomLineBreakings:v31];
    v37 = [v4 buyOptions];
    if (v37) {
      id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v38 = 0;
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v39 = objc_msgSend(v4, "buyOptions", 0);
    uint64_t v40 = [v39 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v54 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = [[_SFPBMediaOffer alloc] initWithFacade:*(void *)(*((void *)&v53 + 1) + 8 * j)];
          if (v44) {
            [v38 addObject:v44];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v41);
    }

    [(_SFPBMediaItem *)v5 setBuyOptions:v38];
    v45 = [v4 contentAdvisory];

    if (v45)
    {
      v46 = [v4 contentAdvisory];
      [(_SFPBMediaItem *)v5 setContentAdvisory:v46];
    }
    v47 = [v4 contentAdvisoryImage];

    if (v47)
    {
      v48 = [_SFPBImage alloc];
      v49 = [v4 contentAdvisoryImage];
      v50 = [(_SFPBImage *)v48 initWithFacade:v49];
      [(_SFPBMediaItem *)v5 setContentAdvisoryImage:v50];
    }
    v51 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAdvisoryImage, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
  objc_storeStrong((id *)&self->_buyOptions, 0);
  objc_storeStrong((id *)&self->_subtitleCustomLineBreakings, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_reviewText, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_reviewGlyph, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (_SFPBImage)contentAdvisoryImage
{
  return self->_contentAdvisoryImage;
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (NSArray)buyOptions
{
  return self->_buyOptions;
}

- (void)setSubtitleCustomLineBreakings:(id)a3
{
}

- (NSArray)subtitleCustomLineBreakings
{
  return self->_subtitleCustomLineBreakings;
}

- (_SFPBPunchout)punchout
{
  return self->_punchout;
}

- (NSString)reviewText
{
  return self->_reviewText;
}

- (_SFPBImage)overlayImage
{
  return self->_overlayImage;
}

- (_SFPBImage)reviewGlyph
{
  return self->_reviewGlyph;
}

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBText)subtitleText
{
  return self->_subtitleText;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBMediaItem)initWithDictionary:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)_SFPBMediaItem;
  v5 = [(_SFPBMediaItem *)&v60 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBMediaItem *)v5 setTitle:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"subtitleText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBText alloc] initWithDictionary:v8];
      [(_SFPBMediaItem *)v5 setSubtitleText:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    v11 = &off_1E5A2D000;
    if (objc_opt_isKindOfClass())
    {
      v12 = [[_SFPBImage alloc] initWithDictionary:v10];
      [(_SFPBMediaItem *)v5 setThumbnail:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"reviewGlyph"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [[_SFPBImage alloc] initWithDictionary:v13];
      [(_SFPBMediaItem *)v5 setReviewGlyph:v14];
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"overlayImage"];
    objc_opt_class();
    v51 = (void *)v15;
    if (objc_opt_isKindOfClass())
    {
      v16 = [[_SFPBImage alloc] initWithDictionary:v15];
      [(_SFPBMediaItem *)v5 setOverlayImage:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"reviewText"];
    objc_opt_class();
    v50 = v17;
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBMediaItem *)v5 setReviewText:v18];
    }
    v46 = (void *)v10;
    v47 = (void *)v8;
    v48 = v6;
    uint64_t v19 = [v4 objectForKeyedSubscript:@"punchout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[_SFPBPunchout alloc] initWithDictionary:v19];
      [(_SFPBMediaItem *)v5 setPunchout:v20];
    }
    v44 = (void *)v19;
    v21 = [v4 objectForKeyedSubscript:@"subtitleCustomLineBreaking"];
    objc_opt_class();
    v45 = v13;
    v43 = v21;
    if (objc_opt_isKindOfClass())
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v57 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = (void *)[v27 copy];
              [(_SFPBMediaItem *)v5 addSubtitleCustomLineBreaking:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v62 count:16];
        }
        while (v24);
      }

      v13 = v45;
      v11 = &off_1E5A2D000;
      v21 = v43;
    }
    v29 = [v4 objectForKeyedSubscript:@"buyOptions"];
    objc_opt_class();
    v49 = v29;
    if (objc_opt_isKindOfClass())
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v53 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v52 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v36 = [[_SFPBMediaOffer alloc] initWithDictionary:v35];
              [(_SFPBMediaItem *)v5 addBuyOptions:v36];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v32);
      }

      v13 = v45;
      v11 = &off_1E5A2D000;
      v21 = v43;
    }
    v37 = [v4 objectForKeyedSubscript:@"contentAdvisory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v38 = (void *)[v37 copy];
      [(_SFPBMediaItem *)v5 setContentAdvisory:v38];
    }
    v39 = [v4 objectForKeyedSubscript:@"contentAdvisoryImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v40 = (void *)[objc_alloc((Class)v11[448]) initWithDictionary:v39];
      [(_SFPBMediaItem *)v5 setContentAdvisoryImage:v40];
    }
    uint64_t v41 = v5;
  }
  return v5;
}

- (_SFPBMediaItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMediaItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMediaItem *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_buyOptions count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v5 = self->_buyOptions;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "dictionaryRepresentation", (void)v39);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"buyOptions"];
  }
  if (self->_contentAdvisory)
  {
    v12 = [(_SFPBMediaItem *)self contentAdvisory];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"contentAdvisory"];
  }
  if (self->_contentAdvisoryImage)
  {
    v14 = [(_SFPBMediaItem *)self contentAdvisoryImage];
    uint64_t v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"contentAdvisoryImage"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"contentAdvisoryImage"];
    }
  }
  if (self->_overlayImage)
  {
    v17 = [(_SFPBMediaItem *)self overlayImage];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"overlayImage"];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"overlayImage"];
    }
  }
  if (self->_punchout)
  {
    v20 = [(_SFPBMediaItem *)self punchout];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"punchout"];
    }
    else
    {
      id v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"punchout"];
    }
  }
  if (self->_reviewGlyph)
  {
    uint64_t v23 = [(_SFPBMediaItem *)self reviewGlyph];
    uint64_t v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"reviewGlyph"];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"reviewGlyph"];
    }
  }
  if (self->_reviewText)
  {
    v26 = [(_SFPBMediaItem *)self reviewText];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"reviewText"];
  }
  if (self->_subtitleCustomLineBreakings)
  {
    v28 = [(_SFPBMediaItem *)self subtitleCustomLineBreakings];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"subtitleCustomLineBreaking"];
  }
  if (self->_subtitleText)
  {
    id v30 = [(_SFPBMediaItem *)self subtitleText];
    uint64_t v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"subtitleText"];
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"subtitleText"];
    }
  }
  if (self->_thumbnail)
  {
    uint64_t v33 = [(_SFPBMediaItem *)self thumbnail];
    uint64_t v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_title)
  {
    v36 = [(_SFPBMediaItem *)self title];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  unint64_t v4 = [(_SFPBText *)self->_subtitleText hash] ^ v3;
  unint64_t v5 = [(_SFPBImage *)self->_thumbnail hash];
  unint64_t v6 = v4 ^ v5 ^ [(_SFPBImage *)self->_reviewGlyph hash];
  unint64_t v7 = [(_SFPBImage *)self->_overlayImage hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_reviewText hash];
  unint64_t v9 = v6 ^ v8 ^ [(_SFPBPunchout *)self->_punchout hash];
  uint64_t v10 = [(NSArray *)self->_subtitleCustomLineBreakings hash];
  uint64_t v11 = v10 ^ [(NSArray *)self->_buyOptions hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_contentAdvisory hash];
  return v9 ^ v12 ^ [(_SFPBImage *)self->_contentAdvisoryImage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  unint64_t v5 = [(_SFPBMediaItem *)self title];
  unint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v7 = [(_SFPBMediaItem *)self title];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    unint64_t v9 = [(_SFPBMediaItem *)self title];
    uint64_t v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self subtitleText];
  unint64_t v6 = [v4 subtitleText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v12 = [(_SFPBMediaItem *)self subtitleText];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBMediaItem *)self subtitleText];
    uint64_t v15 = [v4 subtitleText];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v17 = [(_SFPBMediaItem *)self thumbnail];
  if (v17)
  {
    v18 = (void *)v17;
    uint64_t v19 = [(_SFPBMediaItem *)self thumbnail];
    v20 = [v4 thumbnail];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self reviewGlyph];
  unint64_t v6 = [v4 reviewGlyph];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v22 = [(_SFPBMediaItem *)self reviewGlyph];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBMediaItem *)self reviewGlyph];
    uint64_t v25 = [v4 reviewGlyph];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self overlayImage];
  unint64_t v6 = [v4 overlayImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v27 = [(_SFPBMediaItem *)self overlayImage];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBMediaItem *)self overlayImage];
    id v30 = [v4 overlayImage];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self reviewText];
  unint64_t v6 = [v4 reviewText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v32 = [(_SFPBMediaItem *)self reviewText];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(_SFPBMediaItem *)self reviewText];
    uint64_t v35 = [v4 reviewText];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self punchout];
  unint64_t v6 = [v4 punchout];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v37 = [(_SFPBMediaItem *)self punchout];
  if (v37)
  {
    id v38 = (void *)v37;
    long long v39 = [(_SFPBMediaItem *)self punchout];
    long long v40 = [v4 punchout];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self subtitleCustomLineBreakings];
  unint64_t v6 = [v4 subtitleCustomLineBreakings];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v42 = [(_SFPBMediaItem *)self subtitleCustomLineBreakings];
  if (v42)
  {
    v43 = (void *)v42;
    uint64_t v44 = [(_SFPBMediaItem *)self subtitleCustomLineBreakings];
    v45 = [v4 subtitleCustomLineBreakings];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self buyOptions];
  unint64_t v6 = [v4 buyOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v47 = [(_SFPBMediaItem *)self buyOptions];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_SFPBMediaItem *)self buyOptions];
    v50 = [v4 buyOptions];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self contentAdvisory];
  unint64_t v6 = [v4 contentAdvisory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v52 = [(_SFPBMediaItem *)self contentAdvisory];
  if (v52)
  {
    long long v53 = (void *)v52;
    long long v54 = [(_SFPBMediaItem *)self contentAdvisory];
    long long v55 = [v4 contentAdvisory];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBMediaItem *)self contentAdvisoryImage];
  unint64_t v6 = [v4 contentAdvisoryImage];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v57 = [(_SFPBMediaItem *)self contentAdvisoryImage];
    if (!v57)
    {

LABEL_60:
      BOOL v62 = 1;
      goto LABEL_58;
    }
    long long v58 = (void *)v57;
    long long v59 = [(_SFPBMediaItem *)self contentAdvisoryImage];
    objc_super v60 = [v4 contentAdvisoryImage];
    char v61 = [v59 isEqual:v60];

    if (v61) {
      goto LABEL_60;
    }
  }
  else
  {
LABEL_56:
  }
LABEL_57:
  BOOL v62 = 0;
LABEL_58:

  return v62;
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_SFPBMediaItem *)self title];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  unint64_t v6 = [(_SFPBMediaItem *)self subtitleText];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBMediaItem *)self thumbnail];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v8 = [(_SFPBMediaItem *)self reviewGlyph];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v9 = [(_SFPBMediaItem *)self overlayImage];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v10 = [(_SFPBMediaItem *)self reviewText];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBMediaItem *)self punchout];
  if (v11) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v12 = [(_SFPBMediaItem *)self subtitleCustomLineBreakings];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(_SFPBMediaItem *)self buyOptions];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  uint64_t v22 = [(_SFPBMediaItem *)self contentAdvisory];
  if (v22) {
    PBDataWriterWriteStringField();
  }

  uint64_t v23 = [(_SFPBMediaItem *)self contentAdvisoryImage];
  if (v23) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaItemReadFrom(self, (uint64_t)a3);
}

- (void)setContentAdvisoryImage:(id)a3
{
}

- (void)setContentAdvisory:(id)a3
{
  self->_contentAdvisory = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)buyOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_buyOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)buyOptionsCount
{
  return [(NSArray *)self->_buyOptions count];
}

- (void)addBuyOptions:(id)a3
{
  id v4 = a3;
  buyOptions = self->_buyOptions;
  id v8 = v4;
  if (!buyOptions)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_buyOptions;
    self->_buyOptions = v6;

    id v4 = v8;
    buyOptions = self->_buyOptions;
  }
  [(NSArray *)buyOptions addObject:v4];
}

- (void)clearBuyOptions
{
}

- (void)setBuyOptions:(id)a3
{
  self->_buyOptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)subtitleCustomLineBreakingAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_subtitleCustomLineBreakings objectAtIndexedSubscript:a3];
}

- (unint64_t)subtitleCustomLineBreakingCount
{
  return [(NSArray *)self->_subtitleCustomLineBreakings count];
}

- (void)addSubtitleCustomLineBreaking:(id)a3
{
  id v4 = a3;
  subtitleCustomLineBreakings = self->_subtitleCustomLineBreakings;
  id v8 = v4;
  if (!subtitleCustomLineBreakings)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_subtitleCustomLineBreakings;
    self->_subtitleCustomLineBreakings = v6;

    id v4 = v8;
    subtitleCustomLineBreakings = self->_subtitleCustomLineBreakings;
  }
  [(NSArray *)subtitleCustomLineBreakings addObject:v4];
}

- (void)clearSubtitleCustomLineBreaking
{
}

- (void)setSubtitleCustomLineBreaking:(id)a3
{
  self->_subtitleCustomLineBreakings = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPunchout:(id)a3
{
}

- (void)setReviewText:(id)a3
{
  self->_reviewText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setOverlayImage:(id)a3
{
}

- (void)setReviewGlyph:(id)a3
{
}

- (void)setThumbnail:(id)a3
{
}

- (void)setSubtitleText:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end