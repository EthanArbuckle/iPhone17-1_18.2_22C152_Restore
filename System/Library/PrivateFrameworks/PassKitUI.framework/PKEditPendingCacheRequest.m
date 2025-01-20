@interface PKEditPendingCacheRequest
- (BOOL)fullPass;
- (BOOL)isEqual:(id)a3;
- (BOOL)stacked;
- (CGSize)imageSize;
- (NSArray)completionHandlers;
- (NSString)cacheKey;
- (PKPass)pass;
- (int64_t)priority;
- (unint64_t)hash;
- (void)setCacheKey:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setFullPass:(BOOL)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setPass:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setStacked:(BOOL)a3;
@end

@implementation PKEditPendingCacheRequest

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = PKEqualObjects();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  [(NSString *)self->_cacheKey hash];

  return PKIntegerHash();
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (BOOL)fullPass
{
  return self->_fullPass;
}

- (void)setFullPass:(BOOL)a3
{
  self->_fullPass = a3;
}

- (BOOL)stacked
{
  return self->_stacked;
}

- (void)setStacked:(BOOL)a3
{
  self->_stacked = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_cacheKey, 0);
}

@end