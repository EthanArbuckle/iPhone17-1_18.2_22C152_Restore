@interface NSURL(UIDocumentPicker)
+ (id)ui_URLFromExportBookmark:()UIDocumentPicker;
+ (id)ui_cloudDocsContainerURL;
+ (id)ui_incomingDirectory:()UIDocumentPicker;
- (BOOL)ui_hasSandboxExtendedForClass:()UIDocumentPicker;
- (_UIDocumentActivityDownloadOperation)ui_downloadOperationForActivity:()UIDocumentPicker;
- (_UIDocumentActivityDownloadOperation)ui_downloadOperationForActivity:()UIDocumentPicker inScene:;
- (id)ui_URLByResolvingSymlinksAndCopyingSecurityScope;
- (id)ui_bookmarkForExportWithError:()UIDocumentPicker;
- (id)ui_issueSandboxExtensionOfClass:()UIDocumentPicker error:;
- (id)ui_resolveOnDiskBookmarkAndPromise;
- (uint64_t)ui_hasReadSandboxExtended;
- (uint64_t)ui_isContentManaged;
- (uint64_t)ui_isUnfulfilledPromiseURL;
- (uint64_t)ui_issueReadSandboxExtensionWithError:()UIDocumentPicker;
- (uint64_t)ui_issueReadWriteSandboxExtensionWithError:()UIDocumentPicker;
- (void)ui_canOpenInPlace;
- (void)ui_isFileProviderURL;
- (void)ui_scheduleForCleanup;
- (void)ui_setIsContentManaged:()UIDocumentPicker;
- (void)ui_setIsFileProviderURL:()UIDocumentPicker;
@end

@implementation NSURL(UIDocumentPicker)

- (uint64_t)ui_issueReadSandboxExtensionWithError:()UIDocumentPicker
{
  return objc_msgSend(a1, "ui_issueSandboxExtensionOfClass:error:", *MEMORY[0x1E4F14000], a3);
}

- (uint64_t)ui_issueReadWriteSandboxExtensionWithError:()UIDocumentPicker
{
  return objc_msgSend(a1, "ui_issueSandboxExtensionOfClass:error:", *MEMORY[0x1E4F14008], a3);
}

- (id)ui_issueSandboxExtensionOfClass:()UIDocumentPicker error:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = [a1 path];
  [v7 fileSystemRepresentation];
  v8 = (const char *)sandbox_extension_issue_file();

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:strlen(v8) + 1];
  }
  else
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28798];
      uint64_t v12 = *__error();
      uint64_t v19 = *MEMORY[0x1E4F1D140];
      v13 = NSString;
      v14 = [a1 path];
      v15 = __error();
      v16 = [v13 stringWithFormat:@"couldn't issue sandbox extension %s for '%@': %s", a3, v14, strerror(*v15)];
      v20[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      *a4 = [v10 errorWithDomain:v11 code:v12 userInfo:v17];
    }
    v9 = 0;
  }
  return v9;
}

- (uint64_t)ui_hasReadSandboxExtended
{
  return objc_msgSend(a1, "ui_hasSandboxExtendedForClass:", *MEMORY[0x1E4F14000]);
}

- (BOOL)ui_hasSandboxExtendedForClass:()UIDocumentPicker
{
  id v1 = [a1 path];
  [v1 fileSystemRepresentation];
  BOOL v2 = sandbox_check() == 0;

  return v2;
}

