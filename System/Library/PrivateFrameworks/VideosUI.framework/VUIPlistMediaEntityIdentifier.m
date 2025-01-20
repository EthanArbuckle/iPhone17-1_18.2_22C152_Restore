@interface VUIPlistMediaEntityIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (VUIMediaEntityType)mediaEntityType;
- (VUIPlistMediaEntityIdentifier)init;
- (VUIPlistMediaEntityIdentifier)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setMediaEntityType:(id)a3;
@end

@implementation VUIPlistMediaEntityIdentifier

- (VUIPlistMediaEntityIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIPlistMediaEntityIdentifier)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIPlistMediaEntityIdentifier;
  v7 = [(VUIPlistMediaEntityIdentifier *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    switch(a4)
    {
      case 0uLL:
        uint64_t v10 = +[VUIMediaEntityType movie];
        goto LABEL_9;
      case 1uLL:
        uint64_t v10 = +[VUIMediaEntityType movieRental];
        goto LABEL_9;
      case 2uLL:
        uint64_t v10 = +[VUIMediaEntityType episode];
        goto LABEL_9;
      case 3uLL:
        uint64_t v10 = +[VUIMediaEntityType homeVideo];
        goto LABEL_9;
      case 4uLL:
        uint64_t v10 = +[VUIMediaEntityType show];
        goto LABEL_9;
      case 5uLL:
        uint64_t v10 = +[VUIMediaEntityType season];
LABEL_9:
        mediaEntityType = v7->_mediaEntityType;
        v7->_mediaEntityType = (VUIMediaEntityType *)v10;

        break;
      default:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unexpected type passed to -initWithIdentifier:type:"];
        break;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(VUIPlistMediaEntityIdentifier *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIPlistMediaEntityIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    v7 = [(VUIPlistMediaEntityIdentifier *)self identifier];
    uint64_t v8 = [(VUIPlistMediaEntityIdentifier *)v6 identifier];
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

  return v12;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIPlistMediaEntityIdentifier;
  uint64_t v4 = [(VUIPlistMediaEntityIdentifier *)&v12 description];
  [v3 addObject:v4];

  v5 = NSString;
  id v6 = [(VUIPlistMediaEntityIdentifier *)self identifier];
  v7 = [v5 stringWithFormat:@"%@=%@", @"identifier", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  id v9 = [v3 componentsJoinedByString:@", "];
  id v10 = [v8 stringWithFormat:@"<%@>", v9];

  return (NSString *)v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end