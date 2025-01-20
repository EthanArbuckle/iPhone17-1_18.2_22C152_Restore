@interface MusicUsageTableViewCell
+ (double)maximumRowHeightIncludingArtwork:(BOOL)a3 includingSubtitle:(BOOL)a4 traitCollection:(id)a5 sizingCache:(id *)a6;
- (MusicUsageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_fileSizeText;
- (void)_handleArtworkImageUpdate:(id)a3 idealArtworkSize:(CGSize)a4;
- (void)_layoutArtworkViewWithAvailableContentBounds:(CGRect)a3 idealArtworkSize:(CGSize)a4 usingBlock:(id)a5;
- (void)_reloadWithUsageItemFromSpecifier:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
@end

@implementation MusicUsageTableViewCell

+ (double)maximumRowHeightIncludingArtwork:(BOOL)a3 includingSubtitle:(BOOL)a4 traitCollection:(id)a5 sizingCache:(id *)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (!a6) {
    goto LABEL_9;
  }
  if (!v8 || (p_var3 = a6, !v7))
  {
    p_var3 = ($01BB1521EC52D44A8E7628F5261DCEC8 *)&a6->var3;
    if (v7) {
      p_var3 = ($01BB1521EC52D44A8E7628F5261DCEC8 *)&a6->var2;
    }
    if (v8) {
      p_var3 = ($01BB1521EC52D44A8E7628F5261DCEC8 *)&a6->var1;
    }
  }
  double var0 = p_var3->var0;
  if (p_var3->var0 <= 0.00000011920929)
  {
LABEL_9:
    if (v8) {
      double v13 = 48.0;
    }
    else {
      double v13 = 0.0;
    }
    [v9 displayScale];
    v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v14 _bodyLeading];
    MPUFloatCeilForScale();
    double v16 = v15 + 0.0;
    if (v7)
    {
      v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
      [v17 _bodyLeading];
      [v14 _bodyLeading];
      [v14 ascender];
      [v17 _scaledValueForValue:16.0];
      [v17 ascender];
      MPUFloatCeilForScale();
      double v16 = v16 + v18;
    }
    double v19 = v16 + 8.0;
    if (v13 >= v16 + 8.0) {
      double v19 = v13;
    }
    if (v19 >= 52.0) {
      double var0 = v19;
    }
    else {
      double var0 = 52.0;
    }
    if (a6)
    {
      if (!v8 || !v7)
      {
        if (v8)
        {
          a6 = ($01BB1521EC52D44A8E7628F5261DCEC8 *)((char *)a6 + 8);
        }
        else if (v7)
        {
          a6 = ($01BB1521EC52D44A8E7628F5261DCEC8 *)((char *)a6 + 16);
        }
        else
        {
          a6 = ($01BB1521EC52D44A8E7628F5261DCEC8 *)((char *)a6 + 24);
        }
      }
      a6->double var0 = var0;
    }
  }
  return var0;
}

- (MusicUsageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MusicUsageTableViewCell;
  id v9 = [(MusicUsageTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(MusicUsageTableViewCell *)v9 setSpecifier:v8];
    [(MusicUsageTableViewCell *)v10 _reloadWithUsageItemFromSpecifier:v8];
  }

  return v10;
}

