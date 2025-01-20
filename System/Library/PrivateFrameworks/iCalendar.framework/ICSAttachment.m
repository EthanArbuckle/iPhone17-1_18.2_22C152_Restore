@interface ICSAttachment
- (BOOL)hasSize;
- (BOOL)isBinary;
- (BOOL)shouldObscureValue;
- (BOOL)x_apple_autoarchived;
- (ICSAttachment)initWithData:(id)a3;
- (ICSAttachment)initWithURL:(id)a3;
- (NSString)fmtype;
- (NSString)managed_filename;
- (NSString)managed_id;
- (NSString)x_apple_ews_attachmentid;
- (NSString)x_apple_filename;
- (id)filename;
- (int)size;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)setData:(id)a3;
- (void)setFmtype:(id)a3;
- (void)setManaged_filename:(id)a3;
- (void)setManaged_id:(id)a3;
- (void)setSize:(int)a3;
- (void)setURL:(id)a3;
- (void)setX_apple_autoarchived:(BOOL)a3;
- (void)setX_apple_ews_attachmentid:(id)a3;
- (void)setX_apple_filename:(id)a3;
@end

@implementation ICSAttachment

- (ICSAttachment)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = [(ICSAttachment *)self init];
  v6 = v5;
  if (v5) {
    [(ICSAttachment *)v5 setURL:v4];
  }

  return v6;
}

- (ICSAttachment)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [(ICSAttachment *)self init];
  v6 = v5;
  if (v5) {
    [(ICSAttachment *)v5 setData:v4];
  }

  return v6;
}

- (BOOL)isBinary
{
  return [(ICSProperty *)self type] == 5026;
}

- (id)filename
{
  v3 = [(ICSAttachment *)self managed_filename];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ICSAttachment *)self x_apple_filename];
    if (!v5)
    {
      v6 = [(ICSProperty *)self value];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [(ICSProperty *)self value];
        v8 = v7;
        if (v7)
        {
          v9 = [v7 path];
          id v5 = [v9 lastPathComponent];
        }
        else
        {
          id v5 = 0;
        }
      }
      else
      {
        id v5 = 0;
      }
    }
  }

  return v5;
}

- (BOOL)hasSize
{
  v2 = [(ICSProperty *)self parameterValueForName:@"SIZE"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)size
{
  v2 = [(ICSProperty *)self parameterValueForName:@"SIZE"];
  BOOL v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (void)setSize:(int)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)&a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ICSProperty *)self setParameterValue:v4 forName:@"SIZE"];
}

- (NSString)managed_id
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"MANAGED-ID"];
}

- (void)setManaged_id:(id)a3
{
}

- (NSString)fmtype
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"FMTTYPE"];
}

- (void)setFmtype:(id)a3
{
}

- (BOOL)x_apple_autoarchived
{
  v2 = [(ICSProperty *)self parameterValueForName:@"X-APPLE-AUTOARCHIVED"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setX_apple_autoarchived:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(ICSProperty *)self setParameterValue:v4 forName:@"X-APPLE-AUTOARCHIVED"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"X-APPLE-AUTOARCHIVED"];
  }
}

- (NSString)managed_filename
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"FILENAME"];
}

- (void)setManaged_filename:(id)a3
{
}

- (NSString)x_apple_filename
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-APPLE-FILENAME"];
}

- (void)setX_apple_filename:(id)a3
{
}

- (NSString)x_apple_ews_attachmentid
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-APPLE-EWS-ATTACHMENTID"];
}

- (void)setX_apple_ews_attachmentid:(id)a3
{
}

- (BOOL)shouldObscureValue
{
  return 1;
}

- (void)setData:(id)a3
{
  [(ICSProperty *)self setValue:a3 type:5026];
  if (a3)
  {
    [(ICSProperty *)self setParameterValue:@"BINARY" forName:@"VALUE"];
    [(ICSProperty *)self setParameterValue:@"BASE64" forName:@"ENCODING"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"VALUE"];
    [(ICSProperty *)self removeParameterValueForName:@"ENCODING"];
  }
}

- (void)setURL:(id)a3
{
  [(ICSProperty *)self setValue:a3 type:5013];
  [(ICSProperty *)self setParameterValue:@"URI" forName:@"VALUE"];
  [(ICSProperty *)self removeParameterValueForName:@"ENCODING"];
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6 = a4;
  v7 = [(ICSProperty *)self value];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
LABEL_14:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 setObject:@"BINARY" forKey:@"VALUE"];
        [v8 setObject:@"BASE64" forKey:@"ENCODING"];
      }
      BOOL v17 = (a3 & 0x10) != 0 && [(ICSAttachment *)self shouldObscureValue];
      [(ICSProperty *)self _ICSStringWithOptions:a3 appendingToString:v6 additionalParameters:v8];
      [v6 appendString:@":"];
      if (v17) {
        unint64_t v18 = a3 | 0x20;
      }
      else {
        unint64_t v18 = a3;
      }
      [v9 _ICSStringWithOptions:v18 appendingToString:v6];

      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v21 = 0;
      if ((a3 & 2) != 0 && [v7 isFileURL])
      {
        v10 = [v7 path];
        if ((unint64_t)[v10 length] <= 1)
        {
        }
        else
        {
          v11 = [MEMORY[0x1E4F28CB8] defaultManager];
          v12 = [v7 path];
          int v13 = [v11 fileExistsAtPath:v12 isDirectory:&v21];

          if (v13)
          {
            v14 = [v7 path];
            v15 = [v14 lastPathComponent];
            [v8 setObject:v15 forKey:@"X-APPLE-FILENAME"];

            if (v21)
            {
              v16 = [NSNumber numberWithBool:1];
              [v8 setObject:v16 forKey:@"X-APPLE-AUTOARCHIVED"];
            }
            else
            {
              v19 = (void *)MEMORY[0x1E4F1C9B8];
              v20 = [v7 path];
              id v9 = [v19 dataWithContentsOfFile:v20];

              if (v9) {
                goto LABEL_14;
              }
            }
            goto LABEL_24;
          }
        }
      }
      id v9 = [v7 absoluteString];
      if (v9) {
        goto LABEL_14;
      }
    }
LABEL_24:
    NSLog(&cfstr_IgnoringAttach_0.isa, self);
    [v6 appendString:@":"];
LABEL_25:

    goto LABEL_26;
  }
  NSLog(&cfstr_IgnoringAttach.isa, self);
  [v6 appendString:@":"];
LABEL_26:
}

@end