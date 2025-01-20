@interface SiriUIReviewItemCell
+ (CGSize)sizeThatFits:(CGSize)a3 withReview:(id)a4 characterLimit:(int64_t)a5;
+ (UIEdgeInsets)_defaultEdgeInsets;
+ (id)_authorFontAttribute;
+ (id)_commentLabelFont;
+ (id)_displayTextForComment:(id)a3 characterLimit:(int64_t)a4;
+ (int64_t)defaultCharacterLimit;
- (SiriUIReviewItemCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInsets;
- (id)_relativeStringFromDate:(id)a3;
- (int64_t)characterLimit;
- (void)_setAuthor:(id)a3 andDate:(id)a4 timeZoneId:(id)a5 hasRatingView:(BOOL)a6;
- (void)_setComment:(id)a3;
- (void)_setRatingView:(id)a3;
- (void)configureWithReview:(id)a3 ratingView:(id)a4 offset:(UIOffset)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCharacterLimit:(int64_t)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
@end

@implementation SiriUIReviewItemCell

+ (UIEdgeInsets)_defaultEdgeInsets
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v2 userInterfaceIdiom]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 15.0;
  }

  double v4 = 7.5;
  double v5 = 14.0;
  double v6 = 15.0;
  double v7 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v7;
  result.top = v4;
  return result;
}

+ (int64_t)defaultCharacterLimit
{
  return 500;
}

+ (id)_displayTextForComment:(id)a3 characterLimit:(int64_t)a4
{
  double v5 = (void *)MEMORY[0x263F08708];
  id v6 = a3;
  double v7 = [v5 whitespaceAndNewlineCharacterSet];
  v8 = [v6 stringByTrimmingCharactersInSet:v7];

  unint64_t v9 = [v8 length];
  if (v9 >= a4) {
    int64_t v10 = a4;
  }
  else {
    int64_t v10 = v9;
  }
  if (a4 <= 0) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = v10;
  }
  v12 = objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\n\n", @"\n", 0, 0, v11);

  if ([v12 length] > (unint64_t)a4)
  {
    uint64_t v13 = [v12 substringToIndex:a4];

    v12 = (void *)v13;
  }
  v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
  v15 = [v14 siriUILocalizedStringForKey:@"REVIEW_TEXT_FORMAT"];

  if (v15)
  {
    id v16 = [NSString stringWithValidatedFormat:v15, @"“%@”", 0, v12 validFormatSpecifiers error];
  }
  else
  {
    id v16 = v12;
  }
  v17 = v16;

  return v17;
}

+ (CGSize)sizeThatFits:(CGSize)a3 withReview:(id)a4 characterLimit:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  v47[2] = *MEMORY[0x263EF8340];
  unint64_t v9 = (void *)MEMORY[0x263F1C358];
  id v10 = a4;
  unint64_t v11 = [v9 defaultParagraphStyle];
  v12 = (void *)[v11 mutableCopy];

  [v12 setMinimumLineHeight:20.0];
  [v12 setMaximumLineHeight:20.0];
  if (!sizeThatFits_withReview_characterLimit__sCommentAttributes)
  {
    v46[0] = *MEMORY[0x263F1C238];
    uint64_t v13 = v46[0];
    v14 = [a1 _commentLabelFont];
    v46[1] = *MEMORY[0x263F1C268];
    v47[0] = v14;
    v47[1] = v12;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
    id v16 = (void *)sizeThatFits_withReview_characterLimit__sCommentAttributes;
    sizeThatFits_withReview_characterLimit__sCommentAttributes = v15;

    uint64_t v44 = v13;
    v17 = [a1 _authorFontAttribute];
    v45 = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v19 = (void *)sizeThatFits_withReview_characterLimit__sAuthorAttributes;
    sizeThatFits_withReview_characterLimit__sAuthorAttributes = v18;
  }
  v20 = [v10 comment];
  v21 = [a1 _displayTextForComment:v20 characterLimit:a5];

  v22 = [v10 author];

  if ([v22 length]) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  id v24 = v23;

  [a1 _defaultEdgeInsets];
  double v27 = width - (v25 + v26);
  double v30 = v28 + v29 + 1.0;
  objc_msgSend(v21, "boundingRectWithSize:options:attributes:context:", 1, sizeThatFits_withReview_characterLimit__sCommentAttributes, 0, v27, height);
  double v32 = v30 + v31;
  objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 0, sizeThatFits_withReview_characterLimit__sAuthorAttributes, 0, v27, height);
  double v34 = v33;

  double v35 = v32 + v34;
  v36 = [MEMORY[0x263F1C920] mainScreen];
  [v36 scale];
  double v38 = ceil(v27);
  double v39 = ceil(v35);
  if (v37 >= 2.0) {
    double v40 = v27;
  }
  else {
    double v40 = v38;
  }
  if (v37 >= 2.0) {
    double v41 = v35;
  }
  else {
    double v41 = v39;
  }

  double v42 = v40;
  double v43 = v41;
  result.double height = v43;
  result.double width = v42;
  return result;
}