- (void)layoutSubviews
{
  v121.receiver = self;
  v121.super_class = (Class)MusicUsageTableViewCell;
  [(MusicUsageTableViewCell *)&v121 layoutSubviews];
  v105 = [(MusicUsageTableViewCell *)self traitCollection];
  [v105 displayScale];
  double v4 = v3;
  v5 = [(MusicUsageTableViewCell *)self contentView];
  [v5 bounds];
  double v108 = v7;
  double v109 = v6;
  CGFloat v106 = v9;
  double v107 = v8;
  [(MusicUsageTableViewCell *)self layoutMargins];
  double v11 = v10;
  double v13 = v12;
  id v14 = [(MusicUsageTableViewCell *)self accessoryType];
  if (v14) {
    double v15 = 0.0;
  }
  else {
    double v15 = v13;
  }
  uint64_t v113 = 0;
  v114 = (CGRect *)&v113;
  uint64_t v115 = 0x4010000000;
  v116 = "";
  double v117 = v109 + v11;
  double v118 = v108 + 0.0;
  double v119 = v107 - (v11 + v15);
  CGFloat v120 = v106;
  if (v14)
  {
    double v16 = +[UIApplication sharedApplication];
    BOOL v17 = [v16 userInterfaceLayoutDirection] == (char *)&dword_0 + 1;

    double v18 = v114;
    if (v17)
    {
      v114[1].origin.x = 0.0;
      p_x = &v18[1].origin.x;
      p_double height = p_x + 3;
      p_double width = p_x + 2;
      p_y = p_x + 1;
      v23 = p_x;
    }
    else
    {
      v23 = &v114[1].origin.x;
      p_y = &v114[1].origin.y;
      p_double width = &v114[1].size.width;
      p_double height = &v114[1].size.height;
    }
  }
  else
  {
    v23 = &v117;
    p_y = &v118;
    p_double width = &v119;
    p_double height = &v120;
  }
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = sub_29F8;
  v112[3] = &unk_103F0;
  v112[4] = self;
  v112[5] = &v113;
  *(double *)&v112[6] = v4;
  *(double *)&v112[7] = v109;
  *(double *)&v112[8] = v108;
  *(double *)&v112[9] = v107;
  *(CGFloat *)&v112[10] = v106;
  -[MusicUsageTableViewCell _layoutArtworkViewWithAvailableContentBounds:idealArtworkSize:usingBlock:](self, "_layoutArtworkViewWithAvailableContentBounds:idealArtworkSize:usingBlock:", v112, *v23, *p_y, *p_width, *p_height, 40.0, 40.0);
  v24 = [(MusicUsageTableViewCell *)self _fileSizeText];
  id v25 = [v24 length];
  fileSizeLabel = self->_fileSizeLabel;
  if (v25)
  {
    if (!fileSizeLabel)
    {
      v27 = (UILabel *)objc_alloc_init((Class)UILabel);
      v28 = self->_fileSizeLabel;
      self->_fileSizeLabel = v27;

      v29 = self->_fileSizeLabel;
      v30 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [(UILabel *)v29 setFont:v30];

      v31 = self->_fileSizeLabel;
      v32 = +[UIColor tableCellGrayTextColor];
      [(UILabel *)v31 setTextColor:v32];

      [(UILabel *)self->_fileSizeLabel setTextAlignment:4];
      [v5 addSubview:self->_fileSizeLabel];
      fileSizeLabel = self->_fileSizeLabel;
    }
    if ([(UILabel *)fileSizeLabel isHidden]) {
      [(UILabel *)self->_fileSizeLabel setHidden:0];
    }
    double width = v114[1].size.width;
    double height = v114[1].size.height;
    [(UILabel *)self->_fileSizeLabel setText:v24];
    -[UILabel sizeThatFits:](self->_fileSizeLabel, "sizeThatFits:", width, height);
    if (v35 < width) {
      double width = v35;
    }
    if (v36 < height) {
      double height = v36;
    }
    CGRectGetMaxX(v114[1]);
    v123.origin.x = CGRectZero.origin.x;
    v123.origin.y = CGRectZero.origin.y;
    v123.size.double width = width;
    v123.size.double height = height;
    CGRectGetWidth(v123);
    UIRectCenteredYInRectScale();
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    [(UILabel *)self->_fileSizeLabel setFrame:MusicRectByApplyingUserInterfaceLayoutDirectionInRect((uint64_t)[(MusicUsageTableViewCell *)self effectiveUserInterfaceLayoutDirection], v37, v39, v41, v43, v109, v108, v107, v106)];
    double MaxX = CGRectGetMaxX(v114[1]);
    v124.origin.x = v38;
    v124.origin.y = v40;
    v124.size.double width = v42;
    v124.size.double height = v44;
    CGFloat MinX = CGRectGetMinX(v124);
    v47 = v114;
    v114[1].size.double width = v114[1].size.width - (MaxX - MinX + 8.0);
  }
  else
  {
    [(UILabel *)fileSizeLabel setHidden:1];
    v47 = v114;
  }
  CGPoint origin = v47[1].origin;
  CGSize size = v47[1].size;
  v48 = self->_usageItemTitle;
  NSUInteger v49 = [(NSString *)v48 length];
  titleLabel = self->_titleLabel;
  if (v49)
  {
    if (!titleLabel)
    {
      v51 = (UILabel *)objc_alloc_init((Class)UILabel);
      v52 = self->_titleLabel;
      self->_titleLabel = v51;

      v53 = self->_titleLabel;
      v54 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [(UILabel *)v53 setFont:v54];

      v55 = self->_titleLabel;
      v56 = +[UIColor _labelColor];
      [(UILabel *)v55 setTextColor:v56];

      [(UILabel *)self->_titleLabel setTextAlignment:4];
      [v5 addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    if ([(UILabel *)titleLabel isHidden]) {
      [(UILabel *)self->_titleLabel setHidden:0];
    }
    double v57 = v114[1].size.width;
    double v58 = v114[1].size.height;
    [(UILabel *)self->_titleLabel setText:v48];
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v57, v58);
    if (v59 < v57) {
      double v57 = v59;
    }
    if (v60 < v58) {
      double v58 = v60;
    }
    CGFloat v61 = CGRectGetMinX(v114[1]);
    CGFloat MinY = CGRectGetMinY(v114[1]);
    v125.origin.x = v61;
    v125.origin.y = MinY;
    v125.size.double width = v57;
    v125.size.double height = v58;
    CGRectGetMinY(v125);
    v126.origin.x = v61;
    v126.origin.y = MinY;
    v126.size.double width = v57;
    v126.size.double height = v58;
    CGRectGetMaxY(v126);
    [(UILabel *)self->_titleLabel setFrame:MusicRectByApplyingUserInterfaceLayoutDirectionInRect((uint64_t)[(MusicUsageTableViewCell *)self effectiveUserInterfaceLayoutDirection], v61, MinY, v57, v58, v109, v108, v107, v106)];
    v127.origin.x = v61;
    v127.origin.y = MinY;
    v127.size.double width = v57;
    v127.size.double height = v58;
    CGFloat v63 = CGRectGetHeight(v127) + 0.0;
    v64 = v114;
    v114[1].origin.y = v63 + v114[1].origin.y;
    v64[1].size.double height = v64[1].size.height - v63;
    v65 = self->_titleLabel;
  }
  else
  {
    [(UILabel *)titleLabel setHidden:1];
    v65 = 0;
  }
  v66 = self->_usageItemSubtitles;
  NSUInteger v67 = [(NSArray *)v66 count];
  subtitleLabel = self->_subtitleLabel;
  if (v67)
  {
    if (!subtitleLabel)
    {
      v69 = (MPUAbbreviatingLabel *)objc_alloc_init((Class)MPUAbbreviatingLabel);
      v70 = self->_subtitleLabel;
      self->_subtitleLabel = v69;

      v71 = self->_subtitleLabel;
      v72 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
      [(MPUAbbreviatingLabel *)v71 setFont:v72];

      v73 = self->_subtitleLabel;
      v74 = PreferencesTableViewHeaderColor();
      [(MPUAbbreviatingLabel *)v73 setTextColor:v74];

      [(MPUAbbreviatingLabel *)self->_subtitleLabel setTextAlignment:4];
      [v5 addSubview:self->_subtitleLabel];
      subtitleLabel = self->_subtitleLabel;
    }
    if ([(MPUAbbreviatingLabel *)subtitleLabel isHidden]) {
      [(MPUAbbreviatingLabel *)self->_subtitleLabel setHidden:0];
    }
    double v76 = v114[1].size.width;
    double v75 = v114[1].size.height;
    if (v65)
    {
      v77 = [(MPUAbbreviatingLabel *)self->_subtitleLabel font];
      [v77 _scaledValueForValue:16.0];
      double v79 = v78;
      [v77 ascender];
      double v81 = v80;
      [(UILabel *)v65 _baselineOffsetFromBottom];
      double v83 = v82;

      double v84 = round(v4 * (v79 - v81)) / v4;
      double v75 = v75 + v83 - v84;
    }
    else
    {
      double v84 = 0.0;
    }
    [(MPUAbbreviatingLabel *)self->_subtitleLabel setTextRepresentations:v66];
    -[MPUAbbreviatingLabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v76, v75);
    if (v85 < v75) {
      double v75 = v85;
    }
    CGFloat v86 = CGRectGetMinX(v114[1]);
    [(UILabel *)v65 frame];
    double MaxY = CGRectGetMaxY(v128);
    if (v65)
    {
      double v88 = MaxY;
      [(UILabel *)v65 _baselineOffsetFromBottom];
      double v90 = v84 + v88 - v89;
    }
    else
    {
      double v90 = CGRectGetMinY(v114[1]);
    }
    v129.origin.x = v86;
    v129.origin.y = v90;
    v129.size.double width = v76;
    v129.size.double height = v75;
    CGRectGetMinY(v129);
    v130.origin.x = v86;
    v130.origin.y = v90;
    v130.size.double width = v76;
    v130.size.double height = v75;
    CGRectGetMaxY(v130);
    [(MPUAbbreviatingLabel *)self->_subtitleLabel setFrame:MusicRectByApplyingUserInterfaceLayoutDirectionInRect((uint64_t)[(MusicUsageTableViewCell *)self effectiveUserInterfaceLayoutDirection], v86, v90, v76, v75, v109, v108, v107, v106)];
  }
  else
  {
    [(MPUAbbreviatingLabel *)subtitleLabel setHidden:1];
  }
  v91 = v114;
  v114[1].CGPoint origin = origin;
  v91[1].CGSize size = size;
  CGRectGetHeight(v91[1]);
  v122[0] = self->_titleLabel;
  v92 = self->_subtitleLabel;
  uint64_t v93 = 0;
  v122[1] = v92;
  char v94 = 1;
  do
  {
    char v95 = v94;
    id v96 = (id)v122[v93];
    v97 = v96;
    if (v96 && ([v96 isHidden] & 1) == 0)
    {
      [v97 frame];
      objc_msgSend(v97, "setFrame:");
    }

    char v94 = 0;
    uint64_t v93 = 1;
  }
  while ((v95 & 1) != 0);
  [(MusicUsageTableViewCell *)self separatorInset];
  double v99 = v98;
  double v101 = v100;
  double v103 = v102;
  [(UILabel *)self->_titleLabel frame];
  -[MusicUsageTableViewCell setSeparatorInset:](self, "setSeparatorInset:", v99, CGRectGetMinX(v131), v101, v103);
  for (uint64_t i = 1; i != -1; --i)

  _Block_object_dispose(&v113, 8);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  [(MusicUsageTableViewCell *)self setSpecifier:v5];
  [(MusicUsageTableViewCell *)self _reloadWithUsageItemFromSpecifier:v5];
}

- (id)_fileSizeText
{
  uint64_t v2 = [(MusicUsageTableViewCell *)self specifier];
  double v3 = (char *)v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(v2 + OBJC_IVAR___PSSpecifier_getter);
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + OBJC_IVAR___PSSpecifier_target));
    double v6 = (void (*)(id, void, char *))[WeakRetained methodForSelector:v4];

    id v7 = objc_loadWeakRetained((id *)&v3[OBJC_IVAR___PSSpecifier_target]);
    double v8 = v6(v7, *(void *)&v3[OBJC_IVAR___PSSpecifier_getter], v3);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)_handleArtworkImageUpdate:(id)a3 idealArtworkSize:(CGSize)a4
{
  id v11 = a3;
  if (v11)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[UIColor colorWithWhite:0.85 alpha:1.0];
  }
  [(UIImageView *)self->_artworkView setImage:v11];
  [(UIImageView *)self->_artworkView setBackgroundColor:v5];
  [v11 size];
  double v8 = v7;
  double v9 = 0.0;
  if (v6 > 0.00000011920929 && v8 > 0.00000011920929)
  {
    double v9 = 1.0;
    if (!self->_usageItemArtworkWantsCircleTreatment) {
      double v9 = v6 / v8;
    }
  }
  if (!MusicFloatEqualToFloat(self->_lastUsedArtworkViewAspectRatio, v9)) {
    [(MusicUsageTableViewCell *)self setNeedsLayout];
  }
}

