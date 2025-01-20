@interface VKCVisualSearchResultItem
- (BOOL)_hasFocalPoint;
- (BOOL)shouldPlaceInCorner;
- (CGPoint)normalizedIconLocation;
- (CGRect)normalizedBoundingBox;
- (MADVIVisualSearchGatingDomainInfo)domainInfo;
- (MADVIVisualSearchGatingResultItem)resultItem;
- (MADVIVisualSearchResultItem)searchItem;
- (NSString)glyphName;
- (NSString)label;
- (UIMenu)debugMenu;
- (VKCImageAnalysis)analysis;
- (VKCVisualSearchResultItem)initWithGatingResultItem:(id)a3 domain:(id)a4;
- (VKCVisualSearchResultItem)initWithSearchResultItem:(id)a3;
- (int64_t)currentInvocationType;
- (unint64_t)queryID;
- (void)setAnalysis:(id)a3;
- (void)setCurrentInvocationType:(int64_t)a3;
- (void)setDomainInfo:(id)a3;
- (void)setQueryID:(unint64_t)a3;
- (void)setResultItem:(id)a3;
- (void)setSearchItem:(id)a3;
@end

@implementation VKCVisualSearchResultItem

- (VKCVisualSearchResultItem)initWithGatingResultItem:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKCVisualSearchResultItem;
  v9 = [(VKCVisualSearchResultItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultItem, a3);
    objc_storeStrong((id *)&v10->_domainInfo, a4);
  }

  return v10;
}

- (VKCVisualSearchResultItem)initWithSearchResultItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCVisualSearchResultItem;
  v6 = [(VKCVisualSearchResultItem *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchItem, a3);
  }

  return v7;
}

- (CGRect)normalizedBoundingBox
{
  [(MADVIVisualSearchGatingResultItem *)self->_resultItem normalizedBoundingBox];
  searchItem = self->_searchItem;
  if (searchItem) {
    [(MADVIVisualSearchResultItem *)searchItem normalizedBoundingBox];
  }
  CGFloat v8 = v3;
  CGFloat v9 = v4;
  CGFloat v10 = v5;
  CGFloat v11 = v6;
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&v3);
  v17.origin.x = v8;
  v17.origin.y = v9;
  v17.size.width = v10;
  v17.size.height = v11;
  double v13 = 1.0 - CGRectGetMaxY(v17);
  double v14 = MinX;
  double v15 = v10;
  double v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (CGPoint)normalizedIconLocation
{
  if ([(VKCVisualSearchResultItem *)self _hasFocalPoint])
  {
    [(MADVIVisualSearchGatingDomainInfo *)self->_domainInfo focalPoint];
    VKMFlipPoint();
  }
  else
  {
    [(VKCVisualSearchResultItem *)self normalizedBoundingBox];
    double v3 = VKMCenterOfRect(v5, v6, v7, v8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)_hasFocalPoint
{
  return [(MADVIVisualSearchGatingDomainInfo *)self->_domainInfo hasFocalPoint];
}

- (BOOL)shouldPlaceInCorner
{
  return ![(VKCVisualSearchResultItem *)self _hasFocalPoint];
}

- (NSString)glyphName
{
  return (NSString *)[(MADVIVisualSearchGatingDomainInfo *)self->_domainInfo glyphName];
}

- (NSString)label
{
  return (NSString *)[(MADVIVisualSearchGatingDomainInfo *)self->_domainInfo displayLabel];
}

- (UIMenu)debugMenu
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = [(VKCVisualSearchResultItem *)self domainInfo];
  CGFloat v5 = [v4 domain];

  uint64_t v6 = [v5 rangeOfString:@"domain_key."];
  CGFloat v8 = objc_msgSend(v5, "vk_substringFromIndex:", v6 + v7);
  CGFloat v9 = (void *)MEMORY[0x1E4F42A80];
  CGFloat v10 = [(VKCVisualSearchResultItem *)self glyphName];
  CGFloat v11 = objc_msgSend(v9, "vk_symbolImageWithName:", v10);

  unint64_t v12 = 0x1E4F29000uLL;
  double v13 = NSString;
  double v14 = [(VKCVisualSearchResultItem *)self domainInfo];
  double v15 = [v14 domain];
  double v16 = [v13 stringWithFormat:@"%@", v15];

  CGRect v17 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Domain", v16);
  [v3 addObject:v17];

  if ([(VKCVisualSearchResultItem *)self _hasFocalPoint])
  {
    v18 = NSString;
    [(VKCVisualSearchResultItem *)self normalizedBoundingBox];
    v23 = VKMUIStringForRect(v19, v20, v21, v22);
    uint64_t v24 = [v18 stringWithFormat:@"%@", v23];

    v25 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Focal Point", v24);
    double v16 = (void *)v24;
    unint64_t v12 = 0x1E4F29000;
  }
  else
  {
    v25 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Focal Point", @"(none)");
  }
  [v3 addObject:v25];

  v26 = *(void **)(v12 + 24);
  [(VKCVisualSearchResultItem *)self normalizedBoundingBox];
  v31 = VKMUIStringForRect(v27, v28, v29, v30);
  v32 = [v26 stringWithFormat:@"Normalized Bounding Box: %@", v31];

  v33 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", &stru_1F35566F8, v32);
  [v3 addObject:v33];

  v34 = (void *)MEMORY[0x1E4F42B80];
  v35 = [v8 capitalizedString];
  v36 = objc_msgSend(v34, "vk_menuWithItems:title:subtitle:image:", v3, v35, 0, v11);

  return (UIMenu *)v36;
}

- (VKCImageAnalysis)analysis
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analysis);
  return (VKCImageAnalysis *)WeakRetained;
}

- (void)setAnalysis:(id)a3
{
}

- (MADVIVisualSearchGatingResultItem)resultItem
{
  return self->_resultItem;
}

- (void)setResultItem:(id)a3
{
}

- (MADVIVisualSearchResultItem)searchItem
{
  return self->_searchItem;
}

- (void)setSearchItem:(id)a3
{
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(unint64_t)a3
{
  self->_queryID = a3;
}

- (MADVIVisualSearchGatingDomainInfo)domainInfo
{
  return self->_domainInfo;
}

- (void)setDomainInfo:(id)a3
{
}

- (int64_t)currentInvocationType
{
  return self->_currentInvocationType;
}

- (void)setCurrentInvocationType:(int64_t)a3
{
  self->_currentInvocationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainInfo, 0);
  objc_storeStrong((id *)&self->_searchItem, 0);
  objc_storeStrong((id *)&self->_resultItem, 0);
  objc_destroyWeak((id *)&self->_analysis);
}

@end