@interface IdsDeviceMutationWithExt
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (IdsDeviceMutationWithExt)init;
- (NSMutableArray)extensions;
- (id)data;
- (void)setExtensions:(id)a3;
@end

@implementation IdsDeviceMutationWithExt

- (IdsDeviceMutationWithExt)init
{
  v5.receiver = self;
  v5.super_class = (Class)IdsDeviceMutationWithExt;
  v2 = [(IdsDeviceMutation *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(IdsDeviceMutationWithExt *)v2 setExtensions:v3];
  }
  return v2;
}

- (id)data
{
  v2 = self;
  v8.receiver = self;
  v8.super_class = (Class)IdsDeviceMutationWithExt;
  v3 = [(IdsDeviceMutation *)&v8 data];
  id v4 = [v3 mutableCopy];

  objc_super v5 = [(IdsDeviceMutationWithExt *)v2 extensions];
  LODWORD(v2) = [(TLSMessageClass *)v2 encodeExtensions:v5 buffer:v4];

  if (v2) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___IdsDeviceMutationWithExt;
  v7 = [super parseFromData:v6 error:a4];
  if (v7)
  {
    id v8 = v6;
    id v9 = [v8 bytes];
    v10 = (char *)[v7 parsedLength] + (void)v9;
    id v11 = v8;
    id v17 = 0;
    v12 = [v7 parseExtensions:v10 end:((char *)[v11 length] + [v11 bytes]) result:&v17];
    id v13 = v17;
    if (v12)
    {
      v14 = +[NSMutableArray arrayWithArray:v13];
      [v7 setExtensions:v14];

      [v7 setParsedLength:v12 - (unsigned char *)[objc_retainAutorelease(v11) bytes]];
      id v15 = v7;
    }
    else if (a4)
    {
      +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-248 description:@"failed to parse extensions from Mutation"];
      id v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IdsDeviceMutationWithExt *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      id v6 = [(IdsDeviceMutationWithExt *)self data];
      v7 = [(IdsDeviceMutationWithExt *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end