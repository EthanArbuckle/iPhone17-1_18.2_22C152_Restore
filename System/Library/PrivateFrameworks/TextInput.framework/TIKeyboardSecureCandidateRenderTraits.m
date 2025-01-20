@interface TIKeyboardSecureCandidateRenderTraits
+ (BOOL)supportsSecureCoding;
- (BOOL)disableHideMyEmail;
- (BOOL)isCandidateUI;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldForceDoubleLineCandidateForCellularAutofill;
- (BOOL)shouldForceDoubleLineCandidateForPasswordAutofill;
- (BOOL)shouldOfferHideMyEmail;
- (NSArray)resultCountToSingleCellWidth;
- (NSDictionary)cellWidthOptions;
- (NSString)fontName;
- (NSString)hideMyEmailLocalizedText;
- (NSString)prefixText;
- (NSString)suffixText;
- (TIKeyboardSecureCandidateLayoutTraits)layoutTraits;
- (TIKeyboardSecureCandidateRGBColor)textColor;
- (TIKeyboardSecureCandidateRenderTraits)init;
- (TIKeyboardSecureCandidateRenderTraits)initWithCoder:(id)a3;
- (TIKeyboardSecureCandidateTextTraits)headerTextTraits;
- (TIKeyboardSecureCandidateTextTraits)inputTextTraits;
- (double)dividerLineWidth;
- (double)fontSize;
- (double)screenScale;
- (double)singleCellHeight;
- (double)singleCellVerticalPadding;
- (double)singleCellWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cellRenderingStyle;
- (int64_t)maxCellCount;
- (int64_t)sharedCellCount;
- (void)encodeWithCoder:(id)a3;
- (void)setCellRenderingStyle:(int64_t)a3;
- (void)setCellWidthOptions:(id)a3;
- (void)setDisableHideMyEmail:(BOOL)a3;
- (void)setDividerLineWidth:(double)a3;
- (void)setFontName:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setHeaderTextTraits:(id)a3;
- (void)setHideMyEmailLocalizedText:(id)a3;
- (void)setInputTextTraits:(id)a3;
- (void)setIsCandidateUI:(BOOL)a3;
- (void)setLayoutTraits:(id)a3;
- (void)setMaxCellCount:(int64_t)a3;
- (void)setPrefixText:(id)a3;
- (void)setResultCountToSingleCellWidth:(id)a3;
- (void)setScreenScale:(double)a3;
- (void)setSharedCellCount:(int64_t)a3;
- (void)setShouldForceDoubleLineCandidateForCellularAutofill:(BOOL)a3;
- (void)setShouldForceDoubleLineCandidateForPasswordAutofill:(BOOL)a3;
- (void)setShouldOfferHideMyEmail:(BOOL)a3;
- (void)setSingleCellHeight:(double)a3;
- (void)setSingleCellVerticalPadding:(double)a3;
- (void)setSingleCellWidth:(double)a3;
- (void)setSuffixText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation TIKeyboardSecureCandidateRenderTraits

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideMyEmailLocalizedText, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_cellWidthOptions, 0);
  objc_storeStrong((id *)&self->_resultCountToSingleCellWidth, 0);
  objc_storeStrong((id *)&self->_suffixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_inputTextTraits, 0);
  objc_storeStrong((id *)&self->_headerTextTraits, 0);

  objc_storeStrong((id *)&self->_layoutTraits, 0);
}

- (void)setShouldForceDoubleLineCandidateForPasswordAutofill:(BOOL)a3
{
  self->_shouldForceDoubleLineCandidateForPasswordAutofill = a3;
}

- (BOOL)shouldForceDoubleLineCandidateForPasswordAutofill
{
  return self->_shouldForceDoubleLineCandidateForPasswordAutofill;
}

- (void)setShouldForceDoubleLineCandidateForCellularAutofill:(BOOL)a3
{
  self->_shouldForceDoubleLineCandidateForCellularAutofill = a3;
}

- (BOOL)shouldForceDoubleLineCandidateForCellularAutofill
{
  return self->_shouldForceDoubleLineCandidateForCellularAutofill;
}

- (void)setDisableHideMyEmail:(BOOL)a3
{
  self->_disableHideMyEmail = a3;
}

- (BOOL)disableHideMyEmail
{
  return self->_disableHideMyEmail;
}

- (void)setShouldOfferHideMyEmail:(BOOL)a3
{
  self->_shouldOfferHideMyEmail = a3;
}

- (BOOL)shouldOfferHideMyEmail
{
  return self->_shouldOfferHideMyEmail;
}

