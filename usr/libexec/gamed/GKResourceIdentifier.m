@interface GKResourceIdentifier
+ (id)resourceIdentifierForKeys:(id)a3;
+ (id)resourceIdentifiersForBagKeys:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GKResourceIdentifier)initWithKeys:(id)a3;
- (NSArray)keys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setKeys:(id)a3;
@end

@implementation GKResourceIdentifier

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[GKResourceIdentifier allocWithZone:a3];
  keys = self->_keys;

  return [(GKResourceIdentifier *)v4 initWithKeys:keys];
}

- (GKResourceIdentifier)initWithKeys:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    v5 = +[NSString stringWithFormat:@"A GKResourceIdentifier must have at least one key"];
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKResourceManager.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (0 < [keys count])\n[%s (%s:%d)]", v5, "-[GKResourceIdentifier initWithKeys:]", [v7 UTF8String], 35);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }
  v18.receiver = self;
  v18.super_class = (Class)GKResourceIdentifier;
  v9 = [(GKResourceIdentifier *)&v18 init];
  if (v9)
  {
    v10 = (NSArray *)[v4 copy];
    keys = v9->_keys;
    v9->_keys = v10;

    v12 = +[NSMutableString stringWithString:@"com.apple.gamed.resourceQueue"];
    v13 = v9->_keys;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B5DE4;
    v16[3] = &unk_1002D8CC8;
    id v17 = v12;
    id v14 = v12;
    [(NSArray *)v13 enumerateObjectsUsingBlock:v16];
  }
  return v9;
}

+ (id)resourceIdentifiersForBagKeys:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B5E9C;
  v5[3] = &unk_1002D8CE8;
  v5[4] = a1;
  v3 = [a3 _gkMapWithBlock:v5];

  return v3;
}

+ (id)resourceIdentifierForKeys:(id)a3
{
  id v3 = a3;
  id v4 = [[GKResourceIdentifier alloc] initWithKeys:v3];

  return v4;
}

- (unint64_t)hash
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v10 = 0;
  id v10 = [(NSArray *)self->_keys hash];
  keys = self->_keys;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B607C;
  v6[3] = &unk_1002D6A90;
  v6[4] = &v7;
  [(NSArray *)keys enumerateObjectsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  keys = self->_keys;
  unint64_t v4 = [a3 keys];
  LOBYTE(keys) = [(NSArray *)keys isEqual:v4];

  return (char)keys;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)GKResourceIdentifier;
  id v3 = [(GKResourceIdentifier *)&v6 description];
  unint64_t v4 = +[NSString stringWithFormat:@"%@ keys: %@", v3, self->_keys];

  return v4;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end