@interface _PSContactSuggestionHandleAndApp
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)interactionMechanism;
- (NSString)appBundleId;
- (NSString)handle;
- (_PSContactSuggestionHandleAndApp)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setHandle:(id)a3;
- (void)setInteractionMechanism:(id)a3;
@end

@implementation _PSContactSuggestionHandleAndApp

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_handle hash];
  NSUInteger v4 = [(NSString *)self->_appBundleId hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_interactionMechanism hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (_PSContactSuggestionHandleAndApp *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        uint64_t v7 = [(_PSContactSuggestionHandleAndApp *)self appBundleId];
        if (v7)
        {
          v8 = (void *)v7;
          uint64_t v9 = [(_PSContactSuggestionHandleAndApp *)self handle];
          if (!v9)
          {
            char v20 = 0;
LABEL_23:

            goto LABEL_24;
          }
          v10 = (void *)v9;
          uint64_t v11 = [(_PSContactSuggestionHandleAndApp *)self interactionMechanism];
          if (!v11) {
            goto LABEL_17;
          }
          v12 = (void *)v11;
          uint64_t v13 = [(_PSContactSuggestionHandleAndApp *)v6 appBundleId];
          if (!v13)
          {
            char v20 = 0;
LABEL_21:

            goto LABEL_22;
          }
          v14 = (void *)v13;
          uint64_t v15 = [(_PSContactSuggestionHandleAndApp *)v6 handle];
          if (!v15) {
            goto LABEL_19;
          }
          v16 = (void *)v15;
          v17 = [(_PSContactSuggestionHandleAndApp *)v6 interactionMechanism];

          if (v17)
          {
            v8 = [(_PSContactSuggestionHandleAndApp *)self appBundleId];
            v10 = [(_PSContactSuggestionHandleAndApp *)v6 appBundleId];
            if ([v8 isEqualToString:v10])
            {
              v12 = [(_PSContactSuggestionHandleAndApp *)self handle];
              v14 = [(_PSContactSuggestionHandleAndApp *)v6 handle];
              if ([v12 isEqualToString:v14])
              {
                v18 = [(_PSContactSuggestionHandleAndApp *)self interactionMechanism];
                v19 = [(_PSContactSuggestionHandleAndApp *)v6 interactionMechanism];
                char v20 = [v18 isEqualToNumber:v19];

LABEL_20:
                goto LABEL_21;
              }
LABEL_19:
              char v20 = 0;
              goto LABEL_20;
            }
LABEL_17:
            char v20 = 0;
LABEL_22:

            goto LABEL_23;
          }
        }
        char v20 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    char v20 = 0;
  }
LABEL_25:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [+[_PSContactSuggestionHandleAndApp allocWithZone:a3] init];
  v5 = [(_PSContactSuggestionHandleAndApp *)self handle];
  [(_PSContactSuggestionHandleAndApp *)v4 setHandle:v5];

  v6 = [(_PSContactSuggestionHandleAndApp *)self appBundleId];
  [(_PSContactSuggestionHandleAndApp *)v4 setAppBundleId:v6];

  uint64_t v7 = [(_PSContactSuggestionHandleAndApp *)self interactionMechanism];
  [(_PSContactSuggestionHandleAndApp *)v4 setInteractionMechanism:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSContactSuggestionHandleAndApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PSContactSuggestionHandleAndApp;
  v5 = [(_PSContactSuggestionHandleAndApp *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionMechanism"];
    interactionMechanism = v5->_interactionMechanism;
    v5->_interactionMechanism = (NSNumber *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"handle"];
  [v5 encodeObject:self->_appBundleId forKey:@"appBundleId"];
  [v5 encodeObject:self->_interactionMechanism forKey:@"interactionMechanism"];
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSNumber)interactionMechanism
{
  return self->_interactionMechanism;
}

- (void)setInteractionMechanism:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionMechanism, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end