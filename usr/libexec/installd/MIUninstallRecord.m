@interface MIUninstallRecord
+ (BOOL)supportsSecureCoding;
+ (id)uninstallRecordArrayToICLUninstallRecordArray:(id)a3;
- (BOOL)doesNotHaveBundleContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLastReference;
- (BOOL)isLinked;
- (MIUninstallRecord)initWithCoder:(id)a3;
- (id)ICLUninstallRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legacyDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDoesNotHaveBundleContainer:(BOOL)a3;
- (void)setIsLastReference:(BOOL)a3;
- (void)setIsLinked:(BOOL)a3;
@end

@implementation MIUninstallRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIUninstallRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MIUninstallRecord;
  v5 = [(MIUninstallRecord *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_isLastReference = [v4 decodeBoolForKey:@"isLastReference"];
    v5->_isLinked = [v4 decodeBoolForKey:@"isLinked"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MIUninstallRecord;
  id v4 = a3;
  [(MIUninstallRecord *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:-[MIUninstallRecord isLastReference](self, "isLastReference", v5.receiver, v5.super_class) forKey:@"isLastReference"];
  [v4 encodeBool:-[MIUninstallRecord isLinked](self, "isLinked") forKey:@"isLinked"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MIUninstallRecord;
  id v4 = [(MIUninstallRecord *)&v6 copyWithZone:a3];
  [v4 setIsLastReference:-[MIUninstallRecord isLastReference](self, "isLastReference")];
  [v4 setIsLinked:-[MIUninstallRecord isLinked](self, "isLinked")];
  return v4;
}

- (id)legacyDictionary
{
  v3 = objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)MIUninstallRecord;
  id v4 = [(MIUninstallRecord *)&v9 legacyDictionary];
  [v3 addEntriesFromDictionary:v4];

  if ([(MIUninstallRecord *)self isLinked]) {
    objc_super v5 = &__kCFBooleanTrue;
  }
  else {
    objc_super v5 = &__kCFBooleanFalse;
  }
  [v3 setObject:v5 forKeyedSubscript:@"IsLinkedBundle"];
  if ([(MIUninstallRecord *)self isLastReference]) {
    objc_super v6 = &__kCFBooleanTrue;
  }
  else {
    objc_super v6 = &__kCFBooleanFalse;
  }
  [v3 setObject:v6 forKeyedSubscript:@"LastReference"];
  id v7 = [v3 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MIUninstallRecord;
  if ([(MIUninstallRecord *)&v10 isEqual:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unsigned int v6 = [(MIUninstallRecord *)self isLinked];
      if (v6 == [v5 isLinked])
      {
        unsigned int v8 = [(MIUninstallRecord *)self isLastReference];
        if (v8 == [v5 isLastReference])
        {
          BOOL v7 = 1;
          goto LABEL_14;
        }
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
        {
LABEL_12:
          BOOL v7 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
      {
        goto LABEL_12;
      }
      MOLogWrite();
      goto LABEL_12;
    }
  }
  BOOL v7 = 0;
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(MIUninstallRecord *)self isLinked];
  unsigned int v4 = [(MIUninstallRecord *)self isLastReference];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)MIUninstallRecord;
  return [(MIUninstallRecord *)&v7 hash] ^ (v5 | v3);
}

- (id)ICLUninstallRecord
{
  uint64_t v3 = objc_opt_new();
  unsigned int v4 = [(MIUninstallRecord *)self bundleIdentifier];
  [v3 setBundleIdentifier:v4];

  [v3 setIsPlaceholder:-[MIUninstallRecord isPlaceholder](self, "isPlaceholder")];
  [v3 setHasParallelPlaceholder:-[MIUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder")];

  return v3;
}

+ (id)uninstallRecordArrayToICLUninstallRecordArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v3 count]];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_super v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "ICLUninstallRecord", (void)v13);
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    id v11 = [v4 copy];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isLastReference
{
  return self->_isLastReference;
}

- (void)setIsLastReference:(BOOL)a3
{
  self->_isLastReference = a3;
}

- (BOOL)isLinked
{
  return self->_isLinked;
}

- (void)setIsLinked:(BOOL)a3
{
  self->_isLinked = a3;
}

- (BOOL)doesNotHaveBundleContainer
{
  return self->_doesNotHaveBundleContainer;
}

- (void)setDoesNotHaveBundleContainer:(BOOL)a3
{
  self->_doesNotHaveBundleContainer = a3;
}

@end