@interface TSABaseApplicationDelegate
+ (id)sharedDelegate;
+ (void)presentAlertController:(id)a3 animated:(BOOL)a4;
- (BOOL)URLIsValidForImportedHyperlink:(id)a3;
- (BOOL)isReadableDocumentType:(id)a3;
- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4;
- (Class)documentRootClass;
- (NSArray)applicationTemplateVariants;
- (NSArray)importableDocumentTypes;
- (NSArray)readableDocumentTypes;
- (NSString)nativeDocumentExtension;
- (NSString)nativeDocumentType;
- (NSString)nativeSFFDocumentType;
- (NSString)tangierEditingFormatDocumentType;
- (NSString)templateDocumentExtension;
- (NSString)templateDocumentType;
- (NSString)templateSFFDocumentType;
- (TSABaseApplicationDelegate)init;
- (TSADownloadDelegate)downloadDelegate;
- (double)maximumAspectRatioForPreviewImage;
- (double)mimimumAspectRatioForPreviewImage;
- (id)applicationTemplateVariantsForLocale:(__CFLocale *)a3;
- (id)existingNestedDocumentPathForPath:(id)a3;
- (id)invalidURLSchemes;
- (id)validURLSchemes;
- (void)dealloc;
- (void)persistenceError:(id)a3;
- (void)registerDefaults;
- (void)setDownloadDelegate:(id)a3;
@end

@implementation TSABaseApplicationDelegate

- (id)invalidURLSchemes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_26D739C78];
}

- (TSABaseApplicationDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSABaseApplicationDelegate;
  v2 = [(TSKApplicationDelegate *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TSABaseApplicationDelegate *)v2 registerDefaults];
  }
  return v3;
}

- (void)registerDefaults
{
}

+ (id)sharedDelegate
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSABaseApplicationDelegate;
  return objc_msgSendSuper2(&v3, sel_sharedDelegate);
}

- (void)dealloc
{
  [(TSABaseApplicationDelegate *)self setDownloadDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)TSABaseApplicationDelegate;
  [(TSKApplicationDelegate *)&v3 dealloc];
}

- (Class)documentRootClass
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate documentRootClass]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 61, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSABaseApplicationDelegate documentRootClass]"), 0 reason userInfo]);
}

- (void)persistenceError:(id)a3
{
  v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate persistenceError:]"];
  [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 69, @"Got persistence error: %@", a3 file lineNumber description];
}

- (NSString)nativeDocumentType
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate nativeDocumentType]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 76, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSABaseApplicationDelegate nativeDocumentType]"), 0 reason userInfo]);
}

- (NSString)nativeDocumentExtension
{
  v2 = [(TSABaseApplicationDelegate *)self nativeDocumentType];

  return (NSString *)[(NSString *)v2 tsu_UTIFilenameExtension];
}

- (NSString)templateDocumentType
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate templateDocumentType]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 86, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSABaseApplicationDelegate templateDocumentType]"), 0 reason userInfo]);
}

- (NSString)templateSFFDocumentType
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate templateSFFDocumentType]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 91, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSABaseApplicationDelegate templateSFFDocumentType]"), 0 reason userInfo]);
}

- (NSString)templateDocumentExtension
{
  v2 = [(TSABaseApplicationDelegate *)self templateDocumentType];

  return (NSString *)[(NSString *)v2 tsu_UTIFilenameExtension];
}

- (NSString)tangierEditingFormatDocumentType
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate tangierEditingFormatDocumentType]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 101, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSABaseApplicationDelegate tangierEditingFormatDocumentType]"), 0 reason userInfo]);
}

- (NSString)nativeSFFDocumentType
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate nativeSFFDocumentType]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 106, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSABaseApplicationDelegate nativeSFFDocumentType]"), 0 reason userInfo]);
}

- (NSArray)readableDocumentTypes
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[1] = [(TSABaseApplicationDelegate *)self templateDocumentType];
  v4[2] = [(TSABaseApplicationDelegate *)self templateSFFDocumentType];
  v4[3] = [(TSABaseApplicationDelegate *)self tangierEditingFormatDocumentType];
  v4[4] = [(TSABaseApplicationDelegate *)self nativeSFFDocumentType];
  return (NSArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v4, 5), "arrayByAddingObjectsFromArray:", -[TSABaseApplicationDelegate importableDocumentTypes](self, "importableDocumentTypes"));
}

- (NSArray)importableDocumentTypes
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate importableDocumentTypes]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 123, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSABaseApplicationDelegate importableDocumentTypes]"), 0 reason userInfo]);
}

- (BOOL)isReadableDocumentType:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = [(TSABaseApplicationDelegate *)self readableDocumentTypes];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(a3, "tsu_conformsToUTI:", *(void *)(*((void *)&v10 + 1) + 8 * v8)))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (NSArray)applicationTemplateVariants
{
  CFLocaleRef v3 = CFLocaleCopyCurrent();
  v4 = [(TSABaseApplicationDelegate *)self applicationTemplateVariantsForLocale:v3];
  CFRelease(v3);
  return v4;
}

- (id)applicationTemplateVariantsForLocale:(__CFLocale *)a3
{
  CFLocaleRef v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSABaseApplicationDelegate applicationTemplateVariantsForLocale:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 152, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSABaseApplicationDelegate applicationTemplateVariantsForLocale:]"), 0 reason userInfo]);
}

- (double)mimimumAspectRatioForPreviewImage
{
  return 0.0;
}

- (double)maximumAspectRatioForPreviewImage
{
  return 1.79769313e308;
}

- (id)validURLSchemes
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_26D739C90];
}

- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString");
  if (!v5)
  {
    id v4 = (id)[NSURL URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"http://%@", objc_msgSend(v4, "absoluteString"))];
    uint64_t v5 = [v4 scheme];
    if (!v5) {
      return 0;
    }
  }
  if (objc_msgSend((id)objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "invalidURLSchemes"), "member:", v5))
  {
    return 0;
  }
  uint64_t v7 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  return [v7 openURL:v4];
}

+ (void)presentAlertController:(id)a3 animated:(BOOL)a4
{
  id v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"+[TSABaseApplicationDelegate presentAlertController:animated:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 240, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "+[TSABaseApplicationDelegate presentAlertController:animated:]"), 0 reason userInfo]);
}

- (BOOL)URLIsValidForImportedHyperlink:(id)a3
{
  uint64_t v4 = [a3 scheme];
  if (v4) {
    LOBYTE(v4) = objc_msgSend(-[TSABaseApplicationDelegate invalidURLSchemes](self, "invalidURLSchemes"), "member:", v4) == 0;
  }
  return v4;
}

- (id)existingNestedDocumentPathForPath:(id)a3
{
  if (!objc_msgSend(a3, "tsu_pathConformsToUTI:", -[TSABaseApplicationDelegate tangierEditingFormatDocumentType](self, "tangierEditingFormatDocumentType")))return 0; {
  uint64_t v5 = objc_msgSend(a3, "stringByAppendingPathComponent:", -[TSKCompatibilityDelegate nestedDocumentFilename](-[TSKApplicationDelegate compatibilityDelegate](self, "compatibilityDelegate"), "nestedDocumentFilename"));
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v5) & 1) == 0) {
    return 0;
  }
  return v5;
}

- (TSADownloadDelegate)downloadDelegate
{
  return self->_downloadDelegate;
}

- (void)setDownloadDelegate:(id)a3
{
}

@end