@interface PPSocialCollaboration
+ (BOOL)supportsSecureCoding;
- (NSData)handleToIdentityMap;
- (NSData)localIdentity;
- (NSData)localIdentityProof;
- (NSData)proofOfInclusionHashes;
- (NSData)proofOfInclusionLocalKeyHash;
- (NSDate)creationDate;
- (NSDictionary)earliestAttributionIdentifiers;
- (NSString)collaborationIdentifier;
- (NSString)contentDisplayName;
- (NSString)contentType;
- (NSString)fileProviderId;
- (PPSocialCollaboration)initWithCoder:(id)a3;
- (PPSocialCollaboration)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 collaborationIdentifier:(id)a8 contentDisplayName:(id)a9 contentCreationDate:(id)a10 contentUTIType:(id)a11 fileProviderId:(id)a12 earliestAttributionIdentifiers:(id)a13 localIdentity:(id)a14 localIdentityProof:(id)a15 handleToIdentityMap:(id)a16;
- (PPSocialCollaboration)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 collaborationIdentifier:(id)a8 contentDisplayName:(id)a9 contentCreationDate:(id)a10 contentUTIType:(id)a11 fileProviderId:(id)a12 earliestAttributionIdentifiers:(id)a13 localIdentity:(id)a14 localIdentityProof:(id)a15 handleToIdentityMap:(id)a16 score:(id)a17;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSocialCollaboration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToIdentityMap, 0);
  objc_storeStrong((id *)&self->_localIdentityProof, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_proofOfInclusionLocalKeyHash, 0);
  objc_storeStrong((id *)&self->_proofOfInclusionHashes, 0);
  objc_storeStrong((id *)&self->_fileProviderId, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentDisplayName, 0);
  objc_storeStrong((id *)&self->_earliestAttributionIdentifiers, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
}

- (NSData)handleToIdentityMap
{
  return self->_handleToIdentityMap;
}

- (NSData)localIdentityProof
{
  return self->_localIdentityProof;
}

- (NSData)localIdentity
{
  return self->_localIdentity;
}

- (NSData)proofOfInclusionLocalKeyHash
{
  return self->_proofOfInclusionLocalKeyHash;
}

- (NSData)proofOfInclusionHashes
{
  return self->_proofOfInclusionHashes;
}

- (NSString)fileProviderId
{
  return self->_fileProviderId;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSString)contentDisplayName
{
  return self->_contentDisplayName;
}

