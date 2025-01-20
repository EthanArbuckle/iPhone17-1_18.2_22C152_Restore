@interface WFSetupGalleryShortcutEvent
+ (Class)codableEventClass;
- (BOOL)completed;
- (NSString)addToSiriBundleIdentifier;
- (NSString)galleryCategoryIdentifier;
- (NSString)galleryIdentifier;
- (NSString)key;
- (void)setAddToSiriBundleIdentifier:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setGalleryCategoryIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation WFSetupGalleryShortcutEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_galleryCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setAddToSiriBundleIdentifier:(id)a3
{
}

- (NSString)addToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
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