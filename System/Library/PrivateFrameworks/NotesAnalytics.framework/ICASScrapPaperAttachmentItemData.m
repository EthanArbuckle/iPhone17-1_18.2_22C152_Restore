@interface ICASScrapPaperAttachmentItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASScrapPaperAttachmentItemData)initWithTotalCountOfScrapPapersWithAttachmentDocScan:(id)a3 totalCountOfScrapPapersWithAttachmentInlineDrawingV1:(id)a4 totalCountOfScrapPapersWithAttachmentInlineDrawingV2:(id)a5 totalCountOfScrapPapersWithAttachmentPaperKit:(id)a6 totalCountOfScrapPapersWithAttachmentFullscreenDrawing:(id)a7 totalCountOfScrapPapersWithAttachmentTables:(id)a8 totalCountOfScrapPapersWithAttachmentOther:(id)a9 totalCountOfScrapPapersWithAttachmentRichUrl:(id)a10 totalCountOfScrapPapersWithAttachmentMapLink:(id)a11 totalCountOfScrapPapersWithAttachmentDeepLink:(id)a12;
- (NSNumber)totalCountOfScrapPapersWithAttachmentDeepLink;
- (NSNumber)totalCountOfScrapPapersWithAttachmentDocScan;
- (NSNumber)totalCountOfScrapPapersWithAttachmentFullscreenDrawing;
- (NSNumber)totalCountOfScrapPapersWithAttachmentInlineDrawingV1;
- (NSNumber)totalCountOfScrapPapersWithAttachmentInlineDrawingV2;
- (NSNumber)totalCountOfScrapPapersWithAttachmentMapLink;
- (NSNumber)totalCountOfScrapPapersWithAttachmentOther;
- (NSNumber)totalCountOfScrapPapersWithAttachmentPaperKit;
- (NSNumber)totalCountOfScrapPapersWithAttachmentRichUrl;
- (NSNumber)totalCountOfScrapPapersWithAttachmentTables;
- (id)toDict;
@end

@implementation ICASScrapPaperAttachmentItemData

- (ICASScrapPaperAttachmentItemData)initWithTotalCountOfScrapPapersWithAttachmentDocScan:(id)a3 totalCountOfScrapPapersWithAttachmentInlineDrawingV1:(id)a4 totalCountOfScrapPapersWithAttachmentInlineDrawingV2:(id)a5 totalCountOfScrapPapersWithAttachmentPaperKit:(id)a6 totalCountOfScrapPapersWithAttachmentFullscreenDrawing:(id)a7 totalCountOfScrapPapersWithAttachmentTables:(id)a8 totalCountOfScrapPapersWithAttachmentOther:(id)a9 totalCountOfScrapPapersWithAttachmentRichUrl:(id)a10 totalCountOfScrapPapersWithAttachmentMapLink:(id)a11 totalCountOfScrapPapersWithAttachmentDeepLink:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v32 = a5;
  id v26 = a6;
  id v31 = a6;
  id v27 = a7;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)ICASScrapPaperAttachmentItemData;
  v22 = [(ICASScrapPaperAttachmentItemData *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_totalCountOfScrapPapersWithAttachmentDocScan, a3);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentInlineDrawingV1, obj);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentInlineDrawingV2, a5);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentPaperKit, v26);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentFullscreenDrawing, v27);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentTables, a8);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentOther, a9);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentRichUrl, a10);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentMapLink, a11);
    objc_storeStrong((id *)&v23->_totalCountOfScrapPapersWithAttachmentDeepLink, a12);
  }

  return v23;
}

+ (NSString)dataName
{
  return (NSString *)@"ScrapPaperAttachmentItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v36[10] = *MEMORY[0x1E4F143B8];
  v35[0] = @"totalCountOfScrapPapersWithAttachmentDocScan";
  id v34 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentDocScan];
  if (v34)
  {
    uint64_t v3 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentDocScan];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v33 = (void *)v3;
  v36[0] = v3;
  v35[1] = @"totalCountOfScrapPapersWithAttachmentInlineDrawingV1";
  id v32 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentInlineDrawingV1];
  if (v32)
  {
    uint64_t v4 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentInlineDrawingV1];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v31 = (void *)v4;
  v36[1] = v4;
  v35[2] = @"totalCountOfScrapPapersWithAttachmentInlineDrawingV2";
  id v30 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentInlineDrawingV2];
  if (v30)
  {
    uint64_t v5 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentInlineDrawingV2];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v29 = (void *)v5;
  v36[2] = v5;
  v35[3] = @"totalCountOfScrapPapersWithAttachmentPaperKit";
  v28 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentPaperKit];
  if (v28)
  {
    uint64_t v6 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentPaperKit];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  id v27 = (void *)v6;
  v36[3] = v6;
  v35[4] = @"totalCountOfScrapPapersWithAttachmentFullscreenDrawing";
  id v26 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentFullscreenDrawing];
  if (v26)
  {
    uint64_t v7 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentFullscreenDrawing];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v25 = (void *)v7;
  v36[4] = v7;
  v35[5] = @"totalCountOfScrapPapersWithAttachmentTables";
  v24 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentTables];
  if (v24)
  {
    uint64_t v8 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentTables];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v36[5] = v8;
  v35[6] = @"totalCountOfScrapPapersWithAttachmentOther";
  v10 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentOther];
  if (v10)
  {
    uint64_t v11 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentOther];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v36[6] = v11;
  v35[7] = @"totalCountOfScrapPapersWithAttachmentRichUrl";
  v13 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentRichUrl];
  if (v13)
  {
    uint64_t v14 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentRichUrl];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v36[7] = v14;
  v35[8] = @"totalCountOfScrapPapersWithAttachmentMapLink";
  v16 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentMapLink];
  if (v16)
  {
    uint64_t v17 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentMapLink];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  id v18 = (void *)v17;
  v36[8] = v17;
  v35[9] = @"totalCountOfScrapPapersWithAttachmentDeepLink";
  id v19 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentDeepLink];
  if (v19)
  {
    uint64_t v20 = [(ICASScrapPaperAttachmentItemData *)self totalCountOfScrapPapersWithAttachmentDeepLink];
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }
  id v21 = (void *)v20;
  v36[9] = v20;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:10];

  return v22;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentDocScan
{
  return self->_totalCountOfScrapPapersWithAttachmentDocScan;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentInlineDrawingV1
{
  return self->_totalCountOfScrapPapersWithAttachmentInlineDrawingV1;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentInlineDrawingV2
{
  return self->_totalCountOfScrapPapersWithAttachmentInlineDrawingV2;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentPaperKit
{
  return self->_totalCountOfScrapPapersWithAttachmentPaperKit;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentFullscreenDrawing
{
  return self->_totalCountOfScrapPapersWithAttachmentFullscreenDrawing;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentTables
{
  return self->_totalCountOfScrapPapersWithAttachmentTables;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentOther
{
  return self->_totalCountOfScrapPapersWithAttachmentOther;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentRichUrl
{
  return self->_totalCountOfScrapPapersWithAttachmentRichUrl;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentMapLink
{
  return self->_totalCountOfScrapPapersWithAttachmentMapLink;
}

- (NSNumber)totalCountOfScrapPapersWithAttachmentDeepLink
{
  return self->_totalCountOfScrapPapersWithAttachmentDeepLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentDeepLink, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentMapLink, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentRichUrl, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentOther, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentPaperKit, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithAttachmentDocScan, 0);
}

@end