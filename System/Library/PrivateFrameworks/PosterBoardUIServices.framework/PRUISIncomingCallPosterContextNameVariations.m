@interface PRUISIncomingCallPosterContextNameVariations
- (BOOL)isEqual:(id)a3;
- (NSDictionary)namesDictionary;
- (PRUISIncomingCallPosterContextNameVariations)initWithNamesDictionary:(id)a3;
- (id)nameForStyle:(int64_t)a3;
- (unint64_t)hash;
@end

@implementation PRUISIncomingCallPosterContextNameVariations

- (PRUISIncomingCallPosterContextNameVariations)initWithNamesDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISIncomingCallPosterContextNameVariations;
  v5 = [(PRUISIncomingCallPosterContextNameVariations *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    namesDictionary = v5->_namesDictionary;
    v5->_namesDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (id)nameForStyle:(int64_t)a3
{
  namesDictionary = self->_namesDictionary;
  id v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSDictionary *)namesDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 namesDictionary];
    uint64_t v6 = [(PRUISIncomingCallPosterContextNameVariations *)self namesDictionary];
    char v7 = BSEqualDictionaries();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_namesDictionary];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (NSDictionary)namesDictionary
{
  return self->_namesDictionary;
}

- (void).cxx_destruct
{
}

@end