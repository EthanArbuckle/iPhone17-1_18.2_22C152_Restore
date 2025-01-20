@interface ICASMentionAddData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASMentionAddApproach)mentionAddApproach;
- (ICASMentionAddData)initWithIsExistingMention:(id)a3 mentionAddApproach:(id)a4;
- (NSNumber)isExistingMention;
- (id)toDict;
@end

@implementation ICASMentionAddData

- (ICASMentionAddData)initWithIsExistingMention:(id)a3 mentionAddApproach:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASMentionAddData;
  v9 = [(ICASMentionAddData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_isExistingMention, a3);
    objc_storeStrong((id *)&v10->_mentionAddApproach, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"MentionAddData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"isExistingMention";
  v3 = [(ICASMentionAddData *)self isExistingMention];
  if (v3)
  {
    uint64_t v4 = [(ICASMentionAddData *)self isExistingMention];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"mentionAddApproach";
  v12[0] = v4;
  v6 = [(ICASMentionAddData *)self mentionAddApproach];
  if (v6)
  {
    uint64_t v7 = [(ICASMentionAddData *)self mentionAddApproach];
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

- (NSNumber)isExistingMention
{
  return self->_isExistingMention;
}

- (ICASMentionAddApproach)mentionAddApproach
{
  return self->_mentionAddApproach;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionAddApproach, 0);
  objc_storeStrong((id *)&self->_isExistingMention, 0);
}

@end