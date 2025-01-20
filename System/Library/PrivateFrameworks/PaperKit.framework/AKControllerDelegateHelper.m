@interface AKControllerDelegateHelper
- (CGRect)maxPageRectWithPageIndex:(int64_t)a3 forAnnotationController:(id)a4;
- (_TtC8PaperKitP33_2B8C5C91434EFF0A5A4BB617ED0FC81826AKControllerDelegateHelper)init;
- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(int64_t)a6 forAnnotationController:(id)a7;
- (id)popoverPresentingViewControllerForAnnotationController:(id)a3;
- (id)undoManagerForAnnotationController:(id)a3;
@end

@implementation AKControllerDelegateHelper

- (CGRect)maxPageRectWithPageIndex:(int64_t)a3 forAnnotationController:(id)a4
{
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(int64_t)a6 forAnnotationController:(id)a7
{
  return Data._bridgeToObjectiveC()().super.isa;
}

- (id)undoManagerForAnnotationController:(id)a3
{
  return @objc AKControllerDelegateHelper.undoManager(forAnnotationController:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (Class *)0x263F08C50);
}

- (id)popoverPresentingViewControllerForAnnotationController:(id)a3
{
  return @objc AKControllerDelegateHelper.undoManager(forAnnotationController:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (Class *)0x263F82E10);
}

- (_TtC8PaperKitP33_2B8C5C91434EFF0A5A4BB617ED0FC81826AKControllerDelegateHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AKControllerDelegateHelper();
  return [(AKControllerDelegateHelper *)&v3 init];
}

@end