- (void)setHideMyEmailLocalizedText:(id)a3
{
}

- (NSString)hideMyEmailLocalizedText
{
  return self->_hideMyEmailLocalizedText;
}

- (void)setTextColor:(id)a3
{
}

- (TIKeyboardSecureCandidateRGBColor)textColor
{
  return self->_textColor;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontName:(id)a3
{
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setIsCandidateUI:(BOOL)a3
{
  self->_isCandidateUI = a3;
}

- (BOOL)isCandidateUI
{
  return self->_isCandidateUI;
}

- (void)setCellRenderingStyle:(int64_t)a3
{
  self->_cellRenderingStyle = a3;
}

- (int64_t)cellRenderingStyle
{
  return self->_cellRenderingStyle;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setSharedCellCount:(int64_t)a3
{
  self->_sharedCellCount = a3;
}

- (int64_t)sharedCellCount
{
  return self->_sharedCellCount;
}

- (void)setMaxCellCount:(int64_t)a3
{
  self->_maxCellCount = a3;
}

- (int64_t)maxCellCount
{
  return self->_maxCellCount;
}

- (void)setDividerLineWidth:(double)a3
{
  self->_dividerLineWidth = a3;
}

- (double)dividerLineWidth
{
  return self->_dividerLineWidth;
}

- (void)setSingleCellVerticalPadding:(double)a3
{
  self->_singleCellVerticalPadding = a3;
}

- (double)singleCellVerticalPadding
{
  return self->_singleCellVerticalPadding;
}

- (void)setSingleCellHeight:(double)a3
{
  self->_singleCellHeight = a3;
}

- (double)singleCellHeight
{
  return self->_singleCellHeight;
}

- (void)setCellWidthOptions:(id)a3
{
}

- (NSDictionary)cellWidthOptions
{
  return self->_cellWidthOptions;
}

- (void)setResultCountToSingleCellWidth:(id)a3
{
}

- (NSArray)resultCountToSingleCellWidth
{
  return self->_resultCountToSingleCellWidth;
}

- (void)setSuffixText:(id)a3
{
}

- (NSString)suffixText
{
  return self->_suffixText;
}

- (void)setPrefixText:(id)a3
{
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (void)setInputTextTraits:(id)a3
{
}

- (void)setHeaderTextTraits:(id)a3
{
}

- (void)setLayoutTraits:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    layoutTraits = self->_layoutTraits;
    if (layoutTraits != (TIKeyboardSecureCandidateLayoutTraits *)v5[2]
      && !-[TIKeyboardSecureCandidateLayoutTraits isEqual:](layoutTraits, "isEqual:"))
    {
      goto LABEL_30;
    }
    v7 = [(TIKeyboardSecureCandidateRenderTraits *)self headerTextTraits];
    uint64_t v8 = [v5 headerTextTraits];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(TIKeyboardSecureCandidateRenderTraits *)self headerTextTraits];
      v11 = [v5 headerTextTraits];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_30;
      }
    }
    v14 = [(TIKeyboardSecureCandidateRenderTraits *)self inputTextTraits];
    uint64_t v15 = [v5 inputTextTraits];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(TIKeyboardSecureCandidateRenderTraits *)self inputTextTraits];
      v18 = [v5 inputTextTraits];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_30;
      }
    }
    v20 = NSString;
    v21 = [(TIKeyboardSecureCandidateRenderTraits *)self prefixText];
    v22 = [v5 prefixText];
    LODWORD(v20) = [v20 _string:v21 matchesString:v22];

    if (!v20) {
      goto LABEL_30;
    }
    v23 = NSString;
    v24 = [(TIKeyboardSecureCandidateRenderTraits *)self suffixText];
    v25 = [v5 suffixText];
    LODWORD(v23) = [v23 _string:v24 matchesString:v25];

    if (!v23) {
      goto LABEL_30;
    }
    v26 = [(TIKeyboardSecureCandidateRenderTraits *)self resultCountToSingleCellWidth];
    uint64_t v27 = [v5 resultCountToSingleCellWidth];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(TIKeyboardSecureCandidateRenderTraits *)self resultCountToSingleCellWidth];
      v30 = [v5 resultCountToSingleCellWidth];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_30;
      }
    }
    v32 = [(TIKeyboardSecureCandidateRenderTraits *)self cellWidthOptions];
    uint64_t v33 = [v5 cellWidthOptions];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(TIKeyboardSecureCandidateRenderTraits *)self cellWidthOptions];
      v36 = [v5 cellWidthOptions];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_30;
      }
    }
    [(TIKeyboardSecureCandidateRenderTraits *)self singleCellHeight];
    double v39 = v38;
    [v5 singleCellHeight];
    if (v39 == v40)
    {
      [(TIKeyboardSecureCandidateRenderTraits *)self singleCellVerticalPadding];
      double v42 = v41;
      [v5 singleCellVerticalPadding];
      if (v42 == v43)
      {
        [(TIKeyboardSecureCandidateRenderTraits *)self dividerLineWidth];
        double v45 = v44;
        [v5 dividerLineWidth];
        if (v45 == v46)
        {
          int64_t v47 = [(TIKeyboardSecureCandidateRenderTraits *)self maxCellCount];
          if (v47 == [v5 maxCellCount])
          {
            int64_t v48 = [(TIKeyboardSecureCandidateRenderTraits *)self sharedCellCount];
            if (v48 == [v5 sharedCellCount])
            {
              [(TIKeyboardSecureCandidateRenderTraits *)self screenScale];
              double v50 = v49;
              [v5 screenScale];
              if (v50 == v51)
              {
                BOOL v52 = [(TIKeyboardSecureCandidateRenderTraits *)self isCandidateUI];
                int v13 = v52 ^ [v5 isCandidateUI] ^ 1;
LABEL_31:

                goto LABEL_32;
              }
            }
          }
        }
      }
    }
