@interface _WBSFaviconRecord
+ (id)new;
- (BOOL)isPrivate;
- (CGSize)size;
- (NSData)iconData;
- (NSURL)iconURL;
- (NSURL)originalPageURL;
- (NSURL)pageURL;
- (_WBSFaviconRecord)initWithPageURL:(id)a3 originalPageURL:(id)a4 iconURL:(id)a5 iconData:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8;
@end

@implementation _WBSFaviconRecord

+ (id)new
{
  return 0;
}

- (_WBSFaviconRecord)initWithPageURL:(id)a3 originalPageURL:(id)a4 iconURL:(id)a5 iconData:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_WBSFaviconRecord;
  v20 = [(_WBSFaviconRecord *)&v26 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_pageURL, a3);
    objc_storeStrong((id *)&v21->_originalPageURL, a4);
    objc_storeStrong((id *)&v21->_iconURL, a5);
    uint64_t v22 = [v19 copy];
    iconData = v21->_iconData;
    v21->_iconData = (NSData *)v22;

    v21->_size.CGFloat width = width;
    v21->_size.CGFloat height = height;
    v21->_isPrivate = a8;
    v24 = v21;
  }

  return v21;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)originalPageURL
{
  return self->_originalPageURL;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_originalPageURL, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
}

@end