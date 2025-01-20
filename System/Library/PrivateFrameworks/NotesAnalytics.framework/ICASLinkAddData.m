@interface ICASLinkAddData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASLinkAddApproach)linkAddApproach;
- (ICASLinkAddData)initWithLinkAddApproach:(id)a3 linkContentType:(id)a4 isTokenizedLink:(id)a5;
- (ICASLinkContentType)linkContentType;
- (NSNumber)isTokenizedLink;
- (id)toDict;
@end

@implementation ICASLinkAddData

- (ICASLinkAddData)initWithLinkAddApproach:(id)a3 linkContentType:(id)a4 isTokenizedLink:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASLinkAddData;
  v12 = [(ICASLinkAddData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_linkAddApproach, a3);
    objc_storeStrong((id *)&v13->_linkContentType, a4);
    objc_storeStrong((id *)&v13->_isTokenizedLink, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"LinkAddData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"linkAddApproach";
  v3 = [(ICASLinkAddData *)self linkAddApproach];
  if (v3)
  {
    uint64_t v4 = [(ICASLinkAddData *)self linkAddApproach];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"linkContentType";
  v6 = [(ICASLinkAddData *)self linkContentType];
  if (v6)
  {
    uint64_t v7 = [(ICASLinkAddData *)self linkContentType];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"isTokenizedLink";
  id v9 = [(ICASLinkAddData *)self isTokenizedLink];
  if (v9)
  {
    uint64_t v10 = [(ICASLinkAddData *)self isTokenizedLink];
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

- (ICASLinkAddApproach)linkAddApproach
{
  return self->_linkAddApproach;
}

- (ICASLinkContentType)linkContentType
{
  return self->_linkContentType;
}

- (NSNumber)isTokenizedLink
{
  return self->_isTokenizedLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isTokenizedLink, 0);
  objc_storeStrong((id *)&self->_linkContentType, 0);
  objc_storeStrong((id *)&self->_linkAddApproach, 0);
}

@end