@interface REMTemplatePublicLink
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeUpdated;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)lastModifiedDate;
- (NSURL)url;
- (REMTemplatePublicLink)initWithCoder:(id)a3;
- (REMTemplatePublicLink)initWithURL:(id)a3 configuration:(id)a4 creationDate:(id)a5 lastModifiedDate:(id)a6 expirationDate:(id)a7 canBeUpdated:(BOOL)a8;
- (REMTemplatePublicLinkConfiguration)configuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMTemplatePublicLink

- (REMTemplatePublicLink)initWithURL:(id)a3 configuration:(id)a4 creationDate:(id)a5 lastModifiedDate:(id)a6 expirationDate:(id)a7 canBeUpdated:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)REMTemplatePublicLink;
  v18 = [(REMTemplatePublicLink *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_url, a3);
    objc_storeStrong((id *)&v19->_configuration, a4);
    objc_storeStrong((id *)&v19->_creationDate, a5);
    objc_storeStrong((id *)&v19->_lastModifiedDate, a6);
    objc_storeStrong((id *)&v19->_expirationDate, a7);
    v19->_canBeUpdated = a8;
  }

  return v19;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMTemplatePublicLink *)self url];
  v6 = [(REMTemplatePublicLink *)self configuration];
  v7 = [(REMTemplatePublicLink *)self creationDate];
  v8 = [(REMTemplatePublicLink *)self lastModifiedDate];
  v9 = [(REMTemplatePublicLink *)self expirationDate];
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[REMTemplatePublicLink canBeUpdated](self, "canBeUpdated"));
  v11 = [v3 stringWithFormat:@"<%@: %p url: %@, configuration: %@, creationDate: %@, lastModifiedDate: %@, expirationDate: %@, canBeUpdated: %@>", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  v5 = [(REMTemplatePublicLink *)self url];
  uint64_t v6 = [v4 url];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    v8 = [(REMTemplatePublicLink *)self url];
    v9 = [v4 url];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_20;
    }
  }
  v11 = [(REMTemplatePublicLink *)self configuration];
  uint64_t v12 = [v4 configuration];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    id v14 = [(REMTemplatePublicLink *)self configuration];
    id v15 = [v4 configuration];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  id v17 = [(REMTemplatePublicLink *)self creationDate];
  uint64_t v18 = [v4 creationDate];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    v20 = [(REMTemplatePublicLink *)self creationDate];
    v21 = [v4 creationDate];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_20;
    }
  }
  objc_super v23 = [(REMTemplatePublicLink *)self lastModifiedDate];
  uint64_t v24 = [v4 lastModifiedDate];
  if (v23 == (void *)v24)
  {
  }
  else
  {
    v25 = (void *)v24;
    v26 = [(REMTemplatePublicLink *)self lastModifiedDate];
    v27 = [v4 lastModifiedDate];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_20;
    }
  }
  v29 = [(REMTemplatePublicLink *)self expirationDate];
  uint64_t v30 = [v4 expirationDate];
  if (v29 == (void *)v30)
  {

    goto LABEL_23;
  }
  v31 = (void *)v30;
  v32 = [(REMTemplatePublicLink *)self expirationDate];
  v33 = [v4 expirationDate];
  int v34 = [v32 isEqual:v33];

  if (v34)
  {
LABEL_23:
    BOOL v37 = [(REMTemplatePublicLink *)self canBeUpdated];
    int v35 = v37 ^ [v4 canBeUpdated] ^ 1;
    goto LABEL_21;
  }
LABEL_20:
  LOBYTE(v35) = 0;
LABEL_21:

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMTemplatePublicLink alloc];
  v5 = [(REMTemplatePublicLink *)self url];
  uint64_t v6 = [(REMTemplatePublicLink *)self configuration];
  v7 = [(REMTemplatePublicLink *)self creationDate];
  v8 = [(REMTemplatePublicLink *)self lastModifiedDate];
  v9 = [(REMTemplatePublicLink *)self expirationDate];
  int v10 = [(REMTemplatePublicLink *)v4 initWithURL:v5 configuration:v6 creationDate:v7 lastModifiedDate:v8 expirationDate:v9 canBeUpdated:[(REMTemplatePublicLink *)self canBeUpdated]];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplatePublicLink)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedDate"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  uint64_t v10 = [v4 decodeBoolForKey:@"canBeUpdated"];

  v11 = [(REMTemplatePublicLink *)self initWithURL:v5 configuration:v6 creationDate:v7 lastModifiedDate:v8 expirationDate:v9 canBeUpdated:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(REMTemplatePublicLink *)self url];
  [v9 encodeObject:v4 forKey:@"url"];

  v5 = [(REMTemplatePublicLink *)self configuration];
  [v9 encodeObject:v5 forKey:@"configuration"];

  uint64_t v6 = [(REMTemplatePublicLink *)self creationDate];
  [v9 encodeObject:v6 forKey:@"creationDate"];

  v7 = [(REMTemplatePublicLink *)self lastModifiedDate];
  [v9 encodeObject:v7 forKey:@"lastModifiedDate"];

  v8 = [(REMTemplatePublicLink *)self expirationDate];
  [v9 encodeObject:v8 forKey:@"expirationDate"];

  objc_msgSend(v9, "encodeBool:forKey:", -[REMTemplatePublicLink canBeUpdated](self, "canBeUpdated"), @"canBeUpdated");
}

- (NSURL)url
{
  return self->_url;
}

- (REMTemplatePublicLinkConfiguration)configuration
{
  return self->_configuration;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)canBeUpdated
{
  return self->_canBeUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end