+ (id)_commentLabelFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "siriui_lightWeightFontWithSize:", 14.0);
}

+ (id)_authorFontAttribute
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "siriui_mediumWeightFontWithSize:", 14.0);
}

- (SiriUIReviewItemCell)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)SiriUIReviewItemCell;
  double v3 = -[SiriUIContentCollectionViewCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(SiriUIContentCollectionViewCell *)v3 setKeylineType:1];
    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    commentLabel = v4->_commentLabel;
    v4->_commentLabel = (UILabel *)v10;

    v12 = v4->_commentLabel;
    uint64_t v13 = [(id)objc_opt_class() _commentLabelFont];
    [(UILabel *)v12 setFont:v13];

    v14 = v4->_commentLabel;
    uint64_t v15 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v14 setTextColor:v15];

    id v16 = v4->_commentLabel;
    v17 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v16 setBackgroundColor:v17];

    [(UILabel *)v4->_commentLabel setNumberOfLines:0];
    [(UILabel *)v4->_commentLabel setLineBreakMode:4];
    [(SiriUIReviewItemCell *)v4 addSubview:v4->_commentLabel];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v6, v7, v8, v9);
    authorLabel = v4->_authorLabel;
    v4->_authorLabel = (UILabel *)v18;

    v20 = v4->_authorLabel;
    v21 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v20 setTextColor:v21];

    v22 = v4->_authorLabel;
    v23 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v22 setBackgroundColor:v23];

    [(SiriUIReviewItemCell *)v4 addSubview:v4->_authorLabel];
    [(id)objc_opt_class() _defaultEdgeInsets];
    v4->_contentInsets.top = v24;
    v4->_contentInsets.left = v25;
    v4->_contentInsets.bottom = v26;
    v4->_contentInsets.right = v27;
    v4->_characterLimit = [(id)objc_opt_class() defaultCharacterLimit];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIReviewItemCell;
  [(SiriUIContentCollectionViewCell *)&v4 prepareForReuse];
  [(UILabel *)self->_commentLabel setText:0];
  [(UILabel *)self->_authorLabel setAttributedText:0];
  [(UIView *)self->_ratingView removeFromSuperview];
  ratingView = self->_ratingView;
  self->_ratingView = 0;
}

- (void)configureWithReview:(id)a3 ratingView:(id)a4 offset:(UIOffset)a5
{
  CGFloat vertical = a5.vertical;
  CGFloat horizontal = a5.horizontal;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [v10 comment];
  [(SiriUIReviewItemCell *)self _setComment:v11];

  [(SiriUIReviewItemCell *)self _setRatingView:v9];
  self->_ratingOffset.CGFloat horizontal = horizontal;
  self->_ratingOffset.CGFloat vertical = vertical;
  id v15 = [v10 lastUpdated];
  v12 = [v10 author];

  uint64_t v13 = [v15 date];
  v14 = [v15 timeZoneId];
  [(SiriUIReviewItemCell *)self _setAuthor:v12 andDate:v13 timeZoneId:v14 hasRatingView:v9 != 0];
}

- (void)_setComment:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _displayTextForComment:v4 characterLimit:self->_characterLimit];

  double v6 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  double v7 = (void *)[v6 mutableCopy];

  [v7 setMinimumLineHeight:20.0];
  [v7 setMaximumLineHeight:20.0];
  id v8 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v11 = *MEMORY[0x263F1C268];
  v12[0] = v7;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = (void *)[v8 initWithString:v5 attributes:v9];

  [(UILabel *)self->_commentLabel setAttributedText:v10];
}

- (void)_setRatingView:(id)a3
{
  id v5 = a3;
  [(UIView *)self->_ratingView removeFromSuperview];
  objc_storeStrong((id *)&self->_ratingView, a3);
  if (self->_ratingView) {
    -[SiriUIReviewItemCell addSubview:](self, "addSubview:");
  }
}

