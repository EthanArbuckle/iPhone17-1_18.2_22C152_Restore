@interface IPAManualAutoSettings
- (BOOL)_applyArchiveDictionary:(id)a3;
- (IPAManualAutoSettings)init;
- (IPAManualAutoSettings)initWithIdentifier:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)_archiveIntoDictionary:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation IPAManualAutoSettings

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = v6;
    if (v11) {
      [(NSMutableDictionary *)self->_state setObject:v11 forKeyedSubscript:v6];
    }
  }
  else
  {
    v8 = (IPAManualAutoSettings *)_PFAssertFailHandler();
    [(IPAManualAutoSettings *)v8 valueForUndefinedKey:v10];
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    id v6 = [(NSMutableDictionary *)self->_state objectForKeyedSubscript:v4];

    return v6;
  }
  else
  {
    v8 = (IPAManualAutoSettings *)_PFAssertFailHandler();
    return (id)[(IPAManualAutoSettings *)v8 _applyArchiveDictionary:v10];
  }
}

- (BOOL)_applyArchiveDictionary:(id)a3
{
  return 1;
}

- (void)_archiveIntoDictionary:(id)a3
{
}

- (IPAManualAutoSettings)initWithIdentifier:(id)a3
{
  return 0;
}

- (IPAManualAutoSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)IPAManualAutoSettings;
  v2 = [(IPAAutoSettings *)&v6 initWithIdentifier:@"manual"];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    state = v2->_state;
    v2->_state = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end