- (NSDictionary)earliestAttributionIdentifiers
{
  return self->_earliestAttributionIdentifiers;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (PPSocialCollaboration)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PPSocialCollaboration;
  v5 = [(PPSocialHighlight *)&v54 initWithCoder:v4];
  v6 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v7 = objc_opt_class();
  v8 = pp_social_highlights_log_handle();
  v51 = [v6 robustDecodeObjectOfClass:v7 forKey:@"cid" withCoder:v4 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v8];

  v9 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v10 = objc_opt_class();
  v11 = pp_social_highlights_log_handle();
  v53 = [v9 robustDecodeObjectOfClass:v10 forKey:@"cdn" withCoder:v4 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v11];

  v12 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v13 = objc_opt_class();
  v14 = pp_social_highlights_log_handle();
  v52 = [v12 robustDecodeObjectOfClass:v13 forKey:@"cd" withCoder:v4 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v14];

  v15 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v16 = objc_opt_class();
  v17 = pp_social_highlights_log_handle();
  v50 = [v15 robustDecodeObjectOfClass:v16 forKey:@"ct" withCoder:v4 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v17];

  v18 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v19 = objc_opt_class();
  v20 = pp_social_highlights_log_handle();
  v49 = [v18 robustDecodeObjectOfClass:v19 forKey:@"fpid" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v20];

  v21 = (void *)MEMORY[0x1E4F93B90];
  v22 = (void *)MEMORY[0x192F97350]();
  id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v24 = objc_opt_class();
  v25 = objc_msgSend(v23, "initWithObjects:", v24, objc_opt_class(), 0);
  v26 = pp_social_highlights_log_handle();
  v48 = [v21 robustDecodeObjectOfClasses:v25 forKey:@"eaid" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v26];

  v27 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v28 = objc_opt_class();
  v29 = pp_social_highlights_log_handle();
  v46 = [v27 robustDecodeObjectOfClass:v28 forKey:@"locid" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v29];

  v30 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v31 = objc_opt_class();
  v32 = pp_social_highlights_log_handle();
  v45 = [v30 robustDecodeObjectOfClass:v31 forKey:@"locidp" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v32];

  v33 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v34 = objc_opt_class();
  v35 = pp_social_highlights_log_handle();
  v44 = [v33 robustDecodeObjectOfClass:v34 forKey:@"hidmap" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v35];

  v36 = v5;
  v43 = [(PPSocialHighlight *)v5 identifier];
  v37 = [(PPSocialHighlight *)v5 resourceURL];
  v38 = [(PPSocialHighlight *)v5 timestamp];
  v39 = [(PPSocialHighlight *)v5 attributionIdentifiers];
  v40 = [(PPSocialHighlight *)v36 supplementaryData];
  v41 = [(PPSocialHighlight *)v36 score];
  v47 = [(PPSocialCollaboration *)v36 initWithIdentifier:v43 resourceURL:v37 timestamp:v38 attributionIdentifiers:v39 supplementaryData:v40 collaborationIdentifier:v51 contentDisplayName:v53 contentCreationDate:v52 contentUTIType:v50 fileProviderId:v49 earliestAttributionIdentifiers:v48 localIdentity:v46 localIdentityProof:v45 handleToIdentityMap:v44 score:v41];

  return v47;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PPSocialCollaboration;
  id v4 = a3;
  [(PPSocialHighlight *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_collaborationIdentifier, @"cid", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_contentDisplayName forKey:@"cdn"];
  [v4 encodeObject:self->_creationDate forKey:@"cd"];
  [v4 encodeObject:self->_contentType forKey:@"ct"];
  [v4 encodeObject:self->_fileProviderId forKey:@"fpid"];
  [v4 encodeObject:self->_earliestAttributionIdentifiers forKey:@"eaid"];
  [v4 encodeObject:self->_localIdentity forKey:@"locid"];
  [v4 encodeObject:self->_localIdentityProof forKey:@"locidp"];
  [v4 encodeObject:self->_handleToIdentityMap forKey:@"hidmap"];
}

- (id)description
{
  id v14 = [NSString alloc];
  v17 = [(PPSocialHighlight *)self identifier];
  uint64_t v16 = [(PPSocialHighlight *)self resourceURL];
  v3 = [(PPSocialHighlight *)self timestamp];
  id v4 = [(PPSocialHighlight *)self attributionIdentifiers];
  objc_super v5 = [(PPSocialHighlight *)self supplementaryData];
  v6 = [(PPSocialHighlight *)self score];
  uint64_t v7 = [(PPSocialCollaboration *)self collaborationIdentifier];
  v8 = [(PPSocialCollaboration *)self contentDisplayName];
  v9 = [(PPSocialCollaboration *)self creationDate];
  uint64_t v10 = [(PPSocialCollaboration *)self contentType];
  v11 = [(PPSocialCollaboration *)self fileProviderId];
  v12 = [(PPSocialCollaboration *)self earliestAttributionIdentifiers];
  id v15 = (id)[v14 initWithFormat:@"<PPSocialCollaboration id:'%@' ru:'%@' ts:'%@' at:'%@' sd:'%@' sc:'%@' cid:'%@' cdn:'%@' cd:'%@' ct:'%@' fpid: '%@' eaid:'%@'>", v17, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v15;
}

- (PPSocialCollaboration)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 collaborationIdentifier:(id)a8 contentDisplayName:(id)a9 contentCreationDate:(id)a10 contentUTIType:(id)a11 fileProviderId:(id)a12 earliestAttributionIdentifiers:(id)a13 localIdentity:(id)a14 localIdentityProof:(id)a15 handleToIdentityMap:(id)a16 score:(id)a17
{
  id v18 = a3;
  id v49 = a8;
  uint64_t v19 = (NSString *)a9;
  v20 = (NSDate *)a10;
  v21 = (NSString *)a11;
  v22 = (NSString *)a12;
  id v23 = (NSDictionary *)a13;
  uint64_t v24 = (NSData *)a14;
  v25 = (NSData *)a15;
  v48 = (NSData *)a16;
  v52.receiver = self;
  v52.super_class = (Class)PPSocialCollaboration;
  v51 = v18;
  v26 = [(PPSocialHighlight *)&v52 initWithIdentifier:v18 resourceURL:a4 timestamp:a5 attributionIdentifiers:a6 supplementaryData:a7 score:a17];
  objc_storeStrong((id *)&v26->_collaborationIdentifier, a8);
  if (!v26->_collaborationIdentifier) {
    objc_storeStrong((id *)&v26->_collaborationIdentifier, a3);
  }
  contentDisplayName = v26->_contentDisplayName;
  v26->_contentDisplayName = v19;
  uint64_t v28 = v19;

  creationDate = v26->_creationDate;
  v26->_creationDate = v20;
  v30 = v20;

  contentType = v26->_contentType;
  v26->_contentType = v21;
  v32 = v21;

  fileProviderId = v26->_fileProviderId;
  v26->_fileProviderId = v22;
  uint64_t v34 = v22;

  earliestAttributionIdentifiers = v26->_earliestAttributionIdentifiers;
  v26->_earliestAttributionIdentifiers = v23;
  v36 = v23;

  localIdentity = v26->_localIdentity;
  v26->_localIdentity = v24;
  v38 = v24;

  localIdentityProof = v26->_localIdentityProof;
  v26->_localIdentityProof = v25;
  v40 = v25;

  handleToIdentityMap = v26->_handleToIdentityMap;
  v26->_handleToIdentityMap = v48;

  return v26;
}

- (PPSocialCollaboration)initWithIdentifier:(id)a3 resourceURL:(id)a4 timestamp:(id)a5 attributionIdentifiers:(id)a6 supplementaryData:(id)a7 collaborationIdentifier:(id)a8 contentDisplayName:(id)a9 contentCreationDate:(id)a10 contentUTIType:(id)a11 fileProviderId:(id)a12 earliestAttributionIdentifiers:(id)a13 localIdentity:(id)a14 localIdentityProof:(id)a15 handleToIdentityMap:(id)a16
{
  return [(PPSocialCollaboration *)self initWithIdentifier:a3 resourceURL:a4 timestamp:a5 attributionIdentifiers:a6 supplementaryData:a7 collaborationIdentifier:a8 contentDisplayName:a9 contentCreationDate:a10 contentUTIType:a11 fileProviderId:a12 earliestAttributionIdentifiers:a13 localIdentity:a14 localIdentityProof:a15 handleToIdentityMap:a16 score:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end