- (void)_layoutArtworkViewWithAvailableContentBounds:(CGRect)a3 idealArtworkSize:(CGSize)a4 usingBlock:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = (void (**)(id, UIImageView *, double, double, double, double))a5;
  artworkView = self->_artworkView;
  if (!self->_usageItemHasArtworkCatalogBlock)
  {
    [(UIImageView *)artworkView setHidden:1];
    goto LABEL_23;
  }
  if (!artworkView)
  {
    double v10 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    id v11 = self->_artworkView;
    self->_artworkView = v10;

    double v12 = [(UIImageView *)self->_artworkView layer];
    id v13 = +[UIColor colorWithWhite:0.0 alpha:0.1];
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    [(UIImageView *)self->_artworkView setClipsToBounds:1];
    id v14 = self->_artworkView;
    if (self->_usageItemArtworkWantsCircleTreatment)
    {
      [(UIImageView *)v14 setContentMode:2];
      [(UIImageView *)self->_artworkView _setCornerRadius:width * 0.5];
    }
    else
    {
      [(UIImageView *)v14 setContentMode:1];
      [(UIImageView *)self->_artworkView _setContinuousCornerRadius:4.0];
    }
    double v15 = [(MusicUsageTableViewCell *)self contentView];
    [v15 addSubview:self->_artworkView];

    artworkView = self->_artworkView;
  }
  [(UIImageView *)artworkView setHidden:0];
  double v16 = [(MusicUsageTableViewCell *)self traitCollection];
  [v16 displayScale];
  double v18 = MusicSafeDisplayScale(v17);
  double v19 = [(UIImageView *)self->_artworkView layer];
  [v19 setBorderWidth:1.0 / v18];

  if (width > 0.00000011920929 && height > 0.00000011920929)
  {
    v20 = [(UIImageView *)self->_artworkView image];
    v21 = v20;
    if (v20)
    {
      [v20 size];
      double v24 = v22;
      if (v22 > 0.00000011920929 && v23 > 0.00000011920929)
      {
        double v36 = v23;
        double v37 = height / v23;
        if (MusicFloatEqualToFloat(width / v22, height / v23))
        {
          double v28 = 1.0;
          double v27 = width;
          double v26 = height;
          if (!self->_usageItemArtworkWantsCircleTreatment)
          {
            double v27 = width;
            double v26 = height;
            double v28 = width / height;
          }
        }
        else
        {
          double v38 = v37;
          double v39 = width / v24;
          double v28 = 1.0;
          double v27 = width;
          double v26 = height;
          if (!self->_usageItemArtworkWantsCircleTreatment)
          {
            if (v39 >= v38) {
              double v39 = v38;
            }
            double v40 = floor(v18 * (v24 * v39));
            double v27 = v40 / v18;
            double v41 = floor(v18 * (v36 * v39));
            double v26 = v41 / v18;
            double v28 = v40 / v18 / (v41 / v18);
          }
        }

        goto LABEL_18;
      }
    }
  }
  double v26 = height;
  double v27 = width;
  double v28 = width / height;