- (void)_setAuthor:(id)a3 andDate:(id)a4 timeZoneId:(id)a5 hasRatingView:(BOOL)a6
{
  BOOL v6 = a6;
  v26[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x263F089B8]);
  uint64_t v12 = [v9 length];
  uint64_t v13 = (uint64_t *)MEMORY[0x263F1C238];
  if (v12)
  {
    if (v6)
    {
      uint64_t v14 = [@" " stringByAppendingString:v9];

      id v9 = (id)v14;
    }
    if (v10)
    {
      uint64_t v15 = [v9 stringByAppendingString:@" "];

      id v9 = (id)v15;
    }
    uint64_t v25 = *v13;
    id v16 = [(id)objc_opt_class() _authorFontAttribute];
    v26[0] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];

    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v9 attributes:v17];
    [v11 appendAttributedString:v18];
  }
  if (v10)
  {
    v19 = [(SiriUIReviewItemCell *)self _relativeStringFromDate:v10];
    if ([v19 length])
    {
      uint64_t v23 = *v13;
      v20 = [(id)objc_opt_class() _authorDateFontAttribute];
      CGFloat v24 = v20;
      v21 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

      v22 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v19 attributes:v21];
      [v11 appendAttributedString:v22];
    }
  }
  [(UILabel *)self->_authorLabel setAttributedText:v11];
  [(UILabel *)self->_authorLabel sizeToFit];
}

- (id)_relativeStringFromDate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v10 = 0;
    goto LABEL_11;
  }
  [v3 timeIntervalSinceNow];
  if ((uint64_t)(v5 / -60.0) <= 1)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x263F08A30], "sruif_localizedStringFromNumber:", &unk_26D658010);
    double v7 = NSString;
    id v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v9 = [v8 siriUILocalizedStringForKey:@"LESS_THAN_ONE_MINUTE_AGO_FORMAT"];
    id v10 = [v7 stringWithValidatedFormat:v9, @"%@", 0, v6 validFormatSpecifiers error];

    goto LABEL_11;
  }
  uint64_t v11 = (uint64_t)(v5 / -3600.0);
  if (v11 > 1)
  {
    if ((uint64_t)(v5 / -86400.0) >= 1)
    {
      id v10 = [MEMORY[0x263F08790] localizedStringFromDate:v4 dateStyle:1 timeStyle:0];
      goto LABEL_11;
    }
    v19 = (void *)MEMORY[0x263F08A30];
    v20 = [NSNumber numberWithInteger:v11];
    uint64_t v14 = objc_msgSend(v19, "sruif_localizedStringFromNumber:", v20);

    uint64_t v15 = NSString;
    id v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v17 = v16;
    uint64_t v18 = @"LESS_THAN_ONE_DAY_HOURS_FORMAT";
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F08A30];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v14 = objc_msgSend(v12, "sruif_localizedStringFromNumber:", v13);

    uint64_t v15 = NSString;
    id v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v17 = v16;
    uint64_t v18 = @"LESS_THAN_ONE_HOUR_MINUTES_FORMAT";
  }
  v21 = [v16 siriUILocalizedStringForKey:v18];
  id v10 = [v15 stringWithValidatedFormat:v21, @"%@", 0, v14 validFormatSpecifiers error];

LABEL_11:
  return v10;
}

