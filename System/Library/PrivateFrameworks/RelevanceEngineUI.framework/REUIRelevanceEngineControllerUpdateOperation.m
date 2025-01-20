@interface REUIRelevanceEngineControllerUpdateOperation
+ (id)hideElement:(id)a3 atPath:(id)a4;
+ (id)showElement:(id)a3 atPath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)updateType;
@end

@implementation REUIRelevanceEngineControllerUpdateOperation

+ (id)showElement:(id)a3 atPath:(id)a4
{
  id result = (id)[a1 reloadElement:a3 atPath:a4];
  *((void *)result + 5) = 1;
  return result;
}

+ (id)hideElement:(id)a3 atPath:(id)a4
{
  id result = (id)[a1 reloadElement:a3 atPath:a4];
  *((void *)result + 5) = 2;
  return result;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:self->_updateType];
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)REUIRelevanceEngineControllerUpdateOperation;
  unint64_t v5 = [(REElementUpdateOperation *)&v7 hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)REUIRelevanceEngineControllerUpdateOperation,
        [(REElementUpdateOperation *)&v7 isEqual:v4])
    && v4[5] == self->_updateType;

  return v5;
}

- (id)description
{
  unint64_t updateType = self->_updateType;
  if (updateType == 1)
  {
    objc_super v7 = NSString;
    BOOL v5 = [(REElementUpdateOperation *)self path];
    v6 = REStringForSectionPath();
    [v7 stringWithFormat:@" Show: %@", v6];
    goto LABEL_5;
  }
  if (updateType == 2)
  {
    uint64_t v4 = NSString;
    BOOL v5 = [(REElementUpdateOperation *)self path];
    v6 = REStringForSectionPath();
    [v4 stringWithFormat:@" Hide: %@", v6];
LABEL_5:
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v8 = &stru_26CF96A58;
LABEL_7:
  v12.receiver = self;
  v12.super_class = (Class)REUIRelevanceEngineControllerUpdateOperation;
  v9 = [(REElementUpdateOperation *)&v12 description];
  v10 = [v9 stringByAppendingString:v8];

  return v10;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

@end