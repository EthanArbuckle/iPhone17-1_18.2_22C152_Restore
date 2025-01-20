@interface FCEmptyContentArchive
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FCEmptyContentArchive)initWithCoder:(id)a3;
- (id)description;
- (id)manifest;
- (id)unarchiveIntoContentContext:(id)a3;
- (unint64_t)hash;
@end

@implementation FCEmptyContentArchive

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

- (id)description
{
  return @"<Empty>";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCEmptyContentArchive)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FCEmptyContentArchive;
  return [(FCEmptyContentArchive *)&v4 init];
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v3 = [FCContentUnarchiveResult alloc];
  objc_super v4 = [(FCContentUnarchiveResult *)v3 initWithInterestToken:MEMORY[0x1E4F1CBF0] storageSize:0];
  return v4;
}

- (id)manifest
{
  return +[FCContentManifest empty];
}

@end