- (void)layoutSubviews
{
  *(void *)&recta.size.double height = self;
  v82 = SiriUIReviewItemCell;
  [(CGFloat *)(objc_super *)&recta.size.height layoutSubviews];
  [(SiriUIReviewItemCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  recta.origin.CGFloat y = v8;
  recta.size.CGFloat width = v7;
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double right = self->_contentInsets.right;
  [(UILabel *)self->_authorLabel frame];
  double v13 = v12;
  [(UIView *)self->_ratingView frame];
  double v15 = v14;
  id v16 = [MEMORY[0x263F1C920] mainScreen];
  [v16 scale];
  double v18 = v17;
  [(UIView *)self->_ratingView frame];
  double v20 = ceil(v19);
  if (v18 >= 2.0) {
    double v20 = v19;
  }
  double v80 = v20;

  commentLabel = self->_commentLabel;
  recta.origin.x = v4;
  if (commentLabel)
  {
    if (v13 < v15) {
      double v13 = v15;
    }
    v83.origin.x = v4;
    v83.origin.CGFloat y = v6;
    CGFloat y = recta.origin.y;
    v83.size.CGFloat width = recta.size.width;
    v83.size.double height = recta.origin.y;
    -[UILabel sizeThatFits:](commentLabel, "sizeThatFits:", CGRectGetWidth(v83) - left - right, v13);
    double v24 = v23;
    double v26 = v25;
    CGFloat v27 = [MEMORY[0x263F1C920] mainScreen];
    [v27 scale];
    BOOL v29 = v28 < 2.0;
    double v30 = ceil(left);
    double v31 = ceil(top);
    double v32 = ceil(v24);
    double v33 = ceil(v26);
    if (v29) {
      double v26 = v33;
    }
    if (v29) {
      double v24 = v32;
    }
    if (v29) {
      double v34 = v31;
    }
    else {
      double v34 = top;
    }
    double v35 = left;
    if (v29) {
      double v36 = v30;
    }
    else {
      double v36 = left;
    }

    -[UILabel setFrame:](self->_commentLabel, "setFrame:", v36, v34, v24, v26);
    v84.origin.x = v36;
    v84.origin.CGFloat y = v34;
    v84.size.CGFloat width = v24;
    v84.size.double height = v26;
    double MaxY = CGRectGetMaxY(v84);
    double v38 = [(UILabel *)self->_commentLabel font];
    [v38 descender];
    double v79 = MaxY + v39;

    CGFloat width = recta.size.width;
  }
  else
  {
    double v79 = top;
    double v35 = left;
    CGFloat y = recta.origin.y;
    CGFloat width = recta.size.width;
  }
  authorLabel = self->_authorLabel;
  double v42 = v35;
  if (authorLabel)
  {
    [(UILabel *)authorLabel frame];
    double height = v85.size.height;
    double v44 = v35 + v80;
    v85.origin.x = v35 + v80;
    CGFloat v45 = y;
    double v46 = v79 - CGRectGetHeight(v85);
    v47 = [(UILabel *)self->_authorLabel font];
    [v47 descender];
    double v49 = v46 - v48 + 21.0;

    v86.origin.x = recta.origin.x;
    v86.origin.CGFloat y = v6;
    v86.size.CGFloat width = width;
    v86.size.double height = v45;
    double v50 = CGRectGetMaxX(v86) - v44;
    v51 = [MEMORY[0x263F1C920] mainScreen];
    [v51 scale];
    BOOL v53 = v52 < 2.0;
    double v54 = ceil(v44);
    double v55 = ceil(v49);
    double v56 = ceil(v50);
    double v57 = ceil(height);
    if (v53) {
      double v58 = v54;
    }
    else {
      double v58 = v44;
    }
    if (v53) {
      double v49 = v55;
    }
    if (v53) {
      double v50 = v56;
    }
    if (v53) {
      double v59 = v57;
    }
    else {
      double v59 = height;
    }

    -[UILabel setFrame:](self->_authorLabel, "setFrame:", v58, v49, v50, v59);
  }
  ratingView = self->_ratingView;
  if (ratingView)
  {
    [(UIView *)ratingView frame];
    CGFloat v62 = v61;
    double v64 = v63;
    double v66 = v65;
    double v67 = v42 + self->_ratingOffset.horizontal;
    [(UILabel *)self->_authorLabel frame];
    double MidY = CGRectGetMidY(v87);
    v88.origin.x = v67;
    v88.origin.CGFloat y = v62;
    v88.size.CGFloat width = v64;
    v88.size.double height = v66;
    double v69 = self->_ratingOffset.vertical + MidY + CGRectGetHeight(v88) * -0.5;
    v70 = [MEMORY[0x263F1C920] mainScreen];
    [v70 scale];
    BOOL v72 = v71 < 2.0;
    double v73 = ceil(v67);
    double v74 = ceil(v69);
    double v75 = ceil(v64);
    double v76 = ceil(v66);
    if (v72) {
      double v77 = v73;
    }
    else {
      double v77 = v67;
    }
    if (v72) {
      double v78 = v74;
    }
    else {
      double v78 = v69;
    }
    if (v72) {
      double v64 = v75;
    }
    if (v72) {
      double v66 = v76;
    }

    -[UIView setFrame:](self->_ratingView, "setFrame:", v77, v78, v64, v66);
  }
}

- (int64_t)characterLimit
{
  return self->_characterLimit;
}

- (void)setCharacterLimit:(int64_t)a3
{
  self->_characterLimit = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_commentLabel, 0);
}

@end