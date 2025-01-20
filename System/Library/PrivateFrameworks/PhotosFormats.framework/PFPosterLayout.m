@interface PFPosterLayout
+ (id)layoutWithDictionaryRepresentation:(id)a3;
- (BOOL)isUsingHeadroom;
- (BOOL)supportsBothOrientations;
- (CGSize)imageSize;
- (PFPosterLayout)initWithPortraitLayout:(id)a3 landscapeLayout:(id)a4;
- (PFPosterOrientedLayout)landscapeLayout;
- (PFPosterOrientedLayout)portraitLayout;
- (id)dictionaryRepresentation;
- (id)layoutByUpdatingConfiguration:(id)a3;
- (id)layoutByUpdatingNormalizedPortraitVisibleFrame:(CGRect)a3 landscapeVisibleFrame:(CGRect)a4;
- (id)layoutByUpgradingToConfiguration:(id)a3;
@end

@implementation PFPosterLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeLayout, 0);

  objc_storeStrong((id *)&self->_portraitLayout, 0);
}

- (PFPosterOrientedLayout)landscapeLayout
{
  return self->_landscapeLayout;
}

- (PFPosterOrientedLayout)portraitLayout
{
  return self->_portraitLayout;
}

- (id)dictionaryRepresentation
{
  v3 = [(PFPosterOrientedLayout *)self->_portraitLayout dictionaryRepresentation];
  v4 = [(PFPosterOrientedLayout *)self->_landscapeLayout dictionaryRepresentation];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:&unk_1EF7CAA48 forKeyedSubscript:@"version"];
  [v5 setObject:v3 forKeyedSubscript:@"portrait"];
  [v5 setObject:v4 forKeyedSubscript:@"landscape"];

  return v5;
}

- (id)layoutByUpgradingToConfiguration:(id)a3
{
  portraitLayout = self->_portraitLayout;
  id v5 = a3;
  v6 = [v5 portraitConfiguration];
  v7 = [(PFPosterOrientedLayout *)portraitLayout layoutByUpgradingToConfiguration:v6];

  landscapeLayout = self->_landscapeLayout;
  v9 = [v5 landscapeConfiguration];

  v10 = [(PFPosterOrientedLayout *)landscapeLayout layoutByUpgradingToConfiguration:v9];

  v11 = [[PFPosterLayout alloc] initWithPortraitLayout:v7 landscapeLayout:v10];

  return v11;
}

- (id)layoutByUpdatingNormalizedPortraitVisibleFrame:(CGRect)a3 landscapeVisibleFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v13 = self->_portraitLayout;
  v14 = self->_landscapeLayout;
  v20.origin.double x = v11;
  v20.origin.double y = v10;
  v20.size.double width = v9;
  v20.size.double height = v8;
  if (!CGRectIsEmpty(v20))
  {
    v21.origin.double x = v11;
    v21.origin.double y = v10;
    v21.size.double width = v9;
    v21.size.double height = v8;
    if (!CGRectIsInfinite(v21))
    {
      uint64_t v15 = -[PFPosterOrientedLayout layoutByUpdatingNormalizedVisibleFrame:](self->_portraitLayout, "layoutByUpdatingNormalizedVisibleFrame:", v11, v10, v9, v8);

      v13 = (PFPosterOrientedLayout *)v15;
    }
  }
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  if (!CGRectIsEmpty(v22))
  {
    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    if (!CGRectIsInfinite(v23))
    {
      uint64_t v16 = -[PFPosterOrientedLayout layoutByUpdatingNormalizedVisibleFrame:](self->_landscapeLayout, "layoutByUpdatingNormalizedVisibleFrame:", x, y, width, height);

      v14 = (PFPosterOrientedLayout *)v16;
    }
  }
  v17 = [[PFPosterLayout alloc] initWithPortraitLayout:v13 landscapeLayout:v14];

  return v17;
}

- (id)layoutByUpdatingConfiguration:(id)a3
{
  portraitLayout = self->_portraitLayout;
  id v5 = a3;
  v6 = [v5 portraitConfiguration];
  v7 = [(PFPosterOrientedLayout *)portraitLayout layoutByUpdatingConfiguration:v6];

  landscapeLayout = self->_landscapeLayout;
  double v9 = [v5 landscapeConfiguration];

  double v10 = [(PFPosterOrientedLayout *)landscapeLayout layoutByUpdatingConfiguration:v9];

  double v11 = [[PFPosterLayout alloc] initWithPortraitLayout:v7 landscapeLayout:v10];

  return v11;
}

- (PFPosterLayout)initWithPortraitLayout:(id)a3 landscapeLayout:(id)a4
{
  v6 = (PFPosterOrientedLayout *)a3;
  v7 = (PFPosterOrientedLayout *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFPosterLayout;
  double v8 = [(PFPosterLayout *)&v13 init];
  portraitLayout = v8->_portraitLayout;
  v8->_portraitLayout = v6;
  double v10 = v6;

  landscapeLayout = v8->_landscapeLayout;
  v8->_landscapeLayout = v7;

  return v8;
}

- (CGSize)imageSize
{
  [(PFPosterOrientedLayout *)self->_portraitLayout imageSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)isUsingHeadroom
{
  if ([(PFPosterOrientedLayout *)self->_portraitLayout isUsingHeadroom]) {
    return 1;
  }
  landscapeLayout = self->_landscapeLayout;

  return [(PFPosterOrientedLayout *)landscapeLayout isUsingHeadroom];
}

- (BOOL)supportsBothOrientations
{
  return self->_portraitLayout && self->_landscapeLayout != 0;
}

+ (id)layoutWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 objectForKeyedSubscript:@"portrait"];
    v6 = +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:v5];

    v7 = [v3 objectForKeyedSubscript:@"landscape"];
    double v8 = +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:v7];

    double v9 = [[PFPosterLayout alloc] initWithPortraitLayout:v6 landscapeLayout:v8];
  }
  else
  {
    v6 = +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:v3];
    double v9 = [[PFPosterLayout alloc] initWithPortraitLayout:v6 landscapeLayout:0];
  }

  return v9;
}

@end