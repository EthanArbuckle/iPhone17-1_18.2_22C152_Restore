@interface NACProxyVolumeControlTarget
+ (BOOL)_isValidOriginIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)volumeControlTargetWithCategory:(id)a3;
+ (id)volumeControlTargetWithOriginIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPairedDevice;
- (NACProxyVolumeControlTarget)initWithCoder:(id)a3;
- (NACProxyVolumeControlTarget)initWithOriginIdentifier:(id)a3 category:(id)a4;
- (NSNumber)originIdentifier;
- (NSString)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setOriginIdentifier:(id)a3;
@end

@implementation NACProxyVolumeControlTarget

+ (id)volumeControlTargetWithCategory:(id)a3
{
  id v3 = a3;
  v4 = [[NACProxyVolumeControlTarget alloc] initWithOriginIdentifier:&unk_26EAE3EB0 category:v3];

  return v4;
}

+ (id)volumeControlTargetWithOriginIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[NACProxyVolumeControlTarget alloc] initWithOriginIdentifier:v3 category:0];

  return v4;
}

+ (BOOL)_isValidOriginIdentifier:(id)a3
{
  uint64_t v3 = _isValidOriginIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isValidOriginIdentifier__onceToken, &__block_literal_global);
  }
  char v5 = [(id)_isValidOriginIdentifier__invalidOriginIdentifiers containsObject:v4];

  return v5 ^ 1;
}

uint64_t __56__NACProxyVolumeControlTarget__isValidOriginIdentifier___block_invoke()
{
  _isValidOriginIdentifier__invalidOriginIdentifiers = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26EAE3EB0, &unk_26EAE3EC8, 0);

  return MEMORY[0x270F9A758]();
}

- (NACProxyVolumeControlTarget)initWithOriginIdentifier:(id)a3 category:(id)a4
{
  id v7 = a3;
  v8 = (__CFString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)NACProxyVolumeControlTarget;
  v9 = [(NACProxyVolumeControlTarget *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originIdentifier, a3);
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = @"Audio/Video";
    }
    objc_storeStrong((id *)&v10->_category, v11);
  }

  return v10;
}

- (BOOL)isPairedDevice
{
  return [(NSNumber *)self->_originIdentifier isEqual:&unk_26EAE3EB0];
}

- (id)description
{
  BOOL v3 = [(NACProxyVolumeControlTarget *)self isPairedDevice];
  uint64_t v4 = 8;
  if (v3)
  {
    uint64_t v4 = 16;
    char v5 = @"<NACVolumeControlTarget-System-(%@)>";
  }
  else
  {
    char v5 = @"<NACVolumeControlTarget-Origin-(%@)>";
  }
  v6 = objc_msgSend(NSString, "stringWithFormat:", v5, *(Class *)((char *)&self->super.isa + v4));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char v5 = (NACProxyVolumeControlTarget *)a3;
  v6 = v5;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        v8 = v7;
        originIdentifier = self->_originIdentifier;
        v10 = originIdentifier;
        if (!originIdentifier)
        {
          BOOL v3 = [(NACProxyVolumeControlTarget *)v7 originIdentifier];
          if (!v3)
          {
            char v12 = 1;
LABEL_12:

LABEL_13:
            category = self->_category;
            v15 = category;
            if (!category)
            {
              BOOL v3 = [(NACProxyVolumeControlTarget *)v8 category];
              if (!v3)
              {
                char v17 = 1;
                goto LABEL_19;
              }
              v15 = self->_category;
            }
            v16 = [(NACProxyVolumeControlTarget *)v8 category];
            char v17 = [(NSString *)v15 isEqual:v16];

            if (category)
            {
LABEL_20:
              char v13 = v12 & v17;

              goto LABEL_21;
            }
LABEL_19:

            goto LABEL_20;
          }
          v10 = self->_originIdentifier;
        }
        v11 = [(NACProxyVolumeControlTarget *)v8 originIdentifier];
        char v12 = [(NSNumber *)v10 isEqual:v11];

        if (originIdentifier) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    char v13 = 0;
  }
LABEL_21:

  return v13;
}

- (unint64_t)hash
{
  if ([(NACProxyVolumeControlTarget *)self isPairedDevice]) {
    [(NACProxyVolumeControlTarget *)self category];
  }
  else {
  BOOL v3 = [(NACProxyVolumeControlTarget *)self originIdentifier];
  }
  unint64_t v4 = [v3 hash];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NACProxyVolumeControlTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NACProxyVolumeControlTarget;
  char v5 = [(NACProxyVolumeControlTarget *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_originIdentifier);
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(NACProxyVolumeControlTarget *)v5 setOriginIdentifier:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_category);
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(NACProxyVolumeControlTarget *)v5 setCategory:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [(NACProxyVolumeControlTarget *)self originIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_originIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(NACProxyVolumeControlTarget *)self category];
  id v7 = NSStringFromSelector(sel_category);
  [v4 encodeObject:v8 forKey:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_originIdentifier);
  objc_storeStrong(v4 + 2, self->_category);
  return v4;
}

- (NSNumber)originIdentifier
{
  return self->_originIdentifier;
}

- (void)setOriginIdentifier:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_originIdentifier, 0);
}

@end