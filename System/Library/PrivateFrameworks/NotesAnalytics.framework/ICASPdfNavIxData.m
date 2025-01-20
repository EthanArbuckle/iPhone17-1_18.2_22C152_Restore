@interface ICASPdfNavIxData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPdfNavIxData)initWithHasGestures:(id)a3 hasScroll:(id)a4 hasPagination:(id)a5 hasPinchZoom:(id)a6 hasPinchToExpandState:(id)a7;
- (NSNumber)hasGestures;
- (NSNumber)hasPagination;
- (NSNumber)hasPinchToExpandState;
- (NSNumber)hasPinchZoom;
- (NSNumber)hasScroll;
- (id)toDict;
@end

@implementation ICASPdfNavIxData

- (ICASPdfNavIxData)initWithHasGestures:(id)a3 hasScroll:(id)a4 hasPagination:(id)a5 hasPinchZoom:(id)a6 hasPinchToExpandState:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASPdfNavIxData;
  v17 = [(ICASPdfNavIxData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_hasGestures, a3);
    objc_storeStrong((id *)&v18->_hasScroll, a4);
    objc_storeStrong((id *)&v18->_hasPagination, a5);
    objc_storeStrong((id *)&v18->_hasPinchZoom, a6);
    objc_storeStrong((id *)&v18->_hasPinchToExpandState, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)@"PdfNavIxData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21[0] = @"hasGestures";
  uint64_t v19 = [(ICASPdfNavIxData *)self hasGestures];
  if (v19)
  {
    uint64_t v3 = [(ICASPdfNavIxData *)self hasGestures];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = @"hasScroll";
  v5 = [(ICASPdfNavIxData *)self hasScroll];
  if (v5)
  {
    uint64_t v6 = [(ICASPdfNavIxData *)self hasScroll];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = @"hasPagination";
  v8 = [(ICASPdfNavIxData *)self hasPagination];
  if (v8)
  {
    uint64_t v9 = [(ICASPdfNavIxData *)self hasPagination];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = @"hasPinchZoom";
  v11 = [(ICASPdfNavIxData *)self hasPinchZoom];
  if (v11)
  {
    uint64_t v12 = [(ICASPdfNavIxData *)self hasPinchZoom];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = @"hasPinchToExpandState";
  id v14 = [(ICASPdfNavIxData *)self hasPinchToExpandState];
  if (v14)
  {
    uint64_t v15 = [(ICASPdfNavIxData *)self hasPinchToExpandState];
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

- (NSNumber)hasGestures
{
  return self->_hasGestures;
}

- (NSNumber)hasScroll
{
  return self->_hasScroll;
}

- (NSNumber)hasPagination
{
  return self->_hasPagination;
}

- (NSNumber)hasPinchZoom
{
  return self->_hasPinchZoom;
}

- (NSNumber)hasPinchToExpandState
{
  return self->_hasPinchToExpandState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasPinchToExpandState, 0);
  objc_storeStrong((id *)&self->_hasPinchZoom, 0);
  objc_storeStrong((id *)&self->_hasPagination, 0);
  objc_storeStrong((id *)&self->_hasScroll, 0);
  objc_storeStrong((id *)&self->_hasGestures, 0);
}

@end