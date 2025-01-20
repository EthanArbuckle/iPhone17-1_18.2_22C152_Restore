@interface WFTTSSpokenVariant
+ (id)parseAnnotationString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)displayString;
- (NSString)spokenString;
- (WFTTSSpokenVariant)initWithDisplayString:(id)a3 spokenString:(id)a4;
@end

@implementation WFTTSSpokenVariant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

- (NSString)spokenString
{
  return self->_spokenString;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)WFTTSSpokenVariant;
  v3 = [(WFTTSSpokenVariant *)&v8 description];
  v4 = [(WFTTSSpokenVariant *)self displayString];
  v5 = [(WFTTSSpokenVariant *)self spokenString];
  v6 = [v3 stringByAppendingFormat:@": show \"%@\", say \"%@\"", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(WFTTSSpokenVariant *)self displayString];
    v6 = [v4 displayString];
    if ([v5 isEqualToString:v6])
    {
      v7 = [(WFTTSSpokenVariant *)self spokenString];
      objc_super v8 = [v4 spokenString];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (WFTTSSpokenVariant)initWithDisplayString:(id)a3 spokenString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFTTSString.m", 173, @"Invalid parameter not satisfying: %@", @"displayString" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFTTSString.m", 174, @"Invalid parameter not satisfying: %@", @"spokenString" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFTTSSpokenVariant;
  v10 = [(WFTTSSpokenVariant *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    displayString = v10->_displayString;
    v10->_displayString = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    spokenString = v10->_spokenString;
    v10->_spokenString = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

+ (id)parseAnnotationString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28FE8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithString:v5];

  id v7 = 0;
  id v8 = 0;
  char v9 = 0;
  if ([v6 scanString:@"show:\"" intoString:0])
  {
    id v14 = 0;
    int v10 = [v6 scanUpToString:@"\" say:\"" intoString:&v14];
    id v7 = v14;
    if (v10 && [v6 scanString:@"\" say:\"" intoString:0])
    {
      id v13 = 0;
      int v11 = [v6 scanUpToString:@"\"" intoString:&v13];
      id v8 = v13;
      if (v11
        && [v6 scanString:@"\"" intoString:0]
        && [v6 isAtEnd])
      {
        char v9 = (void *)[objc_alloc((Class)a1) initWithDisplayString:v7 spokenString:v8];
        goto LABEL_10;
      }
    }
    else
    {
      id v8 = 0;
    }
    char v9 = 0;
  }
LABEL_10:

  return v9;
}

@end