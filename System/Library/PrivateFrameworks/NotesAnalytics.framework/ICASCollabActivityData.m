@interface ICASCollabActivityData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASClickContext)clickContext;
- (ICASCollabActivityContextPath)collabActivityContextPath;
- (ICASCollabActivityData)initWithCollabActivityContextPath:(id)a3 clickContext:(id)a4 mode:(id)a5 isUserMentioned:(id)a6 hasRecentUpdates:(id)a7;
- (ICASMode)mode;
- (NSNumber)hasRecentUpdates;
- (NSNumber)isUserMentioned;
- (id)toDict;
@end

@implementation ICASCollabActivityData

- (ICASCollabActivityData)initWithCollabActivityContextPath:(id)a3 clickContext:(id)a4 mode:(id)a5 isUserMentioned:(id)a6 hasRecentUpdates:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASCollabActivityData;
  v17 = [(ICASCollabActivityData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_collabActivityContextPath, a3);
    objc_storeStrong((id *)&v18->_clickContext, a4);
    objc_storeStrong((id *)&v18->_mode, a5);
    objc_storeStrong((id *)&v18->_isUserMentioned, a6);
    objc_storeStrong((id *)&v18->_hasRecentUpdates, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)@"CollabActivityData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21[0] = @"collabActivityContextPath";
  uint64_t v19 = [(ICASCollabActivityData *)self collabActivityContextPath];
  if (v19)
  {
    uint64_t v3 = [(ICASCollabActivityData *)self collabActivityContextPath];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = @"clickContext";
  v5 = [(ICASCollabActivityData *)self clickContext];
  if (v5)
  {
    uint64_t v6 = [(ICASCollabActivityData *)self clickContext];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = @"mode";
  v8 = [(ICASCollabActivityData *)self mode];
  if (v8)
  {
    uint64_t v9 = [(ICASCollabActivityData *)self mode];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = @"isUserMentioned";
  v11 = [(ICASCollabActivityData *)self isUserMentioned];
  if (v11)
  {
    uint64_t v12 = [(ICASCollabActivityData *)self isUserMentioned];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = @"hasRecentUpdates";
  id v14 = [(ICASCollabActivityData *)self hasRecentUpdates];
  if (v14)
  {
    uint64_t v15 = [(ICASCollabActivityData *)self hasRecentUpdates];
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

- (ICASCollabActivityContextPath)collabActivityContextPath
{
  return self->_collabActivityContextPath;
}

- (ICASClickContext)clickContext
{
  return self->_clickContext;
}

- (ICASMode)mode
{
  return self->_mode;
}

- (NSNumber)isUserMentioned
{
  return self->_isUserMentioned;
}

- (NSNumber)hasRecentUpdates
{
  return self->_hasRecentUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasRecentUpdates, 0);
  objc_storeStrong((id *)&self->_isUserMentioned, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_clickContext, 0);
  objc_storeStrong((id *)&self->_collabActivityContextPath, 0);
}

@end