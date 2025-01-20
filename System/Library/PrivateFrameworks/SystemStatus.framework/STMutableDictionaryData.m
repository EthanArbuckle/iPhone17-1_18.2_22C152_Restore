@interface STMutableDictionaryData
- (BOOL)applyDiff:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObjectsAndKeys:(id)a3;
@end

@implementation STMutableDictionaryData

- (void)setObjectsAndKeys:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(NSMutableDictionary *)self->super._objectsAndKeys isEqual:v10];
  id v5 = v10;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)[v10 mutableCopy];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    objectsAndKeys = self->super._objectsAndKeys;
    self->super._objectsAndKeys = v8;

    id v5 = v10;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[STDictionaryData allocWithZone:a3];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  v6 = [(STDictionaryData *)self objectsAndKeys];
  v7 = [(STDictionaryData *)v5 initWithObjectsAndKeys:v6];

  return v7;
}

- (BOOL)applyDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [v4 applyToMutableDictionaryData:self];
  }

  return isKindOfClass & 1;
}

@end