@interface _PSAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)peopleInPhoto;
- (NSArray)photoLocalIdentifiers;
- (NSArray)photoSceneDescriptors;
- (NSArray)suggestedContactIdentifiers;
- (NSData)contentURLSandboxExtension;
- (NSData)imageData;
- (NSDate)creationDate;
- (NSString)UTI;
- (NSString)contentText;
- (NSString)photoLocalIdentifier;
- (NSURL)contentURL;
- (NSUUID)cloudIdentifier;
- (NSUUID)identifier;
- (_PSAttachment)initWithCoder:(id)a3;
- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9;
- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10;
- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10 photoLocalIdentifiers:(id)a11 suggestedContactIdentifiers:(id)a12;
- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10 photoLocalIdentifiers:(id)a11 suggestedContactIdentifiers:(id)a12 photoSceneDescriptors:(id)a13 peopleInPhoto:(id)a14;
- (id)description;
- (unint64_t)hash;
- (unint64_t)totalHashOfElementsFromArray:(id)a3;
- (unsigned)photoAnalysisRequestType;
- (void)encodeWithCoder:(id)a3;
- (void)setContentText:(id)a3;
- (void)setContentURLSandboxExtension:(id)a3;
- (void)setPeopleInPhoto:(id)a3;
- (void)setPhotoSceneDescriptors:(id)a3;
@end

@implementation _PSAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9
{
  return [(_PSAttachment *)self initWithCreationDate:a3 UTI:a4 photoLocalIdentifier:a5 identifier:a6 cloudIdentifier:a7 contentURL:a8 contentText:a9 imageData:0];
}

- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10
{
  return [(_PSAttachment *)self initWithCreationDate:a3 UTI:a4 photoLocalIdentifier:a5 identifier:a6 cloudIdentifier:a7 contentURL:a8 contentText:a9 imageData:a10 photoLocalIdentifiers:0 suggestedContactIdentifiers:0];
}

- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10 photoLocalIdentifiers:(id)a11 suggestedContactIdentifiers:(id)a12
{
  return [(_PSAttachment *)self initWithCreationDate:a3 UTI:a4 photoLocalIdentifier:a5 identifier:a6 cloudIdentifier:a7 contentURL:a8 contentText:a9 imageData:a10 photoLocalIdentifiers:0 suggestedContactIdentifiers:0 photoSceneDescriptors:0 peopleInPhoto:0];
}

- (_PSAttachment)initWithCreationDate:(id)a3 UTI:(id)a4 photoLocalIdentifier:(id)a5 identifier:(id)a6 cloudIdentifier:(id)a7 contentURL:(id)a8 contentText:(id)a9 imageData:(id)a10 photoLocalIdentifiers:(id)a11 suggestedContactIdentifiers:(id)a12 photoSceneDescriptors:(id)a13 peopleInPhoto:(id)a14
{
  id v46 = a3;
  id v45 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a13;
  id v27 = a14;
  v47.receiver = self;
  v47.super_class = (Class)_PSAttachment;
  v28 = [(_PSAttachment *)&v47 init];
  if (v28)
  {
    uint64_t v29 = [v46 copy];
    creationDate = v28->_creationDate;
    v28->_creationDate = (NSDate *)v29;

    uint64_t v31 = [v45 copy];
    UTI = v28->_UTI;
    v28->_UTI = (NSString *)v31;

    uint64_t v33 = [v19 copy];
    photoLocalIdentifier = v28->_photoLocalIdentifier;
    v28->_photoLocalIdentifier = (NSString *)v33;

    uint64_t v35 = [v20 copy];
    identifier = v28->_identifier;
    v28->_identifier = (NSUUID *)v35;

    uint64_t v37 = [v21 copy];
    cloudIdentifier = v28->_cloudIdentifier;
    v28->_cloudIdentifier = (NSUUID *)v37;

    uint64_t v39 = [v22 copy];
    contentURL = v28->_contentURL;
    v28->_contentURL = (NSURL *)v39;

    uint64_t v41 = [v23 copy];
    contentText = v28->_contentText;
    v28->_contentText = (NSString *)v41;

    objc_storeStrong((id *)&v28->_imageData, a10);
    objc_storeStrong((id *)&v28->_photoLocalIdentifiers, a11);
    objc_storeStrong((id *)&v28->_photoSceneDescriptors, a13);
    objc_storeStrong((id *)&v28->_peopleInPhoto, a14);
  }

  return v28;
}

