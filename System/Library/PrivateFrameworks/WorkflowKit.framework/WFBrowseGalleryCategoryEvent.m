@interface WFBrowseGalleryCategoryEvent
+ (Class)codableEventClass;
- (NSString)galleryCategoryIdentifier;
- (NSString)key;
- (void)setGalleryCategoryIdentifier:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation WFBrowseGalleryCategoryEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setGalleryCategoryIdentifier:(id)a3
{
}

- (NSString)galleryCategoryIdentifier
{
  return self->_galleryCategoryIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end