- (void)ui_isFileProviderURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v2 = (void (*)(uint64_t, void))getFPIsFileProviderBookmarkSymbolLoc_ptr;
  v9 = getFPIsFileProviderBookmarkSymbolLoc_ptr;
  if (!getFPIsFileProviderBookmarkSymbolLoc_ptr)
  {
    v3 = FileProviderLibrary();
    v7[3] = (uint64_t)dlsym(v3, "FPIsFileProviderBookmark");
    getFPIsFileProviderBookmarkSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    BOOL v2 = (void (*)(uint64_t, void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
  {
    v2(a1, 0);
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FPIsFileProviderBookmark(CFURLRef, CFErrorRef *)");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"NSURL+UIDocumentPicker.m", 28, @"%s", dlerror());

    __break(1u);
  }
}

- (void)ui_setIsFileProviderURL:()UIDocumentPicker
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  v5 = (void (*)(uint64_t, uint64_t))getFPMarkAsFileProviderBookmarkSymbolLoc_ptr;
  uint64_t v12 = getFPMarkAsFileProviderBookmarkSymbolLoc_ptr;
  if (!getFPMarkAsFileProviderBookmarkSymbolLoc_ptr)
  {
    uint64_t v6 = FileProviderLibrary();
    v10[3] = (uint64_t)dlsym(v6, "FPMarkAsFileProviderBookmark");
    getFPMarkAsFileProviderBookmarkSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    v5 = (void (*)(uint64_t, uint64_t))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v5)
  {
    v5(a1, a3);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void _FPMarkAsFileProviderBookmark(CFURLRef, BOOL)");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"NSURL+UIDocumentPicker.m", 27, @"%s", dlerror());

    __break(1u);
  }
}

- (void)ui_canOpenInPlace
{
  if ((objc_msgSend(a1, "ui_isFileProviderURL") & 1) == 0)
  {
    id v2 = a1;
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    v3 = (void (*)(id))getBRIsURLInMobileDocumentsSymbolLoc_ptr;
    v10 = getBRIsURLInMobileDocumentsSymbolLoc_ptr;
    if (!getBRIsURLInMobileDocumentsSymbolLoc_ptr)
    {
      v4 = CloudDocsLibrary();
      v8[3] = (uint64_t)dlsym(v4, "BRIsURLInMobileDocuments");
      getBRIsURLInMobileDocumentsSymbolLoc_ptr = (_UNKNOWN *)v8[3];
      v3 = (void (*)(id))v8[3];
    }
    _Block_object_dispose(&v7, 8);
    if (v3)
    {
      v3(v2);
    }
    else
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"BOOL _BRIsURLInMobileDocuments(NSURL *__strong)"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"NSURL+UIDocumentPicker.m", 32, @"%s", dlerror());

      __break(1u);
    }
  }
}

- (uint64_t)ui_isUnfulfilledPromiseURL
{
  uint64_t result = [a1 isFileURL];
  if (result)
  {
    objc_msgSend(a1, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    id v3 = objc_claimAutoreleasedReturnValue();
    int v4 = stat((const char *)[v3 fileSystemRepresentation], &v10);

    if (v4 < 0)
    {
      if (*__error() != 2) {
        return 0;
      }
      uint64_t v5 = _CFURLPromiseCopyPhysicalURL();
      if (!v5) {
        return 0;
      }
      uint64_t v6 = (void *)v5;
      id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      uint64_t v8 = [v6 path];
      char v9 = [v7 fileExistsAtPath:v8];

      return (v9 & 1) != 0;
    }
    else
    {
      return (HIBYTE(v10.st_flags) >> 6) & 1;
    }
  }
  return result;
}

- (void)ui_setIsContentManaged:()UIDocumentPicker
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setTemporaryResourceValue:v2 forKey:@"com.apple.UIKit.isContentManaged"];
}

- (uint64_t)ui_isContentManaged
{
  id v2 = 0;
  [a1 getResourceValue:&v2 forKey:@"com.apple.UIKit.isContentManaged" error:0];
  return [v2 BOOLValue];
}

+ (id)ui_cloudDocsContainerURL
{
  if (qword_1EB260298 != -1) {
    dispatch_once(&qword_1EB260298, &__block_literal_global_156);
  }
  v0 = (void *)_MergedGlobals_1017;
  return v0;
}

- (id)ui_bookmarkForExportWithError:()UIDocumentPicker
{
  id v3 = +[_UIDocumentPickerNSURLWrapper wrapperForExportWithURL:a1 error:a3];
  if (v3)
  {
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v4 encodeObject:v3 forKey:*MEMORY[0x1E4F284E8]];
    uint64_t v5 = [v4 encodedData];
    uint64_t v6 = [v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)ui_URLFromExportBookmark:()UIDocumentPicker
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
  id v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  uint64_t v8 = [v7 url];

  return v8;
}