- (_PSAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)_PSAttachment;
  v5 = [(_PSAttachment *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UTI"];
    UTI = v5->_UTI;
    v5->_UTI = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoLocalIdentifier"];
    photoLocalIdentifier = v5->_photoLocalIdentifier;
    v5->_photoLocalIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudIdentifier"];
    cloudIdentifier = v5->_cloudIdentifier;
    v5->_cloudIdentifier = (NSUUID *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentURL"];
    contentURL = v5->_contentURL;
    v5->_contentURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentText"];
    contentText = v5->_contentText;
    v5->_contentText = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v20;

    id v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    id v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"photoLocalIdentifiers"];
    photoLocalIdentifiers = v5->_photoLocalIdentifiers;
    v5->_photoLocalIdentifiers = (NSArray *)v25;

    id v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"photoSceneDescriptors"];
    photoSceneDescriptors = v5->_photoSceneDescriptors;
    v5->_photoSceneDescriptors = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"peopleInPhoto"];
    peopleInPhoto = v5->_peopleInPhoto;
    v5->_peopleInPhoto = (NSArray *)v35;

    uint64_t v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"contentURLSandboxExtension"];
    contentURLSandboxExtension = v5->_contentURLSandboxExtension;
    v5->_contentURLSandboxExtension = (NSData *)v38;

    v40 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  creationDate = self->_creationDate;
  id v5 = a3;
  [v5 encodeObject:creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_UTI forKey:@"UTI"];
  [v5 encodeObject:self->_photoLocalIdentifier forKey:@"photoLocalIdentifier"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_cloudIdentifier forKey:@"cloudIdentifier"];
  [v5 encodeObject:self->_contentURL forKey:@"contentURL"];
  [v5 encodeObject:self->_contentText forKey:@"contentText"];
  [v5 encodeObject:self->_imageData forKey:@"imageData"];
  [v5 encodeObject:self->_photoLocalIdentifiers forKey:@"photoLocalIdentifiers"];
  [v5 encodeObject:self->_photoSceneDescriptors forKey:@"photoSceneDescriptors"];
  [v5 encodeObject:self->_peopleInPhoto forKey:@"peopleInPhoto"];
  [v5 encodeObject:self->_contentURLSandboxExtension forKey:@"contentURLSandboxExtension"];
}

- (id)description
{
  uint64_t v18 = NSString;
  uint64_t v17 = objc_opt_class();
  v3 = [(_PSAttachment *)self creationDate];
  id v4 = [(_PSAttachment *)self UTI];
  id v19 = [(_PSAttachment *)self photoLocalIdentifier];
  id v5 = [(_PSAttachment *)self contentURL];
  if (v5)
  {
    uint64_t v6 = NSNumber;
    uint64_t v16 = [(_PSAttachment *)self contentURL];
    v15 = [v16 absoluteString];
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = @"null";
  }
  uint64_t v8 = [(_PSAttachment *)self contentText];
  v9 = [(_PSAttachment *)self photoLocalIdentifiers];
  uint64_t v10 = [v9 count];
  v11 = [(_PSAttachment *)self photoSceneDescriptors];
  uint64_t v12 = [(_PSAttachment *)self peopleInPhoto];
  v13 = [v18 stringWithFormat:@"<%@ %p> creationDate: %@, UTI: %@, photoIdentifier: %@, contentURL: %@, contentText: %@ photoLocalIds: %lu, photoSceneDescriptors: %@, peopleInPhoto: %@", v17, self, v3, v4, v19, v7, v8, v10, v11, v12];

  if (v5)
  {
  }

  return v13;
}

- (NSArray)suggestedContactIdentifiers
{
  return 0;
}

