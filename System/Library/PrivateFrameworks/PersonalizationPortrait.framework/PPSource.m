@interface PPSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSource:(id)a3;
- (NSArray)contactHandles;
- (NSDate)date;
- (NSDate)relevanceDate;
- (NSSet)featureNames;
- (NSString)bundleId;
- (NSString)documentId;
- (NSString)groupId;
- (NSString)language;
- (PPSource)initWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 date:(id)a6;
- (PPSource)initWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 date:(id)a6 relevanceDate:(id)a7 contactHandles:(id)a8 language:(id)a9 metadata:(id)a10;
- (PPSource)initWithCoder:(id)a3;
- (PPSourceMetadata)metadata;
- (id)description;
- (id)featureValueForName:(id)a3;
- (id)sha256;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_documentId, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_relevanceDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (NSString)language
{
  return self->_language;
}

- (NSDate)relevanceDate
{
  return self->_relevanceDate;
}

- (PPSourceMetadata)metadata
{
  return self->_metadata;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)documentId
{
  return self->_documentId;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"bundleId"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    bundleId = self->_bundleId;
LABEL_7:
    uint64_t v7 = [v5 featureValueWithString:bundleId];
LABEL_8:
    v8 = (void *)v7;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"groupId"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    bundleId = self->_groupId;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"documentId"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    bundleId = self->_documentId;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"date"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    date = self->_date;
LABEL_16:
    [(NSDate *)date timeIntervalSince1970];
    v12 = v10;
LABEL_17:
    uint64_t v7 = objc_msgSend(v12, "featureValueWithDouble:");
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"relevanceDate"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    date = self->_relevanceDate;
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"contactHandles"])
  {
    v13 = (void *)MEMORY[0x1E4F1E950];
    v14 = [MEMORY[0x1E4F1E9F0] sequenceWithStringArray:self->_contactHandles];
    v8 = [v13 featureValueWithSequence:v14];
  }
  else
  {
    if ([v4 isEqualToString:@"language"])
    {
      v5 = (void *)MEMORY[0x1E4F1E950];
      bundleId = self->_language;
      goto LABEL_7;
    }
    if ([v4 hasPrefix:@"meta_"])
    {
      metadata = self->_metadata;
      if (!metadata)
      {
        v12 = (void *)MEMORY[0x1E4F1E950];
        goto LABEL_17;
      }
      v16 = [v4 substringFromIndex:objc_msgSend(@"meta_", "length")];
      v8 = [(PPSourceMetadata *)metadata featureValueForName:v16];
    }
    else
    {
      v8 = 0;
    }
  }
LABEL_9:

  return v8;
}

- (NSSet)featureNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__PPSource_featureNames__block_invoke;
  block[3] = &unk_1E550F7E0;
  block[4] = self;
  if (featureNames__pasOnceToken12 != -1) {
    dispatch_once(&featureNames__pasOnceToken12, block);
  }
  return (NSSet *)(id)featureNames__pasExprOnceResult_4156;
}

void __24__PPSource_featureNames__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192F97350]();
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) featureNames];
  id v4 = [v3 allObjects];

  v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_4157);

  v6 = (void *)MEMORY[0x192F97350]();
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"bundleId", @"groupId", @"documentId", @"date", @"relevanceDate", @"contactHandles", @"language", 0);
  uint64_t v8 = [v7 setByAddingObjectsFromArray:v5];

  v9 = (void *)featureNames__pasExprOnceResult_4156;
  featureNames__pasExprOnceResult_4156 = v8;
}

uint64_t __24__PPSource_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [@"meta_" stringByAppendingString:a2];
}

- (id)sha256
{
  v3 = (void *)MEMORY[0x192F97350](self, a2);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x8810000000;
  v14 = "";
  memset(&v15, 0, sizeof(v15));
  CC_SHA256_Init(&v15);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __18__PPSource_sha256__block_invoke;
  v10[3] = &unk_1E550E798;
  v10[4] = &v11;
  id v4 = (void (**)(void, void))MEMORY[0x192F975A0](v10);
  ((void (**)(void, NSString *))v4)[2](v4, self->_bundleId);
  ((void (**)(void, NSString *))v4)[2](v4, self->_groupId);
  ((void (**)(void, NSString *))v4)[2](v4, self->_documentId);
  [(NSDate *)self->_date timeIntervalSince1970];
  if (v5 < 0.0) {
    double v5 = 0.0;
  }
  unsigned int data = fmin(v5, 4294967300.0);
  CC_SHA256_Update((CC_SHA256_CTX *)(v12 + 4), &data, 4u);
  id v6 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  uint64_t v7 = (unsigned __int8 *)[v6 mutableBytes];
  CC_SHA256_Final(v7, (CC_SHA256_CTX *)(v12 + 4));

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __18__PPSource_sha256__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x192F97350]();
    double v5 = [v3 dataUsingEncoding:4];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = (CC_SHA256_CTX *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
      id v8 = v5;
      CC_SHA256_Update(v7, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
    }
    else
    {
      v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_DEFAULT, "Unable to hash bad string ivar on PPSource", v10, 2u);
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPSource *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PPSource *)self isEqualToSource:v4];
  }

  return v5;
}

