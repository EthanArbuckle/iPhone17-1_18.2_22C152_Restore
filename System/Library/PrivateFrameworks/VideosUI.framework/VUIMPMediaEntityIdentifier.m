@interface VUIMPMediaEntityIdentifier
+ (id)mediaItemIdentifierWithMediaItem:(id)a3;
+ (id)showIdentifierWithMediaItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)persistentID;
- (NSString)description;
- (VUIMPMediaEntityIdentifier)init;
- (VUIMPMediaEntityIdentifier)initWithPersistentID:(id)a3 mediaEntityType:(id)a4;
- (VUIMediaEntityType)mediaEntityType;
- (unint64_t)hash;
- (void)setMediaEntityType:(id)a3;
- (void)setPersistentID:(id)a3;
@end

@implementation VUIMPMediaEntityIdentifier

+ (id)showIdentifierWithMediaItem:(id)a3
{
  v3 = [a3 valueForProperty:*MEMORY[0x1E4F31300]];
  if (v3)
  {
    v4 = [VUIMPMediaEntityIdentifier alloc];
    v5 = +[VUIMediaEntityType show];
    v6 = [(VUIMPMediaEntityIdentifier *)v4 initWithPersistentID:v3 mediaEntityType:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)mediaItemIdentifierWithMediaItem:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F31430];
  id v4 = a3;
  v5 = [v4 valueForProperty:v3];
  v6 = objc_msgSend(v4, "vui_mediaEntityType");

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    v8 = 0;
  }
  else {
    v8 = [[VUIMPMediaEntityIdentifier alloc] initWithPersistentID:v5 mediaEntityType:v6];
  }

  return v8;
}

- (VUIMPMediaEntityIdentifier)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMPMediaEntityIdentifier)initWithPersistentID:(id)a3 mediaEntityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"persistentID" format];
  }
  v14.receiver = self;
  v14.super_class = (Class)VUIMPMediaEntityIdentifier;
  v8 = [(VUIMPMediaEntityIdentifier *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    persistentID = v8->_persistentID;
    v8->_persistentID = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    mediaEntityType = v8->_mediaEntityType;
    v8->_mediaEntityType = (VUIMediaEntityType *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(VUIMPMediaEntityIdentifier *)self persistentID];
  uint64_t v4 = [v3 hash];

  v5 = [(VUIMPMediaEntityIdentifier *)self mediaEntityType];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIMPMediaEntityIdentifier *)a3;
  v5 = v4;
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
        unint64_t v6 = v5;
        id v7 = [(VUIMPMediaEntityIdentifier *)self persistentID];
        v8 = [(VUIMPMediaEntityIdentifier *)v6 persistentID];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          uint64_t v11 = v10;
          char v12 = 0;
          if (!v9 || !v10)
          {
LABEL_17:

            goto LABEL_18;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0)
          {
            char v12 = 0;
LABEL_18:

            goto LABEL_19;
          }
        }
        objc_super v14 = [(VUIMPMediaEntityIdentifier *)self mediaEntityType];
        v15 = [(VUIMPMediaEntityIdentifier *)v6 mediaEntityType];
        id v9 = v14;
        id v16 = v15;
        uint64_t v11 = v16;
        if (v9 == v16)
        {
          char v12 = 1;
        }
        else
        {
          char v12 = 0;
          if (v9 && v16) {
            char v12 = [v9 isEqual:v16];
          }
        }
        goto LABEL_17;
      }
    }
    char v12 = 0;
  }
LABEL_19:

  return v12;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMPMediaEntityIdentifier;
  uint64_t v4 = [(VUIMPMediaEntityIdentifier *)&v15 description];
  [v3 addObject:v4];

  v5 = NSString;
  unint64_t v6 = [(VUIMPMediaEntityIdentifier *)self persistentID];
  id v7 = [v5 stringWithFormat:@"%@=%@", @"persistentID", v6];
  [v3 addObject:v7];

  v8 = NSString;
  id v9 = [(VUIMPMediaEntityIdentifier *)self mediaEntityType];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"mediaEntityType", v9];
  [v3 addObject:v10];

  uint64_t v11 = NSString;
  char v12 = [v3 componentsJoinedByString:@", "];
  char v13 = [v11 stringWithFormat:@"<%@>", v12];

  return (NSString *)v13;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
}

- (VUIMediaEntityType)mediaEntityType
{
  return self->_mediaEntityType;
}

- (void)setMediaEntityType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntityType, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end