LABEL_18:
  self->_lastUsedArtworkViewAspectRatio = v28;
  v8[2](v8, self->_artworkView, v27, v26, width, height);
  if (!self->_artworkConfigurationBlockEnabled)
  {
    v29 = self->_usageItem;
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    [(UIImageView *)self->_artworkView frame];
    double v31 = v30;
    double v33 = v32;
    v34 = self->_usageItemArtworkCatalog;
    [(MPArtworkCatalog *)v34 setDestinationScale:v18];
    -[MPArtworkCatalog setFittingSize:](v34, "setFittingSize:", v31, v33);
    CGFloat v42 = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    CGFloat v44 = sub_318C;
    v45 = &unk_10418;
    double v35 = v29;
    double v48 = width;
    double v49 = height;
    v46 = v35;
    v47 = &v50;
    [(MPArtworkCatalog *)v34 setDestination:self configurationBlock:&v42];
    self->_artworkConfigurationBlockEnabled = 1;
    if (!*((unsigned char *)v51 + 24)) {
      -[MusicUsageTableViewCell _handleArtworkImageUpdate:idealArtworkSize:](self, "_handleArtworkImageUpdate:idealArtworkSize:", 0, width, height, v42, v43, v44, v45);
    }

    _Block_object_dispose(&v50, 8);
  }

