@interface MRMediaSuggestionRequestOptions
+ (id)defaultOptions;
- (MRMediaSuggestionRequestOptions)initWithBlock:(id)a3;
- (NSArray)bundleIdentifiers;
- (NSArray)contexts;
- (NSString)description;
- (void)setBundleIdentifiers:(id)a3;
- (void)setContexts:(id)a3;
@end

@implementation MRMediaSuggestionRequestOptions

- (MRMediaSuggestionRequestOptions)initWithBlock:(id)a3
{
  v4 = (void (**)(id, MRMediaSuggestionRequestOptions *))a3;
  v7.receiver = self;
  v7.super_class = (Class)MRMediaSuggestionRequestOptions;
  v5 = [(MRMediaSuggestionRequestOptions *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

+ (id)defaultOptions
{
  v2 = objc_alloc_init(MRMediaSuggestionRequestOptions);

  return v2;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRMediaSuggestionRequestOptions *)self bundleIdentifiers];
  v6 = [(MRMediaSuggestionRequestOptions *)self contexts];
  objc_super v7 = (void *)[v3 initWithFormat:@"<%@: bundles=%@, contexts=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);

  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end