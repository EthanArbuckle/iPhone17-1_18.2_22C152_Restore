@interface ICASSearchResultCountData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSearchResultCountData)initWithTopHitCount:(id)a3 notesCount:(id)a4 attachmentsCount:(id)a5;
- (NSNumber)attachmentsCount;
- (NSNumber)notesCount;
- (NSNumber)topHitCount;
- (id)toDict;
@end

@implementation ICASSearchResultCountData

- (ICASSearchResultCountData)initWithTopHitCount:(id)a3 notesCount:(id)a4 attachmentsCount:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASSearchResultCountData;
  v12 = [(ICASSearchResultCountData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topHitCount, a3);
    objc_storeStrong((id *)&v13->_notesCount, a4);
    objc_storeStrong((id *)&v13->_attachmentsCount, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"SearchResultCountData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"topHitCount";
  v3 = [(ICASSearchResultCountData *)self topHitCount];
  if (v3)
  {
    uint64_t v4 = [(ICASSearchResultCountData *)self topHitCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"notesCount";
  v6 = [(ICASSearchResultCountData *)self notesCount];
  if (v6)
  {
    uint64_t v7 = [(ICASSearchResultCountData *)self notesCount];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"attachmentsCount";
  id v9 = [(ICASSearchResultCountData *)self attachmentsCount];
  if (v9)
  {
    uint64_t v10 = [(ICASSearchResultCountData *)self attachmentsCount];
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

- (NSNumber)topHitCount
{
  return self->_topHitCount;
}

- (NSNumber)notesCount
{
  return self->_notesCount;
}

- (NSNumber)attachmentsCount
{
  return self->_attachmentsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsCount, 0);
  objc_storeStrong((id *)&self->_notesCount, 0);
  objc_storeStrong((id *)&self->_topHitCount, 0);
}

@end