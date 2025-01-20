@interface ICASDrawingRecognitionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDrawingRecognitionData)initWithCountOfPencilStrokes:(id)a3 countOfFingerStrokes:(id)a4 countOfRecognizedHandwrittenCharacters:(id)a5 countOfRecognizedLines:(id)a6 handwritingLanguage:(id)a7 drawingID:(id)a8;
- (NSNumber)countOfFingerStrokes;
- (NSNumber)countOfPencilStrokes;
- (NSNumber)countOfRecognizedHandwrittenCharacters;
- (NSNumber)countOfRecognizedLines;
- (NSString)drawingID;
- (NSString)handwritingLanguage;
- (id)toDict;
@end

@implementation ICASDrawingRecognitionData

- (ICASDrawingRecognitionData)initWithCountOfPencilStrokes:(id)a3 countOfFingerStrokes:(id)a4 countOfRecognizedHandwrittenCharacters:(id)a5 countOfRecognizedLines:(id)a6 handwritingLanguage:(id)a7 drawingID:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICASDrawingRecognitionData;
  v18 = [(ICASDrawingRecognitionData *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_countOfPencilStrokes, a3);
    objc_storeStrong((id *)&v19->_countOfFingerStrokes, a4);
    objc_storeStrong((id *)&v19->_countOfRecognizedHandwrittenCharacters, a5);
    objc_storeStrong((id *)&v19->_countOfRecognizedLines, a6);
    objc_storeStrong((id *)&v19->_handwritingLanguage, a7);
    objc_storeStrong((id *)&v19->_drawingID, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)@"DrawingRecognitionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v25[6] = *MEMORY[0x1E4F143B8];
  v24[0] = @"countOfPencilStrokes";
  id v23 = [(ICASDrawingRecognitionData *)self countOfPencilStrokes];
  if (v23)
  {
    uint64_t v3 = [(ICASDrawingRecognitionData *)self countOfPencilStrokes];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"countOfFingerStrokes";
  uint64_t v20 = [(ICASDrawingRecognitionData *)self countOfFingerStrokes];
  if (v20)
  {
    uint64_t v4 = [(ICASDrawingRecognitionData *)self countOfFingerStrokes];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = @"countOfRecognizedHandwrittenCharacters";
  v6 = [(ICASDrawingRecognitionData *)self countOfRecognizedHandwrittenCharacters];
  if (v6)
  {
    uint64_t v7 = [(ICASDrawingRecognitionData *)self countOfRecognizedHandwrittenCharacters];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = @"countOfRecognizedLines";
  v9 = [(ICASDrawingRecognitionData *)self countOfRecognizedLines];
  if (v9)
  {
    uint64_t v10 = [(ICASDrawingRecognitionData *)self countOfRecognizedLines];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = @"handwritingLanguage";
  v12 = [(ICASDrawingRecognitionData *)self handwritingLanguage];
  if (v12)
  {
    uint64_t v13 = [(ICASDrawingRecognitionData *)self handwritingLanguage];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = @"drawingID";
  id v15 = [(ICASDrawingRecognitionData *)self drawingID];
  if (v15)
  {
    uint64_t v16 = [(ICASDrawingRecognitionData *)self drawingID];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  id v17 = (void *)v16;
  v25[5] = v16;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:6];

  return v18;
}

- (NSNumber)countOfPencilStrokes
{
  return self->_countOfPencilStrokes;
}

- (NSNumber)countOfFingerStrokes
{
  return self->_countOfFingerStrokes;
}

- (NSNumber)countOfRecognizedHandwrittenCharacters
{
  return self->_countOfRecognizedHandwrittenCharacters;
}

- (NSNumber)countOfRecognizedLines
{
  return self->_countOfRecognizedLines;
}

- (NSString)handwritingLanguage
{
  return self->_handwritingLanguage;
}

- (NSString)drawingID
{
  return self->_drawingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingID, 0);
  objc_storeStrong((id *)&self->_handwritingLanguage, 0);
  objc_storeStrong((id *)&self->_countOfRecognizedLines, 0);
  objc_storeStrong((id *)&self->_countOfRecognizedHandwrittenCharacters, 0);
  objc_storeStrong((id *)&self->_countOfFingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfPencilStrokes, 0);
}

@end