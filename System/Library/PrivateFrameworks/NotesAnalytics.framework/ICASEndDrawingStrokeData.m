@interface ICASEndDrawingStrokeData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASEndDrawingStrokeData)initWithEndPencilStrokeCount:(id)a3 endFingerStrokeCount:(id)a4;
- (NSNumber)endFingerStrokeCount;
- (NSNumber)endPencilStrokeCount;
- (id)toDict;
@end

@implementation ICASEndDrawingStrokeData

- (ICASEndDrawingStrokeData)initWithEndPencilStrokeCount:(id)a3 endFingerStrokeCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASEndDrawingStrokeData;
  v9 = [(ICASEndDrawingStrokeData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endPencilStrokeCount, a3);
    objc_storeStrong((id *)&v10->_endFingerStrokeCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"EndDrawingStrokeData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"endPencilStrokeCount";
  v3 = [(ICASEndDrawingStrokeData *)self endPencilStrokeCount];
  if (v3)
  {
    uint64_t v4 = [(ICASEndDrawingStrokeData *)self endPencilStrokeCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"endFingerStrokeCount";
  v12[0] = v4;
  v6 = [(ICASEndDrawingStrokeData *)self endFingerStrokeCount];
  if (v6)
  {
    uint64_t v7 = [(ICASEndDrawingStrokeData *)self endFingerStrokeCount];
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

- (NSNumber)endPencilStrokeCount
{
  return self->_endPencilStrokeCount;
}

- (NSNumber)endFingerStrokeCount
{
  return self->_endFingerStrokeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endFingerStrokeCount, 0);
  objc_storeStrong((id *)&self->_endPencilStrokeCount, 0);
}

@end