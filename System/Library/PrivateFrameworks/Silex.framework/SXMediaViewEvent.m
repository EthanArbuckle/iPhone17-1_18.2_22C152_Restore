@interface SXMediaViewEvent
- (NSArray)galleryImageIds;
- (unint64_t)galleryImageCount;
- (void)setGalleryImageCount:(unint64_t)a3;
- (void)setGalleryImageIds:(id)a3;
@end

@implementation SXMediaViewEvent

- (unint64_t)galleryImageCount
{
  return self->_galleryImageCount;
}

- (void)setGalleryImageCount:(unint64_t)a3
{
  self->_galleryImageCount = a3;
}

- (NSArray)galleryImageIds
{
  return self->_galleryImageIds;
}

- (void)setGalleryImageIds:(id)a3
{
}

- (void).cxx_destruct
{
}

@end