+ (id)ui_incomingDirectory:()UIDocumentPicker
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = _UIMainBundleIdentifier();
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v6 = NSTemporaryDirectory();
  id v7 = [v5 fileURLWithPath:v6];
  uint64_t v8 = [NSString stringWithFormat:@"%@-Inbox", v4];
  char v9 = [v7 URLByAppendingPathComponent:v8];

  if (a3)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    unsigned __int8 v21 = 0;
    uint64_t v11 = [v9 path];
    int v12 = [v10 fileExistsAtPath:v11 isDirectory:&v21];
    int v13 = v21;

    if (v12) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      [v10 removeItemAtURL:v9 error:0];
      uint64_t v24 = *MEMORY[0x1E4F28370];
      v25[0] = *MEMORY[0x1E4F28358];
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      id v20 = 0;
      [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:v15 error:&v20];
      id v17 = v20;
    }
    else
    {
      uint64_t v22 = *MEMORY[0x1E4F28370];
      uint64_t v23 = *MEMORY[0x1E4F28358];
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v16 = [v9 path];
      id v19 = 0;
      [v10 setAttributes:v15 ofItemAtPath:v16 error:&v19];
      id v17 = v19;
    }
  }

  return v9;
}

- (void)ui_scheduleForCleanup
{
  id v4 = [a1 path];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "ui_incomingDirectory:", 0);
  uint64_t v6 = [v5 path];
  char v7 = [v4 hasPrefix:v6];

  if ((v7 & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, a1, @"NSURL+UIDocumentPicker.m", 214, @"%@ called on URL (%@) not in incoming directory", v11, a1 object file lineNumber description];
  }
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  char v9 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NSURL_UIDocumentPicker__ui_scheduleForCleanup__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = a1;
  dispatch_after(v8, v9, block);
}

- (id)ui_resolveOnDiskBookmarkAndPromise
{
  id v1 = a1;
  if (objc_msgSend(v1, "br_isExternalDocumentReference"))
  {
    uint64_t v2 = objc_msgSend(v1, "br_URLByResolvingExternalDocumentReferenceWithError:", 0);

    id v1 = (id)v2;
  }
  if (_CFURLIsItemPromiseAtURL())
  {
    uint64_t v3 = _CFURLCopyLogicalURLOfPromiseAtURL();

    id v1 = (id)v3;
  }
  return v1;
}

- (_UIDocumentActivityDownloadOperation)ui_downloadOperationForActivity:()UIDocumentPicker
{
  id v1 = [[_UIDocumentActivityDownloadOperation alloc] initWithURL:a1 scene:0];
  return v1;
}

- (_UIDocumentActivityDownloadOperation)ui_downloadOperationForActivity:()UIDocumentPicker inScene:
{
  id v5 = a4;
  uint64_t v6 = [[_UIDocumentActivityDownloadOperation alloc] initWithURL:a1 scene:v5];

  return v6;
}

- (id)ui_URLByResolvingSymlinksAndCopyingSecurityScope
{
  uint64_t v2 = [a1 URLByResolvingSymlinksInPath];
  if (v2 == a1)
  {
    id v11 = a1;
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  id v4 = [v2 path];
  id v5 = [a1 path];
  if (![v5 hasPrefix:@"/private/var/"]) {
    goto LABEL_5;
  }
  int v6 = [v4 hasPrefix:@"/var/"];

  if (v6)
  {
    id v5 = [v3 path];
    uint64_t v7 = [v5 stringByReplacingCharactersInRange:0, objc_msgSend(@"/var/", "length"), @"/private/var/" withString];

    id v4 = (void *)v7;
LABEL_5:
  }
  uint64_t v8 = [a1 hasDirectoryPath];
  char v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:v8];

  id v10 = (void *)MEMORY[0x18C107190](a1);
  if (v10) {
    +[_UIDocumentPickerNSURLWrapper assembleURL:v9 sandbox:v10 physicalURL:0 physicalSandbox:0];
  }
  id v11 = v9;

LABEL_10:
  return v11;
}

@end