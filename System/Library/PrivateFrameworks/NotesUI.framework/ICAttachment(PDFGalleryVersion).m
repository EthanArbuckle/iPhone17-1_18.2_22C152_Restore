@interface ICAttachment(PDFGalleryVersion)
- (uint64_t)docCamPDFVersion;
@end

@implementation ICAttachment(PDFGalleryVersion)

- (uint64_t)docCamPDFVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [a1 managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ICAttachment_PDFGalleryVersion__docCamPDFVersion__block_invoke;
  v5[3] = &unk_1E5FD91F8;
  v5[4] = a1;
  v5[5] = &v6;
  [v2 performBlockAndWait:v5];

  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end