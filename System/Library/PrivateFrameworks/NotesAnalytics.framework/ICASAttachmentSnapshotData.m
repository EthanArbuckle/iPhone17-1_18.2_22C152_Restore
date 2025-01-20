@interface ICASAttachmentSnapshotData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAttachmentSnapshotData)initWithAttachmentSnapshotSummary:(id)a3 docScanSnapshotSummary:(id)a4 drawingSnapshotSummary:(id)a5 tableSnapshotSummary:(id)a6;
- (NSArray)attachmentSnapshotSummary;
- (NSArray)docScanSnapshotSummary;
- (NSArray)drawingSnapshotSummary;
- (NSArray)tableSnapshotSummary;
- (id)toDict;
@end

@implementation ICASAttachmentSnapshotData

- (ICASAttachmentSnapshotData)initWithAttachmentSnapshotSummary:(id)a3 docScanSnapshotSummary:(id)a4 drawingSnapshotSummary:(id)a5 tableSnapshotSummary:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASAttachmentSnapshotData;
  v15 = [(ICASAttachmentSnapshotData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_attachmentSnapshotSummary, a3);
    objc_storeStrong((id *)&v16->_docScanSnapshotSummary, a4);
    objc_storeStrong((id *)&v16->_drawingSnapshotSummary, a5);
    objc_storeStrong((id *)&v16->_tableSnapshotSummary, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"AttachmentSnapshotData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"attachmentSnapshotSummary";
  v3 = [(ICASAttachmentSnapshotData *)self attachmentSnapshotSummary];
  if (v3)
  {
    uint64_t v4 = [(ICASAttachmentSnapshotData *)self attachmentSnapshotSummary];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"docScanSnapshotSummary";
  v6 = [(ICASAttachmentSnapshotData *)self docScanSnapshotSummary];
  if (v6)
  {
    uint64_t v7 = [(ICASAttachmentSnapshotData *)self docScanSnapshotSummary];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"drawingSnapshotSummary";
  v9 = [(ICASAttachmentSnapshotData *)self drawingSnapshotSummary];
  if (v9)
  {
    uint64_t v10 = [(ICASAttachmentSnapshotData *)self drawingSnapshotSummary];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"tableSnapshotSummary";
  id v12 = [(ICASAttachmentSnapshotData *)self tableSnapshotSummary];
  if (v12)
  {
    uint64_t v13 = [(ICASAttachmentSnapshotData *)self tableSnapshotSummary];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSArray)attachmentSnapshotSummary
{
  return self->_attachmentSnapshotSummary;
}

- (NSArray)docScanSnapshotSummary
{
  return self->_docScanSnapshotSummary;
}

- (NSArray)drawingSnapshotSummary
{
  return self->_drawingSnapshotSummary;
}

- (NSArray)tableSnapshotSummary
{
  return self->_tableSnapshotSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_drawingSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_docScanSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_attachmentSnapshotSummary, 0);
}

@end