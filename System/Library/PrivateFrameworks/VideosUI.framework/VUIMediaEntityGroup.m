@interface VUIMediaEntityGroup
- (BOOL)isEqual:(id)a3;
- (NSArray)mediaEntities;
- (NSArray)sortIndexes;
- (NSCopying)identifier;
- (VUIMediaEntityGroup)init;
- (VUIMediaEntityGroup)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setMediaEntities:(id)a3;
- (void)setSortIndexes:(id)a3;
@end

@implementation VUIMediaEntityGroup

- (VUIMediaEntityGroup)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaEntityGroup)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"identifier" format];
  }
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaEntityGroup;
  v5 = [(VUIMediaEntityGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSCopying *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[VUIMediaEntityGroup alloc] initWithIdentifier:self->_identifier];
  uint64_t v5 = [(NSArray *)self->_mediaEntities copy];
  mediaEntities = v4->_mediaEntities;
  v4->_mediaEntities = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_sortIndexes copy];
  sortIndexes = v4->_sortIndexes;
  v4->_sortIndexes = (NSArray *)v7;

  return v4;
}

- (unint64_t)hash
{
  v3 = [(VUIMediaEntityGroup *)self identifier];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(VUIMediaEntityGroup *)self mediaEntities];
  uint64_t v6 = [v5 hash] ^ v4;

  uint64_t v7 = [(VUIMediaEntityGroup *)self sortIndexes];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIMediaEntityGroup *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        uint64_t v7 = [(VUIMediaEntityGroup *)self identifier];
        unint64_t v8 = [(VUIMediaEntityGroup *)v6 identifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          v11 = v10;
          char v12 = 0;
          if (!v9 || !v10) {
            goto LABEL_23;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0) {
            goto LABEL_16;
          }
        }
        v14 = [(VUIMediaEntityGroup *)self mediaEntities];
        v15 = [(VUIMediaEntityGroup *)v6 mediaEntities];
        id v9 = v14;
        id v16 = v15;
        if (v9 == v16)
        {

LABEL_18:
          v18 = [(VUIMediaEntityGroup *)self sortIndexes];
          v19 = [(VUIMediaEntityGroup *)v6 sortIndexes];
          id v9 = v18;
          id v20 = v19;
          v11 = v20;
          if (v9 == v20)
          {
            char v12 = 1;
          }
          else
          {
            char v12 = 0;
            if (v9 && v20) {
              char v12 = [v9 isEqual:v20];
            }
          }
          goto LABEL_23;
        }
        v11 = v16;
        char v12 = 0;
        if (v9 && v16)
        {
          char v17 = [v9 isEqual:v16];

          if ((v17 & 1) == 0)
          {
LABEL_16:
            char v12 = 0;
LABEL_24:

            goto LABEL_25;
          }
          goto LABEL_18;
        }
LABEL_23:

        goto LABEL_24;
      }
    }
    char v12 = 0;
  }
LABEL_25:

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18.receiver = self;
  v18.super_class = (Class)VUIMediaEntityGroup;
  uint64_t v4 = [(VUIMediaEntityGroup *)&v18 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  uint64_t v6 = [(VUIMediaEntityGroup *)self identifier];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"identifier", v6];
  [v3 addObject:v7];

  unint64_t v8 = NSString;
  id v9 = [(VUIMediaEntityGroup *)self mediaEntities];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"mediaEntities", v9];
  [v3 addObject:v10];

  v11 = NSString;
  char v12 = [(VUIMediaEntityGroup *)self sortIndexes];
  char v13 = [v11 stringWithFormat:@"%@=%@", @"sortIndexes", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [v3 componentsJoinedByString:@", "];
  id v16 = [v14 stringWithFormat:@"<%@>", v15];

  return v16;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (void)setMediaEntities:(id)a3
{
}

- (NSArray)sortIndexes
{
  return self->_sortIndexes;
}

- (void)setSortIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortIndexes, 0);
  objc_storeStrong((id *)&self->_mediaEntities, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end