LABEL_30:
    LOBYTE(v13) = 0;
    goto LABEL_31;
  }
  LOBYTE(v13) = 0;
LABEL_32:

  return v13;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [v3 appendFormat:@"; layoutTraits = %@", self->_layoutTraits];
  id v4 = [(TIKeyboardSecureCandidateRenderTraits *)self headerTextTraits];
  [v3 appendFormat:@"; headerTextTraits = %@", v4];

  v5 = [(TIKeyboardSecureCandidateRenderTraits *)self inputTextTraits];
  [v3 appendFormat:@"; inputTextTraits = %@", v5];

  v6 = [(TIKeyboardSecureCandidateRenderTraits *)self prefixText];

  if (v6)
  {
    v7 = [(TIKeyboardSecureCandidateRenderTraits *)self prefixText];
    [v3 appendFormat:@"; prefixText = %@", v7];
  }
  uint64_t v8 = [(TIKeyboardSecureCandidateRenderTraits *)self suffixText];

  if (v8)
  {
    v9 = [(TIKeyboardSecureCandidateRenderTraits *)self suffixText];
    [v3 appendFormat:@"; suffixText = %@", v9];
  }
  v10 = [(TIKeyboardSecureCandidateRenderTraits *)self resultCountToSingleCellWidth];
  v11 = [v10 componentsJoinedByString:@","];
  [v3 appendFormat:@"; resultCountToSingleCellWidth = (%@)", v11];

  int v12 = [(TIKeyboardSecureCandidateRenderTraits *)self cellWidthOptions];
  int v13 = [v12 description];
  [v3 appendFormat:@"; cellWidthOptions = %@", v13];

  [(TIKeyboardSecureCandidateRenderTraits *)self singleCellHeight];
  objc_msgSend(v3, "appendFormat:", @"; singleCellHeight = %f", v14);
  [(TIKeyboardSecureCandidateRenderTraits *)self singleCellVerticalPadding];
  objc_msgSend(v3, "appendFormat:", @"; singleCellVerticalPadding = %f", v15);
  [(TIKeyboardSecureCandidateRenderTraits *)self dividerLineWidth];
  objc_msgSend(v3, "appendFormat:", @"; dividerLineWidth = %f", v16);
  objc_msgSend(v3, "appendFormat:", @"; maxCellCount = %ld",
    [(TIKeyboardSecureCandidateRenderTraits *)self maxCellCount]);
  objc_msgSend(v3, "appendFormat:", @"; sharedCellCount = %ld",
    [(TIKeyboardSecureCandidateRenderTraits *)self sharedCellCount]);
  [(TIKeyboardSecureCandidateRenderTraits *)self screenScale];
  objc_msgSend(v3, "appendFormat:", @"; screenScale = %f", v17);
  BOOL v18 = [(TIKeyboardSecureCandidateRenderTraits *)self isCandidateUI];
  int v19 = @"NO";
  if (v18) {
    int v19 = @"YES";
  }
  [v3 appendFormat:@"; isCandidateUI = %@", v19];
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  layoutTraits = self->_layoutTraits;
  id v17 = v4;
  if (layoutTraits)
  {
    [v4 encodeObject:layoutTraits forKey:@"layoutTraits"];
    id v4 = v17;
  }
  headerTextTraits = self->_headerTextTraits;
  if (headerTextTraits)
  {
    [v17 encodeObject:headerTextTraits forKey:@"headerTextTraits"];
    id v4 = v17;
  }
  inputTextTraits = self->_inputTextTraits;
  if (inputTextTraits)
  {
    [v17 encodeObject:inputTextTraits forKey:@"inputTextTraits"];
    id v4 = v17;
  }
  prefixText = self->_prefixText;
  if (prefixText)
  {
    [v17 encodeObject:prefixText forKey:@"prefixText"];
    id v4 = v17;
  }
  suffixText = self->_suffixText;
  if (suffixText)
  {
    [v17 encodeObject:suffixText forKey:@"suffixText"];
    id v4 = v17;
  }
  resultCountToSingleCellWidth = self->_resultCountToSingleCellWidth;
  if (resultCountToSingleCellWidth)
  {
    [v17 encodeObject:resultCountToSingleCellWidth forKey:@"resultCountToSingleCellWidth"];
    id v4 = v17;
  }
  cellWidthOptions = self->_cellWidthOptions;
  if (cellWidthOptions)
  {
    [v17 encodeObject:cellWidthOptions forKey:@"cellWidthOptions"];
    id v4 = v17;
  }
  double singleCellHeight = self->_singleCellHeight;
  if (singleCellHeight != 0.0)
  {
    *(float *)&double singleCellHeight = singleCellHeight;
    [v17 encodeFloat:@"singleCellHeight" forKey:singleCellHeight];
    id v4 = v17;
  }
  double singleCellVerticalPadding = self->_singleCellVerticalPadding;
  if (singleCellVerticalPadding != 0.0)
  {
    *(float *)&double singleCellVerticalPadding = singleCellVerticalPadding;
    [v17 encodeFloat:@"singleCellVerticalPadding" forKey:singleCellVerticalPadding];
    id v4 = v17;
  }
  double dividerLineWidth = self->_dividerLineWidth;
  if (dividerLineWidth != 0.0)
  {
    *(float *)&double dividerLineWidth = dividerLineWidth;
    [v17 encodeFloat:@"dividerLineWidth" forKey:dividerLineWidth];
    id v4 = v17;
  }
  int64_t maxCellCount = self->_maxCellCount;
  if (maxCellCount)
  {
    [v17 encodeInteger:maxCellCount forKey:@"maxCellCount"];
    id v4 = v17;
  }
  double screenScale = self->_screenScale;
  if (screenScale != 0.0)
  {
    *(float *)&double screenScale = screenScale;
    [v17 encodeFloat:@"screenScale" forKey:screenScale];
    id v4 = v17;
  }
  [v4 encodeBool:self->_isCandidateUI forKey:@"isCandidateUI"];
}

