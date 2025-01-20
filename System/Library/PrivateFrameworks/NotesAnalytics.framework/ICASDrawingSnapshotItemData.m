@interface ICASDrawingSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDrawingSnapshotItemData)initWithCountOfInlineDrawingV1PencilStrokes:(id)a3 countOfInlineDrawingV1FingerStrokes:(id)a4 countOfInlineDrawingV2PencilStrokes:(id)a5 countOfInlineDrawingV2FingerStrokes:(id)a6 countOfFullscreenDrawingStrokes:(id)a7;
- (NSNumber)countOfFullscreenDrawingStrokes;
- (NSNumber)countOfInlineDrawingV1FingerStrokes;
- (NSNumber)countOfInlineDrawingV1PencilStrokes;
- (NSNumber)countOfInlineDrawingV2FingerStrokes;
- (NSNumber)countOfInlineDrawingV2PencilStrokes;
- (id)toDict;
@end

@implementation ICASDrawingSnapshotItemData

- (ICASDrawingSnapshotItemData)initWithCountOfInlineDrawingV1PencilStrokes:(id)a3 countOfInlineDrawingV1FingerStrokes:(id)a4 countOfInlineDrawingV2PencilStrokes:(id)a5 countOfInlineDrawingV2FingerStrokes:(id)a6 countOfFullscreenDrawingStrokes:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASDrawingSnapshotItemData;
  v17 = [(ICASDrawingSnapshotItemData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_countOfInlineDrawingV1PencilStrokes, a3);
    objc_storeStrong((id *)&v18->_countOfInlineDrawingV1FingerStrokes, a4);
    objc_storeStrong((id *)&v18->_countOfInlineDrawingV2PencilStrokes, a5);
    objc_storeStrong((id *)&v18->_countOfInlineDrawingV2FingerStrokes, a6);
    objc_storeStrong((id *)&v18->_countOfFullscreenDrawingStrokes, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)@"DrawingSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21[0] = @"countOfInlineDrawingV1PencilStrokes";
  uint64_t v19 = [(ICASDrawingSnapshotItemData *)self countOfInlineDrawingV1PencilStrokes];
  if (v19)
  {
    uint64_t v3 = [(ICASDrawingSnapshotItemData *)self countOfInlineDrawingV1PencilStrokes];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = @"countOfInlineDrawingV1FingerStrokes";
  v5 = [(ICASDrawingSnapshotItemData *)self countOfInlineDrawingV1FingerStrokes];
  if (v5)
  {
    uint64_t v6 = [(ICASDrawingSnapshotItemData *)self countOfInlineDrawingV1FingerStrokes];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = @"countOfInlineDrawingV2PencilStrokes";
  v8 = [(ICASDrawingSnapshotItemData *)self countOfInlineDrawingV2PencilStrokes];
  if (v8)
  {
    uint64_t v9 = [(ICASDrawingSnapshotItemData *)self countOfInlineDrawingV2PencilStrokes];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = @"countOfInlineDrawingV2FingerStrokes";
  v11 = [(ICASDrawingSnapshotItemData *)self countOfInlineDrawingV2FingerStrokes];
  if (v11)
  {
    uint64_t v12 = [(ICASDrawingSnapshotItemData *)self countOfInlineDrawingV2FingerStrokes];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = @"countOfFullscreenDrawingStrokes";
  id v14 = [(ICASDrawingSnapshotItemData *)self countOfFullscreenDrawingStrokes];
  if (v14)
  {
    uint64_t v15 = [(ICASDrawingSnapshotItemData *)self countOfFullscreenDrawingStrokes];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  id v16 = (void *)v15;
  v22[4] = v15;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];

  return v17;
}

- (NSNumber)countOfInlineDrawingV1PencilStrokes
{
  return self->_countOfInlineDrawingV1PencilStrokes;
}

- (NSNumber)countOfInlineDrawingV1FingerStrokes
{
  return self->_countOfInlineDrawingV1FingerStrokes;
}

- (NSNumber)countOfInlineDrawingV2PencilStrokes
{
  return self->_countOfInlineDrawingV2PencilStrokes;
}

- (NSNumber)countOfInlineDrawingV2FingerStrokes
{
  return self->_countOfInlineDrawingV2FingerStrokes;
}

- (NSNumber)countOfFullscreenDrawingStrokes
{
  return self->_countOfFullscreenDrawingStrokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfFullscreenDrawingStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2FingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2PencilStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1FingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1PencilStrokes, 0);
}

@end