@interface GPBFileDescriptor
- (GPBFileDescriptor)initWithPackage:(id)a3 objcPrefix:(id)a4 syntax:(unsigned __int8)a5;
- (GPBFileDescriptor)initWithPackage:(id)a3 syntax:(unsigned __int8)a4;
- (NSString)objcPrefix;
- (NSString)package;
- (unsigned)syntax;
- (void)dealloc;
@end

@implementation GPBFileDescriptor

- (GPBFileDescriptor)initWithPackage:(id)a3 objcPrefix:(id)a4 syntax:(unsigned __int8)a5
{
  v10.receiver = self;
  v10.super_class = (Class)GPBFileDescriptor;
  v8 = [(GPBFileDescriptor *)&v10 init];
  if (v8)
  {
    v8->package_ = (NSString *)[a3 copy];
    v8->objcPrefix_ = (NSString *)[a4 copy];
    v8->syntax_ = a5;
  }
  return v8;
}

- (GPBFileDescriptor)initWithPackage:(id)a3 syntax:(unsigned __int8)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GPBFileDescriptor;
  v6 = [(GPBFileDescriptor *)&v8 init];
  if (v6)
  {
    v6->package_ = (NSString *)[a3 copy];
    v6->syntax_ = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GPBFileDescriptor;
  [(GPBFileDescriptor *)&v3 dealloc];
}

- (NSString)package
{
  return self->package_;
}

- (NSString)objcPrefix
{
  return self->objcPrefix_;
}

- (unsigned)syntax
{
  return self->syntax_;
}

@end