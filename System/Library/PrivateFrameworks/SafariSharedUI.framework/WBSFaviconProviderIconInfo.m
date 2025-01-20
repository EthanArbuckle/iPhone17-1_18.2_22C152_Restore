@interface WBSFaviconProviderIconInfo
- (BOOL)hasGeneratedResolutions;
- (BOOL)isRejectedResource;
- (CGSize)size;
- (NSDate)dateAdded;
- (NSString)UUIDString;
- (NSString)iconURLString;
- (NSString)pageURLString;
- (WBSFaviconProviderIconInfo)initWithPageURLString:(id)a3 iconURLString:(id)a4 UUIDString:(id)a5 dateAdded:(id)a6 size:(CGSize)a7 hasGeneratedResolutions:(BOOL)a8 isRejectedResource:(BOOL)a9;
@end

@implementation WBSFaviconProviderIconInfo

- (WBSFaviconProviderIconInfo)initWithPageURLString:(id)a3 iconURLString:(id)a4 UUIDString:(id)a5 dateAdded:(id)a6 size:(CGSize)a7 hasGeneratedResolutions:(BOOL)a8 isRejectedResource:(BOOL)a9
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v30.receiver = self;
  v30.super_class = (Class)WBSFaviconProviderIconInfo;
  v21 = [(WBSFaviconProviderIconInfo *)&v30 init];
  if (v21)
  {
    uint64_t v22 = [v17 copy];
    pageURLString = v21->_pageURLString;
    v21->_pageURLString = (NSString *)v22;

    uint64_t v24 = [v18 copy];
    iconURLString = v21->_iconURLString;
    v21->_iconURLString = (NSString *)v24;

    uint64_t v26 = [v19 copy];
    UUIDString = v21->_UUIDString;
    v21->_UUIDString = (NSString *)v26;

    objc_storeStrong((id *)&v21->_dateAdded, a6);
    v21->_size.CGFloat width = width;
    v21->_size.CGFloat height = height;
    v21->_hasGeneratedResolutions = a8;
    v21->_isRejectedResource = a9;
    v28 = v21;
  }

  return v21;
}

- (NSString)pageURLString
{
  return self->_pageURLString;
}

- (NSString)iconURLString
{
  return self->_iconURLString;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)hasGeneratedResolutions
{
  return self->_hasGeneratedResolutions;
}

- (BOOL)isRejectedResource
{
  return self->_isRejectedResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_iconURLString, 0);
  objc_storeStrong((id *)&self->_pageURLString, 0);
}

@end