@interface PQLNameInjection
+ (id)_appendString:(id)a3 toInjection:(id)a4;
+ (id)nameWithPrefix:(id)a3 suffix:(id)a4;
+ (id)nameWithString:(id)a3;
- (NSString)description;
- (PQLNameInjection)initWithString:(id)a3;
- (id)nameByAddingSuffix:(id)a3;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation PQLNameInjection

+ (id)_appendString:(id)a3 toInjection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = (const char *)[v7 UTF8String];
  id v9 = objc_alloc(MEMORY[0x1E4F1CA58]);
  id v10 = v6;
  v11 = [v9 initWithBytes:[v10 bytes] length:[v10 length]];
  if ([v11 length])
  {
    uint64_t v12 = [v11 mutableBytes];
    *(unsigned char *)([v11 length] + v12 - 1) = 47;
  }
  else
  {
    [v11 appendBytes:"\"" length:1];
  }
  size_t v13 = strcspn(v8, "\"");
  [v11 appendBytes:v8 length:v13];
  while (v8[v13])
  {
    [v11 appendBytes:"\"\"" length:2];
    v8 += v13 + 1;
    size_t v13 = strcspn(v8, "\"");
    [v11 appendBytes:v8 length:v13];
  }
  [v11 appendBytes:"\"" length:1];

  return v11;
}

+ (id)nameWithString:(id)a3
{
  id v3 = a3;
  v4 = [[PQLNameInjection alloc] initWithString:v3];

  return v4;
}

+ (id)nameWithPrefix:(id)a3 suffix:(id)a4
{
  id v5 = [a3 stringByAppendingPathComponent:a4];
  id v6 = [a1 nameWithString:v5];

  return v6;
}

- (id)nameByAddingSuffix:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _appendString:v4 toInjection:self];

  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v5];

  return v6;
}

- (PQLNameInjection)initWithString:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _appendString:v4 toInjection:0];

  id v6 = [(PQLNameInjectionBase *)self initWithData:v5];
  return v6;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<PQLName %s>", -[PQLNameInjectionBase bytes](self, "bytes")];
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 0;
}

@end