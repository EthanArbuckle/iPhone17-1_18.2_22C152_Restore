@interface ICASPdfCollabIxData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPdfCollabIxData)initWithHasCollabView:(id)a3 hasCollabEdit:(id)a4;
- (NSNumber)hasCollabEdit;
- (NSNumber)hasCollabView;
- (id)toDict;
@end

@implementation ICASPdfCollabIxData

- (ICASPdfCollabIxData)initWithHasCollabView:(id)a3 hasCollabEdit:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASPdfCollabIxData;
  v9 = [(ICASPdfCollabIxData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hasCollabView, a3);
    objc_storeStrong((id *)&v10->_hasCollabEdit, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"PdfCollabIxData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"hasCollabView";
  v3 = [(ICASPdfCollabIxData *)self hasCollabView];
  if (v3)
  {
    uint64_t v4 = [(ICASPdfCollabIxData *)self hasCollabView];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"hasCollabEdit";
  v12[0] = v4;
  v6 = [(ICASPdfCollabIxData *)self hasCollabEdit];
  if (v6)
  {
    uint64_t v7 = [(ICASPdfCollabIxData *)self hasCollabEdit];
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

- (NSNumber)hasCollabView
{
  return self->_hasCollabView;
}

- (NSNumber)hasCollabEdit
{
  return self->_hasCollabEdit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasCollabEdit, 0);
  objc_storeStrong((id *)&self->_hasCollabView, 0);
}

@end