- (TIKeyboardSecureCandidateRenderTraits)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TIKeyboardSecureCandidateRenderTraits;
  v5 = [(TIKeyboardSecureCandidateRenderTraits *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutTraits"];
    layoutTraits = v5->_layoutTraits;
    v5->_layoutTraits = (TIKeyboardSecureCandidateLayoutTraits *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headerTextTraits"];
    headerTextTraits = v5->_headerTextTraits;
    v5->_headerTextTraits = (TIKeyboardSecureCandidateTextTraits *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputTextTraits"];
    inputTextTraits = v5->_inputTextTraits;
    v5->_inputTextTraits = (TIKeyboardSecureCandidateTextTraits *)v10;

    int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prefixText"];
    uint64_t v13 = [v12 copy];
    prefixText = v5->_prefixText;
    v5->_prefixText = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suffixText"];
    uint64_t v16 = [v15 copy];
    suffixText = v5->_suffixText;
    v5->_suffixText = (NSString *)v16;

    BOOL v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v21 = [v4 decodeObjectOfClasses:v20 forKey:@"resultCountToSingleCellWidth"];
    uint64_t v22 = [v21 copy];
    resultCountToSingleCellWidth = v5->_resultCountToSingleCellWidth;
    v5->_resultCountToSingleCellWidth = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    v28 = [v4 decodeObjectOfClasses:v27 forKey:@"cellWidthOptions"];
    uint64_t v29 = [v28 copy];
    cellWidthOptions = v5->_cellWidthOptions;
    v5->_cellWidthOptions = (NSDictionary *)v29;

    [v4 decodeFloatForKey:@"singleCellHeight"];
    v5->_double singleCellHeight = v31;
    [v4 decodeFloatForKey:@"singleCellVerticalPadding"];
    v5->_double singleCellVerticalPadding = v32;
    [v4 decodeFloatForKey:@"dividerLineWidth"];
    v5->_double dividerLineWidth = v33;
    v5->_int64_t maxCellCount = [v4 decodeIntegerForKey:@"maxCellCount"];
    v5->_sharedCellCount = 0;
    [v4 decodeFloatForKey:@"screenScale"];
    v5->_double screenScale = v34;
    v5->_isCandidateUI = [v4 decodeBoolForKey:@"isCandidateUI"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(TIKeyboardSecureCandidateRenderTraits);
  if (v5)
  {
    uint64_t v6 = [(TIKeyboardSecureCandidateLayoutTraits *)self->_layoutTraits copyWithZone:a3];
    layoutTraits = v5->_layoutTraits;
    v5->_layoutTraits = v6;

    uint64_t v8 = [(TIKeyboardSecureCandidateTextTraits *)self->_headerTextTraits copyWithZone:a3];
    headerTextTraits = v5->_headerTextTraits;
    v5->_headerTextTraits = v8;

    uint64_t v10 = [(TIKeyboardSecureCandidateTextTraits *)self->_inputTextTraits copyWithZone:a3];
    inputTextTraits = v5->_inputTextTraits;
    v5->_inputTextTraits = v10;

    uint64_t v12 = [(NSString *)self->_prefixText copyWithZone:a3];
    prefixText = v5->_prefixText;
    v5->_prefixText = (NSString *)v12;

    uint64_t v14 = [(NSString *)self->_suffixText copyWithZone:a3];
    suffixText = v5->_suffixText;
    v5->_suffixText = (NSString *)v14;

    uint64_t v16 = [(NSArray *)self->_resultCountToSingleCellWidth copyWithZone:a3];
    resultCountToSingleCellWidth = v5->_resultCountToSingleCellWidth;
    v5->_resultCountToSingleCellWidth = (NSArray *)v16;

    uint64_t v18 = [(NSDictionary *)self->_cellWidthOptions copyWithZone:a3];
    cellWidthOptions = v5->_cellWidthOptions;
    v5->_cellWidthOptions = (NSDictionary *)v18;

    v5->_double singleCellHeight = self->_singleCellHeight;
    v5->_double singleCellVerticalPadding = self->_singleCellVerticalPadding;
    v5->_double dividerLineWidth = self->_dividerLineWidth;
    v5->_int64_t maxCellCount = self->_maxCellCount;
    v5->_sharedCellCount = self->_sharedCellCount;
    v5->_double screenScale = self->_screenScale;
    v5->_cellRenderingStyle = self->_cellRenderingStyle;
    v5->_isCandidateUI = self->_isCandidateUI;
  }
  return v5;
}

- (TIKeyboardSecureCandidateTextTraits)inputTextTraits
{
  inputTextTraits = self->_inputTextTraits;
  if (!inputTextTraits)
  {
    id v4 = (TIKeyboardSecureCandidateTextTraits *)objc_opt_new();
    v5 = self->_inputTextTraits;
    self->_inputTextTraits = v4;

    inputTextTraits = self->_inputTextTraits;
  }

  return inputTextTraits;
}

- (TIKeyboardSecureCandidateTextTraits)headerTextTraits
{
  headerTextTraits = self->_headerTextTraits;
  if (!headerTextTraits)
  {
    id v4 = (TIKeyboardSecureCandidateTextTraits *)objc_opt_new();
    v5 = self->_headerTextTraits;
    self->_headerTextTraits = v4;

    headerTextTraits = self->_headerTextTraits;
  }

  return headerTextTraits;
}

- (TIKeyboardSecureCandidateLayoutTraits)layoutTraits
{
  layoutTraits = self->_layoutTraits;
  if (!layoutTraits)
  {
    id v4 = (TIKeyboardSecureCandidateLayoutTraits *)objc_opt_new();
    v5 = self->_layoutTraits;
    self->_layoutTraits = v4;

    layoutTraits = self->_layoutTraits;
  }

  return layoutTraits;
}

- (void)setSingleCellWidth:(double)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSNumber numberWithDouble:a3];
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(TIKeyboardSecureCandidateRenderTraits *)self setResultCountToSingleCellWidth:v5];
}

- (double)singleCellWidth
{
  v2 = [(TIKeyboardSecureCandidateRenderTraits *)self resultCountToSingleCellWidth];
  if ([v2 count])
  {
    v3 = [v2 lastObject];
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (TIKeyboardSecureCandidateRenderTraits)init
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardSecureCandidateRenderTraits;
  v2 = [(TIKeyboardSecureCandidateRenderTraits *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TIKeyboardSecureCandidateRenderTraits *)v2 setCellRenderingStyle:0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end