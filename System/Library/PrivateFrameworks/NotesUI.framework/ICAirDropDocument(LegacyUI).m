@interface ICAirDropDocument(LegacyUI)
+ (id)legacyNoteAirDropDocumentWithWebArchive:()LegacyUI;
- (id)webArchiveFromLegacyNoteDocument;
@end

@implementation ICAirDropDocument(LegacyUI)

+ (id)legacyNoteAirDropDocumentWithWebArchive:()LegacyUI
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 data];
    if (v6)
    {
      v7 = [a1 legacyNoteAirDropDocumentWithData:v6];
    }
    else
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"data", "+[ICAirDropDocument(LegacyUI) legacyNoteAirDropDocumentWithWebArchive:]", 1, 0, @"Failed to generate data from webArchive %@", v5 functionName simulateCrash showAlert format];
      v7 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"webArchive" functionName:"+[ICAirDropDocument(LegacyUI) legacyNoteAirDropDocumentWithWebArchive:]" simulateCrash:1 showAlert:0 format:@"webArchive is nil"];
    v7 = 0;
  }

  return v7;
}

- (id)webArchiveFromLegacyNoteDocument
{
  v1 = [a1 dataFromLegacyNoteDocument];
  if (v1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4FB6D88]) initWithData:v1];
    if (!v2) {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "webArchive", "-[ICAirDropDocument(LegacyUI) webArchiveFromLegacyNoteDocument]", 1, 0, @"Failed to create WebArchive from data with length %lu", objc_msgSend(v1, "length"));
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end