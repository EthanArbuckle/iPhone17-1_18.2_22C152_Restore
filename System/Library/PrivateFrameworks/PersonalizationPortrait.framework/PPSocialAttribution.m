@interface PPSocialAttribution
+ (BOOL)supportsSecureCoding;
- (BOOL)isFromMe;
- (BOOL)isStarred;
- (NSArray)relatedPeople;
- (NSData)collaborationMetadata;
- (NSDate)timestamp;
- (NSString)conversationIdentifier;
- (NSString)groupDisplayName;
- (NSString)groupId;
- (NSString)identifier;
- (NSString)sourceAppDisplayName;
- (NSURL)groupPhotoPath;
- (PPSocialAttribution)initWithCoder:(id)a3;
- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 groupId:(id)a8 relatedPeople:(id)a9 sender:(id)a10 timestamp:(id)a11 collaborationMetadata:(id)a12 starred:(BOOL)a13 fromMe:(BOOL)a14;
- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10;
- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 collaborationMetadata:(id)a11 starred:(BOOL)a12 fromMe:(BOOL)a13;
- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 starred:(BOOL)a11;
- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 starred:(BOOL)a11 fromMe:(BOOL)a12;
- (PPSocialPerson)sender;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSocialAttribution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_relatedPeople, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
  objc_storeStrong((id *)&self->_groupPhotoPath, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (BOOL)isStarred
{
  return self->_starred;
}

- (NSData)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (PPSocialPerson)sender
{
  return self->_sender;
}

- (NSArray)relatedPeople
{
  return self->_relatedPeople;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)groupDisplayName
{
  return self->_groupDisplayName;
}

- (NSURL)groupPhotoPath
{
  return self->_groupPhotoPath;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)sourceAppDisplayName
{
  return self->_sourceAppDisplayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PPSocialAttribution)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v5 = objc_opt_class();
  v6 = pp_social_highlights_log_handle();
  uint64_t v52 = [v4 robustDecodeObjectOfClass:v5 forKey:@"id" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v6];

  v7 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v8 = objc_opt_class();
  v9 = pp_social_highlights_log_handle();
  v56 = [v7 robustDecodeObjectOfClass:v8 forKey:@"sa" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v9];

  v10 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v11 = objc_opt_class();
  v12 = pp_social_highlights_log_handle();
  v55 = [v10 robustDecodeObjectOfClass:v11 forKey:@"ci" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v12];

  v13 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v14 = objc_opt_class();
  v15 = pp_social_highlights_log_handle();
  v54 = [v13 robustDecodeObjectOfClass:v14 forKey:@"gp" withCoder:v3 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v15];

  v16 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v17 = objc_opt_class();
  v18 = pp_social_highlights_log_handle();
  v53 = [v16 robustDecodeObjectOfClass:v17 forKey:@"gd" withCoder:v3 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v18];

  v19 = (void *)MEMORY[0x1E4F93B90];
  v20 = (void *)MEMORY[0x192F97350]();
  id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
  v24 = pp_social_highlights_log_handle();
  v25 = [v19 robustDecodeObjectOfClasses:v23 forKey:@"rp" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v24];

  v26 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v27 = objc_opt_class();
  v28 = pp_social_highlights_log_handle();
  v29 = [v26 robustDecodeObjectOfClass:v27 forKey:@"se" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v28];

  v30 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v31 = objc_opt_class();
  v32 = pp_social_highlights_log_handle();
  v33 = [v30 robustDecodeObjectOfClass:v31 forKey:@"ts" withCoder:v3 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v32];

  v34 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v35 = objc_opt_class();
  v36 = pp_social_highlights_log_handle();
  v37 = [v34 robustDecodeObjectOfClass:v35 forKey:@"cmd" withCoder:v3 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v36];

  v38 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v39 = objc_opt_class();
  v40 = pp_social_highlights_log_handle();
  v41 = [v38 robustDecodeObjectOfClass:v39 forKey:@"gid" withCoder:v3 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v40];

  char v42 = [v3 decodeBoolForKey:@"st"];
  char v43 = [v3 decodeBoolForKey:@"fm"];
  v44 = [v3 error];

  v45 = 0;
  if (v44)
  {
    v46 = self;
    v47 = (void *)v52;
  }
  else
  {
    v47 = (void *)v52;
    if (v52 && v56 && v55 && v25 && v29 && v33)
    {
      if (v54 && v53
        || ([v3 error], v48 = objc_claimAutoreleasedReturnValue(), v48, !v48))
      {
        BYTE1(v50) = v43;
        LOBYTE(v50) = v42;
        v46 = -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", v52, v56, v55, v54, v53, v41, v25, v29, v33, v37, v50);
        v45 = v46;
        goto LABEL_15;
      }
      v45 = 0;
    }
    v46 = self;
  }
LABEL_15:

  return v45;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"id"];
  [v5 encodeObject:self->_sourceAppDisplayName forKey:@"sa"];
  [v5 encodeObject:self->_conversationIdentifier forKey:@"ci"];
  [v5 encodeObject:self->_groupPhotoPath forKey:@"gp"];
  [v5 encodeObject:self->_groupDisplayName forKey:@"gd"];
  [v5 encodeObject:self->_relatedPeople forKey:@"rp"];
  [v5 encodeObject:self->_sender forKey:@"se"];
  [v5 encodeObject:self->_timestamp forKey:@"ts"];
  [v5 encodeObject:self->_collaborationMetadata forKey:@"cmd"];
  [v5 encodeBool:self->_starred forKey:@"st"];
  [v5 encodeBool:self->_fromMe forKey:@"fm"];
  [v5 encodeObject:self->_groupId forKey:@"gid"];
}

