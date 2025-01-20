@interface UNCSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isGroupSummary;
- (NSArray)requestIdentifiers;
- (NSAttributedString)content;
- (NSString)bundleIdentifier;
- (NSString)notificationIdentifier;
- (NSString)spotlightIdentifier;
- (NSString)threadIdentifier;
- (UNCSummary)initWithBundleIdentifier:(id)a3 requestIdentifiers:(id)a4 spotlightIdentifier:(id)a5 groupSummary:(BOOL)a6 content:(id)a7 threadIdentifier:(id)a8;
- (UNCSummary)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNCSummary

- (UNCSummary)initWithBundleIdentifier:(id)a3 requestIdentifiers:(id)a4 spotlightIdentifier:(id)a5 groupSummary:(BOOL)a6 content:(id)a7 threadIdentifier:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)UNCSummary;
  v19 = [(UNCSummary *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    bundleIdentifier = v19->_bundleIdentifier;
    v19->_bundleIdentifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    requestIdentifiers = v19->_requestIdentifiers;
    v19->_requestIdentifiers = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    spotlightIdentifier = v19->_spotlightIdentifier;
    v19->_spotlightIdentifier = (NSString *)v24;

    v19->_groupSummary = a6;
    uint64_t v26 = [v17 copy];
    content = v19->_content;
    v19->_content = (NSAttributedString *)v26;

    uint64_t v28 = [v18 copy];
    threadIdentifier = v19->_threadIdentifier;
    v19->_threadIdentifier = (NSString *)v28;
  }
  return v19;
}

- (NSString)notificationIdentifier
{
  return (NSString *)[(NSArray *)self->_requestIdentifiers firstObject];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UNCSummary *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(UNCSummary *)self requestIdentifiers];
  [v4 encodeObject:v6 forKey:@"requestIdentifiers"];

  v7 = [(UNCSummary *)self spotlightIdentifier];
  [v4 encodeObject:v7 forKey:@"spotlightIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSummary isGroupSummary](self, "isGroupSummary"), @"isGroupSummary");
  v8 = [(UNCSummary *)self content];
  [v4 encodeObject:v8 forKey:@"content"];

  id v9 = [(UNCSummary *)self threadIdentifier];
  [v4 encodeObject:v9 forKey:@"threadIdentifier"];
}

- (UNCSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"requestIdentifiers"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spotlightIdentifier"];
  uint64_t v11 = [v4 decodeBoolForKey:@"isGroupSummary"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];

  id v14 = [(UNCSummary *)self initWithBundleIdentifier:v5 requestIdentifiers:v9 spotlightIdentifier:v10 groupSummary:v11 content:v12 threadIdentifier:v13];
  return v14;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)requestIdentifiers
{
  return self->_requestIdentifiers;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (BOOL)isGroupSummary
{
  return self->_groupSummary;
}

- (NSAttributedString)content
{
  return self->_content;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifiers, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end