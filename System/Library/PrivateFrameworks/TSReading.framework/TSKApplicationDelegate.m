@interface TSKApplicationDelegate
+ (BOOL)isUnitTesting;
+ (id)documentDirectoryPath;
+ (id)sharedDelegate;
+ (void)setSurrogateDelegate:(id)a3;
- (BOOL)centerOnInitialSelection;
- (BOOL)designModeEnabled;
- (BOOL)isActivating;
- (BOOL)isCanvasFullScreen;
- (BOOL)isInBackground;
- (BOOL)openURL:(id)a3;
- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4;
- (BOOL)performanceModeEnabled;
- (BOOL)shouldGenerateGuidesForOffscreenLayouts;
- (BOOL)shouldRenderContactShadow;
- (BOOL)shouldRenderCurvedShadow;
- (BOOL)shouldValidateMasterLayoutWhileInsertingRows;
- (BOOL)supportsRTL;
- (BOOL)supportsScrollingInPhoneCommentUI;
- (BOOL)tableCellInspectorShowsNaturalAlignment;
- (BOOL)tableHeaderInspectorShowsFreezeHeaderColumnsSwitch;
- (BOOL)tableHeaderInspectorShowsFreezeHeaderRowsSwitch;
- (BOOL)tableHeaderInspectorShowsRepeatHeaderRowsSwitch;
- (BOOL)textInspectorShowsMoreSubpane;
- (CGRect)applicationToolbarFrame;
- (NSString)applicationName;
- (NSString)documentTypeDisplayName;
- (NSString)templateTypeDisplayName;
- (TSKApplicationDelegate)init;
- (TSKCompatibilityDelegate)compatibilityDelegate;
- (id)appChartPropertyOverrides;
- (id)createCompatibilityDelegate;
- (id)defaultHyperlinkURL;
- (id)invalidURLSchemes;
- (id)previewImageForType:(id)a3;
- (id)toolbarButtonForModalDoneWithTarget:(id)a3 action:(SEL)a4;
- (id)validURLSchemes;
- (void)dealloc;
- (void)setCompatibilityDelegate:(id)a3;
@end

@implementation TSKApplicationDelegate

+ (void)setSurrogateDelegate:(id)a3
{
  gSurrogateDelegate = (uint64_t)a3;
}

- (TSKApplicationDelegate)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSKApplicationDelegate;
  v2 = [(TSKApplicationDelegate *)&v4 init];
  if (v2)
  {
    +[TSKKeyboardMonitor sharedKeyboardMonitor];
    [MEMORY[0x263F7C7F0] installAsNSHandler];
    [(TSKApplicationDelegate *)v2 setCompatibilityDelegate:[(TSKApplicationDelegate *)v2 createCompatibilityDelegate]];
  }
  return v2;
}

- (void)setCompatibilityDelegate:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKApplicationDelegate;
  [(TSKApplicationDelegate *)&v3 dealloc];
}

+ (BOOL)isUnitTesting
{
  return 0;
}

+ (id)sharedDelegate
{
  if (gSurrogateDelegate) {
    return (id)gSurrogateDelegate;
  }
  else {
    return (id)objc_msgSend(a1, "platform_sharedDelegate");
  }
}

- (NSString)applicationName
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate applicationName]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 114, @"Abstract method");
  return 0;
}

- (NSString)documentTypeDisplayName
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate documentTypeDisplayName]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 120, @"Abstract method");
  return 0;
}

- (NSString)templateTypeDisplayName
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate templateTypeDisplayName]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 126, @"Abstract method");
  return 0;
}

+ (id)documentDirectoryPath
{
  id v2 = [(NSArray *)NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1) objectAtIndex:0];

  return (id)[v2 stringByAppendingPathComponent:@"Documents"];
}

- (id)createCompatibilityDelegate
{
  id v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate createCompatibilityDelegate]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 137, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSKApplicationDelegate createCompatibilityDelegate]"), 0 reason userInfo]);
}

- (BOOL)centerOnInitialSelection
{
  id v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate centerOnInitialSelection]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 142, @"Abstract method");
  return 0;
}

- (BOOL)isCanvasFullScreen
{
  return 0;
}

- (CGRect)applicationToolbarFrame
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldRenderContactShadow
{
  return 1;
}

- (BOOL)shouldRenderCurvedShadow
{
  return 1;
}

- (BOOL)supportsRTL
{
  return 0;
}

- (BOOL)supportsScrollingInPhoneCommentUI
{
  return 0;
}

- (BOOL)shouldValidateMasterLayoutWhileInsertingRows
{
  return 0;
}

- (id)previewImageForType:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate previewImageForType:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 193, @"Abstract method");
  return 0;
}

- (id)appChartPropertyOverrides
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate appChartPropertyOverrides]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 200, @"Abstract method");
  return 0;
}

- (id)invalidURLSchemes
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate invalidURLSchemes]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 206, @"Abstract method");
  return 0;
}

- (id)validURLSchemes
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate validURLSchemes]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 212, @"Abstract method");
  return 0;
}

- (BOOL)openURL:(id)a3
{
  return [(TSKApplicationDelegate *)self openURL:a3 sourceDocumentRoot:0];
}

- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate openURL:sourceDocumentRoot:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 224, @"Abstract method");
  return 0;
}

- (id)defaultHyperlinkURL
{
  return 0;
}

- (BOOL)designModeEnabled
{
  return 0;
}

- (BOOL)performanceModeEnabled
{
  return 0;
}

- (BOOL)shouldGenerateGuidesForOffscreenLayouts
{
  return 1;
}

- (BOOL)isActivating
{
  return 0;
}

- (BOOL)isInBackground
{
  return 0;
}

- (id)toolbarButtonForModalDoneWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSKApplicationDelegate toolbarButtonForModalDoneWithTarget:action:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 279, @"Abstract method");
  return 0;
}

- (TSKCompatibilityDelegate)compatibilityDelegate
{
  return self->_compatibilityDelegate;
}

- (BOOL)tableHeaderInspectorShowsFreezeHeaderRowsSwitch
{
  return 0;
}

- (BOOL)tableHeaderInspectorShowsFreezeHeaderColumnsSwitch
{
  return 0;
}

- (BOOL)tableHeaderInspectorShowsRepeatHeaderRowsSwitch
{
  return 0;
}

- (BOOL)tableCellInspectorShowsNaturalAlignment
{
  return 0;
}

- (BOOL)textInspectorShowsMoreSubpane
{
  return 0;
}

@end