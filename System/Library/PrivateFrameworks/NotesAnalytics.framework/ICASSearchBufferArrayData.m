@interface ICASSearchBufferArrayData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSearchBufferArrayData)initWithSearchStringLength:(id)a3 topHitCount:(id)a4 nonTopHitCount:(id)a5 isResultSelected:(id)a6 nonTopHitRawCount:(id)a7 attachmentHitCount:(id)a8;
- (NSNumber)attachmentHitCount;
- (NSNumber)isResultSelected;
- (NSNumber)nonTopHitCount;
- (NSNumber)nonTopHitRawCount;
- (NSNumber)searchStringLength;
- (NSNumber)topHitCount;
- (id)toDict;
@end

@implementation ICASSearchBufferArrayData

- (ICASSearchBufferArrayData)initWithSearchStringLength:(id)a3 topHitCount:(id)a4 nonTopHitCount:(id)a5 isResultSelected:(id)a6 nonTopHitRawCount:(id)a7 attachmentHitCount:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICASSearchBufferArrayData;
  v18 = [(ICASSearchBufferArrayData *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchStringLength, a3);
    objc_storeStrong((id *)&v19->_topHitCount, a4);
    objc_storeStrong((id *)&v19->_nonTopHitCount, a5);
    objc_storeStrong((id *)&v19->_isResultSelected, a6);
    objc_storeStrong((id *)&v19->_nonTopHitRawCount, a7);
    objc_storeStrong((id *)&v19->_attachmentHitCount, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)@"SearchBufferArrayData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v25[6] = *MEMORY[0x1E4F143B8];
  v24[0] = @"searchStringLength";
  id v23 = [(ICASSearchBufferArrayData *)self searchStringLength];
  if (v23)
  {
    uint64_t v3 = [(ICASSearchBufferArrayData *)self searchStringLength];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"topHitCount";
  uint64_t v20 = [(ICASSearchBufferArrayData *)self topHitCount];
  if (v20)
  {
    uint64_t v4 = [(ICASSearchBufferArrayData *)self topHitCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = @"nonTopHitCount";
  v6 = [(ICASSearchBufferArrayData *)self nonTopHitCount];
  if (v6)
  {
    uint64_t v7 = [(ICASSearchBufferArrayData *)self nonTopHitCount];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = @"isResultSelected";
  v9 = [(ICASSearchBufferArrayData *)self isResultSelected];
  if (v9)
  {
    uint64_t v10 = [(ICASSearchBufferArrayData *)self isResultSelected];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = @"nonTopHitRawCount";
  v12 = [(ICASSearchBufferArrayData *)self nonTopHitRawCount];
  if (v12)
  {
    uint64_t v13 = [(ICASSearchBufferArrayData *)self nonTopHitRawCount];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = @"attachmentHitCount";
  id v15 = [(ICASSearchBufferArrayData *)self attachmentHitCount];
  if (v15)
  {
    uint64_t v16 = [(ICASSearchBufferArrayData *)self attachmentHitCount];
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

- (NSNumber)searchStringLength
{
  return self->_searchStringLength;
}

- (NSNumber)topHitCount
{
  return self->_topHitCount;
}

- (NSNumber)nonTopHitCount
{
  return self->_nonTopHitCount;
}

- (NSNumber)isResultSelected
{
  return self->_isResultSelected;
}

- (NSNumber)nonTopHitRawCount
{
  return self->_nonTopHitRawCount;
}

- (NSNumber)attachmentHitCount
{
  return self->_attachmentHitCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentHitCount, 0);
  objc_storeStrong((id *)&self->_nonTopHitRawCount, 0);
  objc_storeStrong((id *)&self->_isResultSelected, 0);
  objc_storeStrong((id *)&self->_nonTopHitCount, 0);
  objc_storeStrong((id *)&self->_topHitCount, 0);
  objc_storeStrong((id *)&self->_searchStringLength, 0);
}

@end