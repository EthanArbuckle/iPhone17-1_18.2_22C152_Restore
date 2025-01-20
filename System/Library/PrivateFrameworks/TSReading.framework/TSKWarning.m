@interface TSKWarning
+ (id)warningWithMessage:(id)a3;
+ (id)warningWithMessage:(id)a3 kind:(unsigned int)a4 infos:(id)a5;
+ (id)warningWithMessage:(id)a3 kind:(unsigned int)a4 severity:(int)a5 infos:(id)a6;
+ (id)warningWithMessage:(id)a3 severity:(int)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)infos;
- (NSString)message;
- (TSKWarning)initWithMessage:(id)a3 kind:(unsigned int)a4 severity:(int)a5 infos:(id)a6;
- (int)severity;
- (unint64_t)hash;
- (unsigned)kind;
- (void)dealloc;
- (void)setInfos:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation TSKWarning

+ (id)warningWithMessage:(id)a3 severity:(int)a4
{
  return (id)[a1 warningWithMessage:a3 kind:0 severity:*(void *)&a4 infos:0];
}

+ (id)warningWithMessage:(id)a3
{
  return (id)[a1 warningWithMessage:a3 kind:0 infos:0];
}

+ (id)warningWithMessage:(id)a3 kind:(unsigned int)a4 infos:(id)a5
{
  return (id)[a1 warningWithMessage:a3 kind:*(void *)&a4 severity:0 infos:a5];
}

+ (id)warningWithMessage:(id)a3 kind:(unsigned int)a4 severity:(int)a5 infos:(id)a6
{
  v6 = [[TSKWarning alloc] initWithMessage:a3 kind:*(void *)&a4 severity:*(void *)&a5 infos:a6];

  return v6;
}

- (TSKWarning)initWithMessage:(id)a3 kind:(unsigned int)a4 severity:(int)a5 infos:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)TSKWarning;
  v10 = [(TSKWarning *)&v12 init];
  if (v10)
  {
    v10->mMessage = (NSString *)[a3 copy];
    v10->mInfos = (NSArray *)[a6 copy];
    v10->mKind = a4;
    v10->mSeverity = a5;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKWarning;
  [(TSKWarning *)&v3 dealloc];
}

- (unint64_t)hash
{
  return [(NSString *)self->mMessage hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    mMessage = self->mMessage;
    uint64_t v6 = [v4 message];
    LOBYTE(v4) = [(NSString *)mMessage isEqualToString:v6];
  }
  return (char)v4;
}

- (NSString)message
{
  return self->mMessage;
}

- (void)setMessage:(id)a3
{
}

- (NSArray)infos
{
  return self->mInfos;
}

- (void)setInfos:(id)a3
{
}

- (unsigned)kind
{
  return self->mKind;
}

- (int)severity
{
  return self->mSeverity;
}

@end