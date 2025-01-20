@interface VUIMPSeasonMediaCollectionIdentifier
+ (id)requiredMPPropertyNames;
+ (id)seasonIdentifierWithMediaItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)seasonNumber;
- (VUIMPSeasonMediaCollectionIdentifier)initWithPersistentID:(id)a3 mediaEntityType:(id)a4;
- (VUIMPSeasonMediaCollectionIdentifier)initWithPersistentID:(id)a3 seasonNumber:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)setSeasonNumber:(id)a3;
@end

@implementation VUIMPSeasonMediaCollectionIdentifier

+ (id)requiredMPPropertyNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F31300], *MEMORY[0x1E4F314A0], 0);
}

+ (id)seasonIdentifierWithMediaItem:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F31300];
  id v4 = a3;
  v5 = [v4 valueForProperty:v3];
  v6 = [v4 valueForProperty:*MEMORY[0x1E4F314A0]];

  if (v5) {
    v7 = [[VUIMPSeasonMediaCollectionIdentifier alloc] initWithPersistentID:v5 seasonNumber:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (VUIMPSeasonMediaCollectionIdentifier)initWithPersistentID:(id)a3 mediaEntityType:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The %@ initializer is not available.", v7 format];

  return 0;
}

- (VUIMPSeasonMediaCollectionIdentifier)initWithPersistentID:(id)a3 seasonNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"persistentID" format];
  }
  v8 = +[VUIMediaEntityType season];
  v13.receiver = self;
  v13.super_class = (Class)VUIMPSeasonMediaCollectionIdentifier;
  v9 = [(VUIMPMediaEntityIdentifier *)&v13 initWithPersistentID:v6 mediaEntityType:v8];

  if (v9)
  {
    uint64_t v10 = [v7 copy];
    seasonNumber = v9->_seasonNumber;
    v9->_seasonNumber = (NSNumber *)v10;
  }
  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VUIMPSeasonMediaCollectionIdentifier;
  unint64_t v3 = [(VUIMPMediaEntityIdentifier *)&v7 hash];
  id v4 = [(VUIMPSeasonMediaCollectionIdentifier *)self seasonNumber];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIMPSeasonMediaCollectionIdentifier *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)VUIMPSeasonMediaCollectionIdentifier;
    if ([(VUIMPMediaEntityIdentifier *)&v14 isEqual:v6])
    {
      objc_super v7 = [(VUIMPSeasonMediaCollectionIdentifier *)self seasonNumber];
      v8 = [(VUIMPSeasonMediaCollectionIdentifier *)v6 seasonNumber];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqual:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIMPSeasonMediaCollectionIdentifier;
  id v4 = [(VUIMPMediaEntityIdentifier *)&v12 description];
  [v3 addObject:v4];

  unint64_t v5 = NSString;
  id v6 = [(VUIMPSeasonMediaCollectionIdentifier *)self seasonNumber];
  objc_super v7 = [v5 stringWithFormat:@"%@=%@", @"seasonNumber", v6];
  [v3 addObject:v7];

  v8 = NSString;
  id v9 = [v3 componentsJoinedByString:@", "];
  id v10 = [v8 stringWithFormat:@"<%@>", v9];

  return v10;
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end