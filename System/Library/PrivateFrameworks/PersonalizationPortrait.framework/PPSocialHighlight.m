@interface PPSocialHighlight
+ (BOOL)supportsSecureCoding;
- (NSArray)attributionIdentifiers;
- (NSDate)timestamp;
- (NSDictionary)supplementaryData;
- (NSNumber)score;
- (NSString)identifier;
- (NSURL)resourceURL;
- (PPSocialHighlight)initWithCoder:(id)a3;
- (PPSocialHighlight)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7;
- (PPSocialHighlight)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 score:(id)a8;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSocialHighlight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_supplementaryData, 0);
  objc_storeStrong((id *)&self->_attributionIdentifiers, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSNumber)score
{
  return self->_score;
}

- (NSDictionary)supplementaryData
{
  return self->_supplementaryData;
}

- (NSArray)attributionIdentifiers
{
  return self->_attributionIdentifiers;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PPSocialHighlight)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v5 = objc_opt_class();
  v6 = pp_social_highlights_log_handle();
  v38 = [v4 robustDecodeObjectOfClass:v5 forKey:@"id" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v6];

  v7 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v8 = objc_opt_class();
  v9 = pp_social_highlights_log_handle();
  uint64_t v37 = [v7 robustDecodeObjectOfClass:v8 forKey:@"ru" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v9];

  v10 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v11 = objc_opt_class();
  v12 = pp_social_highlights_log_handle();
  v13 = [v10 robustDecodeObjectOfClass:v11 forKey:@"ts" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v12];

  v14 = (void *)MEMORY[0x1E4F93B90];
  v15 = (void *)MEMORY[0x192F97350]();
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  v19 = pp_social_highlights_log_handle();
  v20 = [v14 robustDecodeObjectOfClasses:v18 forKey:@"at" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v19];

  v21 = (void *)MEMORY[0x1E4F93B90];
  v22 = (void *)MEMORY[0x192F97350]();
  id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v23, "initWithObjects:", v24, v25, objc_opt_class(), 0);
  v27 = pp_social_highlights_log_handle();
  v28 = [v21 robustDecodeObjectOfClasses:v26 forKey:@"sd" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v27];

  v29 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v30 = objc_opt_class();
  v31 = pp_social_highlights_log_handle();
  v32 = [v29 robustDecodeObjectOfClass:v30 forKey:@"sc" withCoder:v3 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v31];

  v33 = 0;
  if (v38)
  {
    v34 = self;
    v35 = (void *)v37;
    if (v37 && v13 && v20 && v28)
    {
      v34 = [(PPSocialHighlight *)self initWithIdentifier:v38 resourceURL:v37 timestamp:v13 attributionIdentifiers:v20 supplementaryData:v28 score:v32];
      v33 = v34;
    }
  }
  else
  {
    v34 = self;
    v35 = (void *)v37;
  }

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"id"];
  [v5 encodeObject:self->_resourceURL forKey:@"ru"];
  [v5 encodeObject:self->_timestamp forKey:@"ts"];
  [v5 encodeObject:self->_attributionIdentifiers forKey:@"at"];
  [v5 encodeObject:self->_supplementaryData forKey:@"sd"];
  id v6 = [(PPSocialHighlight *)self score];
  [v5 encodeObject:v6 forKey:@"sc"];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(PPSocialHighlight *)self identifier];
  id v5 = [(PPSocialHighlight *)self resourceURL];
  id v6 = [(PPSocialHighlight *)self timestamp];
  v7 = [(PPSocialHighlight *)self attributionIdentifiers];
  uint64_t v8 = [(PPSocialHighlight *)self supplementaryData];
  v9 = [(PPSocialHighlight *)self score];
  v10 = (void *)[v3 initWithFormat:@"<PPSocialHighlight id:'%@' ru:'%@' ts:'%@' at:'%@' sd:'%@' sc:'%@'>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (PPSocialHighlight)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 score:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PPSocialHighlight;
  v18 = [(PPSocialHighlight *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_resourceURL, a4);
    objc_storeStrong((id *)&v19->_timestamp, a5);
    objc_storeStrong((id *)&v19->_attributionIdentifiers, a6);
    objc_storeStrong((id *)&v19->_supplementaryData, a7);
    objc_storeStrong((id *)&v19->_score, a8);
  }

  return v19;
}

- (PPSocialHighlight)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7
{
  return [(PPSocialHighlight *)self initWithIdentifier:a3 resourceURL:a4 timestamp:a5 attributionIdentifiers:a6 supplementaryData:a7 score:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end