LABEL_23:
}

- (void)_reloadWithUsageItemFromSpecifier:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:@"MusicUsageItemPropertyKey"];
  id v5 = v4;
  p_usageItem = &self->_usageItem;
  if (self->_usageItem != v4)
  {
    obj = v4;
    if (self->_artworkConfigurationBlockEnabled)
    {
      [(MusicUsageTableViewCell *)self clearArtworkCatalogs];
      self->_artworkConfigurationBlockEnabled = 0;
    }
    objc_storeStrong((id *)&self->_usageItem, obj);
    double v7 = [(MusicUsageItem *)*p_usageItem artworkCatalog];
    usageItemArtworkCatalog = self->_usageItemArtworkCatalog;
    self->_usageItemArtworkCatalog = v7;

    double v9 = [(MusicUsageItem *)*p_usageItem artworkCatalogBlock];
    self->_usageItemHasArtworkCatalogBlock = v9 != 0;

    self->_usageItemArtworkWantsCircleTreatment = [(MusicUsageItem *)*p_usageItem artworkWantsCircleTreatment];
    double v10 = [(MusicUsageItem *)*p_usageItem subtitles];
    id v11 = (NSArray *)[v10 copy];
    usageItemSubtitles = self->_usageItemSubtitles;
    self->_usageItemSubtitles = v11;

    id v13 = [(MusicUsageItem *)*p_usageItem title];
    id v14 = (NSString *)[v13 copy];
    usageItemTitle = self->_usageItemTitle;
    self->_usageItemTitle = v14;

    double v16 = [(MusicUsageItem *)*p_usageItem childUsageGroup];

    BOOL v17 = v16 != 0;
    if (v16) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 0;
    }
    [(MusicUsageTableViewCell *)self setAccessoryType:v17];
    [(MusicUsageTableViewCell *)self setSelectionStyle:v18];
    uint64_t v4 = (MusicUsageItem *)[(MusicUsageTableViewCell *)self setNeedsLayout];
    id v5 = obj;
  }

  _objc_release_x1(v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageItemTitle, 0);
  objc_storeStrong((id *)&self->_usageItemSubtitles, 0);
  objc_storeStrong((id *)&self->_usageItemArtworkCatalog, 0);
  objc_storeStrong((id *)&self->_usageItem, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_fileSizeLabel, 0);

  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end