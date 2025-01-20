@interface SSRVoiceProfileStoreData
+ (BOOL)supportsSecureCoding;
- (NSArray)vpArray;
- (NSDictionary)enrollmentMetaDataDict;
- (NSDictionary)requestIdToAudioIdMap;
- (NSNumber)rpiDataRemovalStatus;
- (NSNumber)version;
- (SSRVoiceProfileStoreData)initWithCoder:(id)a3;
- (SSRVoiceProfileStoreData)initWithVoiceProfileArray:(id)a3 withVersion:(id)a4;
- (SSRVoiceProfileStoreData)initWithVoiceProfileArray:(id)a3 withVersion:(id)a4 enrollmentSamplingMetaDataDict:(id)a5 requestIdAudioIdsMap:(id)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSRVoiceProfileStoreData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdToAudioIdMap, 0);
  objc_storeStrong((id *)&self->_rpiDataRemovalStatus, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_enrollmentMetaDataDict, 0);

  objc_storeStrong((id *)&self->_vpArray, 0);
}

- (NSDictionary)requestIdToAudioIdMap
{
  return self->_requestIdToAudioIdMap;
}

- (NSNumber)rpiDataRemovalStatus
{
  return self->_rpiDataRemovalStatus;
}

- (NSNumber)version
{
  return self->_version;
}

- (NSDictionary)enrollmentMetaDataDict
{
  return self->_enrollmentMetaDataDict;
}

- (NSArray)vpArray
{
  return self->_vpArray;
}

- (void)encodeWithCoder:(id)a3
{
  vpArray = self->_vpArray;
  id v5 = a3;
  [v5 encodeObject:vpArray forKey:@"Known User Voice Profiles"];
  [v5 encodeObject:self->_version forKey:@"Voice Profile Store Version"];
  [v5 encodeObject:self->_rpiDataRemovalStatus forKey:@"RPI Sampling data removal status"];
  [v5 encodeObject:self->_requestIdToAudioIdMap forKey:@"requestId to audioId mapping"];
  [v5 encodeObject:self->_enrollmentMetaDataDict forKey:@"Enrollment Sampling Meta Data"];
}

- (SSRVoiceProfileStoreData)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"Known User Voice Profiles"];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v5 decodeObjectOfClasses:v12 forKey:@"Enrollment Sampling Meta Data"];

  v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"Voice Profile Store Version"];
  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v18 = [v5 decodeObjectOfClasses:v17 forKey:@"requestId to audioId mapping"];

  v19 = [(SSRVoiceProfileStoreData *)self initWithVoiceProfileArray:v9 withVersion:v14 enrollmentSamplingMetaDataDict:v13 requestIdAudioIdsMap:v18];
  return v19;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"version %@ arrayCount %lu metaDataArrayCount: %lu audioRequestsToAudioIdsMap: %@", self->_version, -[NSArray count](self->_vpArray, "count"), -[NSDictionary count](self->_enrollmentMetaDataDict, "count"), self->_requestIdToAudioIdMap];
}

- (SSRVoiceProfileStoreData)initWithVoiceProfileArray:(id)a3 withVersion:(id)a4 enrollmentSamplingMetaDataDict:(id)a5 requestIdAudioIdsMap:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SSRVoiceProfileStoreData;
  v15 = [(SSRVoiceProfileStoreData *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_vpArray, a3);
    objc_storeStrong((id *)&v16->_version, a4);
    objc_storeStrong((id *)&v16->_requestIdToAudioIdMap, a6);
    objc_storeStrong((id *)&v16->_enrollmentMetaDataDict, a5);
  }

  return v16;
}

- (SSRVoiceProfileStoreData)initWithVoiceProfileArray:(id)a3 withVersion:(id)a4
{
  return [(SSRVoiceProfileStoreData *)self initWithVoiceProfileArray:a3 withVersion:a4 enrollmentSamplingMetaDataDict:0 requestIdAudioIdsMap:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end