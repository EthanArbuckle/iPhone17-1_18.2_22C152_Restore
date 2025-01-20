@interface IPAAutoSettings
+ (id)pendingWithIdentifier:(id)a3;
- (BOOL)_applyArchiveDictionary:(id)a3;
- (BOOL)applyArchiveDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAutoSettings:(id)a3;
- (BOOL)pending;
- (IPAAutoSettings)init;
- (IPAAutoSettings)initWithIdentifier:(id)a3;
- (NSString)debugDescription;
- (NSString)identifier;
- (id)archiveDictionary;
- (unint64_t)hash;
- (void)_archiveIntoDictionary:(id)a3;
@end

@implementation IPAAutoSettings

+ (id)pendingWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [(IPAAutoSettings *)[IPAPendingAutoSettings alloc] initWithIdentifier:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)debugDescription
{
  id v3 = [(IPAAutoSettings *)self archiveDictionary];
  v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:0];
  v5 = (void *)[[NSString alloc] initWithData:v4 encoding:1];

  v6 = [NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, v5];

  return (NSString *)v6;
}

- (id)archiveDictionary
{
  id v3 = objc_opt_new();
  if ([(IPAAutoSettings *)self pending])
  {
    v4 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v3 setObject:v4 forKeyedSubscript:@"pending"];
  }
  [(IPAAutoSettings *)self _archiveIntoDictionary:v3];
  return v3;
}

- (BOOL)applyArchiveDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    BOOL v6 = [(IPAAutoSettings *)self _applyArchiveDictionary:v4];

    return v6;
  }
  else
  {
    v8 = (IPAAutoSettings *)_PFAssertFailHandler();
    return [(IPAAutoSettings *)v8 isEqualToAutoSettings:v10];
  }
}

- (BOOL)isEqualToAutoSettings:(id)a3
{
  id v4 = a3;
  v5 = [(IPAAutoSettings *)self archiveDictionary];
  BOOL v6 = [v4 archiveDictionary];

  LOBYTE(v4) = [v5 isEqualToDictionary:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(IPAAutoSettings *)self isEqualToAutoSettings:v4];

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)pending
{
  return 0;
}

- (IPAAutoSettings)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)IPAAutoSettings;
    BOOL v6 = [(IPAAutoSettings *)&v12 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v7;
    }
    return v6;
  }
  else
  {
    id v10 = (IPAAutoSettings *)_PFAssertFailHandler();
    return [(IPAAutoSettings *)v10 init];
  }
}

- (IPAAutoSettings)init
{
  return 0;
}

- (void)_archiveIntoDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  BOOL v5 = (IPAAutoSettings *)_PFAssertFailHandler();
  [(IPAAutoSettings *)v5 _applyArchiveDictionary:v7];
}

- (BOOL)_applyArchiveDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  BOOL v5 = (IPAAdjustmentVersion *)_PFAssertFailHandler();
  [(IPAAdjustmentVersion *)v5 .cxx_destruct];
  return result;
}

@end