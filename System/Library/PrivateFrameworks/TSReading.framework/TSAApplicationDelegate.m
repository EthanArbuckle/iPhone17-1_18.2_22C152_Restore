@interface TSAApplicationDelegate
+ (id)sharedDelegate;
- (BOOL)hasNotifiedEnterBackground;
- (BOOL)isActivating;
- (BOOL)isInBackground;
- (BOOL)isTerminating;
- (TSAApplicationDelegate)init;
- (id)alertCompletionBlock;
- (id)image32IconForTXTFiles;
- (id)noDocumentsImagePath;
- (id)previewImageNameForDocumentType:(id)a3;
- (id)previewImageNameForEncryptedNativeDocument;
- (id)previewImageNameForNativeDocument;
- (id)stringForImportingDocument;
- (void)applicationDidReceiveMemoryWarning:(id)a3;
- (void)dealloc;
- (void)persistenceError:(id)a3;
- (void)setActivating:(BOOL)a3;
- (void)setAlertCompletionBlock:(id)a3;
- (void)setHasNotifiedEnterBackground:(BOOL)a3;
- (void)setInBackground:(BOOL)a3;
- (void)setTerminating:(BOOL)a3;
@end

@implementation TSAApplicationDelegate

- (TSAApplicationDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSAApplicationDelegate;
  v2 = [(TSABaseApplicationDelegate *)&v5 init];
  v3 = v2;
  if (v2)
  {
    +[TSWPURLDataDetector setInvalidURLSchemes:[(TSABaseApplicationDelegate *)v2 invalidURLSchemes]];
    +[TSWPDataDetectors registerDataDetectorClass:objc_opt_class()];
  }
  return v3;
}

+ (id)sharedDelegate
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSAApplicationDelegate;
  return objc_msgSendSuper2(&v3, sel_sharedDelegate);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSAApplicationDelegate;
  [(TSABaseApplicationDelegate *)&v3 dealloc];
}

- (void)persistenceError:(id)a3
{
}

- (id)previewImageNameForDocumentType:(id)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSAApplicationDelegate previewImageNameForDocumentType:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSAApplicationDelegate.m"), 113, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSAApplicationDelegate previewImageNameForDocumentType:]"), 0 reason userInfo]);
}

- (id)previewImageNameForNativeDocument
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSAApplicationDelegate previewImageNameForNativeDocument]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSAApplicationDelegate.m"), 118, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSAApplicationDelegate previewImageNameForNativeDocument]"), 0 reason userInfo]);
}

- (id)previewImageNameForEncryptedNativeDocument
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSAApplicationDelegate previewImageNameForEncryptedNativeDocument]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSAApplicationDelegate.m"), 123, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSAApplicationDelegate previewImageNameForEncryptedNativeDocument]"), 0 reason userInfo]);
}

- (id)noDocumentsImagePath
{
  v2 = (void *)TSABundle();

  return (id)[v2 pathForResource:@"TSAApplicationNoDocumentsImage" ofType:@"png"];
}

- (id)image32IconForTXTFiles
{
  return @"TSA_Text_32.png";
}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C840], "sharedManager", a3);

  [v3 didReceiveMemoryWarning];
}

- (id)stringForImportingDocument
{
  v2 = (void *)TSABundle();

  return (id)[v2 localizedStringForKey:@"Importing\\U2026" value:&stru_26D688A48 table:@"TSApplication"];
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (void)setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (BOOL)isActivating
{
  return self->_activating;
}

- (void)setActivating:(BOOL)a3
{
  self->_activating = a3;
}

- (BOOL)isInBackground
{
  return self->_inBackground;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (id)alertCompletionBlock
{
  return self->_alertCompletionBlock;
}

- (void)setAlertCompletionBlock:(id)a3
{
}

- (BOOL)hasNotifiedEnterBackground
{
  return self->_hasNotifiedEnterBackground;
}

- (void)setHasNotifiedEnterBackground:(BOOL)a3
{
  self->_hasNotifiedEnterBackground = a3;
}

@end