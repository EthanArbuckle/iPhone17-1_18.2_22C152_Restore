@interface PXDiagnosticsCurationViewCell
+ (double)cellHeightWithCellWidth:(double)a3;
- (BOOL)isBlurry;
- (BOOL)isFavorite;
- (BOOL)isSDOFOrHDR;
- (BOOL)isUtility;
- (NSDictionary)debugInfo;
- (NSNumber)dedupedSymbolIndex;
- (NSNumber)symbolIndex;
- (NSString)alternateState;
- (NSString)clusterState;
- (NSString)dedupingType;
- (NSString)representedAssetIdentifier;
- (NSString)state;
- (PXDiagnosticsCurationViewCell)initWithFrame:(CGRect)a3;
- (UIImage)thumbnailImage;
- (double)aestheticScore;
- (double)contentScore;
- (double)criteriaScore;
- (double)iconicScore;
- (unint64_t)index;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAestheticScore:(double)a3;
- (void)setAlternateState:(id)a3;
- (void)setBlurry:(BOOL)a3;
- (void)setClusterParity:(unint64_t)a3;
- (void)setClusterState:(id)a3;
- (void)setComparisonMatch:(BOOL)a3;
- (void)setContentScore:(double)a3;
- (void)setCriteriaScore:(double)a3;
- (void)setDebugInfo:(id)a3;
- (void)setDedupedSymbolIndex:(id)a3;
- (void)setDedupingType:(id)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setIconicScore:(double)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setRepresentedAssetIdentifier:(id)a3;
- (void)setSDOFOrHDR:(BOOL)a3;
- (void)setState:(id)a3;
- (void)setSymbolIndex:(id)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setUtility:(BOOL)a3;
@end

@implementation PXDiagnosticsCurationViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedupedSymbolIndex, 0);
  objc_storeStrong((id *)&self->_dedupingType, 0);
  objc_storeStrong((id *)&self->_symbolIndex, 0);
  objc_storeStrong((id *)&self->_clusterState, 0);
  objc_storeStrong((id *)&self->_alternateState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_representedAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_indexView, 0);
  objc_storeStrong((id *)&self->_dedupedSymbolBadgeView, 0);
  objc_storeStrong((id *)&self->_symbolBadgeView, 0);
  objc_storeStrong((id *)&self->_iconicScoreView, 0);
  objc_storeStrong((id *)&self->_criteriaScoreView, 0);
  objc_storeStrong((id *)&self->_contentScoreView, 0);
  objc_storeStrong((id *)&self->_aestheticScoreView, 0);
  objc_storeStrong((id *)&self->_blurryBadgeView, 0);
  objc_storeStrong((id *)&self->_utilityBadgeView, 0);
  objc_storeStrong((id *)&self->_favoriteBadgeView, 0);
  objc_storeStrong((id *)&self->_sdofOrHDRBadgeView, 0);
  objc_storeStrong((id *)&self->_dedupingBadgeView, 0);
  objc_storeStrong((id *)&self->_alternateStateBadgeView, 0);
  objc_storeStrong((id *)&self->_stateBadgeView, 0);
  objc_storeStrong((id *)&self->_clusterStateBadgeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (unint64_t)index
{
  return self->_index;
}

- (NSNumber)dedupedSymbolIndex
{
  return self->_dedupedSymbolIndex;
}

- (NSString)dedupingType
{
  return self->_dedupingType;
}

- (NSNumber)symbolIndex
{
  return self->_symbolIndex;
}

- (double)iconicScore
{
  return self->_iconicScore;
}

- (double)criteriaScore
{
  return self->_criteriaScore;
}

- (double)contentScore
{
  return self->_contentScore;
}

- (double)aestheticScore
{
  return self->_aestheticScore;
}

- (NSString)clusterState
{
  return self->_clusterState;
}

- (NSString)alternateState
{
  return self->_alternateState;
}

- (NSString)state
{
  return self->_state;
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setRepresentedAssetIdentifier:(id)a3
{
}

- (NSString)representedAssetIdentifier
{
  return self->_representedAssetIdentifier;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (BOOL)isSDOFOrHDR
{
  return self->_isSDOFOrHDR;
}

- (BOOL)isBlurry
{
  return self->_isBlurry;
}

- (BOOL)isUtility
{
  return self->_isUtility;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setComparisonMatch:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4FB1618] greenColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] redColor];
  }
  v4 = [(PXDiagnosticsCurationViewCell *)self contentView];
  [v4 setBackgroundColor:v5];
}

