@interface ICASDrawingData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDrawingActionType)drawingActionType;
- (ICASDrawingData)initWithDrawingActionType:(id)a3 drawingTool:(id)a4 drawingID:(id)a5;
- (ICASDrawingTool)drawingTool;
- (NSString)drawingID;
- (id)toDict;
@end

@implementation ICASDrawingData

- (ICASDrawingData)initWithDrawingActionType:(id)a3 drawingTool:(id)a4 drawingID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASDrawingData;
  v12 = [(ICASDrawingData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_drawingActionType, a3);
    objc_storeStrong((id *)&v13->_drawingTool, a4);
    objc_storeStrong((id *)&v13->_drawingID, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"DrawingData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"drawingActionType";
  v3 = [(ICASDrawingData *)self drawingActionType];
  if (v3)
  {
    uint64_t v4 = [(ICASDrawingData *)self drawingActionType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"drawingTool";
  v6 = [(ICASDrawingData *)self drawingTool];
  if (v6)
  {
    uint64_t v7 = [(ICASDrawingData *)self drawingTool];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"drawingID";
  id v9 = [(ICASDrawingData *)self drawingID];
  if (v9)
  {
    uint64_t v10 = [(ICASDrawingData *)self drawingID];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (ICASDrawingActionType)drawingActionType
{
  return self->_drawingActionType;
}

- (ICASDrawingTool)drawingTool
{
  return self->_drawingTool;
}

- (NSString)drawingID
{
  return self->_drawingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingID, 0);
  objc_storeStrong((id *)&self->_drawingTool, 0);
  objc_storeStrong((id *)&self->_drawingActionType, 0);
}

@end