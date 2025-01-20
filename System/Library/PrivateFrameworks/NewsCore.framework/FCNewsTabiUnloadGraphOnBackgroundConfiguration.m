@interface FCNewsTabiUnloadGraphOnBackgroundConfiguration
- (BOOL)enabled;
- (FCNewsTabiUnloadGraphOnBackgroundConfiguration)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (id)description;
- (int64_t)graphIdleDuration;
- (void)setDictionary:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGraphIdleDuration:(int64_t)a3;
@end

@implementation FCNewsTabiUnloadGraphOnBackgroundConfiguration

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"\n\tenabled: %d;",
    [(FCNewsTabiUnloadGraphOnBackgroundConfiguration *)self enabled]);
  objc_msgSend(v3, "appendFormat:", @"\n\tgraphIdleDuration: %lu", -[FCNewsTabiUnloadGraphOnBackgroundConfiguration graphIdleDuration](self, "graphIdleDuration"));
  [v3 appendString:@"\n>"];
  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (FCNewsTabiUnloadGraphOnBackgroundConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCNewsTabiUnloadGraphOnBackgroundConfiguration;
  v5 = [(FCNewsTabiUnloadGraphOnBackgroundConfiguration *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__FCNewsTabiUnloadGraphOnBackgroundConfiguration_initWithDictionary___block_invoke;
    v11[3] = &unk_1E5B4C090;
    id v8 = v4;
    id v12 = v8;
    v5->_enabled = __69__FCNewsTabiUnloadGraphOnBackgroundConfiguration_initWithDictionary___block_invoke((uint64_t)v11);
    v9 = FCAppConfigurationNumberValue(v8, @"graphIdleDuration", &unk_1EF8D7CF8);
    v5->_graphIdleDuration = [v9 integerValue];
  }
  return v5;
}

uint64_t __69__FCNewsTabiUnloadGraphOnBackgroundConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  if (NFInternalBuild())
  {
    v2 = NewsCoreUserDefaults();
    uint64_t v3 = [v2 integerForKey:@"news.features.tabiBackgroundUnloading"];

    if (v3 == 1) {
      return 1;
    }
    if (v3 == 2) {
      return 0;
    }
  }
  v5 = *(void **)(a1 + 32);
  return FCAppConfigurationBoolValue(v5, @"enabled", 1);
}

- (int64_t)graphIdleDuration
{
  return self->_graphIdleDuration;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setGraphIdleDuration:(int64_t)a3
{
  self->_graphIdleDuration = a3;
}

@end