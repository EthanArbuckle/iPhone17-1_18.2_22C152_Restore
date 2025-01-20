@interface WFGallerySessionBrowseCategoryEvent
+ (Class)codableEventClass;
- (NSString)galleryCategoryIdentifier;
- (NSString)key;
- (NSString)sessionIdentifier;
- (void)setGalleryCategoryIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation WFGallerySessionBrowseCategoryEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setGalleryCategoryIdentifier:(id)a3
{
}

- (NSString)galleryCategoryIdentifier
{
  return self->_galleryCategoryIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end