- (BOOL)isEqualToSource:(id)a3
{
  id v4 = (PPSource *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else if (v4)
  {
    id v6 = self->_bundleId;
    unint64_t v7 = (unint64_t)p_isa[5];
    if (!((unint64_t)v6 | v7)) {
      goto LABEL_46;
    }
    id v8 = (void *)v7;
    LOBYTE(v9) = 0;
    if (!v6 || !v7) {
      goto LABEL_42;
    }
    int v9 = [(NSDate *)v6 isEqualToString:v7];

    if (v9)
    {
LABEL_46:
      id v6 = self->_groupId;
      unint64_t v10 = (unint64_t)p_isa[6];
      if (!((unint64_t)v6 | v10)) {
        goto LABEL_11;
      }
      id v8 = (void *)v10;
      LOBYTE(v9) = 0;
      if (!v6 || !v10) {
        goto LABEL_42;
      }
      int v9 = [(NSDate *)v6 isEqualToString:v10];

      if (v9)
      {
LABEL_11:
        id v6 = self->_documentId;
        unint64_t v11 = (unint64_t)p_isa[7];
        if ((unint64_t)v6 | v11)
        {
          id v8 = (void *)v11;
          LOBYTE(v9) = 0;
          if (!v6 || !v11) {
            goto LABEL_42;
          }
          int v9 = [(NSDate *)v6 isEqualToString:v11];

          if (!v9) {
            goto LABEL_43;
          }
        }
        id v6 = self->_date;
        unint64_t v12 = (unint64_t)p_isa[8];
        if (!((unint64_t)v6 | v12)) {
          goto LABEL_16;
        }
        id v8 = (void *)v12;
        LOBYTE(v9) = 0;
        if (!v6 || !v12) {
          goto LABEL_42;
        }
        int v9 = [(NSDate *)v6 isEqualToDate:v12];

        if (v9)
        {
LABEL_16:
          id v6 = self->_relevanceDate;
          unint64_t v13 = (unint64_t)p_isa[2];
          if ((unint64_t)v6 | v13)
          {
            id v8 = (void *)v13;
            LOBYTE(v9) = 0;
            if (!v6 || !v13) {
              goto LABEL_42;
            }
            int v9 = [(NSDate *)v6 isEqualToDate:v13];

            if (!v9) {
              goto LABEL_43;
            }
          }
          id v6 = self->_contactHandles;
          unint64_t v14 = (unint64_t)p_isa[3];
          if ((unint64_t)v6 | v14)
          {
            id v8 = (void *)v14;
            LOBYTE(v9) = 0;
            if (!v6 || !v14) {
              goto LABEL_42;
            }
            int v9 = [(NSDate *)v6 isEqualToArray:v14];

            if (!v9) {
              goto LABEL_43;
            }
          }
          id v6 = self->_language;
          unint64_t v15 = (unint64_t)p_isa[4];
          if (!((unint64_t)v6 | v15))
          {
LABEL_19:
            id v6 = self->_metadata;
            unint64_t v16 = (unint64_t)p_isa[1];
            if ((unint64_t)v6 | v16)
            {
              id v8 = (void *)v16;
              LOBYTE(v9) = 0;
              if (v6 && v16) {
                LOBYTE(v9) = [(NSDate *)v6 isEqualToSourceMetadata:v16];
              }
            }
            else
            {
              id v8 = 0;
              id v6 = 0;
              LOBYTE(v9) = 1;
            }
            goto LABEL_42;
          }
          id v8 = (void *)v15;
          LOBYTE(v9) = 0;
          if (v6 && v15)
          {
            int v9 = [(NSDate *)v6 isEqualToString:v15];

            if (!v9) {
              goto LABEL_43;
            }
            goto LABEL_19;
          }
LABEL_42:
        }
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_43:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_groupId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_documentId hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_date hash];
  uint64_t v7 = [(NSDate *)self->_relevanceDate hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_language hash];
  return v6 ^ v8 ^ [(PPSourceMetadata *)self->_metadata hash];
}

- (void)encodeWithCoder:(id)a3
{
  bundleId = self->_bundleId;
  id v5 = a3;
  [v5 encodeObject:bundleId forKey:@"bid"];
  [v5 encodeObject:self->_groupId forKey:@"gid"];
  [v5 encodeObject:self->_documentId forKey:@"did"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_relevanceDate forKey:@"reld"];
  [v5 encodeObject:self->_contactHandles forKey:@"cnh"];
  [v5 encodeObject:self->_language forKey:@"lan"];
  [v5 encodeObject:self->_metadata forKey:@"met"];
}

- (PPSource)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v3 decodeObjectOfClass:v4 forKey:@"bid"];
  uint64_t v26 = [v3 decodeObjectOfClass:v4 forKey:@"gid"];
  uint64_t v6 = [v3 decodeObjectOfClass:v4 forKey:@"did"];
  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  NSUInteger v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"reld"];
  int v9 = (void *)MEMORY[0x192F97350]();
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  unint64_t v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  unint64_t v13 = [v3 decodeObjectOfClasses:v12 forKey:@"cnh"];

  unint64_t v14 = [v3 decodeObjectOfClass:v4 forKey:@"lan"];
  uint64_t v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"met"];
  v25 = (void *)v5;
  if (v5 && v6 && v7)
  {
    unint64_t v16 = (void *)v15;
    uint64_t v17 = v5;
    v18 = (void *)v26;
    v19 = [(PPSource *)self initWithBundleId:v17 groupId:v26 documentId:v6 date:v7 relevanceDate:v8 contactHandles:v13 language:v14 metadata:v15];
    v20 = v19;
  }
  else
  {
    v23 = (void *)v15;
    v24 = v13;
    v21 = pp_default_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18CAA6000, v21, OS_LOG_TYPE_ERROR, "PPSource:initWithCoder: decoded illegal nil property", buf, 2u);
    }

    v20 = 0;
    v18 = (void *)v26;
    v19 = self;
    unint64_t v13 = v24;
    unint64_t v16 = v23;
  }

  return v20;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(PPSource *)self bundleId];
  uint64_t v5 = [(PPSource *)self groupId];
  uint64_t v6 = [(PPSource *)self documentId];
  uint64_t v7 = [(PPSource *)self date];
  NSUInteger v8 = (void *)[v3 initWithFormat:@"<PPSource bi:%@ gi:%@ di:%@ da:%@>", v4, v5, v6, v7];

  return v8;
}

