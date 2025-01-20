@interface OBBundle
+ (OBBundle)bundleWithIdentifier:(id)a3;
+ (id)bundleAtPath:(id)a3;
+ (id)bundleAtPath:(id)a3 isLinkBundle:(BOOL)a4 isReplacementBundle:(BOOL)a5;
+ (id)bundleAtPath:(id)a3 placeholderIdentifier:(id)a4;
+ (id)identifierWithName:(id)a3;
+ (id)nameFromIdentifier:(id)a3;
- (BOOL)isLinkBundle;
- (BOOL)isPlaceholder;
- (BOOL)isReplacementBundle;
- (NSArray)replaceeIdentifierSetsCache;
- (NSBundle)bundle;
- (NSBundle)underlyingBundle;
- (NSString)bundleVersion;
- (NSString)identifier;
- (NSString)name;
- (NSString)replacementPreconditionCache;
- (OBBundle)initWithBundle:(id)a3;
- (OBBundle)initWithBundle:(id)a3 isLinkBundle:(BOOL)a4 isReplacementBundle:(BOOL)a5;
- (OBBundle)initWithBundle:(id)a3 placeholderIdentifier:(id)a4;
- (id)privacyFlow;
- (void)setIsLinkBundle:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setIsReplacementBundle:(BOOL)a3;
- (void)setReplaceeIdentifierSetsCache:(id)a3;
- (void)setReplacementPreconditionCache:(id)a3;
@end

@implementation OBBundle

+ (OBBundle)bundleWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[OBBundleManager sharedManager];
  v5 = [v4 bundleWithIdentifier:v3];

  return (OBBundle *)v5;
}

+ (id)bundleAtPath:(id)a3 isLinkBundle:(BOOL)a4 isReplacementBundle:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v7 = [MEMORY[0x1E4F28B50] bundleWithPath:a3];
  if (v7) {
    v8 = [[OBBundle alloc] initWithBundle:v7 isLinkBundle:v6 isReplacementBundle:v5];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (OBBundle)initWithBundle:(id)a3 isLinkBundle:(BOOL)a4 isReplacementBundle:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)OBBundle;
  v10 = [(OBBundle *)&v24 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundle, a3);
    uint64_t v12 = [v9 bundleIdentifier];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    bundleVersion = v11->_bundleVersion;
    v11->_bundleVersion = (NSString *)v14;

    v11->_isPlaceholder = 0;
    v11->_isLinkBundle = a4;
    uint64_t v16 = +[OBBundle nameFromIdentifier:v11->_identifier];
    name = v11->_name;
    v11->_name = (NSString *)v16;

    v11->_isReplacementBundle = v5;
    if (v5)
    {
      v18 = [(OBBundle *)v11 privacyFlow];
      uint64_t v19 = [v18 replacementPrecondition];
      replacementPreconditionCache = v11->_replacementPreconditionCache;
      v11->_replacementPreconditionCache = (NSString *)v19;

      uint64_t v21 = [v18 replaceeIdentifierSets];
      replaceeIdentifierSetsCache = v11->_replaceeIdentifierSetsCache;
      v11->_replaceeIdentifierSetsCache = (NSArray *)v21;
    }
  }

  return v11;
}

- (NSBundle)underlyingBundle
{
  return self->_bundle;
}

- (NSString)replacementPreconditionCache
{
  return self->_replacementPreconditionCache;
}

- (id)privacyFlow
{
  return +[OBPrivacyFlow flowWithBundle:self];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceeIdentifierSetsCache, 0);
  objc_storeStrong((id *)&self->_replacementPreconditionCache, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

+ (id)bundleAtPath:(id)a3
{
  id v3 = [MEMORY[0x1E4F28B50] bundleWithPath:a3];
  if (v3) {
    v4 = [[OBBundle alloc] initWithBundle:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (id)bundleAtPath:(id)a3 placeholderIdentifier:(id)a4
{
  id v5 = a4;
  BOOL v6 = [MEMORY[0x1E4F28B50] bundleWithPath:a3];
  if (v6) {
    v7 = [[OBBundle alloc] initWithBundle:v6 placeholderIdentifier:v5];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (OBBundle)initWithBundle:(id)a3
{
  return [(OBBundle *)self initWithBundle:a3 isLinkBundle:0 isReplacementBundle:0];
}

- (OBBundle)initWithBundle:(id)a3 placeholderIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(OBBundle *)self initWithBundle:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_isPlaceholder = 1;
  }

  return v7;
}

+ (id)identifierWithName:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"com.apple.onboarding.", a3];
}

+ (id)nameFromIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"com.apple.onboarding."];
  v4 = [v3 lastObject];

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isLinkBundle
{
  return self->_isLinkBundle;
}

- (void)setIsLinkBundle:(BOOL)a3
{
  self->_isLinkBundle = a3;
}

- (BOOL)isReplacementBundle
{
  return self->_isReplacementBundle;
}

- (void)setIsReplacementBundle:(BOOL)a3
{
  self->_isReplacementBundle = a3;
}

- (void)setReplacementPreconditionCache:(id)a3
{
}

- (NSArray)replaceeIdentifierSetsCache
{
  return self->_replaceeIdentifierSetsCache;
}

- (void)setReplaceeIdentifierSetsCache:(id)a3
{
}

@end