- (id)description
{
  id v16 = [NSString alloc];
  v15 = [(PPSocialAttribution *)self identifier];
  uint64_t v14 = [(PPSocialAttribution *)self sourceAppDisplayName];
  id v3 = [(PPSocialAttribution *)self conversationIdentifier];
  v4 = [(PPSocialAttribution *)self groupPhotoPath];
  id v5 = [(PPSocialAttribution *)self groupDisplayName];
  v6 = [(PPSocialAttribution *)self relatedPeople];
  v7 = [(PPSocialAttribution *)self sender];
  uint64_t v8 = [(PPSocialAttribution *)self timestamp];
  v9 = @"YES";
  if ([(PPSocialAttribution *)self isStarred]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if (![(PPSocialAttribution *)self isFromMe]) {
    v9 = @"NO";
  }
  uint64_t v11 = [(PPSocialAttribution *)self groupId];
  v12 = (void *)[v16 initWithFormat:@"<PPSocialAttribution id:'%@' sa:'%@' ci:'%@' gp:'%@' gd:'%@' rp:'%@' se:'%@' ts:'%@' st:'%@' fm:'%@' gid:'%@'>", v15, v14, v3, v4, v5, v6, v7, v8, v10, v9, v11];

  return v12;
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 groupId:(id)a8 relatedPeople:(id)a9 sender:(id)a10 timestamp:(id)a11 collaborationMetadata:(id)a12 starred:(BOOL)a13 fromMe:(BOOL)a14
{
  id v36 = a3;
  id obj = a4;
  id v35 = a4;
  id v28 = a5;
  id v34 = a5;
  id v29 = a6;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v37.receiver = self;
  v37.super_class = (Class)PPSocialAttribution;
  v24 = [(PPSocialAttribution *)&v37 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_identifier, a3);
    objc_storeStrong((id *)&v25->_sourceAppDisplayName, obj);
    objc_storeStrong((id *)&v25->_conversationIdentifier, v28);
    objc_storeStrong((id *)&v25->_groupPhotoPath, v29);
    objc_storeStrong((id *)&v25->_groupDisplayName, a7);
    objc_storeStrong((id *)&v25->_groupId, a8);
    objc_storeStrong((id *)&v25->_relatedPeople, a9);
    objc_storeStrong((id *)&v25->_sender, a10);
    objc_storeStrong((id *)&v25->_timestamp, a11);
    objc_storeStrong((id *)&v25->_collaborationMetadata, a12);
    v25->_starred = a13;
    v25->_fromMe = a14;
  }

  return v25;
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 collaborationMetadata:(id)a11 starred:(BOOL)a12 fromMe:(BOOL)a13
{
  LOWORD(v14) = __PAIR16__(a13, a12);
  return -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:groupId:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", a3, a4, a5, a6, a7, 0, a8, a9, a10, a11, v14);
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 starred:(BOOL)a11 fromMe:(BOOL)a12
{
  LOWORD(v13) = __PAIR16__(a12, a11);
  return -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v13);
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10 starred:(BOOL)a11
{
  LOWORD(v12) = a11;
  return -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v12);
}

- (PPSocialAttribution)initWithIdentifier:(id)a3 sourceAppDisplayName:(id)a4 conversationIdentifier:(id)a5 groupPhotoPath:(id)a6 groupDisplayName:(id)a7 relatedPeople:(id)a8 sender:(id)a9 timestamp:(id)a10
{
  LOWORD(v11) = 0;
  return -[PPSocialAttribution initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:](self, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end