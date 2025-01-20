@interface THWGalleryInfo
- (BOOL)thumbnailsVisible;
- (CGPoint)captionPosition;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)items;
- (NSString)progressKitID;
- (NSString)progressKitSectionID;
- (NSString)titleString;
- (THWGalleryInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6;
- (THWStageGeometry)stageGeometry;
- (THWWidgetAdornmentInfo)adornmentInfo;
- (TSWWidgetStyle)style;
- (double)contentPadding;
- (id)childEnumerator;
- (id)itemAtIndex:(unint64_t)a3;
- (unint64_t)indexOfItem:(id)a3;
- (void)addItem:(id)a3;
- (void)dealloc;
- (void)setAdornmentInfo:(id)a3;
- (void)setContentPadding:(double)a3;
- (void)setProgressKitID:(id)a3;
- (void)setProgressKitSectionID:(id)a3;
- (void)setThumbnailsVisible:(BOOL)a3;
@end

@implementation THWGalleryInfo

- (THWGalleryInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)THWGalleryInfo;
  v8 = [(THWGalleryInfo *)&v10 initWithContext:a3 geometry:a4];
  if (v8)
  {
    v8->_style = (TSWWidgetStyle *)a5;
    v8->_stageGeometry = (THWStageGeometry *)a6;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWGalleryInfo;
  [(THWGalleryInfo *)&v3 dealloc];
}

- (void)addItem:(id)a3
{
  if (a3)
  {
    items = self->_items;
    if (!items)
    {
      items = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->_items = items;
    }
    [(NSMutableArray *)items addObject:a3];
    objc_msgSend(objc_msgSend(a3, "imageInfo"), "setParentInfo:", self);
    id v6 = [a3 captionStorage];
    [v6 setParentInfo:self];
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)captionPosition
{
  id v2 = [(TSWPShapeInfo *)[(THWWidgetAdornmentInfo *)[(THWGalleryInfo *)self adornmentInfo] caption] geometry];

  [v2 position];
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSString)titleString
{
  id v2 = [(THWWidgetAdornmentInfo *)[(THWGalleryInfo *)self adornmentInfo] titleStorage];

  return (NSString *)[(TSWPStorage *)v2 string];
}

- (unint64_t)indexOfItem:(id)a3
{
  return (unint64_t)[(NSMutableArray *)self->_items indexOfObjectIdenticalTo:a3];
}

- (id)itemAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_items count] <= a3) {
    return 0;
  }
  items = self->_items;

  return [(NSMutableArray *)items objectAtIndex:a3];
}

- (id)childEnumerator
{
  id v3 = +[NSMutableArray array];
  double v4 = v3;
  if (self->_items) {
    [v3 addObjectsFromArray:];
  }
  if (self->_adornmentInfo) {
    [v4 addObject:];
  }

  return [v4 objectEnumerator];
}

- (NSArray)items
{
  return &self->_items->super;
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
}

- (TSWWidgetStyle)style
{
  return self->_style;
}

- (THWStageGeometry)stageGeometry
{
  return self->_stageGeometry;
}

- (BOOL)thumbnailsVisible
{
  return self->_thumbnailsVisible;
}

- (void)setThumbnailsVisible:(BOOL)a3
{
  self->_thumbnailsVisible = a3;
}

- (double)contentPadding
{
  return self->_contentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->_contentPadding = a3;
}

@end