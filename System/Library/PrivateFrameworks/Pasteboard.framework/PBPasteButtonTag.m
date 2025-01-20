@interface PBPasteButtonTag
+ (BOOL)supportsSecureCoding;
+ (id)calloutBarPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 titleWidth:(double)a6 contentScaleLevel:(unint64_t)a7;
+ (id)contextMenuPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 layoutSize:(int64_t)a6 hasTrailingGutter:(BOOL)a7;
+ (id)editMenuPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 contentOrigin:(CGPoint)a5 displayMode:(unint64_t)a6;
+ (id)systemInputAssistantPasteButtonTagWithSite:(int64_t)a3;
+ (id)undoInteractionHUDIconPasteButtonTagWithMinWidth:(double)a3;
+ (id)undoInteractionHUDTextPasteButtonTagWithMinWidth:(double)a3;
- (CGColor)baseForegroundColorForStyle:(id)a3;
- (PBPasteButtonTag)initWithCoder:(id)a3;
- (float)backgroundStatisticsFailingContrastForStyle:(id)a3;
- (float)backgroundStatisticsPassingContrastForStyle:(id)a3;
- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8;
- (unint64_t)failGradeForStyle:(id)a3;
- (unint64_t)hitTestInformationMaskForStyle:(id)a3;
@end

@implementation PBPasteButtonTag

+ (id)calloutBarPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 titleWidth:(double)a6 contentScaleLevel:(unint64_t)a7
{
  v7 = -[PBCalloutBarPasteButtonTag initWithSecureName:size:titleOrigin:titleWidth:contentScaleLevel:]([PBCalloutBarPasteButtonTag alloc], "initWithSecureName:size:titleOrigin:titleWidth:contentScaleLevel:", *(void *)&a3, a7, a4.width, a4.height, a5.x, a5.y, a6);
  return v7;
}

+ (id)systemInputAssistantPasteButtonTagWithSite:(int64_t)a3
{
  v3 = [[PBSystemInputAssistantPasteButtonTag alloc] initWithSite:a3];
  return v3;
}

+ (id)undoInteractionHUDIconPasteButtonTagWithMinWidth:(double)a3
{
  v3 = [[PBUndoInteractionHUDIconPasteButtonTag alloc] initWithMinWidth:a3];
  return v3;
}

+ (id)undoInteractionHUDTextPasteButtonTagWithMinWidth:(double)a3
{
  v3 = [[PBUndoInteractionHUDTextPasteButtonTag alloc] initWithMinWidth:a3];
  return v3;
}

+ (id)contextMenuPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 layoutSize:(int64_t)a6 hasTrailingGutter:(BOOL)a7
{
  v7 = -[PBContextMenuPasteButtonTag initWithSecureName:size:titleOrigin:layoutSize:hasTrailingGutter:]([PBContextMenuPasteButtonTag alloc], "initWithSecureName:size:titleOrigin:layoutSize:hasTrailingGutter:", *(void *)&a3, a6, a7, a4.width, a4.height, a5.x, a5.y);
  return v7;
}

+ (id)editMenuPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 contentOrigin:(CGPoint)a5 displayMode:(unint64_t)a6
{
  v6 = -[PBEditMenuPasteButtonTag initWithSecureName:size:contentOrigin:displayMode:]([PBEditMenuPasteButtonTag alloc], "initWithSecureName:size:contentOrigin:displayMode:", *(void *)&a3, a6, a4.width, a4.height, a5.x, a5.y);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBPasteButtonTag)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBPasteButtonTag;
  return [(PBPasteButtonTag *)&v4 init];
}

- (float)backgroundStatisticsPassingContrastForStyle:(id)a3
{
  return 3.1;
}

- (float)backgroundStatisticsFailingContrastForStyle:(id)a3
{
  return 2.9;
}

- (unint64_t)failGradeForStyle:(id)a3
{
  return -513;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 62;
}

- (CGColor)baseForegroundColorForStyle:(id)a3
{
  uint64_t v3 = [a3 userInterfaceStyle];
  if (v3)
  {
    if (v3 != 1) {
      return 0;
    }
    objc_super v4 = (const __CFString **)MEMORY[0x1E4F1DCB8];
  }
  else
  {
    objc_super v4 = (const __CFString **)MEMORY[0x1E4F1DB60];
  }
  CFStringRef v5 = *v4;
  return CGColorGetConstantColor(v5);
}

- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8
{
  return 0;
}

@end