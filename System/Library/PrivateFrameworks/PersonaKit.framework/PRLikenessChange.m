@interface PRLikenessChange
+ (id)changeForLikeness:(id)a3 withType:(unint64_t)a4;
+ (id)descriptionForChangeType:(unint64_t)a3;
+ (unint64_t)changeTypeFromDescription:(id)a3;
- (NSArray)dirtyLikenessProperties;
- (NSNumber)changedLikenessVersion;
- (NSString)changedLikenessID;
- (NSString)identifier;
- (id)description;
- (unint64_t)type;
- (void)setChangedLikenessID:(id)a3;
- (void)setChangedLikenessVersion:(id)a3;
- (void)setDirtyLikenessProperties:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PRLikenessChange

+ (id)changeForLikeness:(id)a3 withType:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(PRLikenessChange);
  v7 = [MEMORY[0x263F08C38] UUID];
  uint64_t v8 = [v7 UUIDString];
  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v8;

  v6->_type = a4;
  uint64_t v10 = [v5 uniqueIdentifier];
  changedLikenessID = v6->_changedLikenessID;
  v6->_changedLikenessID = (NSString *)v10;

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "version"));
  changedLikenessVersion = v6->_changedLikenessVersion;
  v6->_changedLikenessVersion = (NSNumber *)v12;

  v14 = [v5 dirtyProperties];

  uint64_t v15 = [v14 allObjects];
  dirtyLikenessProperties = v6->_dirtyLikenessProperties;
  v6->_dirtyLikenessProperties = (NSArray *)v15;

  return v6;
}

+ (id)descriptionForChangeType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"(undefined)";
  }
  else {
    return off_2641DAF48[a3];
  }
}

+ (unint64_t)changeTypeFromDescription:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"delete"]) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = [v3 isEqual:@"create"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  unint64_t v4 = +[PRLikenessChange descriptionForChangeType:self->_type];
  id v5 = [v3 stringWithFormat:@"PRLikenessChange {type: %@, changed-version: %@, changed-id: %@, dirty-props: %@}", v4, self->_changedLikenessVersion, self->_changedLikenessID, self->_dirtyLikenessProperties];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)changedLikenessID
{
  return self->_changedLikenessID;
}

- (void)setChangedLikenessID:(id)a3
{
}

- (NSNumber)changedLikenessVersion
{
  return self->_changedLikenessVersion;
}

- (void)setChangedLikenessVersion:(id)a3
{
}

- (NSArray)dirtyLikenessProperties
{
  return self->_dirtyLikenessProperties;
}

- (void)setDirtyLikenessProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyLikenessProperties, 0);
  objc_storeStrong((id *)&self->_changedLikenessVersion, 0);
  objc_storeStrong((id *)&self->_changedLikenessID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end