- (void)setClusterParity:(unint64_t)a3
{
  if (a3 == 2)
  {
    v4 = (void *)MEMORY[0x1E4FB1618];
    double v7 = 0.7;
    double v5 = 1.0;
    double v6 = 1.0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = (void *)MEMORY[0x1E4FB1618];
    double v5 = 0.7;
    double v6 = 1.0;
    double v7 = 1.0;
LABEL_5:
    id v9 = [v4 colorWithRed:v5 green:v6 blue:v7 alpha:0.5];
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:
  v8 = [(PXDiagnosticsCurationViewCell *)self contentView];
  [v8 setBackgroundColor:v9];
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
  -[PXIndexView setIndex:](self->_indexView, "setIndex:");
}

- (void)setDedupedSymbolIndex:(id)a3
{
  p_dedupedSymbolIndex = &self->_dedupedSymbolIndex;
  objc_storeStrong((id *)&self->_dedupedSymbolIndex, a3);
  id v6 = a3;
  [(PXSymbolBadgeView *)self->_dedupedSymbolBadgeView setIndex:*p_dedupedSymbolIndex];
}

- (void)setSymbolIndex:(id)a3
{
  p_symbolIndex = &self->_symbolIndex;
  objc_storeStrong((id *)&self->_symbolIndex, a3);
  id v6 = a3;
  [(PXSymbolBadgeView *)self->_symbolBadgeView setIndex:*p_symbolIndex];
}

- (void)setIconicScore:(double)a3
{
  self->_iconicScore = a3;
  -[PXScoreView setScore:](self->_iconicScoreView, "setScore:");
}

- (void)setCriteriaScore:(double)a3
{
  self->_double criteriaScore = a3;
  criteriaScoreView = self->_criteriaScoreView;
  if (a3 >= -0.5)
  {
    [(PXScoreView *)criteriaScoreView setHidden:0];
    double v5 = self->_criteriaScoreView;
    double criteriaScore = self->_criteriaScore;
    [(PXScoreView *)v5 setScore:criteriaScore];
  }
  else
  {
    [(PXScoreView *)criteriaScoreView setHidden:1];
  }
}

- (void)setContentScore:(double)a3
{
  self->_double contentScore = a3;
  contentScoreView = self->_contentScoreView;
  if (a3 >= 0.0)
  {
    [(PXScoreView *)contentScoreView setHidden:0];
    double v5 = self->_contentScoreView;
    double contentScore = self->_contentScore;
    [(PXScoreView *)v5 setScore:contentScore];
  }
  else
  {
    [(PXScoreView *)contentScoreView setHidden:1];
  }
}

- (void)setAestheticScore:(double)a3
{
  self->_double aestheticScore = a3;
  aestheticScoreView = self->_aestheticScoreView;
  if (a3 == -1.79769313e308)
  {
    [(PXScoreView *)aestheticScoreView setHidden:1];
  }
  else
  {
    [(PXScoreView *)aestheticScoreView setHidden:0];
    double v5 = self->_aestheticScoreView;
    double aestheticScore = self->_aestheticScore;
    [(PXScoreView *)v5 setScore:aestheticScore];
  }
}

- (void)setBlurry:(BOOL)a3
{
  self->_isBlurry = a3;
  [(PXTextSymbolView *)self->_blurryBadgeView setHidden:!a3];
}

- (void)setUtility:(BOOL)a3
{
  self->_isUtility = a3;
  [(PXTextSymbolView *)self->_utilityBadgeView setHidden:!a3];
}

- (void)setFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
  [(PXTextSymbolView *)self->_favoriteBadgeView setHidden:!a3];
}

- (void)setSDOFOrHDR:(BOOL)a3
{
  self->_isSDOFOrHDR = a3;
  [(PXTextSymbolView *)self->_sdofOrHDRBadgeView setHidden:!a3];
}

- (void)setDedupingType:(id)a3
{
  p_dedupingType = &self->_dedupingType;
  objc_storeStrong((id *)&self->_dedupingType, a3);
  id v6 = a3;
  [(PXDedupingBadgeView *)self->_dedupingBadgeView setDedupingType:*p_dedupingType];
}

- (void)setAlternateState:(id)a3
{
  p_alternateState = &self->_alternateState;
  objc_storeStrong((id *)&self->_alternateState, a3);
  id v6 = a3;
  [(PXStateBadgeView *)self->_alternateStateBadgeView setState:*p_alternateState];
}

