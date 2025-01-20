@interface OADTextRun
- (BOOL)isEmpty;
- (BOOL)isSimilarToTextRun:(id)a3;
- (OADTextRun)init;
- (id)description;
- (id)properties;
- (unint64_t)characterCount;
- (void)removeUnnecessaryOverrides;
- (void)setProperties:(id)a3;
@end

@implementation OADTextRun

- (OADTextRun)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADTextRun;
  v2 = [(OADTextRun *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(OADCharacterProperties);
    mProperties = v2->mProperties;
    v2->mProperties = v3;
  }
  return v2;
}

- (id)properties
{
  return self->mProperties;
}

- (void)removeUnnecessaryOverrides
{
}

- (BOOL)isEmpty
{
  return 1;
}

- (unint64_t)characterCount
{
  return 0;
}

- (void)setProperties:(id)a3
{
}

- (BOOL)isSimilarToTextRun:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTextRun;
  v2 = [(OADTextRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end