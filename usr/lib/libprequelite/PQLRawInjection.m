@interface PQLRawInjection
+ (id)rawInjection:(const char *)a3 length:(unint64_t)a4;
+ (void)initialize;
- (NSString)description;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation PQLRawInjection

+ (void)initialize
{
  v2 = [[PQLRawInjection alloc] initWithUTF8String:"" length:0];
  v3 = (void *)gPQLEmpty;
  gPQLEmpty = (uint64_t)v2;

  v4 = [[PQLRawInjection alloc] initWithUTF8String:"0" length:1];
  v5 = (void *)gPQLFalse;
  gPQLFalse = (uint64_t)v4;

  v6 = [[PQLRawInjection alloc] initWithUTF8String:"1" length:1];
  v7 = (void *)gPQLTrue;
  gPQLTrue = (uint64_t)v6;

  gPQLNULL = [[PQLRawInjection alloc] initWithUTF8String:"NULL" length:4];

  MEMORY[0x1F41817F8]();
}

+ (id)rawInjection:(const char *)a3 length:(unint64_t)a4
{
  if (a4 != 1)
  {
    if (!a4)
    {
      v4 = &gPQLEmpty;
      if (!a3) {
        v4 = &gPQLNULL;
      }
      v5 = (void *)*v4;
      goto LABEL_11;
    }
LABEL_9:
    v7 = [[PQLRawInjection alloc] initWithUTF8String:a3 length:a4];
    goto LABEL_12;
  }
  int v6 = *(unsigned __int8 *)a3;
  if (v6 == 49)
  {
    v5 = (void *)gPQLTrue;
  }
  else
  {
    if (v6 != 48) {
      goto LABEL_9;
    }
    v5 = (void *)gPQLFalse;
  }
LABEL_11:
  v7 = v5;
LABEL_12:

  return v7;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<PQLRaw %s>", -[PQLNameInjectionBase bytes](self, "bytes")];
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 0;
}

@end