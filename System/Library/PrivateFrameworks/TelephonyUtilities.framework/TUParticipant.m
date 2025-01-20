@interface TUParticipant
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParticipant:(id)a3;
- (NSString)name;
- (NSURL)imageURL;
- (TUParticipant)initWithCoder:(id)a3;
- (TUParticipant)initWithName:(id)a3;
- (TUParticipant)initWithParticipant:(id)a3;
- (TUSandboxExtendedURL)sandboxExtendedImageURL;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setName:(id)a3;
- (void)setSandboxExtendedImageURL:(id)a3;
@end

@implementation TUParticipant

- (TUParticipant)initWithName:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUParticipant initWithName:]", @"name" format];
  }
  v9.receiver = self;
  v9.super_class = (Class)TUParticipant;
  v5 = [(TUParticipant *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (TUParticipant)initWithParticipant:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUParticipant;
  v5 = [(TUParticipant *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 sandboxExtendedImageURL];
    sandboxExtendedImageURL = v5->_sandboxExtendedImageURL;
    v5->_sandboxExtendedImageURL = (TUSandboxExtendedURL *)v8;
  }
  return v5;
}

- (NSURL)imageURL
{
  v2 = [(TUParticipant *)self sandboxExtendedImageURL];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

- (void)setImageURL:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[TUSandboxExtendedURL alloc] initWithURL:v4];
  }
  else
  {
    v5 = 0;
  }
  [(TUParticipant *)self setSandboxExtendedImageURL:v5];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  objc_super v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_name);
  [v5 encodeObject:name forKey:v6];

  sandboxExtendedImageURL = self->_sandboxExtendedImageURL;
  NSStringFromSelector(sel_sandboxExtendedImageURL);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:sandboxExtendedImageURL forKey:v8];
}

- (TUParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUParticipant;
  id v5 = [(TUParticipant *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_name);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    objc_super v11 = NSStringFromSelector(sel_sandboxExtendedImageURL);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    sandboxExtendedImageURL = v5->_sandboxExtendedImageURL;
    v5->_sandboxExtendedImageURL = (TUSandboxExtendedURL *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUParticipant allocWithZone:a3];

  return [(TUParticipant *)v4 initWithParticipant:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TUMutableParticipant allocWithZone:a3];

  return [(TUParticipant *)v4 initWithParticipant:self];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_name);
  id v5 = [(TUParticipant *)self name];
  [v3 appendFormat:@" %@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_imageURL);
  id v7 = [(TUParticipant *)self imageURL];
  [v3 appendFormat:@" %@=%@", v6, v7];

  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TUParticipant *)self name];
  uint64_t v4 = [v3 hash];
  id v5 = [(TUParticipant *)self sandboxExtendedImageURL];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUParticipant *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUParticipant *)self isEqualToParticipant:v4];
  }

  return v5;
}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v4 = a3;
  name = self->_name;
  unint64_t v6 = [v4 name];
  if (TUObjectsAreEqualOrNil((unint64_t)name, (uint64_t)v6))
  {
    sandboxExtendedImageURL = self->_sandboxExtendedImageURL;
    uint64_t v8 = [v4 sandboxExtendedImageURL];
    char v9 = TUObjectsAreEqualOrNil((unint64_t)sandboxExtendedImageURL, (uint64_t)v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (TUSandboxExtendedURL)sandboxExtendedImageURL
{
  return self->_sandboxExtendedImageURL;
}

- (void)setSandboxExtendedImageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end