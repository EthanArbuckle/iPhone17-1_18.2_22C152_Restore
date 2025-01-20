@interface ICASPdfStateData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPdfState)pdfEndState;
- (ICASPdfState)pdfStartState;
- (ICASPdfStateData)initWithPdfStartState:(id)a3 pdfEndState:(id)a4 hasSmallStateUsage:(id)a5 hasMediumStateUsage:(id)a6 hasLargeStateUsage:(id)a7 hasFullScreenStateUsage:(id)a8;
- (NSNumber)hasFullScreenStateUsage;
- (NSNumber)hasLargeStateUsage;
- (NSNumber)hasMediumStateUsage;
- (NSNumber)hasSmallStateUsage;
- (id)toDict;
@end

@implementation ICASPdfStateData

- (ICASPdfStateData)initWithPdfStartState:(id)a3 pdfEndState:(id)a4 hasSmallStateUsage:(id)a5 hasMediumStateUsage:(id)a6 hasLargeStateUsage:(id)a7 hasFullScreenStateUsage:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICASPdfStateData;
  v18 = [(ICASPdfStateData *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pdfStartState, a3);
    objc_storeStrong((id *)&v19->_pdfEndState, a4);
    objc_storeStrong((id *)&v19->_hasSmallStateUsage, a5);
    objc_storeStrong((id *)&v19->_hasMediumStateUsage, a6);
    objc_storeStrong((id *)&v19->_hasLargeStateUsage, a7);
    objc_storeStrong((id *)&v19->_hasFullScreenStateUsage, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)@"PdfStateData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v25[6] = *MEMORY[0x1E4F143B8];
  v24[0] = @"pdfStartState";
  id v23 = [(ICASPdfStateData *)self pdfStartState];
  if (v23)
  {
    uint64_t v3 = [(ICASPdfStateData *)self pdfStartState];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"pdfEndState";
  uint64_t v20 = [(ICASPdfStateData *)self pdfEndState];
  if (v20)
  {
    uint64_t v4 = [(ICASPdfStateData *)self pdfEndState];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = @"hasSmallStateUsage";
  v6 = [(ICASPdfStateData *)self hasSmallStateUsage];
  if (v6)
  {
    uint64_t v7 = [(ICASPdfStateData *)self hasSmallStateUsage];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = @"hasMediumStateUsage";
  v9 = [(ICASPdfStateData *)self hasMediumStateUsage];
  if (v9)
  {
    uint64_t v10 = [(ICASPdfStateData *)self hasMediumStateUsage];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = @"hasLargeStateUsage";
  v12 = [(ICASPdfStateData *)self hasLargeStateUsage];
  if (v12)
  {
    uint64_t v13 = [(ICASPdfStateData *)self hasLargeStateUsage];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = @"hasFullScreenStateUsage";
  id v15 = [(ICASPdfStateData *)self hasFullScreenStateUsage];
  if (v15)
  {
    uint64_t v16 = [(ICASPdfStateData *)self hasFullScreenStateUsage];
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

- (ICASPdfState)pdfStartState
{
  return self->_pdfStartState;
}

- (ICASPdfState)pdfEndState
{
  return self->_pdfEndState;
}

- (NSNumber)hasSmallStateUsage
{
  return self->_hasSmallStateUsage;
}

- (NSNumber)hasMediumStateUsage
{
  return self->_hasMediumStateUsage;
}

- (NSNumber)hasLargeStateUsage
{
  return self->_hasLargeStateUsage;
}

- (NSNumber)hasFullScreenStateUsage
{
  return self->_hasFullScreenStateUsage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasFullScreenStateUsage, 0);
  objc_storeStrong((id *)&self->_hasLargeStateUsage, 0);
  objc_storeStrong((id *)&self->_hasMediumStateUsage, 0);
  objc_storeStrong((id *)&self->_hasSmallStateUsage, 0);
  objc_storeStrong((id *)&self->_pdfEndState, 0);
  objc_storeStrong((id *)&self->_pdfStartState, 0);
}

@end