- (void)setState:(id)a3
{
  p_state = &self->_state;
  objc_storeStrong((id *)&self->_state, a3);
  id v6 = a3;
  [(PXStateBadgeView *)self->_stateBadgeView setState:*p_state];
}

- (void)setClusterState:(id)a3
{
  p_clusterState = &self->_clusterState;
  objc_storeStrong((id *)&self->_clusterState, a3);
  id v6 = a3;
  [(PXStateBadgeView *)self->_clusterStateBadgeView setState:*p_clusterState];
}

- (void)setDebugInfo:(id)a3
{
  id v20 = a3;
  objc_storeStrong((id *)&self->_debugInfo, a3);
  double v5 = [v20 objectForKeyedSubscript:@"state"];
  [(PXDiagnosticsCurationViewCell *)self setState:v5];

  [(PXDiagnosticsCurationViewCell *)self setAlternateState:0];
  id v6 = [v20 objectForKeyedSubscript:@"dedupingType"];
  [(PXDiagnosticsCurationViewCell *)self setDedupingType:v6];

  double v7 = [v20 objectForKeyedSubscript:@"isSDOFOrHDR"];
  -[PXDiagnosticsCurationViewCell setSDOFOrHDR:](self, "setSDOFOrHDR:", [v7 BOOLValue]);

  v8 = [v20 objectForKeyedSubscript:@"isFavorite"];
  -[PXDiagnosticsCurationViewCell setFavorite:](self, "setFavorite:", [v8 BOOLValue]);

  id v9 = [v20 objectForKeyedSubscript:@"isUtility"];
  -[PXDiagnosticsCurationViewCell setUtility:](self, "setUtility:", [v9 BOOLValue]);

  v10 = [v20 objectForKeyedSubscript:@"isBlurry"];
  -[PXDiagnosticsCurationViewCell setBlurry:](self, "setBlurry:", [v10 BOOLValue]);

  if (v20)
  {
    v11 = [v20 objectForKeyedSubscript:@"aestheticScore"];
    [v11 doubleValue];
    -[PXDiagnosticsCurationViewCell setAestheticScore:](self, "setAestheticScore:");

    v12 = [v20 objectForKeyedSubscript:@"contentScore"];
    [v12 doubleValue];
    -[PXDiagnosticsCurationViewCell setContentScore:](self, "setContentScore:");
  }
  else
  {
    [(PXDiagnosticsCurationViewCell *)self setAestheticScore:-1.79769313e308];
    [(PXDiagnosticsCurationViewCell *)self setContentScore:-1.0];
  }
  v13 = [v20 objectForKeyedSubscript:@"passesCriteria"];
  v14 = v13;
  if (v13)
  {
    char v15 = [v13 BOOLValue];
    double v16 = -0.5;
    if (v15)
    {
      v17 = objc_msgSend(v20, "objectForKeyedSubscript:", @"criteriaScore", -0.5);
      [v17 doubleValue];
      -[PXDiagnosticsCurationViewCell setCriteriaScore:](self, "setCriteriaScore:");

      goto LABEL_9;
    }
  }
  else
  {
    double v16 = -1.0;
  }
  [(PXDiagnosticsCurationViewCell *)self setCriteriaScore:v16];
LABEL_9:
  if (v20)
  {
    v18 = [v20 objectForKeyedSubscript:@"iconicScore"];
    [v18 doubleValue];
    -[PXDiagnosticsCurationViewCell setIconicScore:](self, "setIconicScore:");
  }
  else
  {
    [(PXDiagnosticsCurationViewCell *)self setIconicScore:-1.0];
  }
  v19 = [v20 objectForKeyedSubscript:@"index"];
  -[PXDiagnosticsCurationViewCell setIndex:](self, "setIndex:", [v19 unsignedIntegerValue]);
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
  id v5 = a3;
  [(UIImageView *)self->_imageView setImage:v5];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PXDiagnosticsCurationViewCell;
  [(PXDiagnosticsCurationViewCell *)&v3 prepareForReuse];
  [(PXDiagnosticsCurationViewCell *)self setThumbnailImage:0];
  [(PXDiagnosticsCurationViewCell *)self setRepresentedAssetIdentifier:0];
  [(PXStateBadgeView *)self->_clusterStateBadgeView setState:0];
  [(PXStateBadgeView *)self->_stateBadgeView setState:@"Unknown"];
  [(PXStateBadgeView *)self->_stateBadgeView setHidden:1];
  [(PXStateBadgeView *)self->_alternateStateBadgeView setState:@"Unknown"];
  [(PXStateBadgeView *)self->_alternateStateBadgeView setHidden:1];
  [(PXTextSymbolView *)self->_sdofOrHDRBadgeView setHidden:1];
  [(PXTextSymbolView *)self->_favoriteBadgeView setHidden:1];
  [(PXTextSymbolView *)self->_utilityBadgeView setHidden:1];
  [(PXTextSymbolView *)self->_blurryBadgeView setHidden:1];
  [(PXScoreView *)self->_aestheticScoreView setScore:-1.0];
  [(PXScoreView *)self->_contentScoreView setScore:-1.0];
  [(PXScoreView *)self->_criteriaScoreView setScore:-1.0];
  [(PXScoreView *)self->_iconicScoreView setScore:-1.0];
  [(PXTextSymbolView *)self->_symbolBadgeView setSymbol:0];
  [(PXTextSymbolView *)self->_dedupedSymbolBadgeView setSymbol:0];
  [(PXIndexView *)self->_indexView setIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PXDiagnosticsCurationViewCell;
  [(PXDiagnosticsCurationViewCell *)&v11 layoutSubviews];
  objc_super v3 = [(PXDiagnosticsCurationViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v10 = v4;
  double v7 = v6;

  -[PXStateBadgeView setFrame:](self->_clusterStateBadgeView, "setFrame:", 1.0, 1.0, 16.0, 16.0);
  double v8 = v7 + -6.0 + -16.0;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 3.0, 19.0, v5 + -6.0, v8);
  -[PXStateBadgeView setFrame:](self->_stateBadgeView, "setFrame:", 3.0, 3.0, 16.0, 16.0);
  -[PXStateBadgeView setFrame:](self->_alternateStateBadgeView, "setFrame:", v5 + -6.0 + -3.0 + -16.0, 3.0, 16.0, 16.0);
  -[PXDedupingBadgeView setFrame:](self->_dedupingBadgeView, "setFrame:", v5 + -6.0 + -3.0 + -32.0 + -1.0, 3.0, 16.0, 16.0);
  -[PXTextSymbolView setFrame:](self->_sdofOrHDRBadgeView, "setFrame:", 3.0, v8 + -32.0 + -1.0 + -3.0, 16.0, 16.0);
  -[PXTextSymbolView setFrame:](self->_favoriteBadgeView, "setFrame:", 3.0, v8 + -16.0 + -3.0, 16.0, 16.0);
  -[PXTextSymbolView setFrame:](self->_utilityBadgeView, "setFrame:", 20.0, v8 + -16.0 + -3.0, 16.0, 16.0);
  -[PXTextSymbolView setFrame:](self->_blurryBadgeView, "setFrame:", 37.0, v8 + -16.0 + -3.0, 16.0, 16.0);
  double v9 = v5 + -6.0 + -3.0 + -24.0;
  -[PXScoreView setFrame:](self->_aestheticScoreView, "setFrame:", v9, v8 + -32.0 + -3.0 + -1.0, 24.0, 16.0);
  -[PXScoreView setFrame:](self->_contentScoreView, "setFrame:", v9, v8 + -16.0 + -3.0, 24.0, 16.0);
  -[PXScoreView setFrame:](self->_criteriaScoreView, "setFrame:", v9, v8 + -48.0 + -3.0 + -2.0, 24.0, 16.0);
  -[PXScoreView setFrame:](self->_iconicScoreView, "setFrame:", v9, v8 + -64.0 + -3.0 + -3.0, 24.0, 16.0);
  -[PXSymbolBadgeView setFrame:](self->_symbolBadgeView, "setFrame:", 3.0, 20.0, 16.0, 16.0);
  -[PXSymbolBadgeView setFrame:](self->_dedupedSymbolBadgeView, "setFrame:", v5 + -6.0 + -16.0 + -3.0, 3.0, 16.0, 16.0);
  -[PXIndexView setFrame:](self->_indexView, "setFrame:", v10 + -3.0 + -24.0, 4.0, 24.0, 13.0);
}

- (PXDiagnosticsCurationViewCell)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)PXDiagnosticsCurationViewCell;
  objc_super v3 = -[PXDiagnosticsCurationViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setContentMode:2];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    double v6 = [(PXDiagnosticsCurationViewCell *)v3 contentView];
    [v6 addSubview:v3->_imageView];

    double v7 = [[PXStateBadgeView alloc] initWithState:0];
    clusterStateBadgeView = v3->_clusterStateBadgeView;
    v3->_clusterStateBadgeView = v7;

    double v9 = [(PXDiagnosticsCurationViewCell *)v3 contentView];
    [v9 addSubview:v3->_clusterStateBadgeView];

    double v10 = [[PXStateBadgeView alloc] initWithState:@"Unknown"];
    stateBadgeView = v3->_stateBadgeView;
    v3->_stateBadgeView = v10;

    [(UIImageView *)v3->_imageView addSubview:v3->_stateBadgeView];
    v12 = [[PXStateBadgeView alloc] initWithState:@"Unknown"];
    alternateStateBadgeView = v3->_alternateStateBadgeView;
    v3->_alternateStateBadgeView = v12;

    [(UIImageView *)v3->_imageView addSubview:v3->_alternateStateBadgeView];
    v14 = [[PXDedupingBadgeView alloc] initWithDedupingType:@"None"];
    dedupingBadgeView = v3->_dedupingBadgeView;
    v3->_dedupingBadgeView = v14;

    [(UIImageView *)v3->_imageView addSubview:v3->_dedupingBadgeView];
    double v16 = [[PXTextSymbolView alloc] initWithSymbol:@"🏞"];
    sdofOrHDRBadgeView = v3->_sdofOrHDRBadgeView;
    v3->_sdofOrHDRBadgeView = v16;

    [(UIImageView *)v3->_imageView addSubview:v3->_sdofOrHDRBadgeView];
    v18 = [[PXTextSymbolView alloc] initWithSymbol:@"💟"];
    favoriteBadgeView = v3->_favoriteBadgeView;
    v3->_favoriteBadgeView = v18;

    [(UIImageView *)v3->_imageView addSubview:v3->_favoriteBadgeView];
    id v20 = [[PXTextSymbolView alloc] initWithSymbol:@"🚮"];
    utilityBadgeView = v3->_utilityBadgeView;
    v3->_utilityBadgeView = v20;

    [(UIImageView *)v3->_imageView addSubview:v3->_utilityBadgeView];
    v22 = [[PXTextSymbolView alloc] initWithSymbol:@"📳"];
    blurryBadgeView = v3->_blurryBadgeView;
    v3->_blurryBadgeView = v22;

    [(UIImageView *)v3->_imageView addSubview:v3->_blurryBadgeView];
    v24 = [[PXScoreView alloc] initWithColorScale:2];
    aestheticScoreView = v3->_aestheticScoreView;
    v3->_aestheticScoreView = v24;

    [(UIImageView *)v3->_imageView addSubview:v3->_aestheticScoreView];
    v26 = [[PXScoreView alloc] initWithColorScale:1];
    contentScoreView = v3->_contentScoreView;
    v3->_contentScoreView = v26;

    [(UIImageView *)v3->_imageView addSubview:v3->_contentScoreView];
    v28 = [[PXScoreView alloc] initWithColorScale:3];
    criteriaScoreView = v3->_criteriaScoreView;
    v3->_criteriaScoreView = v28;

    [(UIImageView *)v3->_imageView addSubview:v3->_criteriaScoreView];
    v30 = [[PXSymbolBadgeView alloc] initWithIndex:0];
    symbolBadgeView = v3->_symbolBadgeView;
    v3->_symbolBadgeView = v30;

    [(UIImageView *)v3->_imageView addSubview:v3->_symbolBadgeView];
    v32 = [[PXScoreView alloc] initWithColorScale:4];
    iconicScoreView = v3->_iconicScoreView;
    v3->_iconicScoreView = v32;

    [(UIImageView *)v3->_imageView addSubview:v3->_iconicScoreView];
    v34 = [[PXSymbolBadgeView alloc] initWithIndex:0];
    dedupedSymbolBadgeView = v3->_dedupedSymbolBadgeView;
    v3->_dedupedSymbolBadgeView = v34;

    [(UIImageView *)v3->_imageView addSubview:v3->_dedupedSymbolBadgeView];
    v36 = objc_alloc_init(PXIndexView);
    indexView = v3->_indexView;
    v3->_indexView = v36;

    v38 = [(PXDiagnosticsCurationViewCell *)v3 contentView];
    [v38 addSubview:v3->_indexView];
  }
  return v3;
}

+ (double)cellHeightWithCellWidth:(double)a3
{
  return a3 + 6.0 + 16.0;
}

@end