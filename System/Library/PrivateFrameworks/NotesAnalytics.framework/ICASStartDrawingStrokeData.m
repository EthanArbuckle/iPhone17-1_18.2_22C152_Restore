@interface ICASStartDrawingStrokeData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASStartDrawingStrokeData)initWithStartPencilStrokeCount:(id)a3 startFingerStrokeCount:(id)a4;
- (NSNumber)startFingerStrokeCount;
- (NSNumber)startPencilStrokeCount;
- (id)toDict;
@end

@implementation ICASStartDrawingStrokeData

- (ICASStartDrawingStrokeData)initWithStartPencilStrokeCount:(id)a3 startFingerStrokeCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASStartDrawingStrokeData;
  v9 = [(ICASStartDrawingStrokeData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startPencilStrokeCount, a3);
    objc_storeStrong((id *)&v10->_startFingerStrokeCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"StartDrawingStrokeData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"startPencilStrokeCount";
  v3 = [(ICASStartDrawingStrokeData *)self startPencilStrokeCount];
  if (v3)
  {
    uint64_t v4 = [(ICASStartDrawingStrokeData *)self startPencilStrokeCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"startFingerStrokeCount";
  v12[0] = v4;
  v6 = [(ICASStartDrawingStrokeData *)self startFingerStrokeCount];
  if (v6)
  {
    uint64_t v7 = [(ICASStartDrawingStrokeData *)self startFingerStrokeCount];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSNumber)startPencilStrokeCount
{
  return self->_startPencilStrokeCount;
}

- (NSNumber)startFingerStrokeCount
{
  return self->_startFingerStrokeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startFingerStrokeCount, 0);
  objc_storeStrong((id *)&self->_startPencilStrokeCount, 0);
}

@end