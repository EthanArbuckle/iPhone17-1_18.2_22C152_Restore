@interface WFShareShortcutEvent
+ (Class)codableEventClass;
+ (id)serializablePropertyTransformers;
- (NSString)addToSiriBundleIdentifier;
- (NSString)galleryIdentifier;
- (NSString)key;
- (NSString)sharingDestinationBundleIdentifier;
- (NSString)sharingMode;
- (int)source;
- (unsigned)actionCount;
- (void)setActionCount:(unsigned int)a3;
- (void)setAddToSiriBundleIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setSharingDestinationBundleIdentifier:(id)a3;
- (void)setSharingMode:(id)a3;
- (void)setSource:(int)a3;
@end

@implementation WFShareShortcutEvent

+ (id)serializablePropertyTransformers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"actionCount";
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingDestinationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingMode, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setSharingDestinationBundleIdentifier:(id)a3
{
}

- (NSString)sharingDestinationBundleIdentifier
{
  return self->_sharingDestinationBundleIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setAddToSiriBundleIdentifier:(id)a3
{
}

- (NSString)addToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier;
}

- (void)setActionCount:(unsigned int)a3
{
  self->_actionCount = a3;
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setSharingMode:(id)a3
{
}

- (NSString)sharingMode
{
  return self->_sharingMode;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end