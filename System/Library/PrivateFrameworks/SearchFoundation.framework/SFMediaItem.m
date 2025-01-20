@interface SFMediaItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)buyOptions;
- (NSArray)subtitleCustomLineBreaking;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)contentAdvisory;
- (NSString)reviewText;
- (NSString)title;
- (SFImage)contentAdvisoryImage;
- (SFImage)overlayImage;
- (SFImage)reviewGlyph;
- (SFImage)thumbnail;
- (SFMediaItem)initWithCoder:(id)a3;
- (SFMediaItem)initWithProtobuf:(id)a3;
- (SFPunchout)punchout;
- (SFText)subtitleText;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBuyOptions:(id)a3;
- (void)setContentAdvisory:(id)a3;
- (void)setContentAdvisoryImage:(id)a3;
- (void)setOverlayImage:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setReviewGlyph:(id)a3;
- (void)setReviewText:(id)a3;
- (void)setSubtitleCustomLineBreaking:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFMediaItem

- (SFMediaItem)initWithProtobuf:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)SFMediaItem;
  v5 = [(SFMediaItem *)&v61 init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(SFMediaItem *)v5 setTitle:v7];
    }
    v8 = [v4 subtitleText];

    if (v8)
    {
      v9 = [SFText alloc];
      v10 = [v4 subtitleText];
      v11 = [(SFText *)v9 initWithProtobuf:v10];
      [(SFMediaItem *)v5 setSubtitleText:v11];
    }
    v12 = [v4 thumbnail];

    if (v12)
    {
      v13 = [SFImage alloc];
      v14 = [v4 thumbnail];
      v15 = [(SFImage *)v13 initWithProtobuf:v14];
      [(SFMediaItem *)v5 setThumbnail:v15];
    }
    v16 = [v4 reviewGlyph];

    if (v16)
    {
      v17 = [SFImage alloc];
      v18 = [v4 reviewGlyph];
      v19 = [(SFImage *)v17 initWithProtobuf:v18];
      [(SFMediaItem *)v5 setReviewGlyph:v19];
    }
    v20 = [v4 overlayImage];

    if (v20)
    {
      v21 = [SFImage alloc];
      v22 = [v4 overlayImage];
      v23 = [(SFImage *)v21 initWithProtobuf:v22];
      [(SFMediaItem *)v5 setOverlayImage:v23];
    }
    v24 = [v4 reviewText];

    if (v24)
    {
      v25 = [v4 reviewText];
      [(SFMediaItem *)v5 setReviewText:v25];
    }
    v26 = [v4 punchout];

    if (v26)
    {
      v27 = [SFPunchout alloc];
      v28 = [v4 punchout];
      v29 = [(SFPunchout *)v27 initWithProtobuf:v28];
      [(SFMediaItem *)v5 setPunchout:v29];
    }
    v30 = [v4 subtitleCustomLineBreakings];
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
    v32 = [v4 subtitleCustomLineBreakings];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v57 objects:v63 count:16];
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
        uint64_t v34 = [v32 countByEnumeratingWithState:&v57 objects:v63 count:16];
      }
      while (v34);
    }

    [(SFMediaItem *)v5 setSubtitleCustomLineBreaking:v31];
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
    uint64_t v40 = [v39 countByEnumeratingWithState:&v53 objects:v62 count:16];
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
          v44 = [[SFMediaOffer alloc] initWithProtobuf:*(void *)(*((void *)&v53 + 1) + 8 * j)];
          if (v44) {
            [v38 addObject:v44];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v41);
    }

    [(SFMediaItem *)v5 setBuyOptions:v38];
    v45 = [v4 contentAdvisory];

    if (v45)
    {
      v46 = [v4 contentAdvisory];
      [(SFMediaItem *)v5 setContentAdvisory:v46];
    }
    v47 = [v4 contentAdvisoryImage];

    if (v47)
    {
      v48 = [SFImage alloc];
      v49 = [v4 contentAdvisoryImage];
      v50 = [(SFImage *)v48 initWithProtobuf:v49];
      [(SFMediaItem *)v5 setContentAdvisoryImage:v50];
    }
    v51 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAdvisoryImage, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
  objc_storeStrong((id *)&self->_buyOptions, 0);
  objc_storeStrong((id *)&self->_subtitleCustomLineBreaking, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_reviewText, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_reviewGlyph, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setContentAdvisoryImage:(id)a3
{
}

- (SFImage)contentAdvisoryImage
{
  return self->_contentAdvisoryImage;
}

- (void)setContentAdvisory:(id)a3
{
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (void)setBuyOptions:(id)a3
{
}

- (NSArray)buyOptions
{
  return self->_buyOptions;
}

- (void)setSubtitleCustomLineBreaking:(id)a3
{
}

- (NSArray)subtitleCustomLineBreaking
{
  return self->_subtitleCustomLineBreaking;
}

- (void)setPunchout:(id)a3
{
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setReviewText:(id)a3
{
}

- (NSString)reviewText
{
  return self->_reviewText;
}

- (void)setOverlayImage:(id)a3
{
}

- (SFImage)overlayImage
{
  return self->_overlayImage;
}

- (void)setReviewGlyph:(id)a3
{
}

- (SFImage)reviewGlyph
{
  return self->_reviewGlyph;
}

- (void)setThumbnail:(id)a3
{
}

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setSubtitleText:(id)a3
{
}

- (SFText)subtitleText
{
  return self->_subtitleText;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v25 = [(SFMediaItem *)self title];
  uint64_t v3 = [v25 hash];
  v24 = [(SFMediaItem *)self subtitleText];
  uint64_t v4 = [v24 hash] ^ v3;
  v23 = [(SFMediaItem *)self thumbnail];
  uint64_t v5 = [v23 hash];
  v6 = [(SFMediaItem *)self reviewGlyph];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  v8 = [(SFMediaItem *)self overlayImage];
  uint64_t v9 = [v8 hash];
  v10 = [(SFMediaItem *)self reviewText];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(SFMediaItem *)self punchout];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  v14 = [(SFMediaItem *)self subtitleCustomLineBreaking];
  uint64_t v15 = [v14 hash];
  v16 = [(SFMediaItem *)self buyOptions];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFMediaItem *)self contentAdvisory];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(SFMediaItem *)self contentAdvisoryImage];
  unint64_t v21 = v13 ^ v19 ^ [v20 hash];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFMediaItem *)a3;
  if (self == v4)
  {
    char v18 = 1;
    goto LABEL_78;
  }
  if (![(SFMediaItem *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v18 = 0;
    goto LABEL_78;
  }
  uint64_t v5 = v4;
  v6 = [(SFMediaItem *)self title];
  uint64_t v7 = [(SFMediaItem *)v5 title];
  id v103 = v7;
  id v104 = v6;
  int v101 = v7 != 0;
  int v102 = v6 == 0;
  if (v102 == v101)
  {
    memset(v100, 0, sizeof(v100));
    long long v99 = 0uLL;
    memset(v105, 0, sizeof(v105));
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = [(SFMediaItem *)self title];
  BOOL v9 = v8 != 0;
  v98 = (void *)v8;
  if (v8)
  {
    v10 = [(SFMediaItem *)self title];
    v94 = [(SFMediaItem *)v5 title];
    v95 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      memset(v100, 0, 44);
      memset(v105, 0, sizeof(v105));
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      HIDWORD(v100[5]) = 1;
      goto LABEL_15;
    }
  }
  v97 = [(SFMediaItem *)self subtitleText];
  v96 = [(SFMediaItem *)v5 subtitleText];
  HIDWORD(v100[5]) = v9;
  if ((v97 == 0) == (v96 != 0))
  {
    long long v99 = 0uLL;
    memset(v100, 0, 36);
    memset(v105, 0, sizeof(v105));
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)((char *)&v100[4] + 4) = 1;
    goto LABEL_15;
  }
  uint64_t v19 = [(SFMediaItem *)self subtitleText];
  HIDWORD(v105[3]) = v19 != 0;
  v93 = (void *)v19;
  if (v19)
  {
    v20 = [(SFMediaItem *)self subtitleText];
    v89 = [(SFMediaItem *)v5 subtitleText];
    v90 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      memset(v100, 0, 32);
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 28);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      HIDWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  v92 = [(SFMediaItem *)self thumbnail];
  v91 = [(SFMediaItem *)v5 thumbnail];
  if ((v92 == 0) == (v91 != 0))
  {
    memset(v100, 0, 24);
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 28);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 1;
    goto LABEL_15;
  }
  v88 = [(SFMediaItem *)self thumbnail];
  LODWORD(v105[3]) = v88 != 0;
  if (v88)
  {
    v29 = [(SFMediaItem *)self thumbnail];
    v84 = [(SFMediaItem *)v5 thumbnail];
    v85 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      memset(v100, 0, 24);
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      memset(v105, 0, 24);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      LODWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  v87 = [(SFMediaItem *)self reviewGlyph];
  v86 = [(SFMediaItem *)v5 reviewGlyph];
  if ((v87 == 0) == (v86 != 0))
  {
    v100[0] = 0;
    v100[1] = 0;
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    memset(v105, 0, 24);
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 1;
    goto LABEL_15;
  }
  uint64_t v30 = [(SFMediaItem *)self reviewGlyph];
  HIDWORD(v105[2]) = v30 != 0;
  v83 = (void *)v30;
  if (v30)
  {
    id v31 = [(SFMediaItem *)self reviewGlyph];
    v79 = [(SFMediaItem *)v5 reviewGlyph];
    v80 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      v100[0] = 0;
      v100[1] = 0;
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 20);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      HIDWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  uint64_t v32 = [(SFMediaItem *)self overlayImage];
  v81 = [(SFMediaItem *)v5 overlayImage];
  v82 = (void *)v32;
  if ((v32 == 0) == (v81 != 0))
  {
    v100[0] = 0;
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 20);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 1;
    goto LABEL_15;
  }
  uint64_t v33 = [(SFMediaItem *)self overlayImage];
  BOOL v34 = v33 != 0;
  v78 = (void *)v33;
  if (v33)
  {
    uint64_t v35 = [(SFMediaItem *)self overlayImage];
    v74 = [(SFMediaItem *)v5 overlayImage];
    v75 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v100[0] = 0;
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 20);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      LODWORD(v100[5]) = 1;
      goto LABEL_15;
    }
    LODWORD(v100[5]) = v34;
  }
  else
  {
    LODWORD(v100[5]) = 0;
  }
  uint64_t v36 = [(SFMediaItem *)self reviewText];
  v76 = [(SFMediaItem *)v5 reviewText];
  v77 = (void *)v36;
  if ((v36 == 0) == (v76 != 0))
  {
    v100[0] = 0;
    *(void *)((char *)&v99 + 4) = 0;
    LODWORD(v99) = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 20);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    goto LABEL_15;
  }
  v73 = [(SFMediaItem *)self reviewText];
  LODWORD(v105[2]) = v73 != 0;
  if (v73)
  {
    v37 = [(SFMediaItem *)self reviewText];
    v69 = [(SFMediaItem *)v5 reviewText];
    v70 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      *(void *)((char *)&v99 + 4) = 0;
      v100[0] = 0x100000000;
      v105[0] = 0;
      v105[1] = 0;
      LODWORD(v99) = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      HIDWORD(v99) = 1;
      LODWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  v72 = [(SFMediaItem *)self punchout];
  v71 = [(SFMediaItem *)v5 punchout];
  if ((v72 == 0) == (v71 != 0))
  {
    v100[0] = 0x100000000;
    v105[0] = 0;
    v105[1] = 0;
    *(void *)&long long v99 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    *((void *)&v99 + 1) = 0x100000001;
    goto LABEL_15;
  }
  v68 = [(SFMediaItem *)self punchout];
  HIDWORD(v105[1]) = v68 != 0;
  if (v68)
  {
    id v38 = [(SFMediaItem *)self punchout];
    uint64_t v64 = [(SFMediaItem *)v5 punchout];
    v65 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(void *)&long long v99 = 0;
      int v11 = 0;
      *(void *)((char *)v105 + 4) = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      LODWORD(v105[0]) = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((void *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      HIDWORD(v105[1]) = 1;
      goto LABEL_15;
    }
  }
  v67 = [(SFMediaItem *)self subtitleCustomLineBreaking];
  v66 = [(SFMediaItem *)v5 subtitleCustomLineBreaking];
  if ((v67 == 0) == (v66 != 0))
  {
    int v11 = 0;
    *(void *)((char *)v105 + 4) = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    LODWORD(v105[0]) = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(void *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    goto LABEL_15;
  }
  uint64_t v39 = [(SFMediaItem *)self subtitleCustomLineBreaking];
  LODWORD(v105[1]) = v39 != 0;
  v63 = (void *)v39;
  v46 = v5;
  if (!v39
    || ([(SFMediaItem *)self subtitleCustomLineBreaking],
        uint64_t v40 = objc_claimAutoreleasedReturnValue(),
        [(SFMediaItem *)v5 subtitleCustomLineBreaking],
        long long v59 = objc_claimAutoreleasedReturnValue(),
        long long v60 = v40,
        objc_msgSend(v40, "isEqual:")))
  {
    v62 = [(SFMediaItem *)self buyOptions];
    objc_super v61 = [(SFMediaItem *)v5 buyOptions];
    if ((v62 == 0) == (v61 != 0))
    {
      int v12 = 0;
      v105[0] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((void *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      int v11 = 1;
      *(void *)&long long v99 = 0x100000001;
    }
    else
    {
      uint64_t v41 = [(SFMediaItem *)self buyOptions];
      HIDWORD(v105[0]) = v41 != 0;
      long long v58 = (void *)v41;
      if (!v41
        || ([(SFMediaItem *)self buyOptions],
            uint64_t v42 = objc_claimAutoreleasedReturnValue(),
            [(SFMediaItem *)v46 buyOptions],
            long long v54 = objc_claimAutoreleasedReturnValue(),
            long long v55 = v42,
            objc_msgSend(v42, "isEqual:")))
      {
        long long v57 = [(SFMediaItem *)self contentAdvisory];
        long long v56 = [(SFMediaItem *)v46 contentAdvisory];
        if ((v57 == 0) == (v56 != 0))
        {
          int v14 = 0;
          LODWORD(v105[0]) = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          char v18 = 0;
          v100[4] = 0x100000001;
          v100[3] = 0x100000001;
          v100[2] = 0x100000001;
          v100[1] = 0x100000001;
          *((void *)&v99 + 1) = 0x100000001;
          v100[0] = 0x100000001;
          *(void *)&long long v99 = 0x100000001;
          int v11 = 1;
          int v12 = 1;
          int v13 = 1;
        }
        else
        {
          uint64_t v43 = [(SFMediaItem *)self contentAdvisory];
          LODWORD(v105[0]) = v43 != 0;
          long long v53 = (void *)v43;
          if (!v43
            || ([(SFMediaItem *)self contentAdvisory],
                v44 = objc_claimAutoreleasedReturnValue(),
                [(SFMediaItem *)v46 contentAdvisory],
                v49 = objc_claimAutoreleasedReturnValue(),
                v50 = v44,
                objc_msgSend(v44, "isEqual:")))
          {
            v52 = [(SFMediaItem *)self contentAdvisoryImage];
            v51 = [(SFMediaItem *)v46 contentAdvisoryImage];
            if ((v52 == 0) == (v51 != 0))
            {
              int v16 = 0;
              int v17 = 0;
              char v18 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((void *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(void *)&long long v99 = 0x100000001;
              int v11 = 1;
              int v12 = 1;
              int v13 = 1;
              int v14 = 1;
              int v15 = 1;
            }
            else
            {
              v48 = [(SFMediaItem *)self contentAdvisoryImage];
              if (v48)
              {
                v45 = [(SFMediaItem *)self contentAdvisoryImage];
                uint64_t v5 = v46;
                uint64_t v7 = [(SFMediaItem *)v46 contentAdvisoryImage];
                v47 = v45;
                char v18 = [v45 isEqual:v7];
                int v17 = 1;
                v100[4] = 0x100000001;
                v100[3] = 0x100000001;
                v100[2] = 0x100000001;
                v100[1] = 0x100000001;
                *((void *)&v99 + 1) = 0x100000001;
                v100[0] = 0x100000001;
                *(void *)&long long v99 = 0x100000001;
                int v11 = 1;
                int v12 = 1;
                int v13 = 1;
                int v14 = 1;
                int v15 = 1;
                int v16 = 1;
                goto LABEL_15;
              }
              v48 = 0;
              int v17 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((void *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(void *)&long long v99 = 0x100000001;
              int v11 = 1;
              int v12 = 1;
              int v13 = 1;
              int v14 = 1;
              int v15 = 1;
              int v16 = 1;
              char v18 = 1;
            }
          }
          else
          {
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            char v18 = 0;
            v100[4] = 0x100000001;
            v100[3] = 0x100000001;
            v100[2] = 0x100000001;
            v100[1] = 0x100000001;
            *((void *)&v99 + 1) = 0x100000001;
            v100[0] = 0x100000001;
            *(void *)&long long v99 = 0x100000001;
            int v11 = 1;
            int v12 = 1;
            int v13 = 1;
            int v14 = 1;
            LODWORD(v105[0]) = 1;
          }
        }
      }
      else
      {
        int v13 = 0;
        int v14 = 0;
        v105[0] = 0x100000000;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        char v18 = 0;
        v100[4] = 0x100000001;
        v100[3] = 0x100000001;
        v100[2] = 0x100000001;
        v100[1] = 0x100000001;
        *((void *)&v99 + 1) = 0x100000001;
        v100[0] = 0x100000001;
        *(void *)&long long v99 = 0x100000001;
        int v11 = 1;
        int v12 = 1;
      }
    }
  }
  else
  {
    int v12 = 0;
    v105[0] = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(void *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    int v11 = 1;
    LODWORD(v105[1]) = 1;
  }
  uint64_t v5 = v46;
LABEL_15:
  if (v17)
  {
    unint64_t v21 = v5;
    int v22 = v11;
    int v23 = v13;
    int v24 = v12;
    int v25 = v14;
    int v26 = v15;
    int v27 = v16;

    int v16 = v27;
    int v15 = v26;
    int v14 = v25;
    int v12 = v24;
    int v13 = v23;
    int v11 = v22;
    uint64_t v5 = v21;
  }
  if (v16) {

  }
  if (v15)
  {
  }
  if (LODWORD(v105[0]))
  {

    if (!v14) {
      goto LABEL_23;
    }
LABEL_80:

    if (!v13) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v14) {
    goto LABEL_80;
  }
LABEL_23:
  if (v13)
  {
LABEL_24:
  }
LABEL_25:
  if (HIDWORD(v105[0]))
  {
  }
  if (v12) {

  }
  if (DWORD1(v99))
  {
  }
  if (LODWORD(v105[1]))
  {
  }
  if (v11) {

  }
  if (v99)
  {
  }
  if (HIDWORD(v105[1]))
  {
  }
  if (LODWORD(v100[0])) {

  }
  if (DWORD2(v99))
  {
  }
  if (LODWORD(v105[2]))
  {
  }
  if (HIDWORD(v100[0])) {

  }
  if (HIDWORD(v99))
  {
  }
  if (LODWORD(v100[5]))
  {
  }
  if (HIDWORD(v100[1])) {

  }
  if (LODWORD(v100[1]))
  {
  }
  if (HIDWORD(v105[2]))
  {
  }
  if (HIDWORD(v100[2])) {

  }
  if (LODWORD(v100[2]))
  {
  }
  if (LODWORD(v105[3]))
  {
  }
  if (HIDWORD(v100[3])) {

  }
  if (LODWORD(v100[3]))
  {
  }
  if (HIDWORD(v105[3]))
  {
  }
  if (LODWORD(v100[4])) {

  }
  if (HIDWORD(v100[4]))
  {
  }
  if (HIDWORD(v100[5]))
  {
  }
  if (v102 != v101) {

  }
LABEL_78:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFMediaItem *)self title];
  v6 = (void *)[v5 copy];
  [v4 setTitle:v6];

  uint64_t v7 = [(SFMediaItem *)self subtitleText];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setSubtitleText:v8];

  BOOL v9 = [(SFMediaItem *)self thumbnail];
  v10 = (void *)[v9 copy];
  [v4 setThumbnail:v10];

  int v11 = [(SFMediaItem *)self reviewGlyph];
  int v12 = (void *)[v11 copy];
  [v4 setReviewGlyph:v12];

  int v13 = [(SFMediaItem *)self overlayImage];
  int v14 = (void *)[v13 copy];
  [v4 setOverlayImage:v14];

  int v15 = [(SFMediaItem *)self reviewText];
  int v16 = (void *)[v15 copy];
  [v4 setReviewText:v16];

  int v17 = [(SFMediaItem *)self punchout];
  char v18 = (void *)[v17 copy];
  [v4 setPunchout:v18];

  uint64_t v19 = [(SFMediaItem *)self subtitleCustomLineBreaking];
  v20 = (void *)[v19 copy];
  [v4 setSubtitleCustomLineBreaking:v20];

  unint64_t v21 = [(SFMediaItem *)self buyOptions];
  int v22 = (void *)[v21 copy];
  [v4 setBuyOptions:v22];

  int v23 = [(SFMediaItem *)self contentAdvisory];
  int v24 = (void *)[v23 copy];
  [v4 setContentAdvisory:v24];

  int v25 = [(SFMediaItem *)self contentAdvisoryImage];
  int v26 = (void *)[v25 copy];
  [v4 setContentAdvisoryImage:v26];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMediaItem alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMediaItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMediaItem alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMediaItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBMediaItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBMediaItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMediaItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBMediaItem alloc] initWithData:v5];
  uint64_t v7 = [(SFMediaItem *)self initWithProtobuf:v6];

  return v7;
}

@end