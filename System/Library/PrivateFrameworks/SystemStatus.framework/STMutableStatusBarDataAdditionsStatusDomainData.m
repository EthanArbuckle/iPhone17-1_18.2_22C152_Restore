@interface STMutableStatusBarDataAdditionsStatusDomainData
- (BOOL)applyDiff:(id)a3;
- (STMutableDictionaryData)entryDictionaryData;
- (STMutableStatusBarDataAdditionsStatusDomainData)initWithEntryDictionaryData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_updateEntry:(void *)a3 forKey:;
- (void)setActivityEntry:(id)a3;
- (void)setBluetoothEntry:(id)a3;
- (void)setFocusModeEntry:(id)a3;
- (void)setLockEntry:(id)a3;
- (void)setPersonNameEntry:(id)a3;
- (void)setRingerSilenceEntry:(id)a3;
- (void)setTetheringEntry:(id)a3;
- (void)setThermalEntry:(id)a3;
@end

@implementation STMutableStatusBarDataAdditionsStatusDomainData

- (STMutableStatusBarDataAdditionsStatusDomainData)initWithEntryDictionaryData:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  v5 = (STMutableStatusBarDataAdditionsStatusDomainData *)-[STStatusBarDataAdditionsStatusDomainData _initWithEntryDictionaryData:]((id *)&self->super.super.isa, v4);

  return v5;
}

- (STMutableDictionaryData)entryDictionaryData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableStatusBarDataAdditionsStatusDomainData;
  v2 = [(STStatusBarDataAdditionsStatusDomainData *)&v4 entryDictionaryData];

  return (STMutableDictionaryData *)v2;
}

- (void)setPersonNameEntry:(id)a3
{
}

- (void)_updateEntry:(void *)a3 forKey:
{
  id v7 = a2;
  id v5 = a3;
  if (a1)
  {
    if (v7)
    {
      -[STStatusBarDataAdditionsStatusDomainData _expectedClassForKey:](a1, v5);
      objc_opt_isKindOfClass();
      v6 = [a1 entryDictionaryData];
      [v6 setObject:v7 forKey:v5];
    }
    else
    {
      v6 = [a1 entryDictionaryData];
      [v6 removeObjectForKey:v5];
    }
  }
}

- (void)setBluetoothEntry:(id)a3
{
}

- (void)setThermalEntry:(id)a3
{
}

- (void)setActivityEntry:(id)a3
{
}

- (void)setTetheringEntry:(id)a3
{
}

- (void)setLockEntry:(id)a3
{
}

- (void)setFocusModeEntry:(id)a3
{
}

- (void)setRingerSilenceEntry:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[STStatusBarDataAdditionsStatusDomainData allocWithZone:a3];

  return -[STStatusBarDataAdditionsStatusDomainData initWithData:](v4, self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [v4 applyToMutableData:self];
  }

  return isKindOfClass & 1;
}

@end