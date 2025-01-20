@interface ICASEditorCallOutData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollabActivityContextPath)collabActivityContextPath;
- (ICASEditorCallOutData)initWithCollabActivityContextPath:(id)a3 startState:(id)a4 endState:(id)a5;
- (ICASEndState)endState;
- (ICASStartState)startState;
- (id)toDict;
@end

@implementation ICASEditorCallOutData

- (ICASEditorCallOutData)initWithCollabActivityContextPath:(id)a3 startState:(id)a4 endState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASEditorCallOutData;
  v12 = [(ICASEditorCallOutData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collabActivityContextPath, a3);
    objc_storeStrong((id *)&v13->_startState, a4);
    objc_storeStrong((id *)&v13->_endState, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"EditorCallOutData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"collabActivityContextPath";
  v3 = [(ICASEditorCallOutData *)self collabActivityContextPath];
  if (v3)
  {
    uint64_t v4 = [(ICASEditorCallOutData *)self collabActivityContextPath];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"startState";
  v6 = [(ICASEditorCallOutData *)self startState];
  if (v6)
  {
    uint64_t v7 = [(ICASEditorCallOutData *)self startState];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"endState";
  id v9 = [(ICASEditorCallOutData *)self endState];
  if (v9)
  {
    uint64_t v10 = [(ICASEditorCallOutData *)self endState];
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

- (ICASCollabActivityContextPath)collabActivityContextPath
{
  return self->_collabActivityContextPath;
}

- (ICASStartState)startState
{
  return self->_startState;
}

- (ICASEndState)endState
{
  return self->_endState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endState, 0);
  objc_storeStrong((id *)&self->_startState, 0);
  objc_storeStrong((id *)&self->_collabActivityContextPath, 0);
}

@end