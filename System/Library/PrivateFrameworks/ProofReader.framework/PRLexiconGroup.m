@interface PRLexiconGroup
- (BOOL)cachedOnly;
- (NSArray)lexicons;
- (NSString)localization;
- (PRLexiconGroup)initWithLocalization:(id)a3 lexicons:(id)a4 cachedOnly:(BOOL)a5;
- (id)description;
- (void)dealloc;
@end

@implementation PRLexiconGroup

- (PRLexiconGroup)initWithLocalization:(id)a3 lexicons:(id)a4 cachedOnly:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PRLexiconGroup;
  v8 = [(PRLexiconGroup *)&v10 init];
  if (v8)
  {
    v8->_localization = (NSString *)[a3 copy];
    v8->_lexicons = (NSArray *)[a4 copy];
    v8->_cachedOnly = a5;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PRLexiconGroup;
  id v4 = [(PRLexiconGroup *)&v8 description];
  v5 = [(PRLexiconGroup *)self localization];
  if ([(PRLexiconGroup *)self cachedOnly]) {
    v6 = @"-cachedOnly";
  }
  else {
    v6 = &stru_26C1C71A8;
  }
  return (id)[v3 stringWithFormat:@"%@(%@%@)%@", v4, v5, v6, -[PRLexiconGroup lexicons](self, "lexicons")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRLexiconGroup;
  [(PRLexiconGroup *)&v3 dealloc];
}

- (NSString)localization
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)lexicons
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

@end