- (unint64_t)totalHashOfElementsFromArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3
    && (long long v13 = 0u,
        long long v14 = 0u,
        long long v11 = 0u,
        long long v12 = 0u,
        (uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16]) != 0))
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 ^= [*(id *)(*((void *)&v11 + 1) + 8 * i) hash];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_UTI hash];
  NSUInteger v4 = [(NSString *)self->_photoLocalIdentifier hash] ^ v3;
  uint64_t v5 = [(NSUUID *)self->_identifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSUUID *)self->_cloudIdentifier hash];
  uint64_t v7 = [(NSURL *)self->_contentURL hash];
  uint64_t v8 = [(_PSAttachment *)self photoLocalIdentifiers];
  unint64_t v9 = v7 ^ [(_PSAttachment *)self totalHashOfElementsFromArray:v8];

  uint64_t v10 = [(_PSAttachment *)self photoSceneDescriptors];
  unint64_t v11 = v6 ^ v9 ^ [(_PSAttachment *)self totalHashOfElementsFromArray:v10];

  long long v12 = [(_PSAttachment *)self peopleInPhoto];
  unint64_t v13 = v11 ^ [(_PSAttachment *)self totalHashOfElementsFromArray:v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (_PSAttachment *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v58 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(_PSAttachment *)self UTI];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      unint64_t v9 = [(_PSAttachment *)v6 UTI];

      if (v9)
      {
        uint64_t v10 = [(_PSAttachment *)self UTI];
        unint64_t v11 = [(_PSAttachment *)v6 UTI];
        int v12 = [v10 isEqualToString:v11];

        if (!v12) {
          goto LABEL_27;
        }
      }
    }
    uint64_t v13 = [(_PSAttachment *)self photoLocalIdentifier];
    if (v13)
    {
      long long v14 = (void *)v13;
      v15 = [(_PSAttachment *)v6 photoLocalIdentifier];

      if (v15)
      {
        uint64_t v16 = [(_PSAttachment *)self photoLocalIdentifier];
        uint64_t v17 = [(_PSAttachment *)v6 photoLocalIdentifier];
        int v18 = [v16 isEqualToString:v17];

        if (!v18) {
          goto LABEL_27;
        }
      }
    }
    uint64_t v19 = [(_PSAttachment *)self cloudIdentifier];
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      id v21 = [(_PSAttachment *)v6 cloudIdentifier];

      if (v21)
      {
        id v22 = [(_PSAttachment *)self cloudIdentifier];
        uint64_t v23 = [(_PSAttachment *)v6 cloudIdentifier];
        int v24 = [v22 isEqual:v23];

        if (!v24) {
          goto LABEL_27;
        }
      }
    }
    uint64_t v25 = [(_PSAttachment *)self identifier];
    if (v25)
    {
      id v26 = (void *)v25;
      id v27 = [(_PSAttachment *)v6 identifier];

      if (v27)
      {
        uint64_t v28 = [(_PSAttachment *)self identifier];
        uint64_t v29 = [(_PSAttachment *)v6 identifier];
        int v30 = [v28 isEqual:v29];

        if (!v30) {
          goto LABEL_27;
        }
      }
    }
    uint64_t v31 = [(_PSAttachment *)self contentURL];
    if (!v31) {
      goto LABEL_19;
    }
    v32 = (void *)v31;
    uint64_t v33 = [(_PSAttachment *)v6 contentURL];

    if (!v33) {
      goto LABEL_19;
    }
    v34 = [(_PSAttachment *)self contentURL];
    uint64_t v35 = [(_PSAttachment *)v6 contentURL];
    int v36 = [v34 isEqual:v35];

    if (!v36)
    {
LABEL_27:
      char v58 = 0;
    }
    else
    {
LABEL_19:
      id v37 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v38 = [(_PSAttachment *)self photoLocalIdentifiers];
      uint64_t v39 = (void *)[v37 initWithArray:v38];

      id v40 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v41 = [(_PSAttachment *)v6 photoLocalIdentifiers];
      objc_super v42 = (void *)[v40 initWithArray:v41];

      uint64_t v43 = [v39 count];
      if (v43 == [v42 count] && objc_msgSend(v39, "isEqualToSet:", v42))
      {
        id v44 = objc_alloc(MEMORY[0x1E4F1CA80]);
        id v45 = [(_PSAttachment *)self photoSceneDescriptors];
        id v46 = (void *)[v44 initWithArray:v45];

        id v47 = objc_alloc(MEMORY[0x1E4F1CA80]);
        v48 = [(_PSAttachment *)v6 photoSceneDescriptors];
        v49 = (void *)[v47 initWithArray:v48];

        uint64_t v50 = [v46 count];
        if (v50 == [v49 count] && objc_msgSend(v46, "isEqualToSet:", v49))
        {
          id v51 = objc_alloc(MEMORY[0x1E4F1CA80]);
          v52 = [(_PSAttachment *)self peopleInPhoto];
          v53 = (void *)[v51 initWithArray:v52];

          id v54 = objc_alloc(MEMORY[0x1E4F1CA80]);
          v55 = [(_PSAttachment *)v6 peopleInPhoto];
          v56 = (void *)[v54 initWithArray:v55];

          uint64_t v57 = [v53 count];
          if (v57 == [v56 count]) {
            char v58 = [v53 isEqualToSet:v56];
          }
          else {
            char v58 = 0;
          }
        }
        else
        {
          char v58 = 0;
        }
      }
      else
      {
        char v58 = 0;
      }
    }
  }
  else
  {
    char v58 = 0;
  }

  return v58;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)UTI
{
  return self->_UTI;
}

- (NSString)photoLocalIdentifier
{
  return self->_photoLocalIdentifier;
}

- (NSArray)photoLocalIdentifiers
{
  return self->_photoLocalIdentifiers;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSString)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
}

- (NSArray)photoSceneDescriptors
{
  return self->_photoSceneDescriptors;
}

- (void)setPhotoSceneDescriptors:(id)a3
{
}

- (NSArray)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (void)setPeopleInPhoto:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSData)contentURLSandboxExtension
{
  return self->_contentURLSandboxExtension;
}

- (void)setContentURLSandboxExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentURLSandboxExtension, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_photoSceneDescriptors, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_photoLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_photoLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_UTI, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (unsigned)photoAnalysisRequestType
{
  NSUInteger v3 = [(_PSAttachment *)self contentURL];
  if ([v3 isFileURL])
  {
    NSUInteger v4 = [(_PSAttachment *)self contentURLSandboxExtension];

    if (v4) {
      return 1;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_PSAttachment *)self photoLocalIdentifier];
  BOOL v7 = v6 != 0;

  return 2 * v7;
}

@end