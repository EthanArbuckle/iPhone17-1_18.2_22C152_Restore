@interface MIAppReferenceMetadata
+ (BOOL)supportsSecureCoding;
+ (id)referenceMetadataFromURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (MIAppReferenceMetadata)init;
- (MIAppReferenceMetadata)initWithCoder:(id)a3;
- (NSArray)personas;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPersonas:(id)a3;
@end

@implementation MIAppReferenceMetadata

- (MIAppReferenceMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)MIAppReferenceMetadata;
  return [(MIAppReferenceMetadata *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIAppReferenceMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIAppReferenceMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"personas"];
    personas = v5->_personas;
    v5->_personas = (NSArray *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MIAppReferenceMetadata *)self personas];
  [v4 encodeObject:v5 forKey:@"personas"];
}

- (unint64_t)hash
{
  v2 = [(MIAppReferenceMetadata *)self personas];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIAppReferenceMetadata *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MIAppReferenceMetadata *)self personas];
      v7 = [(MIAppReferenceMetadata *)v5 personas];

      BOOL v8 = sub_100015338(v6, v7);
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v7 encodeObject:self forKey:NSKeyedArchiveRootObjectKey];
  BOOL v8 = [v7 encodedData];

  id v17 = 0;
  unsigned __int8 v9 = [v8 writeToURL:v6 options:268435457 error:&v17];
  id v10 = v17;
  if (v9)
  {
    BOOL v11 = 1;
  }
  else
  {
    v12 = (void *)MIInstallerErrorDomain;
    v13 = [v6 path];
    v15 = sub_100014A08((uint64_t)"-[MIAppReferenceMetadata serializeToURL:error:]", 96, v12, 4, v10, 0, @"Failed to write serialized MIAppReferences to %@", v14, (uint64_t)v13);

    id v10 = v15;
    if (a4)
    {
      id v10 = v15;
      BOOL v11 = 0;
      *a4 = v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (id)referenceMetadataFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v29 = 0;
  id v6 = +[NSData dataWithContentsOfURL:v5 options:3 error:&v29];
  id v7 = v29;
  BOOL v8 = v7;
  if (!v6)
  {
    id v17 = [v7 domain];
    if ([v17 isEqualToString:NSCocoaErrorDomain])
    {
      id v18 = [v8 code];

      if (v18 == (id)260) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    v22 = (void *)MIInstallerErrorDomain;
    v23 = [v5 path];
    uint64_t v25 = sub_100014A08((uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]", 119, v22, 130, v8, 0, @"Failed to read reference metadata from %@", v24, (uint64_t)v23);

    id v9 = 0;
    BOOL v11 = 0;
    BOOL v8 = (void *)v25;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  id v28 = v7;
  id v9 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:&v28];
  id v10 = v28;

  if (!v9)
  {
    v19 = (void *)MIInstallerErrorDomain;
    v20 = [v5 path];
    BOOL v8 = sub_100014A08((uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]", 126, v19, 130, v10, 0, @"Failed to read reference metadata from %@", v21, (uint64_t)v20);

LABEL_11:
    id v9 = 0;
    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  BOOL v11 = [v9 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
  if (!v11)
  {
    v12 = (void *)MIInstallerErrorDomain;
    v13 = [v9 error];
    uint64_t v14 = [v5 path];
    uint64_t v16 = sub_100014A08((uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]", 132, v12, 130, v13, 0, @"Failed to decode reference metadata from %@", v15, (uint64_t)v14);

    id v10 = (id)v16;
  }
  [v9 finishDecoding];
  BOOL v8 = v10;
  if (a4)
  {
LABEL_15:
    if (!v11) {
      *a4 = v8;
    }
  }
LABEL_17:
  id v26 = v11;

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(MIAppReferenceMetadata *)self personas];
  id v7 = [v6 copyWithZone:a3];
  [v5 setPersonas:v7];

  return v5;
}

- (NSArray)personas
{
  return self->_personas;
}

- (void)setPersonas:(id)a3
{
}

- (void).cxx_destruct
{
}

@end