- (PPSource)initWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 date:(id)a6 relevanceDate:(id)a7 contactHandles:(id)a8 language:(id)a9 metadata:(id)a10
{
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v18 = [(PPSource *)self initWithBundleId:a3 groupId:a4 documentId:a5 date:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_relevanceDate, a7);
    objc_storeStrong((id *)&v19->_language, a9);
    objc_storeStrong((id *)&v19->_metadata, a10);
    objc_storeStrong((id *)&v19->_contactHandles, a8);
  }

  return v19;
}

- (PPSource)initWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 date:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_14:
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PPSource.m", 34, @"Invalid parameter not satisfying: %@", @"documentId" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"PPSource.m", 33, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

  if (!v13) {
    goto LABEL_14;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_15:
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"PPSource.m", 35, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_4:
  [v14 timeIntervalSinceReferenceDate];
  if (fabs(v15) == INFINITY)
  {
    unint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v11;
      _os_log_fault_impl(&dword_18CAA6000, v16, OS_LOG_TYPE_FAULT, "Constructing PPSource with Inf date associated with bundleId: %@", buf, 0xCu);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)PPSource;
  id v17 = [(PPSource *)&v33 init];
  if (v17)
  {
    id v32 = v13;
    id v18 = a6;
    id v19 = v12;
    v20 = PPGetStringInternPool();
    id v21 = v11;
    id v22 = [v20 intern:v11];
    if (!v22)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, v17, @"PPSource.m", 47, @"Invalid parameter not satisfying: %@", @"internedBundleId" object file lineNumber description];
    }
    bundleId = v17->_bundleId;
    v17->_bundleId = v22;
    v24 = v22;

    id v12 = v19;
    uint64_t v25 = [v20 intern:v19];
    groupId = v17->_groupId;
    v17->_groupId = (NSString *)v25;

    objc_storeStrong((id *)&v17->_documentId, a5);
    objc_storeStrong((id *)&v17->_date, v18);

    id v13